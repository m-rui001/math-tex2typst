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

#align(center)[#text(size: 16pt, weight: "bold")[B-semiampleness for compact log-smooth \
Kähler fibrations]]
#align(center)[OpenAI]
#align(center)[September 10, 2026]

== 1 Introduction <sec:intro>

The canonical bundle formula separates the canonical geometry of a fibration into a discriminant, which measures singularities over divisors, and a moduli part, which measures variation. The b-semiampleness conjecture predicts that a suitable multiple of the moduli part defines a morphism on a birational model of the base. Hodge-theoretic semipositivity underlies this formula #cite(label("Kawamata81")). Ambro established birational stabilization and positivity of the moduli part in the generic-klt setting #cite(label("Ambro04")) #cite(label("Ambro05")); Fujino–Gongyo proved b-nefness and abundance for projective lc-trivial fibrations #cite(label("FujinoGongyo14")). In the algebraic category, the conjecture is proved by Bakker–Filipazzi–Mauri–Tsimerman #cite(label("BFMT25")) Theorem 1.5. Their discussion of the analytic category retains projectivity of the morphism; the extension to Kähler morphisms is explicitly distinguished in #cite(label("BFMT25")) Remarks 6.31 and 7.5.

We resolve the compact log-smooth case of this Kähler b-semiampleness question. Both the source and the base may be nonprojective. The boundary may have coefficient one, so the relevant Hodge structure can be mixed. The assertion concerns actual holomorphic line bundles: numerical semipositivity alone would not suffice.

=== 1.1 Statement <statement>

All spaces and maps are complex analytic unless stated otherwise. A #emph[modification] is a proper bimeromorphic holomorphic map. Write $"Pic" \( X \)_(bb(Q)) = "Pic" \( X \) ⊗_(bb(Z)) bb(Q)$, using additive notation. Equality in this group means an isomorphism of holomorphic line bundles after a common positive integral multiple.

Let $f : Y arrow.r X$ be a surjective holomorphic map with connected fibers, where $Y$ and $X$ are smooth compact connected Kähler manifolds. Let $Delta$ be an effective rational divisor with simple normal crossing support and coefficients in $\[ 0 \, 1 \]$, and assume that

#[#set math.equation(numbering: n => "(1.1)")
 $ K_Y + Delta tilde.op_(bb(Q)) f^(*) L \, #h(2em) L in "Pic" \( X \)_(bb(Q)) . $ <eq:adjoint>]

These assumptions give an lc-trivial fibration in the usual rank-one sense; the rank condition is recalled in Section 2.

Here is the moduli object in the statement. For a smooth compact Kähler modification $mu : X' arrow.r X$, resolve the main component of $Y times_X X'$:

#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$Y'$])
  content((2.255, 0), [$Y$])
  content((0, -1.585), [$X'$])
  content((2.255, -1.585), [$X .$])
  line((0.402, 0), (1.919, 0), mark: (end: ">"))
  content((1.161, 0.2266), [#text(size: 0.73em)[$h$]])
  line((0, -0.2725), (0, -1.313), mark: (end: ">"))
  content((-0.3705, -0.7927), [#text(size: 0.73em)[$f'$]])
  line((2.255, -0.2725), (2.255, -1.313), mark: (end: ">"))
  content((2.578, -0.7927), [#text(size: 0.73em)[$f$]])
  line((0.402, -1.585), (1.787, -1.585), mark: (end: ">"))
  content((1.095, -1.812), [#text(size: 0.73em)[$mu$]])
})

Take $Y'$ smooth compact Kähler and set

$ Delta' = h^(*) Delta - K_(Y' \/ Y) . $

Thus $K_(Y') + Delta' = h^(*) \( K_Y + Delta \)$ under the natural canonical-bundle identification. Exceptional coefficients of $Delta'$ can be negative.

For a prime divisor $P subset X'$, put

#[#set math.equation(numbering: n => "(1.2)")
 $ t_P = inf_(E mapsto P) frac(a \( E \; Y' \, Delta' \), "ord"_E \( \( f' \)^(*) P \)) . $ <eq:threshold>]

Here the infimum ranges over all prime divisors on smooth proper bimeromorphic models of $Y'$ that dominate $P$, with positive denominator; $a \( E \; Y' \, Delta' \)$ denotes log discrepancy. Equivalently, $t_P$ is the largest $t$ for which $\( Y' \, Delta' + t \( f' \)^(*) P \)$ is sub-log-canonical over a general point of $P$. Define

#[#set math.equation(numbering: n => "(1.3)")
 $ B_(X') = sum_P \( 1 - t_P \) P \, #h(2em) M_(X') = mu^(*) L - K_(X') - B_(X') med in "Pic" \( X' \)_(bb(Q)) . $ <eq:moduli>]

These definitions are independent of the chosen resolution of the source. The coefficients are rational and only finitely many are nonzero; the elementary local calculation is recalled below. The family $upright(bold(M)) = \( M_(X') \)$ is the #emph[moduli rational b-line bundle].

#thm([Theorem 1.1.])[
  #emph[Under the assumptions above, $upright(bold(M))$ is b-semiample. More explicitly, there is a smooth compact Kähler modification $mu_0 : S arrow.r X$ such that:]
  + #emph[for every smooth compact Kähler modification $nu : S_1 arrow.r S$, 
$ M_(S_1) = nu^(*) M_S quad upright("in ") "Pic" \( S_1 \)_(bb(Q)) \; $

]
  + #emph[for some positive integer $m$, the actual line bundle representing $m M_S$ is generated by its global holomorphic sections.]
  #emph[The theorem includes a point base and relative dimension zero. No projectivity of $f$, $X$, or $Y$ is assumed.]
] <thm:main>

The discriminant in (1.3) is the log-canonical-threshold discriminant. It is not the weighted inf-multiplicity divisor of an orbifold base. In particular, a Hodge line produced by a decomposition of pluriforms must still be identified with (1.3). That identification is one of the principal steps of the proof.

=== 1.2 Proof and technical contributions <proof-and-technical-contributions>

Choose a compact Kähler modification $S$ whose boundary is simple normal crossing. Locally on $S$, take a cyclic root of a generator of the relative log-plurivolume line. Its highest Hodge eigenspace is one-dimensional. If horizontal coefficient-one components are present, an iterated residue identifies that line, through a single pure weight grade, with the volume line of a deepest boundary stratum. The mixed Hodge extension theorem of Fujino–Fujisawa #cite(label("FF25")) Theorem 1.1 makes this reduction compatible with extension over a disk.

The local extension calculation keeps track of all divisorial valuations and of the base Jacobian. For a local root volume $tau$, it proves the precise normalized order

$ "ord"_P^(upright("Hodge")) \( tau \) = t_P - 1 . $

It follows that the canonical Hodge extension is the actual moduli line and that it pulls back on every further smooth model. The same calculation works with arbitrary crepant vertical coefficients. It is therefore also available later on a projective comparison family.

Adjunction to a deepest stratum produces smooth compact Kähler klt fibers with trivial log-pluricanonical bundle. A theorem of Matsumura–Wang–Wu–Zhang gives finite product covers of these fibers #cite(label("MWWWZ25")) version 1, Corollary 1.3. A pointwise product decomposition is insufficient for semiampleness. We construct a marked family with a section, realize its finite fiber covers after finite base changes, and parameterize their product graphs inside fixed compact Kähler ambients. Compact Douady components and a proper-constructibility argument give a compact proper surjection $P arrow.r S$ carrying the required product family on a dense open. The auxiliary base need not be projective or generically finite over $S$.

The product has a projective log Calabi–Yau factor and factors whose highest forms are controlled by weight-one or weight-two periods. The first is handled by the algebraic b-semiampleness theorem on a projective comparison base. For the others, a flat change of the Hodge filtration turns a real polarization into a rational one without changing the underlying integral monodromy. Arithmetic period compactifications then supply semiample extensions. This use of period compactification is analytic on the auxiliary base #cite(label("BFMT25")) Theorems 5.2 and 5.5.

Finally, a product identity of volume norms and two-sided logarithmic bounds extend a specified open isomorphism of line bundles across the boundary. This step excludes an undetected flat twist. Semiampleness descends from $P$ through Stein factorization and finite analytic norms. These arguments yield global generation at every point of $S$, with one exponent. The proof does not use the Campana orbifold Iitaka theorem.

== 2 Analytic models and plurivolumes <sec:prelim>

=== 2.1 Discrepancies and the rank condition <discrepancies-and-the-rank-condition>

For a smooth model $h : V arrow.r Y$, log discrepancy is normalized by

$ a \( E \; Y \, Delta \) = 1 + "coeff"_E \( K_(V \/ Y) - h^(*) Delta \) . $

A #emph[sub-pair] allows negative boundary coefficients; it is sub-log-canonical when these numbers are nonnegative. On a smooth simple normal crossing pair, this is equivalent to every boundary coefficient being at most one.

For comparison with the standard definition of an lc-trivial fibration, write

$ A_V = K_(V \/ Y) - h^(*) Delta \, #h(2em) A_V^(*) = A_V + sum_("coeff"_E \( A_V \) = - 1) E . $

The usual rank condition is $"rk" \( f compose h \)_(*) cal(O)_V \( ceil.l A_V^(*) ceil.r \) = 1$. In the effective log-smooth situation of Theorem 1, the identity is a log resolution. For a coefficient less than one, $ceil.l - delta ceil.r = 0$; for a coefficient equal to one, the correction in $A_Y^(*)$ gives zero. Hence $ceil.l A_Y^(*) ceil.r = 0$, and connected fibers give the rank condition. Its resolution independence is the usual discrepancy convention. All later applications to projective comparison families will check the generic rank directly.

#thm([Lemma 2.1.])[
  #emph[Fix a model $f' : \( Y' \, Delta' \) arrow.r X'$ as in (1.3) and a prime $P subset X'$. On a joint log resolution of $Delta'$ and $\( f' \)^(*) P$, let $delta_E$ be the crepant coefficient and $a_E = "ord"_E \( \( f' \)^(*) P \) > 0$. Over a general point of $P$, 
$ t_P = min_(E mapsto P) frac(1 - delta_E, a_E) . $

 In particular, the threshold is rational and unchanged by a further resolution of the source. The divisor $B_(X')$ has finite support.]
] <prelim:threshold>

#proof[
  On the joint simple normal crossing model the vertical coefficients of the tested sub-pair are $delta_E + t a_E$. The horizontal coefficients are already at most one. The sub-log-canonical condition is therefore precisely $delta_E + t a_E lt.eq 1$ for every vertical $E$ dominating $P$. For a simple normal crossing sub-pair these bounds also test all further exceptional valuations: the log discrepancy of a blowup stratum is the sum of the corresponding nonnegative coordinate log discrepancies, with any remaining smooth directions contributing nonnegative terms. Equivalently, this is the standard local simple normal crossing discrepancy criterion. Thus the minimum is the infimum in (1.2).
  Outside a proper analytic subset of $X'$, the morphism and all horizontal boundary strata are smooth and the boundary is relatively simple normal crossing, with no vertical component. At each prime meeting this open the same calculation gives $t_P = 1$. Properness gives an analytic bad locus; on a compact base it has finitely many irreducible components. Only its divisorial components can contribute to $B_(X')$. ◻
]

=== 2.2 Model constructions <model-constructions>

We use analytic embedded and equivariant resolution, chosen projective over the space being resolved. Functorial resolution is compatible with smooth product directions; see #cite(label("BM08")) Theorems 1.1 and 1.3. In particular, the resolution of a fractional monomial cover can preserve additional smooth logarithmic coordinate directions. Only compact or relatively compact neighborhoods are used, so no global finiteness issue for a noncompact resolution arises.

We will also use the following standard analytic model facts.

#thm([Lemma 2.2.])[
  #emph[]
  + #emph[A closed analytic subspace of a compact Kähler manifold, and a finite cover of such a space, admit smooth compact Kähler models obtained by projective resolution. The corresponding assertion holds locally over relatively compact base charts.]
  + #emph[Let $V$ be a smooth compact Kähler manifold and $V^compose subset V$ a dense analytic Zariski open. A finite unramified holomorphic cover of $V^compose$ extends to a finite normal cover of $V$. After resolution it has a smooth compact Kähler model unchanged over the smooth covering open.]
] <prelim:models>

#proof[
  For (i), closed analytic subspaces inherit Kähler structures as complex spaces. Finite maps preserve the Kähler property on the source, and projective resolutions over a Kähler space have Kähler total space. The same construction on a slightly larger chart gives the local assertion. These are the analytic Kähler model facts used in #cite(label("Fujiki78")) Section 4.
  For (ii), apply the analytic extension theorem for finite covers, followed by normalization; a convenient formulation for the present Kähler setting is #cite(label("Villadsen24")) version 1, Lemma 2.21. Locally, after resolving the complement to normal crossings, the cover has finite monodromy about the coordinate divisors. Sufficiently divisible coordinate power substitutions trivialize that monodromy. The resulting trivial finite covers extend over the polydisk, and their finite quotients give the normal extension before the power substitution. Normal extensions agree on overlaps by uniqueness. Part (i) and projective resolution give the last assertion. ◻
]

A compact parameter space used below need not be Kähler. Whenever a Kähler form on a family is needed, it will come from one of the fixed ambient spaces of Lemma 3, not from a presumed polarization of its parameter space.

=== 2.3 The prepared family <the-prepared-family>

Choose a dense analytic Zariski open $U subset X$ on which $f$, every relevant boundary stratum, and their incidence diagrams are smooth over the base. Remove vertical boundary images. The boundary over $U$ is then relatively simple normal crossing. Existence follows from properness and generic smoothness applied to the finitely many strata.

Fix a sufficiently divisible $m > 0$ so that $m Delta$ is integral and (1.1) is realized by an actual bundle isomorphism in degree $m$. It will be harmless to replace $m$ by a further multiple finitely often. Set $d = dim Y - dim X$. The line of relative log plurivolumes on $U$ is

#[#set math.equation(numbering: n => "(2.1)")
 $ cal(G)_m = f_(*) cal(O)_(Y_U) #scale(x: 120%, y: 120%)[\(] m \( K_(Y_U \/ U) + Delta \|_(Y_U) \) #scale(x: 120%, y: 120%)[\)] tilde.eq cal(O)_U #scale(x: 120%, y: 120%)[\(] m \( L - K_X \) #scale(x: 120%, y: 120%)[\)] . $ <eq:open-volume-line>]

The last notation denotes a holomorphic line bundle, whether or not it has a global meromorphic section. The isomorphism follows from (1.1), the projection formula and $f_(*) cal(O)_Y = cal(O)_X$. The evaluation map identifies its pullback with the relative log-pluri bundle. A local generator therefore has no zeros as a log pluriform with the specified twist; as a meromorphic relative pluriform it has divisor $- m Delta$.

Take a compact Kähler log resolution $mu_0 : S arrow.r X$, isomorphic over $U$, such that the complement of $U$ is supported on a simple normal crossing divisor. Resolve the main component of the pulled-back family to $p : W arrow.r S$, unchanged over $U$, and put

#[#set math.equation(numbering: n => "(2.2)")
 $ D_W = h^(*) Delta - K_(W \/ Y) \, #h(2em) L_S = mu_0^(*) L \, #h(2em) Q_S = L_S - K_S . $ <eq:prepared-data>]

The natural canonical-bundle identifications give

#[#set math.equation(numbering: n => "(2.3)")
 $ K_(W \/ S) + D_W tilde.op_(bb(Q)) p^(*) Q_S . $ <eq:relative-adjoint>]

We retain the actual degree-$m$ identification coming from (1.1). Over $U$, $m Q_S$ is the line $cal(G)_m$. On $S$, the desired moduli trace is $M_S = Q_S - B_S$.

The local calculations below use only (2.3) and the smooth effective log-smooth generic pair. Thus they continue to apply if the vertical coefficients of $D_W$ are arbitrary rational numbers. This observation will be used for the projective comparison.

=== 2.4 Degenerate dimensions <degenerate-dimensions>

If $X$ is a point, its rational Picard group is zero, and Theorem 1 is immediate. If $d = 0$, connected general fibers make $f$ bimeromorphic. A proper bimeromorphic morphism to a smooth space is an isomorphism outside an analytic subset of codimension at least two in the base. At the general point of each base divisor,

$ t_P = 1 - "coeff"_P \( f_(*) Delta \) . $

The actual adjoint identity on this isomorphism locus extends, with its inverse, across codimension two. Hence $L = K_X + f_(*) Delta$ in $"Pic" \( X \)_(bb(Q))$, and $M_X = 0$. The same argument with the crepant sub-boundary applies on every higher model, so all moduli traces vanish. Here a rational divisor on a smooth base is rational Cartier; the extension assertion is the removable-singularities theorem for local functions expressing a line-bundle isomorphism. We may therefore assume $dim X > 0$ and $d > 0$ in the rest of the proof, while allowing zero-dimensional strata and empty products.

== 3 The root eigenline and its deepest residue <hodge:section>

The coefficient-one part of the boundary naturally produces a mixed variation. We first identify the line of volumes inside that variation and then identify the same line in a pure variation associated with a deepest boundary stratum. The comparison will retain the specified volume, which is necessary for the extension calculation in Section 4.

=== 3.1 A local root construction <hodge:rootconstruction>

Use the notation of Section 2. Thus $S$ is a smooth compact Kähler modification with good open $U$, the complement $S \\ U$ is an SNC divisor, and

$ p : W arrow.r S \, #h(2em) D_W = h^(*) Delta - K_(W \/ Y) \, #h(2em) K_(W \/ S) + D_W tilde.op_(bb(Q)) p^(*) Q_S . $

The equivalence is equipped with the actual bundle identification in a fixed degree $m$. Over $U$, the map and the boundary strata are smooth, the boundary is relatively SNC with coefficients in $\[ 0 \, 1 \]$, and

$ cal(G)_m = p_(*) cal(O)_W #scale(x: 120%, y: 120%)[\(] m \( K_(W \/ S) + D_W \) #scale(x: 120%, y: 120%)[\)] \|_U tilde.eq cal(O)_S \( m Q_S \) \|_U . $

Only this good-open condition will be used in the present section.

Choose a sufficiently small coordinate neighborhood $V subset S$ and a frame $s$ of $cal(O)_S \( m Q_S \) \|_V$. Its image on $W_V$ is a meromorphic section of $omega_(W \/ S)^(⊗ m)$, with divisor $- m D_W$. Form its normalized $m$-th-root cover. This construction does not require a meromorphic trivialization of $omega_(W \/ S)$: choose an effective integral divisor $J$ that clears the poles, form the finite root cover of the holomorphic section in $\( omega_(W \/ S) \( J \) \)^(⊗ m)$, and normalize. The resulting cover with its meromorphic root is independent of the pole clearing. In a local canonical frame $alpha$, if $s = a alpha^(⊗ m)$, it is given by adjoining $z$ with $z^m = a$, and the root form is $z alpha$, pulled back as a differential form.

Keep every component of this cover. The group $mu_m$ acts on it, and the tautological root has a fixed character $chi$. Take a projective equivariant resolution and write

$ rho : Z arrow.r W_V \, #h(2em) tau = upright("the pulled-back relative root form") . $

The space $Z$ and its fibers are allowed to be disconnected. The finite-cover and resolution facts from Section 2 give Kähler total spaces after shrinking $V$, with the resolution performed over a slightly larger neighborhood.

Put $V^compose = V ∩ U$. On this open the construction can be made smooth over the base, with a relative reduced SNC divisor $H$ consisting of the inverse images of the coefficient-one components. Here is the local reason for this assertion. In relative SNC coordinates the tensor has the form

#[#set math.equation(numbering: n => "(3.1)")
 $ s = a thin product_(nu = 1)^r x_nu^(- m delta_nu) \( d x_1 and dots.h.c and d x_d \)^(⊗ m) \, #h(2em) a in cal(O)^(*) \, quad 0 lt.eq delta_nu lt.eq 1 . $ <hodge:localtensor>]

After taking a local root of the unit and removing full $m$-th powers, the normalized cover is a monomial cover in the coordinates with $0 < delta_nu < 1$. The coefficient-one coordinates, the other fiber coordinates, and the base coordinates are smooth product parameters. Functorial resolution, which commutes with smooth morphisms, resolves the monomial part while preserving these product parameters; one can equally use a toroidal resolution in the fractional directions. Thus the inverse images of the coefficient-one components are smooth reduced divisors, their intersections are the corresponding resolved covers of the original intersections, and all these strata are smooth over $V^compose$. This use of functorial resolution is as in #cite(label("BM08")) Theorems 1.1 and 1.3.

#thm([Lemma 3.1.])[
  #emph[Over $V^compose$, the form $tau$ is a relative top form with at most logarithmic poles on $H$ and no other poles. At a strict covering prime over a horizontal divisor of coefficient $delta$, if $j$ is the ramification index, its order is 
$ j \( 1 - delta \) - 1 . $

]
] <hodge:rootpoles>

#proof[
  At the generic point of the divisor, substitute $x = z^j$ in $x^(- delta) d x$. The order is $j - 1 - j delta$. It is integral; for $delta < 1$ it lies between $0$ and $j - 1$, while for $delta = 1$ it equals $- 1$.
  For exceptional divisors in a monomial resolution in the fractional directions, the shifted order is the sum of the nonnegative coordinate orders multiplied by $1 - delta_nu$. At least one fractional coordinate has positive order, so this sum is strictly positive. The actual order is integral, hence nonnegative. Equivalently, write the root of (3.1) in a logarithmic differential basis. The coefficient has a strictly positive gain in every exceptional fractional direction, whereas the logarithmic Jacobian has at most a simple pole. The coefficient-one coordinates remain transverse product parameters. Consequently the only poles are the asserted simple logarithmic poles along $H$. ◻
]

=== 3.2 Extension facts and the mixed top step <hodge:extensionfacts>

We record precisely the extension input needed below. Let $Delta_t$ be a disk and $Delta_t^(*) = Delta_t \\ { 0 }$. Suppose

$ g : \( Z \, H \) arrow.r Delta_t $

is proper, $Z$ is smooth Kähler, $H$ is a reduced SNC divisor, every stratum of $\( Z \, H \)$ dominates the disk, and all strata are smooth over $Delta_t^(*)$. Write $d = dim Z - 1$. Fujino–Fujisawa’s Theorem 1.1 supplies the graded-polarizable real variation on $H_c^d \( Z_t \\ H_t \)$ and its lower canonical extension, with locally free double Hodge/weight grades #cite(label("FF25")) Theorem 1.1. Its dual description gives

#[#set math.equation(numbering: n => "(3.2)")
 $ g_(*) omega_(Z \/ Delta_t) \( H \) tilde.eq ("Gr"_F^0 thin overline(H_c^d \( Z_t \\ H_t \))^(thin upright("lower")))^(*) . $ <hodge:FF>]

Poincaré duality identifies $H_c^d zws^(*)$ with $H^d \( d \)$. Therefore (3.2) is the extended $F^d$ step of ordinary cohomology in the #emph[upper] canonical extension. All its double grades remain locally free. Upper residues lie in $\( - 1 \, 0 \]$, and lower residues in $\[ 0 \, 1 \)$; in the unipotent case the conventions coincide #cite(label("FF25")) Section 2.14.

For pure variations we will use the following consequences of the nilpotent orbit theorem. We include the functorial consequences in the statement to specify exactly what is required of an extension.

#thm([Lemma 3.2.])[
  (Pure extension rules).  #emph[Let a real-polarizable variation of pure Hodge structure be given on the complement of an SNC divisor in a polydisk, with quasi-unipotent local monodromies.]
  + #emph[After coordinate power substitutions making all local monodromies unipotent, its Hodge filtrations extend by subbundles of the canonical flat bundle. On a disk, the filtration also extends by subbundles of either the upper or the lower canonical bundle before unipotentization.]
  + #emph[After coordinate power substitutions making the monodromies unipotent, the canonical extension and its Hodge filtration commute with further powers and with pullback to any disk whose punctured image lies in the given open.]
  + #emph[A real pure Hodge morphism has flat Hodge kernels and images, with flat Hodge complements. Its split maps and finite-group eigenspace projectors are compatible with the canonical extensions in (i). After unipotentization, tensor constructions are compatible as well.]
  + #emph[On a unipotent disk, a nonvanishing frame $e$ of an extended highest Hodge line satisfies, for some constants $C \, A > 0$, 
#[#set math.equation(numbering: n => "(3.3)")
 $ C^(- 1) \( 1 + \| log \| t \| \| \)^(- A) lt.eq parallel e \( t \) parallel lt.eq C \( 1 + \| log \| t \| \| \)^A . $ <hodge:logbounds>]

 The constants may depend on the disk. The same assertion applies to Hodge determinant lines.]
] <hodge:purerules>

