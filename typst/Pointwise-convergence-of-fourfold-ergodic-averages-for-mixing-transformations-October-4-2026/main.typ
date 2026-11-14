#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 75.9pt, y: 75.9pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Pointwise convergence of fourfold ergodic averages \
for mixing transformations]]
#align(center)[OpenAI]
#align(center)[October 4, 2026]

== 1 Introduction <sec:introduction>

Let $\( X \, cal(F) \, mu \, T \)$ be an invertible probability-preserving system.
  For bounded measurable functions $f_1 \, dots.h \, f_d$, the multiple ergodic averages are

$ A_N \( f_1 \, dots.h \, f_d \) \( x \) = 1 / N sum_(n = 1)^N product_(j = 1)^d f_j \( T^(j n) x \) . $

The general pointwise question asks whether these averages converge almost everywhere for every finite $d$ on
  every invertible probability-preserving system. Here we treat four functions under the mixing hypothesis.
  We say that $T$ is mixing if

#[#set math.equation(numbering: n => "(1.1)")
 $ mu \( A ∩ T^(- n) B \) arrow.r mu \( A \) mu \( B \) wide \( \| n \| arrow.r oo \) $ <eq:mixing>]

for every $A \, B in cal(F)$. The functions are fixed throughout each convergence assertion.
  No rate in (1.1) is assumed.

#thm([Theorem 1.1.])[
  #emph[Let $\( X \, cal(F) \, mu \)$ be a probability space and let $T : X arrow.r X$ be invertible,
    bimeasurable, measure preserving, and mixing in the sense of (1.1).
    For every $f_1 \, f_2 \, f_3 \, f_4 in L^oo \( mu \)$,
$ 1 / N sum_(n = 1)^N f_1 \( T^n x \) f_2 \( T^(2 n) x \) f_3 \( T^(3 n) x \) f_4 \( T^(4 n) x \) arrow.r
  product_(j = 1)^4 integral_X f_j thin d mu $

 for $mu$-almost every $x$, along all positive integers $N$. The original probability space need not be standard.]
] <thm:main>

=== Context and inputs <context-and-inputs>

Birkhoff’s pointwise ergodic theorem treats a single observation along an orbit [3].
  Furstenberg’s ergodic proof of Szemerédi’s theorem made products at arithmetic-progression times a central
  object of study [9]. For weakly mixing transformations, these averages converge in $L^2$ to the product of the
  integrals. For arbitrary transformations, Host and Kra established norm convergence of every finite consecutive
  length using nilpotent characteristic factors [11] Theorem 1.1;
  Ziegler independently developed universal characteristic factors and another proof [25].
  Norm convergence alone does not control the exceptional lengths at an individual point.

Bourgain proved pointwise convergence for two powers of one transformation [4].
  Higher-order pointwise results include $K$ systems [6] Theorem 4.2,
  weakly mixing systems with suitable spectral restrictions [1],
  and weakly mixing systems whose pairwise-independent finite self-joinings are all product measures [10].
  Huang, Shao and Ye proved pointwise convergence of every finite consecutive length on ergodic measure-distal
  systems [12] Theorem C, extending the distal investigation of Lesigne [19].
  Recent pointwise theorems for polynomial iterates include the bilinear result of Krause,
  Mirek and Tao [17] and the distinct-degree multilinear result of Kosz, Mirek, Peluse, Wan and Wright [16].
  Their degree hypotheses do not cover the four linear iterates considered here.
  Kuca’s survey [18] gives a broader account of the norm and pointwise questions.

Theorem 1 uses three companion results. The multiple-mixing theorem of [22] Theorem 1.1 supplies mixing of every
  finite order from (1.1). The analytic construction of [21], based on the local estimates of [20],
  supplies an oscillation estimate for threefold averages. Its oscillation assertion holds on arbitrary invertible
  systems; mixing is used separately to identify limits. We need the threefold estimate at each three-element
  subset of ${ 1 \, 2 \, 3 \, 4 }$. Appendix 7 proves the required coefficient adaptation and the resulting
  pointwise convergence lemma, including its nonergodic formulation.
  The local analytic theorems themselves are cited with their hypotheses and locations.
  Thus the contribution here is the fourfold deduction from these specified inputs.

The structural part uses the Furstenberg–Zimmer theory of relatively compact and relatively weakly mixing
  extensions. We record the nonergodic and power-stability statements at their point of use in Section 2.
  The construction also uses extensions on which certain conditional expectations cannot improve.
  Such energy maximization belongs to the same general method as sated extensions [2];
  the data being saturated here come from selected four-coordinate laws.

=== The difficulty caused by selected lengths <the-difficulty-caused-by-selected-lengths>

Suppose that the conclusion fails. After subtracting means,
  there are four centred real functions and a positive-measure set of points at which their averages remain
  positively separated from zero along arbitrarily late lengths.
  We choose one such length $N_a \( x \)$ after scale $2^a$. Averaging the configurations

$ \( T^n x \, T^(2 n) x \, T^(3 n) x \, T^(4 n) x \) \, wide 1 lt.eq n lt.eq N_a \( x \) \, $

and passing to a limit preserves a nonzero correlation. A constant-roof suspension makes these limit laws
  invariant under a flow and permits the changes of speed needed later.

Selection is the main analytic obstruction. Conditioning on a length chosen from the initial state can change the
  joint law of independent auxiliary variables. Ordinary norm convergence, with no rate,
  does not by itself bound all the resulting errors. We introduce three groups of auxiliary spatial coordinates.
  Their joint law is a product, and any two groups together are independent of the original coordinate,
  after conditioning on the suspension phases. A length event may change the full three-group law,
  but preserves the two-group marginals. This is precisely the amount of independence used in Section 5.
  For a finite model of the distinction, let $U \, V \, W$ be independent symmetric signs.
  Their product is independent of each pair, but conditioning on $U V W = 1$ constrains the triple.

The estimate making this possible is a finite-dimensional packing statement proved in Section 4.
  If two bounded families of Hilbert-space vectors have small pairwise inner products outside a graph of bounded
  degree, few of their tensor products can have large projection onto a subspace of slowly growing dimension.
  A Gaussian comparison and a trace-moment estimate give a quantitative form of this assertion.
  Applied to the leading covariance subspace, it controls the projected part of each selected average.
  The complementary part has a square-summable error over the possible lengths.
  The estimate is independent of the ambient Hilbert-space dimensions and requires no quantitative mixing rate.

=== From a correlation to a contradiction <from-a-correlation-to-a-contradiction>

Each auxiliary system carries both an original spatial coordinate and the three groups of additional coordinates.
  We call such a system a channel after specifying its exact independence conditions in Definition 10.
  In its selected four-coordinate law, consider nonzero correlations in which each slot uses either a centred
  function of the original coordinate or a centred function of the additional coordinates.
  Bounded functions of the distal parameters are allowed as weights.
  The initial failure gives a correlation with no additional-coordinate slots.

Choose a channel and a correlation maximizing the number of slots of the second kind.
  Independence excludes four such slots. An iterated array construction excludes three:
  products along different axes through a fixed corner are orthogonal,
  but each has the same nonzero correlation with the function at that corner. Bessel’s inequality rules this out.
  At most two slots can therefore be of the second kind.

The final construction increases that number. First enlarge the channel until the conditional expectations needed
  by the argument are stable under further extensions. Then regard one selected four-coordinate law as a new
  system and select once more. The result is a square of old states.
  Its distinguished row and column meet at one corner; saturation supplies their exact conditional laws.
  A reanchoring identity on the distal parameters shows that the row and column correlation cannot vanish.
  Regrouping the other coordinates therefore replaces one original-coordinate slot by an additional-coordinate
  slot, contradicting maximality.

Sections 2 and 3 establish the structural inputs and selected laws.
  The packing estimate and channel preservation are proved in Sections 4 and 5.
  Section 6 carries out the maximality argument and completes the proof.
  The coefficient-dependent analytic work is collected in Appendix 7.

== 2 Convergence inputs and relative structure <sec:structure>

The auxiliary systems in the proof will be extensions and joinings of a suspension of the original transformation.
  They need not be ergodic. We therefore formulate the structural facts in the nonergodic setting,
  and distinguish the pointwise input for three functions from the norm estimate available for any finite number
  of functions.

=== 2.1 Standard systems and the pointwise inputs <standard-systems-and-the-pointwise-inputs>

Put $I = { 1 \, 2 \, 3 \, 4 }$. It suffices to prove Theorem 1 on a standard probability space.
  Indeed, for a given tuple of bounded functions, the map recording all their integer translates takes values in a
  countable product of compact scalar discs. The pushforward measure and the shift give a standard factor,
  the functions descend to its coordinate functions, and mixing passes to this factor.
  Almost-sure convergence there pulls back to the original space.
  We henceforth write $\( X \, mu \, T \)$ for this standard mixing system.
  All factors and conditional expectations are understood modulo null sets; probability spaces may be completed.

We use [22] Theorem 1.1 in the following form. For every fixed finite family $g_1 \, dots.h \, g_s in L^oo \( mu \)$,

#[#set math.equation(numbering: n => "(2.1)")
 $ integral_X product_(j = 1)^s g_j \( T^(n_j) x \) thin thin d mu \( x \) arrow.r
   product_(j = 1)^s integral_X g_j thin thin d mu quad upright("if") quad min_(j eq.not l) \| n_j -
   n_l \| arrow.r oo . $ <eq:all-orders-input>]

The bounded-function formulation follows from the set formulation by simple-function approximation.
  All uses of this input involve fixed functions; no rate of mixing is assumed.

The other companion input will be used on systems without mixing.
  Its coefficient dependence is important, so we isolate its exact scope.

#thm([Lemma 2.1.])[
  (Lower-length convergence).  #emph[Let $\( Y \, m \, R \)$ be an invertible probability-preserving
    transformation on a standard probability space. If $diameter eq.not J subset.neq I$ and $g_i in
    L^oo \( m \)$ for $i in J$, then
$ 1 / N sum_(n = 1)^N product_(i in J) g_i \( R^(i n) y \) $

 converges for $m$-almost every $y$.]
] <lem:lower-length>

The proof, including the changes of coefficients in the analytic estimates of [21,20], is given in Appendix 7.
  Neither ergodicity nor mixing is an assumption of Lemma 2.

=== 2.2 Distal factors and relatively weakly mixing extensions <distal-factors-and-relatively-weakly-mixing-extensions>

Let $\( Y \, m \, R \)$ be a standard probability-preserving system, and let $B$ be a factor.
  We use the conditional-correlation characterization of #emph[relative weak mixing]:
  for bounded $f \, g$, with $bb(E) \[ f divides B \] = 0$,

#[#set math.equation(numbering: n => "(2.2)")
 $ 1 / H sum_(h = 1)^H parallel bb(E) \[ overline(f) thin \( g compose R^h \) divides B \]
   #scale(x: 120%, y: 120%)[parallel]_2^2 arrow.r 0 . $ <eq:rwm-correlations>]

For $F_1 \, dots.h \, F_r in L^2 \( m \)$, the associated finitely generated $L^oo \( B \)$-module is

$ {sum_(j = 1)^r a_j F_j : a_j in L^oo \( B \)} . $

It is invariant if composition with $R$ and with $R^(- 1)$ preserves this space.
  An extension is #emph[relatively compact] if its $L^2$ space is generated by these invariant modules.
  The individual modules need not be closed in $L^2$; closure is taken after their union is spanned.
  This is the compact-module characterization in its corrected form [13] Theorem 4.1[14] Theorem 2.5.
  A #emph[relatively distal] extension is a tower of relatively compact extensions and inverse limits.
  Distality without a specified base means distality over the trivial factor.
  These definitions include nonergodic systems; in particular an identity action is compact.

#thm([Proposition 2.2.])[
  (Relative structure).  #emph[The following statements hold for standard probability-preserving systems.]
  + #emph[There is a maximal measure-distal factor $W_Y$. It contains the invariant factor, and $Y arrow.r
    W_Y$ is relatively weakly mixing. A distal factor pulls back into the maximal distal factor of any extension.
    Every measure-preserving automorphism commuting with $R$ preserves $W_Y$.]
  + #emph[Factors and joinings of distal systems are distal.
    A distal system is relatively distal over each of its factors.
    For every nonzero integer $q$, $R$ is distal if and only if $R^q$ is distal.]
  + #emph[Relative weak mixing passes to nonzero integer powers and to conditionally independent base change.
    More generally, the product of relatively weakly mixing fibre laws over any invariant joining of their base
    laws is relatively weakly mixing over that joining.]
  + #emph[A relatively weakly mixing extension and a relatively distal extension of the same base are relatively
    disjoint: the only invariant joining which identifies their base coordinates is the relatively independent joining.]
  + #emph[If $R$ is distal, then, for every $d gt.eq 1$ and bounded $g_1 \, dots.h \, g_d$, the averages
$ 1 / N sum_(n = 1)^N product_(i = 1)^d g_i \( R^(i n) y \) $

 converge almost surely.]
  #emph[If $\( S_Y^t \)_(t in bb(R))$ is a probability-preserving flow,
    the maximal distal factor $W_Y$ of $S_Y^1$ is a flow factor. Its action at every nonzero rational time is distal.]
] <prop:structure>

#proof[
  The existence assertion and the relatively weakly mixing extension are the Furstenberg–Zimmer structure theorem
    [9,26]; its nonergodic probability-algebra formulation is given in [13] Theorems 1.1 and 1.2.
    We recall the consequences needed here, with particular attention to changes of base and of time.
  At a compact stage, an invariant finitely generated module remains such a module after the base is enlarged.
    One may use bounded generators: for a vector of generators transforming by unitary matrices over the base,
    truncate by its invariant pointwise length. Products of bounded generators lie in finitely generated tensor
    modules. Consequently the join of compact stages is compact over the joined base,
    and the same assertion for distal towers follows by passing to closures at limit stages.
    This proves closure under joinings and the assertion about enlarging the base to any factor of a distal
    system. It also shows that distal factors of a system lie in its maximal distal factor.
    Applying this observation to an automorphism commuting with $R$, and then to its inverse,
    shows that it preserves $W_Y$. The invariant factor is compact and therefore belongs to $W_Y$.
  Compact modules for $R$ are compact modules for $R^q$, so distality passes to powers.
    Conversely, suppose $q > 0$ and $R^q$ is distal. Its canonical compact tower is preserved by $R$,
    which commutes with $R^q$. At each successor stage replace an $R^q$-invariant finitely generated module by the
    sum of its first $q$ translates under $R$. This is a finitely generated $R$-invariant module over the same
    base. The resulting tower proves distality for $R$. Negative powers give the same conclusion by inversion.
  For relative weak mixing, the nonnegative summands in (2.2) show that restriction to multiples of a fixed
    positive integer still has Cesàro limit zero. Invariance and complex conjugation handle negative powers.
    To verify the assertion about joined bases, let $Y_j arrow.r
    B_j$ be the extensions and let $sigma$ be an invariant joining of the base measures.
    On the resulting space give the fibres the law
  $ integral ⨂_j m_j \( thin d y_j divides b_j \) thin thin d sigma \( \( b_j \)_j \) . $
  For bounded tensor tests, their conditional correlation over the full base has the form
  #[#set math.equation(numbering: n => "(2.3)")
   $ a \( b \) thin c \( S_B^h b \) product_j
     bb(E) \[ overline(f_j) thin \( g_j compose R_j^h \) divides B_j \] \( b_j \) . $ <eq:product-rwm-correlation>]
  If one $f_j$ is conditionally centred, the squared $L^2 \( sigma \)$ norm is bounded by a constant times the
    squared norm of that factor in $L^2 \( B_j \)$. Here only the $j$th marginal of $sigma$ is used.
    Its Cesàro mean tends to zero. Subtracting the conditional expectation of a tensor and telescoping shows that
    such centred tensors span a dense subspace of the orthocomplement of the full base.
    Bounded approximation now proves the claim. The same calculation with an arbitrary extra base coordinate
    proves stability under conditionally independent base change.
  For relative disjointness we argue with conditional modules.
    The absolute weak-mixing disjointness principle goes back to Furstenberg [8] Part I, Section 7.
    First take a compact extension of the base. A joining defines a base-linear,
    time-intertwining conditional expectation operator from its $L^2$ space to the relatively weakly mixing side.
    It takes each finitely generated invariant module into another such module.
    Relative weak mixing says that the latter lies in the base, so the joining is relatively independent.
    Induct along a distal tower: once independence has been proved at a stage,
    the extension on the other side is the conditionally independent base change of the original relatively weakly
    mixing extension. The preceding calculation allows the compact-stage argument to be repeated.
    Conditional expectations pass to the limit at limit stages.
    This proves relative disjointness without an ergodicity assumption.
    It also gives closure of distal systems under factors: if $D$ is distal and $B$ is its factor,
    then $D$ is distal over the pullback of $W_B$; relative disjointness of $D arrow.r W_B$ and $B arrow.r
    W_B$ forces the latter extension to be trivial.
  For the pointwise assertion, the ergodic case is [12] Theorem C, whose distality is measure-theoretic.
    For a nonergodic distal system, start its compact tower with the invariant factor and disintegrate over that
    factor. The tower is countable on a standard space: its genuinely increasing successor stages give nonzero
    orthogonal differences in a separable $L^2$ space. At each stage choose a countable generating algebra.
    Approximate each of its indicators by functions in the compact modules at a successor stage,
    or in the preceding factors at a limit stage, with summable squared $L^2$ errors.
    Fubini makes these errors summable in the conditional $L^2$ spaces on almost every ergodic component,
    simultaneously for all the chosen approximations. The restricted generating algebras are dense for every
    component measure. The countably many identities expressing invariance of the chosen modules also
    disintegrate. Thus the successor stages remain compact and the limit stages remain generated by their
    predecessors on a common conull set of components. Every intermediate factor has the same invariant algebra,
    so each component tower consists of ergodic systems; its compact extensions are isometric by the
    compact-extension structure theorem. Each component is thus an ergodic distal system.
    The cited theorem applies to the given tuple on almost every component, proving the assertion.
  Finally, every flow time commutes with time one and therefore preserves $W_Y$.
    If $r = p \/ q eq.not 0$ is rational, the $q$th power of its action on $W_Y$ is the distal action at integer
    time $p$. The power assertion gives distality at time $r$. ◻
]

