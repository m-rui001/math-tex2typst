#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 82.2pt, y: 82.2pt), numbering: "1")
#set text(lang: "en", size: 11pt)
#set par(justify: true, first-line-indent: (amount: 1.5em, all: true), leading: 0.75em)
#set heading(numbering: none)
#set math.equation(numbering: none)
#show heading: set text(size: 11.5pt)
#show heading.where(level: 1): set text(size: 13pt)
#show link: set text(fill: blue)

#let thm(head, body) = block(above: 0.6em, below: 0.6em, inset: (left: 0.5em), breakable: true)[#strong(head) #body]
#let prodef(head, body) = block(above: 0.6em, below: 0.6em, inset: (left: 0.5em), breakable: true)[#strong(head) #body]
#let proof(body) = block(above: 0.6em, below: 0.6em)[#emph([Proof.]) #body]
#let paperabstract(body) = block(inset: (left: 1.6em, right: 1.6em), above: 0.4em, below: 1.2em)[#align(center)[#strong[Abstract]] #body]
#let bibitem(num, body) = grid(columns: (2.6em, 1fr), gutter: 0.4em, num, body)
#let unconverted(lbl) = block(fill: rgb("#fff3cd"), inset: 4pt)[#text(fill: red, weight: "bold")[unconverted: #lbl]]

#align(center)[#text(size: 16pt, weight: "bold")[A rational obstruction to strong chromatic splitting \
at height three]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <sec:introduction>

Let $S$ be the sphere spectrum, fix a prime $p$, and write $S_p^and$ for its $p$-completion. We use $L_i$ for localization at Johnson–Wilson theory $E \( i \)$ and $L_(K \( i \))$ for localization at Morava $K$-theory of height $i$, all at $p$. In particular, $L_0$ is rationalization. Chromatic splitting concerns the lower-height overlap $L_(n - 1) L_(K \( n \)) S$ in the fracture square for $L_n S$. Hopkins’ strong formulation, recorded by Hovey #cite(label("Hovey1995")) Conjecture 4.2, prescribes an assembly of this overlap from localized spheres.

At height three, the proposed underlying spectrum is

$ "(1.1)" quad cal(W)_3 =  & L_2 #scale(x: 120%, y: 120%)[\(] S_p^and or Sigma^(- 1) S_p^and #scale(x: 120%, y: 120%)[\)]\
 &  or L_1 #scale(x: 120%, y: 120%)[\(] Sigma^(- 3) S_p^and or Sigma^(- 4) S_p^and #scale(x: 120%, y: 120%)[\)]\
 &  or L_0 #scale(x: 120%, y: 120%)[\(] Sigma^(- 5) S_p^and or Sigma^(- 6) S_p^and or Sigma^(- 8) S_p^and or Sigma^(- 9) S_p^and #scale(x: 120%, y: 120%)[\)] . $ <eq:proposed-wedge>

The strong prediction is an equivalence $L_2 L_(K \( 3 \)) S tilde.eq cal(W)_3$, with specified maps, including the canonical unit on the first summand. The revised formulation of Barthel–Beaudry retains this odd-prime prediction #cite(label("BB2019")) Conjecture 6.3 and Remark 6.4. We disprove even the underlying equivalence of $E \( 2 \)$-local spectra.

The obstruction is a natural map. For every spectrum $X$, the $K \( 2 \)$-localization unit induces

$ tau_X : L_0 X arrow.r L_0 L_(K \( 2 \)) X . $

#thm([Theorem 1.1.])[
  #emph[For every prime $p gt.eq 5$, the canonical map 
$ "(1.2)" quad tau_(L_(K \( 3 \)) S) : L_0 L_(K \( 3 \)) S arrow.r L_0 L_(K \( 2 \)) L_(K \( 3 \)) S $ <eq:main-map>

 is nonzero on $pi_(- 3)$.]
] <thm:main>

#thm([Corollary 1.2.])[
  #emph[For every prime $p gt.eq 5$, there is no equivalence of $E \( 2 \)$-local spectra $L_2 L_(K \( 3 \)) S tilde.eq cal(W)_3$, with $cal(W)_3$ as in (1.1). Thus the height-three strong chromatic splitting formula is false in this range, whether or not an equivalence is required to preserve its specified unit summand.]
] <cor:strong>

=== 1.1 Why the canonical map matters <why-the-canonical-map-matters>

The rational homotopy groups of the $K \( n \)$-local sphere are known for every positive height $n$ and every prime. Barthel–Schlank–Stapleton–Weinstein identify their algebra with an exterior algebra over $bb(Q)_p$, with primitive generators in degrees $1 - 2 i$, $1 lt.eq i lt.eq n$ #cite(label("BSSW2025")) Theorem A. At height three the resulting degrees are

$ 0 \, - 1 \, - 3 \, - 4 \, - 5 \, - 6 \, - 8 \, - 9 \, $

exactly the shifts appearing in (1.1). Thus the rational degree pattern does not distinguish the proposed wedge from the actual overlap.

The natural transformation $tau$ does distinguish them. In $cal(W)_3$, a degree-$- 3$ class can occur only in the lower-height part, which is $K \( 2 \)$-acyclic. The two top-height summands have no rational homotopy in that degree. It follows that $tau_(cal(W)_3)$ vanishes on $pi_(- 3)$. The formal argument in 8 also compares the maps for $L_(K \( 3 \)) S$ and $L_2 L_(K \( 3 \)) S$. Naturality makes the conclusion valid for any hypothetical equivalence, with no assumption on its individual summand maps.

At height two, Hovey records Hopkins’ splitting for $p > 3$, based on Shimomura–Yabe’s calculations #cite(label("Hovey1995")) §4, #cite(label("ShimomuraYabe1995")) Theorem 2.4. Behrens later reorganized those calculations and displayed the predicted overlap homotopy groups #cite(label("Behrens2012")) Remark 7.8. Goerss–Henn–Mahowald proved the splitting at $p = 3$ #cite(label("GHM2014")) Theorem 5.11. At $p = 2$, Beaudry disproved the original formula #cite(label("Beaudry2017")) Theorem 1.4, while Beaudry–Goerss–Henn subsequently proved a refined splitting with additional Moore-spectrum summands and retained the weak unit splitting #cite(label("BGH2022")) Theorem 1.1.6.

The canonical map already controls the height-two argument of Goerss–Henn–Mahowald. At $p = 3$, their proof identifies the rational map from the $K \( 2 \)$-local sphere to its $K \( 1 \)$-localization with projection onto the degrees zero and minus one, followed by canonical localization; the fracture square then reconstructs the splitting #cite(label("GHM2014")) proof of Theorem 5.11, p. 1288. Theorem 1 finds a nonzero degree-minus-three component at height three, which obstructs $cal(W)_3$. A finite filtration with these cofibers may retain nonzero attaching maps that a wedge would discard. The existence of a retraction of the canonical unit in weak chromatic splitting remains a separate question.

=== 1.2 A detecting spectrum <a-detecting-spectrum>

The proof of Theorem 1 has two tasks: construct a map from $L_(K \( 3 \)) S$ to an ordinary $K \( 2 \)$-local spectrum, and prove that this map preserves a nonzero rational degree-$- 3$ class. Locality then forces the map to factor through the canonical localization unit. The class is detected in degree-three stabilizer cohomology; the main argument compares its height-three and height-two realizations.

Fix $p gt.eq 5$, put $k = bb(F)_(p^6)$, and choose $C = bb(C)_p$ with compatible constant-field data. For $n = 2 \, 3$, let $Gamma_n$ be the height-$n$ Honda formal group over $k$, and put

$ E_n = E \( k \, Gamma_n \) \, #h(2em) P_n = "Aut"_k \( Gamma_n \) = cal(O)_(D_n)^times . $

Here $D_n$ is the division algebra over $bb(Q)_p$ of invariant $1 \/ n$, and $P_n$ is the nonextended stabilizer. Set

$ G = P_3 times P_2 \, #h(2em) Delta = "Gal" \( k \/ bb(F)_p \) \, #h(2em) G_3 = P_3 times.r Delta . $

The field $k$ contains the endomorphism fields of both Honda groups.

On the height-exactly-two stratum $k \( \( u_2 \) \)$ of the height-three deformation space, the Gross–Torii extension identifies the connected height-two group with $Gamma_2$. Its valued-field completion $hat(L)$ carries the two framing actions, hence an action of $G$. The solid Lubin–Tate construction of Barthel–Mann–Ray–Schlank–Senger–Weinstein–Zhou #cite(label("BMR2026")) gives the connected completed theory

$ hat(B)^square.stroked.tiny = E^square.stroked.tiny \( hat(L) \, \( Gamma_2 \)_(hat(L)) \) \, #h(2em) cal(D) = #scale(x: 120%, y: 120%)[\(] \( hat(B)^square.stroked.tiny \)^(h G) #scale(x: 120%, y: 120%)[\)] \( * \) . $

The superscript $square.stroked.tiny$ records the solid structure and continuous action; $\( * \)$ is evaluation in ordinary spectra. Fixed points are formed before this evaluation.

Section 3 constructs equivariant maps $E_3^square.stroked.tiny arrow.r hat(B)^square.stroked.tiny arrow.l E_2^square.stroked.tiny$. The first requires a section on oriented deformations, obtained by adjoining the marked étale factor to the connected deformation. The second is the canonical connected base-change map. Restriction from $G_3$ to $P_3$, inflation along $G arrow.r P_3$, and the first map define $g : L_(K \( 3 \)) S arrow.r cal(D)$. Every profinite evaluation of $hat(B)^square.stroked.tiny$ is $K \( 2 \)$-local, so its bar totalization $cal(D)$ is too. Thus

$ "(1.3)" quad L_(K \( 3 \)) S arrow.r^eta L_(K \( 2 \)) L_(K \( 3 \)) S arrow.r^(overline(g)) cal(D) \, #h(2em) g = overline(g) eta . $ <eq:overview-detector>

The source identification and these actual maps are established in Proposition 3.3, Lemma 7.1.

Write $N_3 : P_3 arrow.r bb(Z)_p^times$ for reduced norm and $P_3^1 = N_3^(- 1) \( mu_(p - 1) \)$. The completed comparison

$ E_2^square.stroked.tiny arrow.r^tilde.op \( hat(B)^square.stroked.tiny \)^(h P_3^1) $

reduces the detector’s coefficients to height two. We prove the individual-coefficient comparison as well as this instance of #cite(label("BMR2026")) Theorem 5.2.6. The corresponding equivalence for the uncompleted half sphere remains a separate conjecture #cite(label("BMR2026")) Conjectures 1.1.1 and 5.1.13, with a conditional coheight-one consequence in #cite(label("BMR2026")) Proposition 5.1.17. The completed target in (1.3) suffices here.

=== 1.3 Transporting the primitive <transporting-the-primitive>

The starting classes are nonzero elements $e_(P_n) in H_(upright(c t s))^3 \( P_n \, bb(Q)_p \)$, for $n = 2 \, 3$. Under rational Lie comparison they are represented, up to nonzero scalars, by

$ \( U \, V \, W \) mapsto "tr"_(upright(r e d)) #scale(x: 120%, y: 120%)[\(] U \[ V \, W \] #scale(x: 120%, y: 120%)[\)] . $

This is the classical cocycle attached to an invariant bilinear form #cite(label("ChevalleyEilenberg1948")) §21, #cite(label("Koszul1950")) §11. Section 2 constructs these classes and their linear counterparts $e_(J_n)$ for

$ J_n = { g in "GL"_n \( bb(Q)_p \) : \| det g \|_p = 1 } . $

The trace class restricts nontrivially from rank three to rank two; the same compatibility holds for the relevant parabolic subgroup, with determinant lattices retained. The low-rank calculation and the building argument are given in 9.

To compare division-algebra and linear classes, we use a line modification of a form of the rank-$n$, degree-one Fargues–Fontaine bundle $cal(E)_n^0 = cal(O) \( 1 \/ n \)$, retaining a determinant lattice. The stack $cal(M)_n$ of such modifications has two presentations:

$ cal(M)_n tilde.eq \[ bb(P)_C^(n - 1 \, suit.diamond.stroked) \/ P_n \] tilde.eq \[ Omega_C^(n - 1 \, suit.diamond.stroked) \/ J_n \] . $

Here projective space parametrizes quotient lines of the untilt fiber, and Drinfeld space $Omega_C^(n - 1)$ is the complement of the $bb(Q)_p$-rational hyperplanes. The relative bundle correspondence and basic-stratum theorems of Fargues–Scholze provide the torsors in families #cite(label("FS")) Theorem II.2.19, Corollary II.2.20, and Theorems III.2.4 and III.4.5. Keeping a lattice in the determinant local system gives the structure group $J_n$. These presentations follow Faltings’s Lubin–Tate/Drinfeld duality #cite(label("Faltings2002")) Introduction, in the perfectoid form of Scholze–Weinstein with its exchanged period maps #cite(label("SW2013")) Theorem 7.2.3. Section 4 constructs the determinant-lattice comparison used here.

For the geometric cohomology below, write $H_(upright(b))^i$ for integral cohomology followed by inversion of $p$. Integral cohomology is the derived inverse limit of finite $p$-power coefficient complexes, as specified in Section 2. The two presentations have complementary roles. The projective bundle formula singles out a one-dimensional Galois-invariant line in $H_(upright(b))^3 \( cal(M)_n \)$, containing the nonzero image of $e_(P_n)$. Using the Galois weights in the integral Drinfeld cohomology theorem of Colmez–Dospinescu–Nizioł #cite(label("CDN2021")) Theorems 1.1 and 5.1, we prove that the image of $e_(J_n)$ is also nonzero and belongs to that line. Thus the two classes are proportional.

The completed tower carries a surjection from the rank-three bundle to the rank-two bundle. A common line modification turns this into an exact sequence of rational local systems of ranks $1 \, 3 \, 2$. Parabolic restriction and projective-bundle injectivity then give

$ e_(P_3) \|_(Y_C) = a thin e_(P_2) \|_(Y_C) \, #h(2em) a in bb(Q)_p^times \, quad Y_C = \[ "Spd" hat(L) \/ G \] times_("Spd" k) "Spd" C . $

Section 5 proves this relation. Both classes on $Y_C$ could still vanish, so nonvanishing requires a further step.

Section 6 first reflects the relation from $Y_C$ to $Y = \[ "Spd" hat(L) \/ G \]$ with Witt coefficients. The maps from constants become equivalences after $P_3^1$-descent; a bounded finite free complex proves injectivity under the change of constants $W \( k \) arrow.r W \( C^flat \)$. The continuous additive retraction onto Witt constants of Barthel–Schlank–Stapleton–Weinstein #cite(label("BSSW2025")) Proposition 2.5.1 and Corollary 2.5.9 then proves nonvanishing of the height-two class in deformation coefficients. If $c_n$ is the image of $e_(P_n)$ under projection from $G$ and the coefficient unit, the result is

$ c_3 = a thin c_2 eq.not 0 quad upright("in ") H^3 \( G \, pi_0 hat(B)^square.stroked.tiny \) \[ 1 \/ p \] . $

Finally, Section 7 uses the descent spectral sequences for the actual map $g$. A finite cohomological bound produces a finite integral filtration in each ordinary homotopy degree. After rationalization, central scalar automorphisms kill all coefficient degrees $t eq.not 0$. With $s$ denoting group-cohomological degree, the nonzero coefficient map in bidegree $\( s \, t \) = \( 3 \, 0 \)$ therefore survives to degree $- 3$ ordinary homotopy. The factorization (1.3) proves the main theorem, and Section 8 gives its wedge consequence.

Continuous invariants throughout the proof retain their solid coefficient objects, and inversion of $p$ follows integral cohomology. This order matters for the noncompact spaces and groups that occur here.

== 2 Integral cohomology and degree-three group classes <sec:cohomology>

Our goal is to construct the degree-three classes that will be transported through the two-height tower, together with the exact restriction maps between their linear realizations. We first fix the integral coefficient convention and prove the finite-resolution statement that will also control the later Galois-weight and ordinary-descent arguments.

=== 2.1 Coefficients and continuous descent <coefficients-and-continuous-descent>

Put $Lambda_m = bb(Z) \/ p^m$. For a small v-stack $X$ occurring below, put

$ R Gamma_(upright(i n t)) \( X \) = R #h(-1em) "proj lim"_m R Gamma_v \( X \, Lambda_m \) \, #h(2em) H_(upright(i n t))^i \( X \) = H^i R Gamma_(upright(i n t)) \( X \) \, #h(2em) H_(upright(b))^i \( X \) = H_(upright(i n t))^i \( X \) \[ 1 \/ p \] . $

For a locally profinite group $G$, define separately in $D \( upright(A b) \)$

$ "(2.1)" quad R Gamma_(upright(i n t)) \( G \) = R #h(-1em) "proj lim"_m C_(upright(c t s))^bullet \( G \, Lambda_m \) \,\
H_(upright(i n t))^i \( G \) = H^i R Gamma_(upright(i n t)) \( G \) \, #h(2em) H_(upright(b))^i \( G \) = H_(upright(i n t))^i \( G \) \[ 1 \/ p \] . $ <eq:integral-group-cochains>

Here $C_(upright(c t s))^bullet$ is the inhomogeneous continuous cochain complex, with trivial discrete coefficients. The standard resolution in the condensed classifying topos $B G_(upright(p r o acute(e) t))$, the topos of condensed sets with $G$-action, gives the natural comparison

$ C_(upright(c t s))^bullet \( G \, Lambda_m \) tilde.eq "RHom"_(Lambda_m \[ underline(G) \] upright("-") upright(C o n d)) \( underline(Lambda_m) \, underline(Lambda_m) \) . $

This is the external derived Hom; its continuous-cochain calculation for these solid topological coefficients is the standard-resolution proof in #cite(label("Anschutz2020")) §2, pp. 5–7, Lemmas 2.1–2.2. We next construct the maps from this group complex to geometric quotients.

For a condensed $G$-complex $K$, write $R Gamma \( G \, K \)$ for its #emph[internal] derived condensed invariants, and $R Gamma \( G \, K \) \( * \)$ for their point value, which is the external derived Hom #cite(label("Anschutz2020")) §2, p. 8. Topological coefficients in this notation are implicitly condensed. Reduction on finite cochains is degreewise surjective: a function lifts by composing with a section of the finite coefficient reduction. Compatible finite continuous functions are exactly continuous $bb(Z)_p$-valued functions. Hence

$ "(2.2)" quad R Gamma_(upright(i n t)) \( G \) tilde.eq C_(upright(c t s))^bullet \( G \, bb(Z)_p \) tilde.eq R Gamma \( G \, underline(bb(Z)_p) \) \( * \) . $ <eq:group-cochain-bridge>

For the last comparison, $bb(Z)_p$ with its $p$-adic topology is solid by #cite(label("Anschutz2020")) §1, pp. 4–5, so the same standard-resolution proof applies. We do not identify the internal invariant object with the discrete condensation of the external cochain complex for a noncompact group; see #cite(label("Anschutz2020")) Lemma 2.5 and Remark 2.6. The comparisons in (2.2) are natural for continuous group homomorphisms. For compact $G$, continuous functions $G^r arrow.r bb(Q)_p$ are bounded, so

$ C_(upright(c t s)) \( G^r \, bb(Z)_p \) \[ 1 \/ p \] = C_(upright(c t s)) \( G^r \, bb(Q)_p \) . $

Consequently $H_(upright(b))^(*) \( G \)$ agrees with ordinary continuous $bb(Q)_p$-cohomology for compact $G$. We use this last identification only in that case.

Tate twists are taken at each finite level before taking the derived limit. All maps of coefficients and all descent maps are formed integrally. In particular, $H_(upright(b))^i \( X \)$ is not defined as $H_v^i \( X \, hat(bb(Z))_p \[ 1 \/ p \] \)$. Moving inversion of $p$ before cohomology can change the result for a noncompact space or group.

For an analytic adic space in this paper, its étale site agrees with the étale site of its diamond #cite(label("ScholzeDiamonds")) Lemma 15.6. On a locally spatial diamond, bounded-below étale complexes have the same derived cohomology on the diamond étale, quasi-pro-étale, and v-sites #cite(label("ScholzeDiamonds")) Proposition 14.10. We apply these statements to finite constant coefficients, one level at a time. The integral analytic pro-étale comparison used for Drinfeld space is the separate comparison in #cite(label("CDN2021")) §5. Quotient stacks are handled by descent for their covers. Only after the finite-level comparisons do we take $R #h(-1em) "proj lim"_m$.

Here is the map from group classes to geometric quotients. For a small v-stack base $B$, put $B_B G = \[ B \/ underline(G) \]$, where $G$ acts trivially on $B$. A $G$-space $X$ over $B$ gives a map $\[ X \/ G \] arrow.r B_B G$; a $G$-torsor $T arrow.r Z$ over $B$ gives its classifying map $Z arrow.r B_B G$. At each finite level define

$ "(2.3)" quad u_(X \, G \, m) : C_(upright(c t s))^bullet \( G \, Lambda_m \) & arrow.r "Tot"_a R Gamma_v \( X times underline(G^a) \, Lambda_m \)\
 & tilde.eq R Gamma_v \( \[ X \/ G \] \, Lambda_m \) . $ <eq:finite-constant-cochains>

In degree $a$, pull a locally constant function on $G^a$ back along the projection from $X times underline(G^a)$. Its finitely many clopen fibers define a section of the finite constant sheaf, followed by the canonical degree-zero truncation map to derived sections. These maps commute with the faces and degeneracies of the action groupoid. The last equivalence is its Čech descent. The case $X = B$ defines the universal map into $B_B G$, and the general map is its pullback along $\[ X \/ G \] arrow.r B_B G$. Likewise the map obtained from the Čech nerve of $T arrow.r Z$ is the pullback along its classifying map.

If $phi.alt : G' arrow.r G$ is a continuous homomorphism and $f : X' arrow.r X$ is $phi.alt$-equivariant over a base map, this construction gives a commutative square