#proof[
  In the unipotent case, extension by subbundles is the nilpotent orbit theorem #cite(label("Schmid73")) Theorem 4.12; a formulation with real polarization and its canonical-frame interpretation is given in #cite(label("CK89")) Section 2, $\( 2.1 \)$–$\( 2.2 \)$. For a quasi-unipotent disk, make the cyclic substitution $t = u^N$ that removes the semisimple monodromy. Its finite deck group acts on the extended filtered bundle. Choose a character basis at the origin adapted to the Hodge flag. Lift these vectors to local sections in the corresponding Hodge subbundles and average with the character projectors. The resulting equivariant sections form an adapted frame near the origin. Multiplying its vectors by the integral powers of $u$ prescribed by their characters gives a descending frame with residue eigenvalues in either chosen interval $\( - 1 \, 0 \]$ or $\[ 0 \, 1 \)$. The same subsets of this frame span the respective extended Hodge steps. This proves the disk assertion for both canonical conventions.
  For unipotent monodromies with commuting logarithms $N_i$, the canonical flat bundle is described in logarithmic frames. Under a disk map, each boundary coordinate is $t^(a_i) v_i \( t \)$, with $v_i$ a unit and $a_i gt.eq 0$. The pulled-back logarithmic connection has nilpotent residue $sum_i a_i N_i$. Thus the pulled-back flat bundle is the canonical one. The pulled-back Hodge subbundles are the canonical filtration as well, by its characterization inside this bundle.
  For a pure Hodge map, its kernel and image are flat real Hodge subbundles. The restriction of a polarization to a real Hodge subspace is nondegenerate. Orthogonal complements therefore split the map in the category of real variations. These projectors are flat, so in logarithmic frames their extensions have the same constant ranks. A polarization can be averaged over a finite group; one then complexifies and applies the character projectors. This uses no semisimplicity assertion for arbitrary local systems.
  The abstract norm estimate is #cite(label("Schmid73")) Theorem $6.6'$. Applied to a flat frame and its dual, it bounds the metric and its inverse by powers of $1 + \| log \| t \| \|$. Logarithmic frames differ from flat frames by finite polynomials in the logarithm. A nonvanishing extended line frame has bounded coefficients in a logarithmic frame and one coefficient bounded away from zero locally. The metric and inverse-metric bounds give (3.3). Tensor and determinant constructions preserve this conclusion. ◻
]

The variations occurring here have integral lattices up to isogeny. Indeed they arise from the cohomology of compact SNC strata and the rational weight filtration. A Kähler class on the total space restricts to flat real Kähler classes on these strata, so their pure cohomologies, and the relevant kernels and images, are real-polarizable. Their local monodromies are quasi-unipotent by the integral monodromy theorem. One may use its real-polarized formulation; alternatively, the elementary transport in Lemma 23 reduces it to the rationally polarized statement without changing the integral monodromy. Applying the theorem to weight grades also gives quasi-unipotence for the mixed variation.

#thm([Lemma 3.3.])[
  (The top step and its weight grade).  #emph[Let a mixed variation on a punctured disk be extended in its upper canonical flat bundle, with the canonical weight filtration and locally free double Hodge/weight grades, as in (3.2). Suppose a finite-group character summand satisfies 
$ dim F^d = 1 \, #h(2em) F^(d + 1) = 0 \, $

 and the sole nonzero $F^d$ weight grade has weight $w$. Then projection to $"Gr"_w^W$ identifies the extended top line with the canonically extended top line of that pure grade.]
] <hodge:doublegrades>

#proof[
  The induced filtration of $F^d$ by the weights has just one nonzero successive quotient. Local freeness of the double grades implies that the same ranks and exact quotient sequences hold at the origin. Its terms below weight $w$ vanish and its terms from weight $w$ onward equal the whole line. Projection is therefore an isomorphism there as well. The upper canonical extension is exact on the weight filtration, and the induced filtration on a pure grade is its canonical Hodge filtration. These statements also follow by dualizing the lower extension in (3.2). The character projector is an idempotent on all these locally free objects, so taking its image preserves the argument. ◻
]

=== 3.3 The pure line detected by residues <hodge:pureresidue>

Over $V^compose$, put

$ bb(V) = R^d \( g \|_(Z \\ H) \)_(*) bb(C) \, #h(2em) g : Z arrow.r V \, $

where the notation denotes ordinary cohomology on the smooth open fibers. We use $W_bullet$ for its weight filtration. The logarithmic mixed Hodge construction identifies

#[#set math.equation(numbering: n => "(∗)")
 $ F^d bb(V)_x tilde.eq H^0 \( Z_x \, omega_(Z_x) \( H_x \) \) . $]

It is the ordinary-cohomology version of the compact-support SNC construction above: compact supports are computed by the simple complex of the compactification and its successive intersections; duality gives logarithmic forms and residues. These constructions work for compact Kähler strata, using their pure Hodge structures and Hodge degeneration, as in #cite(label("FF25")) Section 4; compare #cite(label("Deligne71")) Section 3.

#thm([Proposition 3.4.])[
  (Root eigenline and deepest residue).  #emph[Let $k$ be the maximal number of horizontal coefficient-one components meeting in a good fiber, constant after shrinking $U$. For the local root family above:]
  + #emph[
$ F^d bb(V)_chi = cal(O)_(V^compose) tau . $

 This line lies in the single pure weight grade $"Gr"_(d + k)^W bb(V)_chi$.]
  + #emph[Choose a depth-$k$ intersection component downstairs dominating the good open. After a good-open base change selecting one connected component $A_x^(*)$ of its fibers, take every root-cover sheet above that component. Iterated residue identifies the line in (i), through its pure grade and with the Tate twist removed, with the highest eigenline of the resolved root cover of the induced klt volume on $A_x^(*)$. In degree $m$ this is the specified plurivolume identification from SNC adjunction.]
  + #emph[These highest-line identifications preserve generators in canonical extensions on unipotent disks. In a disk model satisfying the hypotheses of (3.2), its extended mixed top line projects isomorphically to the same pure line.]
  #emph[If $k = 0$, the intersection is the whole original fiber, there is no removed divisor, and the pure root-cover cohomology itself provides the line.]
] <hodge:residue>