The following norm estimate explains why proper subaverages have a particularly simple law over a distal factor.
  Its proof uses relative weak mixing alone.

#thm([Lemma 2.3.])[
  (A relatively weakly mixing characteristic factor).  #emph[Suppose $Y arrow.r
    B$ is relatively weakly mixing for an invertible transformation $R$.
    If $a_1 \, dots.h \, a_d$ are distinct nonzero integers and $g_1 \, dots.h \, g_d$ are bounded, then
#[#set math.equation(numbering: n => "(2.4)")
 $ ∥1 /
   N sum_(n = 1)^N
   (product_(i = 1)^d g_i compose R^(a_i n) - product_(i = 1)^d bb(E) \[ g_i divides B \] compose R^(a_i n))∥_2
   arrow.r 0 . $ <eq:relative-norm>]

]
] <lem:relative-norm>

#proof[
  By telescoping and scaling, it suffices to consider functions bounded by one, one of which, say $g_s$,
    has conditional mean zero. We induct on $d$, with the empty product as the initial case.
    Set $v_n = product_i g_i compose R^(a_i n)$ and, for a fixed $h gt.eq 1$, put $F_(i \, h) =
    overline(g_i) \( g_i compose R^(a_i h) \)$. Invariance gives
  $ chevron.l v_n \, v_(n + h) chevron.r = integral F_(s \, h) product_(i eq.not s) F_(i \, h) compose
    R^(\( a_i - a_s \) n) thin thin d m . $
  The other coefficients are distinct and nonzero. The induction hypothesis replaces their factors,
    in the average over $n$, by their conditional expectations over $B$, with an error tending to zero.
    Those remaining factors are $B$-measurable and bounded by one, so
  $ limsup_(N arrow.r oo) lr(|1 / N sum_(n = 1)^N chevron.l v_n \, v_(n + h) chevron.r|) lt.eq
    parallel bb(E) \[ F_(s \, h) divides B \] parallel_1 . $
  For $d = 1$ the same inequality holds directly. The Hilbert-space van der Corput inequality bounds the squared
    norm of the averages of $v_n$ by an absolute constant times
  $ 1 / H + 1 / H sum_(h = 1)^H parallel bb(E) \[ F_(s \, h) divides B \] parallel_1 $
  in the limit superior as $N arrow.r oo$. The second term tends to zero by (2.2) for $R^(a_s)$ and
    Cauchy–Schwarz. Letting $H arrow.r oo$ proves the induction. ◻
]

In particular, weak mixing of $T$ gives $L^2$ convergence to the product of the means for all finite distinct
  nonzero linear powers on $X$. In a flow, with $B$ preserved by every time,
  the analogue of (2.4) for deterministic continuous-time averages follows by writing $t = n + s$, $0 lt.eq
  s < 1$. Apply the lemma for each fixed $s$ to $g_i compose S_Y^(a_i s)$,
  and integrate the resulting $L^2$ estimate in $s$. Conditional expectation commutes with these time shifts.
  Bounded convergence and the final interval of length less than one complete the passage to continuous time.

== 3 Selected laws and their distal parameters <sec:selected>

A failure of pointwise convergence allows the averaging length to depend on the initial state.
  We encode this failure in a probability law on four outputs.
  The selection can change their joint law, but the convergence results of Section 2 will determine every proper
  marginal, even after all distal parameters are given.

=== 3.1 From failure to a sequence of selectors <from-failure-to-a-sequence-of-selectors>

Let $C = X times \[ 0 \, 1 \)$ have measure $m_C = mu ⊗ thin d u$ and the roof-one suspension flow

#[#set math.equation(numbering: n => "(3.1)")
 $ S_C^t \( x \, u \) = #scale(x: 120%, y: 120%)[\(] T^(floor.l u + t floor.r) x \, { u +
   t } #scale(x: 120%, y: 120%)[\)] . $ <eq:suspension>]

Write $xi : C arrow.r X$ for its spatial coordinate and $upsilon : C arrow.r bb(R) \/ bb(Z)$ for its phase.
  The use of a flow will let us normalize the action at any one of the four outputs.

#thm([Proposition 3.1.])[
  (Selectors witnessing failure).  #emph[If Theorem 1 fails,
    there are real functions $f_i in L^oo \( mu \)$ with $parallel f_i parallel_oo lt.eq
    1$ and $integral f_i thin thin d mu = 0$, a finite set $F subset \[ 1 \, 2 \]$, measurable functions
$ N_a : C arrow.r { c 2^k : c in F \, med k gt.eq a } \, wide a gt.eq 1 \, $

 a continuous real function $Psi$ on $\( bb(R) \/ bb(Z) \)^I$, and $epsilon.alt_0 > 0$ such that,
   for all sufficiently large $a$,
#[#set math.equation(numbering: n => "(3.2)")
 $ integral_C frac(1, N_a \( z \)) integral_0^(N_a \( z \)) Psi
   #scale(x: 120%, y: 120%)[\(] \( upsilon \( S_C^(i t) z \) \)_(i in I) #scale(x: 120%, y: 120%)[\)]
   product_(i in I) f_i #scale(x: 120%, y: 120%)[\(] xi \( S_C^(i t) z \) #scale(x: 120%, y: 120%)[\)] thin thin d
   t thin thin d m_C \( z \) gt.eq epsilon.alt_0 . $ <eq:selected-positive>]

 The selectors may be chosen independent of the initial phase.]
] <prop:selectors>

#proof[
  Expand each function in the failed assertion into its mean and its centred part.
    Lemma 2 and the $L^2$ conclusion of Lemma 4 show that every proper subaverage converges almost surely to the
    product of its means. Thus a fourfold average of centred functions fails to converge to zero.
    Expanding real and imaginary parts and scaling gives a real tuple bounded by one with the same property.
    Its averages
  $ A_N \( x \) = 1 / N sum_(n = 1)^N product_(i in I) f_i \( T^(i n) x \) $
  converge to zero in $L^2$. After changing the sign of one function if necessary,
    there are $delta > 0$ and a measurable set $E$ of positive measure such that $A_N \( x \) > 2
    delta$ for arbitrarily large $N$, for every $x in E$.
  For bounded summands, changing the averaging length from $N$ to $M$ changes the average by at most $2 \| N -
    M \| \/ max \( N \, M \)$. Choose a finite grid $F subset \[ 1 \, 2 \]$ fine enough that arbitrarily late
    inequalities $A_N \( x \) > 2 delta$ yield arbitrarily late lengths $L =
    c 2^k$ satisfying $A_(floor.l L floor.r) \( x \) > delta$.
    The rounding error tends to zero uniformly as $k arrow.r oo$.
    For $x in E$, choose measurably, from a fixed enumeration, one such length with $k gt.eq a$.
    Set $N_a \( x \, u \)$ equal to that choice. For $x in.not E$, set $N_a \( x \, u \) = 2^a$,
    including $1$ in $F$. Countability of the available lengths gives measurable selectors.
  Choose nonnegative continuous functions $alpha \, beta$ on $bb(R) \/ bb(Z)$, not identically zero,
    with supports respectively in $\( 1 \/ 4 \, 1 \/ 2 \)$ and $\( 0 \, 1 \/ 16 \)$. Define
  $ Psi \( v_1 \, v_2 \, v_3 \, v_4 \) = alpha \( 2 v_1 - v_2 \) thin beta \( v_2 - v_1 \) . $
  For output phases $v_i = u + i t med \( mod med 1 \)$, this equals $alpha \( u \) beta \( { t } \)$.
    On its support, writing $t = n + s$ with $0 lt.eq s < 1$ gives $0 < u + i s < 1$ for every $i in I$.
    Consequently the spatial outputs in (3.2) are precisely $T^(i n) x$.
    If $b_beta = integral_0^1 beta \( s \) thin thin d s$, integration over complete unit intervals yields,
    uniformly in $x \, u$ and $L gt.eq 2$,
  #[#set math.equation(numbering: n => "(3.3)")
   $ 1 / L integral_0^L Psi #scale(x: 120%, y: 120%)[\(] \( u + i t \)_(i in I) #scale(x: 120%, y: 120%)[\)]
     product_i f_i #scale(x: 120%, y: 120%)[\(] xi \( S_C^(i t) \( x \, u \) \) #scale(x: 120%, y: 120%)[\)] thin
     thin d t = alpha \( u \) b_beta A_(floor.l L floor.r) \( x \) + O \( L^(- 1) \) . $ <eq:phase-selector-comparison>]
  The shift from the indices $0 \, dots.h \, floor.l L floor.r - 1$ to $1 \, dots.h \,
    floor.l L floor.r$ costs another $O \( L^(- 1) \)$.
  The integral of the right side over $E times \[ 0 \, 1 \)$ is at least $delta mu \( E \) b_beta integral alpha +
    o \( 1 \)$. Over the complement of $E$ the selected length is deterministic, and $A_(2^a) arrow.r 0$ in $L^2$,
    so its contribution tends to zero. The constant in front of $mu \( E \)$ is positive.
    Choosing $epsilon.alt_0$ smaller than its product with $delta mu \( E \)$ proves the proposition. ◻
]

For the rest of the proof assume failure and fix the functions, selectors and phase test of Proposition 5.
  We use one fixed free ultrafilter $cal(U)$ on the indices $a$.

=== 3.2 A functorial law on four outputs <a-functorial-law-on-four-outputs>

Consider a standard probability-preserving flow $\( Y \, m_Y \, S_Y^t \)$ with an equivariant factor $pi_Y :
  Y arrow.r C$. The selector on $Y$ is $N_a compose pi_Y$. For bounded measurable functions $G_i$ on $Y$,
  define the selected law by

#[#set math.equation(numbering: n => "(3.4)")
 $ integral_(Y^I) product_(i in I) G_i \( y_i \) thin thin d lambda_Y =
   lim_(a arrow.r cal(U)) integral_Y frac(1, N_a \( pi_Y y \)) integral_0^(N_a \( pi_Y y \)) product_(i in I)
   G_i \( S_Y^(i t) y \) thin thin d t thin thin d m_Y \( y \) . $ <eq:selected-law>]

The existence of a countably additive law with this formula is part of the next proposition.

Let $omega_Y : Y arrow.r W_Y$ be the maximal distal factor of time one, write $nu_Y = \( omega_Y \)_(*) m_Y$,
  and disintegrate $m_Y = integral m_(Y \, w) thin thin d nu_Y \( w \)$.
  For a state $\( y_i \)_(i in I)$ of the selected law, put $P_i = omega_Y \( y_i \)$ and $P = \( P_i \)_(i in I)$.

#thm([Proposition 3.2.])[
  (Selected laws).  #emph[Formula (3.4) defines a probability measure $lambda_Y$ on $Y^I$ with the following
    properties.]
  + #emph[Every marginal is $m_Y$, and $lambda_Y$ is invariant under $\( y_i \)_i
    mapsto \( S_Y^(i t) y_i \)_i$ for every $t in bb(R)$. If $theta : Y' arrow.r Y$ is an extension over $C$,
    then $\( theta^I \)_(*) lambda_(Y') = lambda_Y$. These projections also hold for countable inverse limits of
    extensions.]
  + #emph[The law $Lambda_Y$ of $P$ is its deterministic-length law: for bounded $H_i$ on $W_Y$,
#[#set math.equation(numbering: n => "(3.5)")
 $ integral product_i H_i \( w_i \) thin thin d Lambda_Y = lim_(L arrow.r oo) integral_Y 1 /
   L integral_0^L product_i H_i \( omega_Y \( S_Y^(i t) y \) \) thin thin d t thin thin d m_Y \( y \) .
   $ <eq:ordinary-parameter-law>]

]
  + #emph[For every proper subset $J subset.neq I$, the conditional law of $\( y_i \)_(i in J)$ given the
    #emph[entire] parameter array $P$ is
#[#set math.equation(numbering: n => "(3.6)")
 $ "Law"_(lambda_Y) #scale(x: 120%, y: 120%)[\(] \( y_i \)_(i in J) divides P
   #scale(x: 120%, y: 120%)[\)] = ⨂_(i in J) m_(Y \, P_i) . $ <eq:proper-fibres>]

]
  #emph[In a countable inverse limit, functions pulled back from the selected laws at finite stages are dense in
    the $L^2$ space of the limiting selected law.]
] <prop:selected>

#proof[
  Denote the finite-$a$ law in the right side of (3.4) by $lambda_(Y \, a)$.
    For a single bounded measurable function $G$, the ordinary pointwise ergodic theorem for the flow gives,
    since $N_a gt.eq 2^a$,
  $ frac(1, N_a \( pi_Y y \)) integral_0^(N_a \( pi_Y y \)) G \( S_Y^(i t) y \) thin thin d t arrow.r
    bb(E) \[ G divides cal(I)_Y \] \( y \) $
  almost surely, where $cal(I)_Y$ is the invariant factor of the flow.
    Integrating proves convergence of each marginal against every bounded measurable test to $m_Y$.
    Ergodicity is unnecessary.
  Realize $Y$ as a Borel subset of a compact metrizable space $K$.
    The ultralimit of the integrals of continuous functions on $K^I$ is a positive functional of mass one,
    hence a probability measure. Its marginals are $m_Y$, so it is concentrated on $Y^I$.
    For bounded measurable slot functions, approximate each in $L^1 \( m_Y \)$ by continuous functions on $K$,
    with the same uniform bound. The error in a product test is bounded by the sum of the errors in the individual
    marginal tests. The preceding marginal convergence makes this bound valid in the ultralimit as well as under
    the limiting measure. Letting the approximation errors tend to zero proves (3.4) for all bounded slot tests.
  Applying the product action at time $s$ shifts the inner integration interval from $\[ 0 \, N_a \]$ to
    $\[ s \, N_a + s \]$. For tests bounded by one the error is at most $2 \| s \| \/ 2^a$.
    This proves invariance. Notice that the selector is still evaluated at the same initial state;
    no invariance of the selector is required. Pulling back product tests under an extension over $C$ leaves the
    selector unchanged and proves functoriality. A countable inverse limit is again a standard flow,
    and the same formula gives its stated projections. Its coordinate $sigma$-fields are generated by the stage
    coordinate factors; finite products of their functions are dense, proving the last assertion.
    Strong continuity of the product flow in its new $L^2$ space follows first on tensors from the fixed marginal
    laws and then by density.
  We next determine the parameter and proper-slot laws. The pointwise theorem for the distal system $W_Y$ passes
    to continuous time as follows. Write $t = n + s$, $0 lt.eq s < 1$.
    For each fixed $s$ apply Proposition 3(5) to the shifted functions $H_i compose S_(W_Y)^(i s)$.
    Fubini and bounded convergence give pointwise convergence after integrating $s$,
    while the final incomplete unit interval contributes $O \( L^(- 1) \)$.
    Thus the continuous averages converge almost surely along all real lengths.
    Their value at any selected length $N_a \( pi_Y y \)$ has the same limit. Integration gives (3.5).
  For a proper subset $J$, apply precisely this time decomposition to Lemma 2, now on $Y$ itself.
    Its selected $J$-slot marginal is consequently the deterministic-length law.
    The continuous-time version of Lemma 4, over $W_Y$, replaces every slot test $G_i$ in that law by
    $bb(E) \[ G_i divides W_Y \]$. We may also multiply each slot test by an arbitrary bounded function of its
    parameter. It follows that, given the parameter subarray $\( P_i \)_(i in J)$,
    this marginal has the conditional product law $⨂_(i in J) m_(Y \, P_i)$.
  It remains to condition on the parameters outside $J$; marginal conditional independence alone would not justify
    this step. Under the time-one action with speeds $i$, the law just identified is a relatively weakly mixing
    extension of its parameter subarray. Indeed, each $Y arrow.r
    W_Y$ is relatively weakly mixing for the corresponding power,
    and Proposition 3(3) applies over the joining of the base laws.
    The law of the full parameter array is a joining of the distal systems $\( W_Y \, S_(W_Y)^i \)$.
    It is therefore distal, and relatively distal over the parameter subarray.
    The joint law of the $J$ states and all parameters is an invariant joining of these two extensions over their
    common base. Relative disjointness forces it to be the relatively independent one. This is exactly (3.6). ◻
]

For $b in I$ define the normalized flow

#[#set math.equation(numbering: n => "(3.7)")
 $ sans(M)_b \( Y \) = (Y^I \, lambda_Y \, \( y_i \)_i mapsto \( S_Y^(i t \/ b) y_i \)_i) .
   $ <eq:normalized-selected-flow>]

Its projection to slot $b$ is an equivariant extension of $Y$ and therefore of $C$.
  This permits the selected-law construction to be iterated with the same selectors and the same ultrafilter.

#thm([Lemma 3.3.])[
  (Distal parameters after normalization).  #emph[The full parameter array $\( omega_Y \( y_i \) \)_(i in I)$ is a
    distal factor of the time-one map of $sans(M)_b \( Y \)$, and hence belongs to its maximal distal factor.
    The same assertion holds for the arrays of original parameters in every finite iteration of normalized
    selected flows.]
] <lem:parameter-distal>

#proof[
  In slot $i$ the action on the parameter is $S_(W_Y)^(i \/ b)$, which is distal by Proposition 3.
    The full array is a joining of these distal systems and is therefore distal.
    At the next iteration the old distal factors pull into the new maximal distal factors.
    Induction proves the iterated assertion. ◻
]

Finally, the phase test in Proposition 5 can be approximated uniformly by finite sums of products of one-slot
  phase functions. Formula (3.4) therefore applies to its product with the four spatial tests. In particular,

#[#set math.equation(numbering: n => "(3.8)")
 $ integral_(C^I) Psi #scale(x: 120%, y: 120%)[\(] \( upsilon \( z_i \) \)_i #scale(x: 120%, y: 120%)[\)]
   product_i f_i \( xi \( z_i \) \) thin thin d lambda_C gt.eq epsilon.alt_0 . $ <eq:initial-selected-witness>]