(2.4)
#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$C_(upright(c t s))^bullet \( G \, Lambda_m \)$])
  content((4.34, 0), [$R Gamma_v \( \[ X \/ G \] \, Lambda_m \)$])
  content((0, 1.7), [$C_(upright(c t s))^bullet \( G' \, Lambda_m \)$])
  content((4.34, 1.7), [$R Gamma_v \( \[ X' \/ G' \] \, Lambda_m \) .$])
  line((1.7, 0), (2.64, 0), mark: (end: ">"))
  content((2.17, -0.45), [$u_(X \, G \, m)$])
  line((0, 0.4), (0, 1.3), mark: (end: ">"))
  content((-0.45, 0.85), [$phi.alt^(*)$])
  line((4.34, 0.4), (4.34, 1.3), mark: (end: ">"))
  content((4.79, 0.85), [$\[ f \/ phi.alt \]^(*)$])
  line((1.785, 1.7), (2.385, 1.7), mark: (end: ">"))
  content((2.085, 2.15), [$u_(X' \, G' \, m)$])
})

It commutes already in each finite cosimplicial degree. The same naturality holds for coefficient reduction, maps of finite coefficient sheaves, and automorphisms of the base. Taking $R #h(-1em) "proj lim"_m$ defines $u_(X \, G \, upright(i n t)) : R Gamma_(upright(i n t)) \( G \) arrow.r R Gamma_(upright(i n t)) \( \[ X \/ G \] \)$; denote the induced maps on cohomology after $\[ 1 \/ p \]$ by $u_(X \, G \, upright(b))$. No acyclicity of $B$ or $X$ is used in this construction.

There is one restricted case in which the universal map is an equivalence. Let $B_C = "Spd" C$ for the algebraically closed perfectoid field $C = bb(C)_p$, and abbreviate $B_C G = \[ B_C \/ underline(G) \]$. For every profinite set $S$, the actual constants map is an equivalence

$ "(2.5)" quad C_(upright(c t s)) \( S \, Lambda_m \) \[ 0 \] arrow.r^(med tilde.op med) R Gamma_v \( B_C times underline(S) \, Lambda_m \) . $ <eq:geometric-point-constants>

For the empty set both sides are zero. Otherwise write $S = "proj lim"_i S_i$ over its finite quotients, including the one-point quotient. The example after #cite(label("ScholzeDiamonds")) Definition 7.8 constructs the affinoid pro-étale limit $"Spa" \( C \, cal(O)_C \) times S$ of the finite unions indexed by $S_i$; the associated-diamond construction and #cite(label("ScholzeDiamonds")) Example 11.12 and Lemma 15.2 identify its diamond with $B_C times underline(S)$. The point $"Spa" \( C \, cal(O)_C \)$ is strictly totally disconnected by #cite(label("ScholzeDiamonds")) Definition 7.15 and Proposition 7.16, so its étale covers split and finite constant coefficients have no higher cohomology there. The preceding #cite(label("ScholzeDiamonds")) Lemma 15.6 comparison transfers this assertion to the finite unions of their diamonds. The continuity statement #cite(label("ScholzeDiamonds")) Proposition 14.9 computes the étale cohomology on the limit as the filtered colimit of that on the finite unions. Its degree-zero group is $"inj lim"_i C \( S_i \, Lambda_m \) = C_(upright(c t s)) \( S \, Lambda_m \)$ and its higher groups vanish. Proposition 14.10 of the same source, valid for the coefficient ring $Lambda_m$, transfers this calculation to the v-site. Every comparison is induced by the constants map, and is natural in $S$ and in automorphisms of $C$.

For compact $G$, apply (2.5) to $S = G^a$ in every degree of (2.3). It follows that $u_(B_C \, G \, m)$ is an equivalence. The same argument applies to the finite étale fiber of $\( bb(Z) \/ p^m \) \( t \)$ over $C$, where $p$ is invertible, retaining its arithmetic action. The compatible Tate line is finite free of rank one, so its tensor factor commutes with the cochain terms and their derived coefficient limit. Thus the integral comparison for $B_C G$ is also compatible with Tate twists and arithmetic Galois actions, without a choice of basis for the Tate fiber. This geometric-point calculation is used below for the compact groups $P_n$; it is not asserted over $"Spd" k$.

For descent with geometric coefficients it is useful to retain profinite parameters. Denote by $cal(C)_(X \, m)$ the condensed derived complex whose derived value on a profinite set $S$ is

$ cal(C)_(X \, m) \( S \) = R Gamma_v \( X times underline(S) \, Lambda_m \) \, #h(2em) cal(C)_X = R #h(-1em) "proj lim"_m cal(C)_(X \, m) . $

Descent for profinite covers gives these condensed complexes. The value of $cal(C)_X$ at the point is $R Gamma_(upright(i n t)) \( X \)$. A group acting on $X$ acts continuously on this complex. The coefficient complexes used below are #emph[derived solid]: they lie in the derived category of solid condensed modules. Here is a concrete check of this condition. On an affinoid perfectoid cover, the characteristic-$p$ structure sheaf $cal(O)^flat$ has no higher cohomology, and its values with profinite parameters are continuous-function modules. Their complete linear topology expresses them as limits of discrete modules, so they are solid. Perfectoid hypercover descent computes the general $cal(O)^flat$ complex by limits of these objects; this is also the construction in #cite(label("BMR2026")) Theorem 3.2.1(iii) and Remark 3.2.2. The Artin–Schreier sequence gives the $bb(F)_p$ complex, the coefficient exact sequences give the $bb(Z) \/ p^m$ complexes, and $R #h(-1em) "proj lim"_m$ gives $cal(C)_X$. Derived solidity is preserved by these limits and extensions #cite(label("Tang2026")) Theorem 4.4(ii). This argument applies with the group action and with all the profinite parameters retained. It also gives derived $p$-completeness of $cal(C)_X$.

For compact $G$, the condensed standard resolution with its derived parameter values retained gives

$ "(2.6)" quad R Gamma \( G \, cal(C)_X \) \( * \) tilde.eq R #h(-1em) "proj lim"_m "Tot"_a R Gamma_v \( X times underline(G^a) \, Lambda_m \) tilde.eq R Gamma_(upright(i n t)) \( \[ X \/ G \] \) . $ <eq:geometric-group-descent>

Indeed all $G^a$ are profinite. In the standard resolution, the degree-$a$ derived Hom is precisely the derived parameter value on $G^a$; this is the formal condensed construction in #cite(label("Anschutz2020")) §2, pp. 5–6, before any acyclicity simplification. The parameterized complex is bounded below, and the derived totalization computes its point-valued invariants. The second comparison is quotient Čech descent at each finite level; the derived limit and totalization commute because both are limits. This is the geometric descent comparison used here. On the same bar terms, using #cite(label("Anschutz2020")) Lemma 2.2 for the source parameter value, the finite unit $underline(Lambda_m) arrow.r cal(C)_(X \, m)$ is exactly the map in (2.3). The complexes $cal(C)_(X \, m)$ and $cal(C)_X$ are concentrated in cohomological degrees at least zero, so their units factor through their degree-zero cohomology by the truncation triangle. Thus the derived-invariants map agrees with $u_(X \, G \, upright(i n t))$ after the coefficient limit, and its factorization through degree zero gives the constants bottom-row edge map.

The next lemma makes these descent groups computable from a finite complex. Its final assertion will let us use arithmetic weights known on ordinary cohomology groups while retaining the solid coefficients.

#thm([Lemma 2.1.])[
  (Finite resolutions and scalar actions).  #emph[Let $G$ be a compact $p$-adic analytic group without elements of order $p$, and let $Lambda_G = bb(Z)_p \[ \[ G \] \]$. There is a finite resolution $P_bullet arrow.r bb(Z)_p$ by finitely generated projective profinite $Lambda_G$-modules. Its length can be taken to be $dim G$. For any derived-solid $bb(Z)_p$-complex $K$ with a continuous $G$-action, the point-valued derived invariants are computed by 
$ "(2.7)" quad R Gamma \( G \, K \) \( * \) tilde.eq "Hom"_(Lambda_G) \( P_bullet \, K \) . $ <eq:finite-resolution>

 Here the right side means the finite total complex of morphisms in solid modules. In particular, invariants of a module in the heart have cohomology only in degrees $0 \, dots.h \, dim G$.]
  #emph[Suppose $K$ is bounded below and an operator $gamma$ commutes with $G$. If $gamma$ acts by $lambda_j in bb(Q)_p$ on $H^j \( K \) \( * \) \[ 1 \/ p \]$, then it acts by the same scalar on every term in the $j$th row of the rationalized descent spectral sequence 
$ H^s #scale(x: 120%, y: 120%)[\(] G \, H^j \( K \) #scale(x: 120%, y: 120%)[\)] \( * \) \[ 1 \/ p \] med arrow.r.double med H^(s + j) #scale(x: 120%, y: 120%)[\(] R Gamma \( G \, K \) \( * \) #scale(x: 120%, y: 120%)[\)] \[ 1 \/ p \] . $

 For $K = cal(C)_X$, the abutment is $H_(upright(b))^(s + j) \( \[ X \/ G \] \)$.]
] <lem:solid-resolutions>

#proof[
  First construct the resolution in profinite modules. A compact $p$-adic analytic group has a noetherian completed group ring; if it has no $p$-torsion, then $"pd"_(Lambda_G) bb(Z)_p = "cd"_p \( G \) = dim G$. Here projective dimension is in profinite modules. These results for compact groups, including the agreement with abstract finitely generated modules, are recorded in #cite(label("Venjakob2002")) §§1.1–1.2, pp. 275–276. The noetherianity input for analytic pro-$p$ groups is #cite(label("Lazard1965")) V.2.2.4; the compact-group statement uses the finite-index passage recorded by Venjakob. Choose successive finite free presentations. Noetherianity keeps their kernels finitely generated, and the projective-dimension bound makes the last syzygy projective. Their natural compact topologies give the asserted profinite resolution.
  To apply the resolution to the geometric coefficient complexes, we pass from continuous actions to solid modules over the completed group ring. Write $A = underline(bb(Z)_p) \[ underline(G) \]$ for the free condensed group ring. A continuous action on a complex means an object of $D \( A upright("-") upright(C o n d) \)$ with derived-solid underlying complex. By #cite(label("Anschutz2020")) Lemma 1.3, the group-ring analytic structure has underived solidification; its normalized ring is
  $ A^square.stroked.tiny tilde.eq underline(bb(Z)_p \[ \[ G \] \]) = underline("proj lim"_(m \, V) \( bb(Z) \/ p^m \) \[ G \/ V \]) \, $
  where $V$ runs through open normal subgroups. The ring identification, including multiplication, is #cite(label("Tang2026")) §3.6, preceding Proposition 3.21. Analyticity gives fully faithful embeddings of the #emph[unbounded] derived category of solid $G$-modules into both $D \( A upright("-") upright(C o n d) \)$ and $D \( A^square.stroked.tiny upright("-") upright(C o n d) \)$, as stated in #cite(label("Anschutz2020")) §1, pp. 3–4. The solid heart is characterized by solidity of the underlying condensed module. The essential-image criterion of Clausen–Scholze’s analytic theory extends this characterization to unbounded complexes: membership is detected on cohomology objects #cite(label("ScholzeAnalyticGeometry")) Proposition 12.4 and Remark 12.5. Thus its objects are precisely the complexes with derived-solid underlying coefficients. Consequently the external derived Hom complexes satisfy
  $ R Gamma \( G \, K \) \( * \) tilde.eq "RHom"_(A upright("-") upright(C o n d)) \( underline(bb(Z)_p) \, K \) tilde.eq "RHom"_(G upright("-") upright(S o l i d)) \( underline(bb(Z)_p) \, K \) . $
  The first identification is the external derived Hom for the condensed classifying topos $B G_(upright(p r o acute(e) t))$ #cite(label("Anschutz2020")) §2, pp. 5 and 8; the last category is that of solid $bb(Z)_p \[ \[ G \] \]$-modules by #cite(label("Tang2026")) Proposition 3.21. They apply to the given complex $K$ itself, including when its coefficients are neither profinite nor derived $p$-complete.
  The profinite resolution stays exact and projective in solid modules #cite(label("Tang2026")) Theorems 3.2 and 3.14(i). Exactness can be seen by testing on extremally disconnected profinite sets: maps from such a set lift through a surjection of profinite spaces. Each $P_i$ is a retract of $Lambda_G^(r_i)$, and
  $ "Hom"_(Lambda_G) \( Lambda_G \, M \) = M \( * \) . $
  Evaluation at the point is exact, since the point is extremally disconnected. This proves projectivity against an arbitrary solid coefficient module $M$, even when $M$ is not profinite. A bounded projective resolution computes derived Hom against any complex, which proves the displayed calculation and the amplitude assertion.
  Finally, $"Hom"_(Lambda_G) \( P_i \, H^j \( K \) \)$ is a retract of a finite sum of $H^j \( K \) \( * \)$. The retract commutes with $gamma$, because $gamma$ commutes with the $G$-action. After inverting $p$, the entire finite complex computing the $j$th row therefore has scalar action $lambda_j$. Its cohomology has the same action. This uses a scalar identity on point values only; it does not deduce an identity of condensed sheaves from their point values. Boundedness of the resolution gives a finite filtration in each total degree, so exact rationalization preserves the spectral sequence and its abutment. ◻
]

=== 2.2 Compact groups and the affine building <compact-groups-and-the-affine-building>

Put

$ J_n = { g in "GL"_n \( bb(Q)_p \) : \| det g \|_p = 1 } #h(2em) \( n = 2 \, 3 \) . $

Let $D_n$ denote the division algebra of degree $n$ whose maximal order has unit group $P_n$. We need only the following low-degree part of the rational Lie algebra calculation.

#thm([Proposition 2.2.])[
  (The group classes).  #emph[For $G = P_n$ or $J_n$, where $n = 2 \, 3$, 
$ H_(upright(b))^1 \( G \) = bb(Q)_p \, #h(2em) H_(upright(b))^2 \( G \) = 0 \, #h(2em) H_(upright(b))^3 \( G \) = bb(Q)_p . $

 For $n = 2 \, 3$ and every compact open subgroup $K subset J_n$, restriction gives an isomorphism in every degree, with the compact comparison identifying its target: 
$ H_(upright(b))^(*) \( J_n \) arrow.r^(upright(r e s)) H_(upright(b))^(*) \( K \) tilde.equiv H^(*) \( frak(g l)_n \( bb(Q)_p \) \, bb(Q)_p \) . $

 In degree three the block inclusion $J_2 arrow.r.hook J_3$ induces a nonzero map. Fix arbitrary nonzero classes 
$ e_(P_n) in H_(upright(b))^3 \( P_n \) \, #h(2em) e_(J_n) in H_(upright(b))^3 \( J_n \) . $

]
] <prop:group-classes>

#proof[
  For an inclusion $K_1 subset K_2$ of compact open subgroups of $"GL"_n \( bb(Q)_p \)$, choose a $K_2$-stable lattice $Lambda$ and then $r$ large enough that
  $ U = 1 + p^r "End"_(bb(Z)_p) \( Lambda \) subset K_1 . $
  This is a uniform subgroup normal in $K_2$. In the division-algebra case one uses a sufficiently deep congruence subgroup of $cal(O)_(D_n)^times$, which is normal in the relevant compact group. For these small groups, Lazard’s comparison is #cite(label("HKN2011")) Theorem 3.3.3 and Remark 3.3.4 with trivial $bb(Z)_p$-coefficients, followed by inversion of $p$. Its coefficient naturality, rational agreement, and group naturality are #cite(label("HKN2011")) Theorem 3.1.1(1)–(3), with numbering in the arXiv revision specified in the bibliography. Equip the uniform groups with their lower $p$-series. At these odd primes the proof of Theorem 3.3.3 gives $e = 1$, and the associated graded target is generated in degree one, as required by the group-naturality clause. Inclusions and the block homomorphisms preserve these filtrations. The common subgroup $U$ therefore identifies restriction with the identity on the same ambient Lie algebra cohomology.
  Here is why passing back to a compact group is valid even for an index divisible by $p$. For $U lt.tri K$, the augmentation and norm of the finite permutation module $bb(Z) \[ K \/ U \]$ induce, by continuous Shapiro, the identities
  $ "cor" "res" = \[ K : U \] \, #h(2em) "res" "cor" = sum_(q in K \/ U) q^(*) $
  at each finite coefficient level, compatibly with reduction in $m$. Shapiro here is the derived induction–restriction adjunction: induction for an open subgroup is a direct sum on underlying condensed modules and is exact by (AB4) #cite(label("Tang2026")) Theorems 2.2 and 2.4; restriction is also exact. Their adjunction therefore descends directly to derived categories. Its naturality identifies the permutation maps with the actual restrictions and conjugations in the finite continuous bar complexes. Apply $R #h(-1em) "proj lim"_m$ to these identities before taking cohomology and inverting $p$. Only then divide by $\[ K : U \]$. This gives $H_(upright(b))^(*) \( K \) arrow.r^tilde.op H_(upright(b))^(*) \( U \)^(K \/ U)$ by restriction, with the compact continuous-cochain interpretation of (2.2).
  The finite quotient acts trivially in every Lie degree. The Chevalley–Eilenberg complex is a finite-dimensional algebraic $"GL"_n$-representation after a splitting-field extension. Cartan’s formula $cal(L)_X = d iota_X + iota_X d$ makes the derivative of its action on cohomology zero. In characteristic zero, an algebraic action of the connected group $"GL"_n$ with zero derivative is trivial. Thus all inner automorphisms act trivially, in every degree; the same conclusion descends for the division algebra. This proves the compact restriction identification without an all-degree numerical calculation.
  After a finite splitting-field extension, either Lie algebra is $frak(g l)_n$. The finite Chevalley–Eilenberg calculation in 9 gives its asserted groups in degrees one through three, with degree-three representative
  $ \( X \, Y \, Z \) mapsto "tr" #scale(x: 120%, y: 120%)[\(] X \[ Y \, Z \] #scale(x: 120%, y: 120%)[\)] \, $
  or its reduced-trace version for $D_n$. This is the invariant-form cocycle of #cite(label("ChevalleyEilenberg1948")) §21 and #cite(label("Koszul1950")) §11; the appendix records the normalization and restriction used here. These representatives are defined over $bb(Q)_p$ and invariant under inner automorphisms, so the assertions descend from the splitting field. Restriction of the displayed form to the upper-left or lower-right $2 times 2$ block is the corresponding form for $frak(g l)_2$, whose class is nonzero. This proves the compact calculations and their compatibility.
  To pass to $J_n$, let $cal(B)_n$ be the reduced affine building of $"GL"_n \( bb(Q)_p \)$. It is contractible of dimension $n - 1$. The group $J_n$ preserves vertex types, its face stabilizers $K_sigma$ are compact open, and a chamber $Delta$ is a fundamental domain, including its faces. A proof of these building properties by lattice norms is included in 9. Write its bounded augmented cellular resolution as
  $ P_r = xor.big_(sigma subset Delta\
dim sigma = r) bb(Z) \[ underline(J_n \/ K_sigma) \] . $
  It is exact also as a complex of condensed modules. Indeed, on a profinite parameter set a continuous section of a discrete cellular chain group has finite image. Contractibility lifts each of the finitely many cycles in that image; choosing those lifts on its clopen fibers gives a continuous lift. The same exact derived induction–restriction adjunction therefore supplies continuous Shapiro for each summand. At coefficient level $Lambda_m$, applying derived Hom gives a finite filtration with graded terms $xor.big_(dim sigma = r) C_(upright(c t s))^bullet \( K_sigma \, Lambda_m \) \[ - r \]$ in $D \( upright(A b) \)$. A cellular boundary is the literal signed projection of the corresponding coset modules, so naturality of that adjunction makes each face map the signed restriction between stabilizers, with no index multiplier. All of these statements are compatible with coefficient reduction.
  Take $R #h(-1em) "proj lim"_m$ of this finite filtration. There are finitely many orbit terms in each of finitely many cellular degrees, so this step uses only finite sums and cones in the cellular direction. Taking cohomology of the resulting finite filtration gives the integral spectral sequence
  $ E_1^(r \, s) = xor.big_(sigma subset Delta\
dim sigma = r) H_(upright(i n t))^s \( K_sigma \) med arrow.r.double med H_(upright(i n t))^(r + s) \( J_n \) \, $
  with precisely those signed restriction faces. It does not interchange an infinite group-cochain totalization with the derived inverse limit. Only after this construction do we invert $p$; exact rationalization preserves the finite filtration and its abutment.
  Under the compact comparison, every restriction between face stabilizers is the identity on the same Lie algebra cohomology; any change of representatives contributes an inner conjugation, which also acts trivially. Thus each rationalized row is the cellular cochain complex of the simplex $Delta$ with constant coefficients $H^s \( frak(g l)_n \, bb(Q)_p \)$. It has cohomology only in cellular degree zero. The resulting edge map is restriction to a vertex stabilizer. Restriction further to compact open subgroups, using intersections and the compact comparison, proves the asserted canonical identifications. The block restriction can now be tested on compact open subgroups, where it is the trace calculation above. ◻
]

=== 2.3 The parabolic restriction <the-parabolic-restriction>

The relevant subgroup remembers a lattice only in each determinant line. In a basis adapted to a line it is

$ D = {mat(delim: "(", a, v; 0, A) : a in bb(Z)_p^times \, quad A in J_2 \, quad v in bb(Q)_p^(1 times 2)} subset J_3 . $

Write $rho_3 : D arrow.r.hook J_3$ for the inclusion and $rho_2 : D arrow.r J_2$ for the quotient action.

#thm([Lemma 2.3.])[
  (Unipotent acyclicity and restriction).  #emph[Inflation induces an isomorphism 
$ H_(upright(b))^(*) \( bb(Z)_p^times times J_2 \) arrow.r^(med tilde.op med) H_(upright(b))^(*) \( D \) . $

 There is a scalar $b in bb(Q)_p^times$ such that 
$ rho_3^(*) e_(J_3) = b thin rho_2^(*) e_(J_2) . $

]
] <lem:parabolic>

#proof[
  The kernel of $D arrow.r bb(Z)_p^times times J_2$ is $N = bb(Q)_p^2$, with its additive topology. Fix $m$ and exhaust it by the compact open subgroups $N_r = p^(- r) bb(Z)_p^2$ for $r gt.eq 0$. Their finite-coefficient cohomology, computed by the two-variable Koszul resolution, is
  $ H^q \( N_r \, bb(Z) \/ p^m \) = and.big^q \( bb(Z) \/ p^m \)^2 . $
  The standard bases identify restriction from $N_(r + 1)$ to $N_r$ with multiplication by $p^q$ in degree $q$: restriction multiplies each degree-one homomorphism by $p$, and is compatible with cup products. For $q > 0$ this inverse system is pro-zero; for $q = 0$ it is constant with identity transition maps.
  This calculation computes the cohomology of $N$ without a missing derived-limit term. Indeed a continuous cochain on $N$ is exactly a compatible family of cochains on the $N_r$. Restriction of cochains is surjective, since $N_r^a$ is clopen in $N_(r + 1)^a$ and a function extends by zero on its complement. Thus the ordinary inverse limit of the cochain complexes realizes their derived inverse limit. The Milnor exact sequence has $"proj lim"_r^1 = 0$ in every degree: this holds both for a constant tower with identity maps and for a pro-zero tower. It follows that the constant map is an equivalence
  $ Lambda_m arrow.r^(med tilde.op med) C_(upright(c t s))^bullet \( N \, Lambda_m \) . $
  The same proof works with coefficients $C_(upright(c t s)) \( S \, bb(Z) \/ p^m \)$ for every profinite parameter space $S$. The finite Koszul complex gives finite sums of this module, the positive-degree restrictions are again $p^q$, and extension by zero is continuous on $N_r^a times S$. The condensed standard resolution evaluated on each such parameter identifies this calculation with the internal equivalence
  $ underline(Lambda_m) arrow.r^(med tilde.op med) R Gamma \( N \, underline(Lambda_m) \) . $
  Thus it proves an equivalence of coefficient objects for extension descent. The equivalence is the map of constants, so it is equivariant under the Levi action.
  Now take $R #h(-1em) "proj lim"_m$. In degree zero the parameter modules have surjective transition maps, by lifting locally constant values, and their limit is $C_(upright(c t s)) \( S \, bb(Z)_p \)$. Hence the internal coefficient limit satisfies
  $ underline(bb(Z)_p) arrow.r^(med tilde.op med) R #h(-1em) "proj lim"_m R Gamma \( N \, underline(Lambda_m) \) . $
  At each finite level, internal descent for the split extension identifies $R Gamma \( D \, underline(Lambda_m) \)$ with $R Gamma \( bb(Z)_p^times times J_2 \, R Gamma \( N \, underline(Lambda_m) \) \)$. The Levi-equivariant constant equivalence therefore induces inflation. After point evaluation, the standard-resolution comparison identifies this map with finite continuous-cochain inflation. Taking $R #h(-1em) "proj lim"_m$ and using (2.1) gives the claimed isomorphism integrally before rationalization.
  Finally, the compact resolution for $bb(Z)_p^times$ and the finite building resolution for $J_2$ give the usual rational product calculation. Since $H_(upright(b))^(*) \( bb(Z)_p^times \)$ is exterior on one degree-one generator and $H_(upright(b))^2 \( J_2 \) = 0$, degree three of the Levi is exactly $H_(upright(b))^3 \( J_2 \)$. Thus $rho_3^(*) e_(J_3)$ is a scalar multiple of $rho_2^(*) e_(J_2)$. Restricting to the section $A mapsto "diag" \( 1 \, A \)$ shows that this scalar is nonzero, by 4. ◻
]

The vanishing just proved is specific to our order of operations. For example, continuous homomorphisms $bb(Q)_p arrow.r bb(Q)_p$ give a nonzero $H_(upright(c t s))^1 \( bb(Q)_p \, bb(Q)_p \)$, whereas the preceding integral calculation gives $H_(upright(b))^1 \( bb(Q)_p \) = 0$.

=== 2.4 The integral Drinfeld theorem <the-integral-drinfeld-theorem>

Let $Omega_C^d$ be the base change to $C$ of Drinfeld’s symmetric space over $bb(Q)_p$, the complement of the $bb(Q)_p$-rational hyperplanes in $upright(bold(P))^d$. The following precise input supplies the weights used in 17.

#thm([Theorem 2.4.])[
  (Colmez–Dospinescu–Nizioł).  #emph[For $0 lt.eq j lt.eq d$ there are compatible $"GL"_(d + 1) \( bb(Q)_p \) times "Gal" \( overline(bb(Q))_p \/ bb(Q)_p \)$-equivariant isomorphisms of groups 
$ H_(upright(i n t))^j \( Omega_C^d \) \( j \) tilde.eq "Sp"_j \( bb(Z)_p \)^(*) \, #h(2em) H_(upright(acute(e) t))^j \( Omega_C^d \, bb(F)_p \( j \) \) tilde.eq "Sp"_j \( bb(F)_p \)^(*) . $

 Here $"Sp"_j$ is the generalized Steinberg representation of #cite(label("CDN2021")) §4.1, the star denotes its continuous coefficient-linear dual with weak topology, and the right sides have trivial Galois action. These groups vanish for $j > d$, and $H_(upright(i n t))^0 \( Omega_C^d \) = bb(Z)_p$ by constants. In particular, on the untwisted integral group in degree $j$, an arithmetic Galois element $gamma$ acts by $chi_(upright(c y c)) \( gamma \)^(- j)$.]
] <thm:drinfeld>

The group calculation is #cite(label("CDN2021")) Theorem 1.1, with its integral cohomology convention. The comparison with $H_(upright(p r o acute(e) t))^j \( Omega_C^d \, hat(bb(Z))_p \( j \) \)$ is made explicitly in the proof in #cite(label("CDN2021")) §5; finite coefficient site comparison and $R #h(-1em) "proj lim"_m$ identify it with the convention above. Thus the scalar assertion holds on the integral point groups themselves. To identify the stated degree-zero map, choose a $C$-point of $Omega_C^d$ by taking $d + 1$ coordinates linearly independent over $bb(Q)_p$. By (2.5), evaluation there splits the constants unit at each finite level and after $R #h(-1em) "proj lim"_m$. The cited calculation makes $H_(upright(i n t))^0 \( Omega_C^d \)$ a free rank-one $bb(Z)_p$-module, so this split inclusion from $bb(Z)_p$ is an isomorphism. This identifies the actual constants map locally from the degree-zero calculation. Applying 3 to a compact open uniform subgroup of $J_(d + 1)$ propagates it to the group-cohomology rows, without any assumption about cohomology of a rationalized sheaf.