#proof[
  By Lemma 4, $tau_x$ belongs to the top logarithmic-form space. If $eta$ is another such eigenform with character $chi$, the ratio $eta \/ tau_x$ is invariant under $mu_m$. It descends to a meromorphic function on the original connected compact smooth fiber, also when the normalized cover is disconnected: the invariant meromorphic algebra of the full root cover is the downstairs algebra. At a strict covering divisor, a downstairs pole of order $n gt.eq 1$ would lower the order in Lemma 4 by $j n$. For $delta < 1$ this gives a pole where no pole is allowed; for $delta = 1$ it gives an order below $- 1$. The ratio has no pole along any downstairs prime. It extends across the remaining codimension-two set, and compactness makes it constant. This proves the first displayed equality.
  There is no Hodge step above $F^d$. Exactness of the induced weight filtration on this one-dimensional space shows that exactly one weight grade carries it. To determine that grade, let $H_x^(\[ r \])$ be the disjoint union of the $r$-fold intersections, with $H_x^(\[ 0 \]) = Z_x$. The residue spectral sequence has terms
  #[#set math.equation(numbering: n => "(3.4)")
   $ E_1^(- r \, q) = H^(q - 2 r) \( H_x^(\[ r \]) \, bb(C) \) \( - r \) med arrow.r.double med H^(q - r) \( Z_x \\ H_x \, bb(C) \) . $ <hodge:weightspectral>]
  The differentials on the first page are pure Hodge maps. Taking their kernels modulo images leaves pure objects, and subsequent differentials vanish by their different weights. Since $H_x^(\[ k + 1 \])$ is empty, there is no incoming first differential at $\( - k \, d + k \)$. Consequently (3.4) gives a natural pure map
  #[#set math.equation(numbering: n => "(3.5)")
   $ "Gr"_(d + k)^W H^d \( Z_x \\ H_x \, bb(C) \) arrow.r.hook H^(d - k) \( H_x^(\[ k \]) \, bb(C) \) \( - k \) . $ <hodge:residuemap>]
  On the highest Hodge step it is iterated residue. In local SNC coordinates this extracts the coefficient of $d x_1 \/ x_1 and dots.h.c and d x_k \/ x_k$; integration over the corresponding normal circles gives the same cohomological map, up to fixed conventional constants. Thus it is horizontal in families.
  At a point of a selected deepest intersection away from fractional boundary, the root cover is unramified and $tau_x$ has exact logarithmic poles in the $k$ transverse coordinates. Its residue is nonzero. It extends as a holomorphic top form on the compact resolved intersection upstairs and hence has a nonzero cohomology class. The unique weight carrying $F^d bb(V)_chi$ is therefore $d + k$.
  Consider now the selected connected component $A_x^(*)$ downstairs. By maximality of $k$, no further coefficient-one component meets it. The remaining boundary is effective fractional SNC, so the induced pair is klt. In the product coordinates of the root construction, taking residue simply deletes the $k$ logarithmic parameters. The union of all sheets above $A_x^(*)$ is thus the resolved root cover of its induced log plurivolume. Its top eigenline has dimension one by the same ratio argument. The projection of (3.5) to these sheets is nonzero on the source line, and therefore identifies the two top lines. With an ordering of the boundary components, tensor power of ordinary residue gives
  $ \( "Res" tau_x \)^(⊗ m) = rho^(*) \( "Res"_m s_x \) . $
  Here $"Res"_m$ denotes the bundle map supplied by SNC adjunction; fixed sign or normalization choices do not affect the argument.
  The maps on pure grades and compact intersection cohomology are real Hodge maps before taking the character summand. Their kernels and images split by Lemma 5, including after projection to all the selected sheets. They hence preserve the extended highest-line generators. On a disk to which (3.2) applies, Lemma 6 identifies the mixed top line with that on its unique pure grade. This proves (iii).
  For $k = 0$ there is no logarithmic boundary, so ordinary compact root-cover cohomology is pure of weight $d$, and the same eigenform argument applies directly. ◻
]

=== 3.4 Changing the resolved root model <hodge:modelchanges>

The order calculation will use resolved models adapted to a chosen disk. Such a model can modify a generic root fiber, so one needs the following invariance statement rather than a claim that every cohomology group is birationally invariant.

#thm([Lemma 3.5.])[
  #emph[Over a smooth good open, let $phi : \( Z' \, H' \) arrow.r \( Z \, H \)$ be a proper equivariant modification between smooth families of SNC pairs, with $H'$ the reduced inverse image of $H$. Pullback is an isomorphism on top logarithmic-form spaces. In the character summand of Proposition 7, it identifies the top line and the top line of its unique pure weight grade.]
  #emph[Suppose further that, over a disk, the new compactification satisfies the hypotheses of (3.2). If the original variation has been made unipotent, testing extension of the pulled-back volume in $g'_(*) omega_(Z' \/ Delta) \( H' \)$ tests the canonical extension of the original top line. It is not necessary to assume unipotence of every summand newly appearing in the cohomology of $Z' \\ H'$.]
] <hodge:birational>

#proof[
  Pullback of an SNC logarithmic top form has at most logarithmic poles along the reduced inverse image of the boundary. To descend a top logarithmic form, use the isomorphism away from the codimension-two exceptional image on each smooth original fiber. The resulting section of $omega_Z \( H \)$ extends across that image because this is a line bundle. Thus pullback and descent are inverse on top forms.
  Pullback of logarithmic complexes gives the cohomological morphism of mixed variations. It respects residues and both filtrations; one can see the logarithmic pullback in SNC coordinates, and the compact-stratum construction gives the same rational map. Morphisms of mixed Hodge structures are strict for the weight filtration on each Hodge step. Since the top line maps isomorphically, its unique carrying weight is unchanged, and the induced pure map is an isomorphism on these highest lines.
  Use the upper canonical extension for the new model. Its extended mixed top eigenspace projects isomorphically to its pure grade by Lemma 6. The comparing pure map splits onto its image and is compatible with upper extension by Lemma 5. That image is the unipotent summand pulled from the original variation, so upper extension on it is the unipotent canonical extension. All other weight grades have zero top step of this character. Formula (3.2) therefore tests precisely the original extended line, as claimed. ◻
]

== 4 Threshold orders and descent on higher models <orders:section>

We now identify the extension of the specified volume line with the moduli trace defined by log canonical thresholds. The calculation is local on the base, but its compatibility with pullback will give the assertion on every higher modification.

We use a slightly more general setup than the original fibration. Let $p : W arrow.r S$ be a proper connected-fiber map between smooth compact Kähler manifolds, let $U subset S$ have SNC complement, and suppose that over $U$ the family is smooth with effective relatively SNC boundary whose coefficients lie in $\[ 0 \, 1 \]$. Let $D_W$ be a rational divisor extending that boundary, with

#[#set math.equation(numbering: n => "(4.1)")
 $ K_(W \/ S) + D_W tilde.op_(bb(Q)) p^(*) Q_S $ <orders:adjoint>]

and a specified bundle identification in degree $m$. The coefficients on vertical components of $D_W$ are arbitrary rational numbers; in particular, they need not be at most one. We use the thresholds of the sub-pair $\( W \, D_W \)$ to define

$ B_S = sum_P \( 1 - t_P \) P \, #h(2em) M_S = Q_S - B_S . $

All source modifications below carry the crepant transform of $D_W$. The original setup satisfies these conditions. The projective comparison in Section 6 will use the allowance of arbitrary vertical coefficients.

=== 4.1 Thresholds on a resolved transverse disk <orders:thresholds>

#thm([Lemma 4.1.])[
  #emph[Fix a prime divisor $P subset S$. On a resolution over a general point of $P$, arrange joint SNC support for the crepant divisor and $p^(*) P$. Write $delta_E$ for the crepant coefficient and $a_E = "ord"_E \( p^(*) P \) > 0$ for the components dominating $P$. Then 
#[#set math.equation(numbering: n => "(4.2)")
 $ t_P = min_(E mapsto P) frac(1 - delta_E, a_E) . $ <orders:thresholdformula>]

 This minimum computes the threshold over all divisorial valuations, including valuations exceptional over the chosen resolution.]
] <orders:threshold>

#proof[
  For a rational SNC divisor, sub-log-canonicity is equivalent to all coefficients being at most one. To recall why this tests further valuations, in coordinates for its support write the logarithmic top form
  $ frac(d x_1, x_1) and dots.h.c and frac(d x_r, x_r) and d x_(r + 1) and dots.h.c and d x_n . $
  At any prime on a smooth model its pullback has at most a simple pole: all singular normal terms in the logarithmic differentials are multiples of the same normal differential $d z \/ z$, so at most one can occur in the wedge. If $b_i$ are the coordinate orders there, this gives the logarithmic Jacobian inequality. For coefficients $c_i lt.eq 1$, the resulting log discrepancy is at least $sum_i b_i \( 1 - c_i \) gt.eq 0$. Necessity is already detected by a component of coefficient greater than one. Negative coefficients cause no change in this criterion.
  The horizontal coefficients on the resolved model are at most one, because the sub-pair is log canonical over the good open and their coefficients are constant. The coefficient of a vertical component in $D_W + t thin p^(*) P$ is $delta_E + t a_E$. The preceding criterion therefore gives exactly (4.2). ◻
]

At a general smooth point of $P$, choose base coordinates $\( t \, z_2 \, dots.h \, z_b \)$ with $P = \( t = 0 \)$, and hold the last $b - 1$ coordinates fixed. First resolve the joint divisor on the source. Properness and generic smoothness of the finitely many relevant strata allow the chosen point to avoid their bad images. The resulting transverse slice has a smooth source, and restriction of the joint divisor is SNC. Adjunction of the other base coordinates changes none of the orders in (4.2). Components mapping to higher codimension subsets of $S$ are absent from this general slice. We may therefore perform the order calculation on a disk.

Throughout that calculation, a relative canonical form means a section of $omega_W ⊗ p^(*) omega_(Delta_t)^(- 1)$. Wedging with the chosen frame $d t$ identifies it with a total canonical form. This convention remains valid at the central fiber; it does not presume that $p$ is a submersion there.

#thm([Lemma 4.2.])[
  (Disk models for the extension test).  #emph[Fix the local root family of Section 3.1 and a resolved transverse disk downstairs. For every sufficiently divisible power substitution $t = u^N$, there is a smooth equivariant Kähler model over $Delta_u$ with the following properties:]
  + #emph[It retains every component of the generic root cover and maps to the downstairs order resolution. On the punctured disk it is a modification of the pulled-back root family.]
  + #emph[The horizontal removed divisor $H_N$, defined by the reduced full inverse image of the original removed divisor on the punctured disk and then closed up, is SNC. Its support and the full central fiber have joint SNC support.]
  + #emph[Every stratum of $\( Z_N \, H_N \)$ dominates the disk and is smooth over a smaller punctured disk.]
  + #emph[For each vertical prime $E$ on the downstairs order resolution, some prime on $Z_N$ dominates $E$.]
  #emph[Consequently (3.2) applies to this model, and its top eigenline tests the extension of the original line as in Lemma 8.]
] <orders:diskmodels>

#proof[
  Take the main parts of the fiber products of the root cover, the downstairs order resolution, and $Delta_u$. Here main parts means every component dominating the disk, so no generic root sheet is discarded. Normalize the finite covers and take a common projective equivariant resolution, including embedded resolution of the horizontal boundary and central fiber. This gives the required maps. Finite covers and projective resolutions preserve the local Kähler models from Section 2. A prime above a downstairs prime exists already on the normalized finite cover; retaining its strict transform proves (iv).
  Only horizontal components belong to $H_N$. Joint SNC with the central fiber shows that none of their intersection components can be vertical. Indeed, if such a stratum were contained in the central fiber, it would be contained in one of its components. In SNC coordinates the intersection of the specified horizontal coordinate hyperplanes cannot be contained in the additional central-fiber coordinate hyperplane. Properness now makes the image of every stratum the whole disk. Generic smoothness and shrinking the disk give smoothness of all strata off its origin.
  On the punctured disk the comparison is an equivariant modification of smooth SNC families, with the reduced full inverse image as boundary. Lemma 8 identifies the top eigenline and its extension. If the new ambient cohomology is merely quasi-unipotent, use its upper canonical extension; the summand coming from the unipotent original line has the same canonical extension there. ◻
]

=== 4.2 The exact order calculation <orders:localcalculation>

Let $sigma$ be a meromorphic relative $m$-plurivolume on the downstairs disk model whose good-fiber divisor is $- m$ times the prescribed effective SNC log Calabi–Yau boundary. It may have arbitrary vertical orders. Let $Omega$ denote its multivalued total root, obtained by multiplying the relative root by $d t$, and put

$ l_E = 1 / m "ord"_E \( sigma ⊗ d t^(⊗ m) \) \, #h(2em) a_E = "ord"_E \( t \) . $

Resolve the joint support of the divisor of this tensor and the central fiber. The root construction gives a section $tau$ of the pure highest eigenline on the punctured disk. We compare it with the canonical extension after unipotentization.

#thm([Lemma 4.3.])[
  (Order of a root volume).  #emph[The section $tau$ is meromorphic in that extended line. Its normalized order is 
#[#set math.equation(numbering: n => "(4.3)")
 $ "ord"_0^(upright("Hdg")) \( tau \) = min_E frac(l_E + 1 - a_E, a_E) \, $ <orders:generalorder>]

 where $E$ runs through the central-fiber primes on the downstairs resolution. The normalization divides an ordinary order after $t = u^N$ by $N$. At the displayed order, the corrected section generates the extension after clearing its denominator.]
] <orders:order>

#proof[
  For a rational number $b$, take $N$ sufficiently divisible to clear all exponents being used and to make the original local monodromy unipotent. On the model of Lemma 10, test $u^(- N b) tau$, with $tau$ now pulled back as a relative form. The total form being tested is
  #[#set math.equation(numbering: n => "(4.4)")
   $ \( u^(- N b) tau \) and d u = u / N thin q^(*) \( t^(- 1 - b) Omega \) \, $ <orders:changevariables>]
  where $q$ maps the resolved composite cover to the downstairs model. This identity is simply $d t = N u^(N - 1) d u$, and includes the base ramification Jacobian.
  Set
  $ alpha_E = l_E + 1 - a_E \( 1 + b \) . $
  Suppose first that every $alpha_E$ is nonnegative. Along horizontal primes the divided order is at least $- 1$, because the good-fiber coefficients lie in $\[ 0 \, 1 \]$. Thus $t^(- 1 - b) Omega$ has logarithmic bound on the entire downstairs SNC chart. More explicitly, in a logarithmic differential basis its coefficient is a unit times a product of nonnegative rational powers of boundary coordinates. On a cover making the form single-valued those factors are bounded. Pullback of the logarithmic basis has at most a simple pole along each prime, by the wedge argument in Lemma 9. Hence its pullback has at most logarithmic poles.
  The factor $u$ in (4.4) removes every vertical logarithmic pole, since $u$ has positive integral order on each central-fiber prime. Along horizontal primes, the tested relative form has the required logarithmic behavior by Lemma 8; the base factor is a unit on the punctured disk. It follows that the tested form belongs to
  $ \( g_N \)_(*) omega_(Z_N \/ Delta_u) \( H_N \) . $
  By (3.2) and Lemma 10, it extends in the original canonical highest line.
  Conversely, suppose $alpha_E < 0$ for one downstairs prime $E$. Choose a prime above it that dominates it, and let $e$ be the ramification index. Shifted orders of a pulled-back total form multiply by $e$. Also $"ord" \( u \) = e a_E \/ N$ there, since $t = u^N$. The shifted order of (4.4) is therefore
  #[#set math.equation(numbering: n => "(4.5)")
   $ e alpha_E + frac(e a_E, N) . $ <orders:failure>]
  This is $e \( alpha_E + a_E \/ N \)$, which is negative for every $N > a_E \/ \( - alpha_E \)$, regardless of the dependence of $e > 0$ on $N$. The tested form then has a vertical pole and fails the extension test. Such a prime survives on a common resolution, so an unfavorable valuation cannot be lost by choosing a different resolved model.
  For completeness, these two tests give an exact order, not just one inequality. First choose an integer $b$ sufficiently negative that all $alpha_E$ are nonnegative, and then choose a fixed unipotent power $N_0$ divisible enough for that first test. That test shows that a power of $u$ times the pulled-back $tau$ is holomorphic. Thus $tau$ is meromorphic in the canonical line. Let $v$ be its ordinary order after that substitution, and put $beta = v \/ N_0$. Under a further power $N = N_0 a$ the order is $a v$, by Lemma 5. For $N b in bb(Z)$, the extension test is therefore equivalent to $b lt.eq beta$.
  The first part proves extension for
  $ b lt.eq b_0 := min_E frac(l_E + 1 - a_E, a_E) \, $
  whereas (4.5) proves failure for every rational $b > b_0$ after a sufficiently large further power. Consequently $beta = b_0$, which proves (4.3). After clearing its denominator, the section corrected at $b = b_0$ has order zero and hence generates the extended line. ◻
]

=== 4.3 The actual moduli extension <orders:actualextension>

#thm([Theorem 4.4.])[
  (The threshold trace is the volume extension).  #emph[In the setup of (4.1), choose locally a frame $s$ of $cal(O)_S \( m Q_S \)$, and let $tau$ be its tautological root as in Section 3.1. For every prime $P subset S$, 
#[#set math.equation(numbering: n => "(4.6)")
 $ "ord"_P^(upright("Hdg")) \( tau \) = t_P - 1 . $ <orders:traceorder>]

]
  #emph[More precisely, let $pi : tilde(V) arrow.r V$ be a coordinate power chart making the local pure variation unipotent, and let $overline(cal(E))_chi$ be its extended highest eigenline. For a sufficiently divisible positive integer $a$, the open identification $s^(⊗ a) arrow.l.r tau^(⊗ a m)$ extends to an isomorphism of actual bundles 
