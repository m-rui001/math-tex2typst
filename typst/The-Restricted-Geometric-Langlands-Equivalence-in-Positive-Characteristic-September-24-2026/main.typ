#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 76.5pt, y: 76.5pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[The Restricted Geometric Langlands Equivalence in Positive Characteristic]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

Restricted geometric Langlands theory compares automorphic sheaves with sheaves on a stack of local systems whose variation is restricted in the sense of Arinkin–Gaitsgory–Kazhdan–Raskin–Rozenblyum–Varshavsky #cite(label("AGKRRV")). In positive characteristic, Gaitsgory–Raskin construct an equivalence onto an open-and-closed union of spectral components #cite(label("GR")) Main Theorem 1.3.9(i). The remaining support question asks whether any component can be absent. We prove that none is absent in the two precise settings below.

The geometric comparison grew from the construction of individual Hecke eigensheaves. Over a finite field, unramified automorphic functions can be viewed as functions on isomorphism classes of bundles; Frobenius traces turn sheaves on the bundle stack into such functions. For general linear groups, the constructions of Drinfeld and Laumon led to the question of attaching a Hecke eigensheaf to each irreducible local system. Frenkel–Gaitsgory–Vilonen reduced this existence problem to a vanishing conjecture, which they established over finite fields using Lafforgue’s work #cite(label("FrenkelGaitsgoryVilonen")) §0.1 and §§1–2. Gaitsgory subsequently proved the vanishing conjecture geometrically #cite(label("GaitsgoryVanishing")) §0.1 and §2. The categorical formulation of Beilinson–Drinfeld seeks a comparison of the whole automorphic category with a category varying over the stack of local systems #cite(label("AGKRRV")) §0.1.

The choice of spectral category is essential. In characteristic zero, Arinkin–Gaitsgory explained why quasi-coherent sheaves on the local-system stack do not suffice for a general reductive group, and formulated the comparison using ind-coherent sheaves with nilpotent singular support #cite(label("ArinkinGaitsgory")) §§1.1.1–1.1.6. The extra singular direction is a nilpotent horizontal section of the adjoint local system, reflecting the additional datum in an Arthur parameter. Their formulation also satisfies the compatibility tests supplied by geometric Satake and Eisenstein series. On the automorphic side, Beilinson’s theory supplies singular support for constructible sheaves in arbitrary characteristic #cite(label("BeilinsonSingularSupport")) §1.3. These two support theories concern different categories and play different roles in the correspondence.

To formulate a categorical comparison for $ell$-adic sheaves, Arinkin–Gaitsgory–Kazhdan–Raskin–Rozenblyum–Varshavsky introduced the restricted local-system stack #cite(label("AGKRRV")) §§0.1–0.2 and §0.5.4. Its families are defined through the tensor category of local systems in the chosen sheaf theory, rather than through a de Rham moduli problem. The connected components are indexed by semisimple local systems, while each component retains extensions and derived deformation data #cite(label("AGKRRV")) Proposition 3.7.2 and Corollary 3.7.4. They constructed the coherent spectral action on automorphic sheaves with nilpotent singular support and proved, under their characteristic hypotheses, that Hecke eigensheaves have nilpotent singular support, as predicted by Laumon #cite(label("AGKRRV")) §0.2.3 and Theorems 14.3.2 and 14.4.3. This supplies both the categories and the Hecke-compatible action used in the present paper.

The characteristic-zero geometric Langlands theorem was established in the five-part project of Arinkin, Beraldo, Campbell, Chen, Faergeman, Gaitsgory, Lin, Raskin, and Rozenblyum. Gaitsgory–Raskin’s construction of the functor and their multiplicity-one theorem are the first and final parts of that project #cite(label("GLCI")) #cite(label("GLCV")). Their subsequent work #cite(label("GR")) uses geometric specialization to relate the characteristic-zero and positive-characteristic $ell$-adic theories. It proves the primed equivalence used here and the full result for general linear groups. Our input from characteristic zero is precisely #cite(label("GR")) Main Theorem 1.3.9(ii).

An equivalence onto a union of components does not yet give an automorphic category at a parameter outside that union. The issue is therefore existence on the omitted components, even after the categorical comparison has been constructed. Our proof addresses this issue by showing that the geometric specialization functor cannot annihilate the nonzero spectral summand attached to such a component. The local tests that establish this fact are described after the main statements.

=== 1.1 The spectral stack and the two hypothesis regimes <the-spectral-stack-and-the-two-hypothesis-regimes>

Let $k$ be an algebraically closed field of characteristic $p > 0$, let $ell eq.not p$ be a prime, and set $E = overline(bb(Q))_ell$. Let $X \/ k$ be a smooth projective connected curve and $G \/ k$ a connected reductive group. Write $caron(G) \/ E$ for the Langlands dual group and $frak(g) = "Lie" \( G \)$. Such a group $G$ is split over $k$.

We use the $E$-linear sheaf categories of #cite(label("AGKRRV")) #cite(label("GR")). In particular, $"Shv" \( X \)$ is the ind-constructible category, and $"QLisse"_E \( X \)$ denotes the full dg subcategory of $"Shv" \( X \)$ whose ordinary cohomology sheaves are filtered colimits of finite-rank lisse $E$-sheaves #cite(label("AGKRRV")) §1.2.5 and Definition 1.2.6. Its distinction from the ind-completion $"IndLisse"_E \( X \)$ of constructible lisse complexes will matter in Section 2. The restricted spectral prestack $Y = L S_(caron(G))^(upright("restr")) \( X \)$ is defined on derived affine $E$-schemes $T$ by

#[#set math.equation(numbering: n => "(1.1)")
 $ Y \( T \) = "Fun"^(⊗ \, upright(r . t . e x)) #scale(x: 120%, y: 120%)[\(] "Rep"_E \( caron(G) \) \, "QCoh" \( T \) ⊗_E "QLisse"_E \( X \) #scale(x: 120%, y: 120%)[\)] . $ <intro:restricted-stack>]

Here the superscript denotes right-t-exact symmetric monoidal functors, with the conventions of #cite(label("AGKRRV")). A parameter is an $E$-point of $Y$, hence such a tensor functor with $T = "Spec" E$.

Write $"Bun"_G \( X \)$ for the stack of principal $G$-bundles on $X$. Its global nilpotent cone consists of cotangent Higgs fields with nilpotent values. It defines the full dg subcategory $"Shv"_("Nilp") \( "Bun"_G \( X \) \)$. On $Y$ we use the spectral nilpotent singular-support condition and the category $"IndCoh"_("Nilp") \( Y \)$ of #cite(label("AGKRRV")) §§21.2.1–21.2.5. These are the established categories; the new assertion concerns the spectral components on which the equivalence is supported.

We state the characteristic assumptions individually. A Levi subgroup always means a Levi factor of a parabolic subgroup. Semisimple Lie elements are geometrically conjugate into the Lie algebra of a maximal torus; nilpotent elements have zero in their geometric adjoint-orbit closure.

#prodef([Hypothesis 1.1.])[
  (Common characteristic assumptions).  The following conditions hold for $G \/ k$.
  + There is a nondegenerate $G$-invariant symmetric bilinear form $kappa$ on $frak(g)$ whose restriction to the center of $"Lie" \( M \)$ is nondegenerate for every Levi subgroup $M$.
  + For every Levi subgroup $M$, including $G$, and a maximal torus $T_M subset M$, Chevalley restriction is an isomorphism
    $ k \[ "Lie" \( M \) \]^M arrow.r^(med tilde.op med) k \[ "Lie" \( T_M \) \]^(W_M) \, #h(2em) W_M = N_M \( T_M \) \/ T_M . $
  + The scheme-theoretic centralizer in $G$ of every semisimple element of $frak(g)$ is a Levi subgroup.
  + For every field extension $k' \/ k$, every nilpotent element of $frak(g) ⊗_k k'$ belongs to $"Lie" \( R_u \( P \) \)$ for some parabolic subgroup $P subset G_(k')$ defined over $k'$.
] <hyp:common>

The first three conditions are those of #cite(label("AGKRRV")) §14.4.1; the last is the additional condition of #cite(label("AGKRRV")) §D.1.1. These are the assumptions referenced by #cite(label("GR")) §0.1.9. The center in condition (i) is the center of a Lie algebra. We will justify its relation to central cocharacters where that relation is used.

#prodef([Hypothesis 1.2.])[
  (Regime A: finite-field descent).  There are $q = p^r$, a smooth projective geometrically connected curve $X_0 \/ bb(F)_q$, and a split connected reductive group $G_0 \/ bb(F)_q$ such that
  $ k = overline(bb(F))_q \, #h(2em) X = X_0 times_(bb(F)_q) k \, #h(2em) G = G_0 times_(bb(F)_q) k . $
  Hypothesis 1 holds. No additional restriction on the order of the Weyl group is imposed in this regime.
] <hyp:A>

#prodef([Hypothesis 1.3.])[
  (Regime B: arbitrary algebraically closed base).  The field $k$ is any algebraically closed field of characteristic $p > 0$. Hypothesis 1 holds, $p$ is very good for $G$, and $p divides.not \| W_G \|$. No finite-field descent of $X$ is assumed.
] <hyp:B>

Here very good has its usual root-system meaning: for type $A_n$, $p divides.not n + 1$; for $B_n \, C_n \, D_n$, $p eq.not 2$; for $G_2 \, F_4 \, E_6 \, E_7$, $p eq.not 2 \, 3$; and for $E_8$, $p eq.not 2 \, 3 \, 5$, on every irreducible factor. A torus has no such exclusions. We retain all the conditions in Hypothesis 3, even where some are redundant for a particular step. The two regimes have distinct proofs of the needed Lie-theoretic statement; neither is used as a substitute for the other.

=== 1.2 Full support <full-support>

Under Hypothesis 1, the restricted Langlands functor of #cite(label("GR")) factors as

#[#set math.equation(numbering: n => "(1.2)")
 $ bb(L)_G^(upright("restr")) : "Shv"_("Nilp") \( "Bun"_G \( X \) \) arrow.r^(med tilde.op med) "IndCoh"_("Nilp") \( Y' \) arrow.r.hook "IndCoh"_("Nilp") \( Y \) \, $ <intro:primed>]

where $Y' subset Y$ is an open-and-closed union of connected components. The functor is $"QCoh" \( Y \)$-linear #cite(label("GR")) Lemma 1.3.7 and Main Theorem 1.3.9.

#thm([Theorem 1.4.])[
  (Full support).  #emph[Let $k \, ell \, E \, X \, G$ be as above. Under either Hypothesis 2 or Hypothesis 3, the inclusion $Y' subset Y$ is equality as spectral prestacks. Consequently the given functor is a $"QCoh" \( Y \)$-linear equivalence 
$ bb(L)_G^(upright("restr")) : "Shv"_("Nilp") \( "Bun"_G \( X \) \) arrow.r^(med tilde.op med) "IndCoh"_("Nilp") \( Y \) . $

]
] <thm:full-support>

This proves Conjecture 1.3.10 of #cite(label("GR")) in the two displayed regimes. The positive-characteristic primed equivalence, the full characteristic-zero equivalence, and the full result for general linear groups are established inputs from Main Theorem 1.3.9 of that paper. The present theorem concerns the restricted theory with its stated characteristic hypotheses.

Section 8 records three consequences. Localizing the given functor at any spectral component gives the corresponding nonzero ind-coherent category. In regime A, the known primed trace formula becomes the full arithmetic formula using derived geometric Frobenius fixed points. For an arbitrary parameter, spectral linearity produces a nonzero Hecke eigenobject with coherent tensor and fusion compatibilities. Its asserted category is ind-constructible and nilpotent; no bounded constructibility or perversity assertion is needed.

=== 1.3 Rational coefficients <rational-coefficients>

There is also a coefficient form of the support question. Put $E_0 = bb(Q)_ell$, retaining $E = overline(bb(Q))_ell$. For the rational support statement let $k = overline(bb(F))_q$, and let $X \/ k$ be smooth projective connected and $G \/ k$ connected reductive satisfying Hypothesis 1. Let $caron(G)_0 \/ E_0$ be the split dual group, with $caron(G) = caron(G)_0 times_(E_0) E$. Define $Y_0$ by (1.1) with $E_0$ in place of $E$, and put $cal(C)_0 = "Shv"_("Nilp" \, E_0) \( "Bun"_G \)$, using the rational ind-constructible sheaf category and the same nilpotent condition. These coefficient changes leave the geometric field $k$ unchanged.

Universal evaluation sends a representation to its local system in the universal family on $Y_0$; for a finite set of legs it uses the exterior products of these local systems. The rational spectral-action datum consists of a continuous $"QCoh" \( Y_0 \)$-action on $cal(C)_0$ whose restriction along universal evaluation is the usual multi-leg Hecke system, with its tensor, permutation and collision compatibilities. We take this datum as part of the rational support problem. The rational geometric Satake and derived Hecke constructions are recalled in Section 9. We distinguish the given rational action and support from a construction of a normalized rational Langlands equivalence: the cited theorem of Gaitsgory–Raskin is used over $E$.

#thm([Theorem 1.5.])[
  (Rational spectral support).  #emph[For the rational datum just specified, every nonempty open-and-closed substack $U subset Y_0$ has 
$ "QCoh" \( U \) ⊗_("QCoh" \( Y_0 \)) cal(C)_0 eq.not 0 . $

 Consequently, if $Y'_0 subset Y_0$ is an open-and-closed support union whose complementary structure idempotent acts by zero on $cal(C)_0$, then $Y'_0 = Y_0$ as spectral prestacks. In particular this applies to the support of any given $"QCoh" \( Y_0 \)$-linear primed equivalence.]
] <thm:rational-support>

The conclusion concerns the entire rational spectral prestack, without identifying its components with rational points. A curve over $overline(bb(F))_q$ descends to a finite extension of $bb(F)_q$ by finite presentation; a split form of $G$ does as well. Thus Theorem 4 in regime A supplies the geometric input without adding a Weyl-order restriction. No rational extension of regime B is asserted here.

Section 9 proves the required coefficient comparison on sheaf categories, affine families and the coherent spectral action. It then descends the absence of a clopen summand acting by zero. The rational arithmetic statement has a further input: a canonical primed trace formula over $E_0$ with the stated Frobenius and ind-coherent conventions. We prove unpriming conditional on that input; we do not construct the rational primed comparison map. The unconditional arithmetic formula above remains over $E$.

=== 1.4 The specialization and slicing argument <the-specialization-and-slicing-argument>

We first outline the proof of Theorem 4 over $E$. A missing spectral component leads to a contradiction as follows. Lift $X$ to a smooth proper curve $cal(X)$ over the Witt trait, lift $G$, and let $cal(B)$ be the relative bundle stack. Write $K$ for an algebraic closure of the fraction field and $Psi$ for geometric nearby cycles with monodromy forgotten. The established specialization formalism and characteristic-zero equivalence produce, from a missing component, a nonzero compact sheaf $F$ on $cal(B)_K$ with $Psi F = 0$.

Section 2 strengthens this vanishing to Hecke transforms pulled back along maps whose bundle projection is smooth. The leg map may be arbitrary. This extra freedom is needed after cutting a Hecke correspondence by a hypersurface.

On a smooth chart $U arrow.r cal(B)$, a special-fiber cotangent vector outside the nilpotent cone gives a test function $f$. If that covector comes from a Higgs field, Sections 3 and 4 construct a modification with a nonzero leg covector and transverse zeros on both fixed-side Hecke fibers. The two characteristic regimes enter only in constructing the Levi and central cocharacter required for this calculation.

Section 5 takes two modifications with common output and common leg. Proper pushforward and the reverse transversality isolate the stalk at the diagonal. The forward transversality then gives an actual étale local equation

$ sum_(i = 1)^m u_i v_i + f = 0 \, $

with the sheaf pulled back from $U$. Here $m$ is the Hecke-orbit dimension and $\( u_i \, v_i \)$ are local coordinates transverse to the chart and leg. This is the point where the two correspondences are both essential.

Section 6 compares the projective closure of this quadratic equation with its hyperplane classes. The remaining derived sheaf is a constant line supported on $f = 0$. A projective incidence construction then gives the same vanishing on higher-codimension slices whose cotangent planes avoid the nilpotent cone. Finally, Section 7 uses the nilpotent dimension bound to choose such a slice through the actual support of $F$. Its support is finite over a henselian trait near the chosen point, so its nearby cycles are a finite direct sum of stalks with at least one nonzero summand. This contradicts slice vanishing.

The central-in-a-Levi modification and moving-leg calculation originate in #cite(label("AGKRRV")) §§20.4–20.7. The additional argument here is the two-correspondence transversality and slicing mechanism, including the exact local equation and derived comparison triangles. All singular-support dimension bounds used in the proof are on the special fiber; the nearby-cycle tests themselves are proved directly. The arithmetic application combines the automorphic trace comparison of #cite(label("AGKRRVTrace")) with the spectral trace calculation of Beraldo–Lin–Reeves #cite(label("BeraldoLinReeves")) §§6.4.12–6.4.13, as assembled in #cite(label("GR")) §1.5. The coefficient argument in Section 9 uses constructible coefficient continuity #cite(label("HemoRicharzScholbach")) and the universal-local-acyclicity criterion of #cite(label("HansenScholze")); the rational spectral action and primed arithmetic map remain the given data stated above.

== 2 Specialization and a missing spectral component <sec:specialization>

We first translate a missing component into a geometric vanishing statement. The object we obtain will be compact, hence constructible on finite-type charts. More importantly, its Hecke transforms will have zero nearby cycles after any pullback whose projection to the bundle stack is smooth. The map recording the Hecke point need not be smooth. This last qualification is what permits the hypersurface tests in Sections 5 and 6.

Fix data satisfying Hypothesis 2 or Hypothesis 3. Nothing in this section assumes the full-support conclusion of Theorem 4.

=== 2.1 A trait and geometric specialization <a-trait-and-geometric-specialization>

Initially set

$ R = W \( k \) \, #h(2em) S = "Spec" \( R \) \, #h(2em) K = overline("Frac" \( R \)) . $

We fix the algebraic closure $K$ throughout. Since $k$ is perfect, every nonzero Witt vector is a power of $p$ times a unit. Thus $R$ is a complete Noetherian discrete valuation ring with uniformizer $p$ and residue field $k$. It is strictly henselian, and it is excellent because it is a complete Noetherian local ring; see #cite(label("Stacks")) Tag 07QS.

Choose a smooth projective lift $cal(X) arrow.r S$ of $X$. For completeness, such a lift exists over $W \( k \)$ for every algebraically closed $k$ in either hypothesis. At each infinitesimal lifting step the obstruction for a smooth curve lies in $H^2 \( X \, T_X \)$, which vanishes. An ample invertible sheaf also lifts, since its obstruction lies in $H^2 \( X \, cal(O)_X \) = 0$. Algebraization of the resulting proper formal curve with an ample invertible sheaf gives a projective lift. It is smooth near the special fiber; the nonsmooth locus, being closed in a proper scheme over the local base, would meet the special fiber if it were nonempty. Hence the lift is smooth everywhere. These deformation and algebraization statements can be found in #cite(label("Stacks")) Tags 0DZQ and 0E7R; the same lift is used in #cite(label("GR")) §3.1.1. This construction requires no finite-field descent of $X$.

The root datum of the split group $G$ gives a split reductive group over $bb(Z)$ and hence over $S$ #cite(label("Conrad")) Theorems 6.1.16(2) and 6.1.17; we retain the notation $G$ for this lift. Write

$ cal(B) = "Bun"_G \( cal(X) \/ S \) \, #h(2em) s = "Spec" \( k \) \, #h(2em) eta = "Spec" \( K \) . $