== 3 The completed coheight-one tower <sec:completed-tower>

We now construct the geometric and spectral comparison objects used by the detector. The spectral output is a pair of equivariant maps from the two Morava theories to a completed height-two theory. We also need descent for each coefficient module and ordinary $K \( 2 \)$-locality of every profinite evaluation. These properties allow the later coefficient calculation to detect the canonical localization map. The inputs from Barthel–Mann–Ray–Schlank–Senger–Weinstein–Zhou include the characteristic-$p$ tower, its cohomology calculations, and the tensor and completion constructions in the version dated 26 August 2026 #cite(label("BMR2026")). We first establish the connected target and its coefficient descent. We then construct the map from height three by splitting a completed connected–étale group. The detailed oriented deformation argument is given in 11.

=== 3.1 The characteristic-$p$ tower <the-characteristic-p-tower>

Recall that $k = bb(F)_(p^6)$ and that the height-$n$ Honda groups $Gamma_n$ are over $k$, for $n = 2 \, 3$. All their geometric endomorphisms are defined over $k$. Let $D_n$ be the division algebra of invariant $1 \/ n$ over $bb(Q)_p$, with the convention identifying

$ P_n = "Aut"_k \( Gamma_n \) = cal(O)_(D_n)^times \, #h(2em) N_n : P_n arrow.r bb(Z)_p^times $

with its reduced norm. Thus $P_n$ is the nonextended stabilizer. Set

$ P_n^1 = N_n^(- 1) \( mu_(p - 1) \) \, #h(2em) overline(Z) = P_3 \/ P_3^1 tilde.eq bb(Z)_p \, #h(2em) G = P_3 times P_2 \, #h(2em) H = P_2 times overline(Z) . $

The identification of $overline(Z)$ with $bb(Z)_p$ will not require a choice of generator. We write $cal(E)_n^0 = cal(O) \( 1 \/ n \)$ for the corresponding rank-$n$, degree-one Fargues–Fontaine bundle. A $P_n$-structured form $cal(E)_n$ means a form whose torsor of frames has been reduced from $D_n^times$ to $cal(O)_(D_n)^times$. Equivalently, its determinant framing is specified up to $bb(Z)_p^times$; this is determinant lattice data, not a lattice in a rank-$n$ rational local system.

The height-exactly-two stratum of the height-three deformation space is the Laurent field

$ K = k \( \( u_2 \) \) \, #h(2em) p = u_1 = 0 \, quad u_2 eq.not 0 . $

Let $L \/ K$ be the Gross–Torii extension classifying the isomorphisms $\( Gamma_2 \)_L tilde.eq \( Gamma_(3 \, L)^(upright(u n)) \)^compose$, and let $hat(L)$ be its valued-field completion. The two change-of-framing actions give the continuous $G$-action on $hat(L)$. Fix compatible determinant identifications for the two Honda isocrystals, and hence an identification $iota : det cal(E)_3^0 tilde.eq det cal(E)_2^0$. These choices exist over $k$: the determinant identifications in #cite(label("BMR2026")) §2.7 require $bb(F)_(p^2) subset k$.

#thm([Proposition 3.1.])[
  (The completed tower).  #emph[The field $hat(L)$ is perfectoid of characteristic $p$, and is isomorphic, as a valued field over $k$, to the completed perfection of a Laurent-series field: 
$ hat(L) tilde.eq (union.big_(r gt.eq 0) k \( \( z^(1 \/ p^r) \) \))^and . $

 There is a $G$-equivariant identification of v-sheaves over $"Spd" k$ 
$ "Spd" hat(L) tilde.eq "Surj" \( cal(E)_3^0 \, cal(E)_2^0 \) . $

 Consequently 
$ Y = \[ "Spd" hat(L) \/ G \] $

 classifies surjections $cal(E)_3 arrow.r.twohead cal(E)_2$ between $P_n$-structured forms. In particular $Y$ carries the universal surjection used below.]
  #emph[Let $S_3 = ker N_3$ and $T_3 = P_3 \/ S_3 = bb(Z)_p^times$. Then 
$ \[ "Spd" hat(L) \/ S_3 \] tilde.eq "BC" \( - 1 \/ 2 \)^(*) $

 as v-sheaves, with the following residual $P_2 times T_3$-action. On extension classes in $"Ext"^1 \( cal(E)_2^0 \, cal(O) \)$, write $lambda_(*)$ for pushout by $lambda$ on $cal(O)$ and $b^(*)$ for pullback by $b$ on $cal(E)_2^0$. For the framing action $f mapsto b f g^(- 1)$ and $a = N_3 \( g \)$, the action is 
$ \( b \, a \) dot.op xi = #scale(x: 120%, y: 120%)[\(] a N_2 \( b \)^(- 1) #scale(x: 120%, y: 120%)[\)]_(*) \( b^(- 1) \)^(*) xi . $

 In particular, the $T_3$-action is pushout by $a$ on the kernel. Only this restriction of the action on the extension chart is used below.]
] <prop:tower>

#proof[
  The imported result is #cite(label("BMR2026")) Proposition 2.7.1(1)–(5), whose hypotheses are $h gt.eq 2$, a perfect field containing $bb(F)_(p^(h \( h - 1 \)))$, and the coheight-one Gross–Torii extension with the specified determinant identifications. Here $h = 3$ and $k = bb(F)_(p^6)$ satisfy those hypotheses exactly.
  We recall why its formulation gives all surjections and the indicated structure groups. The infinite-level two-tower theorem #cite(label("BMR2026")) Theorem 2.6.3, followed by forgetting the étale framing, identifies $"Spd" hat(L)$ with exact sequences
  $ 0 arrow.r cal(O) arrow.r cal(E)_3^0 arrow.r cal(E)_2^0 arrow.r 0 $
  whose determinant identification is $iota$. Forgetting that framing is the $bb(Z)_p^times$-torsor in the proof of #cite(label("BMR2026")) Proposition 2.7.1(2). Given a surjection, its kernel is the line $det cal(E)_3^0 ⊗ \( det cal(E)_2^0 \)^(- 1)$; the fixed $iota$ trivializes this line and recovers the sequence. Thus no additional condition is imposed on the surjection. Descent along the two framing torsors gives exactly the asserted description of $Y$, also in families.
  Quotienting by $S_3$ instead allows the source bundle to vary while retaining its determinant trivialization. It therefore classifies extensions
  $ 0 arrow.r cal(O) arrow.r cal(E) arrow.r cal(E)_2^0 arrow.r 0 $
  with middle term of slope $1 \/ 3$. By #cite(label("BMR2026")) Proposition 2.7.1(5), these are precisely the extensions that are nonsplit at every geometric point, which form $"BC" \( - 1 \/ 2 \)^(*)$.
  To specify the joint action, let $i_f : cal(O) arrow.r cal(E)_3^0$ be the kernel injection normalized by $iota$. If $f' = b f g^(- 1)$, the determinant isomorphisms for the two exact sequences give
  $ g i_f = i_(f') thin N_3 \( g \) N_2 \( b \)^(- 1) . $
  Indeed, $g$ acts on the source determinant by $N_3 \( g \)$ and $b$ acts on the target determinant by $N_2 \( b \)$. The induced diagram of extensions therefore has kernel map $N_3 \( g \) N_2 \( b \)^(- 1)$ and quotient map $b$. Functoriality of extensions by pushout and pullback proves the displayed $P_2 times T_3$-action. This calculation is an identity of bundle maps on every test object and commutes with base change. For $b = 1$, it is pushout by $a = N_3 \( g \)$. On the extension group, $a_(*) = \( a I_2 \)^(*)$, so this is the action by inverse pullback of the central scalar $a^(- 1) I_2$. The underlying quotient and this $T_3$ restriction are the parts of #cite(label("BMR2026")) Proposition 2.7.1(5) used below; the joint action includes the target determinant factor just computed. The field assertions are parts (1) and (4) of the same proposition. ◻
]

=== 3.2 Acyclicity of constants <acyclicity-of-constants>

Choose $C = bb(C)_p$ and a map $"Spd" C arrow.r "Spd" k$, and write $Y_C$ for base change over $"Spd" k$. Put

$ tilde(Y) = "Spd" hat(L) \, #h(2em) tilde(Y)_C = tilde(Y) times_("Spd" k) "Spd" C . $

The quotient torsors $tilde(Y) arrow.r Y$ and $tilde(Y)_C arrow.r Y_C$ give classifying maps

$ Y arrow.r B_k G = \[ "Spd" k \/ underline(G) \] \, #h(2em) Y_C arrow.r B_C G = \[ "Spd" C \/ underline(G) \] . $

These are relative classifying stacks; the nonextended actions fix their respective bases. If $q_n : G arrow.r P_n$ is projection, the classes denoted below by $e_(P_n) \|_Y$ and $e_(P_n) \|_(Y_C)$ mean respectively $u_(tilde(Y) \, G \, upright(b)) \( q_n^(*) e_(P_n) \)$ and $u_(tilde(Y)_C \, G \, upright(b)) \( q_n^(*) e_(P_n) \)$. Their base-change compatibility is (2.4) for $tilde(Y)_C arrow.r tilde(Y)$, already at each finite level. Introduce

$ X = \[ "Spd" hat(L) \/ P_3^1 \] \, #h(2em) X_C = X times_("Spd" k) "Spd" C \; quad Y = \[ X \/ H \] \, quad Y_C = \[ X_C \/ H \] . $

The notation $cal(O)^flat$ denotes the characteristic-$p$ structure sheaf. Cohomology with these coefficients is derived solid cohomology; on the group quotients used here, quotient descent computes it as continuous derived invariants of the parameterized geometric coefficient complex. The comparisons with integral constant coefficients will be made in 19.

#thm([Proposition 3.2.])[
  (Acyclicity of the maps of constants).  #emph[The actual maps of constants induce equivalences 
$ "(3.1)" quad k & arrow.r^(med tilde.op med) R Gamma \( P_3^1 \, hat(L) \) \,\
C^flat & arrow.r^(med tilde.op med) R Gamma_v \( X_C \, cal(O)^flat \) . $ <eq:finite-constant-map>

 These are equivalences of derived solid algebras with residual $H$-action. The $H$-action on the left sides is trivial. The maps are natural for the change of constants $k arrow.r C^flat$ and for the arithmetic actions preserving the chosen base data.]
] <prop:constant-acyclicity>

#proof[
  Apply the underlying cohomology calculation of #cite(label("BMR2026")) Proposition 3.6.9 to the quotient in 7, retaining only its $T_3$-action. The map of constants and the vanishing in the other degrees give a fiber sequence of derived solid $k$-modules with $T_3$-action
  $ k arrow.r R Gamma \( S_3 \, hat(L) \) arrow.r k_(chi_T) \[ - 3 \] . $
  Here $chi_T$ denotes the actual character on the line in degree three. This is the restriction of the argument combining quotient descent and cohomology in #cite(label("BMR2026")) Theorem 3.6.10 that is needed here. For $b = 1$, the action formula in 7 is pushout by $a in T_3$ on the kernel. On the extension group this equals pullback by $a I_2$, or the action by inverse pullback of $a^(- 1) I_2$. The reduced norm of $a I_2$ in $D_2^times$ is $a^2$. Hence the subgroup
  $ P_3^1 \/ S_3 = mu_(p - 1) subset T_3 $
  acts on the last term by $alpha mapsto alpha^2$ or $alpha mapsto alpha^(- 2)$; either convention gives the same vanishing used below. The displayed exponent is also checked in #cite(label("BMR2026")) Lemma 5.2.5. This is a subgroup of the norm quotient; it must not be replaced by the central $mu_(p - 1)$ in $P_3$. Since $p gt.eq 5$, this character is nontrivial. The averaging idempotent for the finite group $mu_(p - 1)$ is defined in characteristic $p$, so its derived invariants are exact and annihilate $k_(chi_T)$. Taking these invariants proves that the underlying map in (3.1) is an equivalence. The map itself is $H$-equivariant: it is induced by constants from the original $G$-action on $hat(L)$, followed by $P_3^1$-descent, and $G$ fixes $k$. The forgetful functor from $H$-equivariant objects detects equivalences, so this gives the required equivalence with its full residual action. No splitting of the fiber sequence or joint character formula is needed.
  For completeness, the finite-field hypothesis in this import is substantive. Its proof uses the solid Frobenius comparison #cite(label("BMR2026")) Lemma 3.6.3 and Corollary 3.6.8 for $#scale(x: 120%, y: 120%)[\(] union.big_(r gt.eq 0) k \( \( z^(1 \/ p^r) \) \) #scale(x: 120%, y: 120%)[\)]^and$ over a #emph[finite] field $k$. The geometric base change of this point is a punctured perfectoid ball; the proof solves coefficient Frobenius minus identity on its convergent functions and then requires surjectivity in solid modules. For this precise function ring, 27 supplies a continuous section and hence proves surjectivity on every profinite parameter space. This justifies the solid enhancement directly, without applying a linear open-mapping theorem to Frobenius minus identity. The resulting natural comparison commutes with the $S_3$-action. Thus 7 verifies the required hypothesis before finite-field descent is applied.
  For the geometric statement, take a quadratic extension $F \/ bb(Q)_p$ that is a maximal subfield of $D_2$. Proposition 3.1.2 of #cite(label("BMR2026")) identifies
  $ #scale(x: 120%, y: 120%)[\(] "BC" \( - 1 \/ 2 \)^(*) #scale(x: 120%, y: 120%)[\)]_C tilde.eq \[ cal(H)_(F \, C)^1 \/ F \] \, $
  where $cal(H)_(F \, C)^1$ is the one-dimensional Drinfeld upper half-plane for $F$ and the additive group $F$ acts by translations. This identification is equivariant for the central $bb(Q)_p^times$. It is distinct from the rank-$n$ Drinfeld space $Omega_C^(n - 1)$ used in the modification argument. Proposition 3.5.6 of #cite(label("BMR2026")) computes the solid $cal(O)^flat$-cohomology of this quotient: it is $C^flat$ in degree zero, a character line in degree $\[ F : bb(Q)_p \] + 1 = 3$, and zero otherwise. By the $b = 1$ action formula in 7, this norm-quotient $mu_(p - 1)$ acts by kernel scalars. Expressing those as central pullbacks on the target gives reduced-norm character $alpha mapsto alpha^2$ or its inverse. Both are nontrivial, so the top cohomology has no $mu_(p - 1)$-invariants; the choice of action or dual convention does not affect the conclusion. The degree-zero identification is the map of constants. Applying the same averaging argument proves (3.1).
  Only central equivariance of the Drinfeld description was needed to prove this vanishing. The constant map on $X_C$ itself has the full residual $H$-equivariance, and an equivariant map is an equivalence when its underlying map is. This proves the full assertion, without assuming a $P_2$-equivariant splitting or a larger equivariance of that chart. Finally, the actions of $P_2$ and $overline(Z)$ are over the fixed base, so they fix $k$ and $C^flat$ pointwise. All arrows used above are induced by structure maps and group descent; their stated naturality follows. ◻
]

=== 3.3 Completed Lubin–Tate theory and coefficient descent <completed-lubintate-theory-and-coefficient-descent>

Write $E_n = E \( k \, Gamma_n \)$ for ordinary Morava $E$-theory and $E_n^square.stroked.tiny = E^square.stroked.tiny \( k^delta \, Gamma_n \)$ for its solid enhancement, where $k^delta$ is the discrete solid ring. For the valued field $hat(L)$, its solid ring of parameters is

$ hat(L) \( T \) = C_(upright(c t s)) \( T \, hat(L) \) $

on profinite sets $T$. Define

$ hat(B)^square.stroked.tiny = E^square.stroked.tiny \( hat(L) \, \( Gamma_2 \)_(hat(L)) \) . $

Here $pi_t$ of a solid spectrum is its solid homotopy module; $\( * \)$ will denote evaluation in ordinary spectra at the one-point set. In this section and in Section 6, Section 7, $H^s \( A \, M \)$ denotes the point-valued continuous cohomology $H^s \( \( R Gamma \( A \, M \) \) \( * \) \)$ for a solid coefficient module $M$.

#thm([Proposition 3.3.])[
  (The completed theory and its coefficients).  #emph[There are continuous $G$-equivariant maps of solid $E_oo$-rings 
$ "(3.2)" quad E_3^square.stroked.tiny arrow.r hat(B)^square.stroked.tiny arrow.l E_2^square.stroked.tiny \, $ <eq:completed-map>

 where $G$ acts through $P_3$ on the first source and through $P_2$ on the second. The right arrow is canonical connected base change. The target is even periodic, with 
$ pi_0 hat(B)^square.stroked.tiny \( * \) tilde.eq W \( hat(L) \) \[ \[ u'_1 \] \] . $

 Invariantly, its coefficients are complete base changes of the height-two deformation ring and its invertible even coefficient lines. The natural map $W \( hat(L) \) arrow.r pi_0 hat(B)^square.stroked.tiny$ is $G$-equivariant. Every profinite evaluation $hat(B)^square.stroked.tiny \( T \)$ is an ordinary $K \( 2 \)$-local spectrum.]
  #emph[The second map in (3.2) induces an $H$-equivariant equivalence 
$ E_2^square.stroked.tiny arrow.r^(med tilde.op med) \( hat(B)^square.stroked.tiny \)^(h P_3^1) \, $

 where $overline(Z)$ acts trivially on the source. Moreover, for every $t in bb(Z)$ it induces an equivalence on the individual coefficient complexes 
$ pi_t E_2^square.stroked.tiny arrow.r^(med tilde.op med) R Gamma \( P_3^1 \, pi_t hat(B)^square.stroked.tiny \) . $

 In particular, for $s gt.eq 0$ and all $t$ there are natural isomorphisms 
$ "(3.3)" quad H^s \( H \, pi_t E_2^square.stroked.tiny \) arrow.r^(med tilde.op med) H^s \( G \, pi_t hat(B)^square.stroked.tiny \) . $ <eq:coefficient-descent>

 These comparisons preserve the coefficient maps from Witt constants.]
  #emph[Finally, put $Delta = "Gal" \( k \/ bb(F)_p \)$ and $G_n = P_n times.r Delta$. The ordinary stabilizer-descent identification is 
$ #scale(x: 120%, y: 120%)[\(] \( E_n^square.stroked.tiny \)^(h G_n) #scale(x: 120%, y: 120%)[\)] \( * \) tilde.eq L_(K \( n \)) S \, #h(2em) n = 2 \, 3 \, $

 compatibly with the canonical maps to $E_n$.]
] <prop:completed-theory>

The following subsections prove the proposition. Its coefficient statements concern the connected base-change map from $E_2$. We prove them independently of the map from $E_3$; that map will be attached to the same endpoint by the oriented splitting construction below.

=== 3.4 The connected endpoint and its coefficients <the-connected-endpoint-and-its-coefficients>

For the Honda pairs over $k$, the deformation ideals are $\( p \, u_1 \, u_2 \)$ at height three and $\( p \, u'_1 \)$ at height two. They are finite regular sequences in the respective deformation rings. The connected completed pair uses the Noetherian pair $\( k \, Gamma_2 \)$ as a witness: every $C_(upright(c t s)) \( T \, hat(L) \)$ is perfect, since inverse Frobenius is continuous, and flat over $k$. Thus the endpoint formulas of #cite(label("BMR2026")) Proposition 4.5.5 apply through this fixed witness. The finite Koszul argument below explains the reduction through hypersheafification and totalization in these instances.

The pointwise coefficient formula and the coefficient-line base change follow from #cite(label("BMR2026")) Lemma 4.2.12 and Proposition 4.5.5, applied to the constant connected height-two group. The formal parameter $u'_1$ is a coordinate inherited from a deformation coordinate for $E_2$; no assertion that $P_2$ fixes this parameter is intended. Witt vectors and power series carry their limit structures on profinite parameters. Functoriality of the perfect-residue-ring deformation construction gives the asserted map of Witt constants. The same pointwise description, together with #cite(label("BMR2026")) Proposition 4.4.2, proves $K \( 2 \)$-locality of every evaluation.

The same formulas identify the condensed connected theory $E^(upright(c o n d)) \( hat(L) \, \( Gamma_2 \)_(hat(L)) \)$ with $hat(B)^square.stroked.tiny$. For a profinite set $T$, its evaluation is

$ E #scale(x: 120%, y: 120%)[\(] C_(upright(c t s)) \( T \, hat(L) \) \, \( Gamma_2 \)_(C_(upright(c t s)) \( T \, hat(L) \)) #scale(x: 120%, y: 120%)[\)] . $

The canonical connected base-pair map defines

$ c^square.stroked.tiny : E_2^square.stroked.tiny arrow.r hat(B)^square.stroked.tiny . $

It is continuous $G$-equivariant by functoriality of the connected base-pair construction: $P_3$ acts through the base and $P_2$ changes the connected framing. In particular $G$ acts on its source through $P_2$. The family naturality is checked in 11, before constructing the oriented section. The coefficient and locality statements above apply to this endpoint without using the full completed intermediate.

We give the coefficient argument separately from the spectral one. Proposition 4.3.12 of #cite(label("BMR2026")) states the following descent result: if $\( R \, Gamma \)$ is a Noetherian Luriean pair and $S^(- 1) arrow.r S^bullet$ is an augmented cosimplicial diagram of flat, relatively perfect $R$-algebras which is a limit diagram in derived commutative rings, then both

$ E \( S^(- 1) \, Gamma \) arrow.r "Tot" E \( S^bullet \, Gamma \) quad upright("and") quad pi_(2 j) E \( S^(- 1) \, Gamma \) arrow.r "Tot" pi_(2 j) E \( S^bullet \, Gamma \) $

are equivalences; the latter totalization is in $D \( bb(Z) \)$. We use this statement for fixed witnesses with finite regular deformation ideals, and give the finite Koszul justification for their reduction through totalization. For any one witness $\( R_0 \, Gamma_0 \)$, put $A_0 = pi_0 E \( R_0 \, Gamma_0 \)$ and $I_0 = ker \( A_0 arrow.r R_0 \)$. Assume the indicated generators of $I_0$ form a finite regular sequence. Thus $R_0 = A_0 \/ I_0$ has a finite free Koszul resolution and is a perfect $A_0$-module. Each profinite hypercover diagram for that endpoint is $A_0$-linear by functoriality from its fixed witness. For the final bar diagram this is $A_0 = W \( k \) \[ \[ u'_1 \] \]$ and $I_0 = \( p \, u'_1 \)$; its maps are $A_0$-linear because $P_3^1$ acts trivially on the $E_2$ source. Derived tensor with $R_0$ therefore commutes with all limits in $D \( A_0 \)$, including each of these totalizations.

By #cite(label("BMR2026")) Lemma 4.2.12, the coefficient objects are derived $I_0$-complete and their derived reductions are the characteristic-$p$ terms in the augmented diagram. The comparison cone is again derived complete, since complete objects are closed under limits and cofibers. Its reduction modulo $I_0$ vanishes by the characteristic-$p$ limit diagram. If $I_0 = \( x_1 \, dots.h \, x_c \)$, each quotient by $\( x_1^m \, dots.h \, x_c^m \)$ has a finite filtration with subquotients finite free over $R_0$. The cone therefore vanishes modulo all these quotients. Their ideals are cofinal with powers of $I_0$, so derived completeness implies that the cone vanishes. Tensoring with an invertible even coefficient line also preserves limits. This proves the required individual-coefficient comparison for every even degree at every endpoint; the odd coefficient modules vanish. The argument uses the perfect Koszul quotient for the tensor–totalization interchange.

===== 3.4.1 From coefficient descent to spectral descent. <from-coefficient-descent-to-spectral-descent.>

These coefficient comparisons also give the spectral comparisons in ordinary spectra. They give descent for each Eilenberg–Mac Lane layer, because the forgetful functor from $H bb(Z)$-modules preserves limits; exactness of totalization then gives descent for every finite Postnikov interval. For an augmented cosimplicial spectrum $Z^(- 1) arrow.r Z^bullet$, fix $b$ and $q lt.eq b$. The canonical fiber sequence

$ tau_(\[ q - 1 \, b \]) Z arrow.r tau_(lt.eq b) Z arrow.r tau_(lt.eq q - 2) Z $

has a $\( q - 2 \)$-coconnective last term, and totalization preserves this bound. Hence the first arrow induces an isomorphism on $pi_q$ both on the augmentation object and after totalization. The finite-interval comparison therefore proves the degree-$q$ comparison for $tau_(lt.eq b) Z$. Degrees above $b$ vanish on both sides. Thus $tau_(lt.eq b) Z^(- 1) arrow.r "Tot" tau_(lt.eq b) Z^bullet$ is an equivalence for every $b$. Taking the limit over $b$, using Postnikov completeness of ordinary spectra and commutation of limits, proves the spectral comparison without a bounded-below assumption.

===== 3.4.2 Descent along the completed tower. <descent-along-the-completed-tower.>

Apply the descent result to $\( R \, Gamma \) = \( k \, Gamma_2 \)$ and the $P_3^1$-bar diagram of $hat(L)$, augmented by the constants $k$; its map of theories is $c^square.stroked.tiny$. To justify the application in the solid category, evaluate first on an extremally disconnected profinite parameter set $T$. Such evaluation is exact on condensed modules and preserves limits; moreover, the forgetful functor from derived commutative algebras creates limits and detects equivalences. Thus (3.1) identifies

$ C_(upright(c t s)) \( T \, k \) med tilde.eq med "Tot" C_(upright(c t s)) #scale(x: 120%, y: 120%)[\(] \( P_3^1 \)^bullet times T \, hat(L) #scale(x: 120%, y: 120%)[\)] $

in derived commutative rings. All displayed rings are perfect and flat over $k$, hence relatively perfect. The restricted descent argument therefore applies to this diagram. The endpoint formulas of Proposition 4.5.5 and the cotensor comparison of Remark 4.5.6 in #cite(label("BMR2026")), with the witness verification above, identify its spectral and coefficient terms with the evaluations of the required solid objects and their profinite cotensors. Extremally disconnected parameter sets detect equivalences; thus this proves both the spectral and individual-coefficient assertions for $c^square.stroked.tiny$. Odd coefficient modules vanish on both sides. This also proves the specialization of #cite(label("BMR2026")) Theorem 5.2.6, whose numerical hypothesis is exactly $p - 1 divides.not 2$. Every comparison is induced by the same augmented diagram and its commuting actions. It therefore retains the residual $H$-action and the maps from Witt constants; $overline(Z)$ acts trivially on the $E_2$ source.

=== 3.5 The map from height three <the-map-from-height-three>

The connected theory now has the coefficient descent and locality needed for detection. To map the height-three sphere into it, we start with the tensor construction and then pass from the full completed group to its connected summand. The direction of this last map requires a section of the deformation functor, rather than the forgetful transformation alone.

The uncompleted tensor maps are the starting point. Examples 4.6.2–4.6.3 of #cite(label("BMR2026")) use the pointwise constructions of Theorems 4.4.6 and 4.4.8, followed by Construction 4.5.2, to give

$ E_3^square.stroked.tiny arrow.r L_(K \( 2 \))^square.stroked.tiny E_3^square.stroked.tiny arrow.r B^square.stroked.tiny arrow.l E_2^square.stroked.tiny \, $

where

$ B^square.stroked.tiny = L_(K \( 2 \))^square.stroked.tiny \( E_3^square.stroked.tiny ⊗_(S W \( k \))^square.stroked.tiny E_2^square.stroked.tiny \) tilde.eq E^square.stroked.tiny \( L \, Gamma_(3 \, L)^(upright(u n)) \) . $

Here $S W \( k \)$ is the spherical Witt-vector ring and $L_(K \( 2 \))^square.stroked.tiny$ is localization in solid spectra. These maps have the projection actions, as in #cite(label("BMR2026")) (5.2.2)–(5.2.3). The tensor construction uses the constant pair $\( k \, Gamma_2 \)$, whose base is Noetherian and perfect and whose group is connected of height two, as required in #cite(label("BMR2026")) Construction 4.4.7. The fixed-witness descent argument above identifies the required hypersheafifications once the following regular quotient is checked.

For the localized $K$-pair and its uncompleted ind-étale $L \/ K$ extension, the witness has classical deformation ring

$ A_K = #scale(x: 120%, y: 120%)[\(] W \( k \) \[ \[ u_1 \, u_2 \] \] \[ u_2^(- 1) \] #scale(x: 120%, y: 120%)[\)]_(\( p \, u_1 \))^and \, #h(2em) A_K \/ \( p \, u_1 \) = K . $

The sequence $\( p \, u_1 \)$ remains regular under localization and this Noetherian completion. The localized witness is Noetherian Luriean by #cite(label("BMR2026")) Proposition 4.4.4 and Remark 4.2.2; the displayed $p$-basis below also verifies that $K$ is $F$-finite. The profinite witness hypotheses are #cite(label("BMR2026")) Propositions 4.5.9, 4.5.10, and 4.5.12, Definition 4.5.11, and Examples 4.6.1–4.6.3. Concretely, $K \( T \) = C_(upright(c t s)) \( T \, K \)$ is flat over the field $K$ and relatively perfect: the decomposition $K = xor.big_(j = 0)^(p - 1) u_2^j K^p$ has continuous coefficient-extraction maps and hence applies to continuous functions on $T$. Compactness of $T$ supplies a uniform denominator for inversion of $u_2$. This verifies the local-field instance directly; no commutation of arbitrary localization with totalization is required. The ind-étale $L$-extension retains the same witness as in Proposition 4.5.12.

#thm([Lemma 3.4.])[
  (The completed oriented projection).  #emph[Put $F = hat(L) \( * \)$, regarded here as the ordinary completed field. For a nonempty profinite set $T$, put $R_T = C_(upright(c t s)) \( T \, F \)$ and let $Gamma_T = Gamma_(3 \, R_T)^(upright(u n))$ be the full completed $p$-divisible group. Let $C_T$ be the base change of the connected term in the uniquely split sequence over $F$. It is identified with $\( Gamma_2 \)_(R_T)$ by the fixed tautological Gross–Torii formal isomorphism. There is a continuous adic $E_oo$-map 
$ r_T : E \( R_T \, Gamma_T \) arrow.r E \( R_T \, C_T \) . $

 The maps are natural for profinite pullbacks and every continuous $G = P_3 times P_2$ family of pair maps. With the terminal value at the empty parameter set, pointwise application and hypersheafification give a continuous $G$-equivariant map of condensed $E_oo$-rings 
$ r^(upright(c o n d)) : E^(upright(c o n d)) \( hat(L) \, Gamma_(3 \, hat(L))^(upright(u n)) \) arrow.r E^(upright(c o n d)) \( hat(L) \, C_(hat(L)) \) . $

]
  #emph[Let $b_T : E_2 arrow.r E \( R_T \, Gamma_T \)$ be the pointwise ordinary $E_2$ tensor-factor map followed by completion, and let $c_T : E_2 arrow.r E \( R_T \, C_T \)$ be the canonical connected map induced by $k arrow.r R_T$. Then $r_T b_T tilde.eq c_T$, naturally for the same parameters and pair families. This homotopy preserves the connected residue tag and orientation, and hence its coefficient and even-line maps. After condensation and solid localization, it gives 
$ r^(upright(c o n d)) b^square.stroked.tiny tilde.eq c^square.stroked.tiny $

 as continuous $G$-equivariant maps of underlying solid spectra, where $b^square.stroked.tiny$ is the tensor-factor map followed by completion and $c^square.stroked.tiny$ is the canonical connected base-change map.]
] <lem:completed-oriented-map>

