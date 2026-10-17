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

#align(center)[#text(size: 16pt, weight: "bold")[Termination of generalized-canonical flips \
on compact Kähler fourfolds]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction and the main theorem <sec:introduction>

A flip replaces a small contraction on which an adjoint divisor is negative by a small contraction on which its transform is positive. Termination asks whether this local improvement can continue indefinitely. Generalized pairs enlarge the adjoint from $K_X + B$ to $K_X + B + M_X$, where $M_X$ is the trace of nef data on a higher birational model. The nef contribution can change discrepancies even where the ordinary boundary is absent. On a compact Kähler space, one must also distinguish analytic nefness from nonnegative degrees on curves.

We prove termination in the generalized-canonical case in dimension four, for rational nef data fixed throughout the sequence. The proof does not choose the contractions. It applies to every sequence of projective small diagrams with the required opposite ample signs. Exceptional log discrepancies may equal one. The resulting canonical singularities need not be smooth in codimension two, so the argument must establish smoothness precisely along the flipped surfaces that it counts. We first specify the global analytic category of the theorem.

=== 1.1 The data and the statement <the-data-and-the-statement>

All spaces are complex, and a fourfold is irreducible and four-dimensional. A Kähler form on a normal space is given by smooth strictly plurisubharmonic local potentials in analytic embeddings. A class in the real Bott–Chern space $H_(upright("BC"))^(1 \, 1) \( X \, bb(R) \)$ is #emph[analytically nef] if it lies in the closure of the Kähler cone. For a rational line bundle or a $bb(Q)$-Cartier divisor, this means that its first Chern class is nef in this sense.

We call a normal compact space #emph[globally Weil $bb(Q)$-factorial] if every prime Weil divisor defined on the whole space is $bb(Q)$-Cartier and some positive reflexive power of its canonical sheaf is a line bundle. This condition does not assert factoriality of the local analytic rings, or $bb(Q)$-Cartierness of every rank-one reflexive sheaf. Compatible actual canonical divisor representatives on the birational models are part of the supplied data. We do not infer their existence from the canonical rational line-bundle condition alone.

Fix a projective birational morphism

$ pi : X' arrow.r X $

of normal compact Kähler spaces and an analytically nef $bb(Q)$-Cartier divisor $M'$ on $X'$. These data define a rational b-divisor $upright(bold(M))$: on a model dominating $X'$ its trace is the pullback of $M'$, and on another model its trace is the pushforward from a common higher model. We write $M_T$ for the trace on a model $T$. The divisor $M'$ need not be effective. Replacing $X'$ by a higher model and $M'$ by its pullback leaves $upright(bold(M))$ unchanged.

Let $B gt.eq 0$ be a rational divisor of finite support with coefficients less than one, and assume $D = K_X + B + M_X$ is $bb(Q)$-Cartier. On a smooth model $p : W arrow.r X$ dominating $X'$, define the actual rational divisor $Delta_W$ by

#[#set math.equation(numbering: n => "(1)")
 $ K_W + Delta_W + M_W = p^(*) \( K_X + B + M_X \) . $ <eq:structure>]

For a prime divisor $E$ on $W$, its #emph[generalized log discrepancy] is

$ a \( E \; X \, B + upright(bold(M)) \) = 1 - "coeff"_E Delta_W . $

Here a #emph[prime over $X$], or a #emph[divisorial place], is a prime divisor on a proper bimeromorphic model, identified with its strict transforms on common higher models. Its centre is its reduced irreducible image, and it is #emph[exceptional] if this image has codimension at least two. Equation (1) on higher models defines its discrepancy independently of the carrying model. The pair is #emph[generalized klt] if all these discrepancies are positive, and #emph[generalized canonical] if the discrepancies of exceptional primes are at least one. Replacing the latter inequality by strict inequality gives #emph[generalized terminal]. Throughout the theorem we impose positivity for every prime as well as the canonical bound for exceptional primes. Accordingly, exceptional coefficients of $Delta_W$ may be zero or negative.

We use #emph[projective] for a proper morphism admitting a relatively ample holomorphic line bundle. A $bb(Q)$-Cartier divisor is relatively ample if a positive Cartier multiple is so. A proper bimeromorphic morphism is #emph[small] if its exceptional locus contains no prime divisor. A small birational map identifies the prime divisors on its two models, and hence defines strict transforms of boundaries and canonical divisors.

#thm([Theorem 1.1.])[
  #emph[Let $X_0$ be a normal irreducible globally Weil $bb(Q)$-factorial compact Kähler fourfold, and let $B_0 gt.eq 0$ be a rational divisor with coefficients in $\[ 0 \, 1 \)$. Fix compatible actual canonical divisors on the birational models. Let $upright(bold(M))$ be the rational b-divisor represented by an analytically nef $bb(Q)$-Cartier divisor $M'$ on a projective birational morphism $X' arrow.r X_0$ of normal compact Kähler spaces. Assume 
$ a \( E \; X_0 \, B_0 + upright(bold(M)) \) & > 0 &  & upright("for every prime over ") X_0 \,\
a \( E \; X_0 \, B_0 + upright(bold(M)) \) & gt.eq 1 &  & upright("for every exceptional prime") . $

 Consider a sequence of normal globally Weil $bb(Q)$-factorial compact Kähler fourfolds 
$ X_0 arrow.r.dashed X_1 arrow.r.dashed X_2 arrow.r.dashed dots.h.c . $

 On $X_i$, let $B_i$ be the strict transform of $B_0$, let $M_i$ be the trace of this same $upright(bold(M))$, and suppose $D_i = K_(X_i) + B_i + M_i$ is $bb(Q)$-Cartier. Suppose that every step is given by a diagram 
#[#set math.equation(numbering: n => "(2)")
 $ X_i arrow.r^(med f_i med) Z_i arrow.l^(med f_i^(+) med) X_(i + 1) $ <eq:step-diagram>]

 of projective small bimeromorphic morphisms with connected fibres, where $Z_i$ is normal compact Kähler, both morphisms are nonisomorphisms, $- D_i$ is $f_i$-ample, and $D_(i + 1)$ is $f_i^(+)$-ample. Then the sequence is finite.]
] <thm:termination>

The canonical discrepancy bound and positivity are assumed only on the initial pair; both persist by the comparison proved below. The theorem imposes no pseudo-effectivity or scaling condition and no relative Picard-number restriction. It concerns finiteness of given diagrams; existence of a desired next step is a separate question.

=== 1.2 Preceding results and the present argument <preceding-results-and-the-present-argument>

In the relative projective algebraic setting, Kawamata, Matsuda, and Matsuki proved termination for ordinary terminal $bb(Q)$-factorial fourfolds with empty boundary. Their fourfold argument combines Shokurov’s discrepancy difficulty with a descent of surface classes [13] Theorem 5-1-15 and its proof. Fujino extended the discrepancy and surface-count method to ordinary canonical projective fourfold pairs with effective rational boundary [6]. The corrected statement with $floor.l B floor.r = 0$ is [7] Theorem 5.1; its flipping contractions need not have relative Picard number one. Two parts of this work directly underlie our proof. First, the target of a canonical flip is terminal near general points of its codimension-two flipped locus, which permits the blowup discrepancy calculation [6] Lemma 2.2. Second, the corrected low-discrepancy count makes its exclusions by centre, so that they apply to repeated blowups above a boundary surface and not only to its first blowup [7] Proposition 3.1 and Lemma 3.2.

Generalized pairs retain nef information on a higher birational model; see the generalized polarized pairs of Birkar and Zhang [2] Definition 1.4 and Section 4. Chen and Tsakanikas proved termination of every sequence of flips for pseudo-effective four-dimensional NQC log canonical generalized pairs in the relative projective algebraic setting [4] Theorem 1.1; see also [15] Theorem 4.4. Here NQC means that the nef data are finite nonnegative real combinations of nef $bb(Q)$-Cartier data. The rational nef datum used here is NQC in the algebraic setting. Their result allows log canonical singularities and real NQC data. Theorem 1 instead concerns canonical singularities and fixed rational data, permits nonprojective compact Kähler spaces, and applies without pseudo-effectivity. The smooth-centre discrepancy formula for generalized pairs also appears in [4] Lemma 2.9.

In the Kähler setting, Das, Hacon, and Păun prove termination for ordinary dlt compact Kähler fourfold pairs whose adjoint is rationally linearly equivalent to an effective divisor, assuming the successive models remain Kähler [5] Theorem 6.6. Hacon and Xie prove termination of a minimal model program with scaling for strongly $bb(Q)$-factorial compact Kähler generalized klt pairs whose boundary plus nef part is big, in arbitrary dimension [12] Theorem 1.5. The present theorem treats every given sequence in its canonical rational setting, without either of these positivity or scaling conditions.

The ordinary terminal Kähler fourfold argument in [16] Section 4 uses spans of analytic cycle classes in place of algebraic cycle classes. We retain this organization and establish the generalized-canonical version. Its essential points are local ordinary terminality along flipped surfaces, a finite count of places below log discrepancy two allowing zero exceptional boundary coefficients, and a fixed denominator for witness discrepancies at smooth general points. The cycle comparison is proved for compact reduced analytic spaces, so it applies directly to boundary components even when they are nonnormal. The proof reproduces these arguments in full and invokes no termination theorem. Its analytic negativity input is Wang’s lemma [19] Lemma 1.3 and Appendices A–B.

=== 1.3 Proof strategy <proof-strategy>

Dimension four links the two parts of the proof. Smallness bounds both exceptional loci by dimension two, and the opposite ample signs force their dimensions to sum to at least three. Once the target locus contains no surface, the source locus must therefore contain one. A surface also has codimension two: its blowup at a smooth general point has ordinary log discrepancy two. This connects the discrepancy threshold to the surface classes that will be counted.

Surfaces contained in the source and target exceptional loci are called #emph[flipping] and #emph[flipped surfaces], respectively. First we prove strict discrepancy increase for every place centred in either exceptional locus. Thus a place exceptional over the target and centred in a flipped surface has log discrepancy strictly greater than one, even when its source discrepancy equals one. Effectivity of the boundary and of the difference between the pulled-back nef trace and the nef datum then give ordinary terminality near a general point of that surface. Terminal smoothness in codimension two makes the target smooth there. This is the precise smoothness needed in the proof.