The phase array is part of the distal parameter array, since phase rotation is compact.
  Equation (3.8) is the nonzero centred correlation from which the argument of Section 6 will start.

== 4 Packing tensors into a subspace of small dimension <sec:packing>

Selecting an averaging length changes the joint distribution of the variables being averaged.
  The deterministic Hilbert-space estimate in this section will control that change.
  In the application, two independent groups of variables supply the two $L^2$ spaces whose tensor product we
  consider. The estimate is uniform over the testing subspace:
  a subspace of moderately growing dimension captures a substantial part of only a small fraction of the tensors
  in an almost orthogonal family.

Throughout this section the Hilbert spaces are real, tensor products are Hilbert tensor products,
  and logarithms are natural.

#thm([Theorem 4.1.])[
  (Tensor packing).  #emph[There is a universal constant $C$ with the following property.
    Let $0 < epsilon lt.eq 1$, $d gt.eq 1$, and $L gt.eq 0$ be given, with $d \, L$ integers.
    Let $x_1 \, dots.h \, x_m$ and $y_1 \, dots.h \, y_m$ lie in the unit balls of real Hilbert spaces $H_1 \,
    H_2$. For each family suppose that a graph on ${ 1 \, dots.h \,
    m }$ of maximum degree at most $L$ contains every off-diagonal pair whose absolute inner product exceeds
    $eta$, where
$ 0 lt.eq eta lt.eq epsilon^2 \/ 10^4 . $

 The two exceptional graphs may differ. For every orthogonal projection $P$ on $H_1 ⊗ H_2$ of rank at most $d$,
#[#set math.equation(numbering: n => "(4.1)")
 $ \# { n : lr(bar.v.double P \( x_n ⊗ y_n \) bar.v.double) gt.eq epsilon } lt.eq
   frac(C \( 1 + L \), epsilon^2) exp #h(-0.16667em) (C epsilon^(- 2) sqrt(d) log \( 2 + d \)) .
   $ <eq:packing-quantitative>]

 In particular, for
#[#set math.equation(numbering: n => "(4.2)")
 $ d_m = ⌈\( 1 + log m \)^(3 \/ 2)⌉ \, $ <eq:packing-dimension>]

 the left side is $o_(epsilon \, L) \( m \)$, uniformly over the Hilbert spaces, the vectors, the projections,
   and the allowed values of $eta$.]
] <thm:packing>

The proof separates directions on which the testing space has large variance,
  then applies a Gaussian comparison to the remaining directions.
  The comparison is the finite form of the Sudakov–Fernique inequality; see [7] Section 1,
  Equation (1.2) and the minoration in [23]. We first record the matrix estimate needed for this application.
  Its proof is the Gaussian integration-by-parts moment argument underlying matrix Khintchine estimates;
  compare [24] Lemma 6.1 and Proposition 7.3. We include the derivation to display the dependence on the
  covariance trace rather than on the ambient matrix dimensions.

#thm([Lemma 4.2.])[
  (A Gaussian matrix estimate).  #emph[Let $B_1 \, dots.h \,
    B_r$ be matrices between two finite-dimensional real Hilbert spaces, and put
$ H_j = mat(delim: "(", 0, B_j; B_j^(*), 0) \, wide S = sum_(j = 1)^r H_j^2 . $

 If $lr(bar.v.double  bar.v.double) S_(upright("op")) lt.eq sqrt(d)$ and $"tr" S lt.eq 2 d$ for some $d gt.eq 1$,
   then for independent standard normal variables $g_j$,
#[#set math.equation(numbering: n => "(4.3)")
 $ bb(E) ∥sum_(j = 1)^r g_j B_j∥_(upright("op")) lt.eq C d^(1 \/ 4) sqrt(log \( 2 + d \)) .
   $ <eq:packing-gaussian-bound>]

 The constant does not depend on the dimensions of the two spaces.]
] <lem:packing-gaussian>

#proof[
  Write $H = sum_j g_j H_j$. Gaussian integration by parts, followed by differentiation of the matrix power,
    gives for $q gt.eq 2$
  $ bb(E) "tr" H^(2 q) = sum_(j = 1)^r sum_(a = 0)^(2 q - 2) bb(E) "tr" #scale(x: 120%, y: 120%)[\(] H_j H^a H_j
    H^(2 q - 2 - a) #scale(x: 120%, y: 120%)[\)] . $
  For a fixed self-adjoint matrix $H$ with eigenvalues $lambda_u$, and a self-adjoint matrix $K$,
    the absolute value of a summand is at most
  $ sum_(u \, v) \| K_(u v) \|^2 thin \| lambda_v \|^a \| lambda_u \|^(2 q - 2 - a) lt.eq
    "tr" #scale(x: 120%, y: 120%)[\(] K^2 \| H \|^(2 q - 2) #scale(x: 120%, y: 120%)[\)] . $
  The last inequality is weighted arithmetic–geometric mean,
    together with the symmetry $\| K_(u v) \| = \| K_(v u) \|$. Summing in $j$ therefore yields
  #[#set math.equation(numbering: n => "(4.4)")
   $ bb(E) "tr" H^(2 q) lt.eq \( 2 q - 1 \) lr(bar.v.double  bar.v.double) S_(upright("op")) thin bb(E) "tr" \|
     H \|^(2 q - 2) . $ <eq:packing-moment-recursion>]
  Since $bb(E) "tr" H^2 = "tr" S$, iteration gives
  $ bb(E) "tr" H^(2 q) lt.eq \( 2 q - 1 \) ! ! thin lr(bar.v.double  bar.v.double) S_(upright("op"))^(q - 1) "tr" S . $
  The operator norm of $H$ equals that of $sum_j g_j B_j$. Taking a $2
    q$-th root and using the hypotheses bounds its expectation by
  $ C sqrt(q) thin d^(1 \/ 4) \( 2 sqrt(d) \)^(1 \/ \( 2 q \)) . $
  Choose an integer $q gt.eq 2$ comparable to $log \( 2 + d \)$. This proves (4.3). ◻
]

#proof[
  We use repeatedly the following elementary observation. If unit-ball vectors $v_n$ have inner products bounded
    in absolute value by $eta$ outside a graph of degree $L$, then for any nonempty set $A$ of indices,
  #[#set math.equation(numbering: n => "(4.5)")
   $ ∥frac(1, \| A \|) sum_(n in A) v_n∥^2 lt.eq frac(1 + L, \| A \|) + eta . $ <eq:packing-cluster>]
  Indeed, there are at most $\( 1 + L \) \| A \|$ ordered diagonal or exceptional pairs in the expansion of the
    squared norm. Thus a lower bound on the norm of such an average bounds the number of vectors in the set.
  It suffices to work in the finite spans of the $x_n$ and $y_n$.
    To justify this reduction, let $Q$ project onto their tensor product and replace $"Ran"
    P$ by $Q \( "Ran" P \)$. For a vector $z$ in that tensor product,
    its norm of projection onto the new subspace is at least $lr(bar.v.double P z bar.v.double)$:
    in the supremum defining $lr(bar.v.double P z bar.v.double)$,
    a unit testing vector can be replaced by its $Q$-image, whose norm is at most one. The dimension does not increase.
  Identify tensors with matrices from $H_2$ to $H_1$, and let $A_1 \, dots.h \,
    A_r$ be a Hilbert–Schmidt orthonormal basis of the testing space, where $r lt.eq d$. The matrices
  $ R_1 = sum_j A_j A_j^(*) \, wide R_2 = sum_j A_j^(*) A_j $
  have trace $r$. Let $E_1 \, E_2$ be their spectral subspaces for eigenvalues strictly greater than $sqrt(d)$.
    Each has dimension at most $sqrt(d)$.
  Discard the indices for which the projection of $x_n$ onto $E_1$ has norm greater than $epsilon \/ 10$,
    and do the same for $y_n \, E_2$. Cover either exceptional subspace’s unit ball by at most
    $\( 1 + 80 \/ epsilon \)^(sqrt(d))$ balls of radius $epsilon \/ 40$.
    If a ball contains $s$ of the projections being discarded, their average has norm at least $epsilon \/ 20$.
    Applying (4.5) to the original vectors, with $eta lt.eq epsilon^2 \/ 10^4$, gives $s lt.eq
    C \( 1 + L \) epsilon^(- 2)$. The number discarded is consequently at most
  #[#set math.equation(numbering: n => "(4.6)")
   $ C \( 1 + L \) epsilon^(- 2) exp #scale(x: 120%, y: 120%)[\(] sqrt(d) log \( 1 + 80 \/ epsilon \)
     #scale(x: 120%, y: 120%)[\)] . $ <eq:packing-discarded>]
  Let $Q_1 \, Q_2$ project onto $E_1^perp \, E_2^perp$, and set $B_j = Q_1 A_j Q_2$. The coefficient map
  $ z mapsto \( chevron.l A_j \, z chevron.r_(upright("HS")) \)_(j = 1)^r $
  is a contraction. For an index that remains,
  $ lr(bar.v.double x_n ⊗ y_n - Q_1 x_n ⊗ Q_2 y_n bar.v.double) lt.eq
    lr(bar.v.double \( 1 - Q_1 \) x_n bar.v.double) + lr(bar.v.double \( 1 - Q_2 \) y_n bar.v.double) lt.eq
    epsilon \/ 5 . $
  Hence every remaining index counted on the left of (4.1) has coefficient vector
  $ v_n = \( chevron.l x_n \, B_j y_n chevron.r \)_(j = 1)^r \, wide lr(bar.v.double v_n bar.v.double) gt.eq
    epsilon \/ 2 . $
  The map from $x_n ⊗ y_n$ to $v_n$ is still contractive. Outside the union of the two exceptional graphs,
    the tensor inner products have absolute value at most $eta^2$; the union has degree at most $2 L$.
    A set of these coefficient vectors lying in a ball of radius $epsilon \/
    8$ centred at one of them has average norm at least $3 epsilon \/ 8$.
    Applying (4.5) to their preimage tensors shows that the set has at most $C \( 1 + L \) epsilon^(- 2)$ indices.
    A maximal $epsilon \/ 8$-separated subset therefore has cardinality $l$ such that the number still to be
    counted is at most $C \( 1 + L \) epsilon^(- 2) l$.
  It remains to bound this separated set. For $G = sum_j g_j B_j$, the centered Gaussian variables $Z_n =
    chevron.l x_n \, G y_n chevron.r$ have increment variances $bb(E) \| Z_n - Z_(n') \|^2 =
    lr(bar.v.double v_n - v_(n') bar.v.double)^2$. The Gaussian comparison just mentioned gives, for $l gt.eq 2$,
  #[#set math.equation(numbering: n => "(4.7)")
   $ c epsilon sqrt(log l) lt.eq bb(E) max_n Z_n lt.eq bb(E) lr(bar.v.double  bar.v.double) G_(upright("op")) .
     $ <eq:packing-comparison>]
  For completeness, the comparison of two finite centered Gaussian families follows by applying Gaussian
    integration by parts to $beta^(- 1) log sum_n e^(beta z_n)$ along their independent Gaussian interpolation.
    Its derivative is
  $ beta / 4 bb(E) sum_(n \, n') p_n p_(n') (bb(E) \| Z_n - Z_(n') \|^2 - bb(E) \| Z'_n - Z'_(n') \|^2) \, wide
    p_n = frac(e^(beta z_n), sum_j e^(beta z_j)) \, $
  and is nonnegative when the first increment variances dominate.
    Letting $beta$ tend to infinity compares the expected maxima.
    In (4.7), take $Z'_n$ to be independent normals of variance $epsilon^2 \/
    128$ and use the elementary lower bound $bb(E) max_(n lt.eq l) g_n gt.eq c sqrt(log l)$.
  Compression gives
  $ sum_j B_j B_j^(*) lt.eq Q_1 R_1 Q_1 \, wide sum_j B_j^(*) B_j lt.eq Q_2 R_2 Q_2 . $
  Their norms are at most $sqrt(d)$, and their traces are at most $d$. Lemma 9 applies, so (4.7) implies
  $ log l lt.eq C epsilon^(- 2) sqrt(d) log \( 2 + d \) . $
  The case $l lt.eq 1$ satisfies the resulting bound as well.
    Combining this with (4.6), and absorbing $log \( 1 + 80 \/ epsilon \) lt.eq C epsilon^(- 2)$, proves (4.1).
  For $d = d_m$, the exponent in that estimate is $O_epsilon \( \( log m \)^(3 \/ 4) log log m \) =
    o \( log m \)$. The asserted $o \( m \)$ conclusion follows. ◻
]

We will use the conclusion also in averaged form. Since every projection norm is at most one,
  for any fixed accuracy $epsilon$, vectors satisfying the corresponding small-pair hypothesis,
  and an orthogonal projection $P$ of rank at most $d_m$,

#[#set math.equation(numbering: n => "(4.8)")
 $ 1 / m sum_(n = 1)^m lr(bar.v.double P \( x_n ⊗ y_n \) bar.v.double) lt.eq epsilon +
   frac(C \( 1 + L \), m epsilon^2) exp #h(-0.16667em) (C epsilon^(- 2) sqrt(d_m) log \( 2 + d_m \)) .
   $ <eq:packing-average>]

Here $epsilon$ and then $eta$ are fixed before $m$ increases.
  The exceptional degree may depend on this chosen $eta$. In Section 5,
  mixing supplies precisely this order of quantifiers; a uniform rate of mixing will not be needed.

== 5 Channels and preservation of independence <sec:channels>

The selected laws of Section 3 can retain correlations that ordinary averaging would destroy.
  We now specify a class of extensions carrying independent output variables and show that this class survives
  passage to a selected law. There are three groups of outputs.
  Every pair of groups is independent of the original input,
  whereas their full joint law may be correlated with that input.
  This distinction is what permits selection of lengths and still leaves room for the correlations used in the
  final argument.

Write a point of the suspension $C$ as $\( x \, u \)$, with spatial coordinate $x in X$ and phase $u
  in \[ 0 \, 1 \)$. A factor of a flow $Y$ with values in $C$ and speed $q >
  0$ means a measure-preserving map $D : Y arrow.r C$ satisfying $D \( S_Y^t y \) =
  S_C^(q t) D \( y \)$ for every $t$, modulo the usual null sets.

#prodef([Definition 5.1.])[
  A #emph[channel] is a flow extension $pi_Y : \( Y \, m_Y \, S_Y^t \) arrow.r
    C$ together with a finite list of output factors $D_alpha : Y arrow.r C$,
    of positive rational speeds $q_alpha$, partitioned into three groups $cal(D)_1 \, cal(D)_2 \, cal(D)_3$.
    Empty groups are allowed. Let $x_0$ be the spatial coordinate of $pi_Y$, let $x_alpha$ be that of $D_alpha$,
    and let $V$ collect the phases of $pi_Y$ and of all the $D_alpha$. The following conditional laws are required:
  #[#set math.equation(numbering: n => "(5.1)")
   $ cal(L) \( \( x_alpha \)_alpha divides V \) & = ⨂_alpha mu \,\
cal(L) #scale(x: 120%, y: 120%)[\(] x_0 \, \( x_alpha \)_(alpha in union_(j in J) cal(D)_j) divides V
  #scale(x: 120%, y: 120%)[\)] & = mu ⊗ ⨂_(alpha in union_(j in J) cal(D)_j) mu
  wide \( J subset.neq { 1 \, 2 \, 3 } \) . $ <eq:channel-all>]
  The product laws on the right do not depend on $V$.
] <def:channel>

In particular, the original spatial variable is independent of every proper collection of groups,
  even after the phases are given. The definition does not require its independence from all three groups jointly.
  The flow $C$ with no outputs is a channel.

#thm([Lemma 5.2.])[
  #emph[For a channel $Y$, both conditional product identities in (5.1)–(5.1) also hold when conditioning on its
    maximal measure-distal factor $W_Y$. Every flow extension of $Y$,
    equipped with the pulled-back original factor and outputs,
    is a channel and satisfies the same assertion for its own maximal distal factor.]
] <lem:channel-distal>

#proof[
  The phase factor $V$ is a factor of a finite product of circle rotations, and hence belongs to $W_Y$.
    Choose a positive integer $h$ clearing all the output speed denominators.
    For the time-$h$ map the phases are fixed. Each spatial tuple appearing on the right of (5.1) or (5.1),
    conditionally on these phases, has its product measure and evolves under a product of positive integer powers
    of $T$. Such a product is mixing. Consequently the tuple together with $V$ is a relatively weakly mixing
    extension of the fixed phase factor.
  The factor $W_Y$ remains distal for time $h$, and is relatively distal over $V$.
    Relative disjointness in Proposition 3 therefore says that the joining of this spatial tuple with $W_Y$ over
    $V$ is the conditionally independent joining. This is exactly the claimed conditional product law over $W_Y$.
  Passing to an extension does not change the joint distribution in the definition of a channel.
    Apply the same argument to its possibly larger maximal distal factor to obtain the last assertion. ◻
]

Recall that $lambda_Y$ is the selected law on $Y^I$, and that $sans(M)_b \( Y \)$ equips this law with the flow
  whose speed in slot $i$ is $i \/ b$. Projection to slot $b$ is then an extension of $Y$.

#thm([Proposition 5.3.])[
  (Closure under selected laws).  #emph[Let $Y$ be a channel and $b in I$.
    On $sans(M)_b \( Y \)$ use $pi_Y \( y_b \)$ as original factor.
    For each $j in { 1 \, 2 \, 3 }$, let the new group $j$ contain the outputs $D_alpha \( y_i \)$ with $alpha in
    cal(D)_j$ and $i in I$. With these factors, $sans(M)_b \( Y \)$ is a channel.]
] <prop:channel-closure>

The new output speeds are $i q_alpha \/ b$, so they remain positive and rational.
  The content of the proposition is independence. Its proof first treats a proper collection of groups,
  for which conditioning on the selected length preserves independence from the input.
  For all three groups, the selected law can change, and tensor packing provides the needed estimate.