The stack $cal(B) = "Hom"_S \( cal(X) \, B_S G \)$ is algebraic and locally of finite presentation over $S$, with affine diagonal, by #cite(label("HallRydh")) Theorem 1.2(i)–(iii). Indeed, $cal(X) \/ S$ is proper, flat and finitely presented, while the classifying stack $B_S G$ is locally of finite presentation and quasi-separated, with affine stabilizers and affine diagonal. The obstruction group for deforming a bundle on a curve is the second cohomology of its adjoint bundle, which vanishes. Thus $cal(B)$ is smooth over $S$.

We will replace $R$ by its integral closure in a finite extension of $"Frac" \( R \)$ inside $K$ when necessary. Such an integral closure is a finite complete discrete valuation ring with residue field $k$; see #cite(label("Stacks")) Tags 0EXQ and 0323. It remains excellent and strictly henselian. We retain $R \, S \, cal(X)$ and $cal(B)$ for the resulting models. All dimension arguments below take place over these Noetherian traits, not over the integral closure in the entire field $K$.

For a finite-type scheme or algebraic space $T$ over $S$, let

$ Psi_T : "Shv" \( T_K \) arrow.r "Shv" \( T_s \) $

be geometric specialization, with monodromy forgotten. Here, on a finite-type scheme over a field, $"Shv"$ is the ind-completion of the category of bounded constructible $E$-adic complexes. We use ordinary $*$-pullbacks, ordinary tensor products and ordinary stalks. The same notation applies to locally finite-type algebraic stacks by smooth descent. In particular, the functor $Psi_(cal(B))$ is defined on the entire sheaf category.

We recall how the construction in #cite(label("GR")) §§4.1.1–4.1.5 fixes the meaning of this functor. On a finite-type affine chart one first uses geometric nearby cycles for finite coefficient rings at finite extensions of the generic field. One then passes through the compatible coefficient limits, inverts $ell$, extends the coefficient field to $E$, and extends continuously from constructible objects. Compatibility with smooth pullback gives the stack version. In particular, $Psi_T$ is an exact functor of stable categories, is continuous, and preserves constructibility. It commutes with smooth pullback and representable proper pushforward #cite(label("GR")) §4.1.6.

These functors are unchanged by the allowed finite trait replacements, using the identified geometric fibers. Indeed, after fixing one finite extension, the finite subextensions of $K$ containing it form a cofinal subsystem: enlarge any stage by taking its compositum with the fixed extension. The models and torsion nearby-cycle functors at the remaining stages are the same. All subsequent coefficient operations and ind-extensions therefore agree. For $T = S$, the functor $Psi_S$ is the identity on the underlying complexes of geometric-point coefficients. At no stage do we take inertia invariants.

We will also use the following tensor compatibility. If $a : T arrow.r cal(B)$ is smooth and $cal(L)$ is a finite-rank lisse sheaf on $T$, then for any $D in "Shv" \( cal(B)_K \)$,

#[#set math.equation(numbering: n => "(2.1)")
 $ Psi_T #scale(x: 120%, y: 120%)[\(] a_K^(*) D ⊗ cal(L)_K #scale(x: 120%, y: 120%)[\)] tilde.eq a_s^(*) Psi_(cal(B)) \( D \) ⊗ cal(L)_s . $ <eq:spec-lisse-tensor>]

A lisse sheaf on the source of a smooth morphism is universally locally acyclic over the target. Thus (2.1) is the universally locally acyclic tensor-pullback formula of #cite(label("GR")) Lemma 4.1.9. Equivalently, it follows from smooth base change and the tensor formula for a lisse sheaf extending over the model. Continuity makes the formula applicable to arbitrary $D$ in the indicated ind-category.

=== 2.2 The spectral summand and compactness <the-spectral-summand-and-compactness>

Let

$ cal(C)_s = "Shv"_("Nilp") \( cal(B)_s \) \, #h(2em) cal(C)_K = "Shv"_("Nilp") \( cal(B)_K \) \, #h(2em) Y_K = L S_(caron(G))^(upright("restr")) \( cal(X)_K \) . $

Recall that $Y = L S_(caron(G))^(upright("restr")) \( X \)$ denotes the special-fiber spectral stack. Restriction to the special fiber gives an equivalence $"QLisse" \( cal(X) \) tilde.eq "QLisse" \( X \)$ #cite(label("GR")) §3.1.3. Composing its inverse with restriction to the geometric generic fiber defines the symmetric monoidal functor

$ rho : "QLisse" \( X \) arrow.r "QLisse" \( cal(X)_K \) . $

The induced map

$ i : Y arrow.r.hook Y_K $

identifies $Y$ with an open-and-closed union of connected components #cite(label("GR")) §3.1.3. In particular,

#[#set math.equation(numbering: n => "(2.2)")
 $ cal(D)_Y := "QCoh" \( Y \) ⊗_("QCoh" \( Y_K \)) cal(C)_K $ <eq:spec-DY>]

is a direct summand of $cal(C)_K$.

We need the compatibility of #emph[actual] specialization with this summand. Corollary 4.3.6 and §4.3.9 of #cite(label("GR")) show that the restriction of the chartwise functor $Psi_(cal(B))$ constructed above gives

$ Psi_(cal(B)) : cal(D)_Y arrow.r cal(C)_s . $

It is $"QCoh" \( Y \)$-linear by #cite(label("GR")) Theorem 3.1.6(B) and §4.3.10. Thus the functor used here is not merely one obtained by transporting a spectral functor across Langlands equivalences. Its values on smooth charts are the geometric nearby cycles used later.

The characteristic-zero equivalence of #cite(label("GR")) Theorem 1.3.9(ii) and its spectral linearity identify

#[#set math.equation(numbering: n => "(2.3)")
 $ cal(D)_Y tilde.eq "IndCoh"_("Nilp") \( Y \) . $ <eq:spec-generic-equivalence>]

In positive characteristic we use only the given equivalence onto the primed union

$ cal(C)_s tilde.eq "IndCoh"_("Nilp") \( Y' \) \, #h(2em) Y' subset.eq Y . $

#thm([Proposition 2.1.])[
  #emph[Suppose a connected component $C subset Y$ is disjoint from $Y'$. Then 
$ cal(D)_C := "QCoh" \( C \) ⊗_("QCoh" \( Y \)) cal(D)_Y $

 is nonzero, and $Psi_(cal(B)) \( D \) = 0$ for every $D in cal(D)_C$. Moreover, there exists a nonzero $F in cal(D)_C$ that is compact both in $cal(C)_K$ and in $"Shv" \( cal(B)_K \)$. For every finite-type smooth scheme chart $b : U arrow.r cal(B)$, the complex $b_K^(*) F$ is bounded constructible.]
] <spec:missing>

#proof[
  Let $e_C in "QCoh" \( Y \)$ be the structure sheaf of $C$ extended by zero. Its action is the projection onto $cal(D)_C$. On $cal(C)_s$ this object acts by zero, since $C ∩ Y' = diameter$ and the primed equivalence is spectral-linear. Hence, for $D in cal(D)_C$,
  $ Psi_(cal(B)) \( D \) tilde.eq Psi_(cal(B)) \( e_C dot.op D \) tilde.eq e_C dot.op Psi_(cal(B)) \( D \) = 0 . $
  By (2.3), the category $cal(D)_C$ is identified with $"IndCoh"_("Nilp") \( C \)$. It is nonzero: the fully faithful functor from $"QCoh" \( C \)$ into $"IndCoh"_("Nilp") \( C \)$ sends the nonzero object $cal(O)_C$ to a nonzero object; see #cite(label("GR")) §§1.3.1–1.3.4.
  The category $cal(D)_Y$ is compactly generated #cite(label("GR")) §3.1.7. The binary decomposition
  $ cal(D)_Y tilde.eq cal(D)_C times cal(D)_(Y \\ C) $
  shows that projection onto $cal(D)_C$ preserves compactness: its right adjoint, the inclusion of that factor, is continuous. Project compact generators of $cal(D)_Y$. At least one projection is nonzero, because otherwise their colimit closure would give $cal(D)_C = 0$. Choose such an object $F$.
  The inclusion of either direct factor also preserves compactness, since its right adjoint is the continuous projection. Applying this first to $cal(D)_C subset cal(D)_Y$ and then to $cal(D)_Y subset cal(C)_K$ shows that $F$ is compact in $cal(C)_K$. The nilpotent inclusion $cal(C)_K arrow.r.hook "Shv" \( cal(B)_K \)$ preserves compactness by #cite(label("GR")) Theorem 1.1.7. Finally, a compact sheaf on an algebraic stack is constructible on smooth finite-type charts #cite(label("AGKRRV")) §F.2.2. This proves the last assertion. ◻
]

The argument uses one missing component and a binary direct-factor decomposition. It does not require that $Y$ have finitely many components or that the unit $e_C$ be compact. If $Y' eq.not Y$, such a component $C$ exists because $Y'$ is a union of the open-and-closed components of $Y$. For the rest of the geometric proof, fix $C$ and $F$ as in Proposition 6.

=== 2.3 Hecke vanishing with an arbitrary leg <hecke-vanishing-with-an-arbitrary-leg>

Let $V$ be a finite-dimensional representation of $caron(G)$, and let

$ upright(H)_V : cal(C)_K arrow.r "Shv" \( cal(B)_K times_K cal(X)_K \) $

be the one-leg Hecke functor, with the normalization giving its usual spectral-action description. The correspondence and its kernel will be specified in Section 4. Here we use the universal evaluation objects

$ cal(E)_(V \, s) in "QCoh" \( Y \) ⊗ "QLisse" \( X \) \, #h(2em) cal(E)_(V \, K) in "QCoh" \( Y_K \) ⊗ "QLisse" \( cal(X)_K \) . $

For an affine test scheme mapping to a spectral stack, the restriction of $cal(E)_V$ is the family of local systems obtained by applying the corresponding tensor functor to $V$. Acting by its first tensor factor and then taking the exterior product gives the Hecke functor #cite(label("AGKRRV")) §14.3.3.

The definition of $i$ implies

#[#set math.equation(numbering: n => "(2.4)")
 $ \( i^(*) ⊗ "id" \) \( cal(E)_(V \, K) \) tilde.eq \( "id" ⊗ rho \) \( cal(E)_(V \, s) \) . $ <eq:spec-universal-family>]

Indeed, this identity holds on every affine test mapping to $Y$: both sides are the local system obtained by extending the specified special-fiber family. To pass from these tests to the global identity, note that $"QLisse"$ of a smooth curve is compactly generated and hence dualizable as a presentable dg category #cite(label("AGKRRV")) §1.2.11 and §§E.2.6–E.2.7. Tensoring with a dualizable category preserves limits, so it commutes with the descent limit defining $"QCoh" \( Y \)$. This justifies the passage from the affine identities to (2.4).

A second, distinct input is

#[#set math.equation(numbering: n => "(2.5)")
 $ cal(E)_(V \, s) in "QCoh" \( Y \) ⊗ "IndLisse" \( X \) \, #h(2em) "IndLisse" \( X \) = "Ind" \( "Lisse" \( X \) \) \, $ <eq:spec-IndLisse>]

proved in #cite(label("AGKRRV")) Remark 14.3.9. Here $"Lisse" \( X \)$ consists of bounded constructible complexes whose ordinary cohomology sheaves are finite-rank lisse sheaves. We do not identify $"IndLisse" \( X \)$ with $"QLisse" \( X \)$: that identification fails for $X = bb(P)^1$. The dualizability used in descent and the stronger membership assertion (2.5) have different roles.

Applying the $"QCoh" \( Y \)$-action in (2.5) to $F$ gives an object of $cal(D)_C ⊗ "IndLisse" \( X \)$. After applying $"id" ⊗ rho$ and the exterior-product functor, its image is $upright(H)_V \( F \)$ by (2.4). Elementary tensors generate the tensor product of presentable dg categories under colimits. Bounded truncations also build every object of $"Lisse" \( X \)$ from finite-rank lisse sheaves. Consequently $upright(H)_V \( F \)$ belongs to the stable colimit closure of objects

#[#set math.equation(numbering: n => "(2.6)")
 $ D times.square cal(L)_K \, #h(2em) D in cal(D)_C \, $ <eq:spec-exterior-generators>]

where $cal(L)_K$ is the restriction of a finite-rank lisse sheaf $cal(L)_S$ on $cal(X)$. To see the extension assertion, proper henselian invariance identifies the finite #emph[étale] covers of $cal(X)$ with those of $X$ #cite(label("Stacks")) Tag 0A48. Apply this to the compatible finite coefficient local systems of a lisse lattice, then invert $ell$ and extend coefficients. The resulting extension is the one inducing $rho$.

#thm([Lemma 2.2.])[
  #emph[Let $a : T arrow.r cal(B)$ be smooth, where $T$ is a scheme or algebraic space of finite type over $S$, and let $ell_T : T arrow.r cal(X)$ be any $S$-morphism. For $F$ as in Proposition 6 and every finite-dimensional representation $V$ of $caron(G)$, one has 
$ Psi_T \( a_K^(*) F \) = 0 \, #h(2em) Psi_T #scale(x: 120%, y: 120%)[\(] \( a \, ell_T \)_K^(*) upright(H)_V \( F \) #scale(x: 120%, y: 120%)[\)] = 0 . $

 The same statements hold on the smooth locus of $a$, and after any of the finite trait replacements described above.]
] <spec:vanishing>

#proof[
  The first equality follows from smooth base change and $Psi_(cal(B)) \( F \) = 0$. For an exterior product in (2.6), ordinary pullback gives
  $ \( a \, ell_T \)_K^(*) \( D times.square cal(L)_K \) = a_K^(*) D ⊗ ell_(T \, K)^(*) cal(L)_K . $
  The sheaf $ell_T^(*) cal(L)_S$ is lisse on $T$, regardless of the smoothness of $ell_T$. Formula (2.1) and Proposition 6 therefore give
  $ Psi_T #scale(x: 120%, y: 120%)[\(] a_K^(*) D ⊗ ell_(T \, K)^(*) cal(L)_K #scale(x: 120%, y: 120%)[\)] tilde.eq a_s^(*) Psi_(cal(B)) \( D \) ⊗ ell_(T \, s)^(*) cal(L)_s = 0 . $
  Both pullback and specialization are continuous, so the same vanishing holds for the stable colimit closure of these exterior products, which contains $upright(H)_V \( F \)$. The calculation is local on the smooth locus, and the finite-extension assertion follows from the invariance of geometric specialization already proved. ◻
]

We have now obtained the two vanishings needed for the geometric argument. Their proof uses smoothness only of the map to the bundle stack; it makes no smooth-base-change assertion for the combined map $\( a \, ell_T \)$. The next two sections construct modifications that turn a non-nilpotent covector into a test to which Lemma 7 applies.

== 3 A Levi reduction for a formal Higgs field <sec:lie>

The Hecke modification in the next section must preserve a given Higgs field and produce a nonzero covector in the direction of the moving point. We obtain both properties from a cocharacter in the center of a Levi subgroup. The following proposition is the precise Lie-theoretic input. Its two characteristic arguments are kept separate.

For a cocharacter $lambda : bb(G)_m arrow.r G$, write $d lambda in frak(g)$ for the image of $1 in "Lie" \( bb(G)_m \) = k$. We distinguish the group center $Z \( M \)$ from the Lie-algebra center $frak(z) \( frak(m) \)$, where $frak(m) = "Lie" \( M \)$. Write $chi : frak(g) arrow.r frak(g) \/ #h(-0.16667em) \/ G$ for the adjoint quotient.

#thm([Proposition 3.1.])[
  #emph[Let $k$ and $G$ satisfy Hypothesis 1 and either Hypothesis 2 or Hypothesis 3, and let $kappa$ be the invariant symmetric form in those hypotheses. Suppose that $a \( t \) in frak(g) \[ \[ t \] \]$ satisfies $chi \( a \( 0 \) \) eq.not chi \( 0 \)$. After a change of frame by an element of $G \( k \[ \[ t \] \] \)$, there are a Levi subgroup $M subset G$ and a cocharacter $lambda : bb(G)_m arrow.r Z \( M \)$ such that 
#[#set math.equation(numbering: n => "(3.1)")
 $ a \( t \) in frak(m) \[ \[ t \] \] \, #h(2em) kappa \( a \( 0 \) \, d lambda \) eq.not 0 \,\
"ad"_(a \( 0 \)) : frak(g) \/ frak(m) arrow.r frak(g) \/ frak(m) med upright("is invertible") . $ <eq:lie-output>]

 Here $"ad"_x \( y \) = \[ x \, y \]$. The subgroup $M$ may equal $G$, and the invertibility assertion includes the zero vector space.]
] <lie:input>

The construction of a central modification follows the method of #cite(label("AGKRRV")) §§20.4–20.5. We give the characteristic and lattice arguments explicitly, since a vector in $frak(z) \( frak(m) \)$ alone does not specify a cocharacter of $Z \( M \)$.

=== 3.1 Root pairings and Jordan parts <root-pairings-and-jordan-parts>

Fix a maximal torus $T subset G$. Put $Lambda = X_(*) \( T \)$, $Lambda^or = X^(*) \( T \)$ and $frak(t) = "Lie" \( T \) = Lambda ⊗_(bb(Z)) k$. For a root $alpha$, its differential is the linear form $d alpha : frak(t) arrow.r k$, whereas $d alpha^or$ is the vector obtained by differentiating its coroot.

#thm([Lemma 3.2.])[
  #emph[The form $kappa$ is nondegenerate on $frak(t)$. For every root $alpha$, there is a scalar $c_alpha in k^times$ such that 
#[#set math.equation(numbering: n => "(3.2)")
 $ kappa \( d alpha^or \, h \) = c_alpha thin d alpha \( h \) #h(2em) \( h in frak(t) \) . $ <eq:root-coroot-pairing>]

 In particular, neither $d alpha$ nor $d alpha^or$ vanishes. Every element of $frak(g)$ is conjugate into the Lie algebra of a Borel subgroup containing $T$. Every semisimple element is conjugate into $frak(t)$.]
] <lie:root-pairing>

#proof[
  The $T$-weight decomposition is $frak(g) = frak(t) xor xor.big_alpha frak(g)_alpha$. Invariance under $T$ makes $frak(t)$ orthogonal to the root spaces and makes $frak(g)_alpha$ pair only with $frak(g)_(- alpha)$. Nondegeneracy of $kappa$ therefore gives nondegeneracy on $frak(t)$ and on each opposite-root pairing. Choose compatible root vectors $e_alpha \, e_(- alpha)$ with $\[ e_alpha \, e_(- alpha) \] = d alpha^or$. This identity follows by differentiating the rank-one root homomorphism from $upright("SL")_2$; it is valid for every isogeny type; see the root-subgroup construction in #cite(label("Springer")) §§8.1.1–8.1.4 and the bracket formula in #cite(label("Conrad")) Corollary 5.1.12, Equation (5.1.4). Invariance of the form gives (3.2) with $c_alpha = kappa \( e_alpha \, e_(- alpha) \) eq.not 0$. Thus one of $d alpha \, d alpha^or$ vanishes if and only if the other does. Their simultaneous vanishing would put $alpha in p Lambda^or$ and $alpha^or in p Lambda$, contradicting the integral identity $chevron.l alpha \, alpha^or chevron.r = 2$, since $p^2$ does not divide $2$. These arguments use torus characters, rather than just their differentials, and also apply in characteristic two.
  Let $B supset T$ be a Borel subgroup with Lie algebra $frak(b)$. The incidence morphism
  $ G times^B frak(b) arrow.r frak(g) \, #h(2em) \[ g \, x \] mapsto "Ad" \( g \) x \, $
  is proper: its source is closed in $\( G \/ B \) times frak(g)$. Choose $c in frak(t)$ outside the root differential hyperplanes. At $\[ 1 \, c \]$, the negative-root tangent directions map isomorphically onto the negative root spaces, and $frak(b)$ supplies the remaining directions. The morphism is consequently dominant, hence surjective.
  For a semisimple element in $frak(b)$, write it as $c + u$, with $c in frak(t)$ and $u$ in the positive-root Lie algebra. Conjugate by positive root groups in increasing root height. If $d alpha \( c \) eq.not 0$, conjugation by the $alpha$-root group changes the $alpha$ coefficient by $- z thin d alpha \( c \)$ and changes the other positive-root terms only in greater height. It therefore eliminates that coefficient. After all such steps the result is $c + u_0$ with $\[ c \, u_0 \] = 0$. In a faithful representation, $c$ is semisimple and $u_0$ is nilpotent. Since their sum is semisimple, the matrix Jordan decomposition forces $u_0 = 0$. ◻
]