#[#set math.equation(numbering: n => "(4.7)")
 $ pi^(*) cal(O)_S \( a m M_S \) \|_(tilde(V)) tilde.eq overline(cal(E))_chi^(⊗ a m) . $ <orders:tracebundle>]

 One integer $a$ suffices on the compact base. The resulting extension rule commutes with pullback to disks generically meeting $U$, after further power substitution on the disk. All assertions allow arbitrary rational coefficients on the vertical components of $D_W$.]
] <orders:trace>

#proof[
  For the chosen frame $s$, the divided order on every crepant source resolution is $l_E = - delta_E$. Lemmas 9 and 11 give
  $ "ord"_P^(upright("Hdg")) \( tau \) = min_(E mapsto P) frac(1 - delta_E, a_E) - 1 = t_P - 1 . $
  Over a prime meeting $U$, the family is smooth and relatively SNC, so its threshold is one and the same equality is immediate. The discriminant is therefore supported on the finite SNC bad divisor and has rational coefficients.
  We spell out the extension at intersections of its components. Choose coordinates $t_1 \, dots.h \, t_b$ on $V$ with bad divisor $t_1 dots.h.c t_r = 0$, and write
  $ B_S \|_V = sum_(i = 1)^r b_i \( t_i = 0 \) . $
  Coefficients $b_i$ may be negative or zero. Take the coordinate power chart $t_i = w_i^(N_i)$ with $N_i$ divisible enough to make monodromy unipotent and $N_i b_i$ integral. On its good open consider
  #[#set math.equation(numbering: n => "(4.8)")
   $ gamma = (product_(i = 1)^r w_i^(N_i b_i)) pi^(*) tau . $ <orders:correctedroot>]
  The just-proved disk calculation says that this section has order zero in $overline(cal(E))_chi$ at a general point of every coordinate divisor. In fact, on general parallel transverse disks it extends as a nonvanishing section.
  This statement suffices without an a priori multivariable meromorphicity assertion. In a local frame of $overline(cal(E))_chi$, let $g$ be the coefficient of $gamma$ on the good open. Near a general point of one boundary component, expand $g$ as a Laurent series in its normal coordinate. The coefficients are holomorphic in the tangential parameters. Every negative coefficient vanishes for the dense set of centers where the disk test applies, hence vanishes identically. The same argument applies to $g^(- 1)$, since the corrected disk section generates. Thus $gamma$ and its inverse extend across the divisors away from their intersections. Hartogs extension then extends both across the remaining codimension-two set. Their product is still one, so $gamma$ is a frame everywhere.
  Choose $a$ so that $a m M_S$ is an actual integral power and all $a m b_i$ are integers. A frame of that power on $V$ is
  $ s^(⊗ a) product_(i = 1)^r t_i^(a m b_i) . $
  Its pullback corresponds exactly to $gamma^(⊗ a m)$. This proves (4.7). Notice the sign: as a meromorphic section of $m M_S = m Q_S - m B_S$, the original frame $s$ has divided order $- b_i = t_(P_i) - 1$.
  Changing $s$ by a unit $v$ multiplies the local root by a chosen $m$-th root of $v$ and gives a locally isomorphic root family. Choose these roots on a refinement of each overlap by small coordinate neighborhoods. They are holomorphic units, and two choices differ by a locally constant element of $mu_m$. On the $a m$-th tensor power the change is exactly $v^a$, independent of that choice; the possible root-of-unity factors on triple overlaps also become one. Thus no root on an entire overlap is required. The identifications match the specified volume identification and its actual bundle cocycle. Compactness permits finitely many charts, so one can choose a common positive $a$.
  Finally, a disk map generically meeting $U$ lifts to each needed power chart after a further power on the disk: its boundary coordinates are powers of the parameter times units, and the units have roots on a small disk. On that lifted disk, (4.7) and Lemma 5 give the canonical pullback rule. Nothing in the proof imposed a restriction on vertical coefficients; only the horizontal good-fiber bounds were used. ◻
]

#thm([Corollary 4.5.])[
  (Descent on every higher model).  #emph[For the original fibration and the smooth compact Kähler model $S$ fixed above, every smooth compact Kähler modification $nu : S_1 arrow.r S$ satisfies 
$ M_(S_1) = nu^(*) M_S quad upright("in ") "Pic" \( S_1 \) ⊗ bb(Q) . $

 No assumption that $nu$ be an isomorphism over $U$ is needed.]
] <orders:bdescent>

#proof[
  Resolve the main-component family over $S_1$, using its crepant divisor $D_1$, and put
  $ L_(S_1) = nu^(*) L_S \, #h(2em) Q_(S_1) = L_(S_1) - K_(S_1) . $
  The original bundle identification gives
  $ K_(W_1 \/ S_1) + D_1 tilde.op_(bb(Q)) p_1^(*) Q_(S_1) $
  with its specified degree-$m$ identification. Fix a prime $P subset S_1$. Choose a local frame $s$ of $m Q_S$ near a general point of its image. On the common isomorphism open it is a section of the same relative volume line. Regard it as a meromorphic section of $m Q_(S_1)$, and write $c_P$ for its divided order there. This interpretation uses
  #[#set math.equation(numbering: n => "(4.9)")
   $ Q_(S_1) = nu^(*) Q_S - K_(S_1 \/ S) . $ <orders:basejacobian>]
  In particular, a pulled-back local frame has order $c_P = - "ord"_P K_(S_1 \/ S)$; the base Jacobian is divided out.
  At a general point of $P$, take a transverse disk whose punctured part lies in the common good isomorphism open. After resolving the source jointly with the disk divisor, the divided order of the relative volume along a component $E$ dominating $P$ is
  #[#set math.equation(numbering: n => "(4.10)")
   $ l_E = - delta_E + a_E c_P \, $ <orders:higherorders>]
  where $delta_E$ is the crepant coefficient and $a_E = "ord"_E \( p_1^(*) P \)$. This is the divisor identity obtained from the specified relative adjoint isomorphism. Adjunction of the other base coordinates introduces no further order.
  Use the pulled-back original local root family, and then the common resolved disk models of Lemma 10. Their punctured fibers differ from that family only by the modifications covered by Lemma 8. Thus Lemma 11 computes the order of the original pulled-back Hodge line and gives
  $ min_(E mapsto P) frac(l_E + 1 - a_E, a_E) = c_P + t_(P \, S_1) - 1 . $
  The right side is precisely the divided order of $s$ in $M_(S_1) = Q_(S_1) - B_(S_1)$. By Theorem 12 and its disk pullback rule, the same Hodge order is the divided order in $nu^(*) M_S$. The specified open identification therefore has neither a zero nor a pole at $P$.
  This argument applies to every prime, including exceptional primes with image of codimension at least two in the bad divisor, and primes whose centers lie inside $U$. For the latter case one can also check the orders directly: before further source resolution, smooth base change replaces the boundary by its pullback minus $p_1^(*) K_(S_1 \/ S)$. If $j_P = "ord"_P K_(S_1 \/ S)$, the threshold is $1 + j_P$; together with $c_P = - j_P$ this gives order zero.
  To conclude globally in the holomorphic Picard group, the difference of the two rational lines has the canonical divisorial description
  $ M_(S_1) - nu^(*) M_S = - K_(S_1 \/ S) - B_(S_1) + nu^(*) B_S . $
  The Jacobian supplies the relative canonical divisor even though the individual canonical bundles need not have global meromorphic sections. The order comparison shows that this rational divisor is zero. Equivalently, after clearing denominators the fixed open isomorphism extends across every divisor and then across codimension two. This proves the asserted equality of actual rational line bundles. ◻
]

=== 4.4 The residue integral as an extension norm <orders:residuenormsection>

We finish with the form of the extension rule needed for the auxiliary product families. Let $r : P arrow.r S$ be a holomorphic map from a smooth compact complex manifold. On a dense open $P^compose$ mapping into $U$, suppose a connected fiber component $A_x^(*)$ of the deepest stratum has been selected in family. Write $s_A$ for the adjunction plurivolume induced by $s in r^(*) cal(G)_m$, and define

#[#set math.equation(numbering: n => "(4.11)")
 $ parallel s parallel_(upright("res")) = (integral_(A_x^(*)) \| s_A \|^(2 \/ m))^(m \/ 2) . $ <orders:residuenormformula>]

For $k = 0$ use the whole connected original fiber, and for a zero-dimensional selected fiber interpret the integral as evaluation at its point.

#thm([Corollary 4.6.])[
  #emph[The expression (4.11) is a positive finite norm, homogeneous of degree one, on the volume line. Let $a$ clear the indicated powers. Along any disk in $P$ whose punctured part lies in $P^compose$, after a sufficiently divisible power substitution, a nonvanishing local frame of 
$ r^(*) cal(O)_S \( a m M_S \) $

 and its dual have at most powers-of-log growth in the $a$-th tensor power of this norm and its dual norm. No Kähler assumption on $P$ is required.]
] <orders:residuenorm>

#proof[
  The selected fiber has effective SNC coefficients less than one. In local coordinates its measure has factors $\| z_i \|^(- 2 delta_i)$, which are integrable for $delta_i < 1$. The integral is therefore finite and positive for a nonzero volume. Multiplication by a scalar $c$ multiplies it before the outer exponent by $\| c \|^(2 \/ m)$, so the norm has degree one.
  Pull the local root family to the punctured disk and retain all sheets above the selected connected component. Its resolved residue cover has a fixed finite degree $e$. Proposition 7 gives the specified top-line identification and
  $ integral_(tilde(A)_x^(*)) \| "Res" tau \|^2 = e integral_(A_x^(*)) \| s_A \|^(2 \/ m) \, $
  up to fixed normalization constants. Exceptional subsets do not affect either integral. On a compact Kähler $\( d - k \)$-fold a holomorphic top form is primitive, and its Hodge norm is this volume integral, again up to a fixed constant. Hence (4.11) is the $m$-th power of the residue Hodge norm, multiplied by $e^(- m \/ 2)$.
  Theorem 12 identifies a pulled-back frame of the asserted power of $M_S$ with a canonical highest-line frame after power substitution. The pure residue map preserves such frames by Proposition 7. The two-sided bounds in Lemma 5, applied to the compact residue cohomology and then raised to the required power, give the conclusion. These are pullbacks of polarized variations and comparisons of their specified lines; the smooth compact parameter space itself need not be Kähler. ◻
]

== 5 A compact base carrying a product decomposition <sec:spreading>

The single-fiber decomposition theorem does not, by itself, give a decomposition of a family. We obtain one after a proper surjective base change by parameterizing finite covers, factor submanifolds, and graphs. The auxiliary base may have larger dimension than $S$. Its compactness, together with a fixed compact Kähler ambient for the factors, will be the essential feature.

=== 5.1 A marked family of klt strata <a-marked-family-of-klt-strata>

We retain the good open $U$, the log-smooth family, and the integer $m$ of the preceding sections. In particular, the line $cal(G)_m$ consists of relative log plurivolumes. The integer $k$ is the largest number of horizontal coefficient-one components that meet over $U$; when there are none, $k = 0$. All opens in this section are analytic Zariski opens.

#thm([Lemma 5.1.])[
  #emph[There are a smooth compact Kähler manifold $Sigma$, a proper surjection $rho : Sigma arrow.r S$, and a dense open $Sigma^compose subset.eq rho^(- 1) \( U \)$ with the following data:]
  + #emph[a proper smooth family $a : cal(A)^compose arrow.r Sigma^compose$ with connected fibers and a holomorphic section;]
  + #emph[an effective relative SNC rational boundary $D_(cal(A))$ with coefficients in $\[ 0 \, 1 \)$;]
  + #emph[an identification 
$ a_(*) cal(O)_(cal(A)^compose) #scale(x: 120%, y: 120%)[\(] m \( K_(cal(A)^compose \/ Sigma^compose) + D_(cal(A)) \) #scale(x: 120%, y: 120%)[\)] tilde.eq rho^(*) cal(G)_m . $

 The relative log-pluri bundle itself is the pullback of this line. Moreover, $cal(A)^compose$ and its boundary have extensions in a smooth compact Kähler manifold mapping to $Sigma$.]
  #emph[Each fiber pair is a connected component of a deepest coefficient-one stratum of the original good family, with its adjunction boundary.]
] <spread:marked>

#proof[
  Suppose first that $k > 0$. Choose an irreducible component $A$ of an intersection of $k$ coefficient-one components whose image contains $U$, after decreasing $U$ if necessary. The original SNC hypothesis makes $A$ a smooth compact Kähler manifold. Maximality of $k$ says that no further coefficient-one component meets $A$ over $U$. Adjunction there gives
  $ \( K_Y + Delta \) \|_A = K_A + D_A \, $
  where $D_A$ is effective and has SNC support and coefficients less than one. Indeed, the remaining boundary equations are transverse coordinate equations on $A$. Two distinct such equations cannot define the same divisor on $A$, by the SNC codimension condition. The preparation of $U$ makes $A_U arrow.r U$, and all its boundary strata, smooth. For $k = 0$, set $A = Y$ and use the original boundary over $U$.
  Let $A arrow.r B arrow.r X$ be the Stein factorization. Over $U$, the finite map $B arrow.r X$ is étale, and $A arrow.r B$ has connected smooth fibers. Resolve the graph of the map $A arrow.r.dashed S$, taking the resolution to be unchanged over $A_U$; call the resulting manifold $Sigma$. It is compact Kähler and maps holomorphically both to $A$ and to $S$. The first map also gives $Sigma arrow.r B$. Consider
  $ A times_B Sigma arrow.r Sigma . $
  Over $Sigma^compose = A_U$ this is the desired family: its fiber is the connected component selected by the point of $B$, and the map
  $ sigma mapsto #scale(x: 120%, y: 120%)[\(] sigma \, sigma #scale(x: 120%, y: 120%)[\)] $
  under the identification with $A_U$ gives its diagonal section. Resolve its main component, without changing this open family. The fiber product is a closed analytic subspace of $A times Sigma$, so a projective resolution is compact Kähler. Pullbacks and strict transforms of the original boundary give analytic extensions of all boundary data.
  Ordered pluriresidue gives the indicated pullback of $cal(G)_m$. On every fiber it is a nowhere-vanishing section of the $m$-th log canonical bundle, interpreted with its boundary twist. That bundle is therefore trivial on each connected fiber, and its space of sections has dimension one. Grauert’s base-change theorem identifies its direct image with a line bundle. The evaluation map is an isomorphism because its restriction to each fiber is an isomorphism. This proves the assertion about the actual relative bundle as well. ◻
]

For a section $s$ of $rho^(*) cal(G)_m$, denote its adjunction plurivolume on the selected fiber by $s_A$. We use the norm

#[#set math.equation(numbering: n => "(5.1)")
 $ parallel s parallel_(upright("res")) = (integral_(A_sigma) \| s_A \|^(2 \/ m))^(m \/ 2) . $ <spread:residue-norm>]

The measure in this formula is the measure of a meromorphic pluricanonical form with the specified boundary poles. Since the boundary is SNC and every coefficient is less than one, the integral is finite, and it is positive for $s eq.not 0$. The same definition will be used after any further base change.

#thm([Lemma 5.2.])[
  #emph[Let $P$ be a smooth compact complex manifold and $r : P arrow.r S$ a holomorphic map factoring through the marked-family construction on a dense open $P^compose$. Equip $r^(*) cal(G)_m$ there with (5.1). Along a disk in $P$ mapping generically to $P^compose$, generators of any sufficiently divisible positive power of $r^(*) \( m M_S \)$, and the dual generators, have at most powers-of-logarithm growth in the corresponding norms, after a sufficiently divisible power substitution.]
] <spread:residue-growth>

#proof[
  This is Corollary 14; we recall the norm identification. By Theorem 12, the corrected generator is a power of a generator of the canonical extension of the pure Hodge line. Proposition 7 maps this line isomorphically to the top residue eigenline over the chosen connected stratum component, including all sheets over that component. This identification preserves canonical generators after unipotentization.
  The residue is a holomorphic top form on the resolved cyclic root cover of the klt stratum. Its Hodge norm is its volume integral. Its $m$-th power is the pullback of $s_A$, so change of variables identifies its squared norm with $integral_(A_sigma) \| s_A \|^(2 \/ m)$, multiplied by the fixed degree of the root cover and a fixed normalization constant. Resolution exceptional sets have measure zero. The canonical highest-line norm estimates therefore give the assertion and its dual. They apply to the pulled-back pure line on the stated disk; no extension of a geometric product over the center of that disk is required. ◻
]