#proof[
  We test the desired laws by products of bounded spatial functions and bounded continuous functions of the new
    phases. Products of separate phase tests determine the phase distribution,
    and fit the slot-test definition of $lambda_Y$. Linear combinations and bounded approximation then suffice for
    all tests in (5.1)–(5.1). By taking real and imaginary parts,
    expanding each spatial test into its mean and centered part, and scaling,
    we may take every spatial factor to be either $1$ or a real centered function bounded by one.
    It remains to prove that the tested integral tends to zero whenever at least one such centered factor occurs.
  We work first under the input measure $m_Y$, conditionally on its phase vector $V$.
    Choose a positive integer $h$ such that $h q_alpha$ is integral for every output,
    and split the time in the averaging formula as
  #[#set math.equation(numbering: n => "(5.2)")
   $ t = h n + s \, wide 0 lt.eq s < h . $ <eq:channel-time-split>]
  For fixed $V \, s$, every phase test is independent of $n$.
    A spatial factor from output $alpha$ in slot $i$ is evaluated at
  #[#set math.equation(numbering: n => "(5.3)")
   $ T^(e_alpha i n + a_(alpha \, i)) x_alpha \, wide e_alpha = h q_alpha in bb(N) \, $ <eq:channel-affine-times>]
  where the integer offsets $a_(alpha \, i)$ range over fixed finite sets as $V \, s$ vary.
    The original coordinate in slot $b$ is evaluated at $T^(h b n + a_0) x_0$,
    again with finitely many possible offsets.
  If a selected length is $N = c 2^k$, replace it by the union of its $m =
    floor.l N \/ h floor.r$ complete intervals of length $h$ and normalize the resulting sum by $m$.
    The error in an average of a unit-bounded test is at most $2 h \/ N$.
    It tends to zero uniformly over all selected lengths as $a arrow.r oo$.
    We can thus integrate $s$ uniformly over $\[ 0 \, h \)$ and study averages of $m$ terms.
    Discarding any fixed number of initial indices has the same uniformly vanishing cost.
  #emph[Proper collections of groups.] Under (5.1), the spatial variables in these groups are independent of $x_0$
    and of one another, conditionally on $V$. The length $N_a$ is a function of $\( x_0 \, u_0 \)$,
    with $u_0$ fixed by $V$. If at least one output factor is centered,
    the expectation of the output product tends to zero as $n arrow.r oo$:
    first factor it across the independent input outputs, then use mixing of all orders for the distinct slot
    times belonging to each individual output. Here and below we use the main theorem of [22] for fixed bounded
    functions. The gaps in (5.3) diverge within each output, and there are only finitely many offset patterns.
    This convergence is uniform in $V \, s$. More explicitly,
    let $R_n \( V \, s \)$ denote that output expectation and choose $n_0$ so that $\| R_n \( V \, s \) \| lt.eq
    delta$ for $n gt.eq n_0$. Conditional on $x_0 \, V \, s$,
    the absolute value of the output-averaged tested sum is at most
  $ frac(1, m \( x_0 \, V \)) sum_(n < m \( x_0 \, V \)) \| R_n \( V \, s \) \| lt.eq delta +
    frac(n_0, floor.l 2^a \/ h floor.r) . $
  Here the original-coordinate test is bounded by one, and the denominator is positive for large $a$.
    The bound handles both the selected cutoff and its normalization; integration and then $a arrow.r oo$,
    $delta arrow.b 0$ give zero limit.
  If all output factors equal $1$ and the original-coordinate test is centered,
    Birkhoff’s theorem for the ergodic power $T^(h b)$ gives zero almost-sure limit of its averages,
    simultaneously for the finitely many offsets. The selected $m$ tends to infinity at every input point,
    so bounded convergence proves zero limit also for the selected averages.
    This establishes the channel rule involving the original coordinate.
  #emph[All three groups.] There is no original-coordinate test in this case.
    Terms in which one group has no centered occurrence were just handled by the proper-group argument.
    Suppose, then, that every group contains a centered occurrence.
    For fixed $V \, s$ let $Omega_j$ be the product of copies of $\( X \, mu \)$ for the input outputs in group
    $j$, and write the three group products as
  $ x_n in L^2 \( Omega_1 \) \, wide y_n in L^2 \( Omega_2 \) \, wide w_n in L^2 \( Omega_3 \) . $
  All have norms at most one. Before a length event is imposed,
    the conditional law of these three input groups given $V$ is their product law.
    Phase weights remain outside these Hilbert-space vectors:
    the spatial functions are fixed, and their dependence on $V \,
    s$ is only through the finitely many integer offsets in (5.3).
  For any fixed $eta > 0$, the families $x_n \, y_n$ satisfy the small-pair hypothesis of Theorem 8,
    after finitely many initial indices are removed. To see this,
    expand a pair inner product into expectations over the independent outputs in that group.
    One output has a centered occurrence. Mixing of all orders makes its expectation small when the distinct times
    from the two indices are all sufficiently far apart. Within either index, this holds for large $n$ and $n'$.
    A remaining obstruction requires
  $ \| e_alpha i n - e_alpha i' n' + a \| lt.eq R $
  for one of finitely many choices of $i \, i' \, a$ and a fixed $R$.
    For each $n$ there are boundedly many $n'$ satisfying any such inequality, since $e_alpha i' > 0$.
    The obstructing pairs therefore form a graph of bounded degree $L$.
    The constants and the initial cutoff depend on $eta$ and the fixed tests;
    the finite offset patterns make them uniform in $V \, s$.
  Condition further on an event $E_(k \, c) = { N_a = c 2^k }$ with conditional probability $p_(k \, c) =
    bb(P) \( E_(k \, c) divides V \) > 0$. Repeated values of $c
    2^k$ are assigned one index so that these events partition the space. Write $p = p_(k \, c)$.
    The event is determined by $x_0$ once $V$ is fixed. By (5.1),
    conditioning on it preserves the product marginal on any two groups and the marginal on each single group.
    The three-group law need not remain a product. Its density $rho$ with respect to the original three-group
    product measure satisfies
  #[#set math.equation(numbering: n => "(5.4)")
   $ 0 lt.eq p rho lt.eq 1 \, wide integral p rho = p \, lr(bar.v.double p rho bar.v.double)_2 lt.eq
     sqrt(p) . $ <eq:channel-density>]
  Indeed, for any measurable set of group coordinates its probability jointly with $E_(k \, c)$ is at most its
    original product probability.
  For the $m$ terms corresponding to this length, put $z_n = x_n ⊗ y_n$.
    We choose a dimension small enough that the packing bound is $o \( m \)$ and large enough that its reciprocal
    is summable over the length classes. The choice $d_m = ceil.l \( 1 + log m \)^(3 \/ 2)
    ceil.r$ has both properties: for $m asymp 2^k$, its reciprocal is $O \( \( 1 + k \)^(- 3 \/ 2) \)$.
    Let $P_m$ project onto $d_m$ orthonormal eigenvectors of $sum_n z_n
    z_n^(*)$ corresponding to its largest eigenvalues, counted with multiplicity.
    If the range has smaller dimension, take the whole range; inside a tied eigenspace make any fixed choice.
    Fix $0 < epsilon lt.eq 1$, and choose $0 < eta lt.eq epsilon^2 \/ 10^4$ first. Equation (4.8) gives
  #[#set math.equation(numbering: n => "(5.5)")
   $ 1 / m sum_n lr(bar.v.double P_m z_n bar.v.double) lt.eq epsilon +
     o_(epsilon \, L) \( 1 \) . $ <eq:channel-leading-average>]
  If an initial cutoff of $n_0$ indices was needed, apply the general bound (4.1) to the $m -
    n_0$ remaining vectors with the original rank bound $d_m$.
    The numerator in that bound is still $m^(o \( 1 \))$, and the discarded indices cost at most $n_0 \/ m$.
    This proves (5.5) with the cutoff as well. All norms here are for the original product measures.
  Under the event law the first two groups still have their product marginal,
    and the third retains its original marginal. Cauchy–Schwarz under this law therefore bounds the contribution
    from a term $\( P_m z_n \) w_n$, including the probability of the event,
    by $p lr(bar.v.double P_m z_n bar.v.double)$. Thus its averaged contribution is bounded by $p$ times the right
    side of (5.5).
  Write $z'_n = \( 1 - P_m \) z_n$. The covariance has trace at most $m$,
    so its $\( d_m + 1 \)$-st eigenvalue is at most $m \/ \( d_m + 1 \)$ whenever a residual is present.
    The residual Gram matrix $A = \( chevron.l z'_n \, z'_(n') chevron.r \)_(n \, n')$ has norm at most $m \/
    d_m$. The Gram matrix $B = \( chevron.l w_n \, w_(n') chevron.r \)_(n \, n')$ is positive with trace at most
    $m$. Consequently
  #[#set math.equation(numbering: n => "(5.6)")
   $ ∥1 / m sum_n z'_n ⊗ w_n∥_2^2 = frac("tr" \( A B \), m^2) lt.eq 1 / d_m . $ <eq:channel-residual>]
  Combining (5.4) and (5.6) bounds the residual contribution from this event by $sqrt(p \/ d_m)$.
  It remains to sum over every possible length. For the fixed integer $h$, we have $m =
    floor.l c 2^k \/ h floor.r asymp 2^k$ at large $k$, uniformly for $c in F$.
    Thus $d_m asymp \( 1 + k \)^(3 \/ 2)$, and
  #[#set math.equation(numbering: n => "(5.7)")
   $ sum_(k gt.eq a \, med c in F) sqrt(p_(k \, c) \/ d_(m \( k \, c \))) lt.eq
     (sum_(k \, c) p_(k \, c))^(1 \/ 2) (sum_(k gt.eq a \, med c in F) d_(m \( k \, c \))^(- 1))^(1 \/ 2) arrow.r
     0 . $ <eq:channel-tail>]
  The first factor is one, and the second is a tail of a convergent series.
    The leading-space contributions sum to at most $epsilon +
    o_(epsilon \, L) \( 1 \)$ because the event probabilities sum to one.
    First let $a arrow.r oo$, then let $epsilon arrow.b 0$. This proves the all-group product rule.
  All estimates were uniform over the finitely many offset patterns.
    For each pattern and each integer $m$, the finite-dimensional projections can be chosen once,
    so their use causes no measurability problem. We may now integrate in $V \, s$ and restore the phase test.
    The uniformly vanishing endpieces do not affect the selected law.
    Both defining channel identities have been proved. ◻
]

#thm([Corollary 5.4.])[
  #emph[In Proposition 12, let $P = \( omega_Y \( y_i \) \)_(i in I)$ be the array of old distal parameters.
    The spatial coordinates of all copied outputs are independent with their product law conditionally on $P$.
    The corresponding assertion holds after any finite iteration of that proposition,
    conditionally on the complete array of old $W_Y$-parameters.]
] <cor:channel-array-distal>

#proof[
  Lemma 7 places the old parameter array in the maximal distal factor of the new flow,
    including after any finite iteration. Repeated application of Proposition 12 supplies its channel structure.
    Lemma 11 gives the conditional product law over that maximal distal factor, hence over the old parameter array. ◻
]

The channel and its tests are fixed before the selected limit is taken.
  The packing estimate and the summation over length classes require no uniform mixing estimates over different
  channels or over all iteration depths.

== 6 Activating an additional output role <sec:activation>

The channel construction supplies independent spatial outputs even after the averaging length has been selected.
  We now use that independence to eliminate the nonzero correlation supplied by Proposition 5.
  The argument counts how many of its four factors can be read from channel outputs.
  After bounding this number and choosing a correlation with the maximal number of output roles,
  we take an extension that stabilizes certain conditional expectations.
  This will permit a correlation with one additional output role, contradicting maximality.

Throughout this section the selectors, and hence the assignment $Y mapsto lambda_Y$, are fixed.
  For a channel $Y$, write $d_Y \( y \)$ for its full list of spatial outputs and $x_Y \( y \)$ for the spatial
  coordinate of its factor $pi_Y \( y \) in C$. If the output list has length $m$,
  its spatial product law is $mu^(⊗ m)$; when $m = 0$ this is the one-point probability space.
  All functions used below are real and bounded.

=== 6.1 Correlations and an upper bound on output roles <correlations-and-an-upper-bound-on-output-roles>

For $A subset.eq I$, consider a correlation

#[#set math.equation(numbering: n => "(6.1)")
 $ integral Phi \( P \) product_(i in A) h_i \( d_Y \( y_i \) \) product_(i in.not A) h_i \( x_Y \( y_i \) \) thin
   thin d lambda_Y \, wide P = \( omega_Y \( y_i \) \)_(i in I) . $ <eq:role-correlation>]

Here $Phi$ is an arbitrary bounded measurable function of the complete distal parameter array.
  Each $h_i$ is centred for its spatial law: $mu^(⊗ m)$ when $i in A$ and $mu$ otherwise.
  We call the indices in $A$ the #emph[output roles]. The functions in an output role may depend jointly on the
  whole output list. Lemma 11 implies that every factor in (6.1) is also centred conditionally on its own
  parameter $P_i$.

The channel with no outputs is permitted by Definition 10.
  The phase test in Proposition 5 is measurable in the distal parameters of the suspension.
  Thus that proposition gives a nonzero correlation (6.1) with $A = diameter$.
  Consequently, under the supposition of pointwise failure, there is a largest number $r in { 0 \, 1 \, 2 \, 3 \,
  4 }$ of output roles in any nonzero correlation of this form, over all channels and all such tests.

#thm([Proposition 6.1.])[
  #emph[Every nonzero correlation (6.1) has at most two output roles.
    In particular, the maximal number $r$ just defined satisfies $r lt.eq 2$.]
] <prop:role-bound>

#proof[
  Apply Proposition 12 to $Y$, with any normalizing slot $b$.
    In the channel $sans(M)_b \( Y \)$, all the copied outputs from its four slots have their spatial product law.
    This continues to hold conditionally on the old parameter array $P$, by Corollary 13.
    This makes (6.1) zero when $\| A \| = 4$.
  Suppose now that $\| A \| = 3$, and let $b$ be the remaining slot. Starting with $Y_0 = Y$, define
  $ Y_(n + 1) = sans(M)_b \( Y_n \) \, wide n gt.eq 0 \, $
  using at each step the outputs and group assignment in Proposition 12.
    The state of $Y_n$ is an array of $Y$-states indexed by $I^n$.
    The projection to slot $b$ at each new axis respects the flows, since that slot has speed $b \/ b = 1$.
  In this array, consider the $n$ coordinate lines through the corner $\( b \, dots.h \, b \)$.
    Each line has law $lambda_Y$. To check this without any symmetry assertion,
    first fix all but one coordinate at $b$. Projection along a coordinate fixed at $b$ is an equivariant factor
    map. If the remaining coordinate is the newly added one, functoriality of the selected law projects it to
    $lambda_Y$; if it is an earlier coordinate, the new slot-$b$ marginal is the preceding array law.
    Induction proves the assertion for every line.
  All spatial output lists throughout the array are independent conditionally on its full array of old
    $W_Y$-parameters, again by Corollary 13. Write $\( y_i^(\( a \)) \)_(i in I)$ for coordinate line $a$ and
    $P^(\( a \)) = \( omega_Y \( y_i^(\( a \)) \) \)_i$ for its parameter array. Put
  $ H_a = Phi \( P^(\( a \)) \) product_(i eq.not b) h_i \( d_Y \( y_i^(\( a \)) \) \) . $
  The products for two different lines use disjoint output lists, since neither uses the common corner.
    Conditional independence and centring give $bb(E) \[ H_a H_(a') \] = 0$ for $a eq.not a'$.
    Also $lr(bar.v.double H_a bar.v.double)_2 lt.eq K$ for a constant $K$ depending only on the fixed tests.
    If $H = h_b \( x_Y \( upright("corner") \) \)$ and $c eq.not 0$ is the original correlation,
    the line-marginal identity gives $chevron.l H \, H_a chevron.r = c$ for every $a$.
    Bessel’s inequality therefore yields
  $ n \| c \|^2 lt.eq K^2 lr(bar.v.double  bar.v.double) H_2^2 . $
  As $n$ is arbitrary, this is impossible. ◻
]

=== 6.2 Stabilizing conditional expectations under extension <stabilizing-conditional-expectations-under-extension>

The next extension construction prevents extra information in a later system from changing the conditional laws
  that we shall use. It is an energy-increment construction of the kind used for sated extensions [2] Theorem 3.11
  and Lemma 3.12; we give the argument for the selected-law assignment needed here.

On $\( Y^I \, lambda_Y \)$ introduce the five sigma-algebras

#[#set math.equation(numbering: n => "(6.2)")
 $ cal(D)_0 \( Y \) = sigma \( P \) \, wide cal(D)_l \( Y \) =
   sigma #scale(x: 120%, y: 120%)[\(] P \, \( y_i \)_(i eq.not l) #scale(x: 120%, y: 120%)[\)] \, quad
   l in I . $ <eq:saturation-data>]

If $rho : Y' arrow.r Y$ is an extension over $C$, functoriality gives the factor map
  $rho^I : \( Y' ""^I \, lambda_(Y') \) arrow.r \( Y^I \, lambda_Y \)$.
  The pullback of each $cal(D)_l \( Y \)$ is contained in $cal(D)_l \( Y' \)$,
  since the old distal factor is contained in the new one.

#thm([Proposition 6.2.])[
  #emph[Every standard flow over $C$ has a standard extension $Y$ with the following property.
    For every further standard extension $rho : Y' arrow.r Y$ over $C$, every $f in L^2 \( lambda_Y \)$,
    and every $l in { 0 } union I$,
#[#set math.equation(numbering: n => "(6.3)")
 $ bb(E)_(lambda_(Y')) \[ f compose rho^I divides cal(D)_l \( Y' \) \] =
   bb(E)_(lambda_Y) \[ f divides cal(D)_l \( Y \) \] compose rho^I . $ <eq:saturation-identity>]

 If the initial flow is a channel, the extension is a channel with the same outputs pulled back to it.]
] <prop:saturation>