#proof[
  #emph[Construction; full proof in 11.] Fix a parameter set $T$. Write $cal(D)_Gamma^(upright(o r))$ and $cal(D)_C^(upright(o r))$ for oriented deformations with the specified residue tags of the full and connected reference groups. The connected–étale sequence is uniquely split over the perfect field $F$. Let $Q_T$ be the base change of its étale quotient, so $Gamma_T = C_T xor Q_T$. An oriented deformation $C_A$ over a complete adic test ring $A$ has a contractible space of lifts of the tagged étale quotient $Q_T$. With such a marked lift $Q_A$, send it to $C_A xor Q_A$, retaining its connected orientation. This constructs $frak(s)$ in the left diagram:
  $ "(3.4)" quad "\n\n\\begin{tikzcd}[column sep=large]\n \\mathscr{D}_C^{\\mathrm{or}}\n    \\arrow[r,bend left=18,\"\\mathfrak{s}\"]\n &\\mathscr{D}_\\Gamma^{\\mathrm{or}}\n    \\arrow[l,bend left=18,\"\\mathfrak{f}\"]\n\\end{tikzcd}\n\\qquad\n\\begin{tikzcd}[column sep=large]\n E(R_T,C_T)\\arrow[r,bend left=18,\"i_T\"]\n &E(R_T,\\Gamma_T)\\arrow[l,bend left=18,\"r_T\"] .\n\\end{tikzcd}\n" $ <eq:oriented-section-diagram>
  Here $frak(f)$ takes the connected deformation, and $frak(f) frak(s) tilde.eq upright(i d)$. Corepresentability reverses the arrows and gives $r_T i_T tilde.eq upright(i d)$. In particular the required map is $r_T$, supplied by the split section. The forgetful map alone supplies $i_T$ in the other direction.
  The tensor-factor identity keeps track of which connected map results. The tensor construction compares the two oriented formal groups through their common Quillen formal group. On the split deformation its comparison is the inverse of the connected inclusion. The resulting connected tag and orientation are therefore exactly those defining $c_T$, so $r_T b_T tilde.eq c_T$. The appendix verifies this cancellation on the actual tags and proves its compatibility with adic refinement and every continuous group-family map. It then upgrades the identity to the continuous solid maps in the statement. This identifies the right-hand tensor composite with the canonical map used in coefficient descent. ◻
]

Completion of the pair diagrams followed by the constructed map gives

$ B^square.stroked.tiny arrow.r E^(upright(c o n d)) \( hat(L) \, Gamma_(3 \, hat(L))^(upright(u n)) \) arrow.r^(r^(upright(c o n d))) hat(B)^square.stroked.tiny . $

The completion map is #cite(label("BMR2026")) Example 4.6.4; the full completed pair uses the perfect-field witness verified in 11. The composite from $E_3^square.stroked.tiny$ is therefore an actual continuous equivariant ring map. Take this composite and $c^square.stroked.tiny$ as the arrows in (3.2). The later detection argument uses this unital equivariant map from $E_3^square.stroked.tiny$ and the coefficient descent for $c^square.stroked.tiny$. The identity $r^(upright(c o n d)) b^square.stroked.tiny tilde.eq c^square.stroked.tiny$ also identifies the right arrow with the $E_2$ tensor composite. This construction uses no coefficient formula or locality assertion for the nonconnected intermediate, and does not assert that $K arrow.r hat(L)$ is relatively perfect.

=== 3.6 The ordinary sphere source <the-ordinary-sphere-source>

It remains to identify the source and the sphere unit after evaluation. We first spell out the effect of hypersheafification at the point. Let $a_(upright(h y p))$ be hypersheafification on profinite sets with the finite jointly surjective topology. Every covering sieve of the one-point set is maximal: a nonempty member of a covering family has a point and hence a section. Consequently associated-sheaf formation for abelian presheaves leaves their point value unchanged. The unit $P arrow.r a_(upright(h y p)) P$ for a spectrum-valued presheaf is an isomorphism on associated homotopy sheaves. Evaluating these sheaves at the point therefore gives an isomorphism on every ordinary homotopy group, and hence

$ P \( * \) arrow.r^tilde.op \( a_(upright(h y p)) P \) \( * \) . $

This proof applies to the accessible presheaves on full profinite sets used here and is natural in the unit. It is the full-profinite version of #cite(label("Clausen2025")) Lemma 13.5 and Remark 13.6; the discrete spectra are solid by Example 13.4(1) there.

Definition 4.5.7 of #cite(label("BMR2026")) computes condensed localization by pointwise ordinary localization followed by hypersheafification, and its restriction to solid spectra is solid localization. Discrete condensation is the hypersheafification of the constant presheaf, so $V^delta \( * \) tilde.eq V$. Thus, naturally in an ordinary spectrum $V$ and its maps,

$ #scale(x: 120%, y: 120%)[\(] L_(K \( n \))^square.stroked.tiny \( V^delta \) #scale(x: 120%, y: 120%)[\)] \( * \) tilde.eq L_(K \( n \)) V \, $

with the evaluated localization unit equal to the ordinary unit. In particular the input $V = S$ is the ordinary sphere before any completion. Corollary 4.6.8 of #cite(label("BMR2026")) constructs $L_(K \( n \))^square.stroked.tiny S^delta arrow.r E_n^square.stroked.tiny$ by applying this functor to the ordinary map $L_n S arrow.r E_n$. The natural point comparison identifies it with

$ L_(K \( n \)) L_n S arrow.r L_(K \( n \)) E_n . $

Since $S arrow.r L_n S$ is a $K \( n \)$-equivalence and $E_n$ is $K \( n \)$-local, this is precisely the factor of the ordinary sphere unit $S arrow.r E_n$ through $L_(K \( n \)) S$. Lemma 4.5.8 and the endpoint formula of Proposition 4.5.5 in that paper identify the target at the point naturally with $E_n$: the discrete-adjunction map used there is adjoint at the point to the identity of $E_n$.

Proposition 4.6.9 of #cite(label("BMR2026")) identifies the Čech augmentation of that same map with $L_(K \( n \))^square.stroked.tiny S^delta arrow.r^tilde.op \( E_n^square.stroked.tiny \)^(h G_n)$. Its composite to $E_n^square.stroked.tiny$ is the map just identified. Evaluation at the point preserves limits, so this gives the asserted ordinary fixed-point equivalence with its canonical map to $E_n$. The coefficient-field scope is also exact: Example 4.6.1 there allows an algebraic field containing the endomorphism field. Here $k = bb(F)_(p^6)$ is finite and contains both required fields. The Honda groups descend to $bb(F)_p$, and all geometric endomorphisms are $k$-rational. The descent identifications from the $bb(F)_p$-models split the pair-automorphism sequences, giving exactly $G_n = P_n times.r "Gal" \( k \/ bb(F)_p \)$. Thus the cited solid descent theorem applies to this enlarged finite field, and the point comparison above identifies its source and map for the uncompleted sphere $S$.

#proof[
  The connected endpoint calculation gives the coefficients and ordinary locality of every evaluation. The tensor construction and the oriented section supply the left equivariant ring map; the right map is the canonical connected base change already constructed. The constants calculation and finite Koszul argument prove both fixed-point descent and descent for each coefficient module, with their residual actions and maps from Witt constants. Taking derived $H$-invariants in the extension $P_3^1 arrow.r G arrow.r H$ gives (3.3); $overline(Z)$ acts trivially on the $E_2$ source. The preceding point-evaluation argument proves the ordinary stabilizer-descent identification with its sphere unit. ◻
]

#prodef([Remark 3.5.])[
  The completion in (3.2) is essential to the statements proved here. The uncompleted half-sphere equivalence is #cite(label("BMR2026")) Conjectures 1.1.1 and 5.1.13; #cite(label("BMR2026")) Proposition 5.1.17 proves an implication from that conjecture to coheight-one splitting. The completed theorem above supplies an actual target for detection and does not assert an equivalence from the uncompleted fixed points to that target.
]

== 4 Two realizations of a modification <sec:modifications>

We compare two descriptions of a line modification of a rank-$n$, degree-one bundle. Framing the original bundle gives a projective space with a division-algebra action; framing its slope-zero modification gives a Drinfeld space with a linear-group action. The common quotient will carry both degree-three classes. We then apply the same modification to the universal rank-three-to-rank-two surjection, obtaining the exact sequence that relates the two heights.

We work over $"Spd" C$. For a perfectoid test object $S$ over this base, write $cal(X)_S^(upright(F F))$ for its relative Fargues–Fontaine curve, with untilt divisor $i_oo : oo arrow.r.hook cal(X)_S^(upright(F F))$. At the fixed geometric point determined by $C$, write $cal(X)_C^(upright(F F))$ for the corresponding curve. For a locally profinite group $A$, write $B_C A = \[ "Spd" C \/ underline(A) \]$ for its relative classifying stack; all classifying maps in this section are over this base. Write $cal(E)_n^0 = cal(O) \( 1 \/ n \)$, of rank $n$ and degree one. A #emph[determinant lattice] of a slope-zero rank-$n$ bundle means a $bb(Z)_p$-lattice in its rank-one determinant local system. Its frame group is

$ J_n = { g in "GL"_n \( bb(Q)_p \) : \| det \( g \) \|_p = 1 } . $

This is the structure that will relate the two heights.

We use the following precise forms of the relative bundle theorems. Let $macron(k)$ be an algebraic closure of $k$. Since $C^flat$ is algebraically closed, fix an extension $macron(k) arrow.r.hook C^flat$ of the embedding $k arrow.r.hook C^flat$ underlying the chosen map $"Spd" C arrow.r "Spd" k$, and hence a compatible map $"Spd" C arrow.r "Spd" macron(k)$. Geometrically semistable bundles of slope zero correspond to pro-étale $bb(Q)_p$-local systems, by #cite(label("FS")) Theorem II.2.19 and Corollary II.2.20. Pulling the geometrically trivial and basic strata of #cite(label("FS")) Theorems III.2.4 and III.4.5 back along this map gives the relative classifying descriptions $B_C "GL"_n \( bb(Q)_p \)$ and $B_C "Aut" \( cal(E)_n^0 \)$, respectively. Thus their sheaves of frames are actual torsors in families. The later arithmetic $G_F$-descent is established by the local construction below. We will apply the bundle statements after proving the required slope conditions. Geometric points alone are not being used to identify arbitrary stacks.

=== 4.1 The lower and upper modifications <the-lower-and-upper-modifications>

#thm([Lemma 4.1.])[
  #emph[Let $cal(E)_n$ be a form of $cal(E)_n^0$, and let $q : i_oo^(*) cal(E)_n arrow.r.twohead cal(L)$ be a quotient line. The elementary lower modification 
$ 0 arrow.r cal(V)_n arrow.r cal(E)_n arrow.r i_(oo *) cal(L) arrow.r 0 $

 is geometrically semistable of slope zero. It therefore defines a rank-$n$ rational local system.]
] <lem:lower-modification>

#proof[
  The kernel is a vector bundle: locally at the Cartier divisor, the quotient is a coordinate modulo a local equation of the divisor, and the kernel has a basis obtained by multiplying that coordinate by the local equation. At a geometric point, $"rank" \( cal(V)_n \) = n$ and $deg \( cal(V)_n \) = 0$. If it had a positive-slope Harder–Narasimhan piece, its maximal destabilizing subbundle $cal(F)$ would have rank $b < n$ and integral degree $d gt.eq 1$. The injection $cal(F) arrow.r.hook cal(E)_n$ contradicts semistability of $cal(E)_n$, because
  $ mu \( cal(F) \) = d / b gt.eq 1 / b > 1 / n = mu \( cal(E)_n \) . $
  One may saturate its image in $cal(E)_n$ without decreasing degree. Hence $cal(V)_n$ is semistable of degree zero at every geometric point. The relative slope-zero equivalence stated above now applies. ◻
]

Conversely, an elementary upper modification of $cal(O)^n$ at $oo$ is determined by a line of modification directions. Locally at a geometric point, if $t$ is a uniformizer at $oo$ and $L_0 = \( B_(upright(d R))^(+) \)^n$, its lattice is

$ L_ell = L_0 + B_(upright(d R))^(+) t^(- 1) tilde(ell) subset t^(- 1) L_0 \, $

where $tilde(ell)$ lifts the direction line $ell$. Intrinsically the direction lies in $\( cal(O) \( oo \) \/ cal(O) \)^n$; tensoring every coordinate by the same one-dimensional space identifies its projectivization with $bb(P)_C^(n - 1)$.

#thm([Lemma 4.2.])[
  #emph[The upper modification $cal(E)_ell$ is semistable of slope $1 \/ n$ if and only if $ell$ lies in no proper $bb(Q)_p$-rational subspace. Consequently its semistable locus is 
$ Omega_C^(n - 1) = bb(P)_C^(n - 1) \\ union.big_(W subset bb(Q)_p^n\
dim W = n - 1) bb(P) \( W_C \) . $

 On this locus $cal(E)_ell$ is a form of $cal(E)_n^0$.]
] <lem:drinfeld-locus>

#proof[
  If $ell subset W_C$ for a proper rational subspace $W$, modify $W ⊗_(bb(Q)_p) cal(O)$ along $ell$. The resulting rank-$dim W$, degree-one bundle embeds as a subbundle of $cal(E)_ell$; the quotient is the unchanged trivial bundle associated to $bb(Q)_p^n \/ W$. Its slope is greater than $1 \/ n$, so $cal(E)_ell$ is not semistable.
  For the converse, take a saturated destabilizing subbundle $cal(F) subset cal(E)_ell$ of rank $b < n$. Its integral degree $d$ is at least one. Set $cal(F)' = cal(F) ∩ cal(O)^n$. The quotient $cal(F) \/ cal(F)'$ embeds in $cal(E)_ell \/ cal(O)^n$ and has length $epsilon.alt lt.eq 1$. Since $cal(F)'$ embeds in $cal(O)^n$, semistability of the latter gives
  $ 0 gt.eq deg \( cal(F)' \) = d - epsilon.alt gt.eq 0 . $
  Thus $d = epsilon.alt = 1$ and $deg \( cal(F)' \) = 0$. The saturation of $cal(F)'$ in $cal(O)^n$ cannot increase its degree: a positive increase would contradict the same semistability inequality. It is therefore already saturated. All its subbundles have nonpositive degree, so it is semistable of slope zero. The classification of bundles at a geometric point identifies it with $W ⊗_(bb(Q)_p) cal(O)$ for a $b$-dimensional rational subspace $W$; here an inclusion between trivial bundles is a matrix over $H^0 \( cal(X)_C^(upright(F F)) \, cal(O) \) = bb(Q)_p$. The equality $epsilon.alt = 1$ in the displayed local lattice description then says precisely that $ell subset W_C$.
  This proves the criterion at every geometric point. The classification in #cite(label("FS")) Theorem II.2.14 gives $cal(O) \( 1 \/ n \)$ for a semistable rank-$n$, degree-one bundle, and the relative basic-stratum theorem gives the claimed family of forms. ◻
]

=== 4.2 A common torsor with a determinant lattice <a-common-torsor-with-a-determinant-lattice>

The lower and upper modification criteria identify the same geometric objects. A full lattice in the slope-zero local system would impose extra data on these objects. We retain only its determinant lattice, which is already supplied by the $P_n$-structure, and construct the common space of frames with that condition.

Put

$ Delta_n = det \( cal(E)_n^0 \) \( - oo \) \, #h(2em) V \( Delta_n \) = H^0 \( cal(X)_C^(upright(F F)) \, Delta_n \) . $

The latter is a one-dimensional $bb(Q)_p$-space. Choose a lattice $Lambda_n subset V \( Delta_n \)$. The determinant action of $"Aut" \( cal(E)_n^0 \) = D_n^times$ is the reduced norm. The stabilizer of $Lambda_n$ is

$ { g in D_n^times : v_p \( N_n \( g \) \) = 0 } = cal(O)_(D_n)^times = P_n . $

Accordingly a $P_n$-structure on a form $cal(E)_n$ transports $Lambda_n$ to a determinant lattice on $det \( cal(E)_n \) \( - oo \)$.

These choices can be made with compatible arithmetic Galois action. Take $F = W \( k \) \[ 1 \/ p \]$, or a finite unramified extension of it. The fixed bundle is obtained functorially from the Dieudonné module of $Gamma_n$ over $k$, by extension to the period rings and Frobenius descent; see #cite(label("BMR2026")) Lemma 2.3.3 and the following paragraph, pp. 23–24. Thus it is defined on perfectoid test objects over $"Spd" F$. Every endomorphism of $Gamma_n$ is defined over $k$, so this descent commutes with $P_n$. The untilt divisor also descends: its ideal is the kernel of the functorial untilt map $theta$. It follows that $Delta_n$ descends over $"Spd" F$.

Its geometric slope is zero. Applying #cite(label("FS")) Corollary II.2.20 on perfectoid test objects and descending the resulting local systems therefore makes $V \( Delta_n \)$ a continuous rank-one representation of $G_F = "Gal" \( overline(bb(Q))_p \/ F \)$. Continuity is part of this conclusion: the descent automorphisms are sections of the pro-étale $bb(Q)_p^times$-sheaf, hence continuous functions on the profinite Galois parameters. The coefficient sheaf here is the one identified by #cite(label("FS")) Proposition II.2.5(ii). The image of its valuation character in $bb(Z)$ is a compact subgroup, hence zero. Every lattice $Lambda_n$ is therefore $G_F$-stable. We need no invariant choice of basis. The cyclotomic character of $G_F$ still has open image.

Let $cal(Z)_n$ be the v-sheaf of injections

$ u : cal(O)^n arrow.r.hook cal(E)_n^0 $

whose cokernel is a line supported at $oo$ and for which

$ det \( u \) : det \( cal(O)^n \) arrow.r^(med tilde.op med) Delta_n $

takes the standard determinant lattice onto $Lambda_n$. The commuting actions of $P_n$ and $J_n$ are postcomposition and inverse precomposition. Galois acts on a map $u$ by transport along the semilinear descent of its source and target. On $cal(O)^n$ this descent fixes the standard rational basis. It follows directly that $gamma \( g u j^(- 1) \) = g gamma \( u \) j^(- 1)$ for $gamma in G_F$, $g in P_n$, and $j in J_n$. The determinant condition is preserved by stability of $Lambda_n$.

#thm([Proposition 4.3.])[
  #emph[Let $cal(M)_n$ classify a form of $cal(E)_n^0$ with $P_n$-structure and a quotient line at $oo$. There are $G_F$-equivariant equivalences of v-stacks 
$ "(4.1)" quad cal(M)_n tilde.eq \[ bb(P) \( i_oo^(*) cal(E)_n^0 \) \/ P_n \] tilde.eq \[ cal(Z)_n \/ \( P_n times J_n \) \] tilde.eq \[ Omega_C^(n - 1) \/ J_n \] . $ <eq:two-realizations>

 Its framing torsor defines $cal(M)_n arrow.r B_C P_n$, and its universal lower modification defines the indicated map $cal(M)_n arrow.r B_C J_n$.]
] <prop:two-realizations>

