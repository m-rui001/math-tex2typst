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

#align(center)[#text(size: 16pt, weight: "bold")[Uniform log Iitaka fibrations \
and bounded moduli denominators]]
#align(center)[OpenAI]
#align(center)[October 4, 2026]

== 1 Introduction <sec:introduction>

Let $\( X \, B \)$ be a normal projective log canonical pair over an algebraically closed field $k$ of characteristic zero, and put $D = K_X + B$. When $kappa \( X \, D \) gt.eq 0$, the sections of multiples of $D$ determine the Iitaka fibration. The effective problem asks whether one degree, depending only on the dimension and the allowed boundary coefficients, already determines that fibration. A uniform degree must control both the birational geometry of its base and the information lost in passing between different pluricanonical degrees.

We formulate the conclusion directly as an equality of subfields of the function field. For an integer $ell > 0$, write

$ V_ell \( D \) = H^0 #scale(x: 120%, y: 120%)[\(] X \, cal(O)_X \( ⌊ell D⌋ \) #scale(x: 120%, y: 120%)[\)] . $

When $V_ell \( D \) eq.not 0$, the ratios of its nonzero sections generate a field $F_ell \( D \) subset k \( X \)$. Define

$ K \( D \) = k (s / t : s \, t in V_ell \( D \) \\ { 0 } \, med ell > 0 \, med V_ell \( D \) eq.not 0) . $

Thus $F_ell \( D \)$ is the function field of the image of the complete degree-$ell$ system, viewed inside $k \( X \)$, and $K \( D \)$ collects these fields over all degrees. The reflexive sheaf $cal(O)_X \( ⌊ell D⌋ \)$ makes this definition meaningful even when $ell D$ is not Cartier.

#thm([Theorem 1.1.])[
  (Uniform log Iitaka degree).  #emph[For every integer $d gt.eq 5$ and every finite set $Phi subset \[ 0 \, 1 \] ∩ bb(Q)$, there is an integer $m = m \( d \, Phi \) > 0$ with the following property. Let $k$ be any algebraically closed field of characteristic zero, and let $\( X \, B \)$ be a normal integral projective lc $d$-fold pair over $k$. Assume that $B gt.eq 0$, every nonzero coefficient of $B$ belongs to $Phi$, $D = K_X + B$ is rational Cartier, and $kappa \( X \, D \) gt.eq 0$. Then 
$ V_m \( D \) eq.not 0 \, #h(2em) F_m \( D \) = K \( D \) quad upright("inside ") k \( X \) . $

]
] <thm:main>

The bound is existential. The proof uses the good-model theorem of [26], the normal log canonical index theorem of [28], and the arithmetic Stein-degree theorem of [25]. Their precise statements are recalled in Section 2. The contribution developed here is the passage from these inputs to uniform denominators for log fibrations with horizontal boundary, followed by the exact comparison of rounded section fields. We state the higher-dimensional range $d gt.eq 5$ to complement the lower-dimensional results discussed below; the intermediate arguments are formulated in all fibre dimensions.

=== 1.1 History and the denominator problem <history-and-the-denominator-problem>

Iitaka’s work established the asymptotic fibration associated with pluricanonical systems [18]. Uniform effectivity asks for a degree independent of the particular variety. In the general-type case this became uniform birationality of pluricanonical maps, proved in arbitrary dimension by Hacon–McKernan, Takayama, and Tsuji [13,30,34]. Hacon–McKernan–Xu extended effective birationality to big log canonical adjoints with coefficients in a DCC set [15] Theorem 1.3. That theorem includes round-down systems, the convention used here.

When the Kodaira dimension is smaller than the dimension, the induced log adjoint on the generic fibre has Kodaira dimension zero. The canonical bundle formula transfers the adjoint to the base, where the variation of the fibres contributes a moduli divisor. Fujino–Mori developed this approach to effective Iitaka fibrations [11]; Viehweg–Zhang obtained effective results with a surface base and controlled fibre invariants [35]. Birkar–Zhang’s general effectivity theorem depends on the dimension, the least nonvanishing pluricanonical degree of the general fibre, and the middle Betti number of a smooth model of its canonical cover [4] Theorem 1.2. Their effective birationality theorem for polarized pairs [4] Theorem 1.3 is also the final birational input in the present proof.

The logarithmic problem introduces horizontal boundary on the generic fibre. Earlier results include the low-dimensional klt results of Todorov and Todorov–Xu [31,32], and the boundedness and birationality results of Hacon–Xu for klt pairs whose boundary is big over the generic point of the Iitaka base [16]. Chen–Han–Liu formulate the effective log Iitaka problem for lc pairs with DCC coefficients and relate it to good minimal models and complements [5] Conjecture 1.2 and Theorem 1.4. They obtain the dimension-at-most-three case in [5] Corollary 1.5. Our coefficient set is finite, and the higher-dimensional argument here uses the three companion theorems stated above.

A bounded index of the generic fibre does not by itself give the needed Cartier denominator for the moduli divisor. After a curve base change one can obtain semistable reduction, but its ramification degree is generally uncontrolled. The relevant question is whether the action of inertia on a suitably normalized logarithmic volume form has bounded order. Only this character needs to be bounded; the covering degree and the order of the entire automorphism need not be.

Fujino–Mori already control finite characters through the cohomology of the fibre [11] Theorem 3.1 and Sections 3.6–3.8. The companion [28] develops the character method for boundary-free factors using the singular Beauville–Bogomolov decomposition. The curve and effective-system arguments of [27] treat log Calabi–Yau fibrations in total dimension at most four, using the index of the whole reduced slc fibre. We adapt these methods to horizontal boundary in arbitrary fibre dimension. The geometric structure theorem of Matsumura–Wang [24] Theorem 1.3 supplies a rationally connected factor carrying the boundary, together with abelian and nonabelian Beauville–Bogomolov factors. The additional work is to retain the factor decomposition under semilinear actions and to control the logarithmic character of the rationally connected factor.

=== 1.2 The main intermediate result and the proof <the-main-intermediate-result-and-the-proof>

The reusable intermediate statement is a bound for weights over curves. Let $C$ be a smooth projective complex curve, put $K = bb(C) \( C \)$, let $z$ be a uniformizer at $c in C$, and let $\( V \, Delta \)$ be a geometrically integral normal projective lc $s$-fold pair over $K$, with $Delta gt.eq 0$. For a positive integer $a$, a degree-$a$ rational log trivialization is a nonzero rational $a$-canonical form $phi.alt$ satisfying $"div" \( phi.alt \) + a Delta = 0$. Its weight at $c$ is the infimum

$ w_z \( phi.alt \) = inf_E frac("ord"_E #scale(x: 120%, y: 120%)[\(] phi.alt and \( d z \/ z \)^(⊗ a) #scale(x: 120%, y: 120%)[\)] + a, a thin "ord"_E z) \, $

where $E$ ranges over divisorial valuations of the total function field centred over $c$. These are ordinary canonical orders; the additive $a$ records the logarithmic pole along the base. Theorem 8 proves that an integer depending only on $s$ and $a$ clears this weight. Once a degree-$a$ trivialization is given, no further coefficient parameter is needed.

There are two parts to the weight argument. If a dlt model has a horizontal coefficient-one component, taking a rational pluriresidue reduces the fibre dimension. Its Stein factorization may change the curve field. The arithmetic bound of [25] controls that change, so residue gives an induction with bounded denominators.

In the klt case the product theorem of [24] applies, but the product cover need not carry the inertia action. We pass to a Galois comparison cover and prove that a bounded power acts separately on suitable finite covers of the factors. The proof uses the algebra of endomorphisms of the tangent sheaf of the comparison cover that preserve its subsheaf of vector fields tangent to the boundary. The required vanishing of global vector fields tangent to the boundary on the rationally connected factor follows from a finite invariant log-volume measure.

After equivariant semistable reduction, each factor form can be normalized to have weight zero. Their product has weight zero as well. If the original form differs from this product by a base function $v$ on a curve cover, and $c'$ is a point over $c$ of ramification index $e$, then

$ e thin w_z \( phi.alt \) = frac("ord"_(c') \( v \), a) . $

The inertia identity forces $e$ to divide a bounded multiple of $"ord"_(c') \( v \)$ once the factor characters have bounded order. This cancels the uncontrolled ramification and bounds the original weight denominator.

For abelian factors the character acts on a bounded-rank integral cohomology group. For the other factors we instead use a dlt special fibre on a good model. Du Bois base change determines its structure-sheaf cohomology, and coherent Lefschetz gives a fixed point of a bounded power of the action. A bounded further power preserves a normal component. The residue there is a log trivialization in the original degree, so its different has coefficients in a fixed finite set. The normal lc index theorem of [28], applied to the cyclic quotient of this component, bounds the character. This step works on one normal component and is the reason an index theorem for a reducible special fibre is unnecessary.

To finish the proof over $bb(C)$, let $f : Y arrow.r Z$ be the semiample contraction of a good model $\( Y \, B_Y \)$ of $\( X \, B \)$. The normal index theorem gives a bounded positive integer $p_0$ and a rational function $psi in bb(C) \( Y \)^(*)$ such that the canonical bundle formula has the exact presentation

$ K_Y + B_Y + 1 / p_0 "div" \( psi \) = f^(*) \( K_Z + B_Z + M_Z \) . $

Here $B_Z$ is the discriminant defined by log canonical thresholds, and the equality specifies the moduli representative $M_Z$. Fixing the degree $p_0$ is essential: arbitrary rational principal shifts can introduce new denominators. Slicing the base by a curve identifies a coefficient of this moduli divisor with the curve weight, up to an integer. This proves Theorem 26: a uniform multiple of the moduli trace on a suitable smooth birational model of $Z$ is nef Cartier.

Birkar–Zhang’s theorem then gives a birational system on the base. The remaining step is to identify complete rounded section spaces upstairs with those downstairs. This yields equality with $K \( D \)$ inside the original function field, including ratios initially appearing in other degrees, and permits descent from $bb(C)$ to any algebraically closed characteristic-zero field.

Section 3 records the relative minimal-model construction. Section 4 proves the residue reduction for weights. Sections 5 and 6 establish the klt weight bound. Section 7 converts that bound into moduli denominators, and Section 8 proves Theorem 1.

== 2 Conventions and companion theorems <sec:preliminaries>

We assume familiarity with discrepancies, singularities of pairs, and the minimal model program, as in [22,20]. We recall the conventions and precise theorem inputs needed for the argument. The argument is carried out over $bb(C)$ until the final descent to an arbitrary algebraically closed field of characteristic zero. Varieties are integral and projective unless a different setting is specified. A #emph[contraction] is a projective surjective morphism $f : X arrow.r Z$ of normal varieties satisfying $f_(*) cal(O)_X = cal(O)_Z$. In characteristic zero its generic fibre is geometrically integral. All boundaries in our argument are rational.

For a normal variety, a rational section of a divisorial sheaf is identified with a rational function. Thus, for a rational Weil divisor $D$,

#[#set math.equation(numbering: n => "(2.1)")
 $ H^0 \( X \, cal(O)_X \( ⌊D⌋ \) \) = { a in k \( X \) : "div" \( a \) + D gt.eq 0 } union { 0 } . $ <eq:section-inequality>]

The equality uses the integrality of the orders of $a$. It does not require $⌊D⌋$ to be Cartier. We use compatible canonical divisors on birational models, obtained from one rational top differential. A rational $m$-canonical form means an element of the $m$th tensor power of the top differential line of a function field; its divisor is computed on normal models at codimension-one regular points.

We use log discrepancies. If $pi : Y arrow.r X$ is a birational model and $K_Y + B_Y = pi^(*) \( K_X + B \)$, then the log discrepancy of a prime divisor $E$ on $Y$ is $1 - "coeff"_E B_Y$. In particular, log canonicity means that all these numbers are nonnegative. Crepant boundaries on higher models may have negative coefficients. Effectiveness will always be specified when it is needed. We use dlt adjunction in its usual form: a component $S$ of the coefficient-one part of a dlt boundary is normal, and

$ \( K_Y + B_Y \) \|_S = K_S + "Diff"_S \( B_Y - S \) $

with an effective lc different when $B_Y$ is an effective boundary [22,20].

=== 2.1 The three companion inputs <the-three-companion-inputs>

The following statements are the substantive inputs from companion manuscripts. We recall their full scope because the coefficient and ground-field conditions matter at different places in the proof.

#thm([Theorem 2.1.])[
  (Normal log canonical indices [28] Theorem 1.2).  #emph[For every integer $n gt.eq 0$ and every DCC set $Psi subset \[ 0 \, 1 \] ∩ bb(Q)$, there is an integer $a \( n \, Psi \) > 0$ such that every normal integral projective lc pair $\( V \, Delta \)$ over $bb(C)$ with $dim V = n$, $Delta gt.eq 0$, coefficients in $Psi$, and $K_V + Delta tilde.op_(bb(Q)) 0$ satisfies 
$ a \( n \, Psi \) \( K_V + Delta \) tilde.op 0 . $

 Here the displayed multiple is an integral principal divisor.]
] <thm:normal-index>

A DCC set is a set with no infinite strictly decreasing sequence. We will apply Theorem 2 both to a finite coefficient set and to the DCC set produced by finite cyclic quotients. Its principal-divisor conclusion supplies an actual rational pluriform in a bounded degree.

#thm([Theorem 2.2.])[
  (Good models [26] Theorem 11.1).  #emph[Every projective lc pair $\( V \, Delta \)$ over $bb(C)$ with effective real boundary and pseudo-effective real Cartier adjoint $K_V + Delta$ has a good log minimal model.]
] <thm:good-models>

We use only the rational-boundary case, including semiampleness of a nef adjoint. This theorem supplies existence; the terminating programs used below also use the MMP with scaling [33]. Section 3 explains precisely how to apply these results over a projective curve.

#thm([Theorem 2.3.])[
  (Arithmetic Stein degrees [25] Main Theorem).  #emph[For every integer $n gt.eq 1$ and every real number $t > 0$, there is an integer $N \( n \, t \)$ with the following property. Let $F$ be a field of characteristic zero, and let $\( V \, Delta \)$ be a normal integral projective lc rational pair over $F$ with 
$ dim V = n \, #h(2em) H^0 \( V \, cal(O)_V \) = F \, #h(2em) Delta gt.eq 0 \, #h(2em) K_V + Delta tilde.op_(bb(Q)) 0 . $

 If $S$ is a prime component of $Delta$ of coefficient at least $t$, the algebraic closure of $F$ in $F \( S \)$ has degree at most $N \( n \, t \)$ over $F$.]
] <thm:stein-degree>

For a proper normal component this algebraic closure is its field of global functions. In our application $F$ is a complex curve field and $t = 1$; the theorem controls the finite curve in the Stein factorization of a horizontal coefficient-one component.

=== 2.2 Trivializations and constants <trivializations-and-constants>

Two elementary facts will be useful repeatedly. First, a rational function with zero divisor on a normal integral proper variety is an invertible global function. Second, the degree of a geometric trivialization does not increase on descending the constants.