#proof[
  For a test $f$ on a selected joining and a datum type $l$, call
  $ parallel bb(E) \[ f divides cal(D)_l \] #scale(x: 120%, y: 120%)[parallel]_2^2 $
  its energy. Under extensions this number increases and remains bounded by $lr(bar.v.double  bar.v.double)
    f_2^2$. Starting from the given system $Y_0$, build a sequence of extensions $Y_0 arrow.l Y_1 arrow.l
    dots.h.c$. At each stage introduce a countable dense subset of the new selected joining’s $L^2$ space and
    retain all previously introduced tests by pullback. Schedule every retained test and every datum type
    infinitely often, with positive tolerances tending to zero.
    At a scheduled step, take an extension whose energy is within the prescribed tolerance of the supremum over
    all standard extensions of the present system. Such an extension exists by the definition of a supremum.
  Let $Y$ be the countable inverse limit. It is a standard flow over $C$.
    By Proposition 6, its selected law projects to all the stage laws.
    The union of the stage $L^2$ spaces is dense in $L^2 \( lambda_Y \)$:
    the sigma-algebra on the fourfold inverse limit is generated by its stage coordinate factors.
  Fix a retained test $f$, a datum type $l$, and an extension $Y'$ of $Y$.
    If stage $n + 1$ optimized this pair with error $epsilon.alt_n$,
    then $Y'$ is also an extension available over stage $n$. Hence
  $ "energy"_(Y') \( f \) & lt.eq sup_(R arrow.r Y_n) "energy"_R \( f \)\
 & lt.eq "energy"_(Y_(n + 1)) \( f \) + epsilon.alt_n lt.eq "energy"_Y \( f \) + epsilon.alt_n . $
  Along the scheduled subsequence $epsilon.alt_n arrow.r 0$.
    Monotonicity gives the opposite inequality, so the two energies are equal.
    The old conditional-expectation subspace is contained in the new one;
    equality of the two projection norms therefore implies equality of the projections.
    This proves (6.3) for the retained tests. Conditional expectation is an $L^2$ contraction,
    so density proves it for every $f in L^2 \( lambda_Y \)$.
  This argument uses only inclusion of the datum spaces under extension;
    it does not require an inverse-limit identity for maximal distal factors.
    Finally, Lemma 11 shows that retaining the outputs makes every stage and the limit a channel. ◻
]

We call a system satisfying Proposition 15 #emph[saturated].
  A nonzero correlation persists under the passage to a saturated extension:
  its functions pull back, and its old parameter test remains measurable in the enlarged distal parameters.

=== 6.3 A channel carrying the three other factors <a-channel-carrying-the-three-other-factors>

Choose a nonzero correlation with the maximal number $r$ of output roles,
  and replace its channel by a saturated extension $Y$. Retain the notation $A \, Phi \, h_i$ for its tests.
  Proposition 14 gives $r lt.eq 2$, so choose $b in I \\ A$. Set

$ Z = sans(M)_b \( Y \) \, wide Z arrow.r Y \, quad \( y_j \)_(j in I) mapsto y_b . $

Its state law is $lambda_Y$. We give $Z$ a new channel structure adapted to this particular correlation.
  Keep the full old output list from slot $b$, and for every $j eq.not b$ add the list

#[#set math.equation(numbering: n => "(6.4)")
 $ Q_j = cases(delim: "{", d_Y \( y_j \) \, & j in A \,, x_Y \( y_j \) \, & j in.not A \,) $ <eq:added-output-lists>]

where in the second case the actual flow factor added is the copy of $C$ in that slot.
  Index the new three groups by $j in I \\ { b }$. Put $Q_j$ in group $j$ and assign the three old groups from
  slot $b$ bijectively to these new groups. All speeds are positive rationals.

#thm([Lemma 6.3.])[
  #emph[With these outputs and groups, $Z$ is a channel over its slot-$b$ copy of $C$.]
] <lem:regrouped-channel>

#proof[
  Condition first on the entire old parameter array $P$ in $lambda_Y$.
    The full output collection consists of one list at each slot:
    $Q_j$ at $j eq.not b$, and the old list $d_Y \( y_b \)$ at $b$.
    Every proper collection of these slot lists has its spatial product law by Proposition 6 and Lemma 11.
    To verify the full product law, test by a product of one bounded spatial function of each list and expand each
    function into its mean and centred part. Every term except the all-centred term is already determined by a
    proper marginal. If the all-centred conditional term were nonzero,
    some bounded test of $P$ would have nonzero integral against it.
    This would be a correlation (6.1) on $Y$ with output roles $A union { b }$, contradicting maximality of $r$.
    Thus the full collection has product law conditionally on $P$.
  Now take a proper subset of the three new groups together with the original spatial coordinate $x_Y \( y_b \)$.
    At least one slot $j eq.not b$ is absent. At slot $b$, only a proper subset of the old three groups has been
    retained. The conditional independence of the corresponding proper set of slots,
    followed by the old channel rule at slot $b$, gives the required spatial product law conditionally on $P$.
    All phases of the new channel are functions of $P$. Integrating the two product laws down to those phases
    proves the two conditions in Definition 10. ◻
]

Write

#[#set math.equation(numbering: n => "(6.5)")
 $ q \( \( y_j \)_(j in I) \) = product_(j in A) h_j \( d_Y \( y_j \) \) product_(j in.not A union { b })
   h_j \( x_Y \( y_j \) \) . $ <eq:outside-product>]

It is a function of the three added lists $Q_j$ in a single $Z$-state. With $y = y_b$, define

#[#set math.equation(numbering: n => "(6.6)")
 $ g \( P \, y \) = bb(E)_(lambda_Y) \[ q divides P \, y_b \] \, wide u \( e \, y \) =
   bb(E)_(m_Z) \[ q divides omega_Z \, y_b \] \, quad e = omega_Z . $ <eq:g-and-u>]

The original nonzero correlation equals $bb(E) \[ Phi \( P \) h_b \( x_Y \( y_b \) \) g \( P \, y_b \) \]$,
  so $g$ is nonzero in $L^2$. The two conditional expectations in (6.6) use the same state law,
  but different parameter information: $e$ contains the old array $P$ and may contain more.

=== 6.4 The square and its conditional laws <the-square-and-its-conditional-laws>

The selected law $lambda_Z$ is a law on a square of $Y$-states.
  Write $upright(bold(z))_i = \( y_(i j) \)_(j in I)$ for row $i$, a $Z$-state, and set

$ P_(i j) = omega_Y \( y_(i j) \) \, wide E_i = omega_Z \( upright(bold(z))_i \) \, wide E = \( E_i \)_(i in I) . $

Each $E_i$ contains the complete old parameter row $\( P_(i j) \)_j$, by Lemma 7. In column $b$ put

$ y_i = y_(i b) \, wide p = \( P_(i b) \)_(i in I) \, wide w = P_(b b) . $

Functoriality for $Z arrow.r Y$ says that this column has law $lambda_Y$.
  Row $b$ has the same law because a single $Z$-state has law $lambda_Y$. Our aim is to show that

$ bb(E) #scale(x: 120%, y: 120%)[\[] q \( \( y_i \)_i \) q \( upright(bold(z))_b \) divides E
  #scale(x: 120%, y: 120%)[\]] equiv.not 0 . $