#proof[
  Fixing a quotient line of $i_oo^(*) cal(E)_n^0$ fixes its kernel $cal(V)_n$. By 12 its frames exist pro-étale locally. Requiring a frame to preserve the determinant lattice cuts its $"GL"_n \( bb(Q)_p \)$-torsor down to a $J_n$-torsor. Thus $cal(Z)_n \/ J_n = bb(P) \( i_oo^(*) cal(E)_n^0 \)$ as v-sheaves.
  In the other direction, a framed lower bundle gives an upper modification $cal(O)^n arrow.r.hook cal(E)_ell$. By 13 its allowed directions are exactly $Omega_C^(n - 1)$. Its determinant lattice is induced by the standard one on $cal(O)^n$. The isomorphisms $cal(E)_ell tilde.eq cal(E)_n^0$ form a $D_n^times$-torsor, by the relative basic-stratum theorem. The norm valuation $D_n^times arrow.r bb(Z)$ is surjective, so this torsor has, v-locally, isomorphisms carrying the induced lattice onto $Lambda_n$. Those isomorphisms form precisely a $P_n$-torsor. It follows that $cal(Z)_n \/ P_n = Omega_C^(n - 1)$.
  Both identifications commute with base change and the remaining group action. Taking the further quotients proves (4.1). They are Galois compatible because every operation used—forming the kernel, determinant, lattice condition, and sheaf of frames—is compatible with the descent just constructed. More explicitly, an upper direction is a line in $bb(Q)_p^n ⊗_(bb(Q)_p) \( cal(O) \( oo \) \/ cal(O) \) \|_oo$. The second factor is common to all coordinates, so its semilinear Galois scalar cancels upon projectivization. The action on $Omega_C^(n - 1)$ is consequently the standard arithmetic action, commuting with $J_n$. The lower frames form a Galois-equivariant $J_n$-torsor, which gives the equivariant map to $B_C J_n$. Here Galois acts on the $"Spd" C$ base of $B_C J_n$ and trivially on the group $J_n$; the analogous statement holds for $B_C P_n$. This assertion does not require the torsor itself to have a Galois-fixed frame. ◻
]

The two frame-forgetting maps can be pictured as follows; the upper arrows are torsors for the indicated groups.

#cetz.canvas({
  import cetz.draw: *
  content((3.2, 0), [$cal(Z)_n$])
  content((0, 3.2), [$bb(P) \( i_oo^(*) cal(E)_n^0 \)$])
  content((6.4, 3.2), [$Omega_C^(n - 1)$])
  content((3.2, 6.4), [$cal(M)_n$])
  line((2.86, 0.34), (0.85, 2.35), mark: (end: ">"))
  content((1.537, 1.027), [$J_n$])
  line((3.54, 0.34), (5.933, 2.732), mark: (end: ">"))
  content((5.054, 1.218), [$P_n$])
  line((0.85, 4.05), (2.86, 6.06), mark: (end: ">"))
  line((5.933, 3.668), (3.54, 6.06), mark: (end: ">"))
})

Only a determinant lattice was retained. This explains the appearance of $J_n$: its defining condition preserves the determinant lattice, while the group as a whole preserves no full lattice in $bb(Q)_p^n$.

=== 4.3 The filtration supplied by the two-height tower <the-filtration-supplied-by-the-two-height-tower>

We have compared the two realizations at each rank. The remaining construction relates those ranks using the universal surjection.

Return to the universal surjection $f : cal(E)_3 arrow.r.twohead cal(E)_2$ over $Y_C$ from 7; its all-surjections interpretation is #cite(label("BMR2026")) Proposition 2.7.1(3). Let

$ pi : cal(T) = bb(P) \( i_oo^(*) cal(E)_2 \) arrow.r Y_C $

parametrize quotient lines. The linear $P_2$-descent on $i_oo^(*) cal(E)_2$ gives an actual vector bundle on $Y_C$. In particular $cal(T)$ has its global tautological $cal(O)_(cal(T)) \( 1 \)$.

#thm([Proposition 4.4.])[
  #emph[The tautological quotient of $cal(E)_2$ and its composite with $f$ give maps $m_n : cal(T) arrow.r cal(M)_n$ and an exact sequence 
$ "(4.2)" quad 0 arrow.r ker \( f \) arrow.r cal(V)_3 arrow.r cal(V)_2 arrow.r 0 . $ <eq:filtered-modification>

 These are slope-zero bundles. Their corresponding rational local systems form an exact sequence of ranks $1 \, 3 \, 2$. With the induced determinant lattices this sequence is classified by a map $d : cal(T) arrow.r B_C D$, where 
$ D = {mat(delim: "(", a, v; 0, A) : a in bb(Z)_p^times \, quad A in J_2 \, quad v in bb(Q)_p^(1 times 2)} tilde.eq bb(Q)_p^2 times.r \( bb(Z)_p^times times J_2 \) . $

 The classifying maps of $cal(V)_3$ and $cal(V)_2$ are the composites of $d$ with the relative maps induced by the inclusion $rho_3 : D arrow.r.hook J_3$ and projection $rho_2 : D arrow.r J_2$. The $P_n$-classifying map of $m_n$ is the composite $cal(T) arrow.r^pi Y_C arrow.r B_C P_n$ induced by $q_n : G arrow.r P_n$.]
] <prop:filtered-modification>

#proof[
  If $q : cal(E)_2 arrow.r.twohead i_(oo *) cal(L)$ is the universal quotient, then $cal(V)_2 = ker \( q \)$ and $cal(V)_3 = ker \( q f \)$. Thus $cal(V)_3 = f^(- 1) cal(V)_2$, proving the exact sequence. The two lower modifications are slope zero by 12. The kernel of $f$ has rank one and degree $deg \( cal(E)_3 \) - deg \( cal(E)_2 \) = 0$, so it too has slope zero.
  To check exactness on local systems, pass to a pro-étale cover trivializing the three slope-zero bundles. Full faithfulness of the relative correspondence identifies the maps with matrices of continuous $bb(Q)_p$-valued functions. The matrices have the indicated ranks on every geometric fiber; on the open loci of invertible minors they give exact, locally split sequences of rational local systems. These loci cover the base, proving exactness before descent.
  Transport $Lambda_3$ and $Lambda_2$ to the determinant local systems of $cal(V)_3$ and $cal(V)_2$. The determinant isomorphism in (4.2) defines the lattice on the kernel as their tensor quotient. Locally choose a lattice-compatible basis of the kernel and determinant-compatible frames of the quotient, and lift the latter to the middle local system. Such adapted frames form a torsor; their change-of-frame matrices are exactly the displayed matrices in $D$. The two classifying maps follow by forgetting the filtration or taking its quotient. The construction of $m_n$ retains the original $P_n$-structured form $cal(E)_n$ on $Y_C$ and only adds its quotient line. Its $P_n$-framing torsor is therefore the pullback of the associated framing torsor on $Y_C$, proving the last assertion as a statement of actual torsors. ◻
]

== 5 Transport of the degree-three primitive <sec:degree-three>

The projective presentation of $cal(M)_n$ isolates a one-dimensional Galois-invariant subspace of its degree-three cohomology. The Drinfeld presentation shows that the linear trace class has nonzero image in that subspace. This identifies the two primitive classes up to a nonzero scalar; the rank-one filtration then transports the identification from rank three to rank two. All cohomology uses the integral complex followed by inversion of $p$, as defined in 2.

=== 5.1 The integral projective bundle splitting <the-integral-projective-bundle-splitting>

#thm([Lemma 5.1.])[
  #emph[Let $X$ be a small v-stack over $"Spd" C$, and let $cal(W)$ be a rank-$\( r + 1 \)$ vector bundle on its untilt, with linear v-descent. For $g : bb(P) \( cal(W) \) arrow.r X$, the compatible classes $h_m = c_1 \( cal(O) \( 1 \) \) in H_v^2 \( bb(P) \( cal(W) \) \, \( bb(Z) \/ p^m \) \( 1 \) \)$ give equivalences 
$ "(5.1)" quad lambda_m : xor.big_(j = 0)^r \( bb(Z) \/ p^m \) \( - j \) \[ - 2 j \] arrow.r^(med tilde.op med) R g_(*) \( bb(Z) \/ p^m \) . $ <eq:projective-finite>

 Consequently 
$ "(5.2)" quad xor.big_(j = 0)^r R #h(-1em) "proj lim"_m R Gamma_v \( X \, \( bb(Z) \/ p^m \) \( - j \) \) \[ - 2 j \] arrow.r^(med tilde.op med) R #h(-1em) "proj lim"_m R Gamma_v \( bb(P) \( cal(W) \) \, bb(Z) \/ p^m \) . $ <eq:projective-integral>

 The term $j = 0$ is the original pullback. Thus pullback is split injective on $H_(upright(i n t))^(*)$ and on $H_(upright(b))^(*)$. These statements are equivariant for actions on the vector bundle, including arithmetic Galois actions.]
] <lem:projective-bundle>

#proof[
  Define $lambda_m$ by the powers $h_m^j$, using adjunction and cup product. It is therefore a global map of derived pushforward objects, compatible with coefficient reduction and all descent data. For arithmetic descent, the linear action on $cal(W)$ induces descent on the actual line bundle $cal(O) \( 1 \)$. Naturality of the Kummer boundary makes $h_m$ invariant in its twisted coefficient group.
  Over $"Spa" \( C \, cal(O)_C \)$, the finite-constant projective-space calculation has basis $1 \, h_1 \, dots.h \, h_1^r$: apply #cite(label("LRZ2024")) Construction 3.2.1 and Proposition 3.2.2 with $bb(F)_p$ coefficients, since $p$ is invertible on this base. The first Chern class there is the Kummer boundary #cite(label("LRZ2024")) Variant 3.1.8, so this basis uses our actual classes. To extend the calculation to arbitrary perfectoid test bases, apply the integral Riemann–Hilbert functor $"RH"_(bb(Z)_p)$ of #cite(label("ALM2026")) Theorem 5.1.7. Smooth proper primitive comparison #cite(label("ALM2026")) Proposition 5.2.2 and Example 5.2.3 applies to $bb(P)_C^r arrow.r "Spd" C$ and the dualizable coefficient object $bb(F)_p$. Its mod-$p$ target is
  $ cal(D)_(upright(F F)) \( - \, bb(F)_p \) = cal(D)_(hat(square.stroked.tiny)) \( cal(O)^flat \)^phi \, $
  by #cite(label("ALM2026")) Remark 5.1.9 and the beginning of §5.2. The symmetric monoidal and pullback compatibility of the functor carries the Kummer basis to its coefficient images. It therefore gives the Frobenius-equivariant Chern-class equivalence with $cal(O)^flat$ coefficients over $C$.
  After trivializing $cal(W)$ on a perfectoid test object, its projective bundle is a base change of $bb(P)_C^r arrow.r "Spd" C$. This projective morphism is $p$-bounded. Base change for solid pushforward, #cite(label("ALM2026")) Proposition 4.2.7(ii) with $Lambda = bb(F)_p$, transports the equivalence to that test object. The globally defined Chern-class map makes these local equivalences compatible on overlaps, so they descend.
  We identify the resulting solid calculation with ordinary v-sheaf pushforward by testing on a perfectoid $T arrow.r X$. Apply tensor-unit Hom in the solid formalism on $T$. Adjunction and the tensor-unit cohomology identification #cite(label("BMR2026")) Theorem 3.2.1(iii)–(iv) give
  $ xor.big_(j = 0)^r R Gamma_v \( T \, cal(O)^flat \( - j \) \) \[ - 2 j \] arrow.r^(med tilde.op med) R Gamma_v \( bb(P) \( cal(W) \)_T \, cal(O)^flat \) . $
  This is natural in $T$ and induced by the same Chern classes. It thus identifies their coefficient-image map with the equivalence of ordinary derived v-sheaf pushforwards
  $ xor.big_(j = 0)^r cal(O)_X^flat \( - j \) \[ - 2 j \] arrow.r^(med tilde.op med) R g_(*) cal(O)^flat . $
  The displayed map is induced by the images of the actual mod-$p$ étale classes $h_1^j$. It therefore commutes with Frobenius on $cal(O)^flat$, including its descent data. Take the fiber of $F - 1$ on both sides. The Artin–Schreier sequence on the v-site identifies this fiber with $bb(F)_p$; with twists it identifies the $j$th fiber with $bb(F)_p \( - j \) \[ - 2 j \]$. Since derived pushforward preserves fibers, the resulting equivalence is exactly $lambda_1$. This step uses the Frobenius compatibility of the Chern-class map.
  The Kummer classes $h_m$ are compatible under reduction. The coefficient sequences
  $ 0 arrow.r bb(Z) \/ p^(m - 1) arrow.r^(thin p thin) bb(Z) \/ p^m arrow.r bb(F)_p arrow.r 0 $
  give compatible exact triangles on the source and target of $lambda_m$. Cup product with $h_m^j$ commutes with both coefficient maps. Induction on $m$ therefore proves (5.1). Apply global sections and then the derived inverse limit. The finite direct sum commutes with both operations and gives (5.2). Projection to its zeroth summand is a left inverse to pullback. Exact inversion of $p$ preserves that left inverse. ◻
]

=== 5.2 Galois weights identify the primitives <galois-weights-identify-the-primitives>

Recall from 4 the nonzero classes

$ e_(P_n) in H_(upright(b))^3 \( P_n \) \, #h(2em) e_(J_n) in H_(upright(b))^3 \( J_n \) \, #h(2em) n = 2 \, 3 . $

For a class $e in H_(upright(b))^i \( A \)$ and a classifying map $f : Z arrow.r B_C A$, write

$ e \|_Z = f^(*) u_(B_C \, A \, upright(b)) \( e \) . $

Thus the class is first mapped from condensed group cohomology to the relative geometric classifying stack by (2.3), and then pulled back. For a group homomorphism $rho : D arrow.r A$, naturality gives

$ d^(*) u_(B_C \, D \, upright(b)) \( rho^(*) e \) = \( B_C rho compose d \)^(*) u_(B_C \, A \, upright(b)) \( e \) . $

We abbreviate the left side as $d^(*) rho^(*) e$. The associated framing torsors on $Y_C$ give exactly the convention for $e_(P_n) \|_(Y_C)$ fixed in 3, by the same finite-level naturality.

#thm([Proposition 5.2.])[
  #emph[For $n = 2 \, 3$, the pullbacks of $e_(P_n)$ and $e_(J_n)$ to $H_(upright(b))^3 \( cal(M)_n \)$ are nonzero. There is a scalar $kappa_n in bb(Q)_p^times$ such that 
$ "(5.3)" quad e_(P_n) \|_(cal(M)_n) = kappa_n thin e_(J_n) \|_(cal(M)_n) . $ <eq:primitive-comparison>

]
] <prop:primitive-comparison>

#proof[
  Use the common arithmetic action $G_F$ from 14. The projective presentation is a projective bundle over $B_C P_n$. Apply 16 first to this relative geometric base. Its two degree-three summands use the finite coefficients $Lambda_m$ and $Lambda_m \( - 1 \)$ on $B_C P_n$, respectively, before their derived limits; higher projective summands would have negative cohomological degree and vanish. The compact geometric-point comparison (2.5), applied in the $P_n$ bar degrees and with its Tate fiber, identifies these summands with the group cohomology groups in the $G_F$-equivariant direct sum
  $ "(5.4)" quad H_(upright(b))^3 \( cal(M)_n \) tilde.equiv H_(upright(b))^3 \( P_n \) xor H_(upright(b))^1 \( P_n \) \( - 1 \) . $ <eq:projective-degree-three>
  The first summand is the image of the actual constant-cochain pullback, hence contains a nonzero $e_(P_n)$. The comparison is natural for the Galois action on the $"Spd" C$ base. It identifies the untwisted group cochain factors with trivial Galois action because Galois fixes $P_n$ and the untwisted constants. On the second summand it acts by $chi_(upright(c y c))^(- 1)$. As $chi_(upright(c y c)) \( G_F \)$ is open, this summand has no invariants. Thus
  $ "(5.5)" quad H_(upright(b))^3 \( cal(M)_n \)^(G_F) = bb(Q)_p thin e_(P_n) \|_(cal(M)_n) . $ <eq:invariant-line>
  It remains to prove that the pullback of $e_(J_n)$ is nonzero. Choose a compact open uniform subgroup $U subset J_n$. Restriction sends $e_(J_n)$ to a nonzero element of $H_(upright(b))^3 \( U \)$ by 4. We will detect it after the further pullback to $\[ Omega_C^(n - 1) \/ U \]$.
  Let $K_n = cal(C)_(Omega_C^(n - 1))$ be the derived solid integral cohomology complex formed with profinite parameters. Descent, as in 3, gives the first-quadrant spectral sequence
  $ "(5.6)" quad E_2^(s \, j) = H^s \( U \, H^j \( K_n \) \) \( * \) med arrow.r.double med H_(upright(i n t))^(s + j) \( \[ Omega_C^(n - 1) \/ U \] \) . $ <eq:drinfeld-descent>
  The complex $K_n$ is bounded below, and the group degree has the finite bound supplied by the completed resolution. The sequence therefore has a finite filtration in every degree and may be rationalized exactly. The additional geometric row bound uses only point values: 6 gives $H^j \( K_n \) \( * \) = 0$ for $j > n - 1$; the finite Hom calculation below then makes every ordinary point-valued $E_2^(s \, j)$ in that row zero. No vanishing assertion for the entire condensed module $H^j \( K_n \)$ is needed.
  Choose the finite projective resolution $P_bullet arrow.r bb(Z)_p$ over $Lambda = bb(Z)_p \[ \[ U \] \]$ from 3. The unit $underline(bb(Z)_p) arrow.r K_n$ factors through $H^0 \( K_n \) \[ 0 \]$, since $K_n$ is concentrated in cohomological degrees at least zero. The degree-zero calculation and local constants argument following 6 show that this unit is an isomorphism on point values. Each $"Hom"_Lambda \( P_i \, - \)$ is a retract of a finite sum of point values, and the equivariant unit commutes with the idempotent defining that retract. It follows that the unit gives an isomorphism of the integral bottom-row computing complexes
  $ "Hom"_Lambda \( P_bullet \, underline(bb(Z)_p) \) arrow.r^(med tilde.op med) "Hom"_Lambda \( P_bullet \, H^0 \( K_n \) \) . $
  After $\[ 1 \/ p \]$, (2.2) and (2.6) identify the restricted group class with the constants bottom-row edge class induced by $u_(Omega_C^(n - 1) \, U \, upright(b))$. This uses only the point-value isomorphism, not an identification of the entire condensed module.
  For a fixed $j$, the rationalized row is computed by
  $ "Hom"_Lambda \( P_bullet \, H^j \( K_n \) \) \[ 1 \/ p \] . $
  Every term is a direct summand of a finite sum of $H^j \( K_n \) \( * \) \[ 1 \/ p \]$. By the integral Drinfeld theorem, #cite(label("CDN2021")) Theorem 1.1, a Galois element $gamma$ acts on the latter by the scalar $chi_(upright(c y c)) \( gamma \)^(- j)$. It commutes with $Lambda$ and with the idempotents defining the projective summands, so it has the same scalar action on the entire row and on its cohomology. No identification of a solid module by its point value is involved.
  The constants row $j = 0$ has trivial Galois action. Choose $gamma in G_F$ with $chi_(upright(c y c)) \( gamma \)$ of infinite order. The only possible incoming differentials to bidegree $\( 3 \, 0 \)$ are
  $ d_2 : E_2^(1 \, 1) arrow.r E_2^(3 \, 0) \, #h(2em) d_3 : E_3^(0 \, 2) arrow.r E_3^(3 \, 0) . $
  The second source is absent when $n = 2$. After inversion of $p$, the respective source scalars are $chi_(upright(c y c)) \( gamma \)^(- 1)$ and $chi_(upright(c y c)) \( gamma \)^(- 2)$, whereas the target scalar is $1$. Every differential commutes with $gamma$, so both are zero. There are no outgoing differentials from the bottom row. Hence the nonzero bottom-row image of the restriction of $e_(J_n)$ survives in $H_(upright(b))^3 \( \[ Omega_C^(n - 1) \/ U \] \)$. Its abutment image is $u_(Omega_C^(n - 1) \, U \, upright(b)) \( "res"_U^(J_n) e_(J_n) \)$ by the unit calculation above. Naturality (2.4) for $U arrow.r.hook J_n$ identifies it with the pullback of $u_(Omega_C^(n - 1) \, J_n \, upright(b)) \( e_(J_n) \)$. Thus the class on $\[ Omega_C^(n - 1) \/ J_n \] = cal(M)_n$ is nonzero.
  Finally, that class is $G_F$-invariant. Its classifying map to $B_C J_n$ is equivariant for the action on the $"Spd" C$ base, while $G_F$ fixes $J_n$ and the untwisted finite coefficients. Naturality of $u_(B_C \, J_n \, m)$ for this base action passes through the derived coefficient limit and rationalization. It therefore sends the invariant group class to an invariant geometric class. Equation (5.5) therefore places both nonzero classes on the same one-dimensional $bb(Q)_p$-line, proving (5.3). ◻
]

=== 5.3 Transport along the rank-one filtration <transport-along-the-rank-one-filtration>

#thm([Theorem 5.3.])[
  #emph[There is a scalar $a in bb(Q)_p^times$ such that the classes from the two stabilizer factors satisfy 
$ "(5.7)" quad e_(P_3) \|_(Y_C) = a thin e_(P_2) \|_(Y_C) quad upright("in ") H_(upright(b))^3 \( Y_C \) . $ <eq:geometric-transport>

]
] <thm:geometric-transport>

#proof[
  By 5, for the inclusion $rho_3 : D arrow.r J_3$ and projection $rho_2 : D arrow.r J_2$ there is a scalar $b in bb(Q)_p^times$ with
  $ rho_3^(*) e_(J_3) = b thin rho_2^(*) e_(J_2) quad upright("in ") H_(upright(b))^3 \( D \) . $
  Apply $u_(B_C \, D \, upright(b))$ to this group-cohomology equality and pull it back along $d : cal(T) arrow.r B_C D$. The exact filtration in 15 identifies the two $J_n$-classifying maps with the composites induced by $D arrow.r J_n$, and (2.4) identifies their pullbacks with these same group classes. The $P_n$-framing torsors in that proposition give the first and last equalities below. Consequently
  $ pi^(*) \( e_(P_3) \|_(Y_C) \) & = m_3^(*) \( e_(P_3) \|_(cal(M)_3) \)\
 & = kappa_3 thin d^(*) rho_3^(*) e_(J_3)\
 & = kappa_3 b thin d^(*) rho_2^(*) e_(J_2)\
 & = frac(kappa_3 b, kappa_2) thin m_2^(*) \( e_(P_2) \|_(cal(M)_2) \)\
 & = frac(kappa_3 b, kappa_2) thin pi^(*) \( e_(P_2) \|_(Y_C) \) . $
  All three scalars are nonzero. The projective morphism $pi : cal(T) arrow.r Y_C$ satisfies 16, so $pi^(*)$ is injective. Taking $a = kappa_3 b \/ kappa_2$ proves the theorem. ◻
]

This transports the primitive through a filtration of rational local systems. The equality itself does not assert nonvanishing on $Y_C$. The next section tests its coefficient image using the completed tower and proves the required nonvanishing there.

== 6 Transfer through Witt coefficients <sec:witt-transfer>

Witt cohomology supplies an injective base-change map with which to reflect the relation of 18 from $Y_C$ to $Y$. We first prove this injectivity by reducing to trivial Witt coefficients for a compact group. We then carry the relation to deformation coefficients and prove nonvanishing there using the rank-two theory and the retraction onto its Witt constants.

Recall the notation

$ G = P_3 times P_2 \, #h(2em) X = \[ "Spd" hat(L) \/ P_3^1 \] \, #h(2em) H = P_2 times overline(Z) \, quad overline(Z) = P_3 \/ P_3^1 . $

Thus $Y = X \/ H$, with the residual action supplied by quotient descent. For any of these stacks $Z$, write

$ R Gamma_v \( Z \, W \( cal(O)^flat \) \) := R #h(-1em) "proj lim"_m R Gamma_v \( Z \, W_m \( cal(O)^flat \) \) \, #h(2em) H_W^i \( Z \) := H^i #scale(x: 120%, y: 120%)[\(] \( R Gamma_v \( Z \, W \( cal(O)^flat \) \) \) \( * \) #scale(x: 120%, y: 120%)[\)] . $

The derived global sections are solid complexes; $\( * \)$ is the exact, limit-preserving point evaluation, so $H_W^i \( Z \)$ is an ordinary abelian group. This is an integral definition. Inverting $p$ below always takes place after this derived limit and after cohomology.

=== 6.1 Witt constants and base change <witt-constants-and-base-change>

In #cite(label("BMR2026")) Remark 3.6.12(2), Barthel and coauthors propose studying mixed-characteristic Witt cohomology on the unquotiented punctured Banach–Colmez space. Here the finite norm-unit quotient $P_3^1 \/ ker N_3 tilde.eq mu_(p - 1)$ has already removed the higher characteristic-$p$ contribution in 8. That constants equivalence lifts through the finite Witt levels, giving the following more restricted comparison.