#thm([Lemma 2.4.])[
  (Descent in the same degree).  #emph[Let $V$ be a geometrically integral normal projective variety over a characteristic-zero field $F$. Let $D$ be an integral Weil divisor. If $D_(overline(F))$ is principal, then $D$ is principal. In particular, an integral principal multiple of a rational log canonical divisor on $V_(overline(F))$ descends in the same degree to $V$.]
] <lem:trivialization-descent>

#proof[
  The divisorial sheaf $cal(O)_V \( D \)$ becomes the trivial line bundle after extension to $overline(F)$. Divisorial sheaves commute with this extension, as can be seen on a regular big open and by reflexive extension. Faithfully flat descent makes $cal(O)_V \( D \)$ invertible. Proper base change shows that its space of sections is one-dimensional over $F$. The evaluation map from this space tensored with $cal(O)_V$ is an isomorphism after scalar extension, hence already an isomorphism. A nonzero section therefore trivializes the line bundle and principalizes $D$. ◻
]

The geometric instances of Theorem 2 over a complex function field are legitimate: the algebraic closure of any finitely generated extension of $bb(C)$ is abstractly isomorphic to $bb(C)$. Transporting the variety and its divisor through such an isomorphism preserves the stated algebraic hypotheses. The final section gives a separate descent argument for the ground field in the main theorem.

== 3 Minimal models over a curve <sec:mmp>

We will use good minimal models for several degenerations of log Calabi–Yau pairs. Theorem 3 gives absolute good models. The following consequence supplies the relative form needed here, even when the original adjoint is not pseudo-effective on the total space.

#thm([Lemma 3.1.])[
  #emph[Let $f : X arrow.r C$ be a contraction from a projective variety over $bb(C)$ to a smooth projective curve, and let $\( X \, Delta \)$ be a $bb(Q)$-factorial dlt pair with effective rational boundary. Suppose that, for some sufficiently divisible integer $r > 0$, 
$ H^0 #scale(x: 120%, y: 120%)[\(] X_eta \, cal(O)_(X_eta) \( r \( K_(X_eta) + Delta_eta \) \) #scale(x: 120%, y: 120%)[\)] eq.not 0 \, #h(2em) eta = "Spec" bb(C) \( C \) . $

 There is a $\( K_X + Delta \)$-MMP over $C$ that terminates with a $bb(Q)$-factorial dlt pair $\( X' \, Delta' \)$ for which $K_(X') + Delta'$ is semiample over $C$. If $\( X \, Delta \)$ is klt, its output is klt.]
] <lem:curve-mmp>

#proof[
  A generic section extends after a sufficiently positive twist from $C$. Choose an ample rational divisor $A$ on $C$ such that
  $ K_X + Delta + f^(*) A quad upright("is pseudo-effective") \, #h(2em) deg A > 2 dim X . $
  We may represent $A$ by many general points with small positive coefficients. Then $\( X \, Delta + f^(*) A \)$ is dlt, and is klt if $\( X \, Delta \)$ is klt. Choose an effective ample rational scaling divisor $G$, represented by general members with small coefficients, such that $\( X \, Delta + f^(*) A + G \)$ is lc and $K_X + Delta + f^(*) A + G$ is nef. The good-model theorem just recalled and [33] Theorem A give a terminating MMP for $K_X + Delta + f^(*) A$ with scaling of $G$. The resulting log adjoint is nef and hence semiample by the nef case of [26] Theorem 11.1.
  Every step of this program is over $C$. Indeed, suppose inductively that the current variety $X_i$ has a morphism $f_i : X_i arrow.r C$, and let $R$ be the negative extremal ray chosen at that step. Since $f_i^(*) A$ is nef, $R$ is also negative for $K_(X_i) + Delta_i$. The lc length bound [9] Theorem 1.1(5) supplies a rational curve $Gamma$ spanning $R$ with
  $ 0 < - \( K_(X_i) + Delta_i \) dot.op Gamma lt.eq 2 dim X . $
  If $Gamma$ dominated $C$, then $f_i^(*) A dot.op Gamma gt.eq deg A$, giving
  $ \( K_(X_i) + Delta_i + f_i^(*) A \) dot.op Gamma gt.eq - 2 dim X + deg A > 0 \, $
  a contradiction. Thus the ray is vertical. The morphism to $C$ descends through its contraction, and any flip is also over $C$. On a vertical ray the two adjoints have the same intersection numbers, so these are also steps of a $\( K_X + Delta \)$-MMP over $C$.
  The transform of the added divisor remains $f_i^(*) A$. Dlt preservation for the augmented pairs, followed by decreasing the boundary, keeps $\( X_i \, Delta_i \)$ dlt throughout; the usual discrepancy comparison preserves klt in the klt case. Finally, subtracting a divisor pulled back from $C$ does not change relative semiampleness. Hence the semiampleness of $K_(X') + Delta' + f' ""^(*) A$ proves the assertion. ◻
]

== 4 Weights of logarithmic pluriforms <sec:weights>

The denominator needed in the canonical bundle formula will be detected by a rational pluriform over a curve. Its weight compares the corrected canonical order with the multiplicity of the base parameter. The main assertion of this section bounds the denominator using only the relative dimension and the degree of the pluriform. Coefficient-one horizontal boundary will permit induction by residue; the remaining klt case is proved in Proposition 24.

Let $C$ be a smooth projective complex curve, let $c in C$, and put $K = bb(C) \( C \)$. A rational uniformizer at $c$ is an element $z in K$ with $"ord"_c z = 1$. Suppose that $F \/ K$ is a finitely generated regular field extension of transcendence degree $s$. A rational relative $m$-canonical form is a nonzero element of $\( and.big^s Omega_(F \/ K) \)^(⊗ m)$. We use the canonical-line identification given by a fixed wedge order to write its associated absolute form as

$ Omega = phi.alt and \( d z \/ z \)^(⊗ m) . $

Orders of this absolute pluriform are ordinary canonical orders on models of $F$ over $bb(C)$.

#prodef([Definition 4.1.])[
  For a rational relative $m$-canonical form $phi.alt$, set
  #[#set math.equation(numbering: n => "(4.1)")
   $ w_z \( phi.alt \) = inf_E frac("ord"_E #scale(x: 120%, y: 120%)[\(] phi.alt and \( d z \/ z \)^(⊗ m) #scale(x: 120%, y: 120%)[\)] + m, m "ord"_E z) . $ <eq:weight-definition>]
  Here $E$ runs through the normalized divisorial valuations of $F \/ bb(C)$ whose restriction to $K$ is a positive multiple of $"ord"_c$.
] <def:weight>

The definition depends only on the field and form. In the log canonical setting below the infimum is finite and is attained on a log resolution.

#thm([Theorem 4.2.])[
  (Uniform weight denominator).  #emph[For integers $s gt.eq 0$ and $m gt.eq 1$ there is an integer $q \( s \, m \) > 0$ with the following property. Let $C$ be a smooth projective complex curve, $c in C$, and $z$ a rational uniformizer at $c$. Let $V$ be a normal geometrically integral projective $s$-fold over $K = bb(C) \( C \)$, and let $\( V \, B \)$ be a geometrically log canonical pair with effective rational boundary. If a rational relative $m$-canonical form $phi.alt$ satisfies 
#[#set math.equation(numbering: n => "(4.2)")
 $ "div"_V \( phi.alt \) + m B = 0 \, $ <eq:weight-log-trivialization>]

 then 
$ q \( s \, m \) w_z \( phi.alt \) in bb(Z) . $

 The integer $q \( s \, m \)$ is independent of the boundary coefficients and of the curve, variety, and form.]
] <thm:weight>

Although the boundary is not prescribed in the theorem, (4.2) already makes $m B$ integral. What remains unbounded on an arbitrary model is the multiplicity of a vertical divisor. The preparation below makes its contribution visible in a dlt fibre.

=== 4.1 Changes of fields and forms <changes-of-fields-and-forms>

We first record the valuation rules used throughout the proof. They extend the boundary-free rules of [28] Lemma 4.2; the boundary does not enter their proof.

#thm([Lemma 4.3.])[
  #emph[Weights of rational relative pluriforms have the following properties.]
  + #emph[They do not depend on the rational uniformizer at the fixed point. For $a in K^(*)$ and $t gt.eq 1$, 
$ w_z \( a phi.alt \) = w_z \( phi.alt \) + frac("ord"_c a, m) \, #h(2em) w_z \( phi.alt^(⊗ t) \) = w_z \( phi.alt \) . $

]
  + #emph[If $F' \/ F$ is finite and $K$ is algebraically closed in $F'$, then the pullback of $phi.alt$ has the same weight over $C$.]
  + #emph[Let $K' \/ K$ be finite Galois, let $C' arrow.r C$ be the associated map of smooth projective curves, and let $c' in C'$ lie above $c$ with ramification index $l$. For a rational uniformizer $u$ at $c'$ and the pullback $phi.alt'$ to $F K' \/ K'$, one has 
#[#set math.equation(numbering: n => "(4.3)")
 $ w_u \( phi.alt' \) = l w_z \( phi.alt \) . $ <eq:weight-base-change>]

]
] <lem:weight-rules>

#proof[
  If $z'$ is another uniformizer, $\( d z' \/ z' \) \/ \( d z \/ z \)$ is a base unit at $c$. This proves independence of $z$. For every valuation in (4.1), $"ord"_E a = \( "ord"_c a \) "ord"_E z$; this gives the first formula, and the tensor-power formula follows by multiplying numerator and denominator.
  For a divisorial valuation $E'$ above $E$ in a finite extension of characteristic-zero fields, with ramification index $a$, the canonical ramification formula gives
  #[#set math.equation(numbering: n => "(4.4)")
   $ "ord"_(E') \( Omega \) + m = a #scale(x: 120%, y: 120%)[\(] "ord"_E \( Omega \) + m #scale(x: 120%, y: 120%)[\)] . $ <eq:weight-finite-orders>]
  Divisorial valuations restrict and prolong to divisorial valuations. When the constant field is unchanged, $"ord"_(E') z = a "ord"_E z$, so the individual quotients, and hence their infima, agree.
  For a curve extension, the pullback of $d z \/ z$ is a unit times $d u \/ u$ at $c'$, and
  $ "ord"_(E') u = a / l "ord"_E z . $
  Equation (4.4) therefore multiplies each quotient by $l$. Regularity of $F \/ K$ makes $F$ and $K'$ linearly disjoint over $K$. The Galois action on their compositum is thus available to move a prolongation to the chosen branch $c'$. Every valuation downstairs has such a prolongation, proving (4.3). ◻
]

=== 4.2 A model on which the weight is exact <a-model-on-which-the-weight-is-exact>

We adapt the curve preparation in [27] Section 4 to obtain an exact divisor equality on a dlt model in any relative dimension. The elementary discrepancy calculation behind the preparation will also be used on semistable models. Write $A \( E \; W \, Delta \)$ for the log discrepancy, so a component of coefficient one has discrepancy zero.

#thm([Lemma 4.4.])[
  #emph[Let $f : W arrow.r C$ be a projective model of $F \/ K$ with $W$ smooth. Put $F_W = f^(*) c$ and $T_W = \( F_W \)_(upright("red"))$. Let $H_W$ be an effective horizontal rational boundary whose coefficients are at most one, and suppose that $T_W + H_W$ has simple normal crossings near $T_W$. For $Omega = phi.alt and \( d z \/ z \)^(⊗ m)$, assume that the horizontal part of $"div"_W \( Omega \) \/ m + H_W$ is effective. Then 
#[#set math.equation(numbering: n => "(4.5)")
 $ w_z \( phi.alt \) = min_(D subset T_W) frac("ord"_D \( Omega \) + m, m "ord"_D z) \, $ <eq:weight-snc-minimum>]

 where $D$ ranges over the prime components of $T_W$.]
] <lem:snc-weight>

#proof[
  Denote the minimum on the right by $w$. After shrinking the curve around $c$, the rational divisor
  #[#set math.equation(numbering: n => "(4.6)")
   $ E_W = 1 / m "div"_W \( Omega \) + T_W + H_W - w F_W $ <eq:weight-error>]
  is effective. For every divisorial valuation over $c$, pullback of this equality gives
  #[#set math.equation(numbering: n => "(4.7)")
   $ frac("ord"_E \( Omega \), m) + 1 = w "ord"_E z + A \( E \; W \, T_W + H_W \) + "ord"_E E_W . $ <eq:weight-discrepancy>]
  The last two terms are nonnegative. Thus every quotient in (4.1) is at least $w$. A component realizing the displayed minimum gives equality. ◻
]

#thm([Proposition 4.5.])[
  #emph[For the data of Theorem 8, with $s > 0$, there is a projective contraction $f : N arrow.r C$ and an effective horizontal rational boundary $H$ such that:]
  + #emph[$N$ is $bb(Q)$-factorial, its generic fibre is geometrically integral and birational to $V$, and $\( N \, T + H \)$ is dlt, where $T = \( f^(*) c \)_(upright("red"))$;]
  + #emph[$K_N + T + H tilde.op_(bb(Q) \, C) 0$;]
  + #emph[for the same field-theoretic form $Omega$ and $w = w_z \( phi.alt \)$, there is an equality of rational divisors near $T$, 
#[#set math.equation(numbering: n => "(4.8)")
 $ 1 / m "div"_N \( Omega \) + T + H = w f^(*) c . $ <eq:prepared-equality>]

]
  #emph[In particular, on the generic fibre, $"div" \( phi.alt \) + m H_eta = 0$. If $H$ has no coefficient-one component, then $\( N_eta \, H_eta \)$ is geometrically klt and $K_(N_eta)$ is $bb(Q)$-Cartier.]
] <prop:prepared>