Choose a closed faithful representation $G arrow.r.hook upright("GL") \( V \)$. Its differential identifies $frak(g)$ with a restricted Lie subalgebra of $"End" \( V \)$: the operation $x mapsto x^(\[ p \])$ is matrix $p$th power. This compatibility can also be defined intrinsically by the $p$th iterate of a left-invariant derivation. We use the ordinary matrix Jordan decomposition, and below prove that its two parts belong to $frak(g)$ in each regime; compare #cite(label("Springer")) §4.4, Theorem 4.4.20.

#thm([Lemma 3.3.])[
  #emph[Suppose that $a_0 = s + n in frak(g)$, where $s \, n in frak(g)$, $s$ is semisimple, $n$ is nilpotent in a faithful representation, and $\[ s \, n \] = 0$. Suppose also that $chi \( a_0 \) eq.not chi \( 0 \)$. After conjugation, $s$ is a nonzero element of $frak(t)$ and $M = Z_G \( s \)$ is a Levi subgroup. One has $a_0 in frak(m)$ and $"ad"_(a_0)$ is invertible on $frak(g) \/ frak(m)$. For every $lambda : bb(G)_m arrow.r Z \( M \)$, 
#[#set math.equation(numbering: n => "(3.3)")
 $ kappa \( a_0 \, d lambda \) = kappa \( s \, d lambda \) . $ <eq:nilpotent-orthogonality>]

]
] <lie:constant-parts>

#proof[
  Lemma 9 conjugates $s$ into $frak(t)$. If $s = 0$, apply the Borel assertion of that lemma to $n$. The projection $frak(b) arrow.r frak(t)$ preserves restricted $p$-operations. Since $n$ is killed by an iterated $p$-operation and that operation is injective on $frak(t)$, its toral projection is zero. A strictly dominant cocharacter contracts the positive-root Lie algebra to zero. Hence every invariant polynomial has the same value on $n$ and on zero, a contradiction. Thus $s eq.not 0$.
  By Hypothesis 1, $M = Z_G \( s \)$ is a Levi subgroup. Its Lie algebra is the kernel of $"ad"_s$, and it contains $a_0$. On $frak(g) \/ frak(m)$, the operator $"ad"_s$ is diagonalizable with nonzero eigenvalues. The commuting operator $"ad"_n$ is nilpotent, since $"ad"_n^(p^e) = "ad"_(n^(\[ p^e \])) = 0$ for large $e$. On each eigenspace of $"ad"_s$, the sum $"ad"_(a_0) = "ad"_s + "ad"_n$ is therefore invertible.
  To prove (3.3), conjugate $n$ inside $M$ into the Lie algebra of a Borel subgroup of $M$ containing $T$. The incidence argument of Lemma 9 applies to $M$: its roots have nonzero differentials, and $kappa$ is nondegenerate on $frak(m)$ by the same weight decomposition. Restricted nilpotence again makes the toral projection of $n$ zero. Thus the conjugated $n$ lies in the positive-root Lie algebra of $M$, which is orthogonal to $frak(t)$. Since $d lambda in frak(t)$ is fixed by $M$, invariance of $kappa$ gives $kappa \( n \, d lambda \) = 0$ before conjugation as well. ◻
]

It remains to choose the central cocharacter with nonzero pairing. In the finite-field regime we prove an integral lattice statement; in the arbitrary-field regime we use the separately assumed invertibility of the Weyl-group order.

=== 3.2 The finite-field regime <the-finite-field-regime>

The lattice statement below uses only the common invariant-form and Levi-center assumptions. We will then combine it with the finite-field construction of the Jordan parts.

#thm([Lemma 3.4.])[
  #emph[Assume the invariant-form and Levi-center conditions of Hypothesis 1. Every Levi Cartan determinant is prime to $p$. For every Levi subgroup $M$ containing $T$, 
#[#set math.equation(numbering: n => "(3.4)")
 $ "span"_k { d lambda : lambda in X_(*) \( Z \( M \) \) } = frak(z) \( frak(m) \) . $ <eq:central-span>]

 Here $X_(*) \( Z \( M \) \)$ denotes actual cocharacters of the group center, viewed in $X_(*) \( T \)$.]
] <lie:lattice>

#proof[
  After choosing a positive system, let $I = { alpha_1 \, dots.h \, alpha_r }$ be the simple roots of $M$. Set $J_I = "span"_k { d alpha_i^or } subset frak(t)$. Because every root differential is nonzero, a central element of $frak(m)$ has no root-space component. Equation (3.2) therefore identifies
  $ frak(z) \( frak(m) \) = ⋂_i ker \( d alpha_i \) = J_I^perp . $
  The form is nondegenerate on this center by hypothesis, and on $frak(t)$ by Lemma 9; it follows that it is nondegenerate on $J_I$.
  Define integral maps
  $ U : Lambda arrow.r bb(Z)^r \, quad y mapsto \( chevron.l alpha_i \, y chevron.r \)_i \, #h(2em) V : bb(Z)^r arrow.r Lambda \, quad e_j mapsto alpha_j^or . $
  Their composite is the Cartan matrix $C_I = U V = \( chevron.l alpha_i \, alpha_j^or chevron.r \)_(i \, j)$. A subscript $k$ will mean reduction to $k$. Equation (3.2) gives $V_k^(*) kappa = D U_k$, where $D = "diag" \( c_(alpha_1) \, dots.h \, c_(alpha_r) \)$ is invertible. The radical of $V_k^(*) kappa V_k$ is exactly $ker V_k$, by nondegeneracy on $J_I = "im" V_k$. Consequently
  #[#set math.equation(numbering: n => "(3.5)")
   $ "rank" \( C_(I \, k) \) = "rank" \( V_k \) = "rank" \( U_k \) . $ <eq:cartan-ranks>]
  If some Levi Cartan determinant were divisible by $p$, the ordinary determinant list would give a further Levi of type $A_(p - 1)$. Indeed, the Cartan matrices of the classified Dynkin diagrams #cite(label("Milne")) Theorem C.56 and §24(c) have determinants
  $ upright("type") & A_r & B_r & C_r & D_r & E_6 & E_7 & E_8 & F_4 & G_2\
det & r + 1 & 2 & 2 & 4 & 3 & 2 & 1 & 1 & 1 . $
  In type $A_r$, take a consecutive string of $p - 1$ vertices. In the determinant-two and determinant-four cases take one vertex, since $p = 2$. In type $E_6$ take two adjacent vertices, since $p = 3$. Such a simple-root subdiagram defines a Levi of $G$, so the preceding rank calculation applies to it.
  For this $A_(p - 1)$ Levi, $r = p - 1$ and $det C_I = p$. Choose dual bases of the full character and cocharacter lattices, of rank $N_T$. The matrices of $U \, V$ have sizes $r times N_T$ and $N_T times r$. By (3.5), both reductions have rank less than $r$, so every maximal minor of each matrix is divisible by $p$. The integral Cauchy–Binet identity gives
  $ det C_I = sum_(J subset { 1 \, dots.h \, N_T }\
\| J \| = r) det \( U_(: \, J) \) det \( V_(J \, :) \) \, $
  which is divisible by $p^2$, contrary to $det C_I = p$. Using the full lattices here retains all central torus directions and makes no assumption on the isogeny type.
  For an arbitrary Levi, put $d_I = det C_I$ and define an integral endomorphism of $Lambda$ by
  $ Pi_I = d_I "id"_Lambda - V "adj" \( C_I \) U . $
  It satisfies $U Pi_I = 0$. The lattice $ker U$ consists precisely of cocharacters into $Z \( M \)$: their images commute with $T$ and with every root group of $M$. For $z in ker U_k$, $Pi_(I \, k) \( z \) = d_I z$. Since $d_I$ is invertible in $k$, the differentials of elements of $ker U$ span $ker U_k = frak(z) \( frak(m) \)$, proving (3.4). For $r = 0$, take $d_I = 1$ and $Pi_I = "id"_Lambda$; the same proof covers tori. ◻
]

We now assume Hypothesis 2, so $k = overline(bb(F))_q$, and construct the constant-term data in Proposition 8. In a faithful representation, write $a_0 = a \( 0 \) = s + n$ for its matrix Jordan decomposition. The eigenvalues of $s$ lie in a finite field $bb(F)_(p^h)$. Choose $e$ divisible by $h$ and large enough to have $n^(p^e) = 0$. Then

$ a_0^(\[ p^e \]) = a_0^(p^e) = s^(p^e) + n^(p^e) = s . $

Thus $s \, n in frak(g)$. Lemma 10 supplies a nonzero $s in frak(t)$, the Levi $M = Z_G \( s \)$ and invertibility of $"ad"_(a_0)$ on $frak(g) \/ frak(m)$. The element $s$ lies in $frak(z) \( frak(m) \)$, where $kappa$ is nondegenerate. By Lemma 11, some actual $lambda in X_(*) \( Z \( M \) \)$ satisfies $kappa \( s \, d lambda \) eq.not 0$. Equation (3.3) gives the required $kappa \( a_0 \, d lambda \) eq.not 0$. This construction has used no Weyl-order assumption.

=== 3.3 The arbitrary algebraically closed regime <the-arbitrary-algebraically-closed-regime>

We now assume Hypothesis 3. The eigenvalues of a matrix over $k$ need not be fixed by any positive power of Frobenius. Instead, a finite additive-polynomial interpolation gives its Jordan parts inside $frak(g)$.

Write $a_0 = s + n$ in a faithful representation and choose $e$ with $n^(p^e) = 0$, so $a_0^(p^e) = s^(p^e)$. Let $V_0 subset k$ be the finite-dimensional $bb(F)_p$-span of the eigenvalues of $s$, and let $V_e = { v^(p^e) : v in V_0 }$. The inverse of Frobenius $V_e arrow.r V_0$ is $bb(F)_p$-linear. If $V_0 = 0$, then $s = 0$ and $a_0 = n in frak(g)$, contrary to Lemma 10 and $chi \( a_0 \) eq.not chi \( 0 \)$. We may therefore assume that $r = dim_(bb(F)_p) V_e gt.eq 1$. If $beta_1 \, dots.h \, beta_r$ is an $bb(F)_p$-basis of $V_e$, the Moore matrix

$ \( beta_i^(p^j) \)_(1 lt.eq i lt.eq r \, med 0 lt.eq j < r) $

is invertible. Otherwise a nonzero polynomial $sum_(j = 0)^(r - 1) c_j z^(p^j)$ of degree at most $p^(r - 1)$ would vanish on all $p^r$ elements of $V_e$, a contradiction. There is therefore an additive polynomial $Q \( z \) = sum_(j = 0)^(r - 1) c_j z^(p^j)$ agreeing with inverse Frobenius on $V_e$. Applying it to the diagonalizable matrix $s^(p^e)$ gives

$ s = Q \( a_0^(p^e) \) = sum_(j = 0)^(r - 1) c_j a_0^(\[ p^(e + j) \]) in frak(g) . $

Thus $n in frak(g)$ as well. Lemma 10 gives $s in frak(t) \\ { 0 }$, $M = Z_G \( s \)$ and the quotient invertibility.

Let $W_M = N_M \( T \) \/ T$ be the Weyl group of $M$ and set $h_M = \| W_M \|$. Since $W_M subset W_G$, the integer $h_M$ is invertible in $k$. The operator

$ e_M = 1 / h_M sum_(w in W_M) w : frak(t) arrow.r frak(t) $

is a self-adjoint projection for $kappa$. Consequently $kappa$ is nondegenerate on $frak(t)^(W_M) = "im" e_M$. This subspace contains $s$, since $M$ centralizes $s$. In fact $frak(t)^(W_M) = frak(z) \( frak(m) \)$: the differential reflection formula is $s_alpha \( h \) = h - d alpha \( h \) d alpha^or$, and $d alpha^or eq.not 0$ by Lemma 9. Thus, under the Weyl-order assumption, nondegeneracy on every Levi Lie center also follows from the invariant form itself.

To obtain integral cocharacters, choose a basis $mu_1 \, dots.h \, mu_(N_T)$ of $Lambda$ and form the integral sums

$ nu_i = sum_(w in W_M) w mu_i in Lambda^(W_M) . $

Their differentials span $frak(t)^(W_M)$ because $d nu_i = h_M e_M \( d mu_i \)$. The integral reflection formula

$ s_alpha \( lambda \) = lambda - chevron.l alpha \, lambda chevron.r alpha^or $

and torsion-freeness of $Lambda$ show that $Lambda^(W_M) = X_(*) \( Z \( M \) \)$: an invariant cocharacter has zero integral pairing with every root of $M$, and conversely. No division of a cocharacter by $h_M$ has been made. Nondegeneracy on $frak(t)^(W_M)$ now gives an integral central cocharacter $lambda$ with $kappa \( s \, d lambda \) eq.not 0$. By (3.3), $kappa \( a_0 \, d lambda \) eq.not 0$ as required.

This argument applies to arbitrary algebraically closed $k$. Its use of $p divides.not \| W_G \|$ is specific to Hypothesis 3; the finite-field argument above obtained its cocharacter from the Levi-center form condition instead.

=== 3.4 A single formal reduction <a-single-formal-reduction>

Both regimes have now provided the same constant-term data. The remaining step moves the entire formal Higgs coefficient into the chosen Levi. It uses neither finite-field descent nor a Weyl-group average.

#thm([Lemma 3.5.])[
  #emph[Let $G$ be a connected reductive group over an algebraically closed field $k$, let $M subset G$ be a Levi subgroup, and let $a \( t \) in frak(g) \[ \[ t \] \]$ satisfy $a_0 = a \( 0 \) in frak(m)$. If $"ad"_(a_0)$ is invertible on $frak(g) \/ frak(m)$, then there exists $g \( t \) in G \( k \[ \[ t \] \] \)$ with $g \( 0 \) = 1$ such that $"Ad" \( g \( t \) \) a \( t \) in frak(m) \[ \[ t \] \]$.]
] <lie:formal>

#proof[
  Suppose that the current arc belongs to $frak(m) \[ \[ t \] \]$ modulo $t^r$, with $r gt.eq 1$, and let $c_r in frak(g) \/ frak(m)$ be the class of its coefficient of $t^r$. Choose $D in frak(g)$ such that $c_r + \[ D \, a_0 \] = 0$ in the quotient. Smoothness of $G$ gives an element $g_r \( t \) in G \( k \[ \[ t \] \] \)$ with
  $ g_r \( t \) equiv 1 + t^r D med \( mod med t^(r + 1) \) . $
  Here the displayed expression specifies a point in the tangent kernel for the square-zero ideal $\( t^r \) \/ \( t^(r + 1) \)$; formal smoothness lifts it successively to every higher order. Conjugation by $g_r \( t \)$ changes the coefficient of $t^r$ by $\[ D \, a_0 \]$ and leaves all lower coefficients unchanged. It therefore places the arc in $frak(m) \[ \[ t \] \]$ modulo $t^(r + 1)$.
  Iterate this construction. Since $g_r \( t \) equiv 1 med \( mod med t^r \)$, the successive products converge in the $t$-adic topology. The affine group $G$ takes this compatible system of points modulo $t^j$ to a point $g \( t \) in G \( k \[ \[ t \] \] \)$ with $g \( 0 \) = 1$. Its conjugation sends the arc into $frak(m) \[ \[ t \] \]$. No exponential series is used. ◻
]

#proof[
  Under Hypothesis 2, use the restricted-power construction and Lemma 11. Under Hypothesis 3, use the additive-polynomial construction and integral Weyl-group averaging. In each case Lemma 10 supplies the Levi and quotient invertibility, with $kappa \( a_0 \, d lambda \) eq.not 0$. Apply Lemma 12 after the initial constant conjugation. The formal change of frame fixes $a_0$, so all three assertions in (3.1) hold. ◻
]

#prodef([Remark 3.6.])[
  Centrality of $lambda$ in $M$ makes $"Ad" \( lambda \( t \) \) a \( t \) = a \( t \)$. Moreover, every nonzero $lambda$-weight space of $frak(g)$ injects into $frak(g) \/ frak(m)$, so the adjoint action is invertible on the truncated nonzero-weight modules used below. We do not need $Z_G \( lambda \) = M$. If $lambda$ is central in $G$, the Hecke orbit has dimension zero; the nonzero pairing in (3.1) still supplies the moving-point covector. In particular, tori are included in every allowed characteristic.
] <lie:zero-orbit>

== 4 Hecke modifications and transverse cotangent sections <sec:hecke>

We now turn the Lie-theoretic data of Proposition 8 into a modification of a bundle and its Higgs field. The moving point of the modification produces a nonzero covector on the curve. Two further properties will be needed: at fixed input, and at fixed output, the corresponding relative cotangent section has an invertible derivative. In the next section, the fixed-output derivative will isolate the distinguished stalk. The fixed-input derivative will complete the coordinates for its quadratic local model.

=== 4.1 Integral correspondences and the open Satake kernel <integral-correspondences-and-the-open-satake-kernel>

Keep the trait $S$, curve $cal(X) \/ S$, and bundle stack $cal(B)$ from Section 2. A one-point Hecke modification is a quadruple $\( P \, P' \, x \, alpha \)$, where $x$ is a point of $cal(X)$ and $alpha$ identifies $P'$ with $P$ away from its graph. Write

$ p \( P \, P' \, x \, alpha \) = P \, #h(2em) o \( P \, P' \, x \, alpha \) = P' \, #h(2em) ell_H \( P \, P' \, x \, alpha \) = x . $

We fix the following relative-position convention. In a formal coordinate $t$ at $x$ and an input frame, modification by a cocharacter $lambda$ means that the output frame is given by $lambda \( t \)$. Its relative position depends only on the Weyl orbit of $lambda$. Let $mu = lambda^(+)$ be the dominant representative and put

$ m = chevron.l 2 rho \, mu chevron.r \, #h(2em) mu^or = - w_0 mu \, #h(2em) cal(Z) = cal(B) times_S cal(X) \, $

where $2 rho$ is the sum of the positive roots and $w_0$ is the longest Weyl element. Denote the exact-position correspondence by $H = H^lambda$, and set

$ tilde(p) = \( p \, ell_H \) : H arrow.r cal(Z) \, #h(2em) q = \( o \, ell_H \) : H arrow.r cal(Z) . $

#thm([Lemma 4.1.])[
  (Hecke models and kernels).  #emph[Both $tilde(p)$ and $q$ are representable, separated, and smooth of relative dimension $m$. The correspondence $H$ is open in a bounded correspondence $overline(H)$ for which both projections to $cal(Z)$ are representable and proper. On the output side the bound has dominant label $mu^or$.]
  #emph[For the irreducible dual-group representation $V$ corresponding to this bound, with the input and output convention just specified, the generic Hecke functor has the form 