Blowing up a flipped surface at such points supplies a global prime divisor, called its #emph[witness]. Choose one integer $m > 0$ such that $m M'$ is Cartier and $m B_0$ has integral coefficients. The integral Weil divisor $m M_T$ is Cartier near the smooth general point of every flipped surface on a target $T$. The witness calculation consequently puts its target log discrepancy in

$ \( 1 \, 2 \] ∩ m^(- 1) bb(Z) . $

Its discrepancy strictly increases at each use, so each fixed place can serve as a witness at most $m$ times. This count uses no uniform bound on the Cartier indices of the nef traces elsewhere on the models.

We combine this finite set of values with a finite set of possible places, treating the positive boundary coefficients in decreasing order. If a flipped surface lies in a component of coefficient $b$, its witness has source discrepancy strictly below $2 - b$. On the first model of a fixed tail, monotonicity keeps its discrepancy below $2 - b$. The low-place lemma puts these divisors in a finite set, except possibly those centred on surfaces in a positive boundary component of coefficient $d$, with discrepancy at least $2 - d$. Thus $d > b$. The induction has already excluded flipping surfaces in those higher-coefficient components, so these centres persist through the common isomorphic opens and cannot become flipped surfaces. At each coefficient stage the possible divisorial witnesses thus belong to a fixed finite set.

Once these witnesses are exhausted, the target exceptional locus contains no surface in the boundary components of the current coefficient. On each such component, Borel–Moore localization compares its analytic surface classes with those of the source component. Every removed source surface gives a nonzero kernel class by Kähler positivity. The rank consequently drops at each remaining step affecting such a surface. After the boundary components have been treated, the witness argument with threshold two excludes every remaining flipped surface. The same cycle comparison on the fourfolds then gives strict rank loss at every step.

Section 2 fixes the analytic foundations and common models. Section 3 proves the strict one-step comparison. Section 4 establishes the low-place count. Section 5 proves generic terminality along flipped surfaces and constructs witnesses with finitely many possible discrepancy values. Section 6 proves the cycle-rank comparison, and Section 7 combines these ingredients.

== 2 Analytic foundations and common models <sec:foundations>

We will compare actual divisors on common models and later prove smoothness at general points of flipped surfaces. This section records the analytic facts needed for these two purposes. All discrepancy comparisons use the fixed b-divisor $upright(bold(M))$ from Theorem 1.

=== 2.1 Places and projective resolutions <subsec:places>

A #emph[place] is a global prime divisor on a normal proper bimeromorphic model, identified with its strict transforms on common higher models. Its centre is its reduced irreducible image. A place is exceptional over a model when its centre has codimension at least two. This description does not identify places solely through fields of global meromorphic functions. Properness makes the centres compact analytic subspaces. When checking a local singularity condition, we also use divisors on proper modifications of analytic neighbourhoods; we refer to these explicitly as #emph[local places].

Every divisor in a pullback comparison is an actual divisor, with the compatible canonical representatives prescribed in Theorem 1. Ordinary relative canonical coefficients can be computed from local pluricanonical equations after clearing a Cartier multiple; over a smooth space they are the orders of the Jacobian. These computations localize. Indeed, a ratio of representatives that is a unit off a codimension-two subset of a normal base extends as a unit across that subset. Thus agreement on the isomorphic opens gives the same local discrepancy coefficients.

For a proper bimeromorphic morphism $r : V arrow.r T$ of normal spaces, the set of points with positive-dimensional fibres is closed analytic. Off this subset the morphism is finite and bimeromorphic, hence an isomorphism by normality. The subset has codimension at least two: its inverse image is a proper analytic subset of $V$, and the fibre-dimension theorem excludes a codimension-one image with positive-dimensional fibres. Fibres are connected by Stein factorization. A point where the morphism is a local isomorphism is isolated in its fibre, so it cannot belong to a connected positive-dimensional fibre. The exceptional locus is therefore exactly the inverse image of this subset.

We use normalization, proper mapping, fibre dimension, Stein factorization, and resolution and principalization in the complex analytic category. The last two permit simultaneous resolution of finitely many divisors and coherent ideals by projective modifications; see [1] Theorems 1.6, 1.10, and 13.2(1). Projective morphisms are preserved under base change and restriction to closed analytic subspaces; finite morphisms are projective. The projective morphisms used here can also be composed: a sufficiently large twist of one relative ample line bundle by the pullback of the next is relatively ample for the composite, with compactness giving a uniform choice.

#thm([Proposition 2.1.])[
  (Common models).  #emph[Any finite portion of the sequence in Theorem 1 has a smooth common model dominating its members and $X'$, projective over each member. It may also dominate any prescribed projective modification of one of those members. For a chosen member $T$, it can be arranged that the exceptional locus over $T$ is divisorial and that its union with the strict transform of $"Supp" B_T$ has simple normal crossings. The model carries $upright(bold(M))$ as the pullback of $M'$.]
] <prop:common-models>

#proof[
  Enlarge the finite portion to an initial segment starting at $X_0$. For one step, take the reduced component of $X_i times_(Z_i) X_(i + 1)$ containing the graph over the common isomorphic open. It is projective over both models, and its normalization remains so. Combine these graphs and $X' arrow.r X_0$ by successive dominating components of fibre products, then normalize and resolve. To include a prescribed projective modification of a member, take one further fibre product over that member before resolving. Base change, restriction, finite normalization, and composition show that all resulting morphisms to the members of the segment are projective.
  Fix $T$. Choose a closed analytic subset of codimension at least two outside which the map is an isomorphism, $T$ is smooth, and the boundary components are smooth and disjoint; include their singular loci and pairwise intersections in this subset. Principalize the pullback of its ideal and resolve the total divisor without changing this open set. The inverse image of the chosen subset is now a divisor whose components are exceptional over $T$; it contains the entire exceptional locus. Resolving together with the strict boundary gives the claimed normal-crossing condition. Pulling back $M'$ preserves the fixed data. ◻
]

A further common resolution with a model carrying any prescribed place allows comparison of its discrepancy. That carrying model need not itself be projective, and the further resolution is only required to be proper. Projectivity of the models in Proposition 2 will be used when applying negativity and when constructing divisorial witnesses.

=== 2.2 Negativity for actual divisors <negativity-for-actual-divisors>

For a projective morphism, relative nefness of a rational divisor in the following lemma is the degree condition on all contracted curves. This is distinct from absolute analytic nefness.

#thm([Lemma 2.2.])[
  (Analytic negativity).  #emph[Let $r : V arrow.r T$ be a projective bimeromorphic morphism of normal complex spaces and let $F$ be a $bb(Q)$-Cartier divisor on $V$. If $- F$ has nonnegative degree on every contracted curve and $r_(*) F$ is effective, then $F$ is effective.]
] <lem:negativity>

This is [19] Lemma 1.3 and Appendix A, after clearing a Cartier multiple. The relative degree criterion in the projective case is explicit in [19] Appendix B. Effectivity is that of the actual divisor, not merely its class. The corresponding statement is [16] Lemma 2.3(i). We apply it only when $r_(*) F = 0$.

An effective $bb(Q)$-Cartier divisor on a normal space pulls back effectively: after multiplying, its local meromorphic equation has no divisorial poles, hence is holomorphic by normality. It also has nonnegative degree on every compact curve not contained in its support, by restriction to the normalization of that curve. We will use both facts.

=== 2.3 Ordinary terminal singularities in codimension two <ordinary-terminal-singularities-in-codimension-two>

The following local statement will be applied on an open set meeting a flipped surface. We include its surface proof, as in [16] Lemma 4.4. Ordinary terminality here means that every local exceptional place has ordinary log discrepancy strictly greater than one.

#thm([Lemma 2.3.])[
  #emph[A normal complex fourfold with a canonical rational line bundle and ordinary terminal singularities is smooth in codimension two.]
] <lem:terminal-smooth>

#proof[
  Suppose the singular locus has a codimension-two component. Near its general smooth point, choose a holomorphic projection to $bb(C)^2$ submersive on that component. Take a log resolution which is an isomorphism over the regular locus. Choose a general fibre $S$ of the projection: its inverse image $tilde(S)$ is smooth, misses exceptional strata whose images have dimension less than two, and meets all remaining strata transversely. These choices follow by generic smoothness on the resolution and its finitely many strata. Write $rho : tilde(S) arrow.r S$ for the induced resolution. Terminal singularities are klt, so the ambient space has rational singularities by [8] Theorem 3.12, and is Cohen–Macaulay [11] Remark 2.1. The fibre has the expected codimension two. Its two defining parameters therefore form a regular sequence, so $S$ is Cohen–Macaulay. It is regular away from isolated points by the general choice of fibre. Serre’s criterion makes $S$ normal.
  For the regular sequence, the Koszul calculation of the dualizing sheaf gives $omega_S tilde.eq omega_T ⊗ cal(O)_S$, where $T$ denotes the ambient neighbourhood; the two slice equations trivialize the normal determinant. This uses the local analytic Ext description of the dualizing sheaf [17] pp. 3–4. Away from the isolated intersections with the ambient singular locus, a local Cartier pluricanonical power restricts accordingly, and the identification extends reflexively over the normal surface. Applying adjunction also on the smooth resolution therefore restricts its relative canonical equation to
  $ A := K_(tilde(S)) - rho^(*) K_S = sum_j a_j E_j \, #h(2em) a_j > 0 . $
  Here each exceptional curve is a transverse restriction of an exceptional divisor on the resolution; terminality gives its positive coefficient. A normal surface germ with this property is smooth. Indeed, if exceptional curves remain, negative definiteness [10] Section 4.8(e) gives $A^2 < 0$, so $A dot.op E_j < 0$ for some $j$. The pulled-back canonical divisor has degree zero on $E_j$, and therefore $K_(tilde(S)) dot.op E_j < 0$. Since $E_j^2 < 0$, adjunction gives
  $ 0 lt.eq p_a \( E_j \) = 1 + 1 / 2 \( K_(tilde(S)) dot.op E_j + E_j^2 \) lt.eq 0 . $
  Both negative intersection numbers are integers, so each equals $- 1$. Thus $E_j$ is a smooth rational $\( - 1 \)$-curve. Contract it to a smooth point by [10] Section 4.8(a). The map to the normal surface germ factors through this contraction, and pushforward of the relative canonical equation leaves positive coefficients on all remaining exceptional curves. Repetition ends with a finite bimeromorphic map to the normal surface germ, which is an isomorphism.
  But the transverse slice at the chosen singular fourfold point has embedding dimension at least that of the fourfold germ minus two, hence greater than two. It is singular, a contradiction. ◻
]