#proof[
  Choose a smooth projective model $W arrow.r C$ whose generic fibre is a log resolution of $V$. Resolve also the closures of the horizontal boundary and exceptional divisors, together with the fibre over $c$. Let $B_(W_eta)^c$ be the crepant subboundary on the generic resolution, and take $H_W$ to be the closure of its positive part. Its coefficients are at most one, and the horizontal divisor
  $ 1 / m "div"_W \( Omega \) + H_W $
  is effective and exceptional over $V$ on the generic fibre. The markings can be chosen so that $\( W \, T_W + H_W \)$ is log smooth. Lemma 10 computes $w$ and gives the effective error $E_W$ in (4.6) near $c$.
  On the generic fibre, $K_W + T_W + H_W$ is rationally linearly equivalent to an effective exceptional divisor over the normal projective variety $V$. Its Kodaira dimension is zero: a rational function whose poles are supported on that exceptional divisor descends to a regular function on $V$, hence is constant. In particular it has a section in a sufficiently divisible degree. Lemma 6 therefore gives a terminating MMP over $C$ for $K_W + T_W + H_W$. Write its output as $\( N \, T + H \)$. No divisors are extracted, so the transform of $T_W$ is precisely $\( f^(*) c \)_(upright("red"))$. The generic function field is unchanged and is regular over $K$; Stein factorization consequently makes $f : N arrow.r C$ a contraction.
  Discrepancy comparison preserves the divisible generic-fibre section spaces through these steps. Thus the generic adjoint on $N$ still has Kodaira dimension zero. Its relative semiample contraction has zero-dimensional image on the generic fibre. The image is therefore a normal curve finite over $C$. Connectedness of the fibres makes its function field equal to $K$, so this curve is $C$. This proves $K_N + T + H tilde.op_(bb(Q) \, C) 0$.
  Pushforward of (4.6) now gives, near the marked fibre,
  #[#set math.equation(numbering: n => "(4.9)")
   $ 1 / m "div"_N \( Omega \) + T + H = w f^(*) c + E_N \, #h(2em) E_N gt.eq 0 . $ <eq:prepared-error>]
  The restriction of $E_N$ to the generic fibre is effective and $bb(Q)$-linearly trivial, hence zero. Thus $E_N$ is vertical, and it is $bb(Q)$-linearly trivial over $C$. Such a divisor is locally a rational multiple of a fibre. Indeed, a relative principal trivialization has vertical divisor, so its defining rational function has neither zeros nor poles on the normal projective generic fibre. It belongs to $K^(*)$, because that fibre has no new global functions. Consequently $E_N = a f^(*) c$ near $c$ for some rational number $a$.
  Applying the discrepancy calculation (4.7) to (4.9) shows that all valuation quotients are at least $w + a$: the pair $\( N \, T + H \)$ is lc. Each component of $T$ has coefficient one, so its quotient is exactly $w + a$. The valuation definition still gives $w$, since the function field and form have not changed. Hence $a = 0$, proving (4.8).
  The generic restriction of that equality gives the claimed trivialization. A dlt pair with no coefficient-one boundary is klt; generic restriction, checked on a resolution, preserves this statement after algebraic closure in characteristic zero. Finally, $bb(Q)$-factoriality of $N$ makes $K_(N_eta)$ $bb(Q)$-Cartier. ◻
]

=== 4.3 Residue and the reduction to klt fibres <residue-and-the-reduction-to-klt-fibres>

Suppose the prepared model has a coefficient-one horizontal component. Residue lowers the relative dimension, but that component may acquire new constants. The arithmetic Stein-degree theorem controls precisely this finite extension.

#thm([Lemma 4.6.])[
  #emph[Let $f : \( N \, T + H \) arrow.r C$ be as in Proposition 11, with relative dimension $s gt.eq 1$, and suppose that $S$ is a coefficient-one component of $H$. Factor $S arrow.r C$ as 
$ S arrow.r^h C_S arrow.r^nu C \, $

 where $h$ is a contraction and $nu$ is finite. Then $C_S$ is a smooth projective curve and 
$ deg nu lt.eq D_s $

 for an integer $D_s$ depending only on $s$. For every $c' in C_S$ above $c$, with ramification index $e$, there are data satisfying Theorem 8 in relative dimension $s - 1$ and degree $m$ over $bb(C) \( C_S \)$, with a rational form $phi.alt_S$ whose weight is 
#[#set math.equation(numbering: n => "(4.10)")
 $ w_u \( phi.alt_S \) = e w_z \( phi.alt \) $ <eq:residue-weight>]

 for a rational uniformizer $u$ at $c'$.]
] <lem:residue-reduction>

#proof[
  Dlt adjunction [22] makes $S$ normal and gives an effective rational different $Theta$ such that $\( S \, Theta \)$ is lc. Its Stein curve is normal and hence smooth. The generic pair $\( N_eta \, H_eta \)$ is normal, projective and lc, has $H^0 \( cal(O)_(N_eta) \) = K$, and has $K_(N_eta) + H_eta tilde.op_(bb(Q)) 0$. Its prime boundary component $S_eta$ has coefficient one. Theorem 4, applied with coefficient lower bound $1$, bounds the relative algebraic closure of $K$ in $K \( S_eta \)$. This field is exactly $bb(C) \( C_S \)$, so it gives the asserted $D_s$.
  At the generic point of $S$, the absolute form $Omega$ has a logarithmic pole of order $m$. Choose a local equation $x$ of $S$ and a rational $s$-form $beta$, regular at the generic point of $S$, whose restriction generates its canonical line. Write
  $ Omega = a #scale(x: 120%, y: 120%)[\(] d x \/ x and beta #scale(x: 120%, y: 120%)[\)]^(⊗ m) \, #h(2em) a upright(" a unit along ") S . $
  Its degree-$m$ Poincaré residue is the rational $m$-canonical form
  $ Omega_S = \( a \|_S \) \( beta \|_S \)^(⊗ m) . $
  This construction is independent of the local equation and commutes with tensor powers. Adjunction and (4.8) give the equality of actual divisors
  #[#set math.equation(numbering: n => "(4.11)")
   $ 1 / m "div"_S \( Omega_S \) + Theta = w \( f \|_S \)^(*) c $ <eq:residue-divisor>]
  near the marked fibre. To verify the identity in this exact degree, take a tensor power for which the ambient adjunction is Cartier and apply the pluricanonical adjunction isomorphism. The resulting divisor identity is that same positive multiple of (4.11), and can be divided by it. This uses the rational degree-$m$ residue already defined at the generic point; it does not require a uniform Cartier index along $S$.
  The generic fibre of $h$ is normal, projective and geometrically integral. Its pair induced by $Theta$ is geometrically lc, as one sees by generic restriction of a resolution in characteristic zero. Dividing $Omega_S$ by $\( d u \/ u \)^(⊗ m)$ in the canonical-line identification gives a rational relative form $phi.alt_S$. The generic restriction of (4.11) is exactly
  $ "div" \( phi.alt_S \) + m Theta_(eta_S) = 0 \, #h(2em) eta_S = "Spec" bb(C) \( C_S \) . $
  It remains to compute the weight at $c'$.
  Near $h^(- 1) \( c' \)$, the right side of (4.11) is $e w h^(*) c'$. For every valuation over $c'$ the corrected order is consequently
  $ frac("ord"_E \( Omega_S \), m) + 1 = e w "ord"_E u + A \( E \; S \, Theta \) . $
  Log canonicity gives $w_u \( phi.alt_S \) gt.eq e w$. The fibre of $h$ has a prime divisor, and any such divisor is a component of the intersection of $S$ with $T$. At its generic point the two coefficient-one branches of the dlt pair are simple normal crossings; adjunction gives coefficient one in $Theta$. The quotient for that divisor is $e w$, which proves (4.10). ◻
]

#proof[
  When $s = 0$, geometric integrality gives $V = "Spec" K$, and $phi.alt in K^(*)$. The definition gives $w_z \( phi.alt \) = "ord"_c \( phi.alt \) \/ m$, so $q \( 0 \, m \) = m$ works.
  Proceed by induction on $s$. Use Proposition 11. If its horizontal boundary has a coefficient-one component, Lemma 12 and the induction hypothesis give
  $ q \( s - 1 \, m \) e w_z \( phi.alt \) in bb(Z) quad upright("for some ") 1 lt.eq e lt.eq D_s . $
  Thus $q \( s - 1 \, m \) "lcm" \( 1 \, dots.h \, D_s \)$ clears the weight in this case. Otherwise the prepared generic pair is geometrically klt with $bb(Q)$-Cartier canonical divisor. Proposition 24, proved independently of this induction below, gives a clearing integer depending only on $s \, m$. Taking a common multiple of these two integers completes the induction. ◻
]

== 5 Product covers and semilinear factor actions <sec:blocks>

We now prepare the klt case of the curve weight bound. A finite cover decomposes a klt log Calabi–Yau pair into factors with controlled holomorphic forms. The cover need not be Galois, however, and its Galois closure need not be a product. The purpose of this section is to retain the factor directions on that closure and to show that a bounded power of each finite transformation acts regularly on suitable finite covers of the individual factors. This is the comparison construction of [28] Lemma 3.5, extended to a rationally connected factor carrying the boundary.

=== 5.1 The factors and their automorphisms <the-factors-and-their-automorphisms>

A finite surjective morphism between normal varieties is #emph[quasi-étale] if it is étale in codimension one. Over an algebraically closed field of characteristic zero, purity implies that such a morphism is étale over the smooth locus of its target. For a normal variety $F$, we write $Omega_F^(\[ j \])$ for the reflexive extension of $j$-forms from its smooth locus.

#thm([Proposition 5.1.])[
  (Product decomposition).  #emph[Let $\( V \, B \)$ be a projective klt pair over $bb(C)$ with $B gt.eq 0$, $K_V$ rational Cartier, and $K_V + B tilde.op_(bb(Q)) 0$. There is a finite quasi-étale cover $pi : P arrow.r V$ and a decomposition 
$ \( P \, pi^(*) B \) tilde.eq \( F \, H \) times A times product_j Y_j times product_k Z_k \, $

 where $\( F \, H \)$ is a rationally connected klt log Calabi–Yau pair, $A$ is an abelian variety, and the $Y_j$ and $Z_k$ are respectively irreducible Calabi–Yau and irreducible holomorphic symplectic varieties in the singular Beauville–Bogomolov decomposition. All factors are $bb(Q)$-Gorenstein. Point factors are omitted, and the boundary is pulled back entirely from $F$.]
] <prop:product-cover>

#proof[
  The product decomposition, including its assertion about the boundary, is [24] Theorem 1.3. Its boundary-free factors have the stated properties by the singular Beauville–Bogomolov theorem [17] Definition 1.4 and Theorem 1.5. Since $K_V$ is rational Cartier, quasi-étaleness makes $K_P$ rational Cartier. Restricting the canonical sheaf in product charts, with the complementary points smooth, gives the same property on every factor. Restriction of $K_P + pi^(*) B tilde.op_(bb(Q)) 0$ gives $K_F + H tilde.op_(bb(Q)) 0$. ◻
]

We use two properties of the nonabelian boundary-free factors. They and all their connected normal finite quasi-étale covers have canonical singularities and Cartier trivial canonical divisor. On each such cover the reflexive form algebra is generated by a top form in the Calabi–Yau case and by the pulled-back symplectic form in the symplectic case [17] Definition 1.4. In particular there are no reflexive one-forms or vector fields: contraction with a volume form, or with the symplectic form, proves the latter assertion. Connected normal finite quasi-étale covers of an abelian variety are étale by purity and are again abelian varieties after an origin is chosen.

For the rationally connected factor, vector fields must be required to preserve the boundary. If $D$ is a reduced Weil divisor on a normal variety, $cal(T)_F \( - log D \)$ denotes the subsheaf of derivations preserving the reduced ideal of every component of $D$. This condition can be checked at height-one primes and then extended reflexively.

#thm([Lemma 5.2.])[
  (Automorphisms of a rationally connected pair).  #emph[Let $\( F \, H \)$ be a rationally connected projective klt pair over $bb(C)$ with $H gt.eq 0$ and $K_F + H tilde.op_(bb(Q)) 0$. Then 
$ H^j \( F \, cal(O)_F \) = 0 quad \( j > 0 \) \, #h(2em) H^0 \( F \, Omega_F^(\[ 1 \]) \) = 0 \, #h(2em) H^0 #scale(x: 120%, y: 120%)[\(] F \, cal(T)_F \( - log "Supp" H \) #scale(x: 120%, y: 120%)[\)] = 0 . $

 For every ample line bundle $L$, the group of automorphisms of $\( F \, H \)$ preserving $L$ is finite.]
] <lem:rc-aut>

#proof[
  A smooth projective resolution of $F$ is rationally connected; one may lift rational curves through general smooth points, or use the rational connectedness results for klt varieties in [14]. Its positive-degree structure-sheaf cohomology vanishes. Klt singularities are rational, so the same is true on $F$. The extension theorem for klt differential forms [12] then gives the asserted vanishing of reflexive one-forms.
  Choose $a > 0$ and a rational $a$-canonical form $theta$ with
  $ "div" \( theta \) + a H = 0 . $
  On the smooth locus, the density $\| theta \|^(2 \/ a)$ defines a positive measure. Pull it to a log resolution. Every divisorial order of the pulled-back form is strictly greater than $- a$, because the pair is klt. In SNC coordinates this is exactly the local integrability condition for the density. Thus it defines a finite nonzero measure $mu$ on $F$, with no mass on proper algebraic subsets.
  An automorphism preserving $H$ multiplies $theta$ by a nonzero constant. Its pullback therefore multiplies $mu$ by a positive constant; comparison of total masses makes that constant one. Consequently every automorphism of the pair preserves $mu$.
  There can be no nontrivial additive or multiplicative algebraic one-parameter subgroup of such automorphisms. Indeed, iterate the element $1 in bb(G)_a$ or $2 in bb(G)_m$ on a nonfixed point. The orbit map extends across infinity by projectivity, so these iterates converge to a subgroup-fixed point. The nonfixed locus has full $mu$-measure. Such convergence contradicts Poincaré recurrence for the resulting invertible transformation of the finite measure space $\( F \, mu \)$.
  The group preserving $L$ and $H$ is a linear algebraic group: a sufficiently high power of $L$ realizes it as a closed subgroup of a projective linear group. Every positive-dimensional linear algebraic group over $bb(C)$ contains a copy of $bb(G)_a$ or $bb(G)_m$, so this group is finite. Moreover, the identity component of the automorphism group preserving $H$ preserves $L$. Indeed its variation of $L$ lies in $"Pic"^0 \( F \)$, which is zero because $H^1 \( F \, cal(O)_F \) = 0$. Its Lie algebra therefore vanishes. In characteristic zero this Lie algebra is precisely the space of vector fields tangent to $"Supp" H$: a connected group preserving the support fixes its components and their coefficients. This proves the last vanishing. ◻
]

#thm([Lemma 5.3.])[
  (A choice stable under further covers).  #emph[The cover in Proposition 13 can be chosen so that every connected normal finite quasi-étale cover of $F$ is rationally connected. On every such cover, with the pulled-back boundary, the conclusions of Lemma 14 hold.]
] <lem:minimal-rc>

#proof[
  Among all covers in Proposition 13, choose one with $dim F$ minimal, taking this dimension to be zero when the factor is absent. Let $F' arrow.r F$ be a connected normal finite quasi-étale cover. The pulled-back pair is klt and log Calabi–Yau, and $K_(F')$ is rational Cartier. Apply Proposition 13 to it. If $F'$ were not rationally connected, the resulting product would have a positive-dimensional boundary-free part: otherwise rational connectedness would descend from its rationally connected factor along a finite surjection. Replacing $F$ by this product would therefore give a product cover of $V$ with a smaller rationally connected factor, a contradiction. Lemma 14 now applies to $\( F' \, H' \)$. ◻
]

=== 5.2 Separating finite actions on a comparison cover <separating-finite-actions-on-a-comparison-cover>

We refer to the positive-dimensional factors just described as #emph[blocks], collecting the whole abelian part into one block. The rationally connected block is always chosen as in Lemma 15. For a block over a nonclosed field, the corresponding properties under connected normal finite quasi-étale covers, including the form and vector-field vanishings above, are imposed after algebraic closure. In the application the field is a finite extension of a complex curve function field. Its algebraic closure is abstractly isomorphic to $bb(C)$, so the preceding complex projective results apply, and their finite algebraic data descend to a finite extension.