#[#set math.equation(numbering: n => "(4.1)")
 $ upright(H)_V \( F \) = overline(q)_(K \, *) cal(I)_K . $ <hecke:kernel>]

 On $H_K$, the integrand $cal(I)_K$ is $p_K^(*) F$ tensored with a fixed invertible constant complex. On a fixed-leg affine-Grassmannian fiber, the perverse intersection-cohomology normalization of that complex is $E \[ m \]$, with the constant Tate line if weight normalization is used.]
] <hecke:models>

#proof[
  Use the split integral affine Grassmannian, whose loops are $G \( A \( \( t \) \) \)$ and whose positive loops are $G \( A \[ \[ t \] \] \)$. Its integral Schubert bound is projective, and the positive-loop orbit is smooth, open, and fiberwise dense, of relative dimension $m$; see #cite(label("RicharzScholbach")) §§1.2 and 2.1. We use these models by base change from $bb(Z)$. The variable $t$ is the curve parameter, including when the base trait has mixed characteristic.
  A coordinate along the graph of $x$ and a frame on the formal disc identify modifications of a fixed input bundle with the corresponding Grassmannian spaces. These descriptions glue by Beauville–Laszlo descent #cite(label("BeauvilleLaszlo")). More explicitly, the graph is an effective Cartier divisor. The gluing theorem for modules also glues the coordinate algebra, multiplication, and coaction of an affine $G$-torsor; the torsor identity can be checked on the two gluing pieces. A disc frame exists locally: lift a frame on the graph successively through its infinitesimal neighborhoods using smoothness of $G$. Changes of frame and formal coordinate preserve the orbit and its bound. Consequently the properness, smoothness, and dimensions descend to the input-and-leg projection.
  Swapping the bundles and inverting $alpha$ is an involution of the Hecke correspondence. On double cosets it replaces $mu$ by $- mu$, whose dominant representative is $mu^or$. It carries the bound to the oppositely labelled bound. This proves the assertions for $q$, since $chevron.l 2 rho \, mu^or chevron.r = m$. Separatedness of the open correspondence follows from that of the proper bound. This involution is used on the correspondence, rather than as a purported inversion map on the right-quotient affine Grassmannian.
  The fibers here include an identification of the fixed bundle with the specified bundle. They are relative-position spaces: an automorphism of the moving bundle compatible with its identification off the graph is the identity. In particular, no further quotient by automorphisms of the fixed bundle is taken.
  For the last assertion, geometric Satake gives the intersection complex of the bound. Its restriction to the smooth open orbit is the shifted constant sheaf, with the indicated optional Tate normalization; see #cite(label("Richarz")) Proposition 4.1. The Hecke construction tensors this kernel with the ordinary pullback $p_K^(*) F$ and pushes forward along the proper output-and-leg projection; see #cite(label("GR")) §§4.2.1–4.2.4. Relabelling by $mu^or$ if necessary matches these projections with the chosen representation. A fixed overall shift or Tate line in the Hecke normalization changes neither this description nor any vanishing assertion below. Only the open-orbit restriction is being identified; the kernel on the boundary remains its intersection complex. ◻
]

=== 4.2 The transverse modification <the-transverse-modification>

On the special fiber, a cotangent vector at $P in cal(B)_s \( k \)$ means an element of $H^0$ of the cotangent-complex fiber. Deformation theory and vector-bundle Serre duality #cite(label("Stacks")) Tag 0BS4, followed by the invariant form $kappa$, identify this space with

$ T_P^(*) cal(B)_s = H^1 \( X \, frak(g)_P \)^(*) = H^0 \( X \, frak(g)_P ⊗ omega_X \) \, $

where $frak(g)_P$ is the adjoint bundle. We call such a vector $A$ a Higgs field. For a representable smooth map, pullback on these cotangent spaces is injective and its image is the kernel of passage to the relative cotangent. This follows from the cotangent triangle; it does not assert that the map to relative cotangents is surjective for maps between stacks.

#thm([Proposition 4.2.])[
  (Transverse modification).  #emph[Assume the hypotheses of Proposition 8. Let $P in cal(B)_s \( k \)$ and let $A in T_P^(*) cal(B)_s$ be non-nilpotent. There exist a point $x in X \( k \)$, a cocharacter $lambda$, a modification $h in H_s^lambda \( k \)$ from $P$ to a bundle $P'$, and a covector 
$ theta = \( A' \, xi \) in T_(\( P' \, x \))^(*) \( cal(B)_s times X \) \, #h(2em) xi eq.not 0 \, $

 such that $A'$ agrees with $A$ away from $x$ and 
#[#set math.equation(numbering: n => "(4.2)")
 $ d p_h^(*) A = d q_h^(*) theta . $ <hecke:cotangent-identity>]

 Moreover, form the fixed-side fibers 
$ H_(P \, x)^(upright("in")) = tilde(p)^(- 1) \( P \, x \) \, #h(2em) H_(P' \, x)^(upright("out")) = q^(- 1) \( P' \, x \) \, $

 with the fixed-bundle identifications retained. On the first fiber, restriction of $p^(*) A$ to the $q$-relative tangent bundle defines a section $S_A$ of $Omega_(H_s \/ cal(Z)_s \, q)$. On the second fiber, restriction of $o^(*) A'$ to the $tilde(p)$-relative tangent bundle similarly defines $S_(A')$. Both sections vanish at $h$, and both derivatives 
$ \( d S_A \)_h & : T_h H_(P \, x)^(upright("in")) arrow.r \( T_h H_(P' \, x)^(upright("out")) \)^(*) \,\
\( d S_(A') \)_h & : T_h H_(P' \, x)^(upright("out")) arrow.r \( T_h H_(P \, x)^(upright("in")) \)^(*) $

 are isomorphisms. In particular, each section has an isolated reduced zero at $h$.]
] <hecke:transverse>

#proof[
  Since $A$ is non-nilpotent, choose $x in X \( k \)$ where its value is non-nilpotent. Choose a formal coordinate $t$ and a bundle frame at $x$, and write $A = a \( t \) thin d t$. Chevalley restriction identifies the nilpotent fiber with $chi^(- 1) \( chi \( 0 \) \)$, so $chi \( a \( 0 \) \) eq.not chi \( 0 \)$. Proposition 8 then supplies a formal change of frame, a Levi subgroup $M$, and a cocharacter $lambda$ of $Z \( M \)$ such that
  #[#set math.equation(numbering: n => "(4.3)")
   $ a \( t \) in frak(m) \[ \[ t \] \] \, #h(2em) "ad" \( a \( 0 \) \) upright(" is invertible on ") frak(g) \/ frak(m) \, #h(2em) kappa \( a \( 0 \) \, d lambda \) eq.not 0 . $ <hecke:lie-data>]
  Here $d lambda$ is the value of the cocharacter differential on the canonical generator of $"Lie" \( bb(G)_m \)$. After constant conjugation, we regard $lambda$ as an element of the fixed cocharacter lattice; it therefore also labels the integral model of Lemma 14. Modify by $lambda \( t \)$. Since $lambda$ centralizes $M$, the transported field is regular in the output frame and still has expression $a \( t \) thin d t$. Together with $A$ away from $x$, it defines the global Higgs field $A'$ on $P'$. This central-in-a-Levi construction and the resulting leg covector are the modification used in #cite(label("AGKRRV")) §§20.4–20.6. We prove the derivative assertions explicitly.
  #emph[The two tangent spaces.] In the input frame put
  $ L = frak(g) \[ \[ t \] \] \, #h(2em) L' = "Ad" \( lambda \( t \) \) L \, #h(2em) I = L ∩ L' . $
  Let $frak(g)_j$ be the weight-$j$ space for the algebraic $bb(G)_m$-action defined by $lambda$. The integers $j$ denote characters of $bb(G)_m$, without reduction modulo $p$. Then
  #[#set math.equation(numbering: n => "(4.4)")
   $ L' & = xor.big_j t^j frak(g)_j \[ \[ t \] \] \,\
P_1 := L \/ I & = xor.big_(j > 0) frak(g)_j ⊗_k k \[ \[ t \] \] \/ \( t^j \) \,\
P_2 := L' \/ I & = xor.big_(j < 0) frak(g)_j ⊗_k \( t^j k \[ \[ t \] \] \/ k \[ \[ t \] \] \) . $ <hecke:weight-quotients>]
  An infinitesimal disc automorphism $1 + epsilon.alt D$, $D in L$, acts on the output lattice while fixing $\( P \, x \)$. Its stabilizer tangent is $I$. The orbit is smooth, and the root formula gives $dim_k \( L \/ I \) = m$, so this computes its full tangent. The same argument with the output fixed gives
  #[#set math.equation(numbering: n => "(4.5)")
   $ T_h H_(P \, x)^(upright("in")) = P_1 \, #h(2em) T_h H_(P' \, x)^(upright("out")) = P_2 . $ <hecke:tangents>]
  The notation $1 + epsilon.alt D$ uses the canonical identification of the kernel over dual numbers with the Lie algebra; no exponential map is required.
  There is a perfect pairing
  #[#set math.equation(numbering: n => "(4.6)")
   $ beta : P_1 times P_2 arrow.r k \, #h(2em) beta \( D \, C \) = "Res"_(t = 0) kappa \( D \, C \) thin d t . $ <hecke:residue-pairing>]
  Indeed, $L$ is its own annihilator for the residue pairing on $frak(g) \( \( t \) \)$, and invariance of $kappa$ gives the same assertion for $L'$. Thus the pairing descends to the displayed quotients. More explicitly, $kappa$ pairs $frak(g)_j$ perfectly with $frak(g)_(- j)$; the coefficient of $t^a$ in the first space, for $0 lt.eq a < j$, pairs with the coefficient of $t^(- a - 1)$ in the second. This proves perfection, including when some $j$ is divisible by $p$.
  #emph[Transport of the covector and motion of the leg.] Choose the gluing sign convention in which an infinitesimal transition $1 + epsilon.alt C$ gives the boundary class of the principal part $C$. Serre duality pairs this class with $A$ by $"Res" kappa \( a \, C \) thin d t$. For an output-fixed tangent $C in L'$, this residue is zero, since $a in L'$ and $L'$ is self-annihilating. Consequently $d p_h^(*) A$ vanishes in the $q$-relative cotangent, so it is $d q_h^(*) theta$ for a unique covector $theta$.
  Its bundle component is $A'$. To check this, choose a point $x' eq.not x$ and vary both bundle transitions there while leaving the modification at $x$ unchanged. Principal parts at $x'$ surject onto $H^1 \( X \, frak(g)_(P') \)$: for sufficiently large $N$, Serre vanishing gives $H^1 \( X \, frak(g)_(P') \( N x' \) \) = 0$. The pairings on these directions agree because $A = A'$ near $x'$. Write therefore $theta = \( A' \, xi \)$.
  Now keep the input bundle fixed and move the leg from $t = 0$ to $t = epsilon.alt$. The output transition becomes $g_epsilon.alt = lambda \( t - epsilon.alt \)$, and its first-order displacement is
  $ \( delta g \) g^(- 1) = - frac(d lambda, t) . $
  Evaluating the cotangent identity on this motion yields
  $ 0 = - kappa \( a \( 0 \) \, d lambda \) + xi \( partial_t \) \, #h(2em) xi = kappa \( a \( 0 \) \, d lambda \) thin d t \|_x eq.not 0 . $
  This is also the residue formula of #cite(label("AGKRRV")) Equation (20.20). Reversing the gluing boundary convention would reverse the common sign and would leave all subsequent assertions unchanged.
  #emph[The first relative derivative.] The section $S_A$ is defined along the entire fixed-input fiber, using its specified identification with $P$. Its value at $h$ is zero by the preceding calculation. For $D in L$, deform the output lattice to
  $ L'_epsilon.alt = "Ad" \( 1 + epsilon.alt D \) L' . $
  A test vector $C in L'$ extends as $C_epsilon.alt = "Ad" \( 1 + epsilon.alt D \) C$ in the deformed lattice. The input field remains the fixed $a \( t \) thin d t$. Differentiating the residue pairing gives
  #[#set math.equation(numbering: n => "(4.7)")
   $ chevron.l \( d S_A \)_h \( D med mod med I \) \, C med mod med I chevron.r & = "Res" kappa \( a \, \[ D \, C \] \) thin d t\
 & = "Res" kappa \( \[ a \, D \] \, C \) thin d t = beta \( "ad" \( a \) D \, C \) . $ <hecke:derivative>]
  Because $S_A \( h \) = 0$, this derivative is independent of how the test vector is extended. Also $"ad" \( a \)$ preserves $L$, $L'$, and $I$, so the formula is independent of representatives.
  It remains to prove invertibility. The operator $"ad" \( a \( t \) \)$ preserves every weight summand in (4.4). Since $lambda$ is central in $M$, each nonzero weight space injects as an invariant summand into $frak(g) \/ frak(m)$. Its endomorphism induced by $"ad" \( a \( 0 \) \)$ is therefore invertible by (4.3). The determinant of the corresponding $k \[ \[ t \] \]$-linear block is a unit. It follows that $"ad" \( a \( t \) \)$ is invertible on every truncated summand of $P_1$ and $P_2$. Equation (4.7), together with the perfect pairing (4.6), now proves that $\( d S_A \)_h : P_1 arrow.r P_2^(*)$ is an isomorphism. No regularity of $lambda$ outside $M$ is required; any additional zero-weight directions do not occur in these quotients.
  #emph[The reverse derivative.] The value of $S_(A')$ at $h$ is zero because $a in L$ and $L$ is self-annihilating. Keeping the output fixed, vary the input lattice by $C in L'$ and extend a test vector $D in L$ to $"Ad" \( 1 + epsilon.alt C \) D$. The same calculation, with the same gluing convention, gives
  $ chevron.l \( d S_(A') \)_h \( C med mod med I \) \, D med mod med I chevron.r = "Res" kappa \( a \, \[ C \, D \] \) thin d t = "Res" kappa \( \[ a \, C \] \, D \) thin d t . $
  Invertibility on $P_2$ and residue duality prove the second assertion. Both sections are sections of rank-$m$ vector bundles on smooth $m$-dimensional fibers. Their invertible derivatives make their zeros at $h$ reduced and isolated.
  When $m = 0$, both tangent spaces are zero and both derivatives are isomorphisms between zero spaces. The smooth zero-dimensional fibers already isolate $h$, and the moving-leg computation still applies. Thus the conclusion includes central modifications and torus factors. ◻
]

The proposition gives both kinds of control needed below: the nonzero leg covector makes a suitable hypersurface smooth over the output bundle, while the two relative derivatives isolate one point and produce the quadratic coordinates around it.

== 5 Two Hecke correspondences and a quadratic test <sec:twohecke>

We now convert the Hecke vanishing of Lemma 7 into a local test for a non-nilpotent cotangent direction. The first Hecke correspondence supplies a proper pushforward. The second makes its pullback vanish, while the two transverse sections of Proposition 15 isolate one stalk and identify its neighborhood with a split quadratic equation. The next section will use a projective quadric to remove the extra variables in this equation.

#thm([Proposition 5.1.])[
  (Vanishing at the quadratic vertex).  #emph[Let $F in "Shv" \( cal(B)_K \)$ be the object of Proposition 6, with the vanishings of Lemma 7. Let $b : U arrow.r cal(B)$ be a smooth chart, where $U$ is a scheme of finite type over $S$. Let $f in cal(O) \( U \)$ and $u in U_s \( k \)$ satisfy $f \( u \) = 0$. Suppose 
$ d f_u = b^(*) A quad upright("for a non-nilpotent ") A in T_(b \( u \))^(*) cal(B)_s . $

 Then there exist $x in cal(X)_s \( k \)$ and an integer $m gt.eq 0$ with the following property. Put $T = U times_S cal(X)$, let $F_T$ be the pullback of $F_U = b_K^(*) F$, and set 
$ Q^a = {sum_(i = 1)^m u_i v_i + f = 0} subset T times_S bb(A)_S^(2 m) \, #h(2em) tau : Q^a arrow.r T . $

 Here $u_i \, v_i$ are affine coordinates, distinct from the point $u$, and $f$ is pulled back from $U$. At the point $nu = \( u \, x \, 0 \, 0 \)$ one has 
#[#set math.equation(numbering: n => "(5.1)")
 $ #scale(x: 120%, y: 120%)[\(] Psi_(Q^a) \( tau_K^(*) F_T \) #scale(x: 120%, y: 120%)[\)]_nu = 0 . $ <eq:two-vertex>]

 When $m = 0$, this is the vanishing on $Q^a = V \( f \) times_S cal(X)$.]
] <two:vertex>