In Proposition 10 we will verify ordinary terminality on an open set meeting each flipped surface before applying the lemma there.

== 3 Discrepancies across one flip <sec:comparison>

We first establish the properties of an individual step that will be used throughout the termination argument. The two relative ample signs produce an effective divisor on the normalized graph. Its support contains the entire inverse image of the exceptional loci; this is what gives strict increase for every place centred in either locus.

#thm([Proposition 3.1.])[
  (Comparison across a flip).  #emph[Let 
$ T arrow.r^f Z arrow.l^g T^(+) $

 be a step satisfying the hypotheses of Theorem 1 between normal compact Kähler fourfolds. Write 
$ D_T = K_T + B_T + M_T \, #h(2em) D_(T^(+)) = K_(T^(+)) + B_(T^(+)) + M_(T^(+)) \, $

 where the nef traces come from the same fixed b-divisor $upright(bold(M))$. Then the following assertions hold.]
  + #emph[The exceptional images coincide: 
$ A := f \( "Exc" f \) = g \( "Exc" g \) . $

 With reduced structures, put 
$ L = f^(- 1) \( A \) = "Exc" f \, #h(2em) L^(+) = g^(- 1) \( A \) = "Exc" g . $

 These are closed analytic subsets, and 
$ T \\ L tilde.eq T^(+) \\ L^(+) \, #h(2em) dim L \, dim L^(+) lt.eq 2 \, #h(2em) dim A lt.eq 1 . $

]
  + #emph[For every divisorial place $E$ over the two models, 
#[#set math.equation(numbering: n => "(3)")
 $ a \( E \; T^(+) \, B_(T^(+)) + upright(bold(M)) \) gt.eq a \( E \; T \, B_T + upright(bold(M)) \) . $ <eq:discrepancy-monotonicity>]

 The inequality is strict if the centre of $E$ on $T$ is contained in $L$, or if its centre on $T^(+)$ is contained in $L^(+)$. A place is exceptional over $T$ if and only if it is exceptional over $T^(+)$. In particular, the generalized canonical condition of Theorem 1 is preserved. If it holds on $T$, then every exceptional place with centre contained in $L^(+)$ satisfies 
#[#set math.equation(numbering: n => "(4)")
 $ a \( E \; T^(+) \, B_(T^(+)) + upright(bold(M)) \) > 1 . $ <eq:target-strict-discrepancy>]

]
  + #emph[The exceptional loci satisfy 
#[#set math.equation(numbering: n => "(5)")
 $ dim L + dim L^(+) gt.eq 3 . $ <eq:exceptional-dimensions>]

 Consequently, if $L^(+)$ contains no surface, then $L$ contains a surface.]
] <prop:comparison>

#proof[
  #emph[The common exceptional image.] For each of the two morphisms, the exceptional locus is precisely the inverse image of the locus of positive-dimensional fibres, by the discussion in Section 2.1. Off the union of these two images, the morphisms initially give isomorphic opens whose complements upstairs have codimension at least two. Thus prime divisors already correspond, before equality of the images is known.
  Let $U subset Z$ be the open set where $f$ is an isomorphism. Transport $D_T \|_(f^(- 1) \( U \))$ to an actual $bb(Q)$-Cartier divisor $D_U$ on $U$. The two adjoints agree under the identification of prime divisors induced by the small map: this holds for the canonical and boundary terms by their prescribed transforms, and for the nef traces by the pushforward rule for the fixed b-divisor. Hence on $g^(- 1) \( U \)$ the divisors $D_(T^(+))$ and $g^(*) D_U$ agree away from the exceptional locus of $g$. That locus contains no divisor, so the two Weil divisors agree everywhere on $g^(- 1) \( U \)$. Clearing Cartier multiples and using normality gives equality as $bb(Q)$-Cartier divisors as well.
  If $g$ had a positive-dimensional fibre over a point of $U$, its projectivity would provide a curve $C$ in that fibre. The equality just proved would give $D_(T^(+)) dot.op C = 0$, contrary to $g$-ampleness. Thus $g$ is also an isomorphism over $U$. Interchanging $f$ and $g$ and using $f$-ampleness of $- D_T$ proves the reverse inclusion of their isomorphism loci. This establishes the asserted common image $A$ and the identification of the complements of $L$ and $L^(+)$. Smallness gives $dim L \, dim L^(+) lt.eq 2$. Every fibre over $A$ is positive dimensional, so the fibre-dimension theorem gives $dim A lt.eq 1$.
  #emph[An effective divisor on the graph.] Let $G$ be the normalization of the component of $T times_Z T^(+)$ dominating $Z$. Its projections fit into the commutative diagram
  #[#set math.equation(numbering: n => "(6)")
   $ G & arrow.r^(med q med) & T^(+)\
p arrow.b &  & arrow.b g\
T & arrow.r^(med f med) & Z . #h(2em) h := f compose p = g compose q . $ <eq:normalized-graph>]
  The morphisms $p \, q \, h$ are projective and bimeromorphic, as in Proposition 2. Define the actual $bb(Q)$-Cartier divisor
  #[#set math.equation(numbering: n => "(7)")
   $ F := p^(*) D_T - q^(*) D_(T^(+)) . $ <eq:graph-divisor>]
  It vanishes off $h^(- 1) \( A \)$. Since both $L$ and $L^(+)$ have codimension at least two, $F$ is exceptional over both models; in particular, $p_(*) F = 0$.
  If $C$ is a curve contracted by $p$, then $q_(*) C$ is either zero or a curve contracted by $g$. The projection formula therefore gives
  $ \( - F \) dot.op C = D_(T^(+)) dot.op q_(*) C gt.eq 0 . $
  Thus $- F$ is $p$-nef in the relative curve-degree sense. Applying Lemma 3 to a positive Cartier multiple of $F$ proves that $F gt.eq 0$.
  There is a strict inequality on every curve contracted by $h$. Indeed, for such an irreducible curve $C$, the relative ample signs give
  $ D_T dot.op p_(*) C lt.eq 0 \, #h(2em) D_(T^(+)) dot.op q_(*) C gt.eq 0 \, $
  with strict inequality whenever the corresponding image is a curve. The two images cannot both be points: the map $G arrow.r T times_Z T^(+)$ is finite onto the graph component, so it cannot contract $C$. Hence
  #[#set math.equation(numbering: n => "(8)")
   $ F dot.op C = D_T dot.op p_(*) C - D_(T^(+)) dot.op q_(*) C < 0 #h(2em) upright("for every ") h upright("-contracted irreducible curve ") C upright(".") $ <eq:graph-curve-negativity>]
  We next show that this strict inequality determines the whole support:
  #[#set math.equation(numbering: n => "(9)")
   $ "Supp" F = h^(- 1) \( A \) . $ <eq:graph-support>]
  Fix $z in A$. The fibre $h^(- 1) \( z \)$ is projective and connected; connectedness also follows directly from the proper bimeromorphic morphism $h$ and normality of $Z$. It is positive dimensional because it surjects onto $f^(- 1) \( z \)$. Its reduction has finitely many irreducible components. A zero-dimensional irreducible component would be a point disjoint from every other component, contradicting connectedness. Therefore every point belongs to a positive-dimensional projective component. Intersecting such a component with hyperplanes through the point produces an irreducible curve through that point.
  An effective $bb(Q)$-Cartier divisor has nonnegative degree on every compact irreducible curve not contained in its support: a positive multiple is an effective Cartier divisor, whose canonical section restricts to a nonzero holomorphic section on the normalization of that curve. By (8), every curve in $h^(- 1) \( z \)$ is therefore contained in $"Supp" F$. The preceding paragraph puts every point of the fibre in $"Supp" F$. This proves $h^(- 1) \( A \) subset "Supp" F$; the reverse inclusion was already noted.
  #emph[Discrepancies of all places.] Choose a sufficiently high smooth common model carrying the fixed nef data and dominating $G$, as supplied by Proposition 2. To compare a specified place $E$, further dominate a model representing it, so that $E$ is a prime divisor on a smooth model $W$ with morphism $r : W arrow.r G$. The same canonical divisor $K_W$ and the same nef trace $M_W$ occur in both discrepancy equations:
  $ K_W + Delta_T + M_W & = \( p compose r \)^(*) D_T \,\
K_W + Delta_(T^(+)) + M_W & = \( q compose r \)^(*) D_(T^(+)) . $
  Their difference is the equality of actual divisors
  $ r^(*) F = Delta_T - Delta_(T^(+)) . $
  Taking the coefficient at $E$ yields
  #[#set math.equation(numbering: n => "(10)")
   $ a \( E \; T^(+) \, B_(T^(+)) + upright(bold(M)) \) - a \( E \; T \, B_T + upright(bold(M)) \) = "coeff"_E \( r^(*) F \) . $ <eq:graph-discrepancy-identity>]
  Pullback of the effective $bb(Q)$-Cartier divisor $F$ is effective, proving (3).
  If the centre of $E$ on $T$ lies in $L$, its centre on $G$ lies in $p^(- 1) \( L \) = h^(- 1) \( A \)$; the same conclusion holds if its centre on $T^(+)$ lies in $L^(+)$. By (9), this centre is contained in $"Supp" F$. A local equation of a positive effective Cartier multiple of $F$ vanishes on that centre. Its pullback has positive order along $E$: it is a nonzero holomorphic function on the inverse image of the coordinate neighbourhood and vanishes on the part of $E$ lying there. Consequently the right-hand side of (10) is strictly positive. This proves strictness for an arbitrary place with either specified centre condition.
  A place whose centre is a prime divisor on a normal model is represented by that divisor, since a proper bimeromorphic morphism to a normal space is an isomorphism at general points of each prime divisor on the target. Every prime divisor on $T$ meets $T \\ L$, and its corresponding prime divisor on $T^(+)$ meets $T^(+) \\ L^(+)$. The common isomorphism identifies their orders. Thus a place is nonexceptional on one side exactly when it is nonexceptional on the other. Together with (3), this preserves positivity for all places and the lower bound $1$ for exceptional places. For a place centred in $L^(+)$, strictness improves that lower bound to (4).
  #emph[The dimension inequality.] The step is nontrivial, so $A eq.not diameter$. Equation (9) implies $F eq.not 0$. Every irreducible component $P$ of $"Supp" F$ is a divisor on the four-dimensional normal space $G$, hence has dimension three. Its finite image under $G arrow.r T times_Z T^(+)$ is contained in $L times_Z L^(+)$. Therefore
  $ 3 = dim P lt.eq dim \( L times_Z L^(+) \) lt.eq dim L + dim L^(+) \, $
  which proves (5). If $L^(+)$ contains no surface, then $dim L^(+) lt.eq 1$, while smallness gives $dim L lt.eq 2$. The inequality forces $dim L = 2$, so a two-dimensional irreducible component of $L$ is the required surface. ◻
]