A #emph[semilinear automorphism] of a variety over a field $k$ is an automorphism together with an automorphism of $k$ over which it lies; equivalently, it is a $k$-isomorphism to the corresponding field conjugate. Differentials below are relative to $k$.

#thm([Proposition 5.4.])[
  (Semilinear comparison with the blocks).  #emph[Let $k$ be a characteristic-zero field, and let $P = product_(i in I) P_i$ be a product of geometrically integral projective blocks as above. Let $H_P$ be the pullback of the boundary on its rationally connected block, or zero if that block is absent. Suppose 
$ rho : R arrow.r P $

 is a finite quasi-étale morphism from a geometrically integral normal variety, and a finite group $G$ acts semilinearly on $\( R \, H_R \)$, where $H_R = rho^(*) H_P$. Put $s = dim R > 0$. There are normal geometrically integral varieties $R_i$, finite quasi-étale maps $R_i arrow.r P_i$, and a finite quasi-étale map $R arrow.r product_i R_i$ such that every $g^(s !)$, for $g in G$, induces regular semilinear automorphisms of the pairs $\( R_i \, H_i \)$. Here $H_i$ is the pulled-back boundary on the rationally connected block and is zero on the other blocks. The projections from $R$ are equivariant for these automorphisms. Each geometric $R_i$ has the same block properties as $P_i$.]
] <prop:semilinear>

#proof[
  We first show that a bounded power preserves the factor directions on $R$. We then recover their constant fields and show that the resulting birational actions on the finite factor covers are regular.
  #emph[The factor directions.] On a smooth big open where $rho$ is étale, the product tangent directions pull back to a splitting. Reflexive extension gives
  $ cal(T)_R = xor.big_(i in I) cal(E)_i . $
  Consider the finite-dimensional $k$-algebra
  $ cal(A) = { u in "End"_R \( cal(T)_R \) : u \( cal(T)_R \( - log "Supp" H_R \) \) subset.eq cal(T)_R \( - log "Supp" H_R \) } . $
  Every projection onto $cal(E)_i$ belongs to $cal(A)$. We claim that every member of $cal(A)$ has zero entries between distinct summands.
  This may be checked after extending $k$ to an algebraic closure. Fix general smooth points in all but one factor, say $P_i$, and take the corresponding slice of $R$. After shrinking the space of complementary points, its connected components are normal and finite quasi-étale over $P_i$. To see this, the generic slice is normal by localization and geometrically normal in characteristic zero. The projection to the complementary factors is projective, so generic flatness and openness of geometric normality give normality of the entire fibres after shrinking that base. Every component has dimension $dim P_i$: the fibre-dimension inequality gives the lower bound, and finiteness over $P_i$ gives the upper bound. Its finite image is therefore all of $P_i$. The closed subset omitted from the étale product charts has codimension at least two on a general slice: its components not dominating the complementary factors can be avoided, and the others have fibre dimension at most $dim P_i - 2$. On its smooth big open, $cal(E)_i$ is the tangent sheaf of the slice, and every complementary summand is trivial.
  If either of two distinct summands is nonabelian and boundary-free, slice in that direction. A homomorphism in either direction gives reflexive one-forms or vector fields on a finite quasi-étale cover of that block, and hence vanishes. The only remaining possibility is an abelian and a rationally connected summand. Slice in the rationally connected direction. An entry from this summand to the abelian one gives reflexive one-forms. An entry in the reverse direction gives vector fields tangent to the pulled-back boundary, because the endomorphism preserves the log tangent subsheaf. Both vanish by Lemmas 14 and 15. These slices cover a dense open of $R$, which proves the claim.
  The block projections are therefore central idempotents of $cal(A)$. Its primitive central idempotents give nonzero direct summands of $cal(T)_R$, each of positive generic rank, so there are at most $s$ of them. Conjugation by $G$ acts on $cal(A)$, since $G$ preserves the pair; it is a ring automorphism even for a semilinear action. It permutes these primitive central idempotents. Thus $g^(s !)$ fixes every one of them and consequently every block projection. This argument takes place over $k$ itself and requires no extension of $G$ to an algebraic closure.
  #emph[The finite factor covers.] Let $k \( R_i \)$ be the relative algebraic closure of $k \( P_i \)$ in $k \( R \)$, and let
  $ R arrow.r R_i arrow.r P_i $
  be the Stein factorization of the projection. At the generic point of $R$, the complementary directions span $"Der"_(k \( P_i \)) k \( R \)$. In characteristic zero their common constants are exactly $k \( R_i \)$. Preservation of the directions therefore gives semilinear birational transformations of $R_i$ under every $g^(s !)$.
  The fields $k \( R_i \)$ are regular over $k$, since they lie in the regular extension $k \( R \) \/ k$; hence $R_i$ is geometrically integral. The extension obtained by adjoining the complementary product factors to $k \( P_i \)$ is regular and linearly disjoint from $k \( R_i \) \/ k \( P_i \)$. Consequently the normal product $R_i times product_(j eq.not i) P_j$ is an intermediate finite cover of $P$. Ramification over a prime of $P_i$ would persist on this product and on a prolongation to $R$, contradicting quasi-étaleness of $R arrow.r P$. This proves that $R_i arrow.r P_i$ is quasi-étale.
  The product map $R arrow.r product_i R_i$ is proper with finite fibres, because its composite to $P$ is finite. It is therefore finite. Its image has the dimension of the integral target, so it is surjective, and the same ramification argument makes it quasi-étale. In particular every fibre of $R arrow.r R_i$ has dimension $s - dim R_i$.
  #emph[Regularity of the factor actions.] Fix a transformation preserving the factor directions. The two morphisms from $R$ to $R_i$—the projection and its composition with the transformation—map $R$ onto the closed graph $Gamma_i$ of the induced birational factor transformation. Their target is replaced by its field conjugate in the semilinear case. Every fibre of $R arrow.r Gamma_i$ has dimension at least $s - dim R_i$. A positive-dimensional fibre of either graph projection would therefore give a fibre of $R arrow.r R_i$ of larger dimension. Both graph projections are thus finite and birational; normality of their targets makes them isomorphisms. This proves regularity.
  Finally, equality of divisors on $product_i R_i$ can be checked after pullback along the finite surjection from $R$. Since its entire boundary is pulled back from the rationally connected factor, invariance of $H_R$ implies invariance of that factor’s boundary. Hence the factor actions preserve their boundaries. The asserted geometric properties of the $R_i$ follow from their being quasi-étale covers of the chosen blocks. ◻
]

After the bounded power, the action on $product_i R_i$ is the product of its regular factor actions. The factor degrees and the orders of these automorphisms may be unbounded.

=== 5.3 Block forms over a curve field <block-forms-over-a-curve-field>

We now collect the exact data needed for degeneration, including the degrees of the log pluriforms on the factors.

#thm([Corollary 5.5.])[
  (Comparison cover and block forms).  #emph[Let $K = bb(C) \( C \)$ for a smooth projective curve $C$. Let $\( V \, B \)$ be a geometrically integral normal projective $s$-fold pair over $K$, with $s > 0$, geometrically klt, $B gt.eq 0$, and $K_V$ rational Cartier. Suppose that, for an integer $m > 0$, a rational $m$-canonical form $phi.alt$ satisfies $"div" \( phi.alt \) + m B = 0$.]
  #emph[There is a finite Galois extension $K_1 \/ K$, a geometrically integral normal projective variety $R \/ K_1$, and finite quasi-étale maps 
#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$R$])
  content((2.519, 0), [$product_(i in I) R_i$])
  content((5.501, 0), [$product_(i in I) P_i$])
  content((8.284, 0), [$V_(K_1)$])
  line((0.336, 0), (1.721, 0), mark: (end: ">"))
  line((3.317, 0), (4.703, 0), mark: (end: ">"))
  line((6.299, 0), (7.684, 0), mark: (end: ">"))
})

 with the following properties. The field $K_1 \( R \)$ is finite Galois over $K \( V \)$; its Galois group acts semilinearly on $R$, maps onto $"Gal" \( K_1 \/ K \)$, and preserves the pulled-back pair. For each element $g$ of this group, $g^(s !)$ induces regular semilinear actions on the pairs $\( R_i \, H_i \)$. There is at most one rationally connected block, chosen with the cover-stability of Lemma 15, and all other blocks are boundary-free of the types in Proposition 13.]
  #emph[Put $p_i = m$ on the rationally connected block and $p_i = 1$ on the other blocks. There are rational $p_i$-canonical forms $eta_i$ over $K_1$ satisfying 
#[#set math.equation(numbering: n => "(5.1)")
 $ "div" \( eta_i \) + p_i H_i = 0 . $ <eq:block-trivializations>]

 On $R$, after pulling back all forms, one has 
#[#set math.equation(numbering: n => "(5.2)")
 $ phi.alt = a and.big_(i in I) eta_i^(⊗ m \/ p_i) #h(2em) upright("for some ") a in K_1^(*) . $ <eq:block-product-form>]

 The wedge uses any fixed ordering of the blocks and the natural identification of their relative canonical lines.]
] <cor:block-forms>

#proof[
  Apply Proposition 13 and Lemma 15 to the geometric generic pair, and define the resulting product cover over a finite extension of $K$. Take a Galois closure $L$ of its total function field over the original field $K \( V \)$, and let $K_1$ be the relative algebraic closure of $K$ in $L$. The extension $K \( V \) \/ K$ is regular. It follows that $K_1 \/ K$ is finite Galois and that restriction maps $"Gal" \( L \/ K \( V \) \)$ onto $"Gal" \( K_1 \/ K \)$. Let $R$ be the normalization of $V_(K_1)$ in $L$. Since $K_1$ is algebraically closed in $L$, $R$ is geometrically integral.
  Over an algebraic closure of $K$, the conjugate product covers are all étale over the smooth locus of the original variety. Their compositum, and hence the Galois closure, has the same property. Thus $R$ is finite quasi-étale over the product and over $V_(K_1)$. Its Galois transformations preserve the crepant pullback of $B$. Proposition 16 now constructs the $R_i$ and supplies the factor actions.
  The boundary-free blocks and their covers have Cartier trivial canonical divisor over the algebraic closure, so they possess degree-one volume forms there. Still over the algebraic closure, on the rationally connected factor, restrict the pulled-back degree-$m$ trivialization from $V$ to the product factor, choosing the complementary points smooth. This gives a degree-$m$ log trivialization; pull it back to its Stein block $R_i$.
  Here $p_i H_i$ is integral: on the rationally connected block this follows from the integrality of $m B$, quasi-étale pullback, and restriction to the product factor; on the other blocks $H_i = 0$. Thus $p_i K_(R_i) + p_i H_i$ is an integral Weil divisor whose divisorial sheaf becomes trivial after algebraic closure. Lemma 5 descends this trivialization in degree $p_i$, giving (5.1). The product in (5.2) and the pullback of $phi.alt$ have the same divisor on the normal projective variety $R$. Their ratio has neither zeros nor poles and is a global unit. Since $R$ is geometrically integral, that unit belongs to $K_1^(*)$. ◻
]

For later use, put $L = K_1 \( R \)$ and let $K_2 supset K_1$ be a finite extension Galois over $K$, and choose a branch over a fixed point of $C$ in the corresponding tower of curves. The inertia groups are cyclic and the upper one surjects onto the lower one. Choose generators of these inertia groups, viewed as elements $tau_2 in "Gal" \( K_2 \/ K \)$ and $tau_1 in "Gal" \( K_1 \/ K \)$ with $tau_2 \|_(K_1) = tau_1$, and choose a lift $g in "Gal" \( L \/ K \( V \) \)$ of $tau_1$. Since $L \/ K_1$ is regular, it is linearly disjoint from $K_2 \/ K_1$. The compatible pair $\( g \, tau_2 \)$ therefore defines a finite-order automorphism $g_2$ of $L K_2$. The base change $R_(K_2)$ is geometrically integral, and $g_2^(s !)$ acts regularly on every base-changed block by the action of $g^(s !)$ together with $tau_2^(s !)$ on its constants. This supplies the compatible inertia lift and block actions after the further base changes used for semistable reduction.

== 6 Degeneration characters and the klt weight bound <sec:degeneration>

For a klt generic pair, Section 5 supplies a finite comparison cover and separates the action of a bounded power of inertia into actions on its factors. We now pass to semistable models of these factors. The degree of the necessary curve cover is unrestricted. The point of this section is to bound the characters on normalized logarithmic forms; those bounds will cancel the unrestricted ramification in the weight calculation.

=== 6.1 Equivariant semistable models <equivariant-semistable-models>

We first record the form of semistable reduction that we use. A marked horizontal divisor in this statement may include both a boundary and exceptional divisors of a generic log resolution.

#thm([Lemma 6.1.])[
  (Marked semistable reduction).  #emph[Let $C_1$ be a smooth projective complex curve with a marked point $c_1$, and let a finite cyclic group act on $C_1$, fixing $c_1$. Consider finitely many geometrically integral normal projective varieties over $bb(C) \( C_1 \)$, each with a compatible semilinear action of this group and an invariant finite set of horizontal divisor markings. After a finite extension of curve fields and replacement by compatible finite-order lifts of the actions, there are equivariant smooth projective models for which the marked fibre is reduced simple normal crossings and its union with the horizontal markings is simple normal crossings. The generic fibres may be log resolutions. If a given generic fibre is already smooth and has no markings requiring resolution, it can be left unchanged.]
] <lem:marked-semistable>

#proof[
  Take equivariant projective models by closing graphs of the finitely many translates, and resolve equivariantly, including the reduced marked fibre and the horizontal markings. Near the marked fibre the map to the curve is toroidal: in local coordinates a uniformizer is a monomial in the vertical coordinates, up to a unit. The horizontal markings are among the remaining coordinates. Root extraction on the base, normalization, and the projective subdivision theorem of [19] Chapter IV, Section 3 give the reduced SNC fibre. The horizontal coordinates remain transverse throughout this construction.
  Here equivariance can be retained in the subdivision step. First barycentrically subdivide the finite vertical cone complex so that stabilizers fix each ray of any stabilized cone. They then act trivially on that cone’s lattice. After removing face self-identifications by further such subdivision, choose compatible projective subdivisions on orbit representatives and pull them back. The lattices used on the combinatorial quotient are the original cone lattices, not the invariant lattices of a geometric quotient. The regular height-one subdivision theorem after sufficiently divisible ramification applies to this finite complex. It applies with identical subdivisions to the copies of strata that split after normalization.
  This is the equivariant marked construction used in [28] Section 4; the marked resolution and finite-group extension are also described in [23] Paragraphs 16 and 21. Taking a common further extension handles the finite list of models. One may take a Galois closure and further roots of an original local parameter, so that the extension remains Galois over any specified original curve field. Compatible automorphisms extend to the compositum; they have finite order. Equivariant resolution away from the marked fibre gives projective models over the complete curve. ◻
]