#proof[
  Choose the modification $h$, its leg $x$, its orbit dimension $m$, and $theta = \( A' \, xi \)$ from Proposition 15. Thus
  #[#set math.equation(numbering: n => "(5.2)")
   $ p^(*) A = q^(*) theta quad upright("at ") h \, #h(2em) xi eq.not 0 . $ <eq:two-cotangent>]
  We use the exact-position correspondence $H = H^lambda$, its proper bound $overline(H)$, and its generic Satake integrand $cal(I)_K$ from Lemma 14. On $H_K$ this integrand is $p_K^(*) F$ tensored with a fixed invertible shift and Tate line. Such a factor does not affect vanishing; we suppress it after restricting to the open orbit.
  ===== 5.1 A proper fiber with zero cohomology. <a-proper-fiber-with-zero-cohomology.>
  Write $D = V \( f \)$. Take two copies $H_1 \, H_2$ of $H$ and form
  $ W_0 = H_2 times_(p_2 \, cal(B) \, b) U \, #h(2em) W = H_2 times_(cal(B)) D subset W_0 . $
  Both map to $cal(Z) = cal(B) times_S cal(X)$ through $q_2 = \( o_2 \, ell_(H_2) \)$. The map $W_0 arrow.r cal(Z)$ is smooth: its projection to $H_2$ is the base change of $b$, and $q_2$ is smooth. At $w = \( h \, u \)$ the differential of the equation cutting out $W$ is the pullback of $theta$ by (5.2). Its relative differential over the output bundle stack is nonzero, because the leg component is $xi eq.not 0$. The smooth hypersurface criterion therefore makes $W arrow.r cal(B)$ by the output bundle smooth near $w$. The arbitrary-leg assertion of Lemma 7 gives
  #[#set math.equation(numbering: n => "(5.3)")
   $ #scale(x: 120%, y: 120%)[\(] Psi_W \( q_(2 \, K)^(*) upright(H)_V \( F \) \) #scale(x: 120%, y: 120%)[\)]_w = 0 . $ <eq:two-hecke-zero>]
  This uses smoothness only of the projection to the bundle stack.
  The two fiber products used below are
  $ P = H_1 times_(cal(Z)) W_0 \, #h(2em) P_D = H_1 times_(cal(Z)) W subset overline(P)_D = overline(H)_1 times_(cal(Z)) W . $
  The following squares are cartesian; the second vertical map $pi$ is proper. In the first square, $Delta$ repeats the modification in the two factors.
  #cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$P$])
  content((2.321, 0), [$H_1$])
  content((0, -1.585), [$W_0$])
  content((2.321, -1.585), [$cal(Z)$])
  line((0.336, 0), (1.853, 0), mark: (end: ">"))
  line((0, -0.2725), (0, -1.313), mark: (end: ">"))
  line((2.321, -0.2725), (2.321, -1.313), mark: (end: ">"))
  content((2.74, -0.7927), [#text(size: 0.73em)[$q_1$]])
  line((0.468, -1.585), (1.985, -1.585), mark: (end: ">"))
  content((1.227, -1.812), [#text(size: 0.73em)[$q_2$]])
  bezier((0, -1.313), (0, -0.2725), (-0.2498, -0.9932), (-0.2498, -0.5922), mark: (end: ">"))
  content((-0.4615, -0.7927), [#text(size: 0.73em)[$Delta$]])
})
#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$overline(P)_D$])
  content((2.321, 0), [$overline(H)_1$])
  content((0, -1.585), [$W$])
  content((2.321, -1.585), [$cal(Z) .$])
  line((0.468, 0), (1.853, 0), mark: (end: ">"))
  line((0, -0.2725), (0, -1.313), mark: (end: ">"))
  content((-0.2741, -0.7927), [#text(size: 0.73em)[$pi$]])
  line((2.321, -0.2725), (2.321, -1.313), mark: (end: ">"))
  content((2.74, -0.7927), [#text(size: 0.73em)[$overline(q)_1$]])
  line((0.336, -1.585), (1.919, -1.585), mark: (end: ">"))
  content((1.128, -1.812), [#text(size: 0.73em)[$q_2$]])
})
$#h(2em)$
  Write $c : P arrow.r U$ for the map through $W_0$, and $a : P arrow.r cal(B)$ for the input map $p_1$. Thus $a$ records the first input, from which the sheaf is pulled back, while $c$ records the second input in $U$, on which we impose $f = 0$. The distinguished point is $z = \( h \, h \, u \) in P_D \( k \)$. All these fiber products are algebraic spaces, because the fixed-side Hecke maps are representable.
  Let $overline(cal(I))_K$ be the pullback of the Satake integrand to $\( overline(P)_D \)_K$. Proper base change on the generic fiber identifies
  $ R pi_(K \, *) overline(cal(I))_K tilde.eq q_(2 \, K)^(*) upright(H)_V \( F \) . $
  Apply proper compatibility of specialization and then proper base change at $w$ to (5.3). With
  $ Z_w = pi^(- 1) \( w \) \, #h(2em) cal(K) = #scale(x: 120%, y: 120%)[\(] Psi_(overline(P)_D) overline(cal(I))_K #scale(x: 120%, y: 120%)[\)] \|_(Z_w) \, $
  we obtain
  #[#set math.equation(numbering: n => "(5.4)")
   $ R Gamma \( Z_w \, cal(K) \) = 0 . $ <eq:two-fiber-zero>]
  The space $Z_w$ is the proper bounded Hecke fiber with output bundle and leg fixed, including their identifications.
  ===== 5.2 Isolating the distinguished stalk. <isolating-the-distinguished-stalk.>
  The map $a : P arrow.r cal(B)$ is smooth: $P arrow.r H_1$ is the base change of $W_0 arrow.r cal(Z)$, and $p_1$ is smooth. At a point $\( h_1 \, w \)$ in the exact-position part of $Z_w$, the differential of $f \( c \)$ is the pullback of $q_1^(*) theta$. If its relative differential over $cal(B)$ is zero, smooth cotangent injectivity for $P arrow.r H_1$ implies that $q_1^(*) theta$ comes from the input cotangent under $p_1$. Pass further to the relative cotangent for $tilde(p)_1 = \( p_1 \, ell_(H_1) \)$. The leg term disappears, so the resulting necessary condition is
  $ S_(A') \( h_1 \) = 0 . $
  By Proposition 15, this section has an isolated zero at $h$ on the fixed-output-and-leg fiber. Consequently $P_D arrow.r cal(B)$ by $a$ is smooth at every point of a punctured neighborhood of $z$ in $Z_w$. On the exact-position open, the generic integrand is $a_K^(*) F$. Lemma 7 therefore gives an open neighborhood $O$ of $z$ in $Z_w$ such that
  $ cal(K) \|_(O \\ { z }) = 0 . $
  This local vanishing prevents cancellation with the boundary of the Hecke bound. Indeed, put $C_w = Z_w \\ O$ with its reduced structure. The closed subsets ${ z }$ and $C_w$ are disjoint. Open–closed localization identifies $cal(K)$ with its restriction to their union, extended by zero. Hence
  $ cal(K) tilde.eq i_(z \, *) cal(K)_z xor i_(C_w \, *) i_(C_w)^(*) cal(K) \, #h(2em) R Gamma \( Z_w \, cal(K) \) tilde.eq cal(K)_z xor R Gamma \( C_w \, i_(C_w)^(*) cal(K) \) . $
  The residue field of $z$ is algebraically closed, so the first cohomology summand is exactly its stalk complex. Equation (5.4) forces that summand to vanish. Removing the invertible Satake normalization gives
  #[#set math.equation(numbering: n => "(5.5)")
   $ #scale(x: 120%, y: 120%)[\(] Psi_(P_D) \( a_K^(*) F \) #scale(x: 120%, y: 120%)[\)]_z = 0 . $ <eq:two-isolated-zero>]
  No formula for the Satake kernel on the boundary has been used.
  ===== 5.3 A chart lift along the whole diagonal. <a-chart-lift-along-the-whole-diagonal.>
  To interpret (5.5), we next identify both the local space and its sheaf. The diagonal $Delta tilde.eq W_0 subset P$ is a section of the separated smooth map $P arrow.r W_0$ of relative dimension $m$. It is therefore a closed regular immersion near $z$. On $Delta$ there is a specified isomorphism $b c tilde.eq a$, coming from the two identical modifications.
  We claim that, after an #emph[étale] replacement of $P$ near $z$, there is a map $r : P arrow.r U$ with an isomorphism
  #[#set math.equation(numbering: n => "(5.6)")
   $ b r tilde.eq a \, #h(2em) r \|_Delta = c \|_Delta \, $ <eq:two-chart-lift>]
  whose restriction to $Delta$ is the specified isomorphism. For this, form the smooth space $E_P = P times_(a \, cal(B) \, b) U arrow.r P$. The given diagonal data define a section over $Delta$. First take an étale scheme neighborhood in $P$. Since $cal(B)$ has affine diagonal by the representability statement in Section 2, $E_P arrow.r P times_S U$ is affine, so $E_P$ is a scheme as well. Near the section point, smooth coordinates give an étale map $E_P arrow.r bb(A)_P^e$ #cite(label("Stacks")) Tag 039P. After shrinking, the section over the closed diagonal lands in this coordinate neighborhood. Extend its coordinate functions from $Delta$ to $P$, and pull back the étale map along the extended tuple. This gives an étale neighborhood of $P$ with a map to $E_P$. Its inverse image of $Delta$ contains the open branch specified by the original section. Remove the closed complement of this branch in that inverse image. The retained diagonal is the prescribed one, and the map to $E_P$ proves (5.6), including its isomorphism of bundles. We retain the notation $P \, Delta \, z$.
  ===== 5.4 Exact quadratic coordinates. <exact-quadratic-coordinates.>
  After shrinking $U$, suppose that $U \/ S$ has constant relative dimension $N$. The map
  $ Delta arrow.r T = U times_S cal(X) \, #h(2em) \( c \, upright("leg") \) \, $
  is smooth of relative dimension $m$. Thus $T$, $Delta$, and $P$ are smooth over $S$ of relative dimensions
  $ N + 1 \, #h(2em) N + 1 + m \, #h(2em) N + 1 + 2 m \, $
  respectively. Choose generators $v_1 \, dots.h \, v_m$ of the diagonal ideal whose classes form a conormal frame. Under the identification with $Omega_(P \/ W_0) \|_Delta$, the classes $d v_i$ form a basis. Because $r = c$ on $Delta$, there exist regular functions $u_1 \, dots.h \, u_m$ with the #emph[exact] identity
  #[#set math.equation(numbering: n => "(5.7)")
   $ f \( c \) - f \( r \) = sum_(i = 1)^m u_i v_i . $ <eq:two-exact-quadratic>]
  The restrictions $u_i \|_Delta$ are determined by the conormal class of the left side.
  Consider the entire local diagonal fiber $Delta_(\( u \, x \))$ on the special fiber. It parametrizes modifications with the input bundle $b \( u \)$, its identification, and the leg $x$ fixed. The relative differential of $f \( c \)$ for $P arrow.r W_0$ is zero. On this diagonal fiber, the relative differential of $f \( r \)$ is induced by $d f_u = b^(*) A$: the restriction $r \|_(Delta_(\( u \, x \)))$ is constant with value $u$, and the bundle isomorphism in (5.6) is the canonical one along the whole diagonal. The conormal coefficient section in (5.7) is therefore
  #[#set math.equation(numbering: n => "(5.8)")
   $ sum_i \( u_i \|_Delta \) \[ d v_i \] = - S_A quad upright("on ") Delta_(\( u \, x \)) . $ <eq:two-coefficients>]
  In particular, $u_i \( z \) = 0$, and the derivative of the tuple $\( u_i \|_Delta \)$ is an isomorphism on $T_z Delta_(\( u \, x \))$, by Proposition 15. The equality on the whole fiber in (5.8) is what supplies this derivative; equality only at $z$ would not suffice.
  Now define
  $ Phi = \( r \, upright("leg") \, u_1 \, dots.h \, u_m \, v_1 \, dots.h \, v_m \) : P arrow.r T times_S bb(A)_S^(2 m) . $
  Its relative differential at $z$ is an isomorphism. Indeed, a tangent vector in its kernel is first killed by every $d v_i$, so lies in $T_z Delta$. Its $\( d r \, d upright("leg") \)$ component then places it in $T_z Delta_(\( u \, x \))$. Finally the derivative isomorphism in (5.8) forces the vector to be zero. The source and target are smooth over $S$ with the same relative dimension $N + 1 + 2 m$, so this injective differential is an isomorphism. The relative Jacobian criterion makes $Phi$ étale at $z$.
  By (5.7), the cut $P_D = V \( f \( c \) \)$ is the exact inverse image of $Q^a$ under $Phi$. Therefore the induced map $Phi_D : P_D arrow.r Q^a$ is étale near $z$, taking $z$ to $nu$. Moreover, (5.6) identifies
  $ a_K^(*) F tilde.eq r_K^(*) F_U tilde.eq Phi_(D \, K)^(*) tau_K^(*) F_T quad upright("on ") \( P_D \)_K . $
  Thus this coordinate map identifies the actual generic sheaf as well as the equation. Étale base change transforms (5.5) into (5.1).
  If $m = 0$, the diagonal is open near $z$, the sum in (5.7) is empty, and the same argument gives $Q^a = D times_S cal(X)$. In that case smooth base change along $D times_S cal(X) arrow.r D$ already yields $\( Psi_D \( F_U \|_(D_K) \) \)_u = 0$. ◻
]

The argument produced exact étale coordinates over the trait. It used no division by $2$ and no assertion about singular support in mixed characteristic. Its output for $m > 0$ is a vanishing on the quadratic test space; we next recover the vanishing on $D$ itself.

== 6 From quadratic models to transverse slices <sec:slices>

The local model in Proposition 16 gives a vanishing statement at the vertex of an affine quadric. We first recover the corresponding hypersurface test by a proper compactification. The cone of the hyperplane-class map is a shifted constant Tate line supported on $f = 0$. After tensoring this comparison with the ambient sheaf, the hyperplane terms have zero nearby cycles by the smooth-chart vanishing. Vanishing on the whole proper quadric fiber then forces vanishing on the hypersurface. A second proper comparison, using projective incidence, gives tests of arbitrary codimension.

=== 6.1 The projective quadric comparison <the-projective-quadric-comparison>

#thm([Lemma 6.1.])[
  (Quadric comparison).  #emph[Let $K_0$ be an algebraically closed field of characteristic different from $ell$, let $E = overline(bb(Q))_ell$, and let $B$ be a finite-type $K_0$-scheme. For $f in Gamma \( B \, cal(O)_B \)$ put $i : D = V \( f \) arrow.r.hook B$. If $m gt.eq 1$, consider 
$ g : Q_f = {sum_(a = 1)^m u_a v_a + f w^2 = 0} subset bb(P)_B^(2 m) arrow.r B . $

 The powers of the hyperplane class define a distinguished triangle 
#[#set math.equation(numbering: n => "(6.1)")
 $ xor.big_(j = 0)^(2 m - 1) E_B \( - j \) \[ - 2 j \] arrow.r R g_(*) E_(Q_f) arrow.r i_(*) E_D \( - m \) \[ - 2 m \] arrow.r (xor.big_(j = 0)^(2 m - 1) E_B \( - j \) \[ - 2 j \]) \[ 1 \] . $ <eq:slice-quadric-triangle>]

 The identification of its third term with the displayed Tate line requires only a choice of generator of a fixed one-dimensional vector space. Neither $B$ nor $D$ is required to be smooth or reduced.]
] <slice:quadric>

#proof[
  Write $h = c_1 \( cal(O)_(Q_f) \( 1 \) \) in H^2 \( Q_f \, E \( 1 \) \)$. Adjunction applied to each $h^j$ gives the displayed morphism from $E_B \( - j \) \[ - 2 j \]$ to $R g_(*) E_(Q_f)$. Denote the cone of their direct sum by $cal(K)$, and write $j_B : B \\ D arrow.r.hook B$.
  We recall the elementary cohomology calculation that controls this map. We use the projective-space and projective-bundle calculations of #cite(label("MilneEtale")) Example 16.3 and Theorem 23.2, together with localization. A split smooth projective quadric of dimension $n$ has no odd cohomology, and has one copy of $E \( - r \)$ in degree $2 r$ for $0 lt.eq r lt.eq n$, with an additional copy when $n$ is even and $r = n \/ 2$. One obtains the calculation inductively by writing its equation as $x_0 x_1 + q' \( x_2 \, dots.h \) = 0$. The locus $x_0 eq.not 0$ is $bb(A)^n$; its complement is the projective cone over the split quadric of dimension $n - 2$. Removing the vertex of that cone gives a line bundle over the smaller quadric. This yields a filtration by affine cells, with one cell of every dimension $0 \, dots.h \, n$ and a second middle-dimensional cell when $n$ is even. The initial cases are a conic, isomorphic to $bb(P)^1$, and the split zero-dimensional quadric, consisting of two points. Localization and $R Gamma_c \( bb(A)^r \, E \) = E \( - r \) \[ - 2 r \]$ give the asserted groups. On a smooth quadric of positive dimension, the top hyperplane power has degree $2$, so is nonzero in $E$. All lower hyperplane powers are therefore nonzero as well.
  Over $B \\ D$, the geometric fibers of $g$ are smooth quadrics of odd dimension $2 m - 1$. The preceding calculation shows that the hyperplane-power map is an isomorphism on their cohomology. Proper base change therefore gives $j_B^(*) cal(K) = 0$.
  Over $D$ the family, together with its hyperplane line bundle, is the product with
  $ V_m = {sum_(a = 1)^m u_a v_a = 0} subset bb(P)_(K_0)^(2 m) . $
  Let $e = \[ 0 : dots.h.c : 0 : 1 \]$ be its vertex. Projection away from $e$ identifies $V_m \\ { e }$ with the total space of a line bundle over the split smooth quadric
  $ C_m = {sum_(a = 1)^m u_a v_a = 0} subset bb(P)_(K_0)^(2 m - 1) . $
  Compactly supported cohomology of this line bundle and localization at the vertex give
  #[#set math.equation(numbering: n => "(6.2)")
   $ H^0 \( V_m \, E \) = E \, #h(2em) H^1 \( V_m \, E \) = 0 \, #h(2em) H^r \( V_m \, E \) = H^(r - 2) \( C_m \, E \) \( - 1 \) quad \( r gt.eq 2 \) . $ <eq:slice-cone-cohomology>]
  Thus $V_m$ has the cohomology of $bb(P)^(2 m - 1)$ with one extra copy of $E \( - m \)$ in degree $2 m$.
  The hyperplane powers remain nonzero on $V_m$. To check the top one without a smoothness assertion about $V_m$, resolve the vertex by the projective line bundle
  $ pi : tilde(V)_m = bb(P)_(upright("lines") \, C_m) \( cal(O)_(C_m) \( - 1 \) xor cal(O)_(C_m) \) arrow.r C_m . $
  Here the subscript specifies that the projective bundle parameterizes lines. The inclusion of $cal(O)_(C_m) \( - 1 \) xor cal(O)_(C_m)$ into the trivial vector bundle with fiber $K_0^(2 m) xor K_0$ defines $tilde(V)_m arrow.r V_m$; its fiber over a point of $C_m$ parameterizes the projective line joining that point to $e$. If $zeta$ is the pullback of the hyperplane class and $h_C = c_1 \( cal(O)_(C_m) \( 1 \) \)$, the projective bundle relation is $zeta^2 = pi^(*) h_C thin zeta$ #cite(label("MilneEtale")) §23. Hence
  $ integral_(tilde(V)_m) zeta^(2 m - 1) = integral_(C_m) h_C^(2 m - 2) = 2 . $
  It follows that the top hyperplane power on $V_m$ is nonzero. Multiplication gives the same conclusion for every lower power. This includes $m = 1$: $C_1$ consists of two points, $V_1$ consists of two projective lines meeting at $e$, and the resolution is the disjoint union of those lines. The hyperplane class has degree $1$ on each component.
  Consequently the cone of the vector-space morphism
  $ xor.big_(j = 0)^(2 m - 1) E \( - j \) \[ - 2 j \] arrow.r R Gamma \( V_m \, E \) $
  has exactly one nonzero cohomology group, a copy of $E \( - m \)$ in degree $2 m$. Injectivity in every degree, established by the nonvanishing of the hyperplane powers, rules out any additional cohomology group in the cone. The cone is therefore isomorphic to $E \( - m \) \[ - 2 m \]$.
  Proper base change identifies $i^(*) cal(K)$ with the constant pullback of this vector-space cone: both the family over $D$ and its hyperplane-power morphism are pulled back from $V_m$. Finally, open–closed localization gives
  $ \( j_B \)_(!) j_B^(*) cal(K) arrow.r cal(K) arrow.r i_(*) i^(*) cal(K) arrow.r . $
  Since its first term vanishes, this identifies $cal(K) tilde.eq i_(*) E_D \( - m \) \[ - 2 m \]$, proving (6.1). In particular, the third term is constant along $D$; no middle-cohomology local system is left unidentified. Localization and proper base change hold with finite coefficients #cite(label("Stacks")) Tags 095L and 0DDE and in their adic forms #cite(label("Stacks")) Tags 09AH and 09C9; we use these compatibilities after inverting $ell$ and extending coefficients to $E$. ◻
]

#prodef([Remark 6.2.])[
  Lemma 17 uses rational coefficients, including when $ell = 2$. Its hyperplane-power comparison need not be an isomorphism off $D$ with $bb(Z) \/ 2^a$ coefficients: on a smooth conic the hyperplane class has degree $2$. We use finite coefficients to construct the usual cohomological compatibilities, then use (6.1) after rationalization. This imposes no restriction on the residue characteristic. The case $m = 0$ will be handled directly below; formally the projective model is then $Q_f = D subset bb(P)_B^0$ and the hyperplane sum is empty.
] <rem:slice-rational-coefficients>

=== 6.2 The hypersurface test <the-hypersurface-test>

We return to the trait $S$, the bundle stack $cal(B)$, and the compact constructible object $F in cal(D)_C$ of Proposition 6. For a smooth finite-type chart $b : U arrow.r cal(B)$, put $F_U = b_K^(*) F$. Denote by $cal(N)_U subset T^(*) U_s$ the image of the global nilpotent cone under smooth cotangent pullback.

#thm([Proposition 6.3.])[
  (Hypersurface test).  #emph[Let $b : U arrow.r cal(B)$ be smooth, with $U$ a finite-type $S$-scheme. Let $f$ be a regular function on $U$, let $D = V \( f \)$, and let $u in D_s \( k \)$. If 
$ d \( f_s \)_u in.not \( cal(N)_U \)_u \, $

 then 
$ #scale(x: 120%, y: 120%)[\(] Psi_D \( F_U \|_(D_K) \) #scale(x: 120%, y: 120%)[\)]_u = 0 . $

]
] <slice:hypersurface>