=== 5.2 Splitting a fiber and realizing its finite covers <splitting-a-fiber-and-realizing-its-finite-covers>

We first specify the single-fiber consequence that will be spread.

#thm([Lemma 5.3.])[
  #emph[Let $\( F \, D \)$ be a smooth connected compact Kähler pair, with effective SNC rational boundary of coefficients less than one, and suppose that $m \( K_F + D \)$ is trivial. There is a finite étale cover $nu : J arrow.r F$ and an isomorphism of pairs 
#[#set math.equation(numbering: n => "(5.2)")
 $ \( J \, nu^(*) D \) tilde.eq \( Q \, C \) times T_1 times dots.h.c times T_j \, $ <spread:fiber-product>]

 where $\( Q \, C \)$ is a smooth projective klt SNC pair, and each $T_i$ is a positive-dimensional complex torus or an irreducible holomorphic symplectic manifold. The boundary is entirely on $Q$. A point is allowed for $Q$, and $j = 0$ is allowed. Moreover, $m \( K_Q + C \)$ and all $m K_(T_i)$ are trivial.]
] <spread:fiber-splitting>

#proof[
  Linear triviality implies numerical triviality, so the decomposition theorem of Matsumura–Wang–Wu–Zhang applies to this smooth effective klt pair #cite(label("MWWWZ25")) version 1, Corollary 1.3. It gives a product of a rationally connected pair and boundary-free torus, Calabi–Yau, and holomorphic symplectic factors after a finite étale cover. The covered manifold and all its product factors are smooth. Apply the ordinary Beauville–Bogomolov decomposition to any boundary-free factors still requiring decomposition, and compose the further finite étale covers #cite(label("Beauville83")) Theorem 1.
  For completeness, a rationally connected compact Kähler manifold $R$ is projective. To see the relevant vanishing directly, graphs in the Douady space of $bb(P)^1 times R$ parameterize its holomorphic rational curves. There are countably many finite-dimensional parameter families #cite(label("Fujiki79")). Matching marked endpoints parameterizes chains, again in countably many analytic families. Stratify their parameter spaces into smooth pieces. General pairs of points of $R$ occur as endpoints, so Sard’s theorem implies that one two-endpoint evaluation
  $ e = \( e_0 \, e_oo \) : T arrow.r R times R $
  is submersive at some point. Otherwise all these countably many images would have measure zero. Mark the ends of each chain segment by $0 \, oo$, using reparameterization of $bb(P)^1$. For $alpha in H^0 \( R \, Omega_R^2 \)$, its pullback by each segment $bb(P)^1 times T arrow.r R$ comes from $T$, because $bb(P)^1$ has no holomorphic forms of positive degree. Comparing successive endpoints gives
  $ e^(*) \( "pr"_1^(*) alpha - "pr"_2^(*) alpha \) = 0 . $
  Submersivity forces $alpha = 0$ on an open set, hence everywhere. Thus $H^(2 \, 0) \( R \) = 0$. Hodge decomposition now makes every real degree-two class of type $\( 1 \, 1 \)$. Openness of the Kähler cone gives a rational Kähler class, and an integral multiple is the first Chern class of a positive line bundle. Kodaira’s embedding theorem makes $R$ projective #cite(label("Kodaira54")).
  The same criterion makes every remaining strict Calabi–Yau factor with $H^(2 \, 0) = 0$ projective. Dimension-two symplectic factors are kept among the $T_i$. Combine all projective factors into $Q$. The boundary on $Q$ remains effective klt SNC under this product description. Finally, restrict the trivial log-pluri bundle of $J$ to factor slices. The canonical lines of the complementary factors contribute only constant one-dimensional vector spaces, so these restrictions give $m \( K_Q + C \) tilde.op 0$ and $m K_(T_i) tilde.op 0$. ◻
]

#thm([Lemma 5.4.])[
  #emph[Let $g : E^compose arrow.r B^compose$ be a proper smooth holomorphic map of connected complex manifolds, with connected compact fibers and a section. Suppose $B^compose$ is a dense open in a smooth compact Kähler manifold $B$, and the family has a smooth compact Kähler extension $E arrow.r B$. Then all finite connected étale covers of individual fibers occur in countably many families, each obtained after a finite étale base cover of $B^compose$. Each resulting base and total space admit smooth compact Kähler extensions preserving the open families. The same holds with pulled-back relative SNC boundary data.]
] <spread:finite-covers>

#proof[
  Fix a base point and write $Pi = pi_1 \( E_b \)$ and $Gamma = pi_1 \( B^compose \)$, with fiber base points supplied by the section. Ehresmann’s theorem makes $g$ a differentiable fiber bundle. Its homotopy sequence contains
  $ pi_2 \( E^compose \) arrow.r pi_2 \( B^compose \) arrow.r Pi arrow.r pi_1 \( E^compose \) arrow.r Gamma arrow.r 1 . $
  The section makes the first arrow surjective, so the connecting homomorphism into $Pi$ is zero. It also splits the last homomorphism. Thus there is a genuine semidirect product
  #[#set math.equation(numbering: n => "(5.3)")
   $ pi_1 \( E^compose \) tilde.eq Pi times.r Gamma . $ <spread:semidirect>]
  The group $Pi$ is finitely generated, since the fiber is a compact manifold. For each integer $e > 0$, it has only finitely many subgroups of index $e$: their coset actions are represented among the homomorphisms from a fixed finite generating set to the finite group of permutations of $e$ elements. If $H subset.eq Pi$ is one such subgroup, its stabilizer $Gamma_H$ under the action in (5.3) has finite index in $Gamma$. Pass to the corresponding finite base cover. The subgroup
  $ H times.r Gamma_H subset.eq Pi times.r Gamma_H $
  then defines a finite connected cover of the pulled-back total space. Its restriction to a fiber is the connected cover corresponding to $H$. Topological covering charts lift the complex structure, so this is a holomorphic étale cover. Transport to other fibers, and then all indices $e$, realizes every required fiber cover among countably many such constructions.
  Extend the finite base cover first across $B \\ B^compose$ by the analytic finite-cover extension theorem, and resolve the normal extension. Pull back $E$, resolve its main component, and extend the finite total-space cover over that resolved compact space in the same way. Projective resolutions give smooth compact Kähler manifolds, unchanged on the open under consideration #cite(label("Villadsen24")) Lemma 2.21.
  One can also describe the extension locally after making the complement SNC. A punctured coordinate chart has commuting meridians. Sufficiently divisible powers of its boundary coordinates kill their finite permutation action. The cover becomes a disjoint union of trivial covers on the punctured power chart; the finite normal extensions descend and glue by uniqueness. Thus this step uses finite-cover extension, for which essential singularities do not arise. Finite maps over Kähler targets and projective resolutions preserve the Kähler property; equivalently one may use the compactification in the cited Lemma. Boundary pullbacks and their strict transforms give the required analytic closures. ◻
]

=== 5.3 Compact parameter spaces <compact-parameter-spaces>

We call a subset of a compact complex space #emph[constructible] if it is a finite union of differences of closed analytic subsets. Compactness is important in the following elementary form of analytic constructibility.

#thm([Lemma 5.5.])[
  #emph[Let $q : Z arrow.r T$ be a proper holomorphic map of compact complex spaces. The image of a constructible subset of $Z$ is constructible in $T$. Consequently, any finite combination of incidence, emptiness, surjectivity, and injectivity conditions on fibers of compact analytic diagrams is constructible.]
] <spread:constructible>

#proof[
  It suffices to consider $A \\ C$, where $C subset.eq A$ are closed analytic subsets of $Z$. There are finitely many irreducible components of $A$, so we may assume that $A$ is irreducible and $C subset.neq A$. Set $T' = q \( A \)$, a compact irreducible analytic subspace by the proper mapping theorem. On a dense open of $T'$, the fibers of $A arrow.r T'$ have dimension $dim A - dim T'$. Each component of $C$ either has proper image in $T'$, or has smaller generic fiber dimension. The proper fiber-dimension theorem therefore gives a dense open $T'_0 subset.eq T'$ on which no fiber of $A arrow.r T'$ is contained in $C$. Hence
  $ T'_0 subset.eq q \( A \\ C \) . $
  The part of the image over $T' \\ T'_0$ is the image of
  $ #scale(x: 120%, y: 120%)[\(] A ∩ q^(- 1) \( T' \\ T'_0 \) #scale(x: 120%, y: 120%)[\)] \\ C $
  under a proper map whose image has smaller dimension. Induction proves that this remainder is constructible. The case of a zero-dimensional image is immediate. This proves the first assertion.
  For example, failure of containment of two fiber subspaces is the image of their difference. Failure of surjectivity is detected by points of the target outside the image, itself analytic under a proper map. Failure of injectivity is detected on the fiber product of the source with itself, after removing its diagonal. Every ambient projection here is proper; the first assertion applies to the indicated differences. Finite Boolean combinations remain constructible. ◻
]

We also use smoothness and rank conditions in these diagrams. A universal Douady or Hilbert family is proper and flat. Its nonsmooth locus is analytic, and its proper image gives the complement of the smooth-fiber locus. On this locus, fiber dimensions are locally constant. Ranks of maps of relative tangent bundles can be tested using relative differentials and their Fitting ideals. Thus they too give constructible conditions, also after restricting to a constructible incidence locus. A smooth compact fiber is connected exactly when $h^0 \( cal(O) \) = 1$, which is an analytic semicontinuity condition in a proper flat family. For marked divisors, smoothness and the ranks of their defining differentials test the relative SNC condition, including the expected codimensions of all intersections.

#thm([Proposition 5.6.])[
  #emph[After a proper surjection $r : P arrow.r S$, with $P$ a smooth compact connected manifold, there is a dense open $P^compose subset.eq r^(- 1) \( U \)$ on which the marked klt family has a finite étale cover and a product decomposition 
#[#set math.equation(numbering: n => "(5.4)")
 $ \( cal(J) \, D_(cal(J)) \) tilde.eq \( cal(Q) \, C \) times_(P^compose) cal(T)_1 times_(P^compose) dots.h.c times_(P^compose) cal(T)_j . $ <spread:family-product>]

 Here all families are proper and smooth with connected fibers. They have the following properties.]
  + #emph[The pair $\( cal(Q) \, C \)$ is a projective family of effective klt SNC pairs. It is embedded in $P^compose times bb(P)^N$ and is the pullback of universal marked families by the restriction of a holomorphic map from $P$ to a fixed product of projective Hilbert schemes.]
  + #emph[Each $cal(T)_i$ is a family of submanifolds of a fixed compact Kähler manifold $V$, of positive dimension $n_i$. Its cohomological local systems have their integral lattices modulo torsion and flat real polarizations. Its top Hodge line has rank one and is given by 
$ lambda_i = \( pi_i \)_(*) omega_(cal(T)_i \/ P^compose) = F^(n_i) R^(n_i) \( pi_i \)_(*) bb(C) $

 Each index is of one of the following two types: 
$ upright("torus type:") & h^(1 \, 0) \( T_i \) = n_i \, quad and.big^(n_i) F^1 R^1 \( pi_i \)_(*) bb(C) arrow.r^(med tilde.op med) lambda_i \;\
upright("symplectic type:") & n_i med upright("even") \, quad h^(2 \, 0) \( T_i \) = 1 \, quad #scale(x: 120%, y: 120%)[\(] F^2 R^2 \( pi_i \)_(*) bb(C) #scale(x: 120%, y: 120%)[\)]^(⊗ n_i \/ 2) arrow.r^(med tilde.op med) lambda_i . $

 The displayed maps are cup products on the underlying variations.]
  + #emph[On every fiber, $m \( K_Q + C \)$ and $m K_(T_i)$ are trivial. With 
$ cal(G)_(m \, Q) = \( pi_Q \)_(*) cal(O)_(cal(Q)) #scale(x: 120%, y: 120%)[\(] m \( K_(cal(Q) \/ P^compose) + C \) #scale(x: 120%, y: 120%)[\)] \, $

 there is an identification of actual holomorphic line bundles 
#[#set math.equation(numbering: n => "(5.5)")
 $ r^(*) cal(G)_m tilde.eq cal(G)_(m \, Q) ⊗ ⨂_i lambda_i^(⊗ m) . $ <spread:volume-line>]

]
  + #emph[If the finite cover in (5.4) has degree $e$, the norm in (5.1) satisfies 
#[#set math.equation(numbering: n => "(5.6)")
 $ parallel s parallel_(upright("res")) = c thin parallel s_Q parallel_(Q \, upright("res")) thin product_i parallel omega_i parallel_(upright("Hdg"))^m quad upright("when") quad s arrow.l.r s_Q ⊗ ⨂_i omega_i^(⊗ m) . $ <spread:norm-product>]

 Here $c > 0$ is constant; with compatible volume conventions, $c = e^(- m \/ 2)$. The norm on the left gives generators and their duals of sufficiently divisible powers of $r^(*) \( m M_S \)$ the two-sided logarithmic bounds of Lemma 16.]
  #emph[These assertions are preserved on the good open under further smooth compact auxiliary base changes. Neither generic finiteness of $r$ nor a global Kähler form on $P$ is required.]
] <spread:product>