Apply this lemma to the factors from Corollary 17. Let $C' arrow.r C$ be the resulting Galois curve cover, let $c'$ lie over $c$, and write

$ K' = bb(C) \( C' \) \, #h(2em) l = e \( c' \/ c \) \, #h(2em) b = s ! . $

The compatible lift constructed after Corollary 17 gives a finite-order automorphism $g$ of the comparison cover whose base action generates inertia. Its power $sigma = g^b$ acts separately on the factors.

Choose a rational uniformizer $u$ at $c'$. Its leading transformation under $g$ is

#[#set math.equation(numbering: n => "(6.1)")
 $ g^(*) u tilde.op zeta u \, $ <eq:inertia-parameter>]

where $zeta$ is a primitive $l$th root of unity. Only the leading coefficient is used; it is unnecessary to require $g^(*) u = zeta u$ as an equality of rational functions.

For a factor $\( R_i \, H_i \)$, let $p_i = m$ on the rationally connected factor and $p_i = 1$ on the other factors. We have a rational $p_i$-canonical form $eta_i$ satisfying

$ "div" \( eta_i \) + p_i H_i = 0 $

on its generic normal model. On the semistable resolution choose the horizontal boundary $hat(H)_i$ to equal the strict transform of $H_i$ plus the positive parts of the horizontal crepant exceptional coefficients. These coefficients are less than one. On the abelian and nonabelian Beauville–Bogomolov factors we have $hat(H)_i = 0$, because their singularities are canonical.

#thm([Lemma 6.2.])[
  (Normalization and products).  #emph[Multiplying each $eta_i$ by an integral power of $u$, one can arrange $w_u \( eta_i \) = 0$. For these normalized forms, the exterior product in common degree $m$ has weight zero. On the comparison cover there is a base function $a in K' ""^(*)$ such that 
#[#set math.equation(numbering: n => "(6.2)")
 $ phi.alt = a and.big_i eta_i^(⊗ m \/ p_i) \, #h(2em) l thin w_z \( phi.alt \) = frac("ord"_(c') a, m) . $ <eq:product-weight>]

 Here the exterior product denotes the tensor power of the relative canonical product identification, with a fixed order of factors.]
] <lem:normalized-product>

#proof[
  On a semistable model every component of the marked fibre has multiplicity one. The computation of weights on a log-smooth model in Lemma 10 shows that $p_i w_u \( eta_i \)$ is an integer. Multiplication by $u^n$ changes the weight by $n \/ p_i$, so normalization is possible. The logarithmic divisor
  $ "div" #scale(x: 120%, y: 120%)[\(] eta_i and \( d u \/ u \)^(⊗ p_i) #scale(x: 120%, y: 120%)[\)] + p_i \( T_i + hat(H)_i \) $
  is then effective near the marked fibre, and its coefficient on at least one component of $T_i$ is zero.
  We check the product assertion before passing to the comparison cover. On the fibre product of the semistable models, the local vertical equations have the form
  $ product_j x_(i j) = u quad upright("for each factor ") i . $
  Horizontal coordinates are independent. Include their SNC markings in the toroidal boundary. Relative logarithmic top forms multiply over the logarithmic curve with exactly one base differential $d u \/ u$ in the absolute form. The product therefore acquires no additional power of $u$. In logarithmic coordinates the resulting form has at most full logarithmic poles. This remains true on toroidal resolutions, since their logarithmic canonical generators pull back to logarithmic generators. Thus its weight is nonnegative.
  For equality, choose on each factor a fibre component of zero logarithmic order and a general point away from all other markings. The morphism to the curve is smooth there. The product of these open subsets supplies a fibre component of zero logarithmic order, so the weight is zero. Finite pullback to the comparison cover preserves this weight by Lemma 9.
  On its normal proper generic fibre, the pulled-back product and $phi.alt$ have the same divisor: both trivialize the same degree-$m$ log canonical divisor. Their ratio has zero divisor and hence lies in the constant field $K'$. The scalar rule and the ramification rule for weights now give (6.2). ◻
]

Since $sigma$ preserves each factor pair, write

$ sigma^(*) eta_i = d_i eta_i \, #h(2em) d_i in K' ""^(*) . $

Both sides have weight zero, hence $"ord"_(c') d_i = 0$. Put $lambda_i = d_i \( c' \)$. Finite order of $sigma$ and the fact that it fixes $c'$ imply that each $lambda_i$ is a root of unity. The form $phi.alt$ descends to the original field and is fixed by $g$. Taking leading coefficients of its transformation in (6.2) yields

#[#set math.equation(numbering: n => "(6.3)")
 $ zeta^(b "ord"_(c') a) product_i lambda_i^(m \/ p_i) = 1 . $ <eq:character-cancellation>]

There is no permutation sign in this formula: $sigma$ preserves each ordered factor.

We have reduced the weight problem to one concrete question: can the orders of the $lambda_i$ be bounded using only $s$ and $m$? The following subsections treat abelian factors and the remaining factors separately.

=== 6.2 Abelian factors <abelian-factors>

#thm([Lemma 6.3.])[
  (The abelian character).  #emph[For an abelian factor of dimension $h$, the order of its normalized character $lambda_i$ is bounded in terms of $h$ alone.]
] <lem:abelian-character>

#proof[
  Here $p_i = 1$. On the semistable model the normalized form is a regular relative logarithmic top form. It is not divisible by $u$ as such a section, since its logarithmic order is zero on some fibre component. Consequently it frames the extended top Hodge line. This identification is the semistable comparison between logarithmic de Rham cohomology and Deligne’s canonical extension, with nilpotent residue [7,29]. The action on the central fibre of this line is $lambda_i$.
  The integral local system in degree $h$, modulo torsion, has rank $binom(2 h, h)$. Indeed its smooth fibres are abelian varieties; our models were unchanged on the smooth generic fibre. In a small disc choose an analytic coordinate linearizing the finite base action. On the universal cover of the punctured disc the action, combined with parallel transport, is an integral matrix $A$ commuting with the unipotent monodromy $T$. Since the geometric action has finite order, a power of $A$ is a power of $T$.
  Passing from flat frames to canonical-extension frames changes $A$ by a commuting factor of the form $exp \( c log T \)$, which is unipotent. The eigenvalues are therefore unchanged. Since the Hodge line is invariant, $lambda_i$ is an eigenvalue of the integral matrix $A$. If its order is $n$, its cyclotomic polynomial divides the characteristic polynomial of $A$, and
  $ phi \( n \) lt.eq binom(2 h, h) . $
  Only finitely many positive integers satisfy this inequality. Their least common multiple bounds and annihilates the character orders in the stated dimension. ◻
]

=== 6.3 An equivariant model with a log generator <an-equivariant-model-with-a-log-generator>

For the remaining factors the ordinary Betti numbers are not bounded by the argument. Instead we use the much smaller structure-sheaf cohomology and a normal component of a special fibre. This requires a model on which the normalized logarithmic form generates everywhere near that fibre. An exact log trivialization in degree $p_i$ then has a residue in the same degree on a normal fibre component. The coefficients of its different must consequently lie in ${ 0 \, 1 \/ p_i \, dots.h \, 1 }$, allowing the normal index theorem to bound the residue character.

#thm([Lemma 6.4.])[
  (Equivariant good model).  #emph[Let $\( R_i \, H_i \)$ be a rationally connected or nonabelian Beauville–Bogomolov factor of dimension $h > 0$ above, with $p_i in { 1 \, m }$ and normalized form $eta_i$. There is a projective equivariant model $Y arrow.r C'$ such that, near $c'$,]
  + #emph[$Y$ is klt and its fibre $T = Y_(c')$ is reduced Cartier;]
  + #emph[with $J$ the transformed horizontal boundary, $\( Y \, T + J \)$ is dlt and $K_Y + J$ is semiample over $C'$;]
  + #emph[for $Omega_i = eta_i and \( d u \/ u \)^(⊗ p_i)$, 
#[#set math.equation(numbering: n => "(6.4)")
 $ "div"_Y \( Omega_i \) + p_i \( T + J \) = 0 . $ <eq:log-generator>]

]
  #emph[The geometric generic fibre is birational to $R_i$.]
] <lem:equivariant-good>

#proof[
  Start with the equivariant smooth semistable model $Q$ from Lemma 18. The pair $\( Q \, hat(H)_i \)$ is klt; adding the reduced fibre $Q_(c')$ gives a dlt pair. Since this fibre is a base pullback, a $\( K_Q + hat(H)_i \)$-negative program over the curve is also negative for the adjoint with this fibre added.
  We construct the program equivariantly. Let $G$ be the finite cyclic group generated by $sigma$ and take the quotient $pi : Q arrow.r overline(Q) = Q \/ G$. Define the branch-corrected boundary $overline(H)$ by
  $ K_Q + hat(H)_i = pi^(*) \( K_(overline(Q)) + overline(H) \) . $
  Its coefficients are $1 - \( 1 - delta \) \/ e$, where $delta < 1$ is an upstairs coefficient and $e$ a ramification index. They lie in $\[ 0 \, 1 \)$, and finite-map discrepancy comparison makes $\( overline(Q) \, overline(H) \)$ klt. A finite quotient of a smooth variety is $bb(Q)$-factorial.
  On the generic fibre upstairs the adjoint has a nonzero section in a sufficiently divisible degree: the log-resolution error is effective and exceptional over the log Calabi–Yau factor. Multiplying the finitely many translates of this section gives an invariant section in a divisible degree downstairs. The horizontal section inequalities descend by the finite-map formula. Thus Lemma 6 applies to the quotient pair over $C' \/ G$ and gives a terminating program with relatively semiample output.
  Lift each step by normalization in the upstairs function field, using Stein factorization for contractions. These are the usual finite-group equivariant MMP diagrams; see also [23] Complement 3 and Paragraph 21. They remain over $C'$, since functions integral over the downstairs curve extend on the normalizations. Finite pullback preserves relative negativity and relative ampleness. The canonical pullback equality continues in codimension one because no step extracts divisors. In particular the lifted pairs remain klt. The invariant divisor $J$ is rational Cartier: it descends rationally to the $bb(Q)$-factorial quotient, and its finite pullback is $J$. The displayed canonical pullback equality makes $K_Y + J$ rational Cartier as well, and their difference makes $K_Y$ rational Cartier.
  For completeness, ordinary $bb(Q)$-factoriality upstairs is unnecessary for dlt preservation here. The lifted negative contraction or flip has the same discrepancy comparison as an ordinary MMP step. Adding the marked fibre changes the adjoint by a pullback and leaves this comparison unchanged. Discrepancies strictly improve for centres in the affected locus; hence every lc centre on the output meets the unchanged locus of an input lc centre. It therefore meets its SNC locus. This is the generic-SNC characterization of dlt, and gives dlt on each output; compare [6] Section 3, before Lemma 16.
  Since no divisors are extracted, every surviving marked fibre component still has multiplicity one. The fibre is Cartier, and the klt total space is Cohen–Macaulay. It has no embedded fibre components, so the fibre is reduced. Relative semiampleness pulls back from the quotient output.
  It remains to prove the exact equality (6.4). The generic adjoint has Kodaira dimension zero, and the steps preserve its divisible section spaces. The relative semiample contraction therefore has zero-dimensional generic image. Connected fibres identify its Stein image with $C'$, so $K_Y + J tilde.op_(bb(Q) \, C') 0$. The logarithmic divisor on the left of (6.4) is effective near $c'$ by normalization, and stays effective by pushforward along the program. Its horizontal part is effective and rationally trivial on the proper generic fibre, hence zero. Its remaining vertical part is relatively rationally principal. A function with vertical divisor is constant on the normal proper generic fibre, and so comes from $K'$. Thus this divisor is a rational multiple of $T$ near $c'$.
  If the multiple were positive, the dlt discrepancy calculation would make every weight quotient positive, contradicting $w_u \( eta_i \) = 0$. It is therefore zero, proving (6.4). ◻
]

=== 6.4 Fixed points and normal component characters <fixed-points-and-normal-component-characters>

#thm([Lemma 6.5.])[
  (A character on a normal log Calabi–Yau pair).  #emph[Fix $h gt.eq 0$ and $p gt.eq 1$. Let $\( A \, Delta \)$ be a normal integral projective lc pair over $bb(C)$, and let $omega$ be a nonzero rational $p$-canonical form with 
$ Delta gt.eq 0 \, #h(2em) "div" \( omega \) + p Delta = 0 . $

 If a finite-order automorphism $gamma$ preserves the pair and $gamma^(*) omega = lambda omega$, the order of $lambda$ divides an integer depending only on $h = dim A$ and $p$.]
] <lem:normal-character>

#proof[
  The divisor of $omega$ is integral, so the coefficients of $Delta$ belong to ${ 0 \, 1 \/ p \, dots.h \, 1 }$. On the normal quotient $A \/ chevron.l gamma chevron.r$ the crepant branch boundary has coefficients in
  $ Psi_p = {1 - frac(1 - delta, e) : delta in { 0 \, 1 \/ p \, dots.h \, 1 } \, med e in bb(Z)_(> 0)} . $
  This is a rational DCC subset of $\[ 0 \, 1 \]$. An invariant tensor power of $omega$ descends and shows that the quotient log canonical divisor is rational Cartier and rationally linearly trivial. Finite-map discrepancy comparison makes the quotient pair lc.
  Apply Theorem 2 in dimension $h$ with coefficient set $Psi_p$. Choose its principalizing degree $a$ divisible also by $p$. The pullback of a degree-$a$ trivialization downstairs is invariant and has the same divisor as $omega^(⊗ a \/ p)$. Their ratio is constant on the normal proper variety $A$. Consequently $lambda^(a \/ p) = 1$. This gives the asserted uniform integer. ◻
]

#thm([Lemma 6.6.])[
  (Characters of the other factors).  #emph[For the normalized rationally connected, Calabi–Yau, and symplectic factors, the orders of the $lambda_i$ are bounded in terms of $s$ and $m$.]
] <lem:other-characters>