#proof[
  If $d \( f_s \)_u$ is not in the image of $T_(b \( u \))^(*) cal(B)_s$, its image in the relative cotangent space for $b$ is nonzero. The smooth hypersurface criterion shows that $D arrow.r cal(B)$ is smooth near $u$. Lemma 7 then gives the assertion.
  Otherwise $d \( f_s \)_u = b^(*) A$ for a non-nilpotent covector $A in T_(b \( u \))^(*) cal(B)_s$. Proposition 16 provides a point $x in cal(X)_s \( k \)$ and an integer $m gt.eq 0$ with the following property. Set
  $ T = U times_S cal(X) \, #h(2em) t_0 = \( u \, x \) \, #h(2em) D_T = D times_S cal(X) \, $
  and let $F_T$ be the pullback of $F_U$ to $T_K$. For the affine quadric over $T$
  $ Q^a = {sum_(a = 1)^m u_a v_a + f = 0} subset T times_S bb(A)_S^(2 m) \, $
  the nearby cycles of the pullback of $F_T$ vanish at $\( t_0 \, 0 \, 0 \)$. The symbols $u_a$ here are affine coordinates, distinct from the fixed point $u in U_s$. If $m = 0$, this affine model is $D_T$ itself. Smooth compatibility for $D_T arrow.r D$ immediately gives the desired vanishing.
  Suppose $m gt.eq 1$ and compactify to
  $ g : Q_f = {sum_(a = 1)^m u_a v_a + f w^2 = 0} subset bb(P)_T^(2 m) arrow.r T . $
  The fiber over $t_0$ is the split cone of Lemma 17. At every point of this fiber other than its vertex, some $u_a$ or $v_a$ is nonzero. In the chart $u_a = 1$, for example, its equation solves uniquely for $v_a$, so $g$ is smooth there. This argument works also in characteristic $2$. Lemma 7 gives $Psi_T F_T = 0$, and smooth compatibility therefore gives vanishing of the nearby cycles of $g_K^(*) F_T$ at all these nonvertex points. The vertex lies in the chart $w = 1$, where its vanishing was supplied by Proposition 16.
  The nearby-cycle complex restricts to zero on the entire proper fiber. Proper compatibility and the projection formula give
  #[#set math.equation(numbering: n => "(6.3)")
   $ (Psi_T #scale(x: 120%, y: 120%)[\(] F_T ⊗ R g_(K *) E #scale(x: 120%, y: 120%)[\)])_(t_0) = 0 . $ <eq:slice-quadric-pushforward-zero>]
  Apply Lemma 17 on $T_K$ and tensor its triangle with $F_T$. The projection formula identifies the third term with
  $ i_(K *) \( F_T \|_(\( D_T \)_K) \) \( - m \) \[ - 2 m \] \, #h(2em) i : D_T arrow.r.hook T . $
  After applying $Psi_T$ and taking the stalk at $t_0$, the first term vanishes because $Psi_T F_T = 0$, and the second vanishes by (6.3). Proper compatibility for the closed immersion $i$ identifies the third term with
  $ #scale(x: 120%, y: 120%)[\(] Psi_(D_T) \( F_T \|_(\( D_T \)_K) \) #scale(x: 120%, y: 120%)[\)]_(t_0) \( - m \) \[ - 2 m \] . $
  It too vanishes. Smooth compatibility for $D_T arrow.r D$ completes the proof. ◻
]

The passage through the projective quadric uses no purity theorem for the possibly singular hypersurface $D$. It uses the actual closed-support term of the comparison triangle. We now use the same principle to impose several equations simultaneously.

=== 6.3 Projective incidence and higher codimension <projective-incidence-and-higher-codimension>

#thm([Lemma 6.4.])[
  (Incidence comparison).  #emph[Let $B$ be a finite-type scheme over an algebraically closed field of characteristic different from $ell$. Let $f_1 \, dots.h \, f_d$ be regular functions on $B$, where $d gt.eq 1$, and set $i : J = V \( f_1 \, dots.h \, f_d \) arrow.r.hook B$. For 
$ r : I = {sum_(a = 1)^d c_a f_a = 0} subset B times bb(P)^(d - 1) arrow.r B \, $

 the hyperplane powers give a distinguished triangle 
#[#set math.equation(numbering: n => "(6.4)")
 $ xor.big_(j = 0)^(d - 2) E_B \( - j \) \[ - 2 j \] arrow.r R r_(*) E_I arrow.r i_(*) E_J \( - \( d - 1 \) \) \[ - 2 \( d - 1 \) \] arrow.r (xor.big_(j = 0)^(d - 2) E_B \( - j \) \[ - 2 j \]) \[ 1 \] . $ <eq:slice-incidence-triangle>]

 For $d = 1$ the first term is zero and $I = J$.]
] <slice:incidence>

#proof[
  If $d = 1$, the equation in $B times bb(P)^0$ is $f_1 = 0$, so the stated triangle is immediate. Suppose $d gt.eq 2$. Off $J$, the map $cal(O)_B^d arrow.r cal(O)_B$ with coefficients $\( f_1 \, dots.h \, f_d \)$ is surjective. Its kernel is a vector bundle of rank $d - 1$, and $I$ is its projective bundle of lines. The powers of the restricted hyperplane class identify its direct image with the first term of (6.4). This can also be checked on geometric fibers by proper base change and the cohomology of $bb(P)^(d - 2)$.
  On $J$, the family is exactly $J times bb(P)^(d - 1)$ and its hyperplane class comes from the second factor. The restricted cone of the displayed morphism is therefore the constant top class $E_J \( - \( d - 1 \) \) \[ - 2 \( d - 1 \) \]$. The global cone vanishes off $J$, so open–closed localization identifies it with the pushforward of this restricted cone, proving the triangle. ◻
]

#thm([Proposition 6.5.])[
  (Higher-codimension test).  #emph[Let $b : U arrow.r cal(B)$ be smooth, with $U$ a finite-type $S$-scheme, and let $F_U = b_K^(*) F$ as above. Suppose that $u in U_s \( k \)$ and $f_1 \, dots.h \, f_d$ are regular functions vanishing at $u$. Assume that their special-fiber differentials at $u$ are linearly independent and that 
$ "span"_k { d \( f_(1 \, s) \)_u \, dots.h \, d \( f_(d \, s) \)_u } ∩ \( cal(N)_U \)_u = { 0 } . $

 Then, for $J = V \( f_1 \, dots.h \, f_d \)$, 
$ \( Psi_J \( F_U \|_(J_K) \) \)_u = 0 . $

 The assertion includes $d = 0$, with $J = U$.]
] <slice:higher>

#proof[
  For $d = 0$ the assertion is Lemma 7. For $d gt.eq 1$ form the proper incidence morphism
  $ r : I = {sum_(a = 1)^d c_a f_a = 0} subset U times_S bb(P)_S^(d - 1) arrow.r U . $
  Each affine projective-space chart in $U times_S bb(P)_S^(d - 1)$ is still smooth over $cal(B)$. On the chart $c_a = 1$, the hypersurface equation is $f_a + sum_(b eq.not a) c_b f_b = 0$. At a point $\( u \, \[ c \] \)$ its special-fiber differential is
  $ sum_(b = 1)^d c_b thin d \( f_(b \, s) \)_u . $
  Indeed its projective-parameter component is zero since every $f_b \( u \)$ is zero. The displayed combination is nonzero by linear independence, and lies outside $\( cal(N)_U \)_u$ by the hypothesis. The nilpotent cone on the product chart is the pullback of $cal(N)_U$ with zero parameter component. Proposition 19 therefore gives vanishing of the nearby cycles of $r_K^(*) F_U$ at every closed point over $u$.
  The restriction of this nearby-cycle complex to the projective fiber is constructible. A nonzero constructible cohomology sheaf on a finite-type scheme over $k$ has a nonzero stalk at a closed $k$-point. Thus the complex vanishes on the entire fiber. Proper compatibility gives
  $ \( Psi_U R r_(K *) r_K^(*) F_U \)_u = 0 . $
  Tensor the triangle of Lemma 20 on $U_K$ with $F_U$ and apply the projection formula. The first term is a finite sum of shifts and twists of $F_U$, the second is $R r_(K *) r_K^(*) F_U$, and the third is
  $ i_(K *) \( F_U \|_(J_K) \) \( - \( d - 1 \) \) \[ - 2 \( d - 1 \) \] \, #h(2em) i : J arrow.r.hook U . $
  After specialization and taking the stalk at $u$, the first two terms vanish. Proper compatibility for $i$ shows that the third is the corresponding shift and twist of $\( Psi_J \( F_U \|_(J_K) \) \)_u$, proving the result. For $d = 1$ the first sum is empty, so the same argument remains valid. ◻
]

We have obtained all finite transverse-slice tests while applying the hypersurface argument only on schemes smooth over $cal(B)$. The remaining task is to find one such slice on which the nonzero constructible object $F$ has a nonzero nearby-cycle stalk.

== 7 A finite slice of the support <sec:support>

We complete the proof by applying the slicing theorem to the support of $F$. First we arrange that a nonzero generic stalk specializes to the closed fiber. We then cut its support to a finite scheme over the trait. On such a scheme, geometric nearby cycles are a finite direct sum of stalk complexes, so they cannot vanish if one of those stalks is nonzero.

=== 7.1 Bringing a generic stalk to the closed fiber <bringing-a-generic-stalk-to-the-closed-fiber>

We use the bounded Hecke spaces of Section 4 to extend bundles. The argument applies to connected reductive groups, including those with a central torus.

#thm([Lemma 7.1.])[
  #emph[Let $cal(X) arrow.r "Spec" R$ be the smooth proper curve fixed in Section 2, and let $K$ be the fixed algebraic closure of $"Frac" \( R \)$. Every $G$-bundle on $cal(X)_K$ extends to a $G$-bundle on $cal(X)_(R')$ for some finite extension $"Frac" \( R' \) \/ "Frac" \( R \)$ inside $K$, where $R'$ is the integral closure of $R$ in that extension.]
] <support:extension>

#proof[
  Let $cal(P)_K$ be the bundle. By #cite(label("DrinfeldSimpson")) Theorem 2 and Remark 2(b), it is trivial on a nonempty open subset of $cal(X)_K$. Here Theorem 2 applies to connected reductive groups, and the base field $K$ is algebraically closed. Choose a trivialization away from distinct points $x_1 \, dots.h \, x_r in cal(X) \( K \)$. Gluing at these points gives a chain of one-point modifications
  $ cal(P)_0 arrow.r.dashed cal(P)_1 arrow.r.dashed dots.h.c arrow.r.dashed cal(P)_r = cal(P)_K \, #h(2em) cal(P)_0 upright(" trivial") \, $
  whose $i$th modification has leg $x_i$. Choose a Schubert bound for each of the finitely many relative positions in this chain.
  Starting with the trivial bundle over $S = "Spec" R$, form the space of chains satisfying these bounds, allowing the legs to vary on $cal(X)$. At each stage the bounded Hecke space is representable and proper over the preceding bundle and its new leg. Since $cal(X) arrow.r S$ is proper, induction shows that the space of chains is a proper algebraic space of finite type over $S$. It carries the universal final bundle and contains the chosen chain as a $K$-point. This point descends to a finite extension of $"Frac" \( R \)$: the space is of finite type and $K$ is algebraic over that field. The valuative criterion extends the descended point over $R'$, and the universal final bundle gives the required extension. The construction allows the legs to coincide on the closed fiber, since it uses successive one-point modifications. ◻
]

Suppose now that a spectral component is missing, and let $F$ be the nonzero compact object supplied by Proposition 6. It is constructible on finite-type smooth charts. There is therefore a $K$-valued bundle at which its stalk is nonzero: a nonzero constructible complex on a finite-type scheme over $K$ has a nonzero stalk at a closed $K$-point. Apply Lemma 22 to this bundle and replace $R$ by the resulting $R'$. All specialization statements from Section 2 remain valid with the same geometric generic field $K$.

Choose a finite-type smooth affine chart $b : U arrow.r cal(B)$ through the special value of the extended bundle. The fiber product of this chart with its trait section is smooth over $S$ and has a $k$-point. It has an $R$-point lifting that $k$-point. Indeed, after taking an affine étale neighborhood if needed, formal smoothness gives compatible lifts modulo every power of the uniformizer, and completeness of $R$ gives an $R$-point of the affine scheme. Thus the trait section lifts to $U$. After shrinking around its closed point, we may suppose that $U \/ S$ has constant relative dimension $N$. The generic stalk of $F_U = b_K^(*) F$ on the lifted section is nonzero, so its support has closure meeting $U_s$.

=== 7.2 A slice with nonzero nearby cycles <a-slice-with-nonzero-nearby-cycles>

The remaining argument uses only the dimension of a cone in the special-fiber cotangent bundle. We state it separately to make clear that the support strata, rather than the sheaf, are the objects descended to a finite field extension.

#thm([Lemma 7.2.])[
  #emph[Let $R$ be a complete discrete valuation ring with algebraically closed residue field $k$ of characteristic different from $ell$, let $S = "Spec" R$, and let $K$ be an algebraic closure of its fraction field. Let $U \/ S$ be a smooth affine scheme of constant relative dimension $N$, let $cal(F)$ be a bounded constructible $E$-complex on $U_K$, and let $Lambda subset T^(*) U_s$ be a closed conical subset with $dim Lambda lt.eq N$. Suppose that the closure in $U$ of the nonzero-stalk locus of $cal(F)$ meets $U_s$. Then, after a finite extension of the trait and shrinking $U$, there exist $u in U_s \( k \)$, an integer $0 lt.eq d lt.eq N$, and functions $f_1 \, dots.h \, f_d$ vanishing at $u$ such that their special-fiber differentials are independent, 
$ "span" { d \( f_(1 \, s) \)_u \, dots.h \, d \( f_(d \, s) \)_u } ∩ Lambda_u subset.eq { 0 } \, $

 and, for $J = V \( f_1 \, dots.h \, f_d \)$, 
#[#set math.equation(numbering: n => "(7.1)")
 $ #scale(x: 120%, y: 120%)[\(] Psi_J \( cal(F) \|_(J_K) \) #scale(x: 120%, y: 120%)[\)]_u eq.not 0 . $ <eq:support-nonzero>]

 For $d = 0$, the list of functions is empty and $J = U$.]
] <support:finite-slice>

#proof[
  #emph[Descend the finite support data.] Let $A_1 \, dots.h \, A_t$ be the irreducible components of the closure of the nonzero-stalk locus in $U_K$. Bounded constructibility gives a proper closed subset $B_i subset.neq A_i$ such that every stalk on $A_i \\ B_i$ is nonzero. Give these closed sets their reduced structures. Their finitely generated ideals descend to a common finite extension of $"Frac" \( R \)$; enlarge that extension to descend all containments as well. Replace the trait accordingly. The new support closure still meets the special fiber: the finite map from the new model to the old one maps its closure onto the old closure, since it is closed and agrees on the geometric generic support. This step does not assert that $cal(F)$ descends.
  Write $overline(A)_i$ and $overline(B)_i$ for their horizontal closures in $U$, and put $e_i = dim A_i$. Each $overline(A)_i$ is integral and dominates $S$. Every nonempty special fiber $\( overline(A)_i \)_s$ is pure of dimension $e_i$ #cite(label("Stacks")) Tag 0B2J. Applying the same statement to the irreducible components of $B_i$ shows that
  $ dim \( overline(B)_i \)_s < e_i quad upright("whenever ") \( overline(B)_i \)_s eq.not diameter . $
  The trait is excellent, and hence universally catenary: a complete Noetherian local ring is excellent #cite(label("Stacks")) Tag 07QW. Consequently, at every closed point $v in \( overline(A)_i \)_s$, the dimension formula gives
  #[#set math.equation(numbering: n => "(7.2)")
   $ dim cal(O)_(overline(A)_i \, v) = e_i + 1 #h(2em) #cite(label("Stacks"))upright(" Tag 02JT") . $ <eq:support-local-dimension>]
  #emph[Choose the special point.] Let $d$ be maximal among the $e_i$ for which $\( overline(A)_i \)_s$ is nonempty. Such an index exists by the support assumption. Choose a reduced irreducible component $T$ of dimension $d$ in one of these special fibers. At a general closed point of $T$, its reduced structure is smooth, no other distinct reduced component of $union.big_i \( overline(A)_i \)_s$ passes through the point, and none of the $overline(B)_i$ passes through it. To see the last assertion, a component with empty special fiber contributes nothing, while every remaining bad special locus has dimension strictly below $d$. Different horizontal components $overline(A)_i$ may have the same reduced special component $T$; we retain all of them.
  We can also arrange that
  #[#set math.equation(numbering: n => "(7.3)")
   $ dim Lambda_u lt.eq N - d . $ <eq:support-cone-fiber>]
  Indeed, restrict $Lambda$ to $T$. Its components that do not dominate $T$ can be excluded over a proper closed subset of $T$. The generic fiber of each remaining component has dimension at most $N - d$, since $dim Lambda lt.eq N$. The same bound holds over a nonempty open subset of $T$. Choose $u in T \( k \)$ satisfying all these conditions.
  #emph[Choose transverse equations.] Let $V = T_u^(*) U_s$, so $dim V = N$. If $d > 0$, a general $d$-plane $L subset V$ satisfies $L ∩ Lambda_u subset.eq { 0 }$. Indeed, (7.3) gives $dim bb(P) \( Lambda_u \) lt.eq N - d - 1$, and the incidence of $d$-planes meeting this projective set is a proper closed subset of $"Gr" \( d \, V \)$. The condition that
  $ L arrow.r T_u^(*) T $
  be an isomorphism is another nonempty open condition. These two open subsets meet because the Grassmannian is irreducible. Choose such an $L$ and a basis of it. For $d = 0$, take $L = 0$.
  Lift the basis to functions $f_1 \, dots.h \, f_d$ vanishing at $u$, on an affine neighborhood in $U$. Their restrictions to the smooth $d$-dimensional variety $T$ form a regular system of parameters at $u$. Hence, for $J = V \( f_1 \, dots.h \, f_d \)$ and
  $ Z = J ∩ union.big_i overline(A)_i \, $
  the point $u$ is isolated in $Z_s$ after shrinking. This assertion concerns the union of all the support closures: its reduced special fiber near $u$ is precisely $T$, even if several horizontal components specialize to $T$.
  We have obtained the required differentials. It remains to show that the slice retains a nonzero generic stalk and that this stalk survives specialization.
  #emph[Find a generic generization in the slice.] Choose an index $i$ for which $e_i = d$ and $T$ is a component of $\( overline(A)_i \)_s$. By (7.2), the local ring of $overline(A)_i$ at $u$ has dimension $d + 1$. Quotienting by $f_1 \, dots.h \, f_d$ leaves dimension at least one. Its quotient by a uniformizer $pi$ has dimension zero, by the isolation just proved. Thus some prime of the cut local ring does not contain $pi$: otherwise $pi$ would be nilpotent and the ring would have dimension zero. This gives a generic-fiber point $z$ specializing to $u$.
  The morphism $Z arrow.r S$ is quasi-finite at $u$, since $u$ is an isolated closed point of its fiber #cite(label("Stacks")) Tag 01TH. Its quasi-finite locus is open, so it contains $z$. Thus $z$ has residue field finite over $"Frac" \( R \)$. Its geometric lifts to $K$ avoid $B_i$: a point in the closed set $overline(B)_i$ could not specialize to $u in.not overline(B)_i$. Each such lift therefore has a nonzero stalk of $cal(F) \|_(J_K)$.
  #emph[Compute nearby cycles on a finite neighborhood.] Take an affine neighborhood of $u$ inside the quasi-finite locus of $Z arrow.r S$. The henselian decomposition of a finite-type algebra #cite(label("Stacks")) Tag 04GJ provides a finite local factor containing $u$. It defines an open neighborhood $Q$ of $u$ in $Z$, finite over $S$, whose special fiber has only the point $u$. Equivalently, the separated form of Zariski’s Main Theorem embeds the quasi-finite neighborhood into a finite $S$-scheme; its henselian local factor at $u$ lies in the original open because an open subset of a local spectrum containing the closed point is the entire spectrum. Every generization of $u$, including $z$, lies in $Q$.
  The restriction $cal(F) \|_(J_K)$ is supported on the closed subset $Z_K$. To use the finite neighborhood, remove $Z \\ Q$ from $J$. We realize this removal in the ambient chart: the complement is closed in $J$, hence in $U$, so remove it from $U$ and then choose an affine neighborhood of $u$. This neighborhood contains all of $Q$, since every point of the finite local scheme $Q$ specializes to $u$. The new $J$ is still cut out by the same functions in a smooth affine chart; the change leaves its nearby-cycle stalk at $u$ unchanged and makes $Q$ closed in $J$. If $iota : Q arrow.r.hook J$ denotes this closed immersion and $cal(H) = cal(F) \|_(Q_K)$, localization gives
  $ cal(F) \|_(J_K) tilde.eq iota_(K \, *) cal(H) . $
  Proper compatibility for $iota$ therefore reduces (7.1) to the stalk of $Psi_Q cal(H)$ at $u$. Let $a : Q arrow.r S$ be the finite structural map. Its special fiber has only the point $u$, so proper compatibility gives
  $ \( Psi_Q cal(H) \)_u tilde.eq Psi_S #scale(x: 120%, y: 120%)[\(] "RΓ" \( Q_K \, cal(H) \) #scale(x: 120%, y: 120%)[\)] tilde.eq "RΓ" \( Q_K \, cal(H) \) . $
  The second identification uses geometric specialization on the trait, which is the identity on coefficient complexes. The finite $K$-scheme $Q_K$ has the étale topos of a finite discrete set. Consequently
  $ "RΓ" \( Q_K \, cal(H) \) tilde.eq xor.big_(x in \| Q_K \|) cal(H)_x . $
  At least one summand is nonzero, as proved above, so this complex is nonzero. This proves (7.1).
  These are geometric nearby cycles with the monodromy action forgotten; no inertia invariants are taken. The displayed finite direct-sum calculation is compatible with finite coefficients, their $ell$-adic limit, inversion of $ell$, and extension to $E$. It therefore applies to the specialization functor of Section 2 without requiring a field of descent for $cal(F)$. ◻
]