We will call an irreducible compact analytic surface contained in $L$ a #emph[flipping surface], and one contained in $L^(+)$ a #emph[flipped surface]. Applying Proposition 5 successively shows that every pair in a sequence as in Theorem 1 remains generalized canonical. The strict bound (4) concerns places centred in the flipped locus and will supply the local terminal condition used to study its surfaces.

== 4 Places of small discrepancy <sec:low-places>

Fix a model $T$ in the sequence of Theorem 1. Proposition 5 gives log discrepancy at least one for every exceptional place over $T$. We will show that, apart from a finite set of places, an exceptional place of discrepancy below two is centred on a surface in a positive boundary component. Its discrepancy is then bounded below by two minus that component’s coefficient. This description will restrict the possible divisors used to count flipped surfaces.

=== 4.1 The nef trace and local estimates <the-nef-trace-and-local-estimates>

Write $B_T$ and $M_T$ for the boundary and the trace of $upright(bold(M))$ on $T$. They are $bb(Q)$-Cartier: each is a finite rational combination of globally defined prime Weil divisors, to which global Weil $bb(Q)$-factoriality applies. Choose a smooth model

$ r : W arrow.r T $

that is projective over $T$ and carries the fixed nef data, as supplied by Proposition 2. Define the actual divisors

#[#set math.equation(numbering: n => "(11)")
 $ Delta_W = r^(*) \( K_T + B_T + M_T \) - K_W - M_W \, #h(2em) J_W = r^(*) M_T - M_W . $ <eq:boundary-and-defect>]

Thus the coefficient of a prime $E$ in $Delta_W$ is $1 - a \( E \; T \, B_T + upright(bold(M)) \)$.

#thm([Lemma 4.1.])[
  (Effectivity of the nef-trace defect).  #emph[For every smooth model $r : W arrow.r T$ that is projective over $T$ and carries the fixed nef data, the divisor $J_W$ in (11) is an effective $r$-exceptional $bb(Q)$-Cartier divisor.]
] <lem:nef-defect>

#proof[
  The pushforward of both $r^(*) M_T$ and $M_W$ is $M_T$, so $J_W$ is $r$-exceptional. For every curve $C$ contracted by $r$,
  $ \( - J_W \) dot.op C = M_W dot.op C gt.eq 0 . $
  To see the last inequality, let $s : W arrow.r X'$ be the morphism to the fixed carrier. Since $M_W = s^(*) M'$, its degree on $C$ is zero if $s \( C \)$ is a point, and otherwise is the degree of $M'$ on $s \( C \)$ multiplied by the degree of the induced map of normalized curves. Analytic nefness of $M'$ implies that these curve degrees are nonnegative: restrict a sequence of Kähler classes converging to $c_1 \( M' \)$ to the normalized curve and pass to the limit. We use this consequence of analytic nefness only for the relative degree calculation above. Lemma 3, applied to $J_W$ and $r_(*) J_W = 0$, now gives $J_W gt.eq 0$. ◻
]

We will use the following local estimate both to check ordinary terminality and to locate places of small generalized discrepancy. It applies to local analytic places as well as to places represented by divisors on compact models.

#thm([Lemma 4.2.])[
  (A local differential estimate).  #emph[Let $W$ be a smooth complex space of dimension $n$, and let $E$ be a prime divisor on a smooth proper birational model of an open subset of $W$. Suppose its centre $C$ has codimension $c$. At a general smooth point of $C$, choose coordinates $x_1 \, dots.h \, x_n$ with $C = \( x_1 = dots.h.c = x_c = 0 \)$. Writing $v = "ord"_E$, one has 
#[#set math.equation(numbering: n => "(12)")
 $ a \( E \; W \, 0 \) gt.eq sum_(j = 1)^c v \( x_j \) gt.eq c . $ <eq:jacobian-bound>]

 If $C$ is contained in exactly one positive component $H$ of a rational divisor $Delta$, and $H$ is smooth at the general point of $C$ with coefficient $d in \( 0 \, 1 \)$, choose the coordinates so that $H = \( x_1 = 0 \)$. Then 
#[#set math.equation(numbering: n => "(13)")
 $ a \( E \; W \, Delta \) gt.eq \( 1 - d \) v \( x_1 \) + sum_(j = 2)^c v \( x_j \) gt.eq c - d . $ <eq:one-positive-bound>]

 If $C$ is contained in no positive component of $Delta$, then $a \( E \; W \, Delta \) gt.eq c$.]
] <lem:jacobian>

#proof[
  Compute at a general smooth point of $E$ above the chosen coordinate neighbourhood. If $t$ is a local equation of $E$, write $x_j = t^(v \( x_j \)) u_j$ for $1 lt.eq j lt.eq c$, where $u_j$ is a unit at the general point of $E$. Each $v \( x_j \)$ is a positive integer. In expanding the pullback of $d x_1 and dots.h.c and d x_n$, at most one factor in a nonzero term can contribute a differential $d t$. Thus its order along $E$ is at least $sum_(j = 1)^c v \( x_j \) - 1$. The remaining coordinate differentials are holomorphic and do not lower this order. Adding one to the coefficient of the relative canonical divisor proves (12).
  For the boundary statement, each component with nonpositive coefficient contributes a nonnegative amount to the log discrepancy. Components not containing $C$ have order zero along $E$. Subtracting just $d thin v \( x_1 \)$ from (12) therefore gives (13). If there is no positive component through $C$, nothing has to be subtracted. ◻
]

=== 4.2 A finite exceptional set of places <a-finite-exceptional-set-of-places>

We next describe the places with generalized log discrepancy below two. The finite exceptional set is attached to one fixed model; its size need not be uniform along the sequence. The distinction according to the centre of a place follows the corrected discrepancy argument of Fujino [7] Proposition 3.1 and Lemma 3.2. We give the full argument, including the repeated blowups that are needed when a boundary coefficient exceeds $1 \/ 2$.

#thm([Lemma 4.3.])[
  (Places of log discrepancy below two).  #emph[Let $\( T \, B_T + upright(bold(M)) \)$ be any model of a sequence as in Theorem 1. There is a finite set $cal(F)_T$ of exceptional places over $T$ with the following property. If $E$ is exceptional over $T$, 
$ a \( E \; T \, B_T + upright(bold(M)) \) < 2 \, #h(2em) E in.not cal(F)_T \, $

 then its centre $S$ on $T$ is a surface contained in a unique positive component $H$ of $B_T$. The space $T$ and the reduced boundary support are smooth at the general point of $S$. If the coefficient of $H$ is $d$, then 
#[#set math.equation(numbering: n => "(14)")
 $ a \( E \; T \, B_T + upright(bold(M)) \) gt.eq 2 - d . $ <eq:low-place-threshold>]

 If $B_T = 0$, there are only finitely many exceptional places with log discrepancy below two.]
] <lem:low-places>