#proof[
  Use the model of Lemma 21 and write $h = dim R_i$. It is flat over the smooth curve, since its integral total space is torsion-free over the local discrete valuation rings. The central fibre $T$ is a union of lc centres of the dlt pair $\( Y \, T + J \)$ and is therefore Du Bois. Cohomology and base change for a proper flat family with Du Bois special fibre imply local constancy of $h^j \( cal(O) \)$ near that fibre [21] Theorem 2.62 and Corollary 2.64. After shrinking, the other fibres are klt, as can be checked on a resolution. Rational singularities and birational invariance identify their structure-sheaf cohomology with that of a resolution of the generic factor.
  For the rationally connected factor this gives
  $ H^j \( T \, cal(O)_T \) = 0 quad \( j > 0 \) \, #h(2em) h^0 = 1 . $
  For a Calabi–Yau factor the only nonzero groups are in degrees $0$ and $h$, each of dimension one. For a symplectic factor there is one dimension in every even degree and none in odd degree. These identifications follow from extension of reflexive forms, the defining form algebras of the factors, and Hodge symmetry on resolutions [12,17].
  We use the following consequence of coherent Lefschetz: a finite-order automorphism of a projective scheme with nonzero alternating trace on $H^bullet \( cal(O) \)$ has a fixed point. It applies to this possibly singular fibre. One can either use [3], or embed the fibre equivariantly in a smooth projective space and apply [8] Corollary 5.5 to its pushed-forward structure sheaf. If the fibre has no fixed point, the sheaf restricts to zero along each ambient fixed component, and its Lefschetz contribution vanishes.
  In the rationally connected case the alternating trace of $sigma$ is $1$, so $sigma$ has a fixed point. In the symplectic case write $mu_1 \, dots.h \, mu_N$ for the eigenvalues on its nonzero cohomology groups, where $N = h \/ 2 + 1$. They are nonzero. Their first $N$ power sums cannot all vanish: Newton’s identities would then give $product_j mu_j = 0$. Thus $sigma^a$ has a fixed point for some $1 lt.eq a lt.eq N$.
  In the Calabi–Yau case $p_i = 1$ and $J = 0$. Equation (6.4) makes $K_Y$ Cartier near $T$. The klt Cohen–Macaulay total space, and hence its Cartier fibre, is Gorenstein there. Adjunction trivializes $omega_T$ by the residue of $Omega_i$. The induced scalar on this generator is $lambda_i$: the action on $d u \/ u$ has residue one. Serre duality therefore gives alternating trace
  $ 1 + \( - 1 \)^h lambda_i^(- 1) . $
  If $lambda_i$ has order at most two it is already bounded. Otherwise the trace is nonzero, and $sigma$ has a fixed point.
  In every remaining case a power $sigma^a$, with $a lt.eq h + 1$, fixes a point of $T$. At most $h + 1$ components of the coefficient-one part of a dlt boundary on an $\( h + 1 \)$-fold meet at one point. Indeed their common intersection is a union of lc centres, and at the generic point of such a centre the pair is SNC. A further power of exponent at most $\( h + 1 \) !$ therefore preserves a prime component $A$ through that fixed point.
  By dlt adjunction $A$ is normal and carries an effective lc different $Delta_A$. The rational $p_i$-pluriresidue $omega_A$ of $Omega_i$ satisfies
  $ "div" \( omega_A \) + p_i Delta_A = 0 . $
  This is an equality of divisors: at the generic smooth point it is the ordinary residue, and at every prime it follows by taking a Cartier tensor power in adjunction and dividing the resulting identity. No change of the residue’s degree is required. Naturality of residue shows that the character of the chosen power on $omega_A$ is the corresponding power of $lambda_i$.
  Apply Lemma 22 with $p_i = 1$ or $m$ and $dim A = h lt.eq s$. The power used to stabilize $A$ was bounded in terms of $s$, so the order of $lambda_i$ is bounded in terms of $s$ and $m$. Taking least common multiples supplies a single annihilating integer for all factors. ◻
]

=== 6.5 Completion of the klt case <completion-of-the-klt-case>

#thm([Proposition 6.7.])[
  (The klt weight bound).  #emph[For every $s gt.eq 1$ and $m gt.eq 1$ there is a positive integer $q_(upright("klt")) \( s \, m \)$ with the following property. Let $K = bb(C) \( C \)$ for a smooth projective complex curve, let $z$ be a uniformizer at $c in C$, and let $\( V \, B \)$ be a geometrically integral normal projective geometrically klt $s$-fold pair over $K$. Assume that $K_V$ is rational Cartier, $B gt.eq 0$, and that a rational $m$-canonical form $phi.alt$ satisfies $"div" \( phi.alt \) + m B = 0$. Then 
$ q_(upright("klt")) \( s \, m \) w_z \( phi.alt \) in bb(Z) . $

]
] <prop:klt-weight>

#proof[
  Use the product and comparison constructions of Section 5, and then the normalized models above. Lemmas 20 and 23 give a common integer $Q = Q \( s \, m \) > 0$ with $lambda_i^Q = 1$ for every $i$. Equation (6.3) implies
  $ l divides b Q thin "ord"_(c') a . $
  Together with (6.2), this gives
  $ m b Q thin w_z \( phi.alt \) = frac(b Q thin "ord"_(c') a, l) in bb(Z) . $
  Thus $q_(upright("klt")) \( s \, m \) = m thin s ! thin Q \( s \, m \)$ works. The reduced generic presentation in Section 4 is rationally Gorenstein, so this is exactly the klt assertion needed there. The residue induction therefore proves Theorem 8. ◻
]

== 7 Denominators in the canonical bundle formula <sec:fibration>

The curve weight theorem controls a coefficient of the moduli divisor after restriction to a transverse curve. To use that control for a linear system, we must keep track of the actual divisors in the canonical bundle formula, including their principal parts. We first choose a presentation with a uniform pluricanonical degree, and then show that its moduli divisor has a uniform denominator. Throughout this section the ground field is $bb(C)$.

#thm([Proposition 7.1.])[
  (An exact presentation).  #emph[Fix an integer $d gt.eq 1$ and a finite set $Phi subset \[ 0 \, 1 \] ∩ bb(Q)$. There is an integer $p_0 = p_0 \( d \, Phi \) > 0$, clearing the denominators of $Phi$, with the following property. Let $f : X arrow.r Z$ be a contraction of normal projective varieties with $dim X lt.eq d$, and let $\( X \, B \)$ be lc with $B gt.eq 0$ and nonzero coefficients in $Phi$. Suppose that $K_X + B$ is $bb(Q)$-Cartier and 
$ K_X + B tilde.op_(bb(Q)) f^(*) L $

 for a $bb(Q)$-Cartier divisor $L$ on $Z$. Then there are $psi in bb(C) \( X \)^(*)$ and a $bb(Q)$-Cartier divisor $D_Z tilde.op_(bb(Q)) L$ such that 
#[#set math.equation(numbering: n => "(7.1)")
 $ K_X + B + 1 / p_0 "div" \( psi \) = f^(*) D_Z . $ <eq:exact-presentation>]

]
] <prop:exact-presentation>

#proof[
  Put $K = bb(C) \( Z \)$ and let $F = X times_Z "Spec" K$ be the generic fibre. Since $f$ is a contraction and the characteristic is zero, $F$ is geometrically integral. It is normal, its induced pair $\( F \, B_F \)$ is geometrically lc, and $K_F + B_F tilde.op_(bb(Q)) 0$. These assertions may be checked on a log resolution: after shrinking the base, the resolution and its marked strata have the required generic smoothness, and the discrepancy formula restricts to the fibres. We choose the canonical divisor on $F$ by dividing a rational top form on $X$ by a rational top form on $Z$.
  Theorem 2, applied to the geometric generic fibre, gives a principal multiple in a degree depending only on its dimension and $Phi$. Taking a common multiple over dimensions at most $d$, and also clearing $Phi$, gives $p_0$. The theorem applies over the algebraic closure of $K$ by characteristic-zero comparison: all data descend to an algebraically closed field admitting an embedding into $bb(C)$.
  By Lemma 5, this trivialization descends to $K$ in the same degree. Consequently we may choose $psi in bb(C) \( X \)^(*)$ such that
  $ V := p_0 \( K_X + B \) + "div" \( psi \) $
  has no component dominating $Z$.
  It remains to show that this particular vertical divisor is a pullback. Choose $n > 0$ and $h in bb(C) \( X \)^(*)$ with $n \( K_X + B - f^(*) L \) = "div" \( h \)$. Then
  $ n \( V - p_0 f^(*) L \) = "div" \( h^(p_0) psi^n \) . $
  The divisor on the right is vertical. Its defining function has zero divisor on the normal projective generic fibre and hence belongs to $K^(*)$, because $H^0 \( F \, cal(O)_F \) = K$. Write $h^(p_0) psi^n = f^(*) a$ for $a in K^(*)$. We obtain
  $ V = f^(*) (p_0 L + 1 / n "div" \( a \)) . $
  Thus $D_Z = L + \( n p_0 \)^(- 1) "div" \( a \)$ has all the asserted properties. ◻
]

We recall the part of the canonical bundle formula needed below. Fix a presentation (7.1). For a prime divisor $P$ on $Z$, let $t_P$ be the log canonical threshold of $f^(*) P$ over the generic point of $P$; here $P$ is Cartier after restricting to a neighborhood of that point. Set

#[#set math.equation(numbering: n => "(7.2)")
 $ B_Z = sum_P \( 1 - t_P \) P \, #h(2em) M_Z = D_Z - K_Z - B_Z . $ <eq:cbf-definition>]

On a higher model $tau : W arrow.r Z$, use the crepant induced sub-pair to define the thresholds and put

#[#set math.equation(numbering: n => "(7.3)")
 $ D_W = tau^(*) D_Z = K_W + B_W + M_W \, $ <eq:cbf-higher>]

with compatible canonical divisors. A sub-pair here permits negative boundary coefficients. The traces $M_W$ form the moduli b-divisor $upright(bold(M))$. We say that it is #emph[determined on $W$] if its trace on every higher model is the pullback of $M_W$.

The lc-trivial fibration theorem gives a projective model on which $upright(bold(M))$ is determined and its trace is nef and $bb(Q)$-Cartier [10] Theorem 3.6, extending the klt-trivial theory of Ambro [1,2]. The lc formulation uses the discrepancy b-divisor $upright(bold(A))^(*)$ with the discrepancy $- 1$ terms omitted. Its rank-one hypothesis holds here: on a resolution, $ceil.l upright(bold(A))^(*) ceil.r$ has only effective exceptional terms over the generic fibre, since $B$ is an effective boundary. Its pushforward on that normal fibre is the structure sheaf, and the contraction condition gives rank one. In particular, horizontal components of coefficient one are allowed. A further resolution gives a smooth projective determination. We use the representative (7.2); changing $D_Z$ by a rational principal divisor changes $upright(bold(M))$ by the corresponding principal b-divisor and preserves these qualitative properties.

The original discriminant $B_Z$ is effective and its coefficients lie in a rational DCC set depending only on $d$ and $Phi$. To see this, lc gives $t_P gt.eq 0$. A component of $f^(*) P$ with multiplicity $a gt.eq 1$ and boundary coefficient $b gt.eq 0$ gives $t_P lt.eq \( 1 - b \) \/ a lt.eq 1$. Near the generic point of $P$, the testing divisor $f^(*) P$ has positive integral coefficients. A log resolution, followed by removing proper closed subsets of $P$, realizes its generic threshold as an ordinary threshold on an open subset of $X$. The ACC theorem for log canonical thresholds [15] Theorem 1.1, with testing coefficient set $bb(Z)_(> 0)$, therefore puts the numbers $1 - t_P$ in the claimed DCC set. On higher models, $B_W$ need not be effective, but its coefficients remain at most one, since the induced sub-pair is crepant and sub-lc.

#thm([Theorem 7.2.])[
  (A uniform denominator for the moduli divisor).  #emph[Fix $d gt.eq 1$ and a finite set $Phi subset \[ 0 \, 1 \] ∩ bb(Q)$, and let $p_0 = p_0 \( d \, Phi \)$ be as in Proposition 25. There is a positive integer $p = p \( d \, Phi \)$ divisible by $p_0$ with the following property. Let $f : X arrow.r Z$ be a contraction of normal projective complex varieties with $dim X lt.eq d$ and $dim Z > 0$, and let $\( X \, B \)$ be lc with $B gt.eq 0$, coefficients in $Phi$, and $K_X + B$ $bb(Q)$-Cartier. For any exact presentation 
$ K_X + B + 1 / p_0 "div" \( psi \) = f^(*) D_Z $

 with $psi in bb(C) \( X \)^(*)$ and $D_Z$ $bb(Q)$-Cartier, let $upright(bold(M))$ be its moduli b-divisor. On every smooth projective determination $W$ of $upright(bold(M))$, the divisor $p M_W$ is nef Cartier.]
] <thm:moduli-denominator>

The normalization by $p_0$ fixes the scale at which principal changes are allowed. The next lemma computes one coefficient of this actual moduli divisor by a curve weight. It does not require the crepant boundary on a resolution to be effective.

#thm([Lemma 7.3.])[
  (A transverse curve and its weight).  #emph[Let $f : X arrow.r Z$ be a contraction of normal projective complex varieties, let $\( X \, B \)$ be lc with $B gt.eq 0$, and suppose that 
$ K_X + B + 1 / m "div" \( psi \) = f^(*) D_Z $

 for an integer $m > 0$, a function $psi in bb(C) \( X \)^(*)$, and a $bb(Q)$-Cartier divisor $D_Z$. Let $tau : W arrow.r Z$ be a smooth projective birational model, and let $P$ be a prime divisor of $W$. Write $alpha = "coeff"_P \( tau^(*) D_Z \)$, and let $t_P$ be the threshold for the crepant induced sub-pair over the generic point of $P$. Put $s = dim X - dim Z$. Then there are a smooth projective curve $C$, a point $c in C$, a rational uniformizer $z$ at $c$, and a regular function-field extension of $bb(C) \( C \)$ admitting a geometrically integral projective normal effective $s$-fold pair $\( V \, B_V \)$ that is geometrically lc, and a rational relative $m$-canonical form $phi.alt$ such that 
#[#set math.equation(numbering: n => "(7.4)")
 $ "div" \( phi.alt \) + m B_V = 0 \, #h(2em) w_z \( phi.alt \) = alpha - 1 + t_P . $ <eq:slice-weight>]

]
] <lem:slice>