=== 7.3 Completion of the full-support proof <completion-of-the-full-support-proof>

#proof[
  If $Y' eq.not Y$, Proposition 6 supplies the nonzero compact object $F$ used above. Lemma 22 and the subsequent chart construction give a smooth affine $U arrow.r cal(B)$ of constant relative dimension $N$ for which the closure of the nonzero-stalk locus of $F_U$ meets $U_s$.
  Let $cal(N)_U subset T^(*) U_s$ be the pullback of the global nilpotent cone. Under either displayed hypothesis regime, the nilpotent-parabolic assumption and invariant form give the half-dimensionality theorem of #cite(label("AGKRRV")) Appendix D.1.1–D.1.8. In its smooth-chart formulation, #cite(label("AGKRRV")) Appendix D.1.2, this says exactly that
  $ dim cal(N)_U lt.eq dim U_s = N . $
  Apply Lemma 23 with $cal(F) = F_U$ and $Lambda = cal(N)_U$. It gives a slice $J = V \( f_1 \, dots.h \, f_d \)$ and $u in J_s \( k \)$ for which
  $ #scale(x: 120%, y: 120%)[\(] Psi_J \( F_U \|_(J_K) \) #scale(x: 120%, y: 120%)[\)]_u eq.not 0 \, $
  while the independent differentials of its equations span a plane meeting $\( cal(N)_U \)_u$ only at zero. The higher-codimension vanishing of Proposition 21 applies to this same chart and slice and says that this stalk is zero. This contradiction also covers $d = 0$, when the test is the original smooth-chart vanishing.
  Thus the complementary union is empty. The primed equivalence recalled in Section 2 is consequently the full restricted equivalence asserted in Theorem 4. ◻
]

== 8 Component categories and consequences <sec:consequences>

Throughout this section assume either Hypothesis 2 or Hypothesis 3. We apply Theorem 4 to the spectral action. First we identify each localized automorphic category. We then derive the finite-field arithmetic formula and construct Hecke eigenobjects with coherent structure. Throughout this section put

$ cal(C)_s = "Shv"_("Nilp") \( "Bun"_G \) \, #h(2em) cal(A) = "QCoh" \( Y \) \, #h(2em) cal(D) = "IndCoh"_("Nilp") \( Y \) \, $

and denote the restricted Langlands equivalence by $bb(L)_G^(upright("restr")) : cal(C)_s arrow.r^tilde.op cal(D)$. Its $cal(A)$-linear structure is the one furnished by #cite(label("GR")) Lemma 1.3.7.

=== 8.1 The category on a connected component <the-category-on-a-connected-component>

For an open-and-closed component $i : Z arrow.r.hook Y$, define

$ cal(C)_(s \, Z) := "QCoh" \( Z \) ⊗_("QCoh" \( Y \)) cal(C)_s . $

Here the tensor product is the tensor product of presentable dg categories. The idempotent quasi-coherent object $e_Z = i_(*) cal(O)_Z$ acts as the projection to this summand.

#thm([Corollary 8.1.])[
  #emph[Under either Hypothesis 2 or Hypothesis 3, every connected component $Z subset Y$ has a nonzero localized automorphic category. The restriction of the given spectral-linear Langlands functor induces an equivalence 
$ cal(C)_(s \, Z) arrow.r^tilde.op "IndCoh"_("Nilp") \( Z \) . $

]
] <cor:components>

#proof[
  The decomposition $Y = Z union.sq \( Y \\ Z \)$ decomposes quasi-coherent and nilpotent ind-coherent sheaves into their two corresponding summands. Consequently
  $ "QCoh" \( Z \) ⊗_(cal(A)) cal(D) tilde.eq "IndCoh"_("Nilp") \( Z \) . $
  Tensor the $cal(A)$-linear equivalence of Theorem 4 with $"QCoh" \( Z \)$ over $cal(A)$. This proves the asserted identification by the specified functor.
  Every component contains a semisimple $E$-point #cite(label("AGKRRV")) Proposition 3.7.2 and Corollary 3.7.4. Pullback to this point shows that $cal(O)_Z eq.not 0$. The fully faithful embedding $"QCoh" \( Z \) arrow.r.hook "IndCoh"_("Nilp") \( Z \)$ therefore proves nonvanishing. ◻
]

The component index and the parameter itself have different roles. Two geometric parameters lie in the same component precisely when their semisimplifications are isomorphic #cite(label("AGKRRV")) Proposition 3.7.2. The eigenobject construction below uses the actual parameter, including its extension data.

=== 8.2 The arithmetic formula <the-arithmetic-formula>

Assume Hypothesis 2. The finite-field models $X_0$ and $G_0$ determine geometric $q$-Frobenius. Its pullback action on $"QLisse" \( X \)$ induces an automorphism $"Frob"$ of $Y$. Define its derived fixed-point stack by

$ Y^(upright("arithm")) := Y^("Frob") = Y times^(upright(R))_(Y times_E Y) Y \, $

where the two maps to $Y times_E Y$ are the diagonal and the graph of $"Frob"$. In particular, an $E$-point includes a Weil structure on the geometric local system. These are the conventions of #cite(label("AGKRRV")) §24.1 and #cite(label("GR")) §1.5.1.

#thm([Corollary 8.2.])[
  #emph[For the finite-field datum of Hypothesis 2, there is a canonical isomorphism 
$ "Funct"_c #scale(x: 120%, y: 120%)[\(] "Bun"_(G_0) \( bb(F)_q \) \, E #scale(x: 120%, y: 120%)[\)] tilde.eq Gamma^("IndCoh") #scale(x: 120%, y: 120%)[\(] Y^(upright("arithm")) \, omega_(Y^(upright("arithm"))) #scale(x: 120%, y: 120%)[\)] . $

 The left side is the vector space of compactly supported functions on isomorphism classes of rational bundles, regarded as a complex concentrated in degree zero. The right side uses the ind-coherent dualizing object and ind-coherent global sections on the derived fixed-point stack.]
] <cor:arithmetic>

#proof[
  The primed union $Y'$ is Frobenius-stable. The spectral trace calculation of Beraldo–Lin–Reeves #cite(label("BeraldoLinReeves")) §§6.4.12–6.4.13 enters the known primed formula #cite(label("GR")) §§1.5.3–1.5.5 and Corollary 1.5.6:
  $ "Funct"_c #scale(x: 120%, y: 120%)[\(] "Bun"_(G_0) \( bb(F)_q \) \, E #scale(x: 120%, y: 120%)[\)] tilde.eq Gamma^("IndCoh") #scale(x: 120%, y: 120%)[\(] \( Y' \)^("Frob") \, omega_(\( Y' \)^("Frob")) #scale(x: 120%, y: 120%)[\)] . $
  Its automorphic trace input is #cite(label("AGKRRVTrace")) Theorem 0.2.6, with the endofunctor given by pushforward along geometric Frobenius on $"Bun"_G$. By Theorem 4, the actual inclusion $Y' arrow.r.hook Y$ is equality. Taking derived fixed points identifies $\( Y' \)^("Frob")$ with $Y^(upright("arithm"))$, and transports the same dualizing object and global-sections functor. Substitution gives the result. ◻
]

Keeping $Gamma^("IndCoh")$ explicit avoids a convention in #cite(label("GR")) §1.5.3: its ordinary-global-sections notation uses the image of the dualizing object under the dual of $Upsilon : "QCoh" arrow.r "IndCoh"$. No classical truncation of $Y^(upright("arithm"))$ or replacement of its dualizing object by its structure sheaf is made here.

=== 8.3 Hecke eigenobjects with coherent structure <hecke-eigenobjects-with-coherent-structure>

We first record the categorical argument that supplies the eigenobject. It will also give its tensor compatibilities.

#thm([Lemma 8.3.])[
  #emph[Let $cal(A)_0$ be a compactly generated, presentable, stable, $E$-linear symmetric monoidal category whose compact objects are dualizable. Assume its tensor product preserves colimits separately. Let $a : cal(A)_0 arrow.r "Vect"_E$ be a continuous $E$-linear symmetric monoidal functor, and give $"Vect"_E$ its $cal(A)_0$-action through $a$. The right adjoint $R_a$ of $a$ is continuous and carries a coherent $cal(A)_0$-linear structure. Moreover, $R_a \( E \) eq.not 0$.]
] <lem:parameter-adjoint>

#proof[
  Presentability gives the right adjoint. Every compact object of $cal(A)_0$ is dualizable, so its image under $a$ is a perfect complex of $E$-vector spaces. Thus $a$ preserves compact objects. Testing against compact generators and using adjunction shows that $R_a$ preserves filtered colimits. The right adjoint is exact, since both categories are stable. Exactness and preservation of filtered colimits imply preservation of all colimits.
  The adjunction has a canonical projection morphism
  $ b ⊗ R_a \( V \) arrow.r R_a #scale(x: 120%, y: 120%)[\(] a \( b \) ⊗ V #scale(x: 120%, y: 120%)[\)] . $
  For dualizable $b$, its invertibility follows by testing maps out of an arbitrary $c in cal(A)_0$:
  $ "RHom"_(cal(A)_0) \( c \, b ⊗ R_a \( V \) \) & tilde.eq "RHom"_(cal(A)_0) \( b^or ⊗ c \, R_a \( V \) \)\
 & tilde.eq "RHom"_E \( a \( b \)^or ⊗ a \( c \) \, V \)\
 & tilde.eq "RHom"_E \( a \( c \) \, a \( b \) ⊗ V \) . $
  Both sides of the projection morphism preserve colimits in $b$. Compact generation therefore proves invertibility for every $b$. These morphisms are the adjunction mates of the module structure on $a$; hence their unit and associativity compatibilities hold before invertibility is imposed. They now give a coherent module-functor structure on $R_a$. Finally,
  $ "RHom"_(cal(A)_0) \( upright(bold(1)) \, R_a \( E \) \) tilde.eq "RHom"_E \( E \, E \) tilde.eq E \, $
  so $R_a \( E \) eq.not 0$. This last argument does not require a compact unit. ◻
]

For our spectral stack, $cal(A) = "QCoh" \( Y \)$ satisfies the hypotheses of Lemma 26 by #cite(label("AGKRRV")) §7.9 and Corollary C.4.4. On the disjoint union of components, the compact generators have finite component support. We use the continuous, fully faithful $cal(A)$-linear functor

$ dotless.j_Y : "QCoh" \( Y \) arrow.r_tilde.op^(Upsilon_Y) "IndCoh"_({ 0 }) \( Y \) arrow.r.hook "IndCoh"_("Nilp") \( Y \) . $

Here $Upsilon_Y \( Q \) = Q ⊗ omega_Y$, as in #cite(label("GR")) §1.3.1, Equation (1.2). Its essential image has zero singular support and therefore lies in the nilpotent category.

For a finite set $I$, put $cal(Q)_I = "QLisse" \( X \)^(⊗ I)$. Given $V in "Rep" \( caron(G) \)^(⊗ I)$, let $H_I \( V \, - \)$ denote the multi-leg Hecke functor and let $cal(E)_V^I in cal(A) ⊗ cal(Q)_I$ be the universal evaluation object. For a parameter $sigma : "Spec" \( E \) arrow.r Y$, define its evaluation local system by

$ sigma^I \( V \) := \( sigma^(*) ⊗ "id" \) \( cal(E)_V^I \) in cal(Q)_I . $

For a family of representations $\( V_i \)_(i in I)$, this is the exterior product of the local systems $sigma \( V_i \)$ on the corresponding factors of $X^I$.

#prodef([Definition 8.4.])[
  A Hecke eigenobject of eigenvalue $sigma$ with coherent structure is an object $M in cal(C)_s$ equipped, for all finite sets $I$, with isomorphisms
  $ H_I \( V \, M \) tilde.eq M times.square sigma^I \( V \) $
  natural in $V in "Rep" \( caron(G) \)^(⊗ I)$ and compatible with units, tensor products, permutations of the legs and collisions of legs, with all compatibilities imposed homotopy-coherently #cite(label("AGKRRV")) §15.2.
] <def:eigenstructure>

#thm([Corollary 8.5.])[
  #emph[Under either Hypothesis 2 or Hypothesis 3, every parameter $sigma : "Spec" \( E \) arrow.r Y$ admits a nonzero object $M_sigma in "Shv"_("Nilp") \( "Bun"_G \)$ with a coherent Hecke eigenstructure of eigenvalue $sigma$. If $sigma$ belongs to a component $Z$, then $M_sigma in cal(C)_(s \, Z)$. The assertion concerns the ind-constructible dg category and includes no boundedness, perversity or Weil structure.]
] <cor:eigenobjects>

#proof[
  Apply Lemma 26 to $a = sigma^(*) : cal(A) arrow.r "Vect"_E$, and write $sigma_(*)$ for its continuous right adjoint. The composite
  $ Phi_sigma : "Vect"_sigma arrow.r^(sigma_(*)) cal(A) arrow.r^(dotless.j_Y) cal(D) arrow.r^(\( bb(L)_G^(upright("restr")) \)^(- 1)) cal(C)_s $
  is a continuous $cal(A)$-linear functor. Here $"Vect"_sigma$ denotes $"Vect"_E$ with its action through $sigma^(*)$. Set $M_sigma = Phi_sigma \( E \)$. It is nonzero by the lemma, full faithfulness of $dotless.j_Y$, and the Langlands equivalence. If $sigma$ lies in $Z$, the idempotent $e_Z$ pulls back to $E$, while its complementary idempotent pulls back to zero. Linearity therefore places $M_sigma$ in $cal(C)_(s \, Z)$.
  To verify the eigenstructure, fix a finite set $I$. The action of $cal(E)_V^I$ on the automorphic category is the multi-leg Hecke functor $H_I \( V \, - \)$ #cite(label("AGKRRV")) §§14.2–14.3. Extend $Phi_sigma$ by the identity on $cal(Q)_I$. Its module structure gives
  $ H_I \( V \, M_sigma \) tilde.eq \( Phi_sigma ⊗ "id" \) #scale(x: 120%, y: 120%)[\(] sigma^I \( V \) #scale(x: 120%, y: 120%)[\)] tilde.eq M_sigma times.square sigma^I \( V \) . $
  The second equivalence uses that a continuous $E$-linear functor from $"Vect"_E$ is tensoring with its value on $E$.
  These equivalences are natural in $V$. They preserve tensor products and the unit by the coherent module structure of $Phi_sigma$, and are compatible with collisions of legs and maps between finite sets by the universal symmetric monoidal evaluation system. Thus they supply the homotopy-coherent Hecke eigenstructure of #cite(label("AGKRRV")) §15.2. Equivalently, restricting $Phi_sigma$ along the symmetric monoidal Ran-to-spectral action gives the eigenobject in #cite(label("AGKRRV")) §15.1. The evaluation uses $sigma$ itself, so its eigenvalue is the actual parameter, whether or not it is semisimple. ◻
]

== 9 Rational coefficients and spectral support <sec:coefficients>

Theorem 5 concerns the given rational spectral action. If the structure idempotent of a nonempty open-and-closed $U subset Y_0$ acted by zero, its coefficient extension would also act by zero. For $X eq.not bb(P)^1$, we will compare the sheaf categories, spectral prestacks and actions, so that geometric full support rules out this vanishing. Faithful flatness then descends the absence of a missing support summand. For $X = bb(P)^1$, connectedness of the spectral prestack will suffice.

Throughout this section

$ E_0 = bb(Q)_ell \, #h(2em) E = overline(bb(Q))_ell \, #h(2em) k = overline(bb(F))_q . $

The curve and group satisfy the rational hypotheses in the introduction. Put $cal(C)_E = "Shv"_("Nilp" \, E) \( "Bun"_G \)$ and retain $cal(C)_0 = "Shv"_("Nilp" \, E_0) \( "Bun"_G \)$ and $Y_0$ from there. The symbol $Y$ continues to mean the spectral prestack over $E$. All tensor products of categories below are presentable dg categorical tensor products. In particular, extension of coefficients means $"Vect"_E ⊗_(E_0) \( - \)$; it does not mean extension of the geometric base field.

=== 9.1 Coefficient categories, including their unbounded objects <coefficient-categories-including-their-unbounded-objects>