#thm([Proposition 6.1.])[
  (Witt comparison).  #emph[The natural constant maps give the commutative square of integral cohomology groups 
(6.1)
#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$H^i \( H \, W \( k \) \)$])
  content((3.49, 0), [$H_W^i \( Y \)$])
  content((0, 3.2), [$H^i \( H \, W \( C^flat \) \)$])
  content((3.49, 3.2), [$H_W^i \( Y_C \) .$])
  line((1.36, 0), (2.385, 0), mark: (end: ">"))
  content((1.872, -0.45), [$tilde.op$])
  line((0, 0.4), (0, 2.8), mark: (end: ">"))
  line((3.49, 0.4), (3.49, 2.8), mark: (end: ">"))
  line((1.53, 3.2), (2.13, 3.2), mark: (end: ">"))
  content((1.83, 2.75), [$tilde.op$])
})

 The actions of $H$ on the two left-hand coefficient rings are trivial. The right vertical map is injective after inverting $p$, for every $i$. Moreover, quotient descent gives a natural identification 
$ "(6.2)" quad R Gamma_v \( Y \, W \( cal(O)^flat \) \) tilde.eq R Gamma \( G \, W \( hat(L) \) \) . $ <eq:witt-group-identification>

]
] <prop:witt-comparison>

#proof[
  For a characteristic-$p$ ring $R$, restriction of Witt components and Verschiebung give an exact sequence of additive groups
  $ "(6.3)" quad 0 arrow.r R arrow.r^(med V^(m - 1) med) W_m \( R \) arrow.r W_(m - 1) \( R \) arrow.r 0 #h(2em) \( m gt.eq 2 \) . $ <eq:witt-devissage>
  The sequence is natural for ring maps and automorphisms. We use it as a sequence of additive coefficient objects; no assertion of linearity over $R$ is needed. It also gives an exact sequence of the associated solid modules and of the corresponding sheaves on the v-site.
  8 identifies the actual constant maps
  $ k arrow.r R Gamma \( P_3^1 \, hat(L) \) \, #h(2em) C^flat arrow.r R Gamma_v \( X_C \, cal(O)^flat \) $
  as equivalences with their residual $H$-actions. As proved there, the characteristic-$p$ vanishing uses only the central scalar restrictions of #cite(label("BMR2026")) Propositions 3.5.6 and 3.6.9, identified with $T_3$ by the determinant calculation in 7, and finite norm-unit invariants as in #cite(label("BMR2026")) Lemma 5.2.5. Full $H$-equivariance comes from the actual maps of constants and quotient descent. Apply (6.3) to the source and target of each map. Induction on $m$, using the resulting morphisms of exact triangles, gives equivalences
  $ W_m \( k \) & arrow.r^tilde.op R Gamma \( P_3^1 \, W_m \( hat(L) \) \) \,\
W_m \( C^flat \) & arrow.r^tilde.op R Gamma_v \( X_C \, W_m \( cal(O)^flat \) \) . $
  Every map used in this induction is the map induced by constants. In particular the equivalences are $H$-equivariant, including the $overline(Z)$-action; $H$ fixes the constant rings.
  Derived global sections and derived invariants preserve limits. Passing to $R #h(-1em) "proj lim"_m$ therefore gives the same equivalences with full Witt coefficients. Here the ordinary Witt module is also the derived limit of its truncations: in Witt coordinates, restriction has the continuous set-theoretic section obtained by appending a zero. Consequently restriction is surjective on continuous functions from every profinite parameter space. The truncation towers have no higher derived-limit term in the solid coefficient category. The argument applies to $k$, $C^flat$, and $hat(L)$ with their respective topologies. Taking residual $H$-invariants gives the horizontal isomorphisms of (6.1). Naturality of the constant maps under $k arrow.r C^flat$ gives its commutativity.
  For (6.2), recall $tilde(Y) = "Spd" hat(L)$ from 3. This affinoid perfectoid space is acyclic for $cal(O)^flat$, also with profinite parameters. Applying (6.3) gives, for every profinite set $S$, the finite equivalence induced by sections
  $ alpha_(S \, m) : C_(upright(c t s)) \( S \, W_m \( hat(L) \) \) \[ 0 \] arrow.r^(med tilde.op med) R Gamma_v \( tilde(Y) times underline(S) \, W_m \( cal(O)^flat \) \) . $
  Here Witt coordinates identify $W_m \( C_(upright(c t s)) \( S \, hat(L) \) \)$ with $C_(upright(c t s)) \( S \, W_m \( hat(L) \) \)$. The equivalence is natural in $S$ and in the $G$-action. Write $u_(tilde(Y) \, G \, m)^a$ for the degree-$a$ map of (2.3). The actual finite coefficient units give the commutative square
  (6.4)
  #cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$C_(upright(c t s)) \( G^a \, Lambda_m \) \[ 0 \]$])
  content((5.615, 0), [$R Gamma_v \( tilde(Y) times underline(G^a) \, Lambda_m \)$])
  content((0, 1.7), [$C_(upright(c t s)) \( G^a \, W_m \( hat(L) \) \) \[ 0 \]$])
  content((5.615, 1.7), [$R Gamma_v \( tilde(Y) times underline(G^a) \, W_m \( cal(O)^flat \) \) .$])
  line((1.955, 0), (3.66, 0), mark: (end: ">"))
  content((2.808, -0.45), [$u_(tilde(Y) \, G \, m)^a$])
  line((0, 0.4), (0, 1.3), mark: (end: ">"))
  content((-0.45, 0.85), [$iota_m$])
  line((5.615, 0.4), (5.615, 1.3), mark: (end: ">"))
  content((6.065, 0.85), [$omega_m$])
  line((2.38, 1.7), (2.98, 1.7), mark: (end: ">"))
  content((2.68, 2.15), [$alpha_(G^a \, m)$])
  content((2.68, 1.25), [$tilde.op$])
})
  The left map applies $Lambda_m = W_m \( bb(F)_p \) arrow.r W_m \( hat(L) \)$ pointwise; the right map is induced by the corresponding sheaf unit. Both composites are the same locally constant Witt section. These squares commute with the bar faces, including the action face, and with restriction in $m$. The same calculation with an extra profinite parameter retains the solid structure. The condensed standard resolution, quotient descent, and then $R #h(-1em) "proj lim"_m$ therefore give (6.2). The full Witt module is the derived limit of its truncations as shown above. Under point evaluation of this identification, the Witt image of $u_(tilde(Y) \, G \, upright(i n t))$ is exactly the coefficient map induced by $bb(Z)_p arrow.r W \( hat(L) \)$ and (2.2).
  It remains to prove injectivity, since an equivalence of the horizontal groups alone would not imply it. The finite-resolution statement of 3 applies to $H$. Indeed an element of order $p$ in $P_2$ would have minimal polynomial of degree $p - 1 > 2$ over $bb(Q)_p$, whereas the reduced characteristic polynomial in $D_2$ has degree two. Thus $P_2$, and hence $H = P_2 times bb(Z)_p$, has no $p$-torsion. Choose a bounded resolution $P_bullet arrow.r bb(Z)_p$ by finitely generated projective $bb(Z)_p \[ \[ H \] \]$-modules. For a trivial solid coefficient module $M$, the point-valued cochain complex is
  $ "Hom"_(bb(Z)_p \[ \[ H \] \]) \( P_bullet \, M \) = "Hom"_(bb(Z)_p) \( Q_bullet \, M \) \, #h(2em) Q_bullet = bb(Z)_p ⊗_(bb(Z)_p \[ \[ H \] \]) P_bullet . $
  Every $Q_j$ is finite free over $bb(Z)_p$. Thus this complex is obtained from a fixed bounded finite free $bb(Z)_p$-complex by scalar extension to the underlying module of $M$; its differentials are the same $bb(Z)_p$-linear matrices. This description is natural in $M$ and is valid for the valued Witt topology as well as for the $p$-adic one, by 3.
  Take $A = W \( k \)$ and $B = W \( C^flat \)$. The map $A arrow.r B$ is injective. Since $A$ is a discrete valuation ring with uniformizer $p$ and $B$ is $p$-torsion-free, $B$ is flat over $A$. Applying the finite complex just described gives
  $ "(6.5)" quad H^i \( H \, A \) \[ 1 \/ p \] ⊗_(A \[ 1 \/ p \]) B \[ 1 \/ p \] arrow.r^tilde.op H^i \( H \, B \) \[ 1 \/ p \] . $ <eq:witt-scalar-extension>
  The field extension $A \[ 1 \/ p \] arrow.r.hook B \[ 1 \/ p \]$ is faithfully flat, so the natural map from the first cohomology group to its scalar extension is injective. The square now proves the assertion. All infinite limits preceded this finite-complex argument. ◻
]

=== 6.2 Reflecting the geometric relation <reflecting-the-geometric-relation>

Via (2.2), let $c_n^W$ denote the image of $e_(P_n)$ under projection from $G$ and the coefficient map $bb(Z)_p arrow.r W \( hat(L) \)$:

$ c_n^W in H^3 \( G \, W \( hat(L) \) \) \[ 1 \/ p \] #h(2em) \( n = 2 \, 3 \) . $

Write $c_n$ for its further image under the natural equivariant map $W \( hat(L) \) arrow.r pi_0 hat(B)^square.stroked.tiny$ of 9.

#thm([Proposition 6.2.])[
  (Transport to deformation coefficients).  #emph[For the nonzero scalar $a in bb(Q)_p^times$ of 18, one has 
$ "(6.6)" quad c_3^W = a thin c_2^W quad upright("in ") H^3 \( G \, W \( hat(L) \) \) \[ 1 \/ p \] \, $ <eq:witt-relation>

 and hence 
$ "(6.7)" quad c_3 = a thin c_2 quad upright("in ") H^3 \( G \, pi_0 hat(B)^square.stroked.tiny \) \[ 1 \/ p \] . $ <eq:deformation-relation>

 Under (3.3), the preimage of $c_2$ in 
$ H^3 \( H \, pi_0 E_2^square.stroked.tiny \) \[ 1 \/ p \] $

 is obtained by inflating $e_(P_2)$ and then including constants.]
] <prop:coefficient-transport>

#proof[
  Let $omega_(Z \, m)$ be the map on cohomology complexes induced by $Lambda_m = W_m \( bb(F)_p \) arrow.r W_m \( cal(O)^flat \)$ for $Z = Y$ or $Y_C$. These maps are compatible with restriction in $m$. Their derived inverse limit gives a map
  $ H_(upright(b))^3 \( Z \) arrow.r H_W^3 \( Z \) \[ 1 \/ p \] . $
  Let $j : Y_C arrow.r Y$ denote base change, and put
  $ beta_m = omega_(Y \, m) u_(tilde(Y) \, G \, m) \, #h(2em) beta_(C \, m) = omega_(Y_C \, m) u_(tilde(Y)_C \, G \, m) . $
  The finite constant maps and the finite Witt units give
  (6.8)
  #cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$C_(upright(c t s))^bullet \( G \, Lambda_m \)$])
  content((4.51, 0), [$R Gamma_v \( Y \, W_m \( cal(O)^flat \) \)$])
  content((0, 1.7), [$C_(upright(c t s))^bullet \( G \, Lambda_m \)$])
  content((4.51, 1.7), [$R Gamma_v \( Y_C \, W_m \( cal(O)^flat \) \) .$])
  line((1.7, 0), (2.555, 0), mark: (end: ">"))
  content((2.128, -0.45), [$beta_m$])
  line((0.11, 0.4), (0.11, 1.3))
  line((-0.11, 0.4), (-0.11, 1.3))
  line((4.51, 0.4), (4.51, 1.3), mark: (end: ">"))
  content((4.96, 0.85), [$j^(*)$])
  line((1.7, 1.7), (2.3, 1.7), mark: (end: ">"))
  content((2, 2.15), [$beta_(C \, m)$])
})
  This square commutes in each cosimplicial degree before totalization, and is compatible with $q_n : G arrow.r P_n$ and reduction in $m$. Take the derived coefficient limit, cohomology, and then invert $p$. The classifying-pullback convention and (2.4) give $j^(*) \( e_(P_n) \|_Y \) = e_(P_n) \|_(Y_C)$. Moreover, (6.4) identifies the Witt image of $e_(P_n) \|_Y$ with $c_n^W$ under (6.2). Thus the geometric relation says that $c_3^W - a c_2^W$ maps to zero in $H_W^3 \( Y_C \) \[ 1 \/ p \]$. The right vertical map of (6.1) is injective after inverting $p$, so this difference is already zero on $Y$. This proves (6.6). Applying the coefficient map $W \( hat(L) \) arrow.r pi_0 hat(B)^square.stroked.tiny$ then proves (6.7).
  Finally, (3.3) is induced by the actual map $E_2^square.stroked.tiny arrow.r hat(B)^square.stroked.tiny$, by first taking $P_3^1$-invariants and then $H$-invariants. Its compatibility with constants is part of 9, whose finite Koszul argument proves the required coefficient instance of the descent construction in #cite(label("BMR2026")) Proposition 4.6.12. The action of $overline(Z)$ on the source is trivial. Thus inflation from $P_2$ followed by this map is exactly the coefficient map defining $c_2$. This proves the last assertion while retaining the residual action. ◻
]

=== 6.3 Nonvanishing in the deformation ring <nonvanishing-in-the-deformation-ring>

The reflected relation reduces nonvanishing to $c_2$. Coefficient descent identifies this class with constants in the rank-two theory; the additive retraction onto Witt constants detects it there.

#thm([Lemma 6.3.])[
  (Nonvanishing of constants).  #emph[The class $c_2$ is nonzero. Consequently $c_3$ is nonzero as well.]
] <lem:constant-nonvanishing>

#proof[
  Set $A_k = pi_0 E_2^square.stroked.tiny \( * \)$. The class corresponding to $c_2$ under (3.3) restricts along $P_2 arrow.r.hook H$ to the coefficient image of $e_(P_2)$ in $H^3 \( P_2 \, A_k \) \[ 1 \/ p \]$. It suffices to prove that this image is nonzero.
  Choose an algebraic closure $overline(k)$ of $k$ and let $A_(overline(k))$ be the deformation ring of the same height-two formal group after this base extension. Deformation theory gives a natural continuous $P_2$-equivariant map
  $ A_k arrow.r A_(overline(k)) . $
  In compatible coordinates these rings are $W \( k \) \[ \[ u'_1 \] \]$ and $W \( overline(k) \) \[ \[ u'_1 \] \]$, with their $\( p \, u'_1 \)$-adic topologies; equivariance follows from deformation base change, without requiring the coordinate to be fixed. Since $P_2$ is nonextended, it fixes $W \( overline(k) \)$ pointwise.
  The splitting theorem of Barthel–Schlank–Stapleton–Weinstein #cite(label("BSSW2025")) Proposition 2.5.1 and Corollary 2.5.9 gives a continuous additive equivariant retraction
  $ r : A_(overline(k)) arrow.r W \( overline(k) \) $
  of the inclusion of Witt constants. Restrict its equivariance to $P_2$. Additivity and continuity make it $bb(Z)_p$-linear. After condensation it is a morphism of solid $P_2$-modules, and hence induces a retraction on the continuous derived invariants used here.
  The composite of the coefficient maps
  $ bb(Z)_p arrow.r A_k arrow.r A_(overline(k)) arrow.r^r W \( overline(k) \) $
  is the usual inclusion of constants. Applying the finite free complex argument from 19 with $P_2$ in place of $H$ gives
  $ H^3 \( P_2 \, W \( overline(k) \) \) \[ 1 \/ p \] tilde.equiv H_(upright(b))^3 \( P_2 \) ⊗_(bb(Q)_p) W \( overline(k) \) \[ 1 \/ p \] . $
  The image of $e_(P_2)$ here is $e_(P_2) ⊗ 1$, which is nonzero by 4. If its image in $H^3 \( P_2 \, A_k \) \[ 1 \/ p \]$ vanished, the displayed composite would also send it to zero, a contradiction. Restriction to $P_2$ therefore proves $c_2 eq.not 0$, and (6.7) with $a eq.not 0$ proves $c_3 eq.not 0$. ◻
]

We have thus identified the image of the degree-three group class under the completed coefficient map. The remaining step is to detect it in the homotopy of an ordinary $K \( 2 \)$-local spectrum.

== 7 Detection on ordinary spectra <sec:detection>

We now turn the coefficient relation into a statement about the natural localization map. Keep $G = P_3 times P_2$ and $H = P_2 times overline(Z)$, and put

$ Delta = "Gal" \( k \/ bb(F)_p \) \, #h(2em) G_3 = P_3 times.r Delta \, #h(2em) cal(D) = #scale(x: 120%, y: 120%)[\(] \( hat(B)^square.stroked.tiny \)^(h G) #scale(x: 120%, y: 120%)[\)] \( * \) . $

Thus $Delta$ has order six. The symbol $cal(D)$ denotes an ordinary spectrum: the continuous fixed points are formed in solid spectra and then evaluated at the point.

#thm([Lemma 7.1.])[
  (The ordinary local detector).  #emph[There is a natural map of ordinary spectra 
$ "(7.1)" quad g : L_(K \( 3 \)) S arrow.r cal(D) . $ <eq:ordinary-detector>

 The spectrum $cal(D)$ is $K \( 2 \)$-local, so $g$ factors through the canonical localization unit: 
$ "(7.2)" quad L_(K \( 3 \)) S arrow.r^eta L_(K \( 2 \)) L_(K \( 3 \)) S arrow.r^(overline(g)) cal(D) . $ <eq:detector-factorization>

]
] <lem:local-detector>

#proof[
  Use the ordinary descent identification in 9 to form the composite
  $ "(7.3)" quad L_(K \( 3 \)) S & tilde.eq #scale(x: 120%, y: 120%)[\(] \( E_3^square.stroked.tiny \)^(h G_3) #scale(x: 120%, y: 120%)[\)] \( * \) arrow.r #scale(x: 120%, y: 120%)[\(] \( E_3^square.stroked.tiny \)^(h P_3) #scale(x: 120%, y: 120%)[\)] \( * \)\
 & arrow.r #scale(x: 120%, y: 120%)[\(] \( E_3^square.stroked.tiny \)^(h G) #scale(x: 120%, y: 120%)[\)] \( * \) arrow.r #scale(x: 120%, y: 120%)[\(] \( hat(B)^square.stroked.tiny \)^(h G) #scale(x: 120%, y: 120%)[\)] \( * \) . $ <eq:detector-construction>
  The first arrow restricts the group action, the second is inflation along $G arrow.r P_3$, and the last is induced by the equivariant map (3.2). In the middle term with group $G$, the action on $E_3^square.stroked.tiny$ is through $P_3$. Restriction and inflation are the natural maps of continuous fixed points. The source equivalence and its ordinary unit are the point-valued form of #cite(label("BMR2026")) Proposition 4.6.9 proved in 9; the last map uses the local split-section completed map of 10 and that proposition.
  For every profinite set $T$, the evaluation $hat(B)^square.stroked.tiny \( T \)$ is the ordinary height-two Lubin–Tate theory described in 9, with the Noetherian witness verified there; hence it is $K \( 2 \)$-local #cite(label("BMR2026")) Proposition 4.4.2. The bar construction gives
  $ cal(D) tilde.eq "Tot" #scale(x: 120%, y: 120%)[\(] hat(B)^square.stroked.tiny \( G^bullet \) #scale(x: 120%, y: 120%)[\)] . $
  Ordinary local spectra are closed under limits, so $cal(D)$ is $K \( 2 \)$-local. This also follows from the pointwise criterion for solid locality #cite(label("BMR2026")) Definition 4.5.7 and the following paragraph. The universal property of ordinary $K \( 2 \)$-localization now gives (7.2). ◻
]

=== 7.1 Convergence before rationalization <convergence-before-rationalization>

We use integral continuous cohomology of the solid homotopy modules in 3. For such a module $M$, recall that $H^s \( A \, M \)$ denotes the point evaluation of $R^s Gamma \( A \, M \)$. In particular, $\[ 1 \/ p \]$ below is applied to this integral group after it has been computed. For $M = bb(Z)_p$, the natural comparison (2.2) identifies these groups with the finite continuous-cochain derived-limit convention of (2.1).

The compact groups needed here have finite cohomological dimension in this coefficient category. Indeed, if the degree-$n$ division algebra defining $P_n$ contained an element of order $p$, it would contain the field $bb(Q)_p \( zeta_p \)$: the nontrivial element has the irreducible cyclotomic minimal polynomial of degree $p - 1$. Its reduced characteristic polynomial has degree $n$ and annihilates it. Since $p - 1 > n$ for $n = 2 \, 3$ and $p gt.eq 5$, this is impossible. Thus neither $P_2$ nor $P_3$ has $p$-torsion. The same holds for $G$ and $H$. An order-$p$ element of $G_3$ would project trivially to $Delta$, since $p divides.not 6$, and hence would lie in $P_3$. Thus 3 gives a uniform finite cohomological bound for each of these groups. We only need the existence of a common bound $d$, independent of the homotopy degree of the coefficient module.

#thm([Lemma 7.2.])[
  (Finite-amplitude descent).  #emph[For the continuous actions used in (7.3), there are natural, strongly convergent spectral sequences 
$ "(7.4)" quad E_2^(s \, t) = H^s \( A \, pi_t X \) med arrow.r.double med pi_(t - s) #scale(x: 120%, y: 120%)[\(] \( X^(h A) \) \( * \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) 0 lt.eq s lt.eq d . $ <eq:integral-descent-ss>

 They give, after exact rationalization, natural strongly convergent spectral sequences with $E_2$-terms $H^s \( A \, pi_t X \) \[ 1 \/ p \]$ and abutments $pi_(t - s) \( \( X^(h A) \) \( * \) \) \[ 1 \/ p \]$. This statement applies to the unbounded even-periodic theories here.]
] <lem:descent-convergence>

#proof[
  Let $F \( X \) = \( X^(h A) \) \( * \)$. This is an exact functor preserving limits and upper homotopy bounds. For the latter assertion, coconnective objects remain coconnective under evaluation and limits. Although $X$ need not be a module spectrum over $H bb(Z)_p$, each Postnikov layer $H M$ is one. The forgetful functor from module spectra preserves limits, so its continuous fixed points agree with the derived module invariants. On this Eilenberg–Mac Lane object, the finite resolution in 3 gives
  $ pi_(- s) F \( H M \) = H^s \( A \, M \) \, #h(2em) F \( H M \) in upright(S p)_(\[ - d \, 0 \]) . $
  The solid spectra are used with the hypersheaf convention of #cite(label("BMR2026")) Section 4.5, especially Proposition 4.5.5. Truncations remain solid, since they retain or kill each solid homotopy module. Evaluation on an extremally disconnected profinite set is $t$-exact: homotopy sheafification evaluated on this projective object agrees with pointwise homotopy. It therefore commutes with truncation. These evaluations detect equivalences, so Postnikov completeness of ordinary spectra gives $X tilde.eq "proj lim"_n tau_(lt.eq n) X$.
  Put $T_n = F \( tau_(lt.eq n) X \)$. Exactness identifies the successive fiber as
  $ "fib" \( T_(n + 1) arrow.r T_n \) tilde.eq F #scale(x: 120%, y: 120%)[\(] Sigma^(n + 1) H pi_(n + 1) X #scale(x: 120%, y: 120%)[\)] in upright(S p)_(\[ n + 1 - d \, n + 1 \]) . $
  Consequently $pi_q T_(n + 1) arrow.r pi_q T_n$ is an isomorphism for $n gt.eq q + d$; the analogous tower in degree $q + 1$ is also eventually constant. The Milnor exact sequence therefore has zero derived-limit term, and gives
  $ "(7.5)" quad pi_q F \( X \) tilde.equiv pi_q F \( tau_(lt.eq q + d) X \) . $ <eq:finite-postnikov-window>
  The infinitely negative tail causes no further issue: since $F \( tau_(lt.eq q - 1) X \)$ is concentrated in degrees at most $q - 1$, the fiber sequence for this lower cutoff gives
  $ pi_q F \( tau_(\[ q \, q + d \]) X \) arrow.r^(med tilde.op med) pi_q F \( tau_(lt.eq q + d) X \) . $
  Hence each abutment degree is computed by a finite Postnikov interval.
  The exact couple of this Postnikov construction has the $E_2$-term in (7.4). Its filtration in degree $q$ is
  $ "Fil"^s pi_q F \( X \) = ker #h(-1em) (pi_q F \( X \) arrow.r pi_q F \( tau_(lt.eq q + s - 1) X \)) \, quad 0 lt.eq s lt.eq d + 1 . $
  It starts with the whole group, ends in zero by (7.5), and has associated graded $E_oo^(s \, q + s)$. This proves the asserted strong convergence and its naturality. Tensoring the exact couple and these finite filtrations with $bb(Q)$ is exact. It therefore gives the rational spectral sequence and its stated abutment; no exchange of rationalization with an infinite totalization is involved. The groups here are $bb(Z)_p$-modules, so this tensor operation agrees with $\[ 1 \/ p \]$. No uniform torsion exponent as $t$ varies is required: each fixed homotopy degree has the finite filtration just constructed. ◻
]

=== 7.2 The surviving coefficient row <the-surviving-coefficient-row>