#proof[
  Choose a smooth modification $r : W arrow.r T$, projective over $T$ and carrying the nef data, such that its exceptional locus is divisorial and, together with the strict transform of $"Supp" B_T$, has simple normal crossings. Starting with this simple normal crossing divisor, blow up the intersections of pairs of positive strict transforms until they are mutually disjoint. Each intersection is a finite disjoint union of smooth codimension-two subspaces. Blowing it up separates the chosen pair, preserves simple normal crossings, and cannot make a previously separated pair meet. Thus finitely many such blowups suffice.
  Keep the notation $W$ for the resulting model and $Delta_W$ for its boundary in (11). Its positive components are exactly the strict transforms of the positive components of $B_T$, with the same coefficients. They are smooth and pairwise disjoint. Every component exceptional over $T$ has nonpositive coefficient by generalized canonicity; zero coefficients are allowed. On a higher smooth model $u : V arrow.r W$, the nef terms cancel because $M_V = u^(*) M_W$, giving
  $ K_V + Delta_V = u^(*) \( K_W + Delta_W \) . $
  Hence generalized discrepancies over $T$ can be computed as ordinary discrepancies for $\( W \, Delta_W \)$, including its negative coefficients.
  Put all $r$-exceptional prime divisors on $W$ into $cal(F)_T$. There are finitely many, since $W$ is compact. A further exceptional place $E$ has centre $C$ on $W$ of codimension at least two: a place with divisorial centre on a normal model is represented by that divisor. Lemma 7 shows that $a \( E \; W \, Delta_W \) < 2$ forces $C$ to have codimension two and to lie in one of the positive components, say $H$ with coefficient $d$. The same lemma gives
  #[#set math.equation(numbering: n => "(15)")
   $ a \( E \; W \, Delta_W \) gt.eq 2 - d . $ <eq:resolution-low-bound>]
  If $C$ is not contained in $"Exc" \( r \)$, then $r$ is an isomorphism at its general point. Its image is the surface $S$ required in the statement; smoothness and uniqueness of the positive component descend from $W$.
  It remains to treat the centres contained in $"Exc" \( r \)$. Such a centre $C$, being codimension two and contained in $H$, must be an irreducible component of $H ∩ F$ for some exceptional divisor $F$ on $W$. There are only finitely many such components, and each is smooth by simple normal crossings. We show that a fixed one contributes only finitely many places of log discrepancy below two.
  Near $C$, the only positive component of $Delta_W$ is $H$. Deleting the nonpositive components can only lower discrepancies, so
  $ a \( E \; W \, d H \) lt.eq a \( E \; W \, Delta_W \) < 2 $
  for every place under consideration with centre $C$. We can therefore work with the smooth pair $\( W \, d H \)$ and the fixed smooth codimension-two centre $C subset H$.
  Set $W_0 = W$ and $H_0 = H$. Blow up $C$ to obtain $W_1$, with exceptional divisor $F_1$ and strict transform $H_1$. If $E$ is not $F_1$, its centre on $W_1$ is contained in $F_1$ and has codimension at least two. The crepant boundary on $W_1$ has sole positive component $d H_1$; the coefficient of $F_1$ is $- \( 1 - d \)$. Lemma 7 therefore forces the centre of $E$ to have codimension two and to lie in $H_1$. It is consequently the entire intersection
  $ C_1 = H_1 ∩ F_1 . $
  This intersection is a smooth irreducible section of the exceptional $bb(P)^1$-bundle over $C$, hence isomorphic to $C$.
  Repeat this construction: after $W_j$ has been obtained, blow up $C_j = H_j ∩ F_j$ to obtain $W_(j + 1)$, with new exceptional divisor $F_(j + 1)$. Writing $C_0 = C$, the maps and their centres are
  #[#set math.equation(numbering: n => "(16)")
   $ W_j = "Bl"_(C_(j - 1)) W_(j - 1) \, #h(2em) C_j = H_j ∩ F_j tilde.eq C_(j - 1) #h(2em) \( j gt.eq 1 \) . $ <eq:forced-centres>]
  The new strict transform $H_(j + 1)$ meets $F_(j + 1)$ in a smooth section and is disjoint from the strict transform of $F_j$. Inductively, it misses every older exceptional divisor. The codimension-two blowup formula gives the coefficient
  #[#set math.equation(numbering: n => "(17)")
   $ "coeff"_(F_j) \( Delta_j \) = - j \( 1 - d \) \, #h(2em) a \( F_j \; W \, d H \) = 1 + j \( 1 - d \) \, $ <eq:forced-chain-coefficients>]
  where $K_(W_j) + Delta_j$ is the pullback of $K_W + d H$. Indeed the new coefficient is the sum of the coefficients of $H_j$ and $F_j$, minus one. This is $- \( j + 1 \) \( 1 - d \)$.
  Thus the only way a place of discrepancy below two can remain unextracted is for its centre to follow these successive intersections. At every stage, if $E$ has not yet appeared, the argument just given forces its centre to be $C_j$. Choose local transverse coordinates $x \, y$ with $H_j = \( x = 0 \)$ and $F_j = \( y = 0 \)$, and put $v = "ord"_E$. Retaining the negative coefficient of $F_j$ in the differential estimate gives
  #[#set math.equation(numbering: n => "(18)")
   $ a \( E \; W \, d H \) & gt.eq \( 1 - d \) v \( x \) + #scale(x: 120%, y: 120%)[\(] 1 + j \( 1 - d \) #scale(x: 120%, y: 120%)[\)] v \( y \)\
 & gt.eq \( 1 - d \) + #scale(x: 120%, y: 120%)[\(] 1 + j \( 1 - d \) #scale(x: 120%, y: 120%)[\)] = 2 - d + j \( 1 - d \) . $ <eq:forced-chain-cutoff>]
  For
  $ J = ⌈frac(d, 1 - d)⌉ \, $
  the right side is at least two. Every place with discrepancy below two and centre $C$ must therefore be one of $F_1 \, dots.h \, F_J$. Equivalently, the possible indices in (17) satisfy $j < 1 \/ \( 1 - d \)$; the strict endpoint is included in the cutoff calculation.
  All these blowups have global smooth compact analytic centres. Thus the divisors just enumerated are global places. Conversely, an arbitrary place can be followed on common proper resolutions even when its original carrying model was not projective; its centres map onto the preceding centres. The argument forcing $C_j$ therefore covers every place over $C$, not only those chosen in advance from this blowup chain.
  Add the finitely many divisors obtained for all the finitely many intersections $H ∩ F$ to $cal(F)_T$. Every place outside this set has the centre described earlier, and (15) gives (14). If the boundary has no positive component, Lemma 7 already excludes every further place of discrepancy below two, proving the last assertion. The proof used only nonpositivity of the exceptional coefficients on $W$, so exceptional places of log discrepancy exactly one cause no additional case. ◻
]

#prodef([Remark 4.4.])[
  The second and subsequent blowups in the preceding proof are essential. For example, when $d = 2 \/ 3$, the first two divisors have log discrepancies $4 \/ 3$ and $5 \/ 3$, and the third has discrepancy two. This is the phenomenon in Fujino’s correction [7] Example 2.1. The finite exceptional set in Lemma 8 is defined by centres and contains the whole finite chain over each exceptional intersection.
]

== 5 Divisorial witnesses for flipped surfaces <sec:witnesses>

A surface in the flipped locus supplies a divisor whose discrepancy has just increased. The fixed rational nef data constrain the new discrepancy to a finite set. The construction requires smoothness at the general point of the flipped surface. Generalized canonicity alone does not supply that smoothness; strict increase on the target exceptional locus does. We first establish this local consequence and then construct a global divisor by blowing up the surface. For ordinary canonical pairs, this use of terminality near a flipped surface appears in Fujino [6] Lemma 2.2. The proof here includes the nef-trace defect and checks the local singularity condition from the hypotheses on global places.

#thm([Proposition 5.1.])[
  (Terminality near a flipped surface).  #emph[Let $T arrow.r.dashed T^(+)$ be a step in the sequence of Theorem 1, and let $S subset L^(+)$ be an irreducible flipped surface. There is an analytic open subset $U subset T^(+)$ meeting $S$ on which the underlying space has ordinary terminal singularities. Consequently $T^(+)$ is smooth at a general point of $S$.]
] <prop:ordinary-terminal>

#proof[
  Choose a smooth model $r : W arrow.r T^(+)$, projective over $T^(+)$ and carrying the fixed nef data, with divisorial exceptional locus as in Proposition 2. Using the divisors of (11), write the ordinary relative canonical equation as
  #[#set math.equation(numbering: n => "(19)")
   $ Theta_W := r^(*) K_(T^(+)) - K_W = Delta_W - r^(*) B_(T^(+)) - J_W . $ <eq:ordinary-boundary>]
  The pullback $r^(*) B_(T^(+))$ is effective: after clearing a Cartier multiple, a local equation for the effective boundary is holomorphic by normality, and remains holomorphic after pullback. Lemma 6 gives $J_W gt.eq 0$. Generalized canonicity therefore makes every exceptional coefficient of $Theta_W$ nonpositive. Its nonexceptional coefficients are zero, since it is an ordinary relative canonical divisor.
  An exceptional prime $P$ on $W$ whose image contains $S$ has image exactly $S$: its irreducible image has dimension at most two. Proposition 5 gives
  $ a \( P \; T^(+) \, B_(T^(+)) + upright(bold(M)) \) > a \( P \; T \, B_T + upright(bold(M)) \) gt.eq 1 \, $
  because its target centre lies in $L^(+)$. Thus its coefficient in $Delta_W$, and hence in $Theta_W$, is strictly negative.
  There are only finitely many exceptional prime divisors on $W$. Delete from $T^(+)$ the images of those with coefficient zero in $Theta_W$, and call the resulting open set $U$. Proper mapping makes the deleted set closed analytic. None of these images contains $S$, so their finite union cannot contain the irreducible surface $S$; in particular, $U ∩ S$ is a dense open subset of $S$.
  We check ordinary terminality on $U$ using local analytic places. Restrict the resolution and (19) over $U$. Every local component of its exceptional divisor now has strictly negative coefficient in $Theta_W$. If a local exceptional place $E$ over $U$ has divisorial centre on this resolution, it is the place of that divisor. The divisor must be exceptional over $U$, since otherwise $E$ would not be exceptional. Its negative coefficient therefore gives ordinary log discrepancy greater than one.
  For any remaining local exceptional place, take a common local resolution. Its centre on the smooth space $r^(- 1) \( U \)$ has codimension at least two. Since $Theta_W lt.eq 0$, Lemma 7 gives
  $ a \( E \; U \, 0 \) = a \( E \; r^(- 1) \( U \) \, Theta_W \|_(r^(- 1) \( U \)) \) gt.eq a \( E \; r^(- 1) \( U \) \, 0 \) gt.eq 2 . $
  This checks all local exceptional places and proves ordinary terminality. The canonical rational line bundle restricts to $U$, so Lemma 4 applies there. Its singular locus has codimension at least three and cannot contain the surface $S ∩ U$. Thus $T^(+)$ is smooth at a general point of $S$. ◻
]

=== 5.1 The blowup divisor and its discrepancy <the-blowup-divisor-and-its-discrepancy>

Fix an integer $m > 0$ such that $m M'$ is a Cartier divisor and $m b$ is an integer for every positive coefficient $b$ of $B_0$. The same integer clears all boundary coefficients on every model, since the boundaries are strict transforms. Moreover

#[#set math.equation(numbering: n => "(20)")
 $ m M_T upright(" is an integral Weil divisor on every model ") T . $ <eq:integral-nef-traces>]

Indeed, on a common model carrying the data, $m M_W$ is the pullback of the integral Cartier divisor $m M'$, and pushforward preserves integral Weil coefficients. Although (20) does not assert global Cartierness of $m M_T$, it implies Cartierness on the smooth locus of $T$.

#thm([Proposition 5.2.])[
  (A witness for every flipped surface).  #emph[Consider the $i$-th step of a sequence as in Theorem 1, with target $T^(+) = X_(i + 1)$. Let $S$ be an irreducible surface contained in its flipped locus. There is a global prime place $E_S$, with centre $S$ on $T^(+)$, obtained by blowing up $S$ at its general smooth point. It is exceptional over every model of the sequence. Write 