#proof[
  Apply Lemma 18 to the marked family from Lemma 15. We obtain countably many compact Kähler total spaces $V_alpha arrow.r B_alpha$, whose good fibers supply all finite étale fiber covers that may occur in Lemma 17. Each $B_alpha$ maps properly to $S$. Fix one such family temporarily, and write $V arrow.r B$. The boundary on its good open is the restriction of a fixed rational divisor on $V$; only its restriction to good fibers will be tested.
  #emph[The parameters and their geometric conditions.] For an individual splitting, embed $Q$ into some $bb(P)^N$. Choose points in complementary factors and realize each $T_i$ as a factor slice of $J subset V$. The product isomorphism is represented by its graph in
  $ V times bb(P)^N times V^j . $
  We parameterize the fiber $J$ by $B$, the embedded $Q$ and its marked boundary components by Hilbert schemes of $bb(P)^N$, the slices by Douady spaces of $V$, and the graph by the Douady space of the displayed ambient.
  For each choice of $N \, j$, dimensions, boundary coefficients, Hilbert polynomials, and Douady components, take the product
  $ K = B times cal(H) times product_(i = 1)^j cal(D)_i times cal(D)_Gamma \, $
  where $cal(H)$ is the corresponding product of Hilbert schemes. This is a compact complex space. Indeed, connected components of the Douady space of a compact Kähler manifold are compact #cite(label("Toma11")) Corollary 5.3, and all ambients here are compact Kähler. Fujiki’s countability theorem #cite(label("Fujiki79")) gives countably many components. There are also only countably many choices of the discrete data and of $alpha$. Thus all the individual splittings have been included in countably many compact parameter spaces.
  In each $K$, impose the following conditions on the universal data:
  + the base parameter is good; the projective factor, the slices, and the graph are nonempty smooth fibers of the prescribed dimensions; the factors are connected;
  + every marked boundary component is a smooth divisor on the projective factor, distinct marks have distinct supports, and all their intersections have the prescribed SNC codimensions;
  + the slices lie in $V_b$, and the graph lies in the product of $J = V_b$ with the indicated projective factor and slices;
  + the projections of the graph to $J$ and to the factor product are bijective, with invertible vertical differentials;
  + the graph identifies the weighted boundary on $J$ with the boundary pulled back from the marked projective factor.
  These conditions define a constructible subset of $K$. For (a)–(b), use proper flat smoothness, connectivity, and the relative rank tests described above. Condition (c) is incidence. For (d), all ambient coordinate projections are holomorphic on the compact universal graph. Bijectivity is tested by Lemma 19, and the vertical rank conditions are imposed by relative differentials. For (e), group marks of equal coefficient and test equality of the corresponding reduced supports on the graph. The boundary extensions on $V$ are analytic, so these are again incidence conditions on compact diagrams. On the SNC locus, equality by coefficient groups is exactly equality of the rational divisors.
  Decompose this constructible locus into finitely many irreducible locally closed analytic pieces and then stratify their singular loci. This yields countably many smooth connected locally closed analytic strata, each with compact analytic closure. Over every such stratum, the graphs give isomorphisms of smooth families: fiberwise they are bijective and have invertible vertical differential, so the relative inverse function theorem and properness give holomorphic inverses.
  #emph[The cohomological types and domination.] Retain the strata containing at least one splitting with a specified list of torus and symplectic types. This is still a countable collection; no constructibility of a Hodge locus is being assumed. We check that the cohomological conditions in (ii) then hold throughout the chosen stratum.
  For a smooth factor family over such a stratum $T$, pull back a Kähler form $omega_V$ from $V$. It is relatively Kähler, and its fiberwise class is flat for the Gauss–Manin connection, because it is represented by a closed form on the total family. The smooth proper Kähler Hodge theorem therefore supplies the usual pure variations and locally constant Hodge numbers; one may apply #cite(label("FF25")) Theorem 1.1(i) with empty removed boundary on small smooth base charts, and use purity of compact Kähler cohomology. Fiberwise Lefschetz decomposition for this flat class is a decomposition of real variations. Poincaré duality on the primitive summands, with the Hodge–Riemann signs, gives flat real polarizations on the full cohomology. This construction requires no rational Kähler class. Locally over $T$, adding a Kähler form from a coordinate neighborhood to the ambient form makes the total space Kähler as well.
  The cup products
  $ and.big^(n_i) R^1 \( pi_i \)_(*) bb(C) arrow.r R^(n_i) \( pi_i \)_(*) bb(C) \, #h(2em) #scale(x: 120%, y: 120%)[\(] R^2 \( pi_i \)_(*) bb(C) #scale(x: 120%, y: 120%)[\)]^(⊗ n_i \/ 2) arrow.r R^(n_i) \( pi_i \)_(*) bb(C) $
  are flat morphisms of pure variations of equal weight in each case. Their kernels and images are subvariations; equivalently, polarizations give flat Hodge complements and strictness gives the induced Hodge filtrations. The ranks on the highest Hodge pieces are consequently locally constant. At a torus fiber, exterior multiplication of holomorphic one-forms gives its nonzero top form. At an irreducible holomorphic symplectic fiber, the top power of the symplectic form gives its nonzero top form. Thus the Hodge numbers and cup-product isomorphisms in (ii) hold throughout $T$. Only these cohomological consequences of the two types are needed.
  Every point of the original good base has splitting data on at least one of the retained strata: first select the connected stratum fiber, then its finite cover, then its product and embeddings. The compact closures of these strata have proper analytic images in $S$. If all their images were proper analytic subsets, their countable union could not contain the nonempty open $U$, by Baire category. One closure therefore dominates $S$. Resolve that irreducible closure, choosing a projective resolution unchanged on its smooth open stratum. The result is a smooth compact connected $P$, with a proper surjection $r : P arrow.r S$. Let $P^compose$ be the inverse image of the chosen stratum. The product of families on it is (5.4). Projection to $cal(H)$ gives the holomorphic Hilbert-scheme map on all of $P$ required by (i). The ambient $V$ is fixed by the compact parameter space containing this closure. This proves (i)–(ii).
  #emph[Volumes and their norms.] The finite cover of the selected klt fiber preserves the trivial $m$-th log canonical bundle. Restriction of (5.4) to factor slices proves the fiberwise trivialities in (iii), even for parameter points where only the cohomological types have been retained.
  Grauert’s base-change theorem gives the direct image line $cal(G)_(m \, Q)$. For each $T_i$, the Hodge-number calculation gives $"rk" lambda_i = 1$. A nonzero holomorphic top form on $T_i$ is nowhere vanishing: its $m$-th power is a nonzero section of a trivial line bundle on a connected compact manifold, hence has no zeros. Consequently, relative multiplication induces an isomorphism
  $ lambda_i^(⊗ m) tilde.eq \( pi_i \)_(*) omega_(cal(T)_i \/ P^compose)^(⊗ m) . $
  Finite étale pullback of the selected adjunction volume, followed by the product formula for relative canonical bundles and their boundary twists, now gives (5.5). Every map in this construction identifies actual one-dimensional spaces of sections on the fibers, so these are holomorphic line-bundle isomorphisms, with their specified identification on the open.
  Take a decomposable local section on the right side of (5.5). With compatible volume conventions, change of variables under the étale cover and Fubini’s theorem give
  $ e integral_(A_sigma) \| s_A \|^(2 \/ m) = (integral_(Q_sigma) \| s_Q \|^(2 \/ m)) product_i (integral_(T_(i \, sigma)) \| omega_i \|^2) . $
  The integral on $Q_sigma$ is finite by the klt SNC condition. Raising the equality to the power $m \/ 2$ proves (5.6). The degree $e$ is fixed on the connected open parameter stratum. Other fixed volume conventions only change the constant $c$. Lemma 16 gives the assertion for $r^(*) \( m M_S \)$ and its dual.
  All constructions are compatible with pullback on their smooth opens. The argument has used compactness of $P$ for proper images and later global arguments, and a Kähler form on $V$ for the relative Hodge theory. It has imposed no dimension restriction on $r$ and no global Kähler hypothesis on $P$. Empty products and zero-dimensional projective factors satisfy the same formulas, with integration over a point taken with mass one. ◻
]

== 6 The projective comparison factor <compare:section>

We now extend the projective factor supplied by Proposition 20. The relevant positivity input is algebraic b-semiampleness. We apply it to a projective comparison family, retaining the specified identification of its plurivolumes.

#thm([Proposition 6.1.])[
  #emph[Use the notation of Proposition 20, and write $P^compose subset P$ for its good open set. After a proper modification $pi : P' arrow.r P$, with $P'$ smooth compact, and a further shrinking of $P^compose$, there are a positive integer $a$, a globally generated holomorphic line bundle $cal(H)_Q$ on $P'$, and a specified isomorphism 
#[#set math.equation(numbering: n => "(6.1)")
 $ cal(H)_Q \|_(pi^(- 1) \( P^compose \)) tilde.eq #scale(x: 120%, y: 120%)[\(] pi^(*) cal(G)_(m \, Q) #scale(x: 120%, y: 120%)[\)]^(⊗ a) \|_(pi^(- 1) \( P^compose \)) . $ <compare:open-identification>]

 Transport to the left the $a$-th power of the volume norm 
$ N_(m \, Q) \( s \) = (integral_(Q_x) \| s \|^(2 \/ m))^(m \/ 2) . $

 For any holomorphic disk in $P'$ whose punctured disk lies in the good open, a local generator of the pulled-back $cal(H)_Q$ and its dual have norm bounded by powers of $1 + \| log \| t \| \|$, after a finite power substitution if necessary.]
] <compare:semiample>

#proof[
  Let $H$ be the product of the fixed Hilbert schemes used to record the embedded projective factor and its boundary components. Proposition 20 gives a holomorphic map $eta : P arrow.r H$. Its reduced image $H_0$ is a compact irreducible analytic subspace. Since $H$ is projective, the proper mapping theorem and Chow’s theorem make $H_0$ an irreducible projective variety.
  We first identify an algebraic open of $H_0$ carrying the desired family. Smoothness, connectedness of the fibers, the condition that the marked subschemes are divisors, and their relative simple normal crossing condition are algebraically constructible conditions on the universal marked family. The coefficients of the marks are the fixed rational coefficients of $C$, all in $\[ 0 \, 1 \)$. On its smooth locus the bundle
  $ H_m = omega_(upright("rel"))^(⊗ m) ⊗ cal(O) \( m C \) $
  is defined after the fixed choice of $m$. On a smooth connected projective fiber, it is trivial precisely when
  $ h^0 \( H_m \) gt.eq 1 quad upright("and") quad h^0 \( H_m^(- 1) \) gt.eq 1 . $
  Indeed, the product of nonzero sections is a nonzero holomorphic function and is therefore a nonzero constant. These cohomology conditions are constructible by semicontinuity. All the conditions hold on $eta \( P^compose \)$, which is dense in $H_0$. A constructible subset containing a dense subset of an irreducible variety contains a nonempty algebraic open. We may therefore choose an algebraic open $H_0^compose$ on which the universal marked family is smooth projective, its fibers are connected, and $H_m$ is trivial on every fiber. After shrinking the good open of $P$, its projective factor is the pullback of this family. Cohomology and base change gives a line bundle $cal(V)_m$ on $H_0^compose$. Its evaluation map on the universal family is an isomorphism: on every fiber it evaluates the one-dimensional space of sections of a trivial line bundle.
  Take a smooth projective model $R arrow.r H_0$, and resolve the dominant component of the pulled-back universal family. We obtain a projective morphism
  $ q : Z_Q arrow.r R $
  with $Z_Q$ smooth projective, unchanged over a smaller smooth open $R^compose subset R$. The generic fiber is smooth and geometrically connected. Consequently the finite map in the Stein factorization of $q$ is birational; it is an isomorphism because $R$ is normal. Thus $q$ has connected fibers.
  Choose a rational frame of $cal(V)_m$ over $R$. On $Z_Q$ it defines a rational relative $m$-pluriform $sigma$. Shrink $R^compose$ so that this frame is regular and nonvanishing there. As a meromorphic section of $omega_(Z_Q \/ R)^(⊗ m)$, its divisor has horizontal part $- m C$. Define the rational divisor
  #[#set math.equation(numbering: n => "(6.2)")
   $ D_Q = - 1 / m "div" \( sigma \) . $ <compare:volume-boundary>]
  The form $sigma$ then supplies an actual trivialization
  $ omega_(Z_Q \/ R)^(⊗ m) ⊗ cal(O) \( m D_Q \) tilde.eq cal(O)_(Z_Q) \, $
  and hence an adjoint identity
  #[#set math.equation(numbering: n => "(6.3)")
   $ K_(Z_Q) + D_Q tilde.op_(bb(Q)) q^(*) K_R . $ <compare:adjoint>]
  Over $R^compose$, the divisor $D_Q$ is exactly $C$. Its remaining coefficients are vertical and may have either sign. Resolve their support, taking the boundary crepantly; this preserves (6.3) and does not change the smooth family over $R^compose$.
  We check the algebraic b-semiampleness input explicitly. Theorem 1.5 of #cite(label("BFMT25")), with Definition 6.18, applies to a projective lc-trivial fibration whose boundary is effective over the generic point. The required conditions are generic sub-log-canonicity, the discrepancy rank-one condition, and a rational adjoint pullback identity. Here the generic pair is the smooth effective klt pair $\( Q \, C \)$, and (6.3) is the required identity. For the rank condition, on the generic fiber the rounded discrepancy divisor is $ceil.l - C ceil.r = 0$; connectedness gives $h^0 \( Q \, cal(O)_Q \) = 1$. A resolution of the vertical locus does not affect this generic computation. Thus all these hypotheses hold.
  For completeness, vertical adjustments do not change the moduli object. If a rational divisor $E$ on $R$ is added to the adjoint base bundle and $q^(*) E$ is added to $D_Q$, then
  $ t_P mapsto t_P - "coeff"_P \( E \) \, #h(2em) B_R mapsto B_R + E \, #h(2em) M_R mapsto M_R . $
  The same equalities hold on every higher base model. Thus one may, if desired, arrange upper bounds on the vertical coefficients by subtracting sufficiently large pullbacks. Alternatively one may arrange global effectivity by adding such pullbacks. Each operation is possible because the finitely many vertical components have proper algebraic images contained in divisors on the projective base. Neither operation is needed: the theorem imposes effectivity and log canonicity over the generic point.
  It follows from Theorem 1.5 of #cite(label("BFMT25")) that the moduli b-divisor is b-semiample. Its identification with the moduli object defined by the log canonical thresholds is supplied by Theorem 6.28 of #cite(label("BFMT25")): the Hodge-theoretic and threshold moduli divisors agree up to a fixed rational linear equivalence. Consequently, on a sufficiently high smooth projective model $mu_R : R' arrow.r R$, the actual line bundle
  $ cal(L)_Q = cal(O)_(R') \( a m M_(R') \) $
  is globally generated for some positive integer $a$. Increase $a$ to clear all denominators. Further projective modifications preserve global generation of the pullback, so we may also arrange a simple normal crossing complement to the good open.
  We must retain the particular open identification with plurivolumes. On a smooth source model over $R'$, take the crepant transform $D'_Q$ and the base bundle $L_(R') = mu_R^(*) K_R$. Then
  $ K_(Z'_Q \/ R') + D'_Q tilde.op_(bb(Q)) \( q' \)^(*) \( L_(R') - K_(R') \) . $
  Over the common good open this identity identifies the direct image of the log $m$-pluricanonical bundle with the line of the original volumes. Theorem 12 applies to this projective family: its generic boundary is effective klt, and the theorem permits arbitrary vertical coefficients. It identifies the extension specified by the threshold trace $m M_(R')$ under precisely this open-volume identification. The base Jacobian on $R'$ is included in that theorem’s relative order calculation. In particular, the $k = 0$ case of Corollary 14 gives the two-sided logarithmic norm bounds for local generators and their duals, including after pullback to a disk.
  Finally resolve the graph of the meromorphic lift $P arrow.r.dashed R'$ of $eta$, together with the complement of the good open, obtaining $pi : P' arrow.r P$ and $rho : P' arrow.r R'$, with $P'$ smooth compact and its boundary simple normal crossing. Set
  $ cal(H)_Q = rho^(*) cal(L)_Q . $
  This line bundle is globally generated. The preceding specified identification, pulled back along $rho$, is (6.1), and the same pullback gives the asserted norm bounds. ◻
]

#prodef([Remark 6.2.])[
  The rational form in (6.2) is taken on the projective comparison space $Z_Q$. The construction makes no assumption that the canonical bundle, or an arbitrary holomorphic line bundle, on the original nonprojective manifold has a global meromorphic section. It also specifies an isomorphism of actual bundles over the open set; a numerical identification would not suffice for the final comparison.
]

== 7 Semiample extensions of the torus and symplectic factors <periods:section>

We now treat the nonprojective factors in Proposition 20. Their first or second cohomology has a classical period domain. Two points require care: the available Kähler classes are real, and the compact auxiliary base need not be algebraic. We first address the polarization and extension questions independently of the factor construction.

=== 7.1 Real polarizations and the integral local system <real-polarizations-and-the-integral-local-system>

An integral variation in this section consists of a local system $bb(V)_(bb(Z))$ of finite free abelian groups and a holomorphic Hodge filtration on $E = bb(V)_(bb(Z)) ⊗_(bb(Z)) cal(O)$, satisfying opposedness and Griffiths transversality. A real polarization is a flat nondegenerate real bilinear form on $bb(V)_(bb(R))$ satisfying the Hodge–Riemann relations. We use the sign convention in which, on type $\( p \, q \)$ of weight $w$, the associated positive Hermitian form is

#[#set math.equation(numbering: n => "(7.1)")
 $ \( - 1 \)^(w \( w - 1 \) \/ 2) \( sqrt(- 1) \)^(p - q) B \( v \, overline(v) \) . $ <periods:sign>]

Changing this convention by the usual weight-dependent sign changes none of the arguments.

#thm([Lemma 7.1.])[
  (Changing the polarization).  #emph[Let $\( bb(V)_(bb(Z)) \, F^bullet \)$ be an integral pure variation with a flat real polarization $B$. There is a flat real automorphism $C$ of $bb(V)_(bb(R))$ such that $\( bb(V)_(bb(Z)) \, C^(- 1) F^bullet \)$ is polarized by a rational form $B'$, and 
$ B' \( x \, y \) = B \( C x \, C y \) . $

 Consequently the new and original variations are isomorphic as real polarized variations, and their holomorphic Hodge bundles are isomorphic. Their canonical Hodge extensions are also identified wherever local monodromy is unipotent. After multiplying $B'$ by a positive integer, its values on $bb(V)_(bb(Z))$ are integral.]
] <periods:rationalization>