#proof[
  Choose a smooth projective common resolution $U$ mapping to $X$ and to $W$, and denote the latter morphism by $g$. With a compatible rational top form $theta$ on $U$, write
  #[#set math.equation(numbering: n => "(7.5)")
   $ "div" \( theta \) + B_U^c + 1 / m "div" \( psi \) = g^(*) D_W \, #h(2em) D_W = tau^(*) D_Z . $ <eq:slice-upstairs>]
  Here $B_U^c$ is the crepant sub-boundary. Resolve so that its support, the exceptional divisors over $X$, and the support of $g^(*) P$ are SNC. We may include the finitely many canonical and principal supports occurring in (7.5) among the markings.
  Write $r = dim Z$. If $r > 1$, take a sufficiently general smooth complete-intersection curve
  $ C = L_1 ∩ dots.h.c ∩ L_(r - 1) subset W $
  of very ample members, and choose a transverse point $c in C ∩ P$ over a general point of $P$. If $r = 1$, take $C = W$ and $c = P$. Here are the avoidance and smoothness conditions used in this choice. The fibre-dimension jumping locus of $g$ has codimension at least two: a jump over a divisor would give a proper inverse image of dimension $dim U$. There are also finitely many smooth marked intersections on $U$. We avoid their images when those images have codimension at least two. For each intersection whose image is a divisor, generic smoothness gives a dense smooth open of that divisor over which its map is smooth; we avoid the complement. All these excluded closed sets have codimension at least two in $W$, so a general complete intersection curve misses them. Choose $c$ also away from the other divisor supports.
  For global smoothness of the cut, apply Bertini successively to the basepoint-free systems $g^(*) \| L_j \|$ on $U$ and simultaneously on its smooth marked intersections. This gives a smooth variety $tilde(U) = g^(- 1) \( C \)$ with restricted SNC markings. This argument uses the smoothness of $U$, not smoothness or flatness of $g$ along $P$.
  The morphism $g$ has connected fibres, as follows from Stein factorization and the fact that $bb(C) \( W \)$ is relatively algebraically closed in $bb(C) \( U \)$. Its restriction $h : tilde(U) arrow.r C$ has the same fibres over points of $C$. Thus $tilde(U)$ is connected and, being smooth, is integral; $h$ is a contraction. In particular its function field is regular over $bb(C) \( C \)$.
  We record why the threshold is retained in this cut. On the SNC model, the threshold over the generic point of $P$ is
  $ min_i frac(1 - b_i, a_i) \, $
  where the marked prime divisors dominating $P$ have crepant boundary coefficients $b_i$ and multiplicities $a_i$ in $g^(*) P$. Transversality gives the same coefficients and multiplicities in the fibre over $c$. Components with image a proper closed subset of $P$ are avoided by the choice of $c$. The SNC criterion for sub-lc pairs then shows that this minimum is also the threshold on the cut.
  Exact adjunction fixes the coefficient of the base divisor as well. For each $j$ choose $L'_j tilde.op L_j$ avoiding $c$, and choose a rational function on $W$ with divisor $L'_j - L_j$. Multiply $theta$ by the pullbacks of these functions and take iterated residues along the cuts. The resulting rational top form $tilde(theta)$ on $tilde(U)$ has the canonical divisor prescribed by adjunction, namely the restriction of $"div" \( theta \) + sum_j g^(*) L'_j$. Restricting (7.5) therefore gives
  #[#set math.equation(numbering: n => "(7.6)")
   $ "div" \( tilde(theta) \) + tilde(B)^c + 1 / m "div" \( tilde(psi) \) = h^(*) D'_C \, #h(2em) D'_C = (D_W + sum_j L'_j) \|_C . $ <eq:slice-exact>]
  All restrictions are defined by generality. Since $L'_j$ avoid $c$ and $C$ meets $P$ transversely, $"coeff"_c D'_C = alpha$. When $r = 1$, the sums and the residue operations are empty.
  To obtain the effective generic presentation, return to the original model $X$. Its normal generic fibre over $Z$ is geometrically normal over its perfect characteristic-zero ground field, and is geometrically integral since $f$ is a contraction. Generic flatness and openness of geometric normality and integrality therefore give a dense open subset of $W$ where $W arrow.r Z$ is an isomorphism and the original fibres have these properties. Shrink this open set further using generic smoothness of the resolution strata, so that the restricted resolution computes the fibre discrepancies also after algebraic closure. Exceptional centres that do not dominate the base disappear there; centres that dominate it retain codimension at least two in the fibres by the dimension formula. These are conditions at the generic point of $C$, which is chosen in this open set even when the marked point $c$ is outside it. Hence the generic fibre $V$ is a normal projective geometrically lc pair with the effective boundary $B_V$ induced by $B$, and $tilde(B)^c$ compares crepantly with it.
  Choose a rational uniformizer $z$ at $c$ and define the relative form
  $ phi.alt = \( tilde(theta) \/ d z \)^(⊗ m) tilde(psi) . $
  Restriction of (7.6) to the generic fibre gives $"div" \( phi.alt \) + m B_V = 0$. The absolute form used to compute its weight is
  $ Omega = phi.alt and \( d z \/ z \)^(⊗ m) = z^(- m) tilde(theta)^(⊗ m) tilde(psi) . $
  For a divisor $E$ over the cut lying above $c$, put $a_E = "ord"_E \( z \) > 0$ and let $b_E$ be its crepant boundary coefficient. Equation (7.6) gives
  $ 1 / m "ord"_E \( Omega \) + 1 = \( alpha - 1 \) a_E + \( 1 - b_E \) . $
  Taking the infimum after division by $a_E$ proves (7.4), since the infimum of $\( 1 - b_E \) \/ a_E$ is exactly the preserved threshold $t_P$. ◻
]

#proof[
  Let $P$ be any prime divisor of the smooth determination $W$, and put $alpha = "coeff"_P D_W$. From (7.3),
  $ "coeff"_P M_W = alpha + t_P - 1 - "coeff"_P K_W . $
  Lemma 27 realizes $alpha - 1 + t_P$ as the weight of an exact degree-$p_0$ form with an effective lc generic presentation of dimension $s = dim X - dim Z$. Theorem 8 consequently gives
  $ q \( s \, p_0 \) "coeff"_P M_W in bb(Z) \, $
  because $K_W$ is integral. Take $p$ to be a common multiple of $p_0$ and $q \( s \, p_0 \)$ for $0 lt.eq s lt.eq d - 1$. This choice works for every $P$ without any bound on the complexity of $W$. Thus $p M_W$ is an integral Weil divisor on the smooth variety $W$, hence Cartier. It is nef by the lc-trivial fibration theorem. ◻
]

== 8 Effective systems and the field of section ratios <sec:completion>

The moduli denominator now allows effective birationality on the base of a log Calabi–Yau fibration. We first make two section comparisons explicit. They will retain the actual subfield of the function field through both the fibration and the passage to a good minimal model.

#thm([Lemma 8.1.])[
  (Rounded section comparisons).  #emph[All varieties in this statement are normal and projective over a field of characteristic zero.]
  + #emph[Let $f : X arrow.r Z$ be a contraction and let $D$ and $D_Z$ be $bb(Q)$-Cartier divisors such that 
$ D + 1 / a "div" \( psi \) = f^(*) D_Z $

 for an integer $a > 0$ and $psi in k \( X \)^(*)$. For every positive $ell$ divisible by $a$, the spaces of divisorial sections, regarded as rational functions, satisfy 
#[#set math.equation(numbering: n => "(8.1)")
 $ H^0 #scale(x: 120%, y: 120%)[\(] X \, cal(O)_X \( ⌊ell D⌋ \) #scale(x: 120%, y: 120%)[\)] = psi^(ell \/ a) f^(*) H^0 #scale(x: 120%, y: 120%)[\(] Z \, cal(O)_Z \( ⌊ell D_Z⌋ \) #scale(x: 120%, y: 120%)[\)] . $ <eq:section-pullback>]

]
  + #emph[Let $X arrow.r.dashed X'$ be birational, let $D$ and $D'$ be $bb(Q)$-Cartier divisors, and suppose that on a common resolution $p : T arrow.r X$, $q : T arrow.r X'$ one has 
$ p^(*) D = q^(*) D' + E \, $

 where $E gt.eq 0$ is $q$-exceptional. Under the identification of the function fields, for every integer $ell > 0$ one has 
#[#set math.equation(numbering: n => "(8.2)")
 $ H^0 #scale(x: 120%, y: 120%)[\(] X \, cal(O)_X \( ⌊ell D⌋ \) #scale(x: 120%, y: 120%)[\)] = H^0 #scale(x: 120%, y: 120%)[\(] X' \, cal(O)_(X') \( ⌊ell D'⌋ \) #scale(x: 120%, y: 120%)[\)] . $ <eq:section-birational>]

]
] <lem:rounded-comparison>

#proof[
  For a rational function $u$, the inequality $"div" \( u \) + ⌊ell D⌋ gt.eq 0$ is equivalent to $"div" \( u \) + ell D gt.eq 0$, since function orders are integral. Also, effectivity of a $bb(Q)$-Cartier divisor is preserved by surjective pullback. It is detected by such a pullback: over the generic point of each prime divisor downstairs, a local defining parameter pulls back with positive order along some divisor upstairs.
  For (i), divide a section upstairs by $psi^(ell \/ a)$. The result $v$ satisfies
  $ "div" \( v \) + ell f^(*) D_Z gt.eq 0 . $
  It has no pole on the normal projective generic fibre, so is a base function. For $v in k \( Z \)$ the displayed divisor equals $f^(*) \( "div" \( v \) + ell D_Z \)$. The effectivity comparison just noted proves both inclusions in (8.1).
  For (ii), pull an effective divisor $"div" \( u \) + ell D$ to $T$ and push it to $X'$. Since $q_(*) E = 0$, this gives $"div" \( u \) + ell D' gt.eq 0$. Conversely, pull the latter inequality to $T$, add $ell E$, and push to $X$. This yields the original inequality. The argument uses $bb(Q)$-Cartier pullbacks, so it does not require $ell D$ or $ell D'$ to be Cartier. ◻
]

#thm([Proposition 8.2.])[
  (Effective degree on the base).  #emph[Fix $d gt.eq 1$ and a finite set $Phi subset \[ 0 \, 1 \] ∩ bb(Q)$. There is an integer $N = N \( d \, Phi \) > 0$ with the following property. Let $f : X arrow.r Z$ be a contraction of normal projective complex varieties with $dim X lt.eq d$ and $dim Z > 0$, and let $\( X \, B \)$ be lc with $B gt.eq 0$, coefficients in $Phi$, and $D = K_X + B$ $bb(Q)$-Cartier. Suppose that $D tilde.op_(bb(Q)) f^(*) L$ for a big $bb(Q)$-Cartier divisor $L$ on $Z$. Then $\| ⌊N D⌋ \|$ is nonempty, and its section ratios generate exactly $f^(*) bb(C) \( Z \)$ inside $bb(C) \( X \)$. This is also the field $K \( D \)$ generated by section ratios in all positive degrees.]
] <prop:effective-fibration>

#proof[
  Use Proposition 25 to obtain (7.1), and choose a smooth projective determination $tau : W arrow.r Z$ of its moduli b-divisor. After a further resolution we may suppose that the strict transform of $B_Z$ and the exceptional divisor of $tau$ have SNC support. Theorem  26 gives a uniform $p$ for which $p M_W$ is nef Cartier. Let
  $ A = tau_(*)^(- 1) B_Z + "Exc" \( tau \)_(upright("red")) . $
  Then $\( W \, A \)$ is log smooth and lc. Its coefficients lie in the fixed DCC set for the discriminant, enlarged by $1$. Moreover,
  #[#set math.equation(numbering: n => "(8.3)")
   $ K_W + A + M_W = tau^(*) D_Z + E \, #h(2em) E = A - B_W gt.eq 0 \, $ <eq:base-effective-exceptional>]
  where $E$ is exceptional: at nonexceptional primes $A$ and $B_W$ agree, and at exceptional primes $A$ has coefficient one whereas $B_W$ has coefficient at most one.
  The divisor in (8.3) is big. The effective birationality theorem for polarized pairs [4] Theorem 1.3 now applies to $\( W \, A \)$ and $M_W$: the pair is projective lc, its boundary coefficients belong to a fixed DCC set, $p M_W$ is nef Cartier, and the adjoint sum is big. Consequently
  $ lr(|⌊n \( K_W + A + M_W \)⌋|) $
  is birational for every $n$ divisible by an integer depending only on $dim W$, the DCC set, and $p$. The notation in that theorem uses round down, as in the displayed system.
  Pushing the rational section inequalities to $Z$ shows that this birational system is a subsystem of $\| ⌊n D_Z⌋ \|$ under the identification $bb(C) \( W \) = bb(C) \( Z \)$. Thus the latter system is nonempty and its ratios generate $bb(C) \( Z \)$. Choose a common such $n = N$ over $1 lt.eq dim Z lt.eq d$, also divisible by $p_0$. Equation (8.1) then proves the asserted nonemptiness and ratio-field equality upstairs.
  It remains to compare with all degrees. If $s \, s_0$ are nonzero sections in degree $ell$, their ratio can be represented in every multiple degree $b ell$ as
  #[#set math.equation(numbering: n => "(8.4)")
   $ s / s_0 = frac(s thin s_0^(b - 1), s_0^b) . $ <eq:ratio-multiple>]
  These products are sections in degree $b ell$ because $b ⌊ell D⌋ lt.eq ⌊b ell D⌋$. Choose $b$ so that $p_0 divides b ell$ and apply (8.1). Every such ratio belongs to $f^(*) bb(C) \( Z \)$, proving $K \( D \) = f^(*) bb(C) \( Z \)$. ◻
]

The proof of the main theorem first treats the ground field $bb(C)$. For the final change of ground field we use the following elementary observation, which keeps track of equality of subfields rather than only the associated rational maps.

#thm([Lemma 8.3.])[
  (Descent of the field of ratios).  #emph[Let $k subset k'$ be an extension of algebraically closed fields, let $X$ be a normal integral projective variety over $k$, and let $D$ be a $bb(Q)$-divisor on $X$. Write $X' = X_(k')$ and $D' = D_(k')$. For each $ell > 0$ having nonzero sections, let $F_ell subset k \( X \)$ be the field generated over $k$ by ratios of sections of $cal(O)_X \( ⌊ell D⌋ \)$, and define $F'_ell$ similarly on $X'$. Then 
$ F'_ell = k' F_ell \, #h(2em) K \( D' \) = k' K \( D \) \, $

 where the composita are taken in $k' \( X' \)$. In particular, for a fixed $m > 0$, nonemptiness of $\| ⌊m D⌋ \|$ and the equality $F_m = K \( D \)$ hold if and only if they hold after extension to $k'$.]
] <lem:field-descent>

#proof[
  The rounded divisorial sheaves commute with these field extensions. One may check this on the smooth big open set where the prime divisors are Cartier, and then use reflexive extension across its complement. Base change for global sections gives
  #[#set math.equation(numbering: n => "(8.5)")
   $ H^0 #scale(x: 120%, y: 120%)[\(] X' \, cal(O)_(X') \( ⌊ell D'⌋ \) #scale(x: 120%, y: 120%)[\)] = k' ⊗_k H^0 #scale(x: 120%, y: 120%)[\(] X \, cal(O)_X \( ⌊ell D⌋ \) #scale(x: 120%, y: 120%)[\)] . $ <eq:section-base-change>]
  Choose a nonzero section $s_0$ over $k$. Dividing any section over $k'$ by $s_0$ expresses it as a finite $k'$-linear combination of ratios over $k$. This proves $F'_ell = k' F_ell$; taking all degrees proves the analogous assertion for $K \( D \)$.
  For descent of the equality, we use the following intersection fact. If $F$ is an intermediate field $k subset F subset k \( X \)$, then
  #[#set math.equation(numbering: n => "(8.6)")
   $ k \( X \) ∩ k' F = F $ <eq:field-intersection>]
  inside $k' \( X' \)$. Indeed $X$ is geometrically integral, so $k \( X \) ⊗_k k'$ injects into $k' \( X' \)$. If $u in k \( X \) ∩ k' F$, write
  $ u = frac(sum_(i = 1)^a c_i a_i, sum_(i = 1)^a c_i b_i) \, #h(2em) a_i \, b_i in F \, quad c_i in k' \, $
  where the $c_i$ are linearly independent over $k$ and the denominator is nonzero. Such an expression is obtained by collecting a finite list of constants into a $k$-basis. After clearing the denominator, injectivity of the tensor product map and linear independence give $u b_i = a_i$ for every $i$. Some $b_i$ is nonzero, so $u in F$. Applying (8.6) to $F = F_m$ proves descent of $F'_m = K \( D' \)$. The forward implication follows from the compositum identities, and nonemptiness follows in either direction from (8.5). ◻
]