The row factor $q \( upright(bold(z))_b \)$ is read from the added outputs,
  so it is the candidate for the additional output role at $b$.
  To establish nonvanishing, saturation will first identify the column law given $E$ and the conditional
  expectation of the row factor given that column. Figure 1 distinguishes these two uses of the old selected law.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((0.655, -1.25), (1.785, -0.51), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10))
  rect((1.875, -1.25), (3.005, -0.51), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10))
  rect((3.095, -1.25), (4.225, -0.51), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10))
  rect((4.315, -1.25), (5.445, -0.51), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10))
  rect((0.655, -2.13), (1.785, -1.39), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10))
  rect((1.875, -2.13), (3.005, -1.39), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10))
  rect((3.095, -2.13), (4.225, -1.39), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10))
  rect((4.315, -2.13), (5.445, -1.39), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10))
  rect((0.655, -3.01), (1.785, -2.27), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10))
  rect((1.875, -3.01), (3.005, -2.27), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10))
  rect((3.095, -3.01), (4.225, -2.27), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10))
  rect((4.315, -3.01), (5.445, -2.27), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10))
  rect((0.655, -3.89), (1.785, -3.15), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10))
  rect((1.875, -3.89), (3.005, -3.15), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10))
  rect((3.095, -3.89), (4.225, -3.15), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10))
  rect((4.315, -3.89), (5.445, -3.15), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10))
  rect((1.879, -3.881), (3.001, -0.5192), fill: rgb("#e6e6ff"), stroke: none)
  rect((0.6588, -2.121), (5.441, -1.399), fill: rgb("#ffe9d4"), stroke: none)
  rect((1.879, -2.121), (3.001, -1.399), fill: black, stroke: none)
  rect((0.6588, -1.241), (1.781, -0.5192), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10))
  rect((1.879, -1.241), (3.001, -0.5192), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10))
  rect((3.099, -1.241), (4.221, -0.5192), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10))
  rect((4.319, -1.241), (5.441, -0.5192), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10))
  rect((0.6588, -2.121), (1.781, -1.399), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10))
  rect((1.879, -2.121), (3.001, -1.399), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10))
  rect((3.099, -2.121), (4.221, -1.399), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10))
  rect((4.319, -2.121), (5.441, -1.399), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10))
  rect((0.6588, -3.001), (1.781, -2.279), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10))
  rect((1.879, -3.001), (3.001, -2.279), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10))
  rect((3.099, -3.001), (4.221, -2.279), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10))
  rect((4.319, -3.001), (5.441, -2.279), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10))
  rect((0.6588, -3.881), (1.781, -3.159), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10))
  rect((1.879, -3.881), (3.001, -3.159), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10))
  rect((3.099, -3.881), (4.221, -3.159), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10))
  rect((4.319, -3.881), (5.441, -3.159), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10))
  content((1.22, -0.132), [#text(size: 9pt)[$j_1$]])
  content((2.44, -0.132), [#text(size: 9pt)[$b$]])
  content((3.66, -0.132), [#text(size: 9pt)[$j_2$]])
  content((4.88, -0.132), [#text(size: 9pt)[$j_3$]])
  content((0.061, -0.88), [#text(size: 9pt)[$i_1$]])
  content((0.061, -1.76), [#text(size: 9pt)[$b$]])
  content((0.061, -2.64), [#text(size: 9pt)[$i_2$]])
  content((0.061, -3.52), [#text(size: 9pt)[$i_3$]])
  content((2.44, -0.88), [#text(size: 9pt)[$y_(i_1)$]])
  content((2.44, -1.76), [#text(size: 9pt)[$y_b$]])
  content((2.44, -2.64), [#text(size: 9pt)[$y_(i_2)$]])
  content((2.44, -3.52), [#text(size: 9pt)[$y_(i_3)$]])
  content((1.22, -1.76), [#text(size: 9pt)[$y_(b j_1)$]])
  content((3.66, -1.76), [#text(size: 9pt)[$y_(b j_2)$]])
  content((4.88, -1.76), [#text(size: 9pt)[$y_(b j_3)$]])
  content((1.22, -0.88), [#text(size: 7pt)[$P_(i_1j_1)$]])
  content((3.66, -0.88), [#text(size: 7pt)[$P_(i_1j_2)$]])
  content((4.88, -0.88), [#text(size: 7pt)[$P_(i_1j_3)$]])
  content((1.22, -2.64), [#text(size: 7pt)[$P_(i_2j_1)$]])
  content((3.66, -2.64), [#text(size: 7pt)[$P_(i_2j_2)$]])
  content((4.88, -2.64), [#text(size: 7pt)[$P_(i_2j_3)$]])
  content((1.22, -3.52), [#text(size: 7pt)[$P_(i_3j_1)$]])
  content((3.66, -3.52), [#text(size: 7pt)[$P_(i_3j_2)$]])
  content((4.88, -3.52), [#text(size: 7pt)[$P_(i_3j_3)$]])
  content((5.734, -0.88), [#text(size: 9pt)[$E_(i_1) supset.eq (P_(i_1j))_j$]], anchor: "west", padding: 0.1176cm)
  content((5.734, -1.76), [#text(size: 9pt)[$E_b supset.eq (P_(b j))_j$]], anchor: "west", padding: 0.1176cm)
  content((5.734, -2.64), [#text(size: 9pt)[$E_(i_2) supset.eq (P_(i_2j))_j$]], anchor: "west", padding: 0.1176cm)
  content((5.734, -3.52), [#text(size: 9pt)[$E_(i_3) supset.eq (P_(i_3j))_j$]], anchor: "west", padding: 0.1176cm)
  content((2.44, -4.136), [#text(fill: rgb("#0000a6"))[#text(size: 9pt)[$p=(P_(i b))_i$]]], anchor: "north", padding: 0.1176cm)
  content((6.588, -4.136), [#text(fill: rgb("#a65300"))[#text(size: 9pt)[$q( bold(z)_b) "uses" "row" b "off" "the" "corner"$]]], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 1: The square under $lambda_Z$. Blue marks column $b$, whose old parameter array is $p$; orange marks the row containing the added outputs used by $q$. Their common corner has parameter $w = P_(b b)$. The new parameters $E_i$ contain the respective old parameter rows. The distinguished slot is drawn in second position for legibility. The figure records marginal and factor relations, not exchangeability of the two axes. ],
) <fig:activation-square>

#thm([Lemma 6.4.])[
  #emph[In the square just defined, the conditional law of column $b$ given $E$ is its $lambda_Y$ law given $p$.
    Moreover,
#[#set math.equation(numbering: n => "(6.7)")
 $ bb(E)_(lambda_Z) \[ q \( upright(bold(z))_b \) divides E \, \( y_i \)_(i in I) \] =
   u \( E_b \, y_b \) . $ <eq:square-row-locality>]

 In particular, the conditional law of $y_b$ given $E$ is $m_Y \( thin d y divides w \)$; in a single $Z$-state,
   the conditional law of its slot-$b$ state given $e = omega_Z$ is the same fibre law over its old slot-$b$ parameter.]
] <lem:square-conditional>

#proof[
  Apply saturation of $Y$ to the extension $Z arrow.r Y$. Under the induced map $Z^I arrow.r Y^I$,
    the old joining is precisely column $b$, and the new datum $cal(D)_0 \( Z \)$ is $sigma \( E \)$.
    Equation (6.3) for $l = 0$, first on a countable determining family,
    gives the first conditional-law assertion. The singleton case of Proposition 6 then gives
  #[#set math.equation(numbering: n => "(6.8)")
   $ cal(L) \( y_b divides E \) = m_Y \( dot.op divides w \) . $ <eq:corner-fibre-law>]
  Taking the row-$b$ marginal and applying the tower property from $E$ to its coordinate $E_b$ gives the stated
    single-state assertion.
  For (6.7), fix $l eq.not b$ and denote by $upright(bold(z))_(- l)$ all rows except row $l$.
    Given $E$, these three rows are independent with their $Z$ fibre laws, by Proposition 6 applied to $Z$.
    In particular,
  #[#set math.equation(numbering: n => "(6.9)")
   $ bb(E) \[ q \( upright(bold(z))_b \) divides E \, \( y_i \)_(i eq.not l) \] =
     u \( E_b \, y_b \) . $ <eq:omit-one-column-state>]
  It remains to justify adding $y_l$ to the conditioning. For every bounded measurable test $F$ of a $Y$-state,
    saturation for the datum type $l$ gives
  #[#set math.equation(numbering: n => "(6.10)")
   $ bb(E) \[ F \( y_l \) divides E \, upright(bold(z))_(- l) \] =
     bb(E)_(lambda_Y) \[ F \( y_l \) divides p \, \( y_i \)_(i eq.not l) \] . $ <eq:missing-state-markov>]
  The right side is measurable in $\( E \, \( y_i \)_(i eq.not l) \)$.
    Thus, given this smaller datum, $y_l$ is conditionally independent of the complete rows
    $upright(bold(z))_(- l)$. For completeness, multiplying (6.10) by any bounded function of
    $upright(bold(z))_(- l)$ and conditioning on the smaller datum factors their conditional product expectations.
    A monotone-class argument then gives the asserted conditional independence.
    Since $q \( upright(bold(z))_b \)$ is measurable in $upright(bold(z))_(- l)$,
    adjoining $y_l$ does not alter (6.9). This proves (6.7). ◻
]

We can now compute the correlation between the two highlighted lines.
  First condition on the column in Lemma 17, then condition within its old law on its corner state. The result is

#[#set math.equation(numbering: n => "(6.11)")
 $ bb(E) #scale(x: 120%, y: 120%)[\[] q \( \( y_i \)_i \) q \( upright(bold(z))_b \) divides E
   #scale(x: 120%, y: 120%)[\]] = integral g \( p \, y \) u \( E_b \, y \) thin m_Y \( thin d y divides w \) .
   $ <eq:square-product>]

The right side is not manifestly positive. The next lemma supplies the parameter independence that will show it
  cannot vanish identically.

#thm([Lemma 6.5.])[
  #emph[Under $lambda_Z$, the variables $p$ and $E_b$ are conditionally independent given $w = P_(b b)$.]
] <lem:parameter-reanchoring>

#proof[
  Let $kappa : W_Z arrow.r W_Y$ be the factor obtained from the slot-$b$ map $Z arrow.r Y$.
    This is a flow factor, and $P_(i b) = kappa \( E_i \)$. Proposition 6 identifies the $E$ law with the ordinary
    deterministic-length Furstenberg law on $W_Z$. For a bounded test $F$ of $E_b$ and a rectangle test $product_i
    H_i \( P_(i b) \)$, its integrated average is therefore computed from
  $ integral_(W_Z) F \( S_(W_Z)^(b t) e \) product_i H_i #scale(x: 120%, y: 120%)[\(] kappa \( S_(W_Z)^(i t) e \)
    #scale(x: 120%, y: 120%)[\)] thin thin d m_(W_Z) \( e \) $
  at each fixed $t$. Substitute $e' = S_(W_Z)^(b t) e$. The expression becomes
  $ integral_(W_Z) F \( e' \) product_i H_i #scale(x: 120%, y: 120%)[\(] S_(W_Y)^(\( i - b \) t) kappa \( e' \)
    #scale(x: 120%, y: 120%)[\)] thin thin d m_(W_Z) \( e' \) . $
  All factors other than $F$ depend only on $kappa \( e' \)$.
    Thus $F$ may be replaced, at every $t$, by its conditional expectation given $kappa$.
    Averaging and taking the deterministic limit gives
  $ bb(E) [F \( E_b \) product_i H_i \( P_(i b) \)] = bb(E)
    [bb(E) \[ F \( E_b \) divides w \] product_i H_i \( P_(i b) \)] . $
  Rectangle tests generate the $p$ sigma-algebra, and $w$ is one of its coordinates.
    The monotone-class theorem yields the required conditional independence. ◻
]

=== 6.5 Nonvanishing and the additional role <nonvanishing-and-the-additional-role>

We record the elementary Hilbert-space fact used to finish the argument.
  Its separability hypothesis is automatic for the probability fibres occurring here.

#thm([Lemma 6.6.])[
  #emph[Let $V$ be a square-integrable random vector in a separable real Hilbert space,
    and let $V'$ be an independent copy. If $chevron.l \, chevron.r V V' = 0$ almost surely, then $V =
    0$ almost surely.]
] <lem:independent-hilbert-vectors>

#proof[
  If $bb(P) \( lr(bar.v.double  bar.v.double) V gt.eq epsilon.alt \) > 0$ for some $epsilon.alt > 0$,
    a countable cover by balls of radius $epsilon.alt \/ 4$ contains one ball meeting that event with positive
    probability. With positive probability both $V$ and $V'$ lie in this intersection.
    On that event their norms are at least $epsilon.alt$ and their distance at most $epsilon.alt \/ 2$, so
  $ chevron.l \, chevron.r V V' = 1 / 2 #scale(x: 120%, y: 120%)[\(] lr(bar.v.double  bar.v.double) V^2 +
    lr(bar.v.double V' bar.v.double)^2 - lr(bar.v.double V - V' bar.v.double)^2 #scale(x: 120%, y: 120%)[\)] > 0 . $
  This is a contradiction. ◻
]

#thm([Proposition 6.7.])[
  #emph[For the saturated channel $Y$ and maximal nonzero correlation chosen above,
    the regrouped channel $Z$ has a nonzero correlation (6.1) with output roles $A union { b }$.]
] <prop:activation>

#proof[
  We first prove that the conditional quantity in (6.11) is nonzero.
    In a single $Z$-state let $R \( e \)$ denote its old $W_Y$-parameter array; it is a function of $e = omega_Z$.
    Let $w$ denote its slot-$b$ parameter. Given $w$, write $alpha_w$ for the law of the old parameter array in
    $lambda_Y$, and $beta_w$ for the law of $e$ in $m_Z$. Then $R_(*) beta_w = alpha_w$.
    Both old arrays, the column array $p$ and the row array $R \( E_b \)$, have this same conditional marginal.
    Lemma 18 says that the pair $\( p \, E_b \)$ has conditional law $alpha_w ⊗ beta_w$.
  Work for almost every fixed $w$ in the separable real Hilbert space $H_w =
    L^2 \( m_Y \( dot.op divides w \) \)$. The bounded kernels $g \( p \, dot.op \)$ and $u \( e \, dot.op \)$ are
    measurable $H_w$-valued random vectors. To justify these assertions on a common conull set of $w$,
    choose a countable generating algebra on the standard Borel space $Y$.
    Its rational simple span is dense in every $H_w$; the scalar tests against this span and Fubini give the
    required strong measurability. The single-state assertion of Lemma 17 says that, conditionally on $e$,
    the state $y$ has precisely the fixed law $m_Y \( dot.op divides w \)$.
    Hence conditioning on $R \( e \)$ does not introduce a $y$-dependent weight into the distribution of $e$.
    The tower property for (6.6) gives the Hilbert-valued identity
  #[#set math.equation(numbering: n => "(6.12)")
   $ bb(E)_(beta_w) #scale(x: 120%, y: 120%)[\[] u \( e \, dot.op \) divides R \( e \)
     #scale(x: 120%, y: 120%)[\]] = g \( R \( e \) \, dot.op \) . $ <eq:average-u-is-g>]
  This can also be checked against a countable dense set in $H_w$:
    the joint law of $\( e \, y \)$ over $w$ is $beta_w \( thin d e \) m_Y \( thin d y divides w \)$,
    and conditioning the defining expectation of $u$ further on $\( R \( e \) \, y \)$ gives the defining
    expectation of $g$.
  Suppose now that (6.11) were zero almost surely. Conditional parameter independence would imply
  $ chevron.l g \( p \, dot.op \) \, u \( e \, dot.op \) chevron.r_(H_w) = 0 quad
    upright("for ") alpha_w ⊗ beta_w upright("-almost every ") \( p \, e \) . $
  Average in $e$ conditionally on $R \( e \)$ and use (6.12). We obtain
  $ chevron.l g \( p \, dot.op \) \, g \( p' \, dot.op \) chevron.r_(H_w) = 0 quad
    upright("for ") alpha_w ⊗ alpha_w upright("-almost every ") \( p \, p' \) . $
  Lemma 19 forces $g \( p \, dot.op \) = 0$ almost surely for almost every $w$.
    This contradicts the previously established nonvanishing of $g$.
  It follows that some bounded measurable real test $Psi \( E \)$ has
  #[#set math.equation(numbering: n => "(6.13)")
   $ bb(E)_(lambda_Z) #scale(x: 120%, y: 120%)[\[] Psi \( E \) q \( \( y_i \)_i \) q \( upright(bold(z))_b \)
     #scale(x: 120%, y: 120%)[\]] eq.not 0 . $ <eq:activated-correlation>]
  For example, take the sign of the nonzero conditional expectation in (6.11). We identify its four roles.
    In every row $i eq.not b$, the factor from $q \( \( y_i \)_i \)$ reads the old slot-$b$ state:
    when $i in A$ it is a function of the old outputs retained in $Z$,
    and when $i in.not A$ it is a function of $Z$’s original spatial coordinate. Their spatial means remain zero.
    In row $b$, the factor $q \( upright(bold(z))_b \)$ is a function of the three added lists $Q_j$.
    Under the full spatial product law of the outputs of $Z$,
    these lists are independent and each of its three factors is centred.
    Therefore $q \( upright(bold(z))_b \)$ is itself centred for that spatial product law.
    Finally $Psi$ is a test of the full new distal parameter array $E$.
    Thus (6.13) has exactly the form (6.1), with output roles $A union { b }$, as asserted. ◻
]

#proof[
  If the required pointwise conclusion failed, the standard coding reduction and Proposition 5 would supply the
    fixed selectors and a nonzero correlation with no output roles.
    A maximal role number $r$ would therefore exist. Proposition 14 gives $r lt.eq 2$.
    Proposition 15 preserves a maximal witness in a saturated channel,
    and Proposition 20 then produces a nonzero correlation with $r + 1$ output roles.
    This contradicts the definition of $r$. Pointwise failure is impossible.
    The limiting value is the product of the four integrals, as in the norm convergence of Lemma 4.
    Pulling back from the standard coded factor proves the assertion on the original probability space. ◻
]

== 7 Pointwise convergence for the proper subsets of four times <sec:lower-length>

We prove Lemma 2. The systems to which that lemma is applied in Section 3 are extensions of a suspension and need
  not be mixing or ergodic. Accordingly, the input needed here is a pointwise convergence theorem on arbitrary
  invertible probability preserving systems. Its analytic basis is the oscillation estimate in [21]
  Proposition 2.2, denoted by P in this appendix. We also write H for [20].

P states this oscillation estimate for the times $n \, 2 n \, 3 n$ before using mixing to identify its limit.
  We need the three additional triples contained in ${ 1 \, 2 \, 3 \, 4 }$.
  We obtain them by modifying the local four-linear construction in H and its extension to inputs varying with
  depth in P. This is a use of those analytic proofs, including their intermediate estimates;
  the boundedness theorem for the trilinear Hilbert transform alone would not supply the required oscillation
  estimate. We specify the imported statements first, then verify the coefficient changes,
  and finally give the passage to arbitrary systems and all integer averaging lengths.

=== 7.1 The local estimates used from H and P <the-local-estimates-used-from-h-and-p>

For this appendix, a #emph[role set] is a set $S$ of four distinct integer coefficients.
  Initially $S = { 0 } union J$, where $J subset { 1 \, 2 \, 3 \, 4 }$ has three elements.
  If $K$ is a dyadic interval of length $r$, put

#[#set math.equation(numbering: n => "(7.1)")
 $ cal(H)_(K \, S) \( z \) = r^(- 2) integral_(bb(R)^2) w_K \( x \, t \) product_(j in S) z_j \( x + j t \) thin
   thin d x thin thin d t . $ <eq:ll-local-form>]

Fix $c_0 > 0$ and $C_0 gt.eq 1$. The admissible kernels are the smooth,
  compactly supported functions $w_K$ for which every $x + j
  t$ on the support lies in $K$ at distance at least $c_0 r$ from its boundary,

#[#set math.equation(numbering: n => "(7.2)")
 $ integral_(bb(R)) w_K \( v - j t \, t \) thin thin d t = 0 quad \( v in bb(R) \, j in S \) \, wide
   parallel partial_x^a partial_t^b w_K parallel_oo lt.eq r^(- a - b) #scale(x: 120%, y: 120%)[\(]
   C_0 \( a + b + 2 \) #scale(x: 120%, y: 120%)[\)]^(C_0 \( a + b + 2 \)) . $ <eq:ll-kernels>]

Kernels may be chosen independently at the different intervals.

H’s #emph[Uniform local estimate] [20] Theorem 2.2 asserts, for $S = { 0 \, 1 \, 2 \,
  3 }$ and a suitable $q in \( 2 \, 3 \)$, that

#[#set math.equation(numbering: n => "(7.3)")
 $ sum_(K in cal(K)) \| K \| thin \| cal(H)_(K \, S) \( z \) \| lt.eq
   C integral_(bb(R)) product_(j in S) M_q z_j \( y \) thin thin d y \, wide
   M_q z = \( M \( \| z \|^q \) \)^(1 \/ q) \, $ <eq:ll-fixed-local>]

for every finite family of dyadic intervals and compactly supported scalar $L^q$ inputs.
  Here $M$ is the Hardy–Littlewood maximal operator. Its proof, in H, Sections 3–10,
  supplies the quantitative chart, projection, separation, counting, and side estimates used in P.

The extension needed for oscillation is P’s #emph[Local estimate with variation in depth], Theorem 3.2.
  To state it, let $K_(*)$ be a root interval and let $s \( K \) =
  log_2 \( \| K_(*) \| \/ \| K \| \)$ be the depth of a descendant.
  For a finite integer block $B = { a \, dots.h \, b }$ and a scalar sequence $\( z_s \)$, write

$ cal(V)_B \( z \) \( y \) = max_(s in B) \| z_s \( y \) \| + sum_(s = a)^(b - 1) \| z_(s + 1) \( y \) -
  z_s \( y \) \| . $

For the original role set ${ 0 \, 1 \, 2 \, 3 }$, P proves the assertion below.
  We establish it for the four required role sets.

#thm([Proposition 7.1.])[
  (The local analytic input with changed coefficients).  #emph[Let $S = { 0 } union J$,
    where $J$ is a three-element subset of ${ 1 \, 2 \, 3 \, 4 }$.
    Let $cal(T)$ be a finite rooted dyadic tree with root $K_(*)$ and largest depth $d$,
    and let $cal(K) subset cal(T)$ have kernels satisfying (7.2).
    For each $j in S$, let $\( z_(j \, s) \)_(0 lt.eq s lt.eq d)$ be measurable scalar functions on $K_(*)$.
    Extend these functions by zero outside $K_(*)$. Suppose that ${ 0 \, dots.h \,
    d }$ has a deterministic partition into $W_j gt.eq 1$ nonempty consecutive blocks, on each of which
$ cal(V)_B \( z_j \) \( y \) lt.eq W_j^(- 1 \/ 2) quad upright("for almost every ") y in K_(*) . $

 The partitions may differ between the four roles. Then
#[#set math.equation(numbering: n => "(7.4)")
 $ sum_(K in cal(K)) \| K \| \| cal(H)_(K \, S) \( \( z_(j \, s \( K \)) \)_(j in S) \)
   #scale(x: 120%, y: 120%)[\|] lt.eq C \( c_0 \, C_0 \) \| K_(*) \| . $ <eq:ll-depth>]

 The constant is independent of the tree, kernels, depth range, and block partitions.
   It can be chosen uniformly over the four sets $S$.]
] <prop:ll-depth>

The proof of Proposition 21 is the proof-by-modification below.
  The analytic inputs are H’s local estimate and its proofs of the intermediate estimates,
  and P’s depth-local construction in Sections 4–7. Proposition 21 is the sole analytic input to the
  local-to-orbit argument in Subsection 7.6; Subsection 7.7 then proves Lemma 2.
  The intervening subsections establish the proposition by checking, in order,
  the coordinate and quadratic identities, the integer-lift and counting arithmetic,
  and their use in P’s depth scheduling. We retain their definitions of quadratic chart atoms,
  inherited projection families, curvature tags, and finite progression tests.
  The following computations specify their dependence on the four role coefficients.
  In particular, the proposition is not an assertion of uniform continuity of a Hilbert-transform bound in its slopes.

=== 7.2 Coordinate changes and the quadratic cancellation vector <subsec:ll-algebra>

Every set $S$ above contains an adjacent pair. Translate all role labels by the same integer so that one such pair
  is $0 \, 1$. This is the change of variables $x' = x + m t$ in (7.1), with Jacobian one.
  The four spatial coordinates themselves are unchanged. Consequently the support and cancellation conditions
  remain the same, and the derivative bounds retain their form after increasing the fixed constant $C_0$.
  During the local argument we use these translated labels.
  Their pairwise differences have absolute value at most four, and their diameter is either three or four. Thus

#[#set math.equation(numbering: n => "(7.5)")
 $ \| t \| lt.eq \| K \| \/ 3 quad upright("whenever every ") x + j t upright(" lies in ") K . $ <eq:ll-support-t>]

The vector $\( - 1 \, 3 \, - 3 \, 1 \)$ in H is replaced by a primitive integer vector $\( c_j \)_(j in S)$
  proportional to

$ (product_(ell in S \\ { j }) \( j - ell \))^(- 1) . $

The overall sign is immaterial. Before translation, convenient choices are

#[#set math.equation(numbering: n => "(7.6)")
 $ S & \( c_j \)_(j in S) upright(" in increasing role order") & \
{ 0 \, 1 \, 2 \, 3 } & - 1 & 3 & - 3 & 1\
{ 0 \, 1 \, 2 \, 4 } & - 3 & 8 & - 6 & 1\
{ 0 \, 1 \, 3 \, 4 } & - 1 & 2 & - 2 & 1\
{ 0 \, 2 \, 3 \, 4 } & - 1 & 6 & - 8 & 3 $ <eq:ll-coefficient-table>]

Lagrange interpolation of the polynomials $1 \, u \, u^2$ gives

#[#set math.equation(numbering: n => "(7.7)")
 $ sum_(j in S) c_j = sum_(j in S) j c_j = sum_(j in S) j^2 c_j = 0 . $ <eq:ll-moments>]

These identities are preserved by translation of the role labels. Every $c_j$ is nonzero.
  All coefficients and denominators arising from this finite list of coordinate systems are bounded absolute constants.

We distinguish numerical role labels from enumerations of four objects.
  A coefficient such as $j$, $j - i$, or $c_j$ is changed according to $S$.
  An ordering of four input sizes, four leaves, or four positions in a multilinear expansion still enumerates four
  objects. This convention leaves those parts of H’s proofs unchanged.

=== 7.3 Chart separation, detection, and the scale estimates <chart-separation-detection-and-the-scale-estimates>

The local absolute estimate, H, Lemma 2.1, uses the map $\( x \, t \) mapsto \( x + i t \, x + j t \)$,
  whose determinant is $j - i$. Its endpoint bounds and interpolation therefore hold for the new roles.
  In particular the initial bound for the finite-depth constant in (7.3),
  and H’s stopping reduction to normalized local sizes, remain valid.
  The coefficient and projection bounds, compression and height-bin estimates, H, Lemmas 3.2–3.5,
  are statements about finite families of vectors or real frequencies and do not specify a progression coefficient.

We next check the part of H, Section 4, that converts two chart atoms in distinct roles into separated factors.
  A chart phase has the form

$ lambda y^2 + \( theta y \)^T C d + beta y \, $

where $theta$ is a vector of real frequencies, $C$ is the rational chart matrix,
  and $d$ is a bounded lift of $theta y$ modulo the integer lattice.
  The source definition also includes a smooth amplitude on the lift.
  Its one-variable Weyl estimates, Fourier expansion, and uniform tail estimates are unchanged.

For H, Lemma 4.5 (#emph[Progression separation]), fix source roles $i \, k$ and spectator roles $a \, b$.
  Set $alpha_i = 1$, $alpha_k = 0$, and solve

$ sum_(j in S) alpha_j = sum_(j in S) j alpha_j = 0 $

for $alpha_a \, alpha_b$. This is possible because $a eq.not b$.
  Writing $y_j = x + j t$, insert the same lift partitions as in H at $theta y_a$, $theta y_b$, and $theta t$.
  If their lifts are $d_a \, d_b \, d$, then

$ k_j = d_j - d_a - \( j - a \) d $

is an integer vector. For instance, if $d_j = theta y_j - m_j$ and $d = theta t - m$, the identity $y_j =
  y_a + \( j - a \) t$ gives $k_j = - m_j + m_a + \( j - a \) m$.
  Thus the equality cutoffs in H still test integer carries exactly.
  Their support bounds change only by a fixed factor. With $A_2 = sum_j j^2 alpha_j$, direct expansion gives

#[#set math.equation(numbering: n => "(7.8)")
 $ sum_(j in S) alpha_j \[ lambda y_j^2 + \( theta y_j \)^T C d_j \] & = A_2 \[ lambda t^2 + \( theta t \)^T C d \]\
 & quad + sum_(j in S) alpha_j \( theta y_j \)^T C k_j . $ <eq:ll-chart-identity>]

The last sum is linear in $x \, t$ and hence separates in $y_a \, y_b$.
  The smooth amplitude on the bounded lift box has the same Gevrey bounds up to fixed constants.
  Fourier expansion therefore gives H’s absolutely convergent separation into two spectator atoms and one atom in
  $t$, with the same coefficient-tail exponents and quasipolynomial complexity bounds.
  H, Lemma 4.6 (#emph[Single-scale separation]), then uses $t = \( y_b - y_a \) \/ \( b - a \)$;
  every added rational height is bounded by an absolute constant.

For the generalized von Neumann bound, H, Lemma 4.11, let $i$ be the role whose input is controlled by its $U^3$
  norm. Apply Cauchy–Schwarz in the directions $\( - j \, 1 \)$ for the other three roles,
  beginning with the role containing the $L^2$ input. Each direction holds $x + j t$ fixed and changes $x +
  i t$ by $\( i - j \) h$. Multiplication by the nonzero integer $i - j$ preserves Haar measure on a circle.
  The three independent circle parameters therefore produce the same cube integral as in the source proof.
  Character weights split using the marked pair $x = y_0$, $t = y_1 - y_0$.
  Enlarging the fixed periodic boxes accommodates all translated role sets.
  This verifies the coefficient-dependent part of the generalized von Neumann bound.
  In H, Lemma 4.12 (#emph[Local detection]), the potentially unbounded $L^2$ residual occupies a different role.
  After clipping the opposing inputs, the source proof decomposes two of them using its continuous inverse theorem
  and bounds the uniform errors by Lemma 4.11. The separated chart moments then detect the residual.
  Those separations were verified above; the clipping, inverse theorem, and mixed-norm exponents are unchanged.

H, Lemma 5.1 (#emph[A scale sum for one separated term]), uses the spectator coordinates $\( y_a \, y_b \)$.
  Holding one fixed, the integral of the kernel over the other is zero by (7.2),
  with a constant Jacobian factor $\| b - a \|$. The double primitive of that kernel consequently has the same
  compact support and smooth bounds. Its tensor expansion into mean-zero bumps,
  the Bessel estimates for those bumps, and the frequency-height bounds apply with the new pair.
  The only additional demodulations have frequencies $plus.minus gamma \/ \( b - a \)$;
  their rational multipliers have bounded height, although $gamma$ can be arbitrary real.
  This also verifies the coefficient changes in the finite predictor list and the delayed predictor replacement.
  The scale bands, accuracy gaps, and projection-energy bounds in the remaining base construction depend on these
  estimates and the four-slot multilinearity, rather than the values of the labels.
  There is also a multivariable use of the chart estimates in H,
  Lemma 5.7 (#emph[Few active scales for a fixed triple]). Squaring the transpose at the remaining role $ell$
  gives six atoms with arguments $h + \( j - ell \) t$ and $h + \( j - ell \) t'$.
  These are still fixed integer linear forms in three variables,
  so the three-variable Weyl alternative and chart expansion of H, Lemmas 4.3–4.4,
  apply with the same complexity bounds. Its final kernel cancellation is the marginal at anchor $ell$ in (7.2).

=== 7.4 Curvature tags, short blocks, and integer heights <curvature-tags-short-blocks-and-integer-heights>

H’s localization in Section 6 groups chart atoms by their normalized quadratic phase and horizontal chart data,
  called their curvature tags. Normalize the parameters $\( lambda \, C \)$ in role $j$ by dividing both by $c_j$,
  and retain the horizontal vector $theta$. The coefficient calculation in H,
  Lemma 6.1 (#emph[Separation of different tags]), can then be checked directly.
  For source roles $i \, j$ and spectator roles $a \, b$, put

$ xi_ell = frac(b - ell, b - a) \, wide zeta_ell = frac(ell - a, b - a) \; wide y_ell = xi_ell y_a + zeta_ell y_b . $

The barycentric formula gives

#[#set math.equation(numbering: n => "(7.9)")
 $ c_i xi_i zeta_i = - c_j xi_j zeta_j eq.not 0 . $ <eq:ll-tag-identity>]

Indeed the factors $\( i - a \) \( i - b \)$ cancel from the product defining $c_i$,
  leaving a nonzero multiple of $\( i - j \)^(- 1)$; interchanging $i \, j$ changes its sign.
  The return calculation in that lemma therefore has the same nonzero prefactor and the same separation
  conclusion. Its period is enlarged to clear these fixed denominators.

The residue-template calculation in H, Lemma 6.6 (#emph[A uniform same-tag test]), uses the marked adjacent pair.
  Its lifts satisfy

#[#set math.equation(numbering: n => "(7.10)")
 $ d_ell = \( 1 - ell \) d_0 + ell d_1 + k_ell \, wide k_ell in bb(Z)^d . $ <eq:ll-template-lift>]

Substitution of (7.10) and (7.7) cancels the common quadratic terms and leaves only linear phases from the
  carries. Their Fourier expansion has the same residue-template bound after a fixed enlargement of the lift box.
  It introduces no new curvature tag. Thus the source localization proof receives the same tag-separation and
  transfer estimates. Its graph distances, color histories, masks,
  and projection bounds are then used with those estimates and their original parameter order.

H, Lemma 7.2 (#emph[Short-block comparison]), uses two sampling windows to compare a finite lattice form with a
  form on a connected torus. Place those windows on roles $0 \, 1$.
  The lattice and lifted torus coordinates in the other roles are respectively

$ n_j = \( 1 - j \) n_0 + j n_1 \, wide w_j = \( 1 - j \) u + j v . $

Both formulas have integer coefficients. A fixed torus of length $64$ and lift boxes in $\[ - 12 \, 12 \]$
  accommodate the present role sets; the source support parameter is decreased by a fixed factor if necessary.
  Maps from a pair of variables to two distinct role coordinates are injective on their lattice images and
  surjective on connected tori. These are the pair-coordinate properties needed in the comparison.

The quadratic randomization in role $j$ becomes $e \( gamma m^2 \/ c_j \)$, where $e \( v \) =
  exp \( 2 pi i v \)$ and $gamma$ is uniform modulo a common multiple of all $\| c_j \|$;
  the value $24$ works for (7.6). On the Fourier support of the four-linear form,

$ sum_j m_j = sum_j j m_j = 0 . $

The two vectors $c = \( c_j \)$ and $\( j c_j \)$ are independent and span this two-dimensional nullspace.
  Hence $m_j = c_j \( v + j v' \)$ for some real $v \, v'$, and

$ sum_j m_j^2 / c_j = sum_j c_j \( v + j v' \)^2 = 0 $

by (7.7). The randomization preserves the form. For each single role,
  averaging its fourth moment in the spatial variable and in $gamma$ imposes equality of a pair’s sum and sum of
  squares; the same two pairings as in H remain. Thus its fourth-moment and clipping estimates,
  including their powers of $q - 2$, are unchanged.

The return from lattice points to small intervals also holds with these coordinates.
  If four real role coordinates are within $e$ of integers,
  the marked adjacent pair reconstructs an integer progression.
  The discrepancy at any other role is an integer of magnitude less than $8 e$.
  Choosing $e < 1 \/ 100$ forces it to vanish. The admissible real offsets have positive area,
  computed explicitly below in (7.16). All support and overlap losses in the short-block comparison are therefore
  fixed constants.

The remaining arithmetic change is the height base. In H, Sections 8–9, replace $L_h = 6^h$ by $L_h = 12^h$,
  and replace the factor $36$ in the finite progression tests by $144$.
  Anchor changes still have integer coefficients. The common progression multiplier in H, Section 8.3,
  uses exactly (7.10) and (7.7), so its smoothness and Fourier truncation are unchanged in type.
  For the divisibility step, a coordinate in the free lattice quotient in H,
  Lemma 8.3 (#emph[Height stabilization]), is an integral rational multiple of $12^(R')$.
  Here the quotient is the integer coordinate lattice modulo its intersection with the source’s small rational
  subspace, $R'$ is the height gap, and $C_(*)$ bounds the denominators before multiplication by $12^(R')$.
  The intersection is saturated, so this quotient is free abelian.
  Writing $Delta$ for the required drop in height, its $2$- and $3$-adic valuations are at least

$ 2 R' - log_2 C_(*) \, wide R' - log_3 C_(*) . $

Thus $R' > log_2 C_(*) + 2 Delta$ ensures divisibility by $12^Delta$.
  No assumption that the initial denominator has only primes $2 \, 3$ is needed:
  the resulting coordinate is already integral. The reserves and the later growth constant $A_0$,
  used in the source bounds $E_h = A_0^(h + 1)$, are chosen using the new base.

=== 7.5 Progression counting and the depth-varying extension <progression-counting-and-the-depth-varying-extension>

We finish the coefficient check at the finite counting step because it requires more than the identities for
  quadratic phases. In H, Section 9, eliminating a role $ell'$ gives the three coefficients

$ alpha_i = i - ell' \, wide i in S \\ { ell' } . $

They are nonzero and have absolute value at most four. The horizontal frequency tests use sums of role
  frequencies, while their anchored tests use the weights $i - ell'$.
  Their kernel cancellations are precisely (7.2). Accordingly the source’s Fourier expansions, coefficient tails,
  and annular tests keep their forms after these replacements.

In H, Lemma 9.1 (#emph[Sparse mass of separated progression tests]),
  the shift data consist of a vector $zeta in bb(R)^d$ and integer vectors $n$ with $parallel n parallel_oo lt.eq
  B$. Replace the shifts $36 n dot.op zeta$ in its annular relations by $144 n dot.op zeta$,
  and the neighborhood shifts $6 n dot.op zeta$ by $12 n dot.op zeta$.
  The parameter $N_0$ is the coefficient reserve for the latter neighborhoods.
  The proof uses a fine common grid; choose its step on a multiple clearing the integers $1 \, 2 \, 3 \, 4$.

For a four-step path, alternately add its four annular relations.
  The intermediate label in role $i$ and the two labels in a second role cancel,
  leaving $alpha_i \( a - a' \)$ and an expression in the four color labels.
  Dividing by $alpha_i$ constructs the source’s difference cover. The required lattice compatibility is

#[#set math.equation(numbering: n => "(7.11)")
 $ 144 / alpha_i in 12 bb(Z) \, wide frac(12 alpha_j, alpha_i) in bb(Z) . $ <eq:ll-counting-divisibility>]

Both assertions hold because $\| alpha_i \|$ divides $12$.
  The integer vector obtained by adding four original shifts has norm at most $4 B$.
  In units of the new neighborhood shift $12$, division by $alpha_i$ therefore gives a vector of norm at most $4 B
  dot.op 12 \/ \| alpha_i \| lt.eq 48 B$. The reserve $N_0 gt.eq 64 B$ accommodates it.
  The scalar error is at most four times one relation’s error after division by a nonzero integer.

For the slab cover, write the first two coordinates as their box centers plus shifts $12 n_i dot.op
  zeta$ and scalar interval errors. Substitute them in the three-role relation and solve for the third coordinate.
  The resulting shift coefficients are $12 alpha_1 \/ alpha_3$, $12 alpha_2 \/ alpha_3$, and $144 \/ alpha_3$.
  By (7.11) they are integers, and the resulting shift vector has norm at most $C \( d + 1 \)^2 B$ as in H.
  Choose the separation reserve and the excluded pure-shift interval constants larger by the fixed factors arising
  from these substitutions. The covering iterations use the same orders of sumsets,
  the graph count uses the same four roles, and the block and scale counts use the same covers.
  Their exponents are consequently unchanged. In particular the source factor $L^29
  delta^(1 \/ 2080)$ remains valid, where $L$ bounds the number of scale occurrences of a fixed pair of labels and
  $delta$ is the sparse tuple-density threshold. In the application,
  let $xi$ be the vector of frequencies obtained from the height construction and take $zeta = xi \/ 144$,
  so the available heights start at $12^(Delta - 2)$ instead of $6^(Delta - 2)$.
  The preceding height reserves supply the required shift sizes.
  Pair determination in the application divides only by role differences,
  and the short-block windows were checked above. This verifies the coefficient-dependent hypotheses of the
  counting estimate and its application, not merely its formal conclusion.

We can now apply the remaining operator and summation arguments of H.
  The main projection families, Fourier modes, and counting tests have the same bounds in powers of logarithms of
  their budgets. The coordinate changes have inserted only fixed rational heights, fixed derivative losses,
  and the replacement of one fixed exponential height base by another.
  None changes a budget exponent as a function of the final $q$.
  H’s Section 10 chooses those exponents before taking $q in \( 2 \, 3 \)$ sufficiently close to two;
  its absorption of the finite-depth constant therefore applies to the modified estimates.
  This proves (7.3) for the four role sets together with the intermediate estimates used in P.

It remains to carry these inputs through P’s depth-local proof.
  The #emph[Maximal estimate for local catalog rows], #emph[The depth-varying row estimate],
  and #emph[Smooth mean-zero rows on depth inputs] in P, Section 4,
  concern Hilbert-space operators supported on nested dyadic cells.
  Here a catalog consists of finitely many vector-valued column functions, each with a dyadic birth cell;
  descendants use restrictions of the same functions. A local projection is the orthogonal projection in the
  cell’s $L^2$ space onto constant-coefficient combinations of a specified set of available columns.
  Their hypotheses specify cellwise constant coefficients in a persistent catalog,
  an ordinary fixed-input Bessel bound, and nondecreasing input-read indices. They contain no role coefficients.
  These are P, Lemmas 4.3, 4.4, and 4.6. The replacement just proved supplies their same scalar and Bessel inputs.

More concretely, P, Lemma 5.3, Corollary 5.4, and Lemma 5.5,
  use $\( y_a \, y_b \)$ and the demodulations $plus.minus gamma \/ \( b - a \)$ already checked.
  Their cutoff equal to one on $\[ - 1 \/ 3 \, 1 \/ 3 \]$ still covers the support by (7.5).
  Separating the kernel gives exactly mean-zero bump rows, with fixed complete carriers.
  Clump replacement and predictor rows have the same Bessel bounds because the cancellation and height estimates
  have just been verified. The support and observation partitions of the rows,
  and their nondecreasing reads of the depth inputs, are unchanged.
  In P, Section 6, use the normalized tags from (7.7); the mask, template-transfer, short-block,
  and counting estimates are then the versions established above.
  Scheduling the column updates and summing their row bounds introduces no new arithmetic operation on a role label.

For completeness, the final parameter dependence can be seen in the retained estimates of H, Section 10.3, and P,
  Section 7. Write $k$ for the accuracy logarithm, $frak(p)$ for their growth parameter,
  $K_0$ for the resulting depth-block length, and $G_0$ for the strong energy and projection overhead.
  The term requiring $q$ close to two has the form

$ frak(p)^(- 1 \/ 2) G_0 \( K_0 + 2 \)^(C_19 \( q - 2 \)) \, wide K_0 lt.eq C_q \( 1 + k + frak(p) \)^(C_5) \,
  wide G_0 = exp #h(-0.16667em) #scale(x: 120%, y: 120%)[\(] C_q \( 1 + log \( 2 k \) \)^C
  #scale(x: 120%, y: 120%)[\)] . $

Here we have renamed the source parameter $P$ to avoid confusion with the manuscript P.
  The degrees $C \, C_5 \, C_19$ have absolute bounds fixed before $q$.
  The short-block estimate feeding this term has the explicit exponent $11 \( q - 2 \) \/ \( q - 1 \)$ in H,
  Lemma 7.2; the coefficient changes above affect its fixed constants, not this exponent.
  Taking $q$ so close to two that

$ max { C_19^(upright(H)) C_5^(upright(H)) \, C_19^(upright(P)) C_5^(upright(P)) } \( q - 2 \) < 1 \/ 8 $

is therefore permitted in both proofs. Here the accuracy scheme fixes $0 < theta < 1$ before $q$,
  and the positive constant $alpha$ is chosen sufficiently small after $q$, as in the source proofs.
  Their later choice $frak(p) = ceil.l exp \( alpha k^theta \) ceil.r$ gives $G_0 =
  frak(p)^(o \( 1 \))$ and makes the displayed term at most $C_q frak(p)^(- 1 \/ 4)$.
  The remaining accuracy exponents and summations retain their source order of choice.
  P’s depth-local proof consequently gives (7.4).

Translating the role labels back restores $S = { 0 } union J$.
  P’s depth-local theorem permits variation in any role, and the local constructions allow any role as testing
  slot. Thus this translation does not require the testing role to remain the marked role $0$ during the local
  proof. This completes the proof of Proposition 21.

=== 7.6 From local forms to orbit oscillation <subsec:ll-transfer>

An #emph[averaging profile] is a real compactly supported smooth function $phi$ satisfying

#[#set math.equation(numbering: n => "(7.12)")
 $ integral phi = 1 \, wide integral t^a phi \( t \) thin thin d t = 0 quad \( 1 lt.eq a lt.eq 3 \) \, wide
   parallel phi^(\( n \)) parallel_oo lt.eq \( G \( n + 2 \) \)^(G \( n + 2 \)) quad \( n gt.eq 0 \) $ <eq:ll-profile>]

for some $G gt.eq 1$. Profiles may have either sign. Write $phi_A \( t \) = A^(- 1) phi \( t \/ A \)$.
  These are the profiles of P, Section 2.

#thm([Proposition 7.2.])[
  (Oscillation for the four triples).  #emph[Let $\( Y \, nu \, R \)$ be an invertible probability preserving
    system, let $J subset { 1 \, 2 \, 3 \, 4 }$ have three elements, and let the functions $g_j : Y arrow.r
    bb(C)$, $j in J$, be measurable with $\| g_j \| lt.eq 1$. For an averaging profile set
$ V_k^phi \( y \) = sum_(n in bb(Z)) phi_(2^k) \( n \) product_(j in J) g_j \( R^(j n) y \) \, wide k gt.eq 0 . $

 There is $C_phi < oo$ such that, for all deterministic integers $0 lt.eq k_1 < dots.h.c < k_(W + 1)$,
#[#set math.equation(numbering: n => "(7.13)")
 $ sum_(b = 1)^W integral_Y max_(k_b lt.eq ell lt.eq k_(b + 1)) \| V_ell^phi - V_(k_b)^phi \| thin thin d nu lt.eq
   C_phi sqrt(W) . $ <eq:ll-oscillation>]

 The constant is independent of the system, inputs, endpoints, and $W$.]
] <prop:ll-oscillation>

#proof[
  We give the transfer with the changed coefficients, following P, Section 3. Set $b = phi_2 - phi$.
    Its moments through order three vanish, so it has a compactly supported fourth primitive $g$,
    with $g^(\( 4 \)) = b$. Choose $B gt.eq 1$ containing its support,
    a smooth Gevrey bump $u$ of integral one supported in $\[ - 1 \/ 8 \, 1 \/ 8 \]$,
    and a dyadic integer $D > 32 B$. For $S = { 0 } union J$ put
  $ F \( z \, sigma \) = u \( z \) D^(- 3) g \( D sigma \) \, wide cal(W) \( z \, sigma \) =
    product_(j in S) \( partial_sigma - j partial_z \) F \( z \, sigma \) . $
  The four differential operators commute. Each is differentiation along a line on which one role coordinate is
    fixed, giving all cancellations in (7.2). On the support, $\| z + j sigma \| lt.eq 1 \/ 8 +
    4 B \/ D < 3 \/ 8$. Thus the rescaled kernel on an interval of length $r =
    D A$ has the required interior margin. The derivative bounds have the form (7.2),
    with constants depending only on the profile. Integration in $z$ kills every term containing a $z$ derivative,
    leaving
  #[#set math.equation(numbering: n => "(7.14)")
   $ 1 / r integral_(bb(R)) cal(W) \( z \, t \/ r \) thin thin d z = A^(- 1) b \( t \/ A \) = phi_(2 A) \( t \) -
     phi_A \( t \) . $ <eq:ll-kernel-normalization>]
  Let $Delta_k = phi_(2^(k + 1)) - phi_(2^k)$ and let $f_j$, $j in J$,
    be bounded by one and supported in an interval of length $L$.
    Suppose the testing functions $f_(0 \, k)$ have the same support and satisfy the block variation bound
    $W^(- 1 \/ 2)$ over a fixed partition of $k_(-) lt.eq k lt.eq k_(+)$ into $W$ blocks.
    Apply Proposition 21 to dyadic cells of length $D 2^k$, then average the translated lattice over one period of
    its largest scale. All nonzero cells lie below roots of total length at most $L + 2 D 2^(k_(+))$.
    Scale order is the reverse of depth order, which preserves block variation.
    The normalized translation average of a scale’s kernels is (7.14). We obtain
  #[#set math.equation(numbering: n => "(7.15)")
   $
     lr(|sum_(k = k_(-))^(k_(+)) integral_(bb(R)^2) f_(0 \, k) \( x \) product_(j in J) f_j \( x + j t \)
     Delta_k \( t \) thin thin d x thin thin d t|) lt.eq C_phi \( L + D 2^(k_(+)) \) . $ <eq:ll-continuous-test>]
  For clarity, integer transfer does not require consecutive roles.
    Plant each integer sequence on intervals of radius $e < 1 \/ 200$ about the integers.
    If $x + j t$ lies in such intervals in all four roles, use an adjacent pair to reconstruct integers $m \, n$.
    Every other integer center must equal $m + j n$, since its discrepancy has magnitude less than $8 e$.
    Write $x = m + xi$, $t = n + eta$. The offset domain is
  $ Omega_(S \, e) = { \( xi \, eta \) : \| xi + j eta \| < e upright(" for all ") j in S } . $
  If $s_(-) = min S$ and $s_(+) = max S$, the intermediate inequalities follow from the two extreme ones by
    convexity. Hence
  #[#set math.equation(numbering: n => "(7.16)")
   $ \| Omega_(S \, e) \| = frac(4 e^2, s_(+) - s_(-)) . $ <eq:ll-polygon>]
  Replacing $Delta_k \( n + eta \)$ by $Delta_k \( n \)$ has, after summing in $n$,
    error $O_phi \( 2^(- k) \)$ per integer $m$: its derivative is $O_phi \( 2^(- 2 k) \)$,
    it has $O_phi \( 2^k \)$ relevant integer arguments, and $\| eta \| lt.eq 2 e$.
    Summing over $k gt.eq 0$ costs $O_phi \( L \)$. Dividing by the fixed area (7.16) therefore gives the discrete
    counterpart of (7.15) with bound $C_phi \( L + D 2^(k_(+)) \)$.
  Fix a finite interval $cal(E)$ of integer testing points inside the common support interval of the integer
    sequences. For each $m in cal(E)$ and block $b$, choose a maximizing endpoint $ell_b \( m \)$ and a unimodular
    scalar $alpha_b \( m \)$ making the selected difference nonnegative. Set, on that scale block,
  $ f_(0 \, k) \( m \) = frac(alpha_b \( m \), 4 sqrt(W)) upright(bold(1))_({ k_b lt.eq k < ell_b \( m \) }) . $
  Set $f_(0 \, k) \( m \) = 0$ for $m in.not cal(E)$. Its supremum plus variation is at most
    $1 \/ \( 2 sqrt(W) \)$. The discrete test telescopes into $1 \/ \( 4 sqrt(W) \)$ times the sum of the block
    maxima. Thus its oscillation bound is $C_phi sqrt(W) \( L + D 2^(k_(W + 1)) \)$.
  We transfer the sequence inequality along finite orbit segments, following Calderón’s transference method [5].
    Apply the estimate to the finite orbit sequences $g_j \( R^r y \)$ for $1 - Q lt.eq r lt.eq M + Q$,
    set to zero elsewhere, where $Q = ceil.l 4 B_phi 2^(k_(W + 1)) ceil.r$ and $"supp" phi
    subset \[ - B_phi \, B_phi \]$. Take $cal(E) = { 1 \, dots.h \, M }$.
    At these testing points all averages are the untruncated orbit averages evaluated at $R^m y$.
    Integrate in $y$, use invariance, divide by $M$, and let $M arrow.r oo$. The result is (7.13).
    This step uses only invertibility, measurability, and preservation of the probability measure. ◻
]

=== 7.7 Convergence on arbitrary systems <subsec:ll-convergence>

We now prove Lemma 2 from Proposition 22. The use of quantitative oscillation bounds to prove pointwise
  convergence belongs to the classical approach developed in [15].
  The criterion needed here has the following short proof. A uniformly bounded sequence of measurable functions
  satisfying (7.13) is Cauchy almost everywhere. Indeed, if its tail oscillation exceeds $4
  epsilon.alt$ on a set $E$ of positive measure, then for every fixed initial endpoint $k$ the supremum of $\|
  V_ell - V_k \|$ over $ell gt.eq k$ exceeds $2 epsilon.alt$ on $E$.
  By monotone convergence one can choose a deterministic later endpoint so that the corresponding integral maximum
  is at least $epsilon.alt nu \( E \)$. Recursively choosing endpoints gives a lower bound $W epsilon.alt
  nu \( E \)$, contradicting the upper bound $C_phi sqrt(W)$ for large $W$.
  The finite sums defining $V_k^phi$ are uniformly bounded because the profile is bounded and compactly supported.
  Thus every fixed profile gives almost everywhere convergence.

P, Lemma 2.8 (#emph[Approximation with three vanishing moments]),
  states that for every $c in \[ 1 \, 2 \]$ and every $epsilon.alt > 0$ there is an averaging profile with

#[#set math.equation(numbering: n => "(7.17)")
 $ parallel phi - h_c parallel_1 < epsilon.alt \, wide h_c \( t \) =
   c^(- 1) upright(bold(1))_(\( 0 \, c \]) \( t \) . $ <eq:ll-profile-approximation>]

The use of signed profiles is essential to this assertion. One first smooths $h_c$, preserving integral one.
  The other three moments can be canceled, without changing the integral,
  by four broad translated bumps at distance and width comparable to a large parameter $A$.
  Their moment matrix for orders $0 \, 1 \, 2 \, 3$, after division of row $j$ by $A^j$,
  is a fixed invertible Vandermonde-type matrix. The prescribed zeroth correction is zero and the remaining
  normalized corrections are $O \( A^(- 1) \)$. The correcting coefficients are therefore $O \( A^(- 1) \)$,
  and their total $L^1$ cost tends to zero. The bumps retain the derivative bounds in (7.12) with a
  profile-dependent constant.

Fix a triple $J$ and write $a_n \( y \) = product_(j in J) g_j \( R^(j n) y \)$, so $\| a_n \( y \) \| lt.eq 1$.
  For $N_k = floor.l c 2^k floor.r$, the Riemann-sum comparison gives, uniformly in $y$,

#[#set math.equation(numbering: n => "(7.18)")
 $ limsup_(k arrow.r oo) lr(|1 / N_k sum_(n = 1)^(N_k) a_n \( y \) - V_k^phi \( y \)|) lt.eq parallel h_c -
   phi parallel_1 . $ <eq:ll-profile-error>]

To see this, first replace $N_k^(- 1)$ by $\( c 2^k \)^(- 1)$, at cost $O \( 2^(- k) \)$,
  then bound the difference by $2^(- k) sum_(n in bb(Z)) \| h_c \( n 2^(- k) \) - phi \( n 2^(- k) \) \|$.
  This converges to the displayed integral because the integrand is compactly supported and piecewise continuous.

Choose countably many profiles with errors tending to zero for each rational $c in \[ 1 \, 2 \]$.
  On their common conull set, the existence of all the smooth-profile limits and (7.18) show that the ordinary
  averages along $N_k$ are Cauchy. The Host–Kra norm convergence theorem [11] Theorem 1.1,
  stated for arbitrary invertible probability preserving systems,
  gives an $L^2$ limit for the averages at all integer lengths:
  apply it to the four consecutive powers, inserting the constant function one at the omitted role.
  The bounded pointwise limit along each $N_k$ must equal this $L^2$ limit almost everywhere,
  by bounded convergence and uniqueness of norm limits. Thus all rational-$c$ subsequences have the same limit on
  one conull set. No identification of that limit and no mixing assumption is needed.

Finally, for $M lt.eq N$ and $\| a_n \| lt.eq 1$,

$ lr(|1 / N sum_(n = 1)^N a_n - 1 / M sum_(n = 1)^M a_n|) lt.eq 2 frac(N - M, N) . $

For any rational mesh of $\[ 1 \, 2 \]$, every sufficiently large integer $N$ lies within its relative mesh size,
  up to $O \( N^(- 1) \)$, of some $floor.l c 2^k floor.r$ from that finite mesh.
  Its finitely many subsequences have the common pointwise limit.
  The preceding inequality, followed by meshes of size tending to zero,
  proves convergence along all positive integers. Homogeneity removes the normalization $\| g_j \| lt.eq 1$.
  A proper subset with fewer than three roles is contained in one of the triples already treated;
  assign the constant function one to its additional roles. This proves Lemma 2 in its full stated scope.

#heading(level: 1)[References]
#bibitem([1])[I. Assani, #emph[Multiple recurrence and almost sure convergence for weakly mixing dynamical
  systems], Israel J. Math. #strong[103] (1998), 111--124.]
#bibitem([2])[T. Austin, #emph[Pleasant extensions retaining algebraic structure, I], J. Anal. Math.
  #strong[125] (2015), 1--36. #link("https://doi.org/10.1007/s11854-015-0001-9")[doi:10.1007/s11854-015-0001-9].]
#bibitem([3])[G.~D. Birkhoff, #emph[Proof of the ergodic theorem], Proc. Natl. Acad. Sci. U.S.A.
  #strong[17] (1931), no.~12, 656--660.]
#bibitem([4])[J. Bourgain, #emph[Double recurrence and almost sure convergence], J. Reine Angew. Math.
  #strong[404] (1990), 140--161.]
#bibitem([5])[A.~P. Calderón, #emph[Ergodic theory and translation-invariant operators], Proc. Natl. Acad. Sci.
  U.S.A. #strong[59] (1968), no.~2, 349--353.]
#bibitem([6])[J.-M. Derrien and E. Lesigne, #emph[Un théorème ergodique polynômial ponctuel pour les
  endomorphismes exacts et les K-systèmes], Ann. Inst. H. Poincaré Probab. Statist.
  #strong[32] (1996), no.~6, 765--778.]
#bibitem([7])[X. Fernique, #emph[Minorations des fonctions aléatoires gaussiennes], Ann. Inst.
  Fourier (Grenoble) #strong[24] (1974), no.~2, 61--66. #link("https://doi.org/10.5802/aif.506")[doi:10.5802/aif.506].]
#bibitem([8])[H. Furstenberg, #emph[Disjointness in ergodic theory, minimal sets,
  and a problem in Diophantine approximation], Math. Systems Theory #strong[1] (1967), 1--49.]
#bibitem([9])[H. Furstenberg, #emph[Ergodic behavior of diagonal measures and a theorem of Szemerédi on arithmetic
  progressions], J. Analyse Math. #strong[31] (1977), 204--256.]
#bibitem([10])[Y. Gutman, W. Huang, S. Shao, and X. Ye, #emph[Almost sure convergence of the multiple ergodic
  average for certain weakly mixing systems], Acta Math. Sin. (Engl. Ser.) #strong[34] (2018), no.~1, 79--90.]
#bibitem([11])[B. Host and B. Kra, #emph[Nonconventional ergodic averages and nilmanifolds], Ann. of Math.
  (2) #strong[161] (2005), no.~1, 397--488.]
#bibitem([12])[W. Huang, S. Shao, and X. Ye, #emph[Pointwise convergence of multiple ergodic averages and strictly
  ergodic models], J. Anal. Math. #strong[139] (2019), no.~1, 265--305; arXiv:1406.5930.]
#bibitem([13])[A. Jamneshan, #emph[An uncountable Furstenberg--Zimmer structure theory], Ergodic Theory Dynam.
  Systems #strong[43] (2023), no.~7, 2404--2436.
  #link("https://doi.org/10.1017/etds.2022.43")[doi:10.1017/etds.2022.43]. Corrected version:
  #link("https://arxiv.org/abs/2103.17167v4")[arXiv:2103.17167v4].]
#bibitem([14])[A. Jamneshan, #emph[An uncountable Furstenberg--Zimmer structure theory---Corrigendum],
  Ergodic Theory Dynam. Systems #strong[46] (2026), no.~1, 211--217.
  #link("https://doi.org/10.1017/etds.2025.10214")[doi:10.1017/etds.2025.10214].]
#bibitem([15])[R.~L. Jones, R. Kaufman, J.~M. Rosenblatt, and M.
  Wierdl, #emph[Oscillation in ergodic theory], Ergodic Theory Dynam. Systems #strong[18] (1998), no.~4, 889--935.]
#bibitem([16])[D. Kosz, M. Mirek, S. Peluse, R. Wan, and J.
  Wright, #emph[The multilinear circle method and a question of Bergelson], arXiv:2411.09478v4, September 2, 2026.]
#bibitem([17])[B. Krause, M. Mirek, and T. Tao, #emph[Pointwise ergodic theorems for non-conventional bilinear
  polynomial averages], Ann. of Math. (2) #strong[195] (2022), no.~3, 997--1109.]
#bibitem([18])[B. Kuca, #emph[Joint ergodicity---40 years on], arXiv:2603.18974v1, March 19, 2026.]
#bibitem([19])[E. Lesigne, #emph[Théorèmes ergodiques ponctuels pour des mesures diagonales.
  Cas des systèmes distaux], Ann. Inst. H. Poincaré Probab. Statist. #strong[23] (1987), no.~4, 593--612.]
#bibitem([20])[OpenAI, #emph[An $L^3$ bound for the trilinear Hilbert transform],
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/An-L3-bound-for-the-trilinear-Hilbert-transform-October-5-2026/paper.pdf")[OAI:An-L3-bound-for-the-trilinear-Hilbert-transform-October-5-2026],
  2026.]
#bibitem([21])[OpenAI, #emph[Pointwise convergence of triple ergodic averages for mixing transformations],
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/Pointwise-convergence-of-triple-ergodic-averages-for-mixing-transformations-October-4-2026/pointwise-triple-ergodic-averages-mixing-transformations.pdf")[OAI:Pointwise-convergence-of-triple-ergodic-averages-for-mixing-transformations-October-4-2026],
  2026.]
#bibitem([22])[OpenAI, #emph[Rokhlin's multiple-mixing problem for one transformation],
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/Rokhlins-multiple-mixing-problem-for-one-transformation-September-23-2026/paper.pdf")[OAI:Rokhlins-multiple-mixing-problem-for-one-transformation-September-23-2026],
  2026.]
#bibitem([23])[V. N. Sudakov, #emph[Gaussian random processes and measures of solid angles in Hilbert space],
  Dokl. Akad. Nauk SSSR #strong[197] (1971), no.~1, 43--45 (Russian).]
#bibitem([24])[J. A. Tropp, #emph[Second-order matrix concentration inequalities], Appl. Comput. Harmon. Anal.
  #strong[44] (2018), no.~3, 700--736.
  #link("https://doi.org/10.1016/j.acha.2016.07.005")[doi:10.1016/j.acha.2016.07.005].]
#bibitem([25])[T. Ziegler, #emph[Universal characteristic factors and Furstenberg averages], J. Amer. Math. Soc.
  #strong[20] (2007), no.~1, 53--97.]
#bibitem([26])[R. J. Zimmer, #emph[Extensions of ergodic group actions], Illinois J. Math.
  #strong[20] (1976), no.~3, 373--409. #link("https://doi.org/10.1215/ijm/1256049780")[doi:10.1215/ijm/1256049780].]