#proof[
  Work on a connected base and fix a lattice fiber $Lambda$ and its monodromy representation. In a basis of $Lambda$, the invariant bilinear forms of the required symmetry satisfy rational linear equations
  $ g^(sans(t)) B g = B quad \( g upright(" in the monodromy group") \) \, #h(2em) B^(sans(t)) = \( - 1 \)^w B . $
  Although the first collection may be infinite, the rows of these equations span a finite-dimensional rational vector space. Finitely many suffice. Thus rational invariant forms are dense in the space of real invariant forms. Choose such a form $B'$ sufficiently close to $B$.
  Put $J = B^(- 1) B'$. Both invariance identities imply that $J$ commutes with monodromy, and the symmetry identities give $J^(sans(t)) B = B J$. If $B'$ is sufficiently close, the power series for the square root at the identity defines $C = J^(1 \/ 2)$. This is a real invertible matrix, commutes with monodromy, and satisfies $C^(sans(t)) B = B C$. Therefore
  $ C^(sans(t)) B C = B C^2 = B J = B' . $
  In particular $C$ defines a global flat real automorphism. The filtration $F' ""^p = C^(- 1) F^p$ is holomorphic and transverse because $C$ is flat; opposedness holds because $C$ is real. The displayed identity transfers the Hodge–Riemann relations exactly, at every base point. Hence $B'$ polarizes $F' ""^bullet$.
  The lattice and its monodromy have not changed. We do not require $C$ to preserve the lattice: it supplies an isomorphism of real variations and of their holomorphic filtered bundles. On a unipotent normal-crossing chart, $C$ commutes with every monodromy logarithm. In the canonical logarithmic frames it is therefore the same invertible constant matrix. It identifies the flat extensions and the extended Hodge filtrations. Finally, clear the denominators of $B'$ on a lattice fiber; monodromy invariance clears them everywhere. If this multiplies $B'$ by $a > 0$, replace $C$ by $sqrt(a) thin C$; the transported filtration is unchanged and the polarization identity remains exact. ◻
]

Thus Lemma 23 does not assert that a nonprojective fiber has a rational polarization of its original Hodge structure. It constructs a different Hodge filtration on the same integral local system, with isomorphic holomorphic Hodge bundles. This is precisely what is needed to use arithmetic period spaces for these bundles.

#thm([Lemma 7.2.])[
  (Polarizations from a fixed Kähler class).  #emph[Let $t : cal(T) arrow.r B^compose$ be a smooth proper family of connected compact complex manifolds of dimension $n$ over a complex manifold $B^compose$, and suppose a closed real $\( 1 \, 1 \)$-form on $cal(T)$ restricts to a Kähler form on every fiber. Its restriction class $kappa$ is flat. The cohomological variations, with their integral lattices modulo torsion, are real-polarizable. In particular:]
  + #emph[on $H^1$, a polarization is 
$ B_1 \( alpha \, beta \) = integral_(cal(T)_b) alpha and beta and kappa^(n - 1) \; $

]
  + #emph[if $n gt.eq 2$, write $H_(bb(R))^2 = P_(bb(R))^2 xor bb(R) kappa$, where $P_(bb(R))^2 = "Ker" \( kappa^(n - 1) union - \)$. For $alpha = alpha_0 + a kappa$ and $beta = beta_0 + b kappa$, a full weight-two polarization is 
#[#set math.equation(numbering: n => "(7.2)")
 $ B_2 \( alpha \, beta \) = integral_(cal(T)_b) alpha_0 and beta_0 and kappa^(n - 2) - a b integral_(cal(T)_b) kappa^n . $ <periods:full-h2>]

 If $h^(2 \, 0) = 1$, this real form has signature $\( 2 \, h^(1 \, 1) \)$.]
] <periods:lefschetz>

#proof[
  Restriction of a closed total-space class is invariant under parallel transport in a smooth proper family. For example, a differentiable trivialization over a path and Stokes’ theorem show that its integrals on transported cycles are constant. Thus $kappa$, its cup powers, and the fiber integrals in the statement are flat. Locally on the base, properness allows us to add a sufficiently large Kähler form pulled back from a coordinate ball and obtain a Kähler form on the total space. The smooth proper Kähler Hodge theorem gives the Hodge filtrations and transversality; one may use the smooth, boundary-free case of #cite(label("FF25")) Theorem 1.1. The Kähler Lefschetz decomposition and Hodge–Riemann relations then polarize its primitive summands. Transporting their forms by Lefschetz and inserting the signs for the resulting Tate twists polarizes full cohomology.
  For clarity, $H^1$ is primitive and its Hodge–Riemann form is $B_1$. In degree two the summands $P_(bb(R))^2$ and $bb(R) kappa$ are orthogonal for the intersection form with $kappa^(n - 2)$. This form polarizes the primitive summand with convention (7.1). The positive Kähler line must have its sign reversed, exactly as in (7.2). The resulting form is positive on the real plane underlying $H^(2 \, 0)$ and negative on real $H^(1 \, 1)$ when $h^(2 \, 0) = 1$. This proves the asserted signature. The primitive projectors and these forms are flat, so all constructions apply to variations. ◻
]

For the families in Proposition 20, the form in this Lemma is obtained by pulling back a fixed Kähler form from the compact ambient manifold $V$. Locally over a small polydisk in the auxiliary base, the family embeds in the product of that polydisk with $V$, so its total space is Kähler there. No Kähler metric on the entire auxiliary base is required.

=== 7.2 Canonical extensions and volume norms <canonical-extensions-and-volume-norms>

For unipotent monodromy along a simple normal crossing divisor, we write $overline(E)$ for the Deligne extension with nilpotent residues, and $overline(F)^p$ for its Schmid Hodge subbundles. Their existence in the analytic setting follows from #cite(label("Schmid73")) Theorem 4.12; this theorem concerns a product of punctured disks and disks. By Lemma 23, its usual polarized integral formulation applies equally to the real-polarized variations used here.

#thm([Lemma 7.3.])[
  (Functoriality and logarithmic bounds).  #emph[Let a pure real-polarizable integral variation be defined on the complement of an SNC divisor in a complex manifold, with unipotent local monodromy. Canonical Hodge extensions commute with tensor products, exterior powers, duals, and holomorphic pullbacks from smooth manifolds with SNC boundary, whose boundary complements map into the original complement. This includes disks whose punctured disks map into that complement. A morphism of pure real variations induces an isomorphism between its coimage and image on these extensions. In particular, an isomorphism of highest Hodge lines induced by such a morphism remains an isomorphism after extension.]
  #emph[If $cal(H)$ is a highest Hodge line, $gamma : Delta arrow.r B$ is a disk with $gamma \( Delta^(*) \)$ in the open set, and $e$ is a nowhere-zero local section of $gamma^(*) overline(cal(H))$, there are constants $c > 0$ and $a gt.eq 0$ such that, for $0 < \| z \|$ sufficiently small, 
#[#set math.equation(numbering: n => "(7.3)")
 $ c^(- 1) \( 1 + \| log \| z \| \| \)^(- a) med lt.eq med parallel e \( z \) parallel med lt.eq med c \( 1 + \| log \| z \| \| \)^a . $ <periods:logbounds>]

 The same assertion holds for its powers and their duals.]
] <periods:extensions>

#proof[
  On a normal-crossing chart let $N_j$ be the commuting logarithms of the local monodromies. Applying the exponential of $- sum_j \( log z_j \) N_j \/ \( 2 pi sqrt(- 1) \)$ to multivalued flat frames gives canonical logarithmic frames, with a compatible choice of monodromy convention. Tensor and dual constructions have the corresponding sums and duals of the nilpotent residues, so their flat extensions agree. Their extended Hodge filtrations agree as well: the induced filtrations are holomorphic subbundles, and coincide on the dense open with the given ones.
  After a holomorphic pullback the residue along a prime divisor is a sum $sum_j a_j N_j$, where the $a_j$ are the orders of the pulled-back boundary coordinates. It is nilpotent because the $N_j$ commute. Thus the pulled-back flat extension is again canonical; pulling back the Hodge subbundles gives their canonical extension by the same uniqueness. Locally on a disk, write the coordinates as $z^(a_j) u_j \( z \)$ with nonvanishing holomorphic units $u_j$; choosing logarithms of the units gives the explicit identification. This also explains the usual pullback compatibility #cite(label("BFMT25")) Lemma 5.6 in the analytic situation needed here.
  For a morphism of pure variations, Lemma 5 supplies flat Hodge splittings of its kernel and image. In logarithmic frames these splitting projectors extend as the same constant matrices, so the splittings persist in the extended filtrations. This proves the coimage-to-image assertion and its consequence for highest lines.
  It remains to check the norm statement. Pull back to the disk, using the compatibility just proved. Schmid’s abstract norm estimate #cite(label("Schmid73")) Theorem 6.6$'$, applied to a flat basis and to the dual variation, bounds both the Hodge metric and its inverse by powers of $1 + \| log \| z \| \|$ on sectors. The matrices relating a flat basis to a canonical logarithmic basis are polynomials in $log z$; hence the same kind of estimates holds in canonical frames. Finitely many sectors cover a punctured disk. The coefficients of $e$ in a holomorphic frame of $overline(E)$ are bounded. Since its highest line is a subbundle and $e$ does not vanish, a local holomorphic section $xi$ of $overline(E)^or$ can be chosen with $xi \( e \) = 1$. Its coefficients are also bounded. The metric estimates and $1 lt.eq parallel xi parallel thin parallel e parallel$ give both inequalities in (7.3). Powers and duals follow immediately. ◻
]

In degree $n$ on an $n$-dimensional compact Kähler manifold, a holomorphic $n$-form is primitive. Its Hodge norm is, with a fixed normalization,

#[#set math.equation(numbering: n => "(7.4)")
 $ parallel eta parallel_(upright("vol"))^2 = \( sqrt(- 1) \)^(n^2) integral_(cal(T)_b) eta and overline(eta) . $ <periods:volume>]

Thus Lemma 25 gives bounds for the actual volume norms appearing in the product formula, as well as for abstract Hodge norms.

=== 7.3 Arithmetic period maps on an analytic base <arithmetic-period-maps-on-an-analytic-base>

For an effective pure variation of weight $w$, we use the Griffiths line

$ lambda = ⨂_(p = 1)^w det F^p E . $

Including the full step $F^0 E = E$ only adds a full-local-system determinant; we will account for this harmless finite-order factor explicitly.

We use the following precise consequence of #cite(label("BFMT25")) Theorems 5.2 and 5.5. If $Z$ is an algebraic variety with a quasifinite horizontal period map for a polarized integral variation, then it has a projective period compactification $Z^(upright("BB"))$. For a sufficiently divisible positive integer $a$ an ample line bundle $cal(A)$ on this compactification restricts to $lambda_Z^a$. Every analytic map $\( Delta^(*) \)^b arrow.r Z^(upright("an"))$ whose period map is locally liftable extends to $Delta^b arrow.r Z^(upright("BB") \, upright("an"))$; when the induced local monodromies are unipotent, the pullback of $cal(A)$ is canonically the Schmid extension of the corresponding $a$-th Griffiths power. The last assertion is part of Theorem 5.5, not an algebraicity assumption on the source.

#thm([Lemma 7.4.])[
  (The Griffiths line on a compact analytic base).  #emph[Let $B$ be a smooth compact complex manifold, let $D$ be an SNC divisor, and let $bb(V)$ be a real-polarizable integral variation on $B^compose = B \\ D$. Suppose its Hodge numbers are either 
$ w = 1 \, quad h^(1 \, 0) = h^(0 \, 1) = g \, #h(2em) upright("or") #h(2em) w = 2 \, quad h^(2 \, 0) = h^(0 \, 2) = 1 . $

 After a finite cover of $B^compose$, extended and resolved over $B$, the canonical extension of its Griffiths line is semiample. The resulting base is smooth and compact and its boundary can be taken SNC.]
] <periods:griffiths>

#proof[
  Apply Lemma 23 and scale the rational polarization to be integral. In weight one its domain $cal(D)$ is Siegel space. In weight two, use the sign convention giving signature $\( 2 \, h^(1 \, 1) \)$. The highest filtration step is a line $ell$ satisfying $B' \( ell \, ell \) = 0$ and $B' \( v \, overline(v) \) > 0$ for $v eq.not 0$ in $ell$; the middle step is $ell^perp$. A connected component of this domain is a type-IV domain. A zero-dimensional domain causes no difficulty and can be treated as a point.
  Let $Gamma$ be the integral isometry group preserving a component, after passing to the corresponding finite cover if necessary. It is an arithmetic group and contains the monodromy. Choose a finite-index neat subgroup $Gamma'$, as in the level construction of #cite(label("BFMT25")) §5.2. Here neat means that the multiplicative group generated by the eigenvalues of each element has no nontrivial torsion. The inverse image of $Gamma'$ under monodromy gives a finite #emph[étale] cover of $B^compose$. This cover has a finite normal extension over $B$ without any Kähler assumption on $B$. Indeed, on an SNC chart $Delta^(* k) times Delta^(b - k)$ its permutation monodromy is finite. A sufficiently divisible coordinate power map kills that monodromy. The cover is then a quotient of finitely many copies of this power cover, with its finite deck group also permuting the copies. Extend each copy to the full polydisk and take the same finite-group quotient. This is a finite normal analytic extension. Such extensions are unique, being the normalization in the finite meromorphic algebra defined on the open, so they glue. The resulting normal space is compact because it is finite over $B$. Resolve it with SNC boundary, leaving the smooth covering open unchanged. This is the finite-extension construction also used in the proof of #cite(label("Villadsen24")) Lemma 2.21; the additional Kähler conclusion of that Lemma is not needed here.
  Every boundary monodromy on this resolution lies in $Gamma'$. By the monodromy theorem, in its analytic formulation #cite(label("Schmid73")) Lemma 4.5, all its eigenvalues are roots of unity. Neatness therefore makes them all equal to one. Hence all local monodromies are unipotent, including those about exceptional boundary divisors. We keep the notation $B$ for the resulting base.
  The quotient $Z = Gamma' without cal(D)$ is a smooth algebraic quasiprojective variety by Baily–Borel #cite(label("BailyBorel66")) §10, especially Theorem 10.11. The theorem applies to the effective adjoint group of the classical domain, and the finite central quotient does not change this conclusion. We keep $Gamma'$ inside the original integral isometry group: neatness kills the finite kernel of its action and the finite point stabilizers. Thus the local system $\( cal(D) times V_(bb(Z)) \) \/ Gamma'$, with $V_(bb(Z))$ the marked lattice, and the tautological filtration give an integral polarized variation on $Z$, retaining the original representation. In the zero-dimensional weight-two case, the isometry group of the positive-definite integral lattice is finite, so its neat subgroup is trivial and this variation is constant on a point. Its period map to this arithmetic quotient is the identity, so it is quasifinite. It is horizontal: for weight one transversality is automatic, and in weight two differentiation of $B' \( v \, v \) = 0$ gives $d v in ell^perp$. Thus $Z$ satisfies the Griffiths-line hypotheses of #cite(label("BFMT25")) Theorems 5.2 and 5.5.
  The conjugated variation on $B^compose$ is the pullback of this tautological variation by its analytic period map $phi.alt$. This assertion concerns the local system as well as the filtration: the marked period map is equivariant for its monodromy representation, and at neat level the quotient has no stabilizers. In particular $phi.alt$ is locally liftable. The quoted analytic extension theorem extends it to
  $ overline(phi.alt) : B arrow.r Z^(upright("BB") \, upright("an")) \, #h(2em) overline(phi.alt)^(*) cal(A) tilde.eq overline(lambda)^(thin a) . $
  To apply the theorem on a chart $Delta^(* k) times Delta^(b - k)$, restrict first to $\( Delta^(*) \)^b$. Its extension agrees with the original map on $Delta^(* k) times Delta^(b - k)$ by uniqueness. The unused coordinates have trivial monodromy, so the same statement holds for the canonical bundle identification. Both maps and identifications glue uniquely on overlapping charts.
  A sufficiently high power of $cal(A)$ is generated by global sections on the projective variety $Z^(upright("BB"))$. Pulling these sections back gives global generation of a power of $overline(lambda)$ on the compact analytic base. Finally, the real isomorphism in Lemma 23 identifies this extension with the one for the original variation. ◻
]

=== 7.4 From Griffiths determinants to the required highest lines <from-griffiths-determinants-to-the-required-highest-lines>

We record the determinant calculation as an identity of holomorphic bundles. For any integral local system, $det E$ has monodromy in ${ 1 \, - 1 }$, since its monodromy matrices are invertible over $bb(Z)$. If the boundary monodromies are unipotent, its canonical extension has trivial local monodromy and extends as a flat line across the boundary. Its square is therefore holomorphically trivial on the compactification. At neat level the determinant itself is trivial. These statements concern the full determinant, and do not assert finite monodromy of individual Hodge pieces.

In weight one, the Griffiths line is $det F^1 E$ up to this full determinant. In weight two put $ell = F^2 E$. The polarization identifies $E \/ F^1 E$ with $ell^or$, giving