#proof[
  First let the ground field be $bb(C)$, and put $D = K_X + B$. The hypothesis $kappa \( X \, D \) gt.eq 0$ implies that $D$ is pseudo-effective. Take a crepant $bb(Q)$-factorial dlt modification $mu : \( Y \, Delta \) arrow.r \( X \, B \)$. Its adjoint is $mu^(*) D$, and its boundary coefficients belong to $Phi union { 1 }$. Theorem 3 and termination with ample scaling [33] Theorem A give a terminating $\( K_Y + Delta \)$-MMP to a $bb(Q)$-factorial dlt pair $\( X' \, B' \)$. The nef case of the good-model theorem makes its adjoint semiample. The MMP extracts no divisors, so the coefficients of $B'$ still belong to $Phi union { 1 }$. With compatible canonical divisors, crepancy of $mu$ and the discrepancy comparison for this MMP give, on a common resolution,
  $ p^(*) \( K_X + B \) = q^(*) \( K_(X') + B' \) + E \, #h(2em) E gt.eq 0 quad q upright("-exceptional") \; $
  see the minimal-model discrepancy comparison and negativity lemma in [22]. Lemma 28(ii) identifies all rounded section spaces as subspaces of the common function field. It therefore suffices to prove the result on $\( X' \, B' \)$.
  The adjoint $D' = K_(X') + B'$ is semiample. Its semiample contraction $f : X' arrow.r Z$ satisfies $D' tilde.op_(bb(Q)) f^(*) L$ with $L$ an ample $bb(Q)$-Cartier divisor on the normal projective base. If $dim Z > 0$, Proposition 29, with coefficient set $Phi union { 1 }$, gives a uniform nonempty degree whose ratios generate the entire field $K \( D' \)$. If $Z$ is a point, then $D' tilde.op_(bb(Q)) 0$, and Theorem 2 gives a uniform principal multiple. Its system is nonempty and all ratios in that degree are constants. For any other degree, pass to a common multiple by (8.4); ratios in the latter degree are again constants. Hence $K \( D' \) = bb(C)$ in this case. A common multiple of the two uniform degrees works in both cases, again by (8.4). Denote it by $m \( d \, Phi \)$. The rounded comparison transfers the conclusion to $X$.
  Now let $k$ be any algebraically closed field of characteristic zero. Descend $X$, its prime boundary components and coefficients, the canonical and $bb(Q)$-Cartier data, and a log resolution to a finitely generated subfield of $k$. Let $k_0 subset k$ be the algebraic closure of that field inside $k$. Enlarging the finitely generated field if necessary, the descended variety $X_0$ is geometrically integral and normal, its pair $\( X_0 \, B_0 \)$ is lc, and its adjoint $D_0$ is $bb(Q)$-Cartier. These conditions can be checked after the faithfully flat extension to $k$, using the chosen resolution for the discrepancy inequalities. The field $k_0$ embeds into $bb(C)$.
  Equation (8.5) shows that nonzero sections in some positive degree, and hence nonnegative Kodaira dimension, descend from $k$ to $k_0$ and persist after extension to $bb(C)$. The complex case gives the conclusion in the same integer $m \( d \, Phi \)$ for $\( X_0 \, B_0 \)_(bb(C))$. Lemma 30 first descends the nonemptiness and exact equality of ratio fields to $k_0$, and then extends them to $k$. This proves the theorem over the stated ground field. ◻
]

#heading(level: 1)[References]
#bibitem([1])[F.~Ambro, #emph[Shokurov's boundary property], J. Differential Geom. #strong[67] (2004), no.~2, 229--255. #link("https://doi.org/10.4310/jdg/1102536201")[doi:10.4310/jdg/1102536201].]
#bibitem([2])[F.~Ambro, #emph[The moduli b-divisor of an lc-trivial fibration], Compos. Math. #strong[141] (2005), no.~2, 385--403. #link("https://doi.org/10.1112/S0010437X04001071")[doi:10.1112/S0010437X04001071].]
#bibitem([3])[P.~Baum, W.~Fulton, and G.~Quart, #emph[Lefschetz--Riemann--Roch for singular varieties], Acta Math. #strong[143] (1979), 193--211. #link("https://doi.org/10.1007/BF02392092")[doi:10.1007/BF02392092].]
#bibitem([4])[C.~Birkar and D.-Q.~Zhang, #emph[Effectivity of Iitaka fibrations and pluricanonical systems of polarized pairs], Publ. Math. Inst. Hautes Études Sci. #strong[123] (2016), 283--331. #link("https://doi.org/10.1007/s10240-016-0080-x")[doi:10.1007/s10240-016-0080-x].]
#bibitem([5])[G.~Chen, J.~Han, and J.~Liu, #emph[On effective log Iitaka fibrations and existence of complements], Int. Math. Res. Not. IMRN #strong[2024] (2024), no.~10, 8329--8349. #link("https://doi.org/10.1093/imrn/rnad253")[doi:10.1093/imrn/rnad253].]
#bibitem([6])[T.~de Fernex, J.~Kollár, and C.~Xu, #emph[The dual complex of singularities], in #emph[Higher Dimensional Algebraic Geometry---in Honour of Professor Yujiro Kawamata's Sixtieth Birthday], Adv. Stud. Pure Math., vol.~74, Math. Soc. Japan, Tokyo, 2017, pp.~103--129. #link("https://doi.org/10.2969/aspm/07410103")[doi:10.2969/aspm/07410103].]
#bibitem([7])[P.~Deligne, #emph[Équations différentielles à points singuliers réguliers], Lecture Notes in Mathematics, vol.~163, Springer-Verlag, Berlin, 1970. #link("https://doi.org/10.1007/BFb0061194")[doi:10.1007/BFb0061194].]
#bibitem([8])[P.~Donovan, #emph[The Lefschetz--Riemann--Roch formula], Bull. Soc. Math. France #strong[97] (1969), 257--273. #link("https://doi.org/10.24033/bsmf.1680")[doi:10.24033/bsmf.1680].]
#bibitem([9])[O.~Fujino, #emph[Fundamental theorems for the log minimal model program], Publ. Res. Inst. Math. Sci. #strong[47] (2011), no.~3, 727--789. #link("https://doi.org/10.2977/PRIMS/50")[doi:10.2977/PRIMS/50].]
#bibitem([10])[O.~Fujino and Y.~Gongyo, #emph[On the moduli b-divisors of lc-trivial fibrations], Ann. Inst. Fourier (Grenoble) #strong[64] (2014), no.~4, 1721--1735. #link("https://doi.org/10.5802/aif.2894")[doi:10.5802/aif.2894].]
#bibitem([11])[O.~Fujino and S.~Mori, #emph[A canonical bundle formula], J. Differential Geom. #strong[56] (2000), no.~1, 167--188. #link("https://doi.org/10.4310/jdg/1090347529")[doi:10.4310/jdg/1090347529].]
#bibitem([12])[D.~Greb, S.~Kebekus, S.~J.~Kovács, and Th.~Peternell, #emph[Differential forms on log canonical spaces], Publ. Math. Inst. Hautes Études Sci. #strong[114] (2011), 87--169. #link("https://doi.org/10.1007/s10240-011-0036-0")[doi:10.1007/s10240-011-0036-0].]
#bibitem([13])[C.~D.~Hacon and J.~McKernan, #emph[Boundedness of pluricanonical maps of varieties of general type], Invent. Math. #strong[166] (2006), no.~1, 1--25. #link("https://doi.org/10.1007/s00222-006-0504-1")[doi:10.1007/s00222-006-0504-1].]
#bibitem([14])[C.~D.~Hacon and J.~McKernan, #emph[On Shokurov's rational connectedness conjecture], Duke Math. J. #strong[138] (2007), no.~1, 119--136. #link("https://doi.org/10.1215/S0012-7094-07-13813-4")[doi:10.1215/S0012-7094-07-13813-4].]
#bibitem([15])[C.~D.~Hacon, J.~McKernan, and C.~Xu, #emph[ACC for log canonical thresholds], Ann. of Math. (2) #strong[180] (2014), no.~2, 523--571. #link("https://doi.org/10.4007/annals.2014.180.2.3")[doi:10.4007/annals.2014.180.2.3].]
#bibitem([16])[C.~D.~Hacon and C.~Xu, #emph[Boundedness of log Calabi--Yau pairs of Fano type], Math. Res. Lett. #strong[22] (2015), no.~6, 1699--1716. #link("https://doi.org/10.4310/MRL.2015.v22.n6.a8")[doi:10.4310/MRL.2015.v22.n6.a8].]
#bibitem([17])[A.~Höring and Th.~Peternell, #emph[Algebraic integrability of foliations with numerically trivial canonical bundle], Invent. Math. #strong[216] (2019), no.~2, 395--419. #link("https://doi.org/10.1007/s00222-018-00853-2")[doi:10.1007/s00222-018-00853-2].]
#bibitem([18])[S.~Iitaka, #emph[On $D$-dimensions of algebraic varieties], J. Math. Soc. Japan #strong[23] (1971), no.~2, 356--373. #link("https://doi.org/10.2969/jmsj/02320356")[doi:10.2969/jmsj/02320356].]
#bibitem([19])[G.~Kempf, F.~F.~Knudsen, D.~Mumford, and B.~Saint-Donat, #emph[Toroidal Embeddings I], Lecture Notes in Mathematics, vol.~339, Springer-Verlag, Berlin, 1973. #link("https://doi.org/10.1007/BFb0070318")[doi:10.1007/BFb0070318].]
#bibitem([20])[J.~Kollár, with the collaboration of S.~Kovács, #emph[Singularities of the Minimal Model Program], Cambridge Tracts in Mathematics, vol.~200, Cambridge University Press, Cambridge, 2013. #link("https://doi.org/10.1017/CBO9781139547895")[doi:10.1017/CBO9781139547895].]
#bibitem([21])[J.~Kollár, with the collaboration of K.~Altmann and S.~J.~Kovács, #emph[Families of Varieties of General Type], Cambridge Tracts in Mathematics, vol.~231, Cambridge University Press, Cambridge, 2023. #link("https://doi.org/10.1017/9781009346115")[doi:10.1017/9781009346115].]
#bibitem([22])[J.~Kollár and S.~Mori, with the collaboration of C.~H.~Clemens and A.~Corti, #emph[Birational Geometry of Algebraic Varieties], Cambridge Tracts in Mathematics, vol.~134, Cambridge University Press, Cambridge, 1998. #link("https://doi.org/10.1017/CBO9780511662560")[doi:10.1017/CBO9780511662560].]
#bibitem([23])[J.~Kollár, J.~Nicaise, and C.~Xu, #emph[Semi-stable extensions over 1-dimensional bases], Acta Math. Sin. (Engl. Ser.) #strong[34] (2018), no.~1, 103--113. #link("https://doi.org/10.1007/s10114-017-7048-8")[doi:10.1007/s10114-017-7048-8].]
#bibitem([24])[S.-i.~Matsumura and J.~Wang, #emph[Structure theorem for projective klt pairs with nef anti-canonical divisor], J. Eur. Math. Soc., published online 30 September 2025. #link("https://doi.org/10.4171/JEMS/1702")[doi:10.4171/JEMS/1702]\; #link("https://arxiv.org/abs/2105.14308")[arXiv:2105.14308].]
#bibitem([25])[OpenAI, #emph[Arithmetic Stein-degree bounds for log Calabi--Yau pairs], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Arithmetic-Stein-degree-bounds-for-log-Calabi-Yau-pairs-September-25-2026/paper.pdf")[OAI:Arithmetic-Stein-degree-bounds-for-log-Calabi-Yau-pairs-September-25-2026], 2026.]
#bibitem([26])[OpenAI, #emph[Log abundance in characteristic zero], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Log-abundance-in-characteristic-zero-September-24-2026/paper.pdf")[OAI:Log-abundance-in-characteristic-zero-September-24-2026], 2026.]
#bibitem([27])[OpenAI, #emph[Relative denominators and effective systems for log Calabi-Yau fibrations], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Relative-denominators-and-effective-systems-for-log-Calabi-Yau-fibrations-September-27-2026/paper.pdf")[OAI:Relative-denominators-and-effective-systems-for-log-Calabi-Yau-fibrations-September-27-2026], 2026.]
#bibitem([28])[OpenAI, #emph[Uniform Pluricanonical Iitaka Fibrations], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Uniform-Pluricanonical-Iitaka-Fibrations-October-3-2026/paper.pdf")[OAI:Uniform-Pluricanonical-Iitaka-Fibrations-October-3-2026], 2026.]
#bibitem([29])[J.~Steenbrink, #emph[Limits of Hodge structures], Invent. Math. #strong[31] (1976), no.~3, 229--257. #link("https://doi.org/10.1007/BF01403146")[doi:10.1007/BF01403146].]
#bibitem([30])[S.~Takayama, #emph[Pluricanonical systems on algebraic varieties of general type], Invent. Math. #strong[165] (2006), no.~3, 551--587. #link("https://doi.org/10.1007/s00222-006-0503-2")[doi:10.1007/s00222-006-0503-2].]
#bibitem([31])[G.~T.~Todorov, #emph[Effective log Iitaka fibrations for surfaces and threefolds], Manuscripta Math. #strong[133] (2010), nos.~1--2, 183--195. #link("https://doi.org/10.1007/s00229-010-0370-4")[doi:10.1007/s00229-010-0370-4].]
#bibitem([32])[G.~Todorov and C.~Xu, #emph[Effectiveness of the log Iitaka fibration for 3-folds and 4-folds], Algebra Number Theory #strong[3] (2009), no.~6, 697--710. #link("https://doi.org/10.2140/ant.2009.3.697")[doi:10.2140/ant.2009.3.697].]
#bibitem([33])[N.~Tsakanikas and L.~Xie, #emph[Remarks on the existence of minimal models of log canonical generalized pairs], Math. Z. #strong[307] (2024), article~20, 39~pp. #link("https://doi.org/10.1007/s00209-024-03489-6")[doi:10.1007/s00209-024-03489-6].]
#bibitem([34])[H.~Tsuji, #emph[Pluricanonical systems of projective varieties of general type. II], Osaka J. Math. #strong[44] (2007), no.~3, 723--764. #link("https://doi.org/10.18910/6697")[doi:10.18910/6697].]
#bibitem([35])[E.~Viehweg and D.-Q.~Zhang, #emph[Effective Iitaka fibrations], J. Algebraic Geom. #strong[18] (2009), no.~4, 711--730. #link("https://doi.org/10.1090/S1056-3911-09-00515-3")[doi:10.1090/S1056-3911-09-00515-3].]