On a finite-type scheme $T \/ k$, $"Shv"_L \( T \)$ is the ind-completion of bounded constructible $L$-adic complexes, for $L = E_0$ or $E$. For a smooth $T$ and a closed conical subset $N subset T^(*) T$, write $cal(P)_(N \, L) \( T \)$ for the category of constructible perverse sheaves with singular support in $N$. The category $"Shv"_(N \, L) \( T \)$ consists of the objects whose perverse cohomology belongs to $"Ind" \( cal(P)_(N \, L) \( T \) \)$ in every degree. This is the cohomological singular-support definition of #cite(label("AGKRRV")) §§E.5.1–E.5.8. It need not be the ind-completion of support-bounded constructible complexes. The zero-cone case on a smooth scheme is $"QLisse"_L$, with its equivalent ordinary-cohomology definition recalled in the introduction #cite(label("AGKRRV")) §§1.2.5–1.2.11.

#thm([Lemma 9.1.])[
  (Coefficient comparison).  #emph[Extension of coefficients induces equivalences 
#[#set math.equation(numbering: n => "(9.1)")
 $ "Vect"_E ⊗_(E_0) "Shv"_(E_0) \( T \) & tilde.eq "Shv"_E \( T \) \,\
"Vect"_E ⊗_(E_0) "QLisse"_(E_0) \( X \) & tilde.eq "QLisse"_E \( X \) \,\
"Vect"_E ⊗_(E_0) cal(C)_0 & tilde.eq cal(C)_E . $ <eq:coeff-ambient>]

 The first equivalence also holds on locally finite-type algebraic stacks by smooth descent. The second is symmetric monoidal and respects the t-structures used in the tensor-functor definition of $Y_0$ and $Y$. On smooth charts, the third respects the cohomological nilpotent condition. The free and forgetful functors in these comparisons are t-exact for the ordinary and perverse t-structures whenever these are used.]
] <lem:coeff-sheaves>

#proof[
  #emph[Constructible coefficient extension.] We first prove the ambient statement. For a finite extension $L \/ E_0$, coefficient extension and restriction preserve bounded constructibles. On objects extended from $E_0$, the mapping complexes are obtained by tensoring their original mapping complexes with $L$. Moreover, every $L$-constructible $M$ is a retract of $L ⊗_(E_0) "Res"_(L \/ E_0) M$: the multiplication map admits an $L$-linear section given by the separability idempotent of $L \/ E_0$. Thus the induced compact objects have the required mapping complexes and generate after taking retracts. Constructible $E$-complexes and their morphisms are obtained by passage through the finite coefficient fields. These coefficient conventions and the compact-object description are supplied by #cite(label("HemoRicharzScholbach")) Proposition 5.2, Theorem 7.7, Lemma 7.9, Proposition 8.2 and Corollary 8.3; see also #cite(label("HansenScholze")) §2. The cohomological finiteness condition (8.1) of #cite(label("HemoRicharzScholbach")) holds on every finite-type chart over the separably closed field $k$, with either algebraic $bb(Q)_ell$-coefficient field, by Lemma 8.6(1) there. Thus its compactness statements apply to the charts used here. Passing to ind-completions proves (9.1).
  #emph[Detecting the cohomological support condition.] View the left side of (9.1) as internal $E$-module objects in $"Shv"_(E_0) \( T \)$. We will show that such a module satisfies the $E$-coefficient support condition exactly when its underlying $E_0$-object satisfies the $E_0$-condition. This will identify the required subcategories degree by degree, including their unbounded objects.
  Write $F$ for the free-module functor and $U$ for its forgetful functor. Both are exact for ordinary and perverse cohomology. For $U$, this assertion includes infinite coefficient extension: if a constructible $E$-object has a form $M_L$ over a finite extension $L \/ E_0$, its underlying $E_0$-object is
  #[#set math.equation(numbering: n => "(9.2)")
   $ U \( M_L ⊗_L E \) = "colim"_(L subset L' subset E \, thin \[ L' : E_0 \] < oo) "Res"_(L' \/ E_0) \( M_L ⊗_L L' \) . $ <eq:coeff-forgetful>]
  Finite extension and restriction are t-exact, and the ind-t-structures commute with filtered colimits. This proves the assertion first on constructibles, then on the ambient ind-categories.
  For bounded constructibles, coefficient extension preserves and reflects the singular-support bound. The defining test pairs express this bound by universal local acyclicity. We use its dualizability criterion in the algebraic $bb(Q)_ell$-coefficient setting of #cite(label("HansenScholze")) Theorem 1.6. The correspondence category in §3 of that paper has compositions formed from pullback, tensor product and $f_(!)$. These operations commute with coefficient extension by the coefficient formalism and projection formula of §2 there. Extending the duality data therefore preserves universal local acyclicity.
  For reflection, suppose a bounded constructible complex over a finite extension $L \/ E_0$ becomes universally locally acyclic over $E$. The relative dual of its $E$-extension is constructible by #cite(label("HansenScholze")) Proposition 3.4(ii). The dual, evaluation and coevaluation maps, and both triangle identities are finite data on the fixed finite-type test schemes and their products. By #cite(label("HemoRicharzScholbach")) Lemma 7.9, they descend to a common finite coefficient extension. Thus the complex is already universally locally acyclic over that finite extension. Finite extension reflects local acyclicity: after forgetting the extension, the local-acyclicity test is a nonzero finite direct sum of the original test. This proves reflection for each test pair and hence for the singular-support bound. Finite restriction preserves the same bound, since after a splitting coefficient extension it is a finite direct sum of coefficient conjugates. The same arguments, or the finite-rank local-system description, apply to lissity.
  It follows that $F$ and $U$ preserve the relevant ind-perverse hearts. For $U$, use (9.2) and filtered colimits; a finite rank over $E$ is not being treated as a finite rank over $E_0$. To check the converse explicitly, let $P$ be a perverse internal $E$-module and suppose that $U \( P \)$ lies in the required ind-heart over $E_0$. The counit
  $ F \( U \( P \) \) arrow.r P $
  is an epimorphism in the module heart: its underlying map splits by $u mapsto 1 ⊗ u$. Its source belongs to the required ind-heart over $E$. That heart is closed under quotients, by the Serre property of the singular-support heart. Hence $P$ belongs to it as well. Thus, in every degree, the cohomological support condition for an $E$-module is precisely the condition on its underlying $E_0$-object. For $"QLisse"$, apply this argument to the zero-cone ind-perverse heart and use its equivalence with the ordinary-cohomology definition #cite(label("AGKRRV")) §1.2.9. Ordinary lisse sheaves need not form a Serre subcategory of the full ordinary heart; no such assertion is used.
  #emph[Scalar extension and smooth descent.] We have identified which ambient $E$-modules satisfy the support condition. To realize them as the categorical scalar extension of the corresponding $E_0$-subcategory, we use their free-module resolutions.
  The perverse Serre condition gives closure under finite cones. Since perverse cohomology commutes with filtered colimits, these subcategories are closed under filtered colimits and arbitrary direct sums, hence under all colimits, including bar realizations. They are also closed under scalar tensors. Internal modules in each such subcategory are therefore exactly the ambient modules whose underlying objects belong to it. The free-forgetful bar resolution realizes every module from free modules within that subcategory. This identifies these module categories with the corresponding categorical scalar extension and proves (9.1) and the corresponding singular-support comparison on smooth charts. Ordinary tensor products and their structural maps commute with coefficient extension, giving the monoidal assertion. Connective free modules generate the connective module category under connective colimits, by the same bar resolution, so the induced tensor t-structures agree.
  Finally, take the smooth-chart limits defining sheaves on a stack. Internal modules commute with these limits. Equivalently, $"Vect"_E$ is the module category of the continuous monad $E ⊗_(E_0) \( - \)$ on $"Vect"_(E_0)$ and is dualizable as a presentable $E_0$-linear category #cite(label("GKRV")) Lemma 1.6.3. Tensoring with a dualizable category has tensoring with its dual as a left adjoint, so it preserves limits. The smooth pullbacks defining these limits are continuous. Applying the chartwise support comparison proves (9.1). ◻
]

In particular, this argument does not exchange scalar extension with an unspecified left completion. It treats the actual cohomological categories. It applies to $"QLisse" \( bb(P)^1 \)$ as well, without identifying that category with $"IndLisse" \( bb(P)^1 \)$.

=== 9.2 Affine families and the coherent Hecke action <affine-families-and-the-coherent-hecke-action>

The sheaf comparison now applies to the affine families defining the spectral prestacks. We retain the right-t-exact condition on their tensor functors: a comparison of field-valued parameters would not identify these prestacks.

#thm([Lemma 9.2.])[
  (Spectral coefficient comparison).  #emph[There are natural identifications 
#[#set math.equation(numbering: n => "(9.3)")
 $ Y_0 times_("Spec" E_0) "Spec" E tilde.eq Y \, #h(2em) "Vect"_E ⊗_(E_0) "QCoh" \( Y_0 \) tilde.eq "QCoh" \( Y \) . $ <eq:coeff-spectral>]

 The second is symmetric monoidal. These identifications compare the universal evaluation systems for every finite set of legs.]
] <lem:coeff-spectral>

#proof[
  Let $A$ be a connective commutative $E$-algebra and write $"Mod"_A = "QCoh" \( "Spec" A \)$. Lemma 29 and associativity give a symmetric monoidal equivalence
  $ "Mod"_A ⊗_(E_0) "QLisse"_(E_0) \( X \) tilde.eq "Mod"_A ⊗_E "QLisse"_E \( X \) . $
  The tensor t-structures are generated by connective objects of the factors; equivalently they are the module t-structures with t-exact forgetful functor #cite(label("AGKRRV")) §1.4.1. They agree under this identification by the connective assertion in Lemma 29.
  For the split dual group, scalar extension identifies $"Vect"_E ⊗_(E_0) "Rep"_(E_0) \( caron(G)_0 \)$ with $"Rep"_E \( caron(G) \)$ as a symmetric monoidal category with t-structure. In characteristic zero, finite-dimensional representations in the heart generate its connective objects; over a split reductive group the irreducible highest-weight representations are defined over $E_0$ and remain irreducible after extension #cite(label("Milne")) Theorem 22.2, §§22.3–22.5 and Theorem 22.42. The universal property of scalar extension therefore identifies tensor functors into the displayed target, and right t-exactness is equivalent before and after this extension. This proves the first assertion on every connective affine $E$-algebra $A$, naturally in $A$, using precisely the moduli definition #cite(label("AGKRRV")) §1.4.2.
  Present $Y_0$ as the colimit of its affine test schemes. Base change presents the left side of (9.3) by the base-changed affines. Quasi-coherent categories form the corresponding limit. On an affine, the coefficient comparison is the usual equivalence $"Vect"_E ⊗_(E_0) "Mod"_B tilde.eq "Mod"_(B ⊗_(E_0) E)$. The affine pullbacks in this diagram are continuous. The categorical dualizability of $"Vect"_E$, justified in Lemma 29, therefore lets tensoring commute with this limit and proves the second assertion, including its monoidal structure. No finite-dimensionality of $E$ over $E_0$ is required.
  Evaluation of a representation at the tensor functor parametrized by $"Spec" A$ is unchanged by these identifications. The assertion is natural in representations, affine tests and maps of finite sets. It therefore identifies the entire universal evaluation system, including tensor products and collisions of legs. ◻
]

It remains to compare the given rational action with the geometric action. We establish this comparison for $X eq.not bb(P)^1$, the only case needed below. The preceding coefficient comparisons hold for every $X$; for $bb(P)^1$ we will instead deduce support from connectedness of the spectral prestack.

#thm([Lemma 9.3.])[
  (Comparison of spectral actions).  #emph[Suppose $X eq.not bb(P)^1$ and equip $cal(C)_0$ with the rational spectral-action datum of Theorem 5. Under Lemmas 29 and 30, its scalar extension is the established $"QCoh" \( Y \)$-action on $cal(C)_E$.]
] <lem:coeff-action>

#proof[
  First, $"QLisse"_E \( X \) = "IndLisse"_E \( X \)$ for this curve #cite(label("AGKRRV")) §1.3.3 and §E.2.8. The same equality holds over $E_0$. To see this, extend an object of $"QLisse"_(E_0) \( X \)$ and express it using the constructible lisse generators over $E$. Forgetting coefficients takes those generators into the colimit closure of the $E_0$-constructible lisse objects, by (9.2). The original object is a retract of its extension followed by forgetting: choose an $E_0$-linear retraction $E arrow.r E_0$ of the unit. Constructible lisse objects are compact in the ambient ind-constructible category. Thus these $"QLisse"$ categories are compactly generated and dualizable. Their exterior product and affine-limit evaluation constructions consequently commute with the coefficient comparisons above.
  Fix the geometric Satake identification over $E_0$, available in #cite(label("MirkovicVilonen")) Theorem 14.1, and use its scalar extension over $E$. Take the same dual-group identification, cohomological shifts and geometric Tate-line conventions. We compare the whole finite-set monoidal diagram giving the Hecke functors, not only its objects indexed by highest weights. On each bounded Schubert support, coefficient extension commutes with exterior products, pullbacks, descent and proper convolution pushforwards. It is perverse t-exact, so it also commutes with intermediate extension, expressed as the image of the map from perverse extension by zero to perverse direct image. Hence it takes the Satake IC objects, their convolution maps, and the fusion diagrams with their unit and symmetry constraints to the corresponding diagrams over $E$. The fiber and weight functors in geometric Satake identify the same split dual group under this operation #cite(label("MirkovicVilonen")) §§4–6 and Theorem 14.1.
  For completeness, the derived functors used here are the derived extension of naive geometric Satake. In #cite(label("GKRV")) §§B.3.5–B.3.8 the compatible monoidal diagram in the shifted perverse hearts is extended using the bounded-derived universal property. The induced right-lax monoidal structure is strict; one then restricts to compact representations and ind-extends. Apply this construction to the entire coefficient-comparison diagram. Naturality gives the comparison of the derived functors and all finite-set structural maps; the monoidal equivalences persist under the exact coefficient functor. The correspondence action of #cite(label("GKRV")) §§B.2.5–B.2.10 then compares the continuous Hecke systems, including the units, composition maps and base-change compatibilities used in their action.
  The factorization into nilpotent sheaves with $"QLisse"$-valued legs is through the fully faithful exterior-product functors #cite(label("AGKRRV")) §14.2.5. Lemma 29 compares these subcategories, so the comparison also holds after this factorization. Lemma 30 identifies universal evaluation. By the assumed rational datum, restricting the extended spectral action along evaluation therefore gives exactly the established coherent Hecke system over $E$. The equivalence of spaces of actions in #cite(label("AGKRRV")) Theorem 8.1.4, applied over the algebraically closed field $E$, identifies it with the established spectral action of #cite(label("AGKRRV")) Theorem 14.3.2. ◻
]

No Frobenius structure or normalized rational Langlands functor has been chosen in this comparison. What it establishes is the comparison of the given rational spectral action with the geometric action used in Theorem 4.

=== 9.3 Descent of support and the arithmetic qualification <descent-of-support-and-the-arithmetic-qualification>

For $X eq.not bb(P)^1$, we have now compared the sheaf categories, the spectral prestacks and the coherent actions. The remaining support argument uses the idempotent of the missing open-and-closed substack.

#thm([Lemma 9.4.])[
  (Detection of a clopen support).  #emph[Suppose the coefficient comparisons (9.1) and (9.3) identify the two spectral actions. If an open-and-closed substack $U subset Y_0$ acts by zero on $cal(C)_0$, then $U = diameter$.]
] <lem:coeff-idempotent>

#proof[
  Let $e_U$ denote $cal(O)_U$ extended by zero in $"QCoh" \( Y_0 \)$. Its extension is the analogous idempotent $e_(U_E)$, where $U_E = U times_(E_0) E$. Compatibility of the actions and generation by scalar-extended objects show that $e_(U_E)$ acts by zero on all of $cal(C)_E$.
  The curve and split group descend to a finite field, so Theorem 4 in regime A identifies this action with the action on $"IndCoh"_("Nilp") \( Y \)$. Apply $e_(U_E)$ to the object $dotless.j_Y \( cal(O)_Y \)$, with $dotless.j_Y$ as defined in Section 8. Its value is $dotless.j_Y \( e_(U_E) \)$. Full faithfulness of $dotless.j_Y$ implies $e_(U_E) = 0$, hence $U_E = diameter$.
  To descend this equality, take any affine test $T = "Spec" A arrow.r Y_0$. The inverse image of $U$ is an open-and-closed affine summand of $T$, cut out by an idempotent of $pi_0 \( A \)$. Its base change to $A ⊗_(E_0) E$ is empty. Faithful flatness of $E \/ E_0$ forces that idempotent to vanish. This holds on every affine test, so $U = diameter$. No rational-point description of components is used. ◻
]

#proof[
  For $X eq.not bb(P)^1$, Lemma 31 supplies the hypothesis of Lemma 32. An open-and-closed localization is the image of its idempotent projection, so the vanishing of the localized category is exactly zero action of that idempotent. The lemma proves the assertion.
  If $X = bb(P)^1$, the geometric spectral prestack $Y$ has one connected component: its components are indexed by semisimple geometric local systems #cite(label("AGKRRV")) Proposition 3.7.2, and the geometric étale fundamental group of $bb(P)^1$ is trivial. Indeed, a connected finite étale cover $C arrow.r bb(P)^1$ of degree $n$ satisfies $2 g \( C \) - 2 = - 2 n$ by Riemann–Hurwitz #cite(label("Stacks")) Tag 0C1B, so $n = 1$. By Lemma 30 and the faithful affine test in Lemma 32, $Y_0$ has no nonempty proper open-and-closed substack. The category $cal(C)_0$ is nonzero; for instance its dualizing object has shifted constant restrictions on smooth charts and has zero singular support. Thus its only nonempty open-and-closed localization, the whole category, is nonzero. This also proves the theorem in genus zero.
  Finally, the stipulated complement of $Y'_0$ acts by zero, so it is empty. In particular a given spectral-linear primed equivalence has this property by linearity, and its specified inclusion is an equality of prestacks. ◻
]

Here is the precise arithmetic implication of rational support. Fix finite-field descent data $X_0 \, G_0$ and write $"Frob"$ for geometric Frobenius on $Y_0$.

#thm([Corollary 9.5.])[
  (Conditional rational unpriming).  #emph[Let $Y'_0 subset Y_0$ be a Frobenius-stable open-and-closed support union as in Theorem 5. In addition to the rational hypotheses, assume a canonical primed trace isomorphism over $E_0$ is given: 
$ "Funct"_c #scale(x: 120%, y: 120%)[\(] "Bun"_(G_0) \( bb(F)_q \) \, E_0 #scale(x: 120%, y: 120%)[\)] arrow.r^(med tilde.op med) Gamma^("IndCoh") #scale(x: 120%, y: 120%)[\(] \( Y'_0 \)^("Frob") \, omega_(\( Y'_0 \)^("Frob")) #scale(x: 120%, y: 120%)[\)] . $

 Assume the given map intertwines the excursion and spherical Hecke actions in the same Frobenius and Satake conventions. Then the same canonical formula and compatibilities hold with $Y_0^("Frob")$ in place of $\( Y'_0 \)^("Frob")$.]
] <cor:rational-arithmetic>

#proof[
  Theorem 5 identifies the actual inclusion $Y'_0 subset Y_0$ with equality. Its derived fixed-point stacks, dualizing objects and ind-coherent global-sections functors are therefore the same. Substitute this equality in the given map. ◻
]

The additional comparison map in this corollary is not constructed here. The primed arithmetic theorem cited in Corollary 25 has coefficients $E$; its existence does not by itself give a canonical map over $E_0$. An unconditional rational arithmetic formula still requires that map and its Frobenius, dualizing-object, ind-coherent global-sections and excursion compatibilities. Equality of derived fixed-point prestacks alone supplies none of these additional comparison data.


#bibliography("refs.bib", style: "ieee", title: [References])