#thm([Lemma 7.3.])[
  (Central weights).  #emph[For $t eq.not 0$ and every $s$, one has 
$ H^s \( G_3 \, pi_t E_3^square.stroked.tiny \) \[ 1 \/ p \] = 0 \, #h(2em) H^s \( G \, pi_t hat(B)^square.stroked.tiny \) \[ 1 \/ p \] = 0 . $

]
] <lem:central-weights>

#proof[
  Odd homotopy modules vanish. For $t = 2 m$, scalar automorphisms $a in 1 + p bb(Z)_p$ lift canonically to scalar automorphisms of the universal deformation. They fix its deformation ring, and act by $a^m$ on its $m$th invariant-differential line $pi_(2 m) E_n^square.stroked.tiny$. This is the central character used in #cite(label("BSSW2025")) Lemma 2.6.1; replacing the periodicity convention by its dual replaces $m$ by $- m$ and has the same consequence.
  Choose $b = 1 + p$. It is central in $G_3$, since the finite Galois action fixes these scalars. A central group element acting on a coefficient module induces the identity on its group cohomology. This follows already from the bar resolution: its coefficient action is chain homotopic to the action by conjugation, which is the identity for a central element. Consequently $\( b^m - 1 \)$ annihilates $H^s \( G_3 \, pi_(2 m) E_3^square.stroked.tiny \)$. For $m eq.not 0$ this is a nonzero $p$-adic scalar, and is invertible after $p$ is inverted. This proves the first vanishing.
  For the target, use the natural coefficient descent (3.3) to identify its cohomology with $H^s \( H \, pi_t E_2^square.stroked.tiny \)$. The factor $overline(Z)$ acts trivially on these coefficients, and the central scalars in $P_2$ act by the same character $b^m$. The preceding argument applies to $H$, and proves the second vanishing. ◻
]

#thm([Proposition 7.4.])[
  #emph[The ordinary map $g$ of (7.1) is nonzero on rational homotopy in degree $- 3$: 
$ pi_(- 3) L_0 g : pi_(- 3) L_0 L_(K \( 3 \)) S arrow.r pi_(- 3) L_0 cal(D) quad upright("is nonzero") . $

]
] <prop:nonzero-detector>

#proof[
  First extend the source primitive to the extended stabilizer. By 4, $e_(P_3)$ is represented under rational Lie comparison by a nonzero multiple of
  $ \( X \, Y \, Z \) mapsto "tr"_(upright(r e d)) #scale(x: 120%, y: 120%)[\(] X \[ Y \, Z \] #scale(x: 120%, y: 120%)[\)] . $
  In the standard presentation of the degree-three division algebra, take its maximal unramified subfield $bb(Q)_(p^3)$ and an element $Pi$ such that
  $ Pi x = sigma \( x \) Pi quad \( x in bb(Q)_(p^3) \) \, #h(2em) Pi^3 = p \, $
  where $sigma$ is arithmetic Frobenius of the unramified cubic extension $bb(Q)_(p^3) \/ bb(Q)_p$, inducing $z mapsto z^p$ on the residue field. Its extension fixing $Pi$ equals conjugation $y mapsto Pi y Pi^(- 1)$, as is checked on the generators $bb(Q)_(p^3)$ and $Pi$. It therefore preserves the reduced-trace form. Its action on $P_3$ factors through the order-three quotient of $Delta$; the order-two kernel also fixes the $bb(Z)_p$-coefficients. Naturality of Lie comparison therefore makes $e_(P_3)$ invariant under $Delta$. Since $6$ is a unit in $bb(Z)_p$, finite-group averaging and extension descent give
  $ H^3 \( G_3 \, bb(Z)_p \) \[ 1 \/ p \] arrow.r^(med tilde.op med) #scale(x: 120%, y: 120%)[\(] H^3 \( P_3 \, bb(Z)_p \) \[ 1 \/ p \] #scale(x: 120%, y: 120%)[\)]^Delta . $
  Let $tilde(e)_3$ be the class restricting to $e_(P_3)$, and let $z_3$ be its image under the unit-coefficient map $bb(Z)_p arrow.r pi_0 E_3^square.stroked.tiny$.
  Under (2.2), restriction from $G_3$ to $P_3$ and inflation along $G arrow.r P_3$ on the constant classes are the derived limits of their finite continuous-cochain pullbacks. These are the group maps used in (2.4). All coefficient maps in the following square are the maps induced by (7.3):
  #cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$H^3 \( G_3 \, bb(Z)_p \) \[ 1 \/ p \]$])
  content((4.935, 0), [$H^3 \( G_3 \, pi_0 E_3^square.stroked.tiny \) \[ 1 \/ p \]$])
  content((0, 1.7), [$H^3 \( G \, bb(Z)_p \) \[ 1 \/ p \]$])
  content((4.935, 1.7), [$H^3 \( G \, pi_0 hat(B)^square.stroked.tiny \) \[ 1 \/ p \] .$])
  line((2.04, 0), (2.64, 0), mark: (end: ">"))
  line((0, 0.4), (0, 1.3), mark: (end: ">"))
  content((-0.45, 0.85), [$upright(r e s) \, thin upright(i n f)$])
  line((4.935, 0.4), (4.935, 1.3), mark: (end: ">"))
  line((1.87, 1.7), (2.725, 1.7), mark: (end: ">"))
})
  On bar cochains, the right vertical map is restriction, pullback along $G arrow.r P_3$, and the coefficient map of $E_3^square.stroked.tiny arrow.r hat(B)^square.stroked.tiny$, in that order. Its composite with the source coefficient unit is the target unit, which is also $bb(Z)_p arrow.r W \( hat(L) \) arrow.r pi_0 hat(B)^square.stroked.tiny$. Here the first map is the integral limit of the finite Witt units in (6.4); the map from full Witt vectors to deformation coefficients is applied only after that limit. The source descent identification used here is the canonical one in 9. In particular the image of $z_3$ is exactly the class called $c_3$ in 20: it is obtained from $e_(P_3)$ by projection and the actual constant-coefficient inclusion. That proposition and 21 give
  $ c_3 = a thin c_2 eq.not 0 \, #h(2em) a in bb(Q)_p^times . $
  Thus the map between the rational descent $E_2$-terms is nonzero in bidegree $\( s \, t \) = \( 3 \, 0 \)$.
  Apply 23 to the source and target of $g$. By 24, only $t = 0$ survives after rationalization. The differential has bidegree $\( r \, r - 1 \)$, so every rational differential vanishes. For total homotopy degree $- 3$, the finite filtration has just one possibly nonzero graded piece, namely $\( s \, t \) = \( 3 \, 0 \)$. The nonzero map on this piece is therefore a nonzero map on the abutments. These abutments are the ordinary rational homotopy groups asserted in the proposition. ◻
]

#proof[
  Rationalize (7.2). If the canonical map $L_0 L_(K \( 3 \)) S arrow.r L_0 L_(K \( 2 \)) L_(K \( 3 \)) S$ were zero on $pi_(- 3)$, its composite $L_0 g$ would also be zero there. This contradicts 25. Every step above applies to each prime $p gt.eq 5$, proving the theorem. ◻
]

== 8 The formal wedge obstruction <sec:wedge-obstruction>

We finish by comparing the canonical map with the map forced by the proposed wedge. The argument uses naturality and chromatic acyclicity; it places no compatibility requirement on a hypothetical equivalence of spectra.

#thm([Lemma 8.1.])[
  #emph[Suppose $Z tilde.eq A or B$, $L_(K \( 2 \)) B = 0$, and $pi_d L_0 A = 0$. Then $pi_d \( tau_Z \) = 0$.]
] <lem:wedge-obstruction>

#proof[
  Localization is exact and preserves finite sums, so $L_(K \( 2 \)) \( A or B \) tilde.eq L_(K \( 2 \)) A$. Naturality with the summand inclusions identifies $tau_(A or B)$ with $tau_A$ on $L_0 A$ and the zero map on $L_0 B$. It vanishes in degree $d$. Naturality with an arbitrary equivalence $A or B tilde.eq Z$ transports this conclusion to $Z$. ◻
]

#proof[
  In (1.1), let $A$ be the first line and $B$ the sum of the last two lines. Smashing for $L_1$ and the Bousfield-class description of $L_1 S$ give $L_(K \( 2 \)) B = 0$ #cite(label("HS1999")) Theorem 5.1 and Proposition 5.3.
  The $p$-complete sphere is connective. Each term of the Moore tower $S_p^and = "proj lim"_m S \/ p^m$ is connective, and the degree-zero transition maps are surjective; the possible negative Milnor term therefore vanishes. Rationalization preserves connectivity. Since $L_0 L_2 tilde.eq L_0$, the two summands of $L_0 A$ have no homotopy in degree $- 3$. Thus 26 gives $pi_(- 3) tau_(cal(W)_3) = 0$.
  Put $T = L_(K \( 3 \)) S$ and $X = L_2 T$. The cofiber of the localization map $T arrow.r X$ is $E \( 2 \)$-acyclic. The identity
  $ chevron.l E \( 2 \) chevron.r = chevron.l K \( 0 \) or K \( 1 \) or K \( 2 \) chevron.r $
  makes it both rationally and $K \( 2 \)$-acyclic. The naturality square
  #cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$L_0 T$])
  content((3.2, 0), [$L_0 L_(K \( 2 \)) T$])
  content((0, 3.2), [$L_0 X$])
  content((3.2, 3.2), [$L_0 L_(K \( 2 \)) X$])
  line((0.765, 0), (1.925, 0), mark: (end: ">"))
  content((1.345, -0.45), [$tau_T$])
  line((0, 0.4), (0, 2.8), mark: (end: ">"))
  content((-0.45, 1.6), [$tilde.op$])
  line((3.2, 0.4), (3.2, 2.8), mark: (end: ">"))
  content((3.65, 1.6), [$tilde.op$])
  line((0.765, 3.2), (1.925, 3.2), mark: (end: ">"))
  content((1.345, 2.75), [$tau_X$])
})
  therefore has vertical equivalences. Any equivalence $X tilde.eq cal(W)_3$ would force its lower horizontal map to vanish on $pi_(- 3)$, and hence force the same for $tau_T$. This contradicts 1. No step specifies the action of the hypothetical equivalence on individual summands. ◻
]

== 9 The low-rank cohomology and the building <app:background>

We give the two elementary ingredients in the proof of 4. The calculations are over characteristic zero; no reduction modulo $p$ of the matrices below is used. The degree-three trace class is the classical cocycle associated to an invariant symmetric bilinear form #cite(label("ChevalleyEilenberg1948")) §21, #cite(label("Koszul1950")) §11. We give the low-rank calculation and block restriction in the normalization used in this paper.

=== 9.1 A finite Chevalley–Eilenberg calculation <app:ce>

For $frak(s l)_n$, order the matrix units $E_(i j)$, $i eq.not j$, lexicographically, followed by $H_i = E_(i i) - E_(n n)$ for $1 lt.eq i < n$. Order exterior bases by increasing tuples, lexicographically, starting with index zero. The differential is determined by

$ \( d omega \) \( X_0 \, dots.h \, X_k \) = sum_(i < j) \( - 1 \)^(i + j) omega \( \[ X_i \, X_j \] \, X_0 \, dots.h \, hat(X)_i \, dots.h \, hat(X)_j \, dots.h \, X_k \) . $

For $n = 2$, the matrix of $d_1$ in these bases is

$ mat(delim: "(", 0, 0, - 1; 2, 0, 0; 0, - 2, 0) \, $

with determinant $4$, and $d_2 = 0$. For $n = 3$, the dimensions of $C^0 \, dots.h \, C^4$ are $1 \, 8 \, 28 \, 56 \, 70$. The following nonsingular minors of $d_1 \, d_2 \, d_3$ provide a short exact-arithmetic certificate. Their row and column indices refer to the bases just specified:

$ R_1 =  & \( 1 \, 2 \, 3 \, 5 \, 7 \, 9 \, 15 \, 16 \) \, & C_1 =  & \( 0 \, 1 \, 2 \, 3 \, 4 \, 5 \, 6 \, 7 \) \,\
det \( d_1 \[ R_1 \, C_1 \] \) =  & - 1 . &  & $

For the other two minors, use

$ R_2 =  & \( 0 \, 2 \, 4 \, 6 \, 7 \, 8 \, 9 \, 11 \, 12 \, 13 \, 19 \, 22 \, 24 \, 28 \, 30 \, 37 \, 39 \, 41 \, 43 \, 52 \) \,\
C_2 =  & \( 0 \, 1 \, 2 \, 3 \, 4 \, 5 \, 6 \, 7 \, 8 \, 11 \, 13 \, 14 \, 15 \, 16 \, 17 \, 20 \, 22 \, 23 \, 25 \, 27 \) \,\
det \( d_2 \[ R_2 \, C_2 \] \) =  & 2916 \, $

$ R_3 =  & \( 0 \, 1 \, 2 \, 3 \, 4 \, 5 \, 6 \, 7 \, 9 \, 10 \, 11 \, 12 \, 15 \, 16 \, 17 \, 18 \, 19 \,\
 & 20 \, 21 \, 22 \, 23 \, 25 \, 26 \, 27 \, 31 \, 35 \, 36 \, 37 \, 39 \, 40 \, 41 \, 45 \, 55 \, 56 \, 61 \) \,\
C_3 =  & \( 0 \, 1 \, 2 \, 3 \, 5 \, 6 \, 7 \, 8 \, 9 \, 10 \, 11 \, 12 \, 13 \, 14 \, 15 \, 16 \, 17 \, 18 \,\
 & 20 \, 21 \, 22 \, 24 \, 25 \, 28 \, 31 \, 32 \, 36 \, 37 \, 38 \, 40 \, 42 \, 43 \, 44 \, 45 \, 52 \) \,\
det \( d_3 \[ R_3 \, C_3 \] \) =  & 1024 . $

These integer identities can be verified directly from the displayed differential and the commutator formula

$ \[ E_(i j) \, E_(k l) \] = delta_(j k) E_(i l) - delta_(l i) E_(k j) . $

The script #raw("support/r-ce/ce_certificate.py") generates these integer matrices and evaluates the specified minors by fraction-free elimination, using Python’s standard library. To turn these rank bounds into cohomology dimensions, we now prove that the trace cocycle is not a boundary.

The alternating cochain $omega \( X \, Y \, Z \) = "tr" \( X \[ Y \, Z \] \)$ is closed by trace invariance and the Jacobi identity. Its restriction to the $frak(s l)_2$ block satisfies $omega \( E_12 \, E_21 \, E_11 - E_22 \) = 2$. On this block every three-coboundary is zero: substituting these three vectors in $d eta$ gives $- eta \( h \, h \) + eta \( - 2 e \, f \) - eta \( 2 f \, e \) = 0$. Thus the trace cochain is not a boundary, in either rank. The first minor gives $"rank" d_1 = 8$ for $frak(s l)_3$. Since $d^2 = 0$, the second rank is at most $28 - 8 = 20$; its minor gives equality. The kernel of $d_3$ contains this twenty-dimensional image and the independent trace class, so its rank is at most $56 - 21 = 35$; the last minor gives equality. Therefore, for $n = 2 \, 3$,

$ H^1 \( frak(s l)_n \) = H^2 \( frak(s l)_n \) = 0 \, #h(2em) H^3 \( frak(s l)_n \) = bb(Q)_p dot.op \[ omega \] . $

The direct sum $frak(g l)_n = frak(s l)_n xor bb(Q)_p$ gives exactly the low-degree groups used in 4. Block restriction of $omega$ is the corresponding trace cochain. For a central simple inner form, extend scalars to a finite splitting field and use reduced trace. The finite-dimensional cochain complex commutes with this faithfully flat extension, so the calculation descends.

We also need inner invariance in every degree for the cellular argument. Cartan’s identity $cal(L)_X = d iota_X + iota_X d$ shows that the Lie algebra of inner automorphisms acts trivially on cohomology. After splitting, the action is algebraic and the group $"GL"_n$ is connected in characteristic zero; hence its action on cohomology is trivial. Faithfully flat descent gives the same assertion for the inner forms.

=== 9.2 An elementary model of the building <app:building>

Let $V = bb(Q)_p^n$, $cal(O) = bb(Z)_p$, and $\| p \| = p^(- 1)$. The vertices of $cal(B)_n$ are homothety classes of $cal(O)$-lattices. A simplex is a chain of distinct lattices between $L$ and $p L$, modulo homothety. A maximal chain corresponds to a complete flag in $L \/ p L$, so its realization has dimension $n - 1$.

Here is a norm description, including contractibility. Every nonarchimedean norm $alpha$ on $V$ has an orthogonal basis. Indeed, for a fixed maximum norm $N$, the triangle inequality gives $alpha lt.eq C N$. Continuity and compactness of $N \( v \) = 1$ give a positive lower bound $c N lt.eq alpha$. Thus every positive-radius closed ball is a lattice. Put $L = { alpha lt.eq 1 }$, so $p L = { alpha lt.eq p^(- 1) }$. On the compact set $L \\ p L$ the norm is locally constant and has finitely many values in $\( p^(- 1) \, 1 \]$. Its balls modulo $p L$ form a flag. Lift an adapted residue basis, choosing each lift in the corresponding ball. For a linear combination with largest coefficient norm one, use the largest basis weight among the unit coefficients. Its nonzero residue in that flag quotient shows that the sum has exactly this norm; nonunit coefficients contribute at most $p^(- 1)$. Scaling proves orthogonality.

Norms modulo positive real scaling identify with $\| cal(B)_n \|$. Explicitly, for an adapted basis $e_i$ put $L_j = p cal(O) e_1 + dots.h.c + p cal(O) e_j + cal(O) e_(j + 1) + dots.h.c + cal(O) e_n$. Barycentric coordinates $\( theta_0 \, dots.h \, theta_(n - 1) \)$ on this chamber give the split norm with weights $p^(a_i)$, where

$ a_i = sum_(j = i)^(n - 1) theta_j quad \( i < n \) \, #h(2em) a_n = 0 . $

Conversely $theta_0 = 1 - a_1$ and $theta_j = a_j - a_(j + 1)$. The periodic chain of norm balls and the ratios between its jumps recover these data. Vanishing barycentric coordinates remove precisely the corresponding jumps, and the endpoint identification is multiplication of the lattice by $p$. This proves the claimed identification on faces as well as chambers.

For two norms let $M \( alpha \, beta \)$ and $m \( alpha \, beta \)$ be the maximum and minimum of $alpha \( v \) \/ beta \( v \)$ on $V \\ 0$. They exist by compactness of $upright(bold(P)) \( V \)$. The metric $d \( \[ alpha \] \, \[ beta \] \) = log M - log m$ induces the simplicial topology. To verify the only local issue, normalize $m \( alpha \, beta \) = 1$. A bounded metric neighborhood satisfies $beta lt.eq alpha lt.eq e^R beta$. For $p^(- 1) lt.eq r lt.eq 1$ all its lattices ${ alpha lt.eq r }$ lie between the two fixed lattices ${ beta lt.eq p^(- 1) e^(- R) }$ and ${ beta lt.eq 1 }$. There are finitely many such lattices; this radius interval represents every ball homothety class. Thus the neighborhood meets finitely many simplices. On each simplex the weight formula is continuous, and on a finite union of closed simplices compactness gives the inverse continuity. This proves the topology assertion.

With the same normalization define

$ H_t \( alpha \) \( v \) = max { t alpha \( v \) \, beta \( v \) } \, #h(2em) 0 lt.eq t lt.eq 1 . $

This is a norm, remains normalized, equals $beta$ at $t = 0$ and $alpha$ at $t = 1$, and fixes $beta$. In logarithmic ratios it is the map $f mapsto max { log t + f \, 0 }$ for $t > 0$. Metric convergence of normalized norms is equivalent to uniform convergence of these ratios. Near any fixed norm they are uniformly bounded, so for sufficiently small $t$ the displayed maximum is identically zero. This also proves continuity at $t = 0$ and hence contractibility.

Finally, the type of $\[ g cal(O)^n \]$ is $v_p \( det g \)$ modulo $n$. Each chamber has every type once and $J_n$ preserves types. Start a target chamber at its unique type-zero vertex. Scaling its lattice by an integral power of $p$ makes its determinant valuation zero; an adapted basis for its residue flag then carries the standard chamber to it by an element of $J_n$. Thus $J_n$ is chamber-transitive. A vertex stabilizer in $J_n$ actually preserves its lattice, since $g L = a L$ implies $0 = v_p \( det g \) = n v_p \( a \)$. It is consequently a conjugate of $"GL"_n \( bb(Z)_p \)$, compact open. Face stabilizers are finite intersections of these groups and fix their vertices pointwise because types are distinct. The closed chamber is therefore a fundamental domain, including faces, with no inversions. These are exactly the properties used by the finite cellular resolution in 2.

== 10 A continuous section for the Frobenius comparison <app:frobenius>

The solid Frobenius comparison used in 8 requires surjectivity on continuous families, not only on point values. We supply the topological step for its precise function ring. This avoids applying a linear open-mapping theorem to Frobenius minus identity, which is not linear over the algebraically closed coefficient field.

Let $C$ be an algebraically closed complete nonarchimedean field of characteristic $p$, containing $k = bb(F)_q$, and let

$ R = H^0 \( tilde(bb(B))_C^(thin *) \, cal(O) \) = {sum_(alpha in bb(Z) \[ 1 \/ p \]) c_alpha t^alpha : upright("the series converges for every ") 0 < \| t \| < 1} . $

Its Fréchet topology is given by the Gauss seminorms $parallel f parallel_r = sup_alpha \| c_alpha \| r^alpha$, $0 < r < 1$. Convergence means that these weighted coefficients form a $c_0$ family for every such radius. Here $phi.alt_q$ acts on the $C$-coefficients and fixes $t$; it is not the absolute Frobenius of $R$.

#thm([Lemma 10.1.])[
  #emph[The additive map $phi.alt_q - 1 : R arrow.r R$ has a continuous section as a map of sets. Its condensification is surjective, and its kernel, with the induced topology, is the valued-field completion $E = #scale(x: 120%, y: 120%)[\(] union.big_(j gt.eq 0) k \( \( t^(1 \/ p^j) \) \) #scale(x: 120%, y: 120%)[\)]^and$. Consequently the canonical map $E arrow.r R^(h phi.alt_q)$ is an equivalence of derived solid $bb(F)_p$-modules.]
] <lem:continuous-as-section>

#proof[
  For each coset of the open additive subgroup $C^(compose compose)$ in $C$, choose a representative $a$ and a root $b_a$ of $b_a^q - b_a = a$. Choose $a = b_a = 0$ on the zero coset. Define
  $ s \( a + epsilon.alt \) = b_a - sum_(j gt.eq 0) epsilon.alt^(q^j) \, #h(2em) \| epsilon.alt \| < 1 . $
  The sum converges, and $s \( x \)^q - s \( x \) = x$. If $\| x - y \| < 1$, the points lie in the same coset and the first term of the difference series dominates, so $\| s \( x \) - s \( y \) \| = \| x - y \|$. If $\| x - y \| gt.eq 1$, the equation for $s \( x \) - s \( y \)$ gives norm $\| x - y \|^(1 \/ q)$ (including norm one at the boundary). Thus $s$ is continuous, $s \( 0 \) = 0$, and
  $ \| s \( x \) - s \( y \) \| lt.eq max { \| x - y \| \, \| x - y \|^(1 \/ q) } . $
  Define $S$ coefficientwise. For every $0 < r < 1$ this estimate gives
  $ parallel S \( f \) - S \( g \) parallel_r lt.eq max { parallel f - g parallel_r \, med parallel f - g parallel_(r^q)^(1 \/ q) } . $
  It also gives the corresponding estimate on every coefficient tail. Since $r^q$ is again in $\( 0 \, 1 \)$, $S$ preserves convergence and is continuous for the Fréchet topology. It is a section of $phi.alt_q - 1$. For any profinite space $T$, postcomposition with $S$ lifts every continuous map $T arrow.r R$. This proves the asserted surjectivity of condensed groups, and therefore of solid modules.
  The kernel consists of the same convergent series with coefficients in $k$. Its nonzero coefficients all have norm one. The convergence condition says that the exponents in its support form a left-finite subset of $bb(Z) \[ 1 \/ p \]$: below any bound there are only finitely many. Truncation therefore identifies it with the completed perfection $E$. On this kernel every Gauss seminorm is $r^(v_t \( f \))$; hence its induced topology is exactly the valued-field topology of $E$. The two-term complex $\[ R arrow.r^(phi.alt_q - 1) R \]$ now has kernel $E$ and zero cokernel in solid modules. It computes homotopy fixed points for the infinite cyclic action, proving the last assertion. ◻
]

For the application, the quasi-Stein perfectoid calculation in #cite(label("BMR2026")) Lemma 3.6.2 identifies the relevant solid cohomology with this function ring. The lemma proves the enhancement needed in #cite(label("BMR2026")) Corollary 3.6.8 directly for that ring. The equivalence is the canonical map from constants; its construction as a map is independent of the chosen section. It therefore commutes with all actions and base changes already commuting with that map. No equivariance of the auxiliary set-theoretic section is required.

== 11 The oriented projection over the completed field <app:oriented-projection>