$ B_(i + 1) = sum_ell b_ell H_ell \, #h(2em) b_ell > 0 \, $

 and let $r : W arrow.r T^(+)$ be a smooth model that is projective over $T^(+)$ and carries both $E_S$ and the fixed nef data. With $J_W = r^(*) M_(i + 1) - M_W$, one has 
#[#set math.equation(numbering: n => "(21)")
 $ a \( E_S \; X_(i + 1) \, B_(i + 1) + upright(bold(M)) \) = 2 - sum_ell b_ell "mult"_S \( H_ell \) - "coeff"_(E_S) \( J_W \) . $ <eq:witness-discrepancy>]

 In particular, 
#[#set math.equation(numbering: n => "(22)")
 $ a \( E_S \; X_(i + 1) \, B_(i + 1) + upright(bold(M)) \) in Lambda_m := \( 1 \, 2 \] ∩ 1 / m bb(Z) = {1 + 1 / m \, 1 + 2 / m \, dots.h \, 2} . $ <eq:witness-grid>]

 Its discrepancy on the source is strictly below two. If $S$ is contained in a component of $B_(i + 1)$ of coefficient $b > 0$, then more precisely 
#[#set math.equation(numbering: n => "(23)")
 $ a \( E_S \; X_i \, B_i + upright(bold(M)) \) < a \( E_S \; X_(i + 1) \, B_(i + 1) + upright(bold(M)) \) lt.eq 2 - b . $ <eq:witness-threshold>]

]
] <prop:witnesses>

#proof[
  By Proposition 10, a general point of the surface $S$ is a smooth point of both $T^(+)$ and $S$. Blow up the global coherent ideal of the reduced analytic subspace $S$. Over the open subset where $T^(+)$ and $S$ are smooth, this is the blowup of a smooth codimension-two centre, with one exceptional prime dominating that open subset of $S$. After normalization the preimage of $S$ is a compact analytic subset with finitely many irreducible components. One of these contains this exceptional divisor and dominates $S$, by proper mapping; the smooth calculation gives uniqueness. It is a global prime divisor, and we denote its place by $E_S$. Resolve further and use Proposition 2 to obtain a smooth model $W$, projective over $T^(+)$, carrying it and the nef data. The centre on $T^(+)$ is $S$, so it is exceptional there. Smallness of every step preserves exceptionalness, as in Proposition 5, and therefore it is exceptional over every $X_j$.
  The ordinary log discrepancy of the blowup at a smooth codimension-two centre is two. Pulling back a boundary component $H_ell$ subtracts $b_ell "mult"_S \( H_ell \)$, where the generic multiplicity is a nonnegative integer and is zero unless $S subset H_ell$. The identity
  $ Delta_W = r^(*) \( K_(T^(+)) + B_(i + 1) \) - K_W + J_W $
  then proves (21). This computation only uses the smooth general point of the centre. The boundary components may be singular or intersect one another along $S$.
  Lemma 6 gives $"coeff"_(E_S) \( J_W \) gt.eq 0$. It also lies in $1 / m bb(Z)$. To verify this denominator claim, restrict to a smooth open subset of $T^(+)$ meeting a general point of $S$. By (20), $m M_(i + 1)$ is an integral Cartier divisor there, so its pullback has integral order along $E_S$. The divisor $m M_W$ is integral Cartier as the pullback of $m M'$. Consequently the coefficient of
  $ m J_W = r^(*) \( m M_(i + 1) \) - m M_W $
  along $E_S$ is an integer. This is a local calculation near the general point of $S$, and does not require $m M_(i + 1)$ to be Cartier elsewhere.
  Every term subtracted from two in (21) is nonnegative and belongs to $1 / m bb(Z)$. Since the target centre is contained in $L_i^(+)$, strict increase in Proposition 5 and generalized canonicity on the source give
  $ a \( E_S \; X_(i + 1) \, B_(i + 1) + upright(bold(M)) \) > a \( E_S \; X_i \, B_i + upright(bold(M)) \) gt.eq 1 . $
  These facts prove (22). If $S$ is contained in a component of coefficient $b$, its generic multiplicity is at least one, so (21) bounds the target discrepancy by $2 - b$. This proves (23); without that containment the same argument gives the strict source bound below two. ◻
]

Call a place chosen by Proposition 11 a #emph[witness] for the corresponding flipped surface. The possible target discrepancies of witnesses form the fixed finite set $Lambda_m$. A place that is used again must reach a strictly larger member of this set.

#thm([Lemma 5.3.])[
  (Finite use of each witness).  #emph[Let $I$ be any set of step indices in a sequence as in Theorem 1. For every $i in I$, choose a flipped surface of the $i$-th step and a witness $E_i$ as in Proposition 11. Then each fixed place $E$ occurs among the $E_i$ at most $m$ times. Consequently, if all the $E_i$ belong to a fixed finite collection $cal(F)$, then $\# I lt.eq m thin \# cal(F)$.]
] <lem:finite-use>

#proof[
  Suppose $i < j$ are two indices for which $E_i = E_j = E$. Monotonicity and the strict increase when $E$ is used at step $j$ give
  $ a \( E \; X_(i + 1) \, B_(i + 1) + upright(bold(M)) \) lt.eq a \( E \; X_j \, B_j + upright(bold(M)) \) < a \( E \; X_(j + 1) \, B_(j + 1) + upright(bold(M)) \) . $
  Thus the target discrepancies at all uses of this fixed place are strictly increasing elements of $Lambda_m$. This set has $m$ elements, so there can be at most $m$ uses. Summing this bound over $cal(F)$ proves the last assertion. No discreteness of the discrepancy at intervening steps is required. ◻
]

== 6 Loss of surface classes <sec:cycles>

Once a target exceptional locus contains no surface, each surface in the source exceptional locus forces a decrease in the rank of analytic surface classes. We prove this first for compact reduced analytic spaces, so that it applies both to the fourfolds and to their possibly nonnormal boundary components. Restriction to the common open carries source surface classes onto all target surface classes. A removed source surface lies in the kernel, and Kähler positivity makes its class nonzero. The use of surface-cycle ranks follows the algebraic argument of Fujino [6] Lemma 2.3; we give the compact analytic form, as in [16] Section 4.1, with the additional generality needed for these boundary components.

For a compact reduced complex analytic space $V$, define

#[#set math.equation(numbering: n => "(24)")
 $ cal(C)_2 \( V \) & := "span"_(bb(R)) { \[ S \] in H_4 \( V \, bb(R) \) : S subset V upright(" is an irreducible compact analytic surface") } \,\
c_2 \( V \) & := dim_(bb(R)) cal(C)_2 \( V \) . $ <eq:cycle-rank>]

Here $\[ S \]$ is the image in $H_4 \( V \, bb(R) \)$ of the fundamental class of $S$, with the complex orientation on its regular locus. All homology groups in this section have real coefficients.

We recall the topology that makes this definition and its use below valid for singular analytic spaces. A compact reduced analytic space admits a finite triangulation compatible with any prescribed finite collection of closed analytic subsets. A subset of complex dimension $d$ is triangulated in real dimension at most $2 d$. One can obtain this statement for an abstract analytic space as follows. Choose a compatible Whitney stratification [18] Chapter III, Propositions 1.5 and 2.2.2, finitely many analytic charts $z_j : U_j arrow.r.hook bb(C)^(N_j)$, and nonnegative smooth functions $rho_j$ supported compactly in $U_j$, with positivity sets covering the space. Extending each block by zero gives an embedding

$ x mapsto #scale(x: 120%, y: 120%)[\(] rho_j \( x \) \, rho_j \( x \) z_j \( x \) #scale(x: 120%, y: 120%)[\)]_j $

into a Euclidean space. Indeed, a block with $rho_j \( x \) > 0$ recovers its chart coordinate as $w \/ t$. Locally all blocks extend smoothly to an ambient chart, and this left inverse shows that the embedding is locally an ambient smooth embedding. It therefore preserves the Whitney conditions. Mather’s control data [14] Section 7, Proposition 7.1, and Section 8 and Goresky’s triangulation theorem [9] Section 5 give a triangulation compatible with the strata and smooth on them. Compactness makes it finite; smoothness on the strata gives the stated dimension bound. In particular, $H_4 \( V \, bb(R) \)$ is finite-dimensional and $c_2 \( V \)$ is a finite nonnegative integer.

We will also use Borel–Moore homology $H_(*)^(upright("BM"))$, defined by locally finite chains. It agrees with ordinary homology on compact spaces, and it allows a fundamental class to be restricted to an open subset even when that subset is noncompact. For a closed analytic subset $A subset V$ of a compact analytic space, compatible triangulations give the localization exact sequence

#[#set math.equation(numbering: n => "(25)")
 $ dots.h.c arrow.r H_j \( A \, bb(R) \) arrow.r H_j \( V \, bb(R) \) arrow.r^(med j^(*) med) H_j^(upright("BM")) \( V \\ A \, bb(R) \) arrow.r H_(j - 1) \( A \, bb(R) \) arrow.r dots.h.c . $ <eq:bm-localization>]

This is the homological sequence for the closed subset and its open complement. In a compatible triangulation, the Borel–Moore group of the complement is the homology of the relative chain complex for $\( V \, A \)$, so the sequence follows from the long exact sequence of that pair; see [3] Sections 1.2 and 1.6. If $S$ is an irreducible surface, its singular locus has real dimension at most two. Applying this sequence to that locus extends the oriented fundamental class of $S_(upright("reg"))$ uniquely to a class in $H_4 \( S \, bb(R) \)$. This is the analytic fundamental class used in (24). Its restriction to any open subset is the corresponding Borel–Moore fundamental class; see also [3] Section 3.1 and Theorem 3.2.

Kähler positivity supplies the nonvanishing needed for strict rank loss. If $V$ is a closed reduced analytic subspace of a compact Kähler space $Y$, and $S subset V$ is an irreducible surface, then the local potentials of a Kähler form $omega$ on $Y$ define a class $\[ omega \] in H^2 \( Y \, bb(R) \)$. Here is the construction on the possibly singular space. Let $cal(P H)_Y$ be the sheaf of functions locally equal to the real part of a holomorphic function. The differences of the potentials form a cocycle in this sheaf. The connecting homomorphism for the exact sequence