#[#set math.equation(numbering: n => "(7.5)")
 $ det F^1 E tilde.eq det E ⊗ ell \, #h(2em) lambda tilde.eq det E ⊗ ell^(⊗ 2) . $ <periods:determinants>]

The possible additional $F^0$ factor changes only the power of $det E$. These identities hold on canonical extensions. Indeed, the flat polarization extends as a nondegenerate bilinear form in logarithmic frames, and $overline(F)^1 = \( overline(F)^2 \)^perp$ by continuity of the subbundles. Taking determinants then gives the extended identities. It follows that semiampleness of $overline(lambda)$ implies semiampleness of $overline(ell)$: kill the determinant torsion and use a further even power. Thus the square in (7.5) is retained.

#thm([Proposition 7.5.])[
  (Semiample period-factor extensions).  #emph[Let $r : P arrow.r S$ and the smooth families $t_i : T_i arrow.r P^compose$ be as in Proposition 20, with $n_i = dim T_(i \, u) > 0$, and put 
$ cal(H)_i = F^(n_i) #scale(x: 120%, y: 120%)[\(] R^(n_i) \( t_i \)_(*) bb(C) ⊗ cal(O)_(P^compose) #scale(x: 120%, y: 120%)[\)] . $

 Thus $cal(H)_i$ is the highest line denoted $lambda_i$ in Proposition 20; the symbol $lambda$ above denotes the Griffiths line. After a proper generically finite surjection $pi : P' arrow.r P$, obtained by extending a finite #emph[étale] cover of the good open and resolving, there are semiample holomorphic line bundles $overline(cal(H))_i$ on the smooth compact manifold $P'$ whose specified restrictions are $pi^(*) cal(H)_i$.]
  #emph[The boundary may be taken SNC. Along any disk in $P'$ whose punctured disk lies in the good open, a generator of $overline(cal(H))_i$ and its inverse have at most powers-of-logarithm growth in the volume norm (7.4) and its dual. The same is true for all positive powers, including the powers used in the product-volume identification of Proposition 20.]
] <periods:semiample>

#proof[
  For a torus-type factor take $bb(V)_i = R^1 \( t_i \)_(*) bb(Z) \/ upright("tors")$, and for a symplectic-type factor take $bb(V)_i = R^2 \( t_i \)_(*) bb(Z) \/ upright("tors")$. The cohomological conditions in Proposition 20 give the Hodge numbers in Lemma 26. The fixed ambient Kähler class supplies their flat real polarizations by Lemma 24; in degree two we use the full polarization (7.2).
  Apply the finite-level construction simultaneously to these finitely many variations and to $R^(n_i) \( t_i \)_(*) bb(Z) \/ upright("tors")$ for every $i$. The latter variations also have flat real polarizations and can be rationalized by Lemma 23 for this purpose. Intersect the resulting finite-index subgroups in the base fundamental group. Extending this one finite cover and resolving gives $P'$ with unipotent local monodromies for all these variations. We may first resolve the complement of $P^compose$ and shrink the good open, so the final complement is SNC. Subsequent cup products are taken in the original real variations, whose monodromies are unchanged by rationalization.
  Lemma 26 makes the extended Griffiths lines of $bb(V)_i$ semiample on this common cover; the same proof uses the chosen common neat level and requires no additional alteration. For a torus-type factor, $h^(1 \, 0) = n_i$, and cup product gives the specified isomorphism
  $ and.big^(n_i) F^1 E_i = det F^1 E_i arrow.r^(med tilde.op med) cal(H)_i . $
  It is induced by the pure Hodge morphism $and.big^(n_i) bb(V)_i arrow.r R^(n_i) \( t_i \)_(*) bb(R)$. By Lemma 25 it identifies the extended lines. The determinant calculation above therefore makes $overline(cal(H))_i$ semiample.
  For a symplectic-type factor, write $n_i = 2 k_i$ and $ell_i = F^2 E_i$. Equation (7.5) makes $overline(ell)_i$ semiample, and the specified top cup product is
  $ ell_i^(⊗ k_i) arrow.r^(med tilde.op med) cal(H)_i . $
  This is induced by the pure morphism $bb(V)_i^(⊗ k_i) arrow.r R^(2 k_i) \( t_i \)_(*) bb(R)$. Again Lemma 25 identifies the extensions, so $overline(cal(H))_i tilde.eq overline(ell)_i^(⊗ k_i)$ is semiample. In particular the extended cup maps take generators to generators, rather than to sections vanishing at the boundary.
  We choose $overline(cal(H))_i$ throughout to be the Schmid highest line in the original top cohomological variation. Its norm is the geometric volume norm (7.4). The last assertion is therefore exactly Lemma 25, including its pullback statement for disks. This proves both the specified holomorphic extension and the required metric control. ◻
]

An absent factor, or a zero-dimensional factor retained by convention, contributes the trivial line with constant norm. Thus an empty collection of period factors requires no modification and no extra hypothesis.

== 8 Extending the comparison and descending sections <descent:section>

Two analytic facts complete the passage from the auxiliary parameter space to the original base model. The first extends a specified isomorphism of volume lines; the second descends global generation.

#thm([Lemma 8.1.])[
  #emph[Let $P$ be a complex manifold, $D$ a simple normal crossing divisor, and $P^compose = P \\ D$. Let $E_1 \, E_2$ be holomorphic line bundles on $P$, equipped on $P^compose$ with Hermitian norms, and let 
$ phi.alt : E_1 \|_(P^compose) arrow.r^(med tilde.op med) E_2 \|_(P^compose) $

 be a specified holomorphic isomorphism. Assume the following near the smooth locus of each component of $D$. In a coordinate polydisk $\( t \, z \)$ with $D = \( t = 0 \)$, choose nonvanishing holomorphic frames $e_1 \, e_2$. For a dense set of centers $z$, their norms and dual norms along the parallel punctured disks satisfy bounds by powers of $1 + \| log \| t \| \|$. The constants and powers may depend on the disk. Assume also that $phi.alt$ compares the two norms by factors bounded above and below on each such disk. It is enough for these bounds to hold after a finite power substitution on each disk. Then $phi.alt$ extends uniquely to a holomorphic isomorphism $E_1 tilde.eq E_2$ on $P$.]
] <descent:unit>

#proof[
  Write $phi.alt \( e_1 \) = g e_2$, where $g$ is holomorphic and nowhere zero on the punctured polydisk. The bounds on the frames and their duals give, on every disk under consideration,
  #[#set math.equation(numbering: n => "(8.1)")
   $ \| g \( t \, z \) \| + \| g \( t \, z \) \|^(- 1) lt.eq C_z #scale(x: 120%, y: 120%)[\(] 1 + \| log \| t \| \| #scale(x: 120%, y: 120%)[\)]^(b_z) $ <descent:scalar-bounds>]
  for suitable positive constants. If the estimate is initially given after $t = u^N$, it implies an estimate of the same form downstairs, since every nonzero $t$ has an $N$-th root and $\| log \| u \| \| = \| log \| t \| \| \/ N$.
  Fix one such $z$. For $j gt.eq 1$, the coefficient of $t^(- j)$ in the Laurent expansion of $g \( t \, z \)$ is
  $ a_(- j) \( z \) = frac(1, 2 pi i) integral_(\| t \| = epsilon) g \( t \, z \) t^(j - 1) thin d t . $
  It is independent of $epsilon$, and (8.1) yields
  $ \| a_(- j) \( z \) \| lt.eq C_z epsilon^j #scale(x: 120%, y: 120%)[\(] 1 + \| log epsilon \| #scale(x: 120%, y: 120%)[\)]^(b_z) arrow.r 0 . $
  Thus every negative Laurent coefficient vanishes. The same argument applies to $g^(- 1)$, so both functions extend holomorphically on this disk, and their extensions multiply to one.
  For a fixed integration radius, $a_(- j) \( z \)$ is holomorphic in the remaining coordinates. It vanishes on the dense set of centers from the hypothesis and therefore vanishes identically. The Laurent expansion in the polydisk consequently has no negative powers. Equivalently, Cauchy’s integral formula constructs a jointly holomorphic extension across $t = 0$. Applying this also to $g^(- 1)$ gives a holomorphic unit throughout the polydisk. This reasoning does not require uniform logarithmic constants as the center varies.
  We have extended $phi.alt$ and its inverse across each component of $D$ away from its intersections with the others. The remaining subset has complex codimension at least two. In local line-bundle frames, Hartogs’ extension theorem extends the coefficient functions of both maps across that subset. Their compositions remain the identity by analytic continuation. Local extensions agree because they agree on the dense open $P^compose$, proving existence and uniqueness globally. ◻
]

#prodef([Remark 8.2.])[
  Local power charts also handle disks tangent to the boundary. Indeed, write such a chart as
  $ \( u_1 \, dots.h \, u_ell \, z \) mapsto \( u_1^(N_1) \, dots.h \, u_ell^(N_ell) \, z \) . $
  For a holomorphic disk $gamma$ whose punctured disk avoids the boundary, each boundary coordinate has the form
  $ t_i compose gamma \( t \) = t^(b_i) a_i \( t \) \, #h(2em) b_i gt.eq 0 \, quad a_i \( 0 \) eq.not 0 . $
  After a substitution $t = v^N$, with every $N_i$ dividing $N$, the functions $a_i \( v^N \)$ have holomorphic $N_i$-th roots on a smaller disk, so $gamma$ lifts to the power chart. Thus the disk bounds for generators supplied by Theorem 12 and the factor-extension results can be used after arbitrary auxiliary pullbacks, including at tangential disks. Lemma 28 itself needs only the general parallel transverse disks.
] <descent:tangential-disks>

We next give the descent statement in a form that does not require either a generically finite auxiliary map or a finite flat intermediate map.

#thm([Lemma 8.3.])[
  #emph[Let $r : P arrow.r S$ be a proper surjective holomorphic map of connected compact complex manifolds, and let $A$ be a holomorphic line bundle on $S$. If $r^(*) A$ is semiample, then $A$ is semiample. More precisely, let 
$ P arrow.r^h T arrow.r^q S $

 be the Stein factorization, and let $d$ be the generic degree of $q$. If $r^(*) \( A^(⊗ n) \)$ is globally generated, then $A^(⊗ n d)$ is globally generated. The same descent conclusion holds for rational holomorphic line bundles after clearing denominators.]
] <descent:semiample>

#proof[
  The intermediate space $T$ is normal and irreducible, $q$ is finite surjective, and $h_(*) cal(O)_P = cal(O)_T$. The projection formula gives an identification of section spaces
  #[#set math.equation(numbering: n => "(8.2)")
   $ H^0 #scale(x: 120%, y: 120%)[\(] P \, r^(*) \( A^(⊗ n) \) #scale(x: 120%, y: 120%)[\)] tilde.eq H^0 #scale(x: 120%, y: 120%)[\(] T \, q^(*) \( A^(⊗ n) \) #scale(x: 120%, y: 120%)[\)] . $ <descent:stein-sections>]
  For $t in T$, choose $p in h^(- 1) \( t \)$. A section on the left that is nonzero at $p$ descends to a section on the right that is nonzero at $t$. Thus $q^(*) \( A^(⊗ n) \)$ is globally generated.
  We recall directly the analytic norm needed for $q$, without assuming flatness. Outside a proper analytic subset of $S$, the map $q$ is a covering with $d$ distinct sheets. If $b$ is a holomorphic function on $q^(- 1) \( V \)$, its product over these sheets is a single-valued holomorphic function on the covering locus in $V$:
  $ "Nm"_q \( b \) \( s \) = product_(t in q^(- 1) \( s \)) b \( t \) . $
  This function is locally bounded near the omitted analytic subset. To see this near $s_0$, choose neighborhoods of the finitely many points of $q^(- 1) \( s_0 \)$ on which $b$ is bounded. Properness allows us to shrink $V$ so that $q^(- 1) \( V \)$ is contained in their union. The product is then bounded by the $d$-th power of a common bound. Since $S$ is normal, the removable singularities theorem extends it uniquely to a holomorphic function on $V$. The extended norm is multiplicative and satisfies
  $ "Nm"_q \( q^(*) c \) = c^d . $
  Both identities hold on the covering locus and hence everywhere.
  If $b$ is nonzero at every point above $s_0$, the same neighborhoods can be chosen so that $b$ and $b^(- 1)$ are bounded. The preceding construction then extends both $"Nm"_q \( b \)$ and $"Nm"_q \( b^(- 1) \)$, whose product is one. In particular, $"Nm"_q \( b \) \( s_0 \) eq.not 0$. This argument uses local sheets and normality, rather than a determinant of a locally free pushforward.
  For any section
  $ v in H^0 #scale(x: 120%, y: 120%)[\(] T \, q^(*) \( A^(⊗ n) \) #scale(x: 120%, y: 120%)[\)] \, $
  apply the function norm to its coefficients in local frames of $A^(⊗ n)$. The identity $"Nm"_q \( q^(*) c \) = c^d$ shows that these coefficients glue to a section
  $ "Nm"_q \( v \) in H^0 #scale(x: 120%, y: 120%)[\(] S \, A^(⊗ n d) #scale(x: 120%, y: 120%)[\)] . $
  Fix $s_0 in S$. For each point $t$ of the finite set $q^(- 1) \( s_0 \)$, sections vanishing at $t$ form a proper linear hyperplane in the section space in (8.2). Over $bb(C)$, finitely many proper hyperplanes cannot cover a vector space. We may therefore choose $v$ nonzero at every point of $q^(- 1) \( s_0 \)$. Its norm is nonzero at $s_0$. The exponent $n d$ is independent of $s_0$, so these norm sections prove global generation of $A^(⊗ n d)$.
  Finally, for a rational line bundle, first choose an actual line bundle representing a positive integral multiple. Any torsion ambiguity in such a representative disappears after a further positive tensor power. The preceding argument then applies to that actual line bundle. ◻
]

#prodef([Remark 8.4.])[
  No Kähler assumption on the auxiliary manifold $P$ is used in Lemma 30. Positive-dimensional fibers are handled by (8.2); branching and possible nonflatness of the finite map are handled by the bounded norm. In particular, this descent gives global generation on the whole compact base, with a single exponent.
]

== 9 Proof of the main theorem <sec:conclusion>

We assemble the preceding constructions, preserving the specified isomorphisms of volume lines.

Start with the smooth compact Kähler model $S$ prepared in Section 2. Corollary 13 proves that

$ M_(S_1) = nu^(*) M_S $

for every smooth compact Kähler modification $nu : S_1 arrow.r S$. This proves part (a) of Theorem 1.

For part (b), Proposition 20 supplies a proper surjection $r : P arrow.r S$ from a smooth compact connected auxiliary base, and an actual product decomposition of log-plurivolume lines on a dense open $P^compose$. The connected deepest-stratum selection in that proposition is compatible with the original top root line by Proposition 7. Theorem 12 therefore identifies the extension of the original factor on the left with $r^(*) \( m M_S \)$, after taking the necessary common multiples and testing on local unipotent covers.

By Proposition 21, the projective-factor line has a semiample extension, with the required logarithmic norm bounds. By Proposition 27, so do the remaining highest-form factor lines after a further finite cover and resolution of $P$. Replace $P$ by that compact smooth model. It is still proper and surjective over $S$. All powers and all finitely many finite covers can be chosen once for this family. Their composite and a common further exponent suffice simultaneously for every factor.

The product isomorphism on $P^compose$ is induced by the actual volume maps, and its norms agree up to the fixed covering-degree constant. Corollary 14 and the two factor propositions supply upper and lower powers-of-logarithm estimates for local extended frames on general transverse disks. Lemma 28, applied also to the inverse isomorphism, extends the product identity to all of $P$. Thus, for some positive integer $a$, the actual line $r^(*) cal(O)_S \( a M_S \)$ is a tensor product of semiample lines. A common power is globally generated.

Lemma 30 now gives a positive multiple of $a M_S$ generated at every point of $S$. The exponent is independent of the point, and the conclusion holds for the holomorphic line bundle itself. This proves part (b) and completes Theorem 1. 0◻

#prodef([Remark 9.1.])[
  The compact auxiliary base is used only to establish generation. It is not asserted to be the modification in Theorem 1. The latter is the compact Kähler model $S$ on which the threshold calculation already proves pullback compatibility. Nor is a choice of global divisor representatives for canonical or moduli line bundles on the original nonprojective manifolds needed anywhere in the argument.
]


#bibliography("refs.bib", style: "ieee", title: [References])