We prove 10, including the continuous identity that identifies the $E_2$ tensor factor with connected base change. The main construction is the split section in (3.4). Here we verify its residue tags, orientations, and family coherence on the parameter rings $R_T = C_(upright(c t s)) \( T \, F \)$, where $F = hat(L) \( * \)$ is the ordinary completed field, and then pass to solid spectra.

#proof[
  The forgetful transformation in #cite(label("LurieEllipticII2018")) Proposition 6.2.2 and Remark 6.2.3 goes from deformations of a full group to deformations of the left term of a tagged exact sequence with étale quotient. Corepresentability therefore gives a map from the connected deformation ring to the full deformation ring. We construct the reverse oriented map by a section of that transformation.
  The field $F$ is perfect of characteristic $p$, and its inverse Frobenius is continuous. Hence pointwise inverse Frobenius preserves $C_(upright(c t s)) \( T \, F \)$, so $R_T$ is perfect. For nonempty $T$, the map $F arrow.r R_T$ is flat, since $F$ is a field, and relatively perfect, since both Frobenius maps are isomorphisms. The ring $R_T$ need not be a field or Noetherian. The field $F$ is Noetherian and $F$-finite. More generally, for any perfect $bb(F)_p$-algebra, every $p$-divisible group is nonstationary and the absolute cotangent complex is almost perfect, by #cite(label("LurieEllipticII2018")) Remark 3.4.2. In particular the full group over $F$, without a connectedness assumption, is an eligible Noetherian LKN witness for $\( R_T \, Gamma_T \)$, in the sense of #cite(label("BMR2026")) Definition 4.3.7 and Example 4.6.4. The connected pair has the height-two witness $\( k \, Gamma_2 \)$. At the empty parameter set we assign the terminal presheaf value; no LKN assertion for the zero ring is needed.
  Over the perfect field $F$, take the connected–étale sequence and its unique splitting:
  $ sigma_F : quad 0 arrow.r C_F arrow.r Gamma_F arrow.r Q_F arrow.r 0 \, #h(2em) Gamma_F tilde.eq C_F xor Q_F . $
  Here $Q_F$ is étale of height one. Existence and uniqueness of the splitting are #cite(label("LurieEllipticII2018")) Proposition 2.5.20 and Remark 2.5.24. We apply the splitting remark only over the perfect field $F$. Write $iota_F : C_F arrow.r Gamma_F$ for the inclusion, and let
  $ lambda_0 : Gamma_F^compose arrow.r^tilde.op \( Gamma_2 \)_F^compose $
  be exactly the tautological formal isomorphism of the isomorphism torsor in #cite(label("BMR2026")) Example 4.6.3. Over the discrete field $F$, the hypotheses of #cite(label("LurieEllipticII2018")) Theorem 2.3.12 and Corollary 2.3.13 hold because $p = 0$. Their fully faithful identity-component functor gives a unique isomorphism $lambda_F : \( Gamma_2 \)_F arrow.r^tilde.op C_F$, characterized by
  $ lambda_0 iota_F^compose lambda_F^compose = upright(i d) . $
  Thus our $lambda_F$ has the direction from $Gamma_2$ to the connected summand. Define $sigma_T$, its splitting, $iota_T$, and $lambda_T$ by base change to $R_T$. In particular, $C_T$ denotes a $p$-divisible group, whereas the identity component of $Gamma_T$ denotes its formal group.
  ===== 11.1 Naturality of the split reference pair. <naturality-of-the-split-reference-pair.>
  We check the family naturality of this splitting. If $M$ is a finite projective $R_T$-module, then
  $ M arrow.r product_(t in T) #scale(x: 120%, y: 120%)[\(] M ⊗_(R_T \, "ev"_t) F #scale(x: 120%, y: 120%)[\)] $
  is injective: embed $M$ as a direct summand of $R_T^N$ and use $R_T arrow.r.hook product_t F$. It follows that maps between finite flat group schemes over $R_T$ are detected by these fibers, by applying the same observation to the target of the corresponding coordinate-algebra maps. It detects maps of $p$-divisible groups on each $p^m$-torsion level. These are actual equalities of maps: finite flat algebras over the ordinary ring $R_T$ are ordinary finite projective algebras, and their mapping spaces are discrete. The finite-flat functor description recalled in the proof of #cite(label("LurieEllipticII2018")) Proposition 2.5.20 identifies the compatible torsion-level maps with maps of $p$-divisible groups.
  Let $rho : R_T arrow.r R_U$ be a parameter pullback or a map furnished by a continuous action family, and let $gamma : rho^(*) Gamma_T arrow.r^tilde.op Gamma_U$ be the given pair isomorphism. Both induced sequences are connected–étale: connectedness is preserved by base change by the locally nilpotent augmentation criterion of #cite(label("LurieEllipticII2018")) Remark 2.3.8, and étaleness is preserved by base change. The discrete characteristic-$p$ ring $R_U$ is complete with ideal of definition zero. Thus #cite(label("LurieEllipticII2018")) Theorem 2.5.13 gives the unique isomorphism of these sequences extending $gamma$. The two resulting sections $Q_U arrow.r Gamma_U$ agree at each $u in U$, by uniqueness of the splitting over the perfect field $F$; the preceding detection argument makes them equal over $R_U$. Applying this with $U = T times G^a$, for every $a gt.eq 0$, proves compatibility with all family, multiplication, and unit maps. The same holds for $lambda_T$ by the fully faithful identity-component functor. The input is the continuous action on the full completed pair and its tautological formal trivialization from #cite(label("BMR2026")) Examples 4.6.3–4.6.4, restricted to the nonextended $P_3 times P_2$, which fixes $k$. This argument uses the pulled-back field splitting; it does not assert a splitting theorem for arbitrary perfect rings.
  ===== 11.2 The section on oriented deformations. <the-section-on-oriented-deformations.>
  We now construct the section on oriented deformations. Let $A$ be any complete adic $E_oo$-ring, without a Noetherian or connectivity assumption. For nonconnective $A$, the notation $upright(B T)_p \( A \)$ means $upright(B T)_p \( tau_(gt.eq 0) A \)$. For a finitely generated ideal of definition $I$, put $B_I = pi_0 A \/ I$, write $H \( B_I \)$ for its discrete Eilenberg–Mac Lane $E_oo$-ring, and use the canonical reduction
  $ tau_(gt.eq 0) A arrow.r H \( B_I \) . $
  A subscript $I$ below denotes this reduction or the corresponding ordinary base change of a reference group. No map $A arrow.r H \( B_I \)$ is asserted. Orientations remain over the full ring $A$: their Bott map is an equivalence of $A$-modules. They are not orientations over its connective cover; see #cite(label("LurieEllipticII2018")) Warning 4.3.12.
  Represent a connected oriented deformation by $\( C_A \, I \, mu \, alpha_C \, e \)$, where $I subset pi_0 A$ is a finitely generated ideal of definition,
  $ mu : R_T arrow.r pi_0 A \/ I \, #h(2em) alpha_C : mu^(*) C_T arrow.r^tilde.op \( C_A \)_(pi_0 A \/ I) \, $
  and $e$ orients $C_A^compose$ over $A$. Tags are identified only after passage to a common larger finitely generated ideal of definition on which both the residue maps and group isomorphisms agree, as in #cite(label("LurieEllipticII2018")) Definitions 3.1.1 and 3.1.4. Since $R_T$ has characteristic $p$, the tag forces $p in I$. Completeness for $I$ therefore implies $\( p \)$-completeness, and $p$ is topologically nilpotent, by #cite(label("LurieEllipticII2018")) Remarks 0.0.10–0.0.12. The tag makes $C_A$ formally connected. These facts meet the hypotheses of the identity-component and connected–étale results used below; they do not assert completeness of $tau_(gt.eq 0) A$.
  The reduction equivalence
  $ upright(B T)_p^(upright(e t)) \( A \) arrow.r^tilde.op upright(B T)_p^(upright(e t)) \( pi_0 A \/ I \) $
  of #cite(label("LurieEllipticII2018")) Corollary 2.5.10 lifts $mu^(*) Q_T$ to an étale group $Q_A$, with a specified residual isomorphism $alpha_Q$. The space of such lifts with this isomorphism is contractible; the unmarked object $Q_A$ itself may have automorphisms. More precisely, if $cal(D)_(C \, I)^(upright(o r)) \( A \)$ denotes the fixed-$I$ stage, use the homotopy pullback
  $ cal(X)_I \( A \) = cal(D)_(C \, I)^(upright(o r)) \( A \) times_(upright(B T)_p^(upright(e t)) \( B_I \)^tilde.eq) upright(B T)_p^(upright(e t)) \( A \)^tilde.eq \, $
  where the first map sends a tag to $mu^(*) Q_T$ and the second is the typed reduction above. Its projection to $cal(D)_(C \, I)^(upright(o r)) \( A \)$ is an equivalence by Corollary 2.5.10; its fiber includes the marking $alpha_Q$.
  These projections and the split construction form natural diagrams on the category of compatible data $\( A \, I \, mu \)$, including adic maps, residue maps after ideal refinement, and compatible maps of split base sequences. For an adic map $f : A arrow.r A'$, start with a target ideal of definition $J_0$. Continuity gives $f \( I^n \) subset.eq J_0$ for some $n$, so $J_0 + \( f \( I \) \)$ is again a finitely generated ideal of definition and contains $f \( I \)$. Such choices admit common larger ideals. For $I subset.eq J$, the same $Q_A$ with the reduced marking is used.
  The fixed-$I$ tagged categories for complete $A$ are groupoidal by the proof of #cite(label("LurieEllipticII2018")) Lemma 3.1.10: a tagged morphism is an equivalence modulo $I$, and equivalence is detected on its finite flat $p$-torsion level. Orientations are pulled back from $upright(B T)_p \( A \)^tilde.eq$, independently of $I$; filtered colimits of spaces commute with this pullback. Hence the filtered colimit of the fixed stages is precisely the oriented tagging anima of Definition 3.1.4. The auxiliary projections are an objectwise equivalence of diagrams; take their filtered colimits and invert that equivalence in the functor category. This supplies all lift, refinement, and base-map coherences. We do not replace that colimit by reduction to the nilradical, which #cite(label("LurieEllipticII2018")) Warning 3.1.9 excludes in this generality.
  Form the split sequence
  $ 0 arrow.r C_A arrow.r C_A xor Q_A arrow.r Q_A arrow.r 0 . $
  It is an exact sequence of $p$-divisible groups by #cite(label("LurieEllipticII2018")) Proposition 2.4.8, applied to the split pushout square. Tag the entire residual sequence using
  $ mu^(*) Gamma_T tilde.eq mu^(*) C_T xor mu^(*) Q_T arrow.r^(alpha_C xor alpha_Q) \( C_A xor Q_A \)_(pi_0 A \/ I) . $
  This retains the original full tag, including $mu$, and chooses no basis or trivialization of the étale factor. Since $A$ is $\( p \)$-complete, $Q_A^compose = 0$ by #cite(label("LurieEllipticII2018")) Proposition 2.5.8. The identity-component fiber sequence, as in the proof of #cite(label("LurieEllipticII2018")) Proposition 2.5.17, gives $C_A^compose arrow.r^tilde.op \( C_A xor Q_A \)^compose$. Transport the same orientation $e$ through this equivalence over $A$.
  Write $cal(D)_sigma^(upright(o r))$, $cal(D)_Gamma^(upright(o r))$, and $cal(D)_C^(upright(o r))$ for the resulting oriented deformation functors. Let $m : cal(D)_sigma^(upright(o r)) arrow.r cal(D)_Gamma^(upright(o r))$ and $q : cal(D)_sigma^(upright(o r)) arrow.r cal(D)_C^(upright(o r))$ forget to the middle and left terms. Proposition 6.2.2 of #cite(label("LurieEllipticII2018")) makes the underlying $m$ an equivalence. It remains an equivalence with orientations: a tagged quotient is étale by Remark 2.5.11 of that paper, and the left and middle identity formal groups are naturally equivalent. Set $frak(f) = q m^(- 1)$, taking the inverse in the functor category. The split construction gives $tilde(frak(s)) : cal(D)_C^(upright(o r)) arrow.r cal(D)_sigma^(upright(o r))$, whose left projection is the identity on $\( I \, mu \, alpha_C \, e \)$. Therefore
  $ frak(f) frak(s) tilde.eq upright(i d) \, #h(2em) frak(s) = m tilde(frak(s)) \, $
  naturally with all the preceding refinements and base maps.
  ===== 11.3 Corepresentability and the reverse ring map. <corepresentability-and-the-reverse-ring-map.>
  We justify the oriented mapping property at the possibly non-Noetherian $R_T$. The oriented mapping property in #cite(label("LurieEllipticII2018")) Remark 6.0.7 is stated in the Noetherian setting of its Theorem 6.0.3; the general statement of BMR Remark 4.1.22 needs the following argument here. For either pair $\( R_T \, Gamma_T \)$ or $\( R_T \, C_T \)$, the characteristic is $p$, and #cite(label("LurieEllipticII2018")) Remark 3.4.2 supplies nonstationarity and an almost perfect absolute cotangent complex. Theorem 3.4.1 of that paper therefore gives a complete connective universal spectral deformation ring $R^(upright(u n))$, a surjection $pi_0 R^(upright(u n)) arrow.r R_T$, and a finitely generated kernel $J$ which is an ideal of definition.
  Let $E$ be the orientation classifier of its universal identity formal group, as in #cite(label("BMR2026")) Construction 4.1.17 and Definition 4.1.20. The LKN witnesses and #cite(label("BMR2026")) Definition 4.2.1 and Theorem 4.3.8 supply balancedness. By Remark 4.1.16 and Definitions 4.1.19–4.1.20 there, the map $pi_0 R^(upright(u n)) arrow.r pi_0 E$ is an isomorphism, the odd homotopy groups of $E$ vanish, and every even homotopy group is an invertible $pi_0 E$-module. Here completeness of modules means derived completeness. The homotopy-group completeness argument in the proof of #cite(label("LurieEllipticII2018")) Corollary 6.0.5 now applies without a Noetherian step. Specifically, the homotopy-group criterion cited there as SAG Theorem 7.3.4.1 makes $pi_0 R^(upright(u n))$ $J$-complete because $R^(upright(u n))$ is $J$-complete. An invertible module over this ring is a direct summand of a finite free module, hence is also $J$-complete. The same criterion then makes $E$ $J$-complete.
  Endow $pi_0 E$ with the topology transported from $pi_0 R^(upright(u n))$. An $E_oo$-map $E arrow.r A$ is continuous exactly when its restriction from $R^(upright(u n))$ is continuous, because these $pi_0$ rings and topologies agree. The universal deformation mapping property of Theorem 3.4.1, followed by the orientation-classifier mapping property, therefore identifies the adic mapping anima from $E$ with the triples consisting of a deformation, its strict tagging class, and an orientation over full $A$. This locally proves the use of BMR Remark 4.1.22 at $R_T$. It turns $frak(f)$ and $frak(s)$ into continuous adic maps
  $ i_T : E \( R_T \, C_T \) arrow.r E \( R_T \, Gamma_T \) \, #h(2em) r_T : E \( R_T \, Gamma_T \) arrow.r E \( R_T \, C_T \) \, #h(2em) r_T i_T tilde.eq upright(i d) . $
  They preserve the $S W \( k \)$-structure because they retain the restriction of the same tag $mu$ to $k$. The construction is natural in split base sequences. The family argument above therefore makes the $r_T$ continuous $G$-natural maps.
  For precision, this last assertion also survives condensation. Take the category of split LKN sequences with both full and connected pairs LKN. The preceding construction is a natural transformation from its full $E$-functor to its connected $E$-functor. Extend these functors and the transformation from the presheaf category and tensor with condensed anima as in #cite(label("BMR2026")) Construction 4.5.2. Hypersheafifying the raw split parameter diagram gives a condensed object with its continuous $G$-action; its full and connected images are the original pair diagrams. The resulting enriched transformation is the pointwise $r_T$ followed by hypersheafification, giving $r^(upright(c o n d))$.
  ===== 11.4 The connected tensor factor. <the-connected-tensor-factor.>
  It remains to identify the $E_2$ factor. For each $T$, let $b_T : E_2 arrow.r E \( R_T \, Gamma_T \)$ be the ordinary tensor-factor map followed by completion, and let $c_T : E_2 arrow.r E \( R_T \, C_T \)$ be the canonical connected map using $lambda_T$. The pointwise tensor construction uses the Noetherian perfect reference pair $\( k \, Gamma_2 \)$, with connected height-two group, and the localized height-two LKN pair as its other input. These meet #cite(label("BMR2026")) Construction 4.4.7. The proof of Theorem 4.4.8 there identifies its mapping spaces on $K \( 2 \)$-local complete adic $S W \( k \)$-algebra tests. Choose a common representative ideal $I$ for the two $k$-linear tag classes, using the strict refinement relation. If $e_1 \, e_2$ orient the formal groups of the two deformations $H_1 \, H_2$, let
  $ q_(e_i) : Gamma_A^Q arrow.r^tilde.op H_i^compose \, #h(2em) j = q_(e_2) q_(e_1)^(- 1) : H_1^compose arrow.r^tilde.op H_2^compose $
  be the isomorphisms from the same Quillen formal group and their comparison. This is the natural orientation correspondence of #cite(label("BMR2026")) Remark 4.1.18, using Lurie’s Propositions 4.3.21 and 4.3.23. The orientations are over full $A$, while $j$ is a formal isomorphism over $tau_(gt.eq 0) A$. Only $j$, not an orientation, is reduced along $tau_(gt.eq 0) A arrow.r H \( B_I \)$.
  Let $alpha : Gamma_(T \, I) arrow.r^tilde.op \( H_1 \)_I$ be the full tag after completion, and let $lambda_(0 \, I)$ be the base change of the same torsor isomorphism $lambda_0$ to $B_I$. The tuple repacking of Theorem 4.4.8 first goes from the reference $Gamma_2^compose$ through $lambda_(0 \, I)^(- 1)$ to the reference full formal group, then through $alpha^compose$ to $\( H_1 \)_I^compose$, and finally through $j_I$. Thus the formal tag of the second tensor factor is exactly
  $ beta_(upright(o u t))^compose = j_I thin alpha^compose thin lambda_(0 \, I)^(- 1) . $
  For the split section take
  $ H_1 = C_A xor Q_A \, quad H_2 = C_A \, quad e_1 = \( i^compose \)_(*) e \, quad e_2 = e \, $
  where $i : C_A arrow.r C_A xor Q_A$ is the inclusion. Naturality of the Quillen correspondence gives $q_(e_1) = i^compose q_e$, so $j = \( i^compose \)^(- 1)$. In our direction for $lambda_T$, put
  $ beta = alpha_C lambda_(T \, I) : \( Gamma_2 \)_(B_I) arrow.r^tilde.op \( C_A \)_I . $
  The defining relation for $lambda_F$ gives $lambda_(0 \, I)^(- 1) = iota_(T \, I)^compose lambda_(T \, I)^compose$, and the definition of the full split tag gives $alpha^compose iota_(T \, I)^compose = i_I^compose alpha_C^compose$. Substitution therefore cancels the precise torsor and orientation isomorphisms:
  $ beta_(upright(o u t))^compose & = \( i_I^compose \)^(- 1) alpha^compose iota_(T \, I)^compose lambda_(T \, I)^compose\
 & = \( i_I^compose \)^(- 1) i_I^compose alpha_C^compose lambda_(T \, I)^compose = beta^compose . $
  Theorem 2.3.12 and Corollary 2.3.13 of #cite(label("LurieEllipticII2018")), over $A$ and over the discrete characteristic-$p$ ring $B_I$, identify the formally connected output with $C_A$ and the tag itself with $beta$. Their hypotheses were checked above. The output orientation is $e$, since pushforward through $i^compose$ is undone through its inverse. The output ring tag is exactly $k arrow.r R_T arrow.r^mu B_I$. Completion only precomposes $mu$ and base changes the same $lambda_0$, so the calculation respects the $S W \( k \)$-linear tagging condition. There is no additional Bott unit or automorphism normalization. It is natural under strict ideal refinement and the parameter and family maps already treated. Hence, on the stated local test category,
  $ \( r_T b_T \)^(*) = b_T^(*) frak(s)_T tilde.eq c_T^(*) . $
  The connected endpoint is $K \( 2 \)$-local by #cite(label("BMR2026")) Proposition 4.4.2 for its height-two witness, and it is complete by the argument above. The same statements hold for $E_2$. Thus both are $K \( 2 \)$-local complete adic $S W \( k \)$-algebras. Yoneda on the stated test category, equivalently evaluation on the universal connected deformation at $A = E \( R_T \, C_T \)$, gives $r_T b_T tilde.eq c_T$. This preserves the full connected tag $\( I \, mu \, alpha_C \)$, its restricted reference-pair tag $beta : \( Gamma_2 \)_(B_I) arrow.r^tilde.op \( C_A \)_I$ along $k arrow.r R_T arrow.r^mu B_I$, and the orientation $e$; it uses no locality of $E \( R_T \, Gamma_T \)$.
  ===== 11.5 The continuous solid identity. <the-continuous-solid-identity.>
  We identify the actual $E_2$ tensor composite with $c^square.stroked.tiny$. Let $b^square.stroked.tiny : E_2^square.stroked.tiny arrow.r E^(upright(c o n d)) \( hat(L) \, Gamma_(3 \, hat(L))^(upright(u n)) \)$ be the tensor-factor map followed by completion. There are two points in passing from the pointwise identity to solid theories. First, the pointwise presheaf in the proof of #cite(label("BMR2026")) Proposition 4.5.12 uses the constant ordinary $E_2$, not $E_2^square.stroked.tiny \( T \)$ as the reference input of Theorem 4.4.8. The preceding identity, natural in $T$, therefore identifies the two maps after precomposition from $E_2^delta$ and hypersheafification. By #cite(label("BMR2026")) Lemma 4.5.8,
  $ ell : E_2^delta arrow.r E_2^square.stroked.tiny tilde.eq L_(K \( 2 \))^square.stroked.tiny E_2^delta $
  is the localization unit. The connected target is $L_(K \( 2 \))^square.stroked.tiny$-local by its profinite evaluations, so its localization mapping property identifies the two underlying maps from $E_2^square.stroked.tiny$.
  Second, this does not give $E_2^delta$ a continuous $P_2$-action. Put $X = E_2^square.stroked.tiny$, $Y = hat(B)^square.stroked.tiny$, and write $Y^S$ for the profinite cotensor, so $Y^S \( T \) = Y \( S times T \)$. For the underlying solid spectra, the space of continuous $G$-equivariant maps is the bar totalization with degree $a$
  $ "Map" \( X \, Y^(G^a) \) . $
  Every target cotensor is local. Restriction along $ell$ is therefore an equivalence of mapping spaces in each degree; transport the bar cofaces through these equivalences. This requires no action on $E_2^delta$.
  To identify the transported source coface, let $g : S arrow.r P_2$ be a continuous family. Since $k$ is finite, compactness gives $C_(upright(c t s)) \( S times T \, k \) = C_(upright(c t s)) \( T \, C_(upright(c t s)) \( S \, k \)_(upright(d i s c)) \)$. Thus the cotensor of $k^delta$ by $S$ is $\( k^delta \( S \) \)^delta$, where $k^delta \( S \) = C_(upright(c t s)) \( S \, k \)$. The family gives a pair map
  $ gamma_g : \( k \, Gamma_2 \) arrow.r \( k^delta \( S \) \, Gamma_2 \) : $
  at every torsion level its coefficients are locally constant, as required by continuity. The naturality of Lemma 4.5.8 and the cotensor comparison of #cite(label("BMR2026")) Remark 4.5.6 give the commuting square
  #cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$E_2^delta$])
  content((3.065, 0), [$X$])
  content((0, 1.7), [$E \( k^delta \( S \) \, Gamma_2 \)^delta$])
  content((3.065, 1.7), [$X^S .$])
  line((0.765, 0), (2.555, 0), mark: (end: ">"))
  content((1.66, -0.45), [$ell$])
  line((0, 0.4), (0, 1.3), mark: (end: ">"))
  content((-0.45, 0.85), [$E \( gamma_g \)^delta$])
  line((3.065, 0.4), (3.065, 1.3), mark: (end: ">"))
  content((3.515, 0.85), [$a_(X \, g)$])
  line((1.615, 1.7), (2.215, 1.7), mark: (end: ">"))
  content((1.915, 2.15), [$ell_S$])
})
  Here $a_(X \, g)$ is the given family action and $ell_S$ is the corresponding localization unit under the cotensor identification. Consequently the source coface after restriction is precomposition of the connected tag by $gamma_g$. Target cofaces and interior cofaces are the full-pair family maps and parameter pullbacks. The tuple identification and $frak(f) frak(s) tilde.eq upright(i d)$ are natural for exactly these operations on every $R_(G^a times T)$. They give compatible homotopies in all bar degrees, hence
  $ r^(upright(c o n d)) b^square.stroked.tiny tilde.eq c^square.stroked.tiny $
  as continuous $G$-equivariant maps of underlying solid spectra. Both sides are independently maps of condensed $E_oo$-rings, and their source and target are solid. In particular they induce the same coefficient and even-line maps. This uses the localization mapping property degree by degree, not an interchange of localization with totalization or fixed points. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