$ 0 arrow.r bb(R)_Y arrow.r^(thin sqrt(- 1) thin) cal(O)_Y arrow.r^(thin "Re" thin) cal(P H)_Y arrow.r 0 $

gives $\[ omega \]$, with the normalization agreeing with the de Rham class on smooth spaces. Constant-sheaf cohomology agrees with singular cohomology because analytic spaces are locally contractible, as also follows from the compatible triangulations above. The construction commutes with holomorphic pullback; hence its pullback to a resolution is the de Rham class of the pulled-back form. We obtain

#[#set math.equation(numbering: n => "(26)")
 $ chevron.l \[ omega \]^2 \, \[ S \] #scale(x: 120%, y: 120%)[chevron.r] = integral_(S_(upright("reg"))) omega^2 > 0 . $ <eq:positive-surface-class>]

The pairing here is taken in $Y$. To compute it, choose a resolution $r : tilde(S) arrow.r S$ that is an isomorphism over $S_(upright("reg"))$. Since $r_(*) \[ tilde(S) \] = \[ S \]$, the pairing equals $integral_(tilde(S)) \( r^(*) omega \)^2$. The pulled-back form is semipositive everywhere and positive on the open set mapping to $S_(upright("reg"))$, which proves the strict inequality. Consequently the class of $S$ is nonzero in $H_4 \( Y \, bb(R) \)$ and hence also in $H_4 \( V \, bb(R) \)$.

#thm([Lemma 6.1.])[
  (Cycle loss).  #emph[Let $P$ and $Q$ be compact reduced complex analytic spaces, and let $L_P subset P$ and $L_Q subset Q$ be closed analytic subsets with dense complements. Suppose an isomorphism 
$ U = P \\ L_P tilde.eq Q \\ L_Q $

 is represented by a proper bimeromorphic graph: there is a compact reduced analytic space $G$ with proper projections $p : G arrow.r P$ and $q : G arrow.r Q$ such that the common open 
#[#set math.equation(numbering: n => "(27)")
 $ p^(- 1) \( P \\ L_P \) = q^(- 1) \( Q \\ L_Q \) $ <eq:cycle-graph-open>]

 is dense in $G$ and maps isomorphically to both displayed complements. If $dim L_Q lt.eq 1$, there is a surjection 
$ cal(C)_2 \( P \) arrow.r cal(C)_2 \( Q \) \, #h(2em) upright("and thus") #h(2em) c_2 \( P \) gt.eq c_2 \( Q \) . $

 If $L_P$ contains an irreducible surface whose class in $H_4 \( P \, bb(R) \)$ is nonzero, then $c_2 \( P \) > c_2 \( Q \)$. In particular, strict inequality holds whenever $L_P$ contains a surface and $P$ is a closed analytic subspace of a compact Kähler space.]
] <lem:cycle-loss>

#proof[
  The restriction from $Q$ will identify its fourth homology with the fourth Borel–Moore homology of the common open. We then compare the surface classes by their restrictions there.
  Since $L_Q$ has real dimension at most two, $H_4 \( L_Q \, bb(R) \) = H_3 \( L_Q \, bb(R) \) = 0$. The degree-four part of (25) is therefore
  $ 0 arrow.r H_4 \( Q \, bb(R) \) arrow.r^(med j_Q^(*) med) H_4^(upright("BM")) \( U \, bb(R) \) arrow.r 0 . $
  Define the linear map
  #[#set math.equation(numbering: n => "(28)")
   $ Phi = \( j_Q^(*) \)^(- 1) compose j_P^(*) : H_4 \( P \, bb(R) \) arrow.r H_4 \( Q \, bb(R) \) . $ <eq:cycle-comparison-map>]
  To determine $Phi$ on surface classes, we first check that strict transforms are analytic, without a normality hypothesis. Let $S subset P$ be an irreducible surface not contained in $L_P$. Removing a proper analytic subset from an irreducible analytic space leaves an irreducible space: its regular locus remains connected after removing an analytic subset of positive complex codimension [3] Section 3.3. Thus $S ∩ U$ is irreducible. The analytic inverse image $p^(- 1) \( S \)$ has a unique irreducible component $tilde(S)$ meeting the open where $p$ and $q$ are isomorphisms; there it agrees with $S ∩ U$. This component is a compact irreducible surface. Remmert’s proper mapping theorem shows that
  $ S^(+) := q \( tilde(S) \) subset Q $
  is an irreducible analytic surface, agreeing with $S ∩ U$ on $U$. It is the strict transform of $S$. The same construction with $p$ and $q$ interchanged gives strict transforms in the other direction.
  The restrictions of $\[ S \]$ and $\[ S^(+) \]$ to $U$ are the same oriented fundamental class, so (28) gives $Phi \( \[ S \] \) = \[ S^(+) \]$. If instead $S subset L_P$, its restriction vanishes and $Phi \( \[ S \] \) = 0$. It follows that $Phi$ maps $cal(C)_2 \( P \)$ into $cal(C)_2 \( Q \)$. Every irreducible surface in $Q$ meets $U$, since $dim L_Q lt.eq 1$; its strict transform in $P$ therefore maps back to its class. The induced map of cycle spans is surjective. Finally, a nonzero surface class supported in $L_P$ lies in its kernel. Finite-dimensionality gives the strict rank inequality, and (26) gives the stated Kähler case. ◻
]

Here are the two applications to a flip $T arrow.r Z arrow.l T^(+)$ with exceptional loci $L \, L^(+)$. Let $A subset Z$ be the common exceptional image furnished by Proposition 5. On the normalized graph of the flip, with projections $p \, q$ and common composite $h$ to $Z$, one has

$ p^(- 1) \( T \\ L \) = h^(- 1) \( Z \\ A \) = q^(- 1) \( T^(+) \\ L^(+) \) . $

Both projections are isomorphisms there. Thus this graph gives exactly the diagram required by Lemma 13 for $P = T$, $Q = T^(+)$. For a boundary component $H subset T$ and its transform $H^(+) subset T^(+)$, give both spaces their reduced structures and put

$ L_H = H ∩ L \, #h(2em) L_(H^(+)) = H^(+) ∩ L^(+) . $

Smallness ensures that the complementary opens are dense and identified. In the compact analytic fibre product $H times_Z H^(+)$, take the reduced irreducible component $G_H$ containing their common open graph, with projections $p_H \, q_H$ and common composite $h_H$ to $Z$. This component exists because the fibre product over $Z \\ A$ is precisely that graph. Its projections are proper, and the common open is dense in it. Moreover

$ p_H^(- 1) \( H \\ L_H \) = h_H^(- 1) \( Z \\ A \) = q_H^(- 1) \( H^(+) \\ L_(H^(+)) \) \, $

with both projections isomorphisms on this open. This verifies (27), including equality of the inverse images; normality of $H$ and $H^(+)$ is unnecessary. In particular, when $H^(+)$ contains no flipped surface, $dim L_(H^(+)) lt.eq 1$, so $c_2 \( H \) gt.eq c_2 \( H^(+) \)$. The inequality is strict if $H$ contains a flipping surface, because $H$ is a closed analytic subspace of the Kähler fourfold $T$. The surjectivity used throughout is the surjectivity on the spans of surface classes proved above; no surjectivity of (28) on all homology is needed.

== 7 Termination by descending boundary coefficients <sec:termination>

We now combine the two counts. At each positive boundary coefficient, the witness count first excludes flipped surfaces, and the cycle count then excludes flipping surfaces. The same witness count at threshold two removes all remaining flipped surfaces, after which the ranks of surface classes on the fourfolds decrease at every step.

Write $L_i$ and $L_i^(+)$ for the exceptional loci of step $i$, so that flipping surfaces lie in $L_i$ and flipped surfaces lie in $L_i^(+)$. Proposition 5 gives

#[#set math.equation(numbering: n => "(29)")
 $ dim L_i lt.eq 2 \, #h(2em) dim L_i^(+) lt.eq 2 \, #h(2em) dim L_i + dim L_i^(+) gt.eq 3 . $ <eq:final-dimension>]

Smallness identifies the finitely many positive boundary components and preserves their coefficients.

#thm([Lemma 7.1.])[
  (Persistence of a surface centre).  #emph[Let $T arrow.r.dashed T^(+)$ be a step of a sequence as in Theorem 1, and let $E$ be an exceptional place whose centre on $T$ is a surface $S$. If $S$ is not contained in the source exceptional locus, its target centre is the strict transform of $S$, a surface meeting the common isomorphic open. If $S$ lies in a boundary component, its transform lies in the corresponding component.]
] <lem:persistence>

#proof[
  Represent the place on a common higher model. Its image onto $S$ is surjective by the definition of the centre and properness. The inverse image of the dense open portion of $S$ on which the step is an isomorphism is nonempty and dense in $E$. There the two centre maps agree. The closure of this portion’s target image is both the strict transform of $S$ and the whole target centre. The assertions follow. ◻
]

The following count isolates the argument used at each coefficient, including the final value $b = 0$. Write $a_i \( E \) = a \( E \; X_i \, B_i + upright(bold(M)) \)$ and fix the integer $m$ of Proposition 11.

#thm([Lemma 7.2.])[
  (Counting flipped surfaces).  #emph[Consider a tail beginning with $X_N$ of a sequence as in Theorem 1. Let $b$ be either zero or a positive boundary coefficient. Suppose no flipping surface at any step of the tail lies in a boundary component of coefficient greater than $b$. If $b > 0$, only finitely many steps of the tail have a flipped surface contained in a coefficient-$b$ boundary component. If $b = 0$, only finitely many steps of the tail have any flipped surface.]
] <lem:coefficient-witness-count>

#proof[
  At every step $i$ under consideration, choose one such flipped surface and its witness $E_i$ from Proposition 11. The place is exceptional over $X_N$, and discrepancy monotonicity gives
  #[#set math.equation(numbering: n => "(30)")
   $ a_N \( E_i \) lt.eq a_i \( E_i \) < a_(i + 1) \( E_i \) lt.eq 2 - b . $ <eq:tail-witness-bound>]
  For $b = 0$ this is the witness bound for an arbitrary flipped surface.
  Apply Lemma 8 on the fixed model $X_N$. If $E_i in.not cal(F)_(X_N)$, its centre there is a surface contained in a positive boundary component of coefficient $d$, and
  $ 2 - d lt.eq a_N \( E_i \) < 2 - b . $
  Thus $d > b$. By the hypothesis on flipping surfaces, this surface centre is not contained in $L_N$. Lemma 14 carries it to a surface in the corresponding coefficient-$d$ component on $X_(N + 1)$. At each successive step up to and including step $i$, the same hypothesis and lemma apply. Consequently the centre on $X_(i + 1)$ meets $X_(i + 1) \\ L_i^(+)$. This contradicts its definition as the chosen flipped surface, which is contained in $L_i^(+)$.
  Every chosen witness therefore belongs to the fixed finite set $cal(F)_(X_N)$. Lemma 12 permits each place to be used at most $m$ times, since its discrepancies on witness targets are strictly increasing members of $\( 1 \, 2 \] ∩ m^(- 1) bb(Z)$. There are at most $m thin \# cal(F)_(X_N)$ steps under consideration. ◻
]

#proof[
  Suppose the sequence is infinite. Proposition 5 preserves generalized canonicality: every exceptional place has log discrepancy at least one on every model. The strict bound greater than one used in the witness count holds on the target of its witness step by strict discrepancy increase. No terminality of the whole model is used.
  Order the distinct positive boundary coefficients as $b_1 > dots.h.c > b_s > 0$. Inductively pass to tails on which no flipping or flipped surface lies in a component of any coefficient already treated. Start with the full sequence. For the next coefficient $b = b_j$, the induction hypothesis satisfies the assumption of Lemma 15. Passing beyond the finitely many steps it counts leaves a tail with no flipped surface in any coefficient-$b$ component.
  Index those components on the initial model by a finite set $I_b$, and write $H_(i \, alpha)$ for their strict transforms on $X_i$, $alpha in I_b$. Smallness preserves this indexing. Each target component now satisfies
  $ dim \( H_(i + 1 \, alpha) ∩ L_i^(+) \) lt.eq 1 . $
  Otherwise this intersection would contain a flipped surface. The boundary-component application of Lemma 13 therefore gives
  $ c_2 \( H_(i \, alpha) \) gt.eq c_2 \( H_(i + 1 \, alpha) \) \, $
  with strict inequality whenever $H_(i \, alpha)$ contains a flipping surface. The hypotheses were checked in Section 6 for the reduced components, without normalizing them. In particular, Kähler positivity in $X_i$ makes every removed surface class nonzero in $H_4 \( H_(i \, alpha) \, bb(R) \)$.
  It follows that the finite nonnegative integer
  $ r_b \( i \) := sum_(alpha in I_b) c_2 \( H_(i \, alpha) \) $
  does not increase and decreases strictly at each step with a flipping surface in a coefficient-$b$ component. Only finitely many such steps occur. Pass beyond them to finish this stage.
  After all positive coefficients have been treated, the hypothesis of Lemma 15 holds with $b = 0$. If $B_0 = 0$, the positive-coefficient induction is empty and this hypothesis already holds on the original sequence. Pass beyond the finitely many steps having a flipped surface. On the resulting tail, $dim L_i^(+) lt.eq 1$, whereas (29) forces $L_i$ to contain a surface. Lemma 13, applied to the fourfolds themselves, gives
  $ c_2 \( X_i \) > c_2 \( X_(i + 1) \) $
  at every remaining step. These are finite nonnegative integers, so they cannot decrease strictly along an infinite tail. This proves termination. ◻
]

#heading(level: 1)[References]
#bibitem([1])[Edward Bierstone and Pierre D.~Milman, #emph[Canonical desingularization in characteristic zero by blowing up the maximum strata of a local invariant], Inventiones Mathematicae #strong[128] (1997), no.~2, 207--302. #link("https://doi.org/10.1007/s002220050141")[doi:10.1007/s002220050141].]
#bibitem([2])[Caucher Birkar and De-Qi Zhang, #emph[Effectivity of Iitaka fibrations and pluricanonical systems of polarized pairs], Publications Mathématiques de l'IHÉS #strong[123] (2016), 283--331. #link("https://doi.org/10.1007/s10240-016-0080-x")[doi:10.1007/s10240-016-0080-x].]
#bibitem([3])[Armand Borel and André Haefliger, #emph[La classe d'homologie fondamentale d'un espace analytique], Bulletin de la Société Mathématique de France #strong[89] (1961), 461--513. #link("https://doi.org/10.24033/bsmf.1571")[doi:10.24033/bsmf.1571].]
#bibitem([4])[Guodu Chen and Nikolaos Tsakanikas, #emph[On the termination of flips for log canonical generalized pairs], Acta Mathematica Sinica, English Series #strong[39] (2023), no.~6, 967--994. #link("https://doi.org/10.1007/s10114-023-0116-3")[doi:10.1007/s10114-023-0116-3]. Theorem numbering follows #link("https://arxiv.org/abs/2011.02236v2")[arXiv:2011.02236v2].]
#bibitem([5])[Omprokash Das, Christopher Hacon, and Mihai Păun, #emph[On the $4$-dimensional minimal model program for Kähler varieties], Advances in Mathematics #strong[443] (2024), article~109615. #link("https://doi.org/10.1016/j.aim.2024.109615")[doi:10.1016/j.aim.2024.109615]. Theorem numbering follows #link("https://arxiv.org/abs/2205.12205v3")[arXiv:2205.12205v3].]
#bibitem([6])[Osamu Fujino, #emph[Termination of 4-fold canonical flips], Publications of the Research Institute for Mathematical Sciences #strong[40] (2004), no.~1, 231--237. #link("https://doi.org/10.2977/PRIMS/1145475971")[doi:10.2977/PRIMS/1145475971].]
#bibitem([7])[Osamu Fujino, #emph[Addendum to "Termination of 4-fold canonical flips"], Publications of the Research Institute for Mathematical Sciences #strong[41] (2005), no.~1, 251--257. #link("https://doi.org/10.2977/PRIMS/1145475410")[doi:10.2977/PRIMS/1145475410].]
#bibitem([8])[Osamu Fujino, #emph[Minimal model program for projective morphisms between complex analytic spaces], preprint, 2022. #link("https://arxiv.org/abs/2201.11315v1")[arXiv:2201.11315v1].]
#bibitem([9])[R.~Mark Goresky, #emph[Triangulation of stratified objects], Proceedings of the American Mathematical Society #strong[72] (1978), no.~1, 193--200.]
#bibitem([10])[Hans Grauert, #emph[Über Modifikationen und exzeptionelle analytische Mengen], Mathematische Annalen #strong[146] (1962), 331--368. #link("https://doi.org/10.1007/BF01441136")[doi:10.1007/BF01441136].]
#bibitem([11])[Daniel Greb, #emph[Rational singularities and quotients by holomorphic group actions], Annali della Scuola Normale Superiore di Pisa, Classe di Scienze (5) #strong[10] (2011), no.~2, 413--426. #link("https://www.numdam.org/item/ASNSP_2011_5_10_2_413_0/")[Numdam:ASNSP\_2011\_5\_10\_2\_413\_0].]
#bibitem([12])[Christopher Hacon and Lingyao Xie, #emph[On the Kähler MMP and the transcendental base-point-free theorem], preprint, 2026. #link("https://arxiv.org/abs/2607.24986v1")[arXiv:2607.24986v1].]
#bibitem([13])[Yujiro Kawamata, Katsumi Matsuda, and Kenji Matsuki, #emph[Introduction to the minimal model problem], in #emph[Algebraic Geometry, Sendai, 1985], Advanced Studies in Pure Mathematics, vol.~10, Kinokuniya and North-Holland, 1987, pp.~283--360. #link("https://doi.org/10.2969/aspm/01010283")[doi:10.2969/aspm/01010283].]
#bibitem([14])[John Mather, #emph[Notes on topological stability], Harvard University lecture notes, July 1970. Published in Bulletin of the American Mathematical Society (N.S.) #strong[49] (2012), no.~4, 475--506. #link("https://doi.org/10.1090/S0273-0979-2012-01383-6")[doi:10.1090/S0273-0979-2012-01383-6].]
#bibitem([15])[Joaquín Moraga, #emph[Termination of pseudo-effective 4-fold flips], Mathematische Zeitschrift #strong[310] (2025), article~73. #link("https://doi.org/10.1007/s00209-025-03766-y")[doi:10.1007/s00209-025-03766-y].]
#bibitem([16])[OpenAI, #emph[Finite ordinary minimal model programs on compact Kähler fourfolds], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Finite-ordinary-minimal-model-programs-on-compact-Kahler-fourfolds-September-24-2026/paper.pdf")[OAI:Finite-ordinary-minimal-model-programs-on-compact-Kahler-fourfolds-September-24-2026], 2026.]
#bibitem([17])[Jean Ruppenthal, Håkan Samuelsson Kalm, and Elizabeth Wulcan, #emph[Explicit Serre duality on complex spaces], Advances in Mathematics #strong[305] (2017), 1320--1355. #link("https://doi.org/10.1016/j.aim.2016.10.013")[doi:10.1016/j.aim.2016.10.013]. Page references follow #link("https://arxiv.org/abs/1401.8093v2")[arXiv:1401.8093v2].]
#bibitem([18])[Bernard Teissier, #emph[Variétés polaires.~II. Multiplicités polaires, sections planes, et conditions de Whitney], in #emph[Algebraic Geometry (La Rábida, 1981)], Lecture Notes in Mathematics, vol.~961, Springer, 1982, pp.~314--491.]
#bibitem([19])[Juanyong Wang, #emph[On the Iitaka conjecture $C_(n \, m)$ for Kähler fibre spaces], Annales de la Faculté des Sciences de Toulouse, Mathématiques (6) #strong[30] (2021), no.~4, 813--897. #link("https://doi.org/10.5802/afst.1690")[doi:10.5802/afst.1690].]


