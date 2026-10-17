#import "@preview/cetz:0.5.0"
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

#align(center)[#text(size: 16pt, weight: "bold")[Rokhlin's multiple-mixing problem for one transformation]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

Let $\( Omega \, cal(F) \, mu \)$ be a probability space and let $T$ be an invertible measurable transformation with measurable inverse that preserves $mu$. The transformation is #emph[mixing] if

$ mu \( A ∩ T^(- n) B \) arrow.r mu \( A \) mu \( B \) #h(2em) \( \| n \| arrow.r oo \) $

for every $A \, B in cal(F)$. For an integer $k gt.eq 2$, it is #emph[mixing of order $k$] if

$ mu (⋂_(i = 1)^k T^(- t_i) A_i) arrow.r product_(i = 1)^k mu \( A_i \) $

whenever $t_1 < dots.h.c < t_k$ are integers and $min_(i < k) \( t_(i + 1) - t_i \) arrow.r oo$, for every fixed choice of the measurable sets $A_i$. Invariance allows us to take $t_1 = 0$.

#thm([Theorem 1.1.])[
  #emph[Every invertible mixing probability-preserving transformation is mixing of every finite order. More explicitly, under the assumptions above, for every $k gt.eq 3$ and every $A_1 \, dots.h \, A_k in cal(F)$, 
$ mu #scale(x: 120%, y: 120%)[\(] A_1 ∩ T^(- n_1) A_2 ∩ dots.h.c ∩ T^(- \( n_1 + dots.h.c + n_(k - 1) \)) A_k #scale(x: 120%, y: 120%)[\)] arrow.r product_(i = 1)^k mu \( A_i \) $

 as $min \( n_1 \, dots.h \, n_(k - 1) \) arrow.r oo$ through positive integers. No standardness or countable-generation assumption is imposed on the original probability space.]
] <thm:main>

Corollary 27 extends the conclusion to mixing endomorphisms on arbitrary probability spaces and to mixing flows whose Koopman operators are strongly continuous on $L^1$. These consequences are stated and proved in Section 8.

Theorem 1 answers Rokhlin’s multiple-mixing problem affirmatively for one transformation. Rokhlin #cite(label("Rokhlin1949")) introduced higher-order mixing and proved it for ergodic surjective continuous endomorphisms of compact commutative groups with Haar probability. The question whether ordinary mixing alone implies the next order is presented as Rokhlin’s 1949 question in de la Rue’s account #cite(label("deLaRue2006")) Section 1.1; Ryzhikov surveys the all-orders formulation in #cite(label("Ryzhikov2024")) Section 1. We count the order by the number of sets, as de la Rue does: order $k$ here corresponds to multiplicity $k - 1$ in Rokhlin and Ryzhikov. Neither a group structure nor any other special form of the transformation is assumed in our theorem.

The distinction between one time generator and several is essential. Ledrappier’s zero-entropy, mixing $bb(Z)^2$ example is not threefold mixing #cite(label("Ledrappier1978")); de la Rue explains its three-dot relation and why a direct one-dimensional analogue fails #cite(label("deLaRue2006")) Sections 1.2 and 3.4, preprint version. On the positive side, Kalikow proved the twofold-to-threefold implication for rank-one transformations #cite(label("Kalikow1984")). Host obtained all orders under a singular-spectrum hypothesis #cite(label("Host1991")), and Ryzhikov obtained all-orders conclusions for mixing finite-rank automorphisms #cite(label("Ryzhikov1993")). More recently, Kanigowski and Ravotti proved that mixing locally uniformly shearing flows are mixing of all orders #cite(label("KanigowskiRavotti2024")) Theorem 6.8. These results require structure not present in a general mixing transformation. For strongly mixing actions of countable abelian groups on separable probability spaces, Bergelson and Zelada proved that the higher-order good layouts form a strong Ramsey-large set #cite(label("BergelsonZelada2024")) Theorem 1.11; this does not assert convergence along every diverging-gap layout required here.

The language of joinings, originating with Furstenberg’s work on disjointness #cite(label("Furstenberg1967")), makes a failure of higher-order mixing visible as a nonproduct limit law with independent proper marginals. Pairwise independence alone does not force a joining to be product. For an aperiodic finite-alphabet process, Janvresse and de la Rue show that a pairwise-independent joining in which one coordinate is a continuous function of the other two forces positive entropy #cite(label("JanvresseDeLaRue2008")). For the twofold/threefold question, de la Rue records both the limit joining and a zero-entropy reduction #cite(label("deLaRue2006")) Propositions 3.1 and 3.2, preprint version. At arbitrary order, an antecedent Pinsker-factor reduction is described by Ryzhikov #cite(label("Ryzhikov1997")) p. 251, who attributes it to a lemma of Thouvenot #cite(label("Thouvenot1975Pinsker")). We prove below the exact finite-alphabet, least-failure form needed here, including the passage from a possibly nonstandard original probability space. The new obstacle after that reduction is to control all residual interactions of the proper-independent limit law, not merely a selected joining. We therefore use an ordered family of array laws and prove the later operator and cancellation steps directly. Markov-operator methods for joinings and intertwinings provide a related precedent #cite(label("Ryzhikov1994")) #cite(label("Ryzhikov1997")); the rectangle and exact-line statements used here are established under our specific hypotheses.

=== The structural argument <the-structural-argument>

Suppose that $k$ is the least failing order, and put $I = { 1 \, dots.h \, k }$. The reduction gives a zero-entropy finite-alphabet mixing process $X$ and centered one-site functions $f_1 \, dots.h \, f_k$ with product correlations bounded below by a fixed positive constant along a sequence of diverging layouts. A single limit joining retains this failure, but independence of all its proper marginals does not force it to be product. For each $n gt.eq 1$, repeated limits at sums of $n$ layouts give a law $rho_n$ on $X^(I^n)$, with the layout indices sent to infinity in a specified order. The law $rho_1$ retains the correlation witness; $rho_2$ is an ordered square whose proper families of last-axis planes are independent. Higher levels allow one axis to become part of a local state while preserving that conditional-product property. No symmetry under permutations of array axes is assumed.

We enlarge all these laws together. A local state $y$ retains an $X$-coordinate $x \( y \)$ and a parameter $u \( y \)$; proper last-axis planes remain independent even after conditioning on the whole parameter array. A conditional-expectation energy construction, using the method of sated extensions #cite(label("Austin2015Sated")), makes the extension saturated: richer data in any further admissible extension do not improve the conditional expectation of an old test. This permits a first axis to be included in the local state while selected states on that axis are included in the parameter. The main conditioning argument proves that these extensions still have the prescribed relative independence. In a square array, saturation consequently gives exact locality of row and column conditional laws.

The next step turns that locality into a description by orthogonal lines of functions. At a coordinate of a joint law, consider the closed span of the conditional expectations of functions of the other coordinates. We call this its active space. Row and column conditional-expectation operators in a square satisfy two rectangle identities. The identities force fixed positive parts on the intersections of the active spaces; their polar parts form an abelian unitary group. This yields lines spanned by modulus-one functions that can be completed along either a row or a column so that their product is constant. The converse inclusion requires both incident operator identities and is proved as part of the same argument.

Here the sated-extension method is implemented in an array category whose specified conditional product laws survive countable inverse limits. It does not require mixing of the enlarged system. The operator step extracts multiplicatively matched orthogonal lines from concrete kernel identities. It uses dense-range cancellation of positive operators and does not require their inverses to be bounded.

=== From lines to the contradiction <from-lines-to-the-contradiction>

The parameter geometry of the square makes the active space in each individual fibre equal to the span of its exact lines. We enumerate these lines measurably and regard multiplication modulo constant phases as a countable abelian group. The row laws match these groups by isomorphisms. A counting-measure lift of the parameter laws partitions each group into finite blocks of constant cardinality. Time permutes the blocks, and on an abstract copy of the group this permutation is implemented by a single automorphism. Only the motion of whole blocks is used; a uniform rule for the time evolution of individual labels inside a block is unnecessary.

Finally, a label orbit is either dissociated on arithmetic progressions or polynomial on such progressions. In the first case an exponential estimate for the label functions combines with the subexponential number of likely words in a zero-entropy process. In the second case a Hilbert-space averaging argument reduces polynomial degree, with ordinary mixing providing the base case. These estimates allow an arbitrary coupling of the process and the label functions. They show that the average absolute correlation with each moving finite block tends to zero, contradicting a positive quantity preserved by time.

The averages appear only in this contradiction inside a hypothetical counterexample. The conclusion of Theorem 1 remains convergence along every diverging positive-gap layout. The proof uses one time transformation throughout; the auxiliary array indices are not additional time generators.

Section 2 constructs the zero-entropy witness. Section 3 proves saturation and square locality. Section 4 establishes the operator description of exact lines. Section 5 obtains measurable labels and finite blocks. Section 6 proves the one-dimensional cancellation result, Section 7 assembles the contradiction, and Section 8 proves the endomorphism and flow consequences.

=== Conventions <conventions>

We write $bb(T) = { z in bb(C) : \| \| z = 1 }$ for the circle group under multiplication. Hilbert spaces are complex, with inner products linear in the second argument, and all spans of subspaces are closed spans. Conditional laws and identities of factors are understood modulo null sets. After passing to the finite-alphabet factor, all random-element spaces and subsequent extensions are standard Borel spaces, with completion when needed. Regular conditional laws can therefore be chosen using countable determining classes. Assertions needed in finitely many orientations or countably many time translates are imposed on a common conull set. We use the standard conditional-expectation convergence theorems, the finite-partition entropy chain rule, and the spectral theorem for compact positive operators. Their applications below take place on the indicated probability spaces or separable Hilbert spaces.

== 2 A finite-alphabet witness of zero entropy <sec:reduction>

We first place a hypothetical failure in a standard probability space and remove its positive-entropy part. The reduction also preserves the least order of failure. Throughout, the entropy of a finite partition is Shannon entropy with natural logarithms.

#thm([Proposition 2.1.])[
  (Zero-entropy witness).  #emph[Suppose an invertible mixing transformation fails to be mixing of every order. There then exist an integer $k gt.eq 3$, a finite alphabet $cal(A)$, a shift-invariant probability measure $mu_X$ on $X = cal(A)^(bb(Z))$, and real one-site functions $f_1 \, dots.h \, f_k$ such that the shift $T_X$ is mixing of every order less than $k$, 
$ integral f_i thin upright(d) mu_X = 0 \, #h(2em) lr(bar.v.double f_i bar.v.double)_oo lt.eq 1 \, #h(2em) lim_(n arrow.r oo) 1 / n H_(mu_X) \( x_1 \, dots.h \, x_n \) = 0 . $

 Moreover, there are $delta > 0$ and integer layouts 
$ 0 = d_1 \( b \) < d_2 \( b \) < dots.h.c < d_k \( b \) \, #h(2em) min_(i < k) #scale(x: 120%, y: 120%)[\(] d_(i + 1) \( b \) - d_i \( b \) #scale(x: 120%, y: 120%)[\)] arrow.r oo \, $

 for which 
#[#set math.equation(numbering: n => "(1)")
 $ integral_X product_(i = 1)^k f_i \( T_X^(d_i \( b \)) x \) thin upright(d) mu_X \( x \) gt.eq delta quad upright("for every ") b . $ <eq:witness-correlation>]

]
] <prop:zero-entropy-witness>

#proof[
  Let $k$ be the least failing order and choose sets witnessing failure along layouts whose least consecutive gap tends to infinity. Passing to a subsequence makes the discrepancy from the product of the means have a fixed sign and absolute value at least some $epsilon > 0$. Mixing at every smaller order holds for bounded functions, by approximation with simple functions.
  Let $alpha$ be the finite partition generated by the witnessing sets and put $alpha_i = T^(- i) alpha$. We work inside the completed factor generated by $\( alpha_i \)_(i in bb(Z))$ and define its past tail by
  $ cal(C) = ⋂_(m gt.eq 1) sigma \( alpha_i : i lt.eq - m \) . $
  All the factor $sigma$-fields in this proof are understood with their probability completions. This $sigma$-field is invariant under $T$ and $T^(- 1)$. Write $g_i$ for the witnessing indicators and $macron(g)_i = bb(E) \[ g_i divides cal(C) \]$. Replacing $g_i compose T^(d_i \( b \))$ by $macron(g)_i compose T^(d_i \( b \))$, successively from $i = k$ down to $i = 1$, changes the product integral by a quantity tending to zero. Indeed, after translating the time of the factor being replaced to zero, all earlier factors are measurable with respect to
  $ cal(F)_(- g) = sigma \( alpha_i : i lt.eq - g \) \, #h(2em) g = min_(i < k) \( d_(i + 1) \( b \) - d_i \( b \) \) \, $
  and all later, already replaced factors are $cal(C)$-measurable. Their product has absolute value at most one. The error at this step is therefore at most
  $ lr(bar.v.double bb(E) \[ g_i divides cal(F)_(- g) \] - bb(E) \[ g_i divides cal(C) \] bar.v.double)_1 \, $
  which tends to zero by the reverse martingale theorem. The same argument applies to the first factor, whose remaining factors are all in the tail. Conditional expectation preserves the means, so the tail functions still witness failure along a subsequence.
  We next verify that every finite $cal(C)$-measurable partition $beta$ has entropy rate zero. For a finite partition $gamma$, write $gamma_i = T^(- i) gamma$. Stationarity and the entropy chain rule give
  #[#set math.equation(numbering: n => "(2)")
   $ h \( gamma \) := lim_(n arrow.r oo) 1 / n H \( gamma_1 \, dots.h \, gamma_n \) = H #scale(x: 120%, y: 120%)[\(] gamma_0 divides sigma \( gamma_i : i < 0 \) #scale(x: 120%, y: 120%)[\)] . $ <eq:entropy-past-formula>]
  For completeness, the increments in the chain rule are $H \( gamma_0 divides gamma_(- j) \, dots.h \, gamma_(- 1) \)$; they decrease to the right side, since the conditional probabilities of the finitely many atoms converge and entropy is a bounded continuous function on their probability simplex. Their Cesàro averages give the asserted limit.
  For any $epsilon.alt > 0$, there is $M$ such that
  $ H \( beta_0 divides alpha_(- M) \, dots.h \, alpha_M \) < epsilon.alt . $
  Consequently the chain rule and monotonicity under conditioning give
  $ H #scale(x: 120%, y: 120%)[\(] \( alpha or beta \)_1 \, dots.h \, \( alpha or beta \)_n #scale(x: 120%, y: 120%)[\)] lt.eq H \( alpha_(1 - M) \, dots.h \, alpha_(n + M) \) + n epsilon.alt . $
  After division by $n$, this proves $h \( alpha or beta \) lt.eq h \( alpha \) + epsilon.alt$. The reverse inequality follows from refinement, and hence $h \( alpha or beta \) = h \( alpha \)$.
  On the other hand, every translate of $beta$ belongs to the invariant tail $cal(C)$ and hence to the past of $alpha$ before each fixed time $i$. Conditioning on $beta_1 \, dots.h \, beta_n$ therefore does not add information beyond $sigma \( alpha_j : j < i \)$ in the lower bound below:
  $ H \( alpha_1 \, dots.h \, alpha_n divides beta_1 \, dots.h \, beta_n \) & = sum_(i = 1)^n H \( alpha_i divides alpha_1 \, dots.h \, alpha_(i - 1) \, beta_1 \, dots.h \, beta_n \)\
 & gt.eq sum_(i = 1)^n H \( alpha_i divides sigma \( alpha_j : j < i \) \) = n h \( alpha \) . $
  Combining this with
  $ H #scale(x: 120%, y: 120%)[\(] \( alpha or beta \)_1 \, dots.h \, \( alpha or beta \)_n #scale(x: 120%, y: 120%)[\)] = H \( beta_1 \, dots.h \, beta_n \) + H \( alpha_1 \, dots.h \, alpha_n divides beta_1 \, dots.h \, beta_n \) $
  and taking rates proves $h \( beta \) = 0$.
  Choose, once and for all, finite-valued $cal(C)$-measurable approximations $h_i$ to the $macron(g)_i$, with values in $\[ 0 \, 1 \]$. They can be made sufficiently close in $L^1$ to preserve a fixed positive discrepancy along the selected layouts: the change in either a product integral or the product of the means is bounded by the sum of the $L^1$ errors. Let $beta$ be their common finite partition. Coding the $beta$-name gives a factor on $cal(A)^(bb(Z))$, with its induced measure $mu_X$. This is a standard probability space, its alphabet entropy rate is $h \( beta \) = 0$, and its shift inherits all mixing properties of the original transformation. The $h_i$ become one-site functions.
  Center these functions. Expanding their centered product, every proper subproduct tends to the product of its means, because its ordered sublayout still has all consecutive gaps tending to infinity and contains fewer than $k$ times. Thus the centered product differs by $o \( 1 \)$ from the original discrepancy. Each centered function has supremum norm at most one. A change of sign in the first function, followed by discarding finitely many layouts, gives (1). ◻
]

The all-orders Pinsker-factor antecedent is described by Ryzhikov #cite(label("Ryzhikov1997")) p. 251, with attribution there to Thouvenot #cite(label("Thouvenot1975Pinsker")). The corresponding reduction from failure of threefold mixing appears in de la Rue’s account #cite(label("deLaRue2006")) Proposition 3.2, preprint version. We included the proof to specify the finite-alphabet witness, the replacement order, and the entropy conclusion on an arbitrary original probability space.

From now on we fix the system and witness supplied by Proposition 2, and put $I = { 1 \, dots.h \, k }$. The rest of the proof will contradict (1).

== 3 Ordered arrays and conditional locality <sec:arrays>

The next construction retains the order in which limits are taken. Its basic independence is along the last axis. Additional independence and conditional locality will be consequences of an extension argument; they are not symmetry assumptions on the arrays.

=== 3.1 The initial array laws <the-initial-array-laws>

We interpret $I^0$ as a singleton. For each $n gt.eq 0$ there is a probability law $rho_n$ on $X^(I^n)$ with the following properties:

+ $rho_0 = mu_X$, and $rho_n$ is invariant under simultaneous $T_X$;
+ fixing any one axis at any slot gives $rho_(n - 1)$;
+ any proper family of last-axis planes is independent under $rho_n$;
+ #[#set math.equation(numbering: n => "(3)")
   $ integral_(X^I) product_(i in I) f_i \( x_i \) thin upright(d) rho_1 \( x \) gt.eq delta . $ <eq:array-witness>]

Here a last-axis plane is the whole array with its last coordinate fixed; “proper” means containing at most $k - 1$ of the $k$ planes.

To construct the laws, fix a free ultrafilter on the layout indices $b$. For $b_1 \, dots.h \, b_n$, start with the law of

$ (T_X^(sum_(ell = 1)^n d_(j_ell) \( b_ell \)) x)_(\( j_1 \, dots.h \, j_n \) in I^n) \, #h(2em) x tilde.op mu_X . $

Take the ultralimit in $b_n$ first, then $b_(n - 1)$, and so on. These limits exist on cylinder probabilities. They are consistent probabilities on every finite collection of alphabet coordinates and therefore determine a probability measure on the countable product $X^(I^n)$. These are also successive weak ultralimits on this compact metrizable space. Ultralimits of bounded scalar sequences are linear and multiplicative.

Time invariance is immediate. Fixing one axis adds a common time translation to all remaining entries; invariance of $mu_X$ removes that translation before the limits are taken. This proves consistency for every axis. To verify last-axis independence, take cylinder tests on $s lt.eq k - 1$ distinct last-axis planes and hold $b_1 \, dots.h \, b_(n - 1)$ fixed. Each test is then a fixed bounded function of $x$, translated by the corresponding $d_j \( b_n \)$. Mixing of order $s$ makes their product integral converge to the product of their integrals. Multiplicativity of the remaining ultralimits gives independence with plane marginal $rho_(n - 1)$; for $s = 1$ this is simply the marginal assertion and requires no mixing hypothesis. Cylinder tests determine the asserted law. Finally, (3) follows from (1).

=== 3.2 The class of extensions <the-class-of-extensions>

All spaces in the rest of the proof are standard Borel spaces, with their probability completions when discussing measurable functions or $sigma$-fields. Conditional laws are regular conditional laws. Their identities are equalities almost surely, determined first on countable generating families of tests. This permits simultaneous choices of versions for the countably many array levels and identities below.

At level $1$, the law $rho_1$ still carries (3). At level $2$, view $I^2$ as a square: proper families of its columns, the last-axis planes, are independent as whole column arrays. We have not asserted the analogous row independence. The higher levels will let us roll a first-axis row into one local state and retain the same last-axis contract. To do that we enlarge every $rho_n$ compatibly, retaining an $X$-factor and recording a parameter at each local state.

#prodef([Definition 3.1.])[
  (An array object).  An #emph[array object] consists of standard probability systems $\( Y \, m_0 \, T_Y \)$ and $\( U \, nu \, T_U \)$, factor maps
  $ kappa : Y arrow.r X \, #h(2em) u : Y arrow.r U \, $
  and probability laws $m_n$ on $Y^(I^n)$ for $n gt.eq 0$. All transformations are invertible and the factor maps commute with time. The laws satisfy the following requirements.
  + Each $m_n$ is invariant under simultaneous $T_Y$ and projects coordinatewise to $rho_n$. For $n gt.eq 1$, fixing any axis at a slot gives $m_(n - 1)$, and every proper family of last-axis planes is independent under $m_n$.
  + For $n gt.eq 1$, conditional on the complete parameter array $\( u \( y_v \) \)_(v in I^n)$, every proper family of last-axis planes is independent. The conditional law of each plane is $m_(n - 1)$ conditioned only on that plane’s own parameter array.
  + Under $m_0$, $kappa \( y \)$ and $u \( y \)$ are independent; in particular, $kappa_(*) m_0 = mu_X$.
  An #emph[extension] is another such object together with a local factor map $theta : Y' arrow.r Y$ preserving every array law and the map to $X$, such that the old parameter is a factor of the new parameter. The latter means that $u compose theta = psi compose u'$ for a time-commuting factor $psi : U' arrow.r U$.
] <def:array-object>

We also write $x \( y \) = kappa \( y \)$ for the $X$-coordinate of a local state. The initial laws give an object with $Y = X$ and a constant parameter. For an object and $n gt.eq 1$, let

$ cal(P)_n = sigma \( u \( y_v \) : v in I^n \) \, #h(2em) cal(O)_(n \, j) = sigma \( y_v : v_n eq.not j \) \, #h(2em) cal(G)_(n \, j) = cal(P)_n or cal(O)_(n \, j) . $

Thus $cal(P)_n$ records every parameter, $cal(O)_(n \, j)$ records every state outside plane $j$, and $cal(G)_(n \, j)$ combines both. Saturation will prevent an extension from revealing more about an old test through any of these three kinds of data.

The construction uses the conditional-expectation energy and inverse-limit method of sated extensions; see #cite(label("Austin2015Sated")) preprint version, proof of Theorem 3.11 and Lemma 3.12. We verify directly that the defining conditional product laws of our array category survive inverse limits.

#thm([Proposition 3.2.])[
  (Saturation).  #emph[Every array object has an extension with the following property. For every $n gt.eq 1$, every $F in L^2 \( m_n \)$, and each 
$ cal(D) in { cal(P)_n } union { cal(G)_(n \, j) \, cal(O)_(n \, j) : j in I } \, $

 no extension increases the norm of $bb(E) \[ F divides cal(D) \]$ after pullback. More precisely, if $theta_n$ is the coordinatewise factor map from any extension and $cal(D)'$ is the corresponding data in that extension, then 
#[#set math.equation(numbering: n => "(4)")
 $ bb(E) \[ F compose theta_n divides cal(D)' \] = bb(E) \[ F divides cal(D) \] compose theta_n . $ <eq:saturation-equality>]

]
] <prop:saturation>

#proof[
  We first check closure under sequential inverse limits. For a sequence of extensions, take the local state and parameter spaces to be the spaces of compatible paths, with their consistent probability laws. They are standard Borel spaces. At every array level the consistent finite-stage laws determine a law on compatible array paths. Time acts coordinatewise. Projection to $X$, consistency under fixing any axis, and unconditional last-axis independence pass to the limit by testing finite-stage functions. Independence of the local $X$-state and the limiting parameter follows in the same way.
  For the conditional requirement, fix a proper family $J$ of last-axis planes and bounded functions $F_j$ on those planes, all pulled from one finite stage. Let $cal(P)_n^(\( s \))$ denote the full parameter array at stage $s$, and $cal(P)_(n - 1 \, j)^(\( s \))$ its restriction to plane $j$. For every sufficiently large $s$, the defining property gives
  $ bb(E) [product_(j in J) F_j thin mid(bar.v) thin cal(P)_n^(\( s \))] = product_(j in J) bb(E) \[ F_j divides cal(P)_(n - 1 \, j)^(\( s \)) \] . $
  Increasing martingale convergence on both sides gives the same identity for the limiting parameter fields. The factors are uniformly bounded, so their products converge in $L^2$. This proves both independence and dependence of each plane law only on its own parameters, first for finite-stage tests and then, by density, for all bounded tests.
  For a fixed test and data type, the norm of the indicated conditional expectation is nondecreasing under extension and bounded above by the norm of the test. At each constructed stage, choose countable dense families of bounded tests in every $L^2 \( m_n \)$, and list all pairs of a test and one of the finitely many data types at that level. Construct successive extensions as follows. At round $q$, process the first $q$ listed pairs from each of the first $q$ stages already constructed. For each pair choose an extension whose projection norm is within $2^(- q)$ of the supremum over extensions of the current stage. There is no requirement to attain the supremum. Append these finitely many extensions and continue. Every listed pair is processed infinitely often with error tending to zero. Taking the sequential inverse limit gives an object $M_oo$ in the class.
  Let $Z$ be any extension of $M_oo$, and fix a test listed at some finite stage. At any sufficiently late processing step, $Z$ is also an extension of the current stage. Its projection norm is consequently at most that step’s supremum, which is at most the chosen next-stage norm plus $2^(- q)$. The next-stage norm is at most the limiting norm. Letting $q arrow.r oo$ proves that $Z$ cannot increase the norm for this test. Finite-stage functions are dense in the inverse-limit $L^2$ spaces, and conditional expectation is a contraction. The same conclusion follows for every $F in L^2 \( m_n \)$ of $M_oo$.
  Finally, the pullback of $cal(D)$ is contained in $cal(D)'$. The Pythagorean identity for these nested orthogonal projections is
  $ & lr(bar.v.double bb(E) \[ F compose theta_n divides cal(D)' \] bar.v.double)_2^2 - lr(bar.v.double bb(E) \[ F divides cal(D) \] compose theta_n bar.v.double)_2^2\
 & #h(2cm)  = lr(bar.v.double bb(E) \[ F compose theta_n divides cal(D)' \] - bb(E) \[ F divides cal(D) \] compose theta_n bar.v.double)_2^2 . $
  The equality of norms therefore gives (4). ◻
]

We fix a saturated object for the rest of the proof. Its enlargement need not be mixing. All subsequent locality assertions will come from (4) and the defining array laws. The equality says that observing the extension’s richer parameter or outside-plane data reveals no more about an old $L^2$ test than the corresponding old data did.

=== 3.3 Conditioning on parent planes <conditioning-on-parent-planes>

We record the elementary conditioning fact that will justify the induction. It keeps track of which parameters determine each marginal.

#thm([Lemma 3.3.])[
  (Local conditioning).  #emph[Let $E \, O_1 \, dots.h \, O_s \, B$ be standard random elements. Suppose $E_j = e_j \( E \)$ and $A_j = a_j \( E_j \, O_j \)$ are measurable, and that 
$ "Law" \( \( O_j \)_(j = 1)^s divides E \) = ⨂_(j = 1)^s K_j \( E_j \, dot.op \) \, #h(2em) "Law" \( B divides E \, O_1 \, dots.h \, O_s \) = L \( E \, A_1 \, dots.h \, A_s \; dot.op \) . $

 If $Q_j$ is the conditional law of $O_j$ given $\( E_j \, A_j \)$, then 
#[#set math.equation(numbering: n => "(5)")
 $ "Law" \( \( O_j \)_(j = 1)^s divides E \, A_1 \, dots.h \, A_s \, B \) = ⨂_(j = 1)^s Q_j \( E_j \, A_j \; dot.op \) . $ <eq:local-conditioning>]

]
] <lem:local-conditioning>

#proof[
  The tower property shows that $K_j \( E_j \, dot.op \)$ is also the conditional law of $O_j$ given $E_j$. Let $M_j \( x \, dot.op \)$ be its image under $o mapsto a_j \( x \, o \)$. Disintegration gives, for almost every $x$ with respect to the law of $E_j$,
  $ K_j \( x \, thin upright(d) o \) delta_(a_j \( x \, o \)) \( thin upright(d) alpha \) = M_j \( x \, thin upright(d) alpha \) Q_j \( x \, alpha \; thin upright(d) o \) . $
  Substituting $x = e_j \( E \)$ preserves these almost-sure identities. The joint law of $\( E \, O \, A \, B \)$ thus factors as
  $ "Law" \( E \) \( thin upright(d) e \) [⨂_(j = 1)^s M_j \( e_j \( e \) \, thin upright(d) alpha_j \)] L \( e \, alpha \; thin upright(d) b \) [⨂_(j = 1)^s Q_j \( e_j \( e \) \, alpha_j \; thin upright(d) o_j \)] . $
  The first three factors give the law of $\( E \, A \, B \)$, proving (5). ◻
]

#thm([Lemma 3.4.])[
  (Rolling an axis into the local state).  #emph[Let $R subset I$ satisfy $\| R \| lt.eq k - 2$, and choose $a in I \\ R$. There is an extension of the saturated object whose local state is $Y' = Y^I$, with local law $m_1$, parameter 
#[#set math.equation(numbering: n => "(6)")
 $ u' \( \( y_c \)_(c in I) \) = \( \( u \( y_c \) \)_(c in I) \, \( y_c \)_(c in R) \) \, $ <eq:rolled-parameter>]

 and factor map $\( y_c \)_(c in I) mapsto y_a$. Its level-$n$ law is $m_(n + 1)$, with the first axis treated as internal to the local state, and its time transformation is componentwise $T_Y$.]
] <lem:rolled-extension>

#proof[
  We prove the statement by induction on $\| R \|$, simultaneously for all array levels and all projection slots $a in.not R$. Saturation will be used only for extensions already supplied by smaller parent sets. The resulting screening identity and Lemma 5 will then verify the conditional product law for the larger parent set. Write an entry of the old level $n + 1$ as $y_(c \, w)$, where $c in I$ is the internal axis and $w in I^n$ comprises the remaining axes. The proposed projection retains $y_(a \, w)$. It preserves every array law by axis consistency, preserves the $X$-state through $kappa \( y_a \)$, and recovers the old parameter from (6). Time invariance, consistency, and unconditional last-axis independence for the candidate follow directly from the old level $n + 1$.
  At the local level, condition on $\( u \( y_c \) \)_(c in I)$ in $m_1$. The set $R union { a }$ is proper. Its states are conditionally independent, with the law at $a$ conditioned only on $u \( y_a \)$. Since the $X$-image of that conditional law is $mu_X$, the selected $X$-state still has law $mu_X$ after conditioning further on $\( y_c \)_(c in R)$. This verifies the required independence from the enlarged parameter. If $R = diameter$, the remaining conditional last-axis requirement is exactly the old condition at level $n + 1$, so the base case is proved.
  Now suppose $R eq.not diameter$ and that the lemma holds for smaller parent sets. Fix $n gt.eq 1$ and a missing last-axis slot $j_0$. In the old law $m_(n + 1)$ let
  $ E = \( u \( y_(c \, w) \) \)_(c \, w) \, #h(2em) O = \( y_(c \, w) : w_n eq.not j_0 \) . $
  For $j eq.not j_0$, let $O_j$ be the full plane at last slot $j$, $E_j$ its old parameter array, and $A_j$ its states at internal indices $c in R$. Finally, let
  $ B = \( y_(c \, w) : c in R \, med w_n = j_0 \) $
  be the parent states in the missing plane. Conditional on $E$, the $O_j$ are independent, with each plane law depending only on $E_j$. We claim that
  #[#set math.equation(numbering: n => "(7)")
   $ "Law" \( B divides E \, O \) upright(" depends on ") O upright(" only through ") \( A_j \)_(j eq.not j_0) . $ <eq:parent-screening>]
  Enumerate $R$ and reveal its missing-plane slices one internal index $c$ at a time. Let $R'$ be the set of indices already revealed. It has smaller cardinality than $R$. The induction hypothesis supplies a valid extension with parent set $R'$ and projection slot $c$. Apply saturation to a bounded test $F$ of the missing-plane slice $\( y_(c \, w) : w_n = j_0 \)$, viewed as a function on the projected old level $n$. For the data type $cal(G)_(n \, j_0)$, the old data are the parameters of the row at $c$ and its states outside the missing plane; the enlarged data are $E$, all of $O$, and the already revealed missing parent slices. More explicitly, if $B_(R')$ denotes those already revealed missing slices, write $A_j^(R')$ for the states of $O_j$ at internal indices in $R'$. This smaller-parent extension has $cal(P)'_n = sigma \( E \, \( A_j^(R') \)_(j eq.not j_0) \, B_(R') \)$, $cal(O)'_(n \, j_0) = sigma \( O \)$, and $cal(G)'_(n \, j_0) = sigma \( E \, O \, B_(R') \)$. Hence (4) says exactly that
  #[#set math.equation(numbering: n => "(8)")
   $ bb(E) \[ F divides E \, O \, \( y_(l \, w) \)_(l in R' \, w in I^n) \] = bb(E) \[ F divides \( u \( y_(c \, w) \) \)_(w in I^n) \, \( y_(c \, w) : w_n eq.not j_0 \) \] . $ <eq:parent-reveal>]
  The right side is the old $m_n$ conditional kernel at the fixed internal index $c$. It involves only $E$ and the part of $O$ belonging to that same $c$, and it does not depend on previously revealed missing states. Multiplication of these successive kernels proves (7).
  Apply Lemma 5 to the proper family of planes $O_j$. Conditioning on $E$, all the $A_j$, and $B$ preserves their independence and conditions each plane only on $\( E_j \, A_j \)$. These are precisely the complete enlarged parameters and each plane’s own enlarged parameters, respectively. The law of such a plane is the old $m_n$, now viewed as the candidate level $n - 1$; its conditional law given $\( E_j \, A_j \)$ is therefore exactly the one required by Definition 3. We have proved the requirement for $k - 1$ planes. Marginalization proves it for every proper family.
  There are only countably many levels and finitely many choices of parents and slots at each induction step. Testing on countable determining classes makes all the kernel equalities simultaneous. The induction is complete. ◻
]

=== 3.4 The square and its grouped kernels <the-square-and-its-grouped-kernels>

Introduce the disintegrations

#[#set math.equation(numbering: n => "(9)")
 $ m_0 \( thin upright(d) y \) = integral_U eta_u \( thin upright(d) y \) nu \( thin upright(d) u \) \, #h(2em) m_1 \( thin upright(d) upright(bold(y)) \) = integral_(U^I) lambda_p \( thin upright(d) upright(bold(y)) \) pi \( thin upright(d) p \) \, $ <eq:local-and-row-disintegrations>]

where $pi$ is the law of the parameter tuple under $m_1$. The local law $eta_u$ is concentrated on $u \( y \) = u$ and satisfies

#[#set math.equation(numbering: n => "(10)")
 $ kappa_(*) eta_u = mu_X quad upright("for ") nu upright("-almost every ") u . $ <eq:fibre-X-marginal>]

Every proper coordinate marginal of $pi$ is a product of copies of $nu$. Every proper coordinate marginal of $lambda_p$ is $⨂_j eta_(p_j)$ on those coordinates. These assertions follow respectively from unconditional and conditional last-axis independence at level one.

The measure $nu$ is $T_U$-invariant, and $pi$ is invariant under $T_U^I$. Uniqueness of disintegration and time invariance give

#[#set math.equation(numbering: n => "(11)")
 $ eta_(T_U u) = \( T_Y \)_(*) eta_u \, #h(2em) lambda_(T_U^I p) = \( T_Y^I \)_(*) lambda_p . $ <eq:fibre-time-equivariance>]

By intersecting the relevant conull sets over all integer translates, we may use these identities, the marginal assertions, and (10) on invariant conull sets. In particular, time carries one fibre Hilbert space to another; it need not preserve an individual fibre.

Write the level-two state as $\( y_(a \, j) \)_(a \, j in I)$, with $a$ the first axis (the row index) and $j$ the last axis (the column index). Its full parameter array and its row and column parameter tuples are

$ E = \( u_(a \, j) \)_(a \, j in I) \, #h(2em) p_a = \( u_(a \, j) \)_(j in I) \, #h(2em) q_j = \( u_(a \, j) \)_(a in I) . $

Thus the order within either tuple is the original order on $I$. For subsets $D \, J subset I$, let $Y_(D \, J) = \( y_(a \, j) \)_(a in D \, j in J)$; write $Y_(a \, I)$ for a single row and $Y_(I \, j)$ for a single column.

#thm([Proposition 3.5.])[
  (Square locality).  #emph[The following properties hold in $m_2$, and can be imposed simultaneously on one conull set of full parameter arrays $E$.]
  + #emph[Conditional on $E$, every proper family of columns is independent, with column $j$ having law $lambda_(q_j)$. Every proper family of rows is independent, with row $a$ having law $lambda_(p_a)$.]
  + #emph[Let $R subset I$, $\| R \| lt.eq k - 2$. Given $E$ and the full parent rows $Y_(R \, I)$, every proper family of columns is independent, and each column has law $lambda_(q_j)$ conditioned on its own parent entries $Y_(R \, j)$.]
  + #emph[If $a in.not R$ and $j_0 in I$, then 
#[#set math.equation(numbering: n => "(12)")
 $ "Law" \( y_(a \, j_0) divides E \, Y_(R \, I) \, Y_(I \, I \\ { j_0 }) \) = lambda_(p_a) \( thin upright(d) y_(a \, j_0) divides Y_(a \, I \\ { j_0 }) \) . $ <eq:single-cell-locality>]

]
  #emph[There is also the following grouped form. Partition the rows into three nonempty groups $P \, A \, B$ and the columns into three nonempty groups $r \, s \, t$. At a fixed typical $E$, each grouped row 
$ \( Y_(D \, r) \, Y_(D \, s) \, Y_(D \, t) \) \, quad D in { P \, A \, B } \, $

 has a three-coordinate law with pairwise independent coordinates, and the same holds for each grouped column. Given $Y_(P \, I)$, any two grouped columns are independent with their own column laws conditioned on their entries in $P$. Finally, putting $Lambda_A = ⨂_(a in A) lambda_(p_a)$, we have 
#[#set math.equation(numbering: n => "(13)")
 $ "Law" \( Y_(A \, t) divides E \, Y_(P \, I) \, Y_(I \, r union s) \) = Lambda_A \( thin upright(d) Y_(A \, t) divides Y_(A \, r) \, Y_(A \, s) \) . $ <eq:grouped-cell-locality>]

 All these grouped assertions hold for every ordering of the three row groups and the three column groups.]
] <prop:square-locality>

#proof[
  Column independence in (1) is the defining conditional independence at level two. To obtain rows, use the extension in Lemma 6 with parent set $R$ and projection slot $a in.not R$. For a bounded test $F$ of the entire projected row, saturation for the full parameter data $cal(P)_1$ gives
  #[#set math.equation(numbering: n => "(14)")
   $ bb(E) \[ F \( Y_(a \, I) \) divides E \, Y_(R \, I) \] = integral F thin upright(d) lambda_(p_a) . $ <eq:row-given-parents>]
  Reveal the members of any proper row family in turn. The previous members number at most $k - 2$, so (14) applies at every step. Their joint conditional law is the product of the indicated row laws.
  Assertion (2) is the conditional last-axis requirement at level one of the extension with parents $R$. Its local law is $m_1$ on each column, and its own parameter there is $\( q_j \, Y_(R \, j) \)$, giving precisely the stated marginal kernel. For (3), use the same extension and saturation for $cal(G)_(1 \, j_0)$. The projected old data are $p_a$ and the other entries of row $a$, while the extension data are $E$, the parents, and all columns except $j_0$. This gives (12).
  We prove the grouped assertions without interchanging array axes. Each row group is a proper set of rows, so its full law is the product of its individual row laws. Within each individual row, any proper set of column coordinates is independent. Consequently any two grouped cells in that grouped row are independent. The identical conclusion for a grouped column follows by applying the corresponding column assertions. Since $\| P \| lt.eq k - 2$, (2) applies to the parents $P$. The union of any two column groups is proper, which gives the claimed conditional independence of grouped columns.
  It remains to prove (13). We first handle a single missing column $j_0$. Given $E$, $Y_(P \, I)$, and all other columns, reveal $y_(a \, j_0)$ successively for $a in A$. At each step the parents consist of $P$ and the previously revealed rows in $A$. Their number is at most
  $ \| P \| + \| A \| - 1 = k - \| B \| - 1 lt.eq k - 2 . $
  All their remaining entries are already known from the observed columns. Equation (12) therefore gives the kernel of the individual row at that step. These kernels do not depend on the previously revealed entries in column $j_0$, and hence
  #[#set math.equation(numbering: n => "(15)")
   $ "Law" \( Y_(A \, j_0) divides E \, Y_(P \, I) \, Y_(I \, I \\ { j_0 }) \) = ⨂_(a in A) lambda_(p_a) \( thin upright(d) y_(a \, j_0) divides Y_(a \, I \\ { j_0 }) \) . $ <eq:group-single-missing>]
  Now choose $j_0 in t$, put $J = t \\ { j_0 }$ and $C = r union s$, and retain $W = Y_(A \, J)$ as part of the output. The set $C union J$ consists of exactly $k - 1$ columns. By (2), conditional on $E$ and $Y_(P \, I)$, those columns are independent. In each of them, $P union A$ is a proper row set. Thus the $A$-entries, even after conditioning on its $P$-entries, have the plain product marginal $⨂_(a in A) eta_(u_(a \, j))$. It follows that
  #[#set math.equation(numbering: n => "(16)")
   $ "Law" \( W divides E \, Y_(P \, I) \, Y_(I \, C) \) = ⨂_(a in A \, thin j in J) eta_(u_(a \, j)) . $ <eq:group-intermediate-marginal>]
  Use (15) and then integrate away the additional states in columns $J$, retaining $W$. Its right side depends on those columns only through $W$, so the resulting joint kernel for $\( W \, Y_(A \, j_0) \)$ is the measure in (16), followed by the product of the individual row kernels in (15).
  Under the row-group law $Lambda_A$, the coordinates in $C union J$ are also independent with exactly those marginals: the rows in $A$ are independent and each row has independent proper coordinates. Consequently the just obtained kernel is exactly the conditional law of $Y_(A \, t)$ under $Lambda_A$ given $Y_(A \, C)$. This proves (13), including the case $J = diameter$. Only cardinalities of the groups were used, so every ordering of the groups is allowed. All choices are finite; the earlier convention on kernel versions makes the assertions simultaneous. ◻
]

=== 3.5 The geometry of the parameters <the-geometry-of-the-parameters>

The last property needed from the square is unconditional: it describes how a row parameter tuple and the column parameter tuples can meet. For $a in I$, let

#[#set math.equation(numbering: n => "(17)")
 $ K_a \( u \, thin upright(d) q \) = pi \( thin upright(d) q divides q \[ a \] = u \) . $ <eq:parameter-coordinate-kernel>]

This is a probability kernel for $nu$-almost every $u$, because the $a$th coordinate marginal of $pi$ is $nu$.

#thm([Lemma 3.6.])[
  (Parameter geometry).  #emph[In the level-two parameter law, for every $a in I$ and every proper set $J subset I$, 
#[#set math.equation(numbering: n => "(18)")
 $ "Law" \( \( q_j \)_(j in J) divides p_a \) = ⨂_(j in J) K_a \( p_a \[ j \] \, thin upright(d) q_j \) . $ <eq:parameter-geometry>]

 In particular, for each $i in I$, the diagonal row and column tuples $p_i \, q_i$ are conditionally independent, with the same law $K_i \( u \, dot.op \)$, given their common coordinate $u = u_(i \, i)$.]
] <lem:parameter-geometry>

#proof[
  It is enough to prove (18) for $J = I \\ { j_0 }$, and then take marginals. Write
  $ Z = Y_(a \, I) \, #h(2em) O = \( Y_(I \, j) \)_(j in J) \, #h(2em) S = \( y_(a \, j) \)_(j in J) . $
  Use the extension with no parents and projection slot $a$. Saturation for the data $cal(O)_(1 \, j_0)$ says, for every bounded row test $F$,
  #[#set math.equation(numbering: n => "(19)")
   $ bb(E) \[ F \( Z \) divides O \] = bb(E) \[ F \( Z \) divides S \] . $ <eq:unconditional-row-screening>]
  Since $S$ is a function of both $Z$ and $O$, this is conditional independence of $Z$ and $O$ given $S$. One direct verification is to multiply (19) by a bounded function of $O$ and condition on $S$; the resulting factorization is the conditional-independence identity. It also gives the reversed screening statement $"Law" \( O divides Z \) = "Law" \( O divides S \)$.
  Unconditionally the columns in $O$ are independent, each with law $m_1$. Conditioning on their separate shared states therefore gives
  $ "Law" \( O divides Z \) = ⨂_(j in J) m_1 \( thin upright(d) Y_(I \, j) divides y_(a \, j) \) . $
  We identify the parameter image of each factor. In a single column, the joint law of its parameter tuple $q$ and its state $y_a$ at slot $a$ is
  #[#set math.equation(numbering: n => "(20)")
   $ pi \( thin upright(d) q \) eta_(q \[ a \]) \( thin upright(d) y_a \) . $ <eq:shared-state-law>]
  Disintegrating $pi$ at $q \[ a \]$ rewrites this as
  $ nu \( thin upright(d) u \) K_a \( u \, thin upright(d) q \) eta_u \( thin upright(d) y_a \) . $
  Since $u \( y_a \) = u$ almost surely under $eta_u$, the conditional law of $q$ given the shared state $y_a$ is exactly $K_a \( u \( y_a \) \, thin upright(d) q \)$. Thus
  $ "Law" \( \( q_j \)_(j in J) divides Z \) = ⨂_(j in J) K_a \( u \( y_(a \, j) \) \, thin upright(d) q_j \) . $
  The right side is a function only of $p_a$, which itself is a function of $Z$. Conditioning down to $p_a$ proves (18).
  For the last assertion, take $a = i$ and retain just $j = i$. The tuple $p_i$ has marginal $pi$, and its coordinate at $i$ is $u_(i \, i)$. Given $p_i$, the law of $q_i$ is $K_i \( p_i \[ i \] \, dot.op \)$. Disintegrating once more over that coordinate shows that
  $ "Law" \( p_i \, q_i divides u_(i \, i) = u \) = K_i \( u \, thin upright(d) p_i \) K_i \( u \, thin upright(d) q_i \) \, $
  as required. ◻
]

We now have two complementary descriptions of the same square. Proposition 7 gives exact conditional kernels at a fixed full parameter array. Lemma 8 controls how those parameters vary. The first description yields the operator structure in the next section; the second will identify which parts of that structure persist across fibres.

== 4 The operator square <sec:operators>

We now fix the parameters of a square supplied by Proposition 7. The aim is to describe the functions at one cell that are visible both from the rest of its row and from the rest of its column. We shall prove that this common subspace is spanned by unimodular functions satisfying multiplicative relations in both directions. The proof first treats three groups of rows and three groups of columns; varying the groups will then recover the individual coordinates. Operator representations of joinings have a substantial precedent in Ryzhikov’s intertwining work #cite(label("Ryzhikov1994")) #cite(label("Ryzhikov1997")); the particular rectangle identities and exact-line conclusion below are proved from the conditional kernels of Section 3.

=== 4.1 Active spaces and exact relations <active-spaces-and-exact-relations>

#prodef([Definition 4.1.])[
  Let $lambda$ be a probability law on a finite product $S_1 times dots.h.c times S_m$ of standard spaces, with coordinate variables $Y_1 \, dots.h \, Y_m$ and marginals $mu_1 \, dots.h \, mu_m$. The #emph[active space] at coordinate $i$ is the closed subspace
  $ cal(A)_i \( lambda \) = overline("span") { bb(E)_lambda \[ F \( Y_j : j eq.not i \) divides Y_i \] : F upright(" bounded and measurable") #scale(x: 120%, y: 120%)[}] subset.eq L^2 \( mu_i \) . $
  An #emph[exact tuple] is a tuple of measurable functions $chi_i : S_i arrow.r bb(T)$ for which
  #[#set math.equation(numbering: n => "(21)")
   $ product_(i = 1)^m chi_i \( Y_i \) = c #h(2em) lambda upright("-almost surely") \, #h(2em) c in bb(T) . $ <eq:exact-tuple>]
  An #emph[exact line] at coordinate $i$ is a one-dimensional subspace $bb(C) chi_i$ occurring in an exact tuple. Representatives differing by a constant of modulus one define the same line.
] <def:active-space>

The active spaces contain constants and are invariant under complex conjugation. Their orthogonal projections therefore commute with conjugation. Every exact line lies in the active space: solve (21) for its representative and condition on the chosen coordinate.

#thm([Lemma 4.2.])[
  #emph[Suppose $m gt.eq 3$ and every $m - 1$ coordinates of $lambda$ are independent. Distinct exact lines at any coordinate are orthogonal. An exact line at one coordinate has a unique tuple of partner lines at the other coordinates. The exact tuples of lines form an abelian group under coordinatewise multiplication, and projection to any one coordinate is a group isomorphism onto its group of exact lines. Each of these groups is countable when the marginal $L^2$ spaces are separable. Every nonconstant exact line has zero mean.]
] <lem:exact-lines>

#proof[
  For an exact tuple put $a_i = \| integral chi_i thin upright(d) mu_i \|$. Solving the product relation for $chi_i$ and using independence of the remaining coordinates gives
  $ a_i = product_(j eq.not i) a_j \, #h(2em) 0 lt.eq a_i lt.eq 1 . $
  If some $a_i = 0$, at least one other $a_j$ is zero, and the same equations then force all $a_j$ to be zero. Otherwise put $b_i = - log a_i$. The equations give $2 b_i = sum_j b_j$ for every $i$; since $m gt.eq 3$, all $b_i$ vanish. Thus either all means have modulus one, in which case all the functions are constant almost surely, or all means are zero.
  The quotient of two exact tuples is again exact. If their lines differ at one coordinate, its quotient function is nonconstant, so all quotient means vanish. In particular the two representatives are orthogonal at that coordinate. If their lines agree at one coordinate, the quotient there is constant, forcing constant quotients everywhere. This proves uniqueness of partners. Products and conjugates preserve exact tuples; uniqueness makes multiplication of lines well defined and makes each coordinate projection bijective. A family of nonzero mutually orthogonal lines in a separable Hilbert space is countable. Comparing any exact tuple with the constant tuple gives the final assertion. ◻
]

For the rest of the section, fix a parameter square $E$ in the conull set of Proposition 7, and suppress $E$ from the notation. Partition the rows into three nonempty groups $P \, A \, B$, and the columns into three nonempty groups $r \, s \, t$. A grouped cell $Y_(i \, l)$ is the tuple of states in the corresponding rectangle. Write $mu_(i \, l)$ for its marginal and $H_(i \, l) = L^2 \( mu_(i \, l) \)$. The square locality statement supplies the following facts, for every ordering of the three row groups and of the three column groups:

+ Each grouped row and each grouped column has a three-coordinate law whose coordinates are pairwise independent.
+ Given the whole grouped row $P$, any two grouped columns are independent. The conditional law of each uses only its own entry in $P$.
+ Given the whole row $P$ and all columns except $t$, the conditional law of $Y_(A \, t)$ is its own row-law kernel given $Y_(A \, r) \, Y_(A \, s)$.

These statements concern permutations of groups within each axis; no interchangeability of the two axes is assumed. Let $V_(i \, l)$ and $W_(i \, l)$ be the active spaces for the grouped row and grouped column laws at $\( i \, l \)$, with projections $P_(i \, l)^V$ and $P_(i \, l)^W$, respectively.

=== 4.2 Conditional Markov operators <conditional-markov-operators>

Set

$ z = Y_(P \, r) \, #h(2em) c = Y_(P \, s) \, #h(2em) d = Y_(P \, t) \, #h(2em) x = Y_(A \, r) \, #h(2em) y = Y_(B \, r) . $

The triples $\( z \, c \, d \)$ and $\( z \, x \, y \)$ are pairwise independent. Moreover, $\( c \, d \)$ and $\( x \, y \)$ are conditionally independent given $z$: the law of column $r$ given the whole row $P$ depends only on $z$. It follows that each individual variable in either pair is independent of the whole opposite pair. For example, for bounded $f \, g$,

$ bb(E) \[ f \( x \) g \( c \, d \) \] = bb(E) #scale(x: 120%, y: 120%)[\[] bb(E) \[ f \( x \) divides z \] bb(E) \[ g \( c \, d \) divides z \] #scale(x: 120%, y: 120%)[\]] = bb(E) \[ f \( x \) \] bb(E) \[ g \( c \, d \) \] . $

In particular, each triple formed from one variable of a pair and the whole opposite pair has product law.

Define four conditional Markov operators, with the arrow indicating the direction in which functions are mapped:

#[#set math.equation(numbering: n => "(22)")
 $ L_A \( x \) & : H_(A \, t) arrow.r H_(A \, s) \, & L_B \( y \) & : H_(B \, t) arrow.r H_(B \, s) \,\
J_s \( c \) & : H_(B \, s) arrow.r H_(A \, s) \, & J_t \( d \) & : H_(B \, t) arrow.r H_(A \, t) . $ <eq:square-operators>]

For instance,

$ \( L_A \( x \) h \) \( Y_(A \, s) \) = bb(E) \[ h \( Y_(A \, t) \) divides Y_(A \, r) = x \, Y_(A \, s) \] $

in the grouped row law. Pairwise independence makes the source and target marginals independent of the conditioning value, so these are contractions between the fixed Hilbert spaces displayed above. Their adjoints are the reverse conditional Markov operators. Kernels make their matrix coefficients measurable; separability then gives strong measurability on each vector.

Figure 1 fixes the four cell Hilbert spaces and the five conditioned cells. The first identity in Lemma 11 compares the two paths from the lower-right vertex to the upper-left. The second compares the paths from the lower-left to the upper-right, using the reverse row operators.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 1), [$r$])
  content((4, 1), [$s$])
  content((8, 1), [$t$])
  content((-1.8, 0), [$P$], anchor: "east", padding: 0.1176cm)
  content((-1.8, -2), [$A$], anchor: "east", padding: 0.1176cm)
  content((-1.8, -4), [$B$], anchor: "east", padding: 0.1176cm)
  content((0, 0), [#box(width: 2.5cm, height: 1cm, inset: 0.1058cm, stroke: (paint: rgb("#8c8c8c"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"), fill: rgb("#ededed"), [#set text(hyphenate: false); #align(center + horizon)[$z=Y_(P,r)$]])])
  content((4, 0), [#box(width: 2.5cm, height: 1cm, inset: 0.1058cm, stroke: (paint: rgb("#8c8c8c"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"), fill: rgb("#ededed"), [#set text(hyphenate: false); #align(center + horizon)[$c=Y_(P,s)$]])])
  content((8, 0), [#box(width: 2.5cm, height: 1cm, inset: 0.1058cm, stroke: (paint: rgb("#8c8c8c"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"), fill: rgb("#ededed"), [#set text(hyphenate: false); #align(center + horizon)[$d=Y_(P,t)$]])])
  content((0, -2), [#box(width: 2.5cm, height: 1cm, inset: 0.1058cm, stroke: (paint: rgb("#8c8c8c"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"), fill: rgb("#ededed"), [#set text(hyphenate: false); #align(center + horizon)[$x=Y_(A,r)$]])])
  content((0, -4), [#box(width: 2.5cm, height: 1cm, inset: 0.1058cm, stroke: (paint: rgb("#8c8c8c"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"), fill: rgb("#ededed"), [#set text(hyphenate: false); #align(center + horizon)[$y=Y_(B,r)$]])])
  content((4, -2), [#box(width: 2.5cm, height: 1cm, inset: 0.1058cm, stroke: (paint: rgb("#000000"), thickness: 0.6pt, miter-limit: 10), fill: rgb("#ffffff"), [#set text(hyphenate: false); #align(center + horizon)[$H_(A,s)$]])])
  content((8, -2), [#box(width: 2.5cm, height: 1cm, inset: 0.1058cm, stroke: (paint: rgb("#000000"), thickness: 0.6pt, miter-limit: 10), fill: rgb("#ffffff"), [#set text(hyphenate: false); #align(center + horizon)[$H_(A,t)$]])])
  content((4, -4), [#box(width: 2.5cm, height: 1cm, inset: 0.1058cm, stroke: (paint: rgb("#000000"), thickness: 0.6pt, miter-limit: 10), fill: rgb("#ffffff"), [#set text(hyphenate: false); #align(center + horizon)[$H_(B,s)$]])])
  content((8, -4), [#box(width: 2.5cm, height: 1cm, inset: 0.1058cm, stroke: (paint: rgb("#000000"), thickness: 0.6pt, miter-limit: 10), fill: rgb("#ffffff"), [#set text(hyphenate: false); #align(center + horizon)[$H_(B,t)$]])])
  line((6.75, -2), (5.25, -2), stroke: (thickness: 0.7pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.22cm, fill: black)))
  content((6, -2), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$L_A(x)$]]])], anchor: "south")
  line((6.75, -4), (5.25, -4), stroke: (thickness: 0.7pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.22cm, fill: black)))
  content((6, -4), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$L_B(y)$]]])], anchor: "south")
  line((4, -3.5), (4, -2.5), stroke: (thickness: 0.7pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.22cm, fill: black)))
  content((4, -3), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$J_s(c)$]]])], anchor: "east")
  line((8, -3.5), (8, -2.5), stroke: (thickness: 0.7pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.22cm, fill: black)))
  content((8, -3), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$J_t(d)$]]])], anchor: "west")
})],
  caption: [Figure 1: The grouped operator square at a fixed parameter $E$. The five shaded cells record the conditioned values $z \, c \, d \, x \, y$. Each arrow acts on functions in its source Hilbert space by conditional expectation in the indicated row or column law. Reversing an arrow represents its adjoint. ],
) <fig:operator-square>

#thm([Lemma 4.3.])[
  (The rectangle identities).  #emph[For the grouped square just described, almost surely in $\( z \, c \, d \, x \, y \)$, 
#[#set math.equation(numbering: n => "(23)")
 $ L_A \( x \) J_t \( d \) = J_s \( c \) L_B \( y \) \, #h(2em) L_A \( x \)^(*) J_s \( c \) = J_t \( d \) L_B \( y \)^(*) . $ <eq:rectangle-identities>]

 The identities also hold in every ordering of the row and column groups.]
] <lem:rectangle>

#proof[
  Condition on $z \, c \, d \, x \, y$. The marginal law of the two remaining entries in column $s$ is the column law given $c$, and similarly column $t$ has its law given $d$. Indeed, given row $P$, each of these columns is independent of column $r$. Denote the corresponding two joint $L^2$ spaces by $cal(H)_s$ and $cal(H)_t$. Let $Q : cal(H)_t arrow.r cal(H)_s$ be the conditional Markov operator between them under this five-cell conditioning, and let $iota_(A \, s) \, iota_(B \, s) \, iota_(A \, t) \, iota_(B \, t)$ be the isometric embeddings of the individual cell spaces into the appropriate joint spaces.
  The own-row kernel assertion gives
  $ Q iota_(A \, t) = iota_(A \, s) L_A \, #h(2em) Q iota_(B \, t) = iota_(B \, s) L_B . $
  The same assertion with $s$ and $t$ reversed gives
  $ Q^(*) iota_(A \, s) = iota_(A \, t) L_A^(*) \, #h(2em) Q^(*) iota_(B \, s) = iota_(B \, t) L_B^(*) . $
  Also $J_s = iota_(A \, s)^(*) iota_(B \, s)$ and $J_t = iota_(A \, t)^(*) iota_(B \, t)$. Consequently
  $ L_A J_t = iota_(A \, s)^(*) Q iota_(B \, t) = J_s L_B \, #h(2em) L_A^(*) J_s = iota_(A \, t)^(*) Q^(*) iota_(B \, s) = J_t L_B^(*) . $
  Countable dense sets of tests make these operator equalities simultaneous on a conull set. The grouped locality assertions hold for all the indicated orderings, so the same proof applies to each of them. ◻
]

We next identify the subspaces on which the rectangle identities carry information. For a measurable operator family, its #emph[essential closed range span] means the smallest closed subspace containing its ranges for almost every parameter value.

#thm([Lemma 4.4.])[
  #emph[In every grouped cell, the projections $P^V$ and $P^W$ commute. Every row Markov operator intertwines the column-active projections at its source and target; every column Markov operator intertwines the row-active projections. Put 
$ D_(i \, l) = V_(i \, l) ∩ W_(i \, l) \, #h(2em) P_(i \, l)^D = P_(i \, l)^V P_(i \, l)^W . $

 Each $D_(i \, l)$ is invariant under conjugation, and $P_(i \, l)^D$ commutes with conjugation. All incident row and column operators intertwine the $P^D$ projections. For either choice of source in a row or column, the restrictions to $D$ have essential closed range span equal to the target $D$; the same holds for the reverse operators.]
] <lem:active-reduction>

#proof[
  First, the essential closed range span of $L_A \( x \)$ is $V_(A \, s)$. Conditional expectations of product tests onto $Y_(A \, s)$ have the form
  #[#set math.equation(numbering: n => "(24)")
   $ integral w \( x \) L_A \( x \) h thin upright(d) mu_(A \, r) \( x \) \, $ <eq:weighted-ranges>]
  where $w \, h$ are bounded. Such tests span the active space by density of product functions in the $L^2$ space of the other two coordinates. A vector orthogonal to every integral in (24) is orthogonal to $L_A \( x \) h$ almost everywhere, by varying $w$. A countable dense set of $h$ then makes it orthogonal to the whole range for almost every $x$. The converse is immediate. This proves the assertion, and the same argument applies to every incident operator in either direction. In particular each such operator has its range in its own-direction active space and annihilates the orthogonal complement of the source active space.
  By the first rectangle identity, $J_s \( c \) L_B \( y \)$ has range in $V_(A \, s)$. The pair $\( c \, y \)$ is independent. Fubini and the essential range span of $L_B$ therefore give $J_s \( c \) V_(B \, s) subset.eq V_(A \, s)$ for almost every $c$. The adjoint of the second identity is $J_s \( c \)^(*) L_A \( x \) = L_B \( y \) J_t \( d \)^(*)$. Independence of $\( c \, x \)$ gives the reverse inclusion for the adjoint. Together these say
  #[#set math.equation(numbering: n => "(25)")
   $ P_(A \, s)^V J_s \( c \) = J_s \( c \) P_(B \, s)^V . $ <eq:column-intertwining>]
  Likewise, the first rectangle identity and independence of $\( x \, d \)$ show that $L_A \( x \) W_(A \, t) subset.eq W_(A \, s)$; the second identity and independence of $\( x \, c \)$ give the adjoint assertion. Thus
  #[#set math.equation(numbering: n => "(26)")
   $ P_(A \, s)^W L_A \( x \) = L_A \( x \) P_(A \, t)^W . $ <eq:row-intertwining>]
  The same reasoning works at every edge.
  Equation (25) shows that $P_(A \, s)^V$ preserves the essential range span of $J_s$, which is $W_(A \, s)$. As an orthogonal projection it also preserves $W_(A \, s)^perp$, and therefore commutes with $P_(A \, s)^W$. This proves commutation in every cell. Combining (26) with the own-row active-space reduction gives $P_(A \, s)^D L_A = L_A P_(A \, t)^D$, and similarly for all other edges. Finally, projecting the essential range span $V_(A \, s)$ onto $D_(A \, s)$ shows that the restricted ranges of $L_A$ span $D_(A \, s)$: $P_(A \, s)^D "Ran" L_A = "Ran" \( L_A P_(A \, t)^D \)$. The corresponding argument handles each edge and its adjoint. ◻
]

We have obtained commuting projections and a rectangle of contractions between their intersections. The next two lemmas show that the parameter dependence of this rectangle is carried by an abelian group of unitaries. That description will produce exact functions at the corner cell.

=== 4.3 Fixed positive parts and an abelian unitary group <fixed-positive-parts-and-an-abelian-unitary-group>

Restrict the four operators in (22) to the $D$ spaces. Temporarily denote them, in the same order, by $F \( x \)$, $G \( y \)$, $K \( c \)$ and $N \( d \)$. Their equations are

#[#set math.equation(numbering: n => "(27)")
 $ F N = K G \, #h(2em) F^(*) K = N G^(*) . $ <eq:restricted-rectangle>]

All four families and their adjoints have the essential range spans proved in Lemma 12.

#thm([Lemma 4.5.])[
  (Fixed squares).  #emph[For the four restricted families in (27), each source square and target square is independent of its parameter almost surely, and each is injective on its $D$ space. The four polar parts are measurable families of unitaries between the $D$ spaces and satisfy the first rectangle identity.]
] <lem:fixed-squares>

#proof[
  The two rectangle equations and their adjoints imply
  #[#set math.equation(numbering: n => "(28)")
   $ K K^(*) F & = F N N^(*) \, & K^(*) K G & = G N^(*) N \,\
F^(*) F N & = N G^(*) G \, & F F^(*) K & = K G G^(*) . $ <eq:squares-first>]
  The parameter triples in these four equations are, respectively, $\( c \, x \, d \)$, $\( c \, y \, d \)$, $\( x \, d \, y \)$ and $\( x \, c \, y \)$. Each has product law by the independence observations preceding Lemma 11.
  For the first equation, compare two independent values $c \, c'$ using the same $x \, d$. Fubini gives
  $ #scale(x: 120%, y: 120%)[\(] K \( c \) K \( c \)^(*) - K \( c' \) K \( c' \)^(*) #scale(x: 120%, y: 120%)[\)] F \( x \) = 0 $
  for almost every $\( c \, c' \, x \)$. The essential range span of $F$ is its whole target $D$ space, so the two target squares agree. The adjoint equation and the essential range span of $F^(*)$ similarly make $N N^(*)$ fixed. The second equation in (28) makes $K^(*) K$ and $N^(*) N$ fixed. The two equations in (28), using the range spans of $N \, K$ and their adjoints, make $F^(*) F \, G^(*) G \, F F^(*) \, G G^(*)$ fixed. These comparisons are operator comparisons: countable dense vector tests first give a common conull set, after which boundedness gives equality on every vector.
  If $v$ is in the kernel of the fixed square $F^(*) F$, then $F \( x \) v = 0$ for almost every $x$. Hence $v$ is orthogonal to the ranges of almost every $F \( x \)^(*)$, whose essential span is the whole source $D$. Thus $v = 0$. The same reasoning proves injectivity of all source and target squares. Each operator consequently has zero kernel and dense range, so its polar part has full initial and final spaces and is unitary.
  To preserve the rectangle identity, put $A = \| F \|$ and $B = \| G \|$. From $F^(*) F N = N G^(*) G$ we obtain $A^2 N = N B^2$. Polynomial approximation to the square-root function on $\[ 0 \, 1 \]$ gives $A N = N B$. Write $F = U_F A$ and $G = U_G B$. The equation $F N = K G$ becomes
  $ \( U_F N - K U_G \) B = 0 . $
  The range of the injective self-adjoint $B$ is dense, so the bounded operator in parentheses vanishes. If $N = U_N \| N \|$ and $K = U_K \| K \|$, then
  $ U_F N = \( U_F U_N \) \| N \| \, #h(2em) K U_G = \( U_K U_G \) \( U_G^(*) \| K \| U_G \) $
  are polar decompositions of the same operator. Uniqueness yields $U_F U_N = U_K U_G$. This argument uses no inverse bound for the positive parts. Finally, polar parts are strongly measurable on vectors, for example by the bounded approximations $F \( F^(*) F + epsilon "id" \)^(- 1 \/ 2)$ as $epsilon arrow.b 0$. ◻
]

Denote these polar parts by $a \( x \) \, b \( y \) \, c_0 \( c \) \, d_0 \( d \)$, respectively. They satisfy

#[#set math.equation(numbering: n => "(29)")
 $ a \( x \) d_0 \( d \) = c_0 \( c \) b \( y \) . $ <eq:polar-rectangle>]

The subspaces are nonzero, since constants belong to every $D$ space.

#thm([Lemma 4.6.])[
  (Normalization of the polar rectangle).  #emph[There are fixed unitary identifications of the four $D$ spaces with one separable Hilbert space $cal(H)$ such that the four polar variables in (29) take values in one closed abelian subgroup $cal(G)$ of the unitary group of $cal(H)$. Their common support is $cal(G)$. The variables $a \, b$ have a common law $rho$, invariant under left multiplication by every element of $cal(G)$, and there is a measurable $cal(G)$-valued function $h \( z \)$ such that 
#[#set math.equation(numbering: n => "(30)")
 $ a \( x \) b \( y \)^(- 1) = c_0 \( c \) d_0 \( d \)^(- 1) = h \( z \) . $ <eq:corner-ratio>]

 The group $cal(G)$ has a simultaneous orthonormal eigenbasis. Monomials in its diagonal circle coordinates, evaluated at $h \( z \)$, span $L^2 \( sigma \( h \( z \) \) \)$ and are exact functions for both the row and column three-cell laws at $\( P \, r \)$.]
] <lem:polar-group>

#proof[
  Give the unitary spaces the strong operator topology. On unitaries, inversion and multiplication are continuous, and these spaces are separable metrizable. Conditional on a typical fixed value $z_0$, the pair $\( a \, b \)$ and the pair $\( c_0 \, d_0 \)$ are independent, while each individual marginal equals its unconditional marginal. The continuous identity (29) therefore holds throughout the product of the two conditional pair supports. Choose one point $\( a_(*) \, b_(*) \)$ from the first support and one point $\( c_(*) \, d_(*) \)$ from the second. They satisfy $a_(*) d_(*) = c_(*) b_(*)$. Identify the four vertex spaces by these reference unitaries, starting at the lower right vertex. The two possible identifications of the upper left vertex agree by this equation, so all four reference edge values become identity. Use these fixed identifications from now on.
  The conditional pair supports at $z_0$ now contain $\( "id" \, "id" \)$. Fixing the column pair at this point in (29) forces $a = b$ throughout the other pair support. Fixing the row pair similarly forces $c_0 = d_0$. The two row marginals therefore have a common law $rho$ and the two column marginals a common law $tau$; these are also their unconditional laws. The supports of $rho$ and $tau$ both contain identity. Substitution of diagonal pair values into (29) shows that these two supports commute elementwise.
  For general $z$, conditional independence of the two pairs and their fixed individual marginals imply
  #[#set math.equation(numbering: n => "(31)")
   $ rho = u rho v^(- 1) quad upright("for almost every actual pair ") \( u \, v \) = \( c_0 \, d_0 \) . $ <eq:translated-laws>]
  Indeed, after fixing $z \, c_0 \, d_0$, the equation says $a = c_0 b d_0^(- 1)$, and $a \, b$ each have law $rho$. Unconditionally, $c_0 \, d_0$ are independent, so their pair law is $tau ⊗ tau$. The map $\( u \, v \) mapsto u rho v^(- 1)$ is continuous for weak convergence of probability measures: apply strong-topology continuity and dominated convergence to each bounded continuous test. Thus (31) holds for every $u \, v in "supp" tau$. The symmetric argument gives $tau = u tau v^(- 1)$ for every $u \, v in "supp" rho$.
  Taking $v = "id"$ shows that each support is preserved by left translation by elements of the other. Because identity belongs to both, they contain one another. Write their common closed support as $cal(G)$. For $g in cal(G)$ we have $g cal(G) = cal(G)$. This proves closure under products, and $"id" in g cal(G)$ supplies $g^(- 1) in cal(G)$. Thus $cal(G)$ is a group. It is abelian by the earlier commutation, and (31) gives left invariance of $rho$. Equation (29) now gives equality of the two ratios in (30). Given $z$, the ratios are independent and equal almost surely, hence have a common point-mass conditional law. A countable determining family in the standard unitary group makes its point measurable in $z$, giving $h$.
  Choose a positive injective trace-class operator $Q$ on $cal(H)$ and form the trace-norm integral
  $ Q_0 = integral_(cal(G)) U Q U^(*) thin upright(d) rho \( U \) . $
  The integrand is trace-norm continuous under strong-unitary convergence, as follows first for finite-rank $Q$ and then by trace-norm approximation. The integral is positive and trace-class, and left invariance of $rho$ makes it commute with every element of $cal(G)$. For $v eq.not 0$ each quadratic form $chevron.l v \, U Q U^(*) v chevron.r$ is positive; hence so is $chevron.l v \, Q_0 v chevron.r$. Thus $Q_0$ is injective. Its finite-dimensional positive eigenspaces span $cal(H)$. Each is invariant under the commuting unitaries, so simultaneous diagonalization in each gives a full orthonormal eigenbasis $\( e_n \)$.
  Write $U e_n = gamma_n \( U \) e_n$, with $gamma_n \( U \) in bb(T)$. These coordinates are continuous characters. On diagonal unitaries, coordinatewise convergence is equivalent to strong convergence, by approximation of any vector by its finite basis truncations. The coordinates therefore generate the Borel information of $cal(G)$. Trigonometric polynomials on every finite coordinate torus are dense in $L^2$ of its actual probability law. Increasing conditional expectations onto the finite-coordinate fields then show that the functions
  $ gamma \( h \( z \) \) \, #h(2em) gamma = product_(n in J) gamma_n^(m_n) \, quad J upright(" finite") \, quad m_n in bb(Z) \, $
  span $L^2 \( sigma \( h \( z \) \) \)$. No identification of the law of $h$ as Haar measure is needed for this density statement. Finally, (30) gives
  $ gamma \( h \( z \) \) = gamma \( a \( x \) \) overline(gamma \( b \( y \) \)) = gamma \( c_0 \( c \) \) overline(gamma \( d_0 \( d \) \)) . $
  Each factor is unimodular. Multiplying by the conjugate factors shows that $gamma \( h \( z \) \)$ is exact both in column $r$ and in row $P$. ◻
]

=== 4.4 Completeness of the exact functions <completeness-of-the-exact-functions>

Lemma 14 gives exact functions at the corner. To show that they span the entire common active subspace, we must also prove that no other dependence remains in $D_(P \, r)$. The following projection identity supplies this reverse inclusion.

#thm([Lemma 4.7.])[
  (Projection of tensor contractions).  #emph[In any three-cell row of the grouped square, abbreviate the cell spaces by $H_r \, H_s \, H_t$ and their common-active projections by $P_r \, P_s \, P_t$. For $g in H_s$, $h in H_t$, set 
$ C_r \( g \, h \) = bb(E) \[ g \( Y_s \) h \( Y_t \) divides Y_r \] . $

 Then 
#[#set math.equation(numbering: n => "(32)")
 $ P_r C_r \( g \, h \) = C_r \( g \, P_t h \) = C_r \( P_s g \, h \) = C_r \( P_s g \, P_t h \) . $ <eq:contraction-projections>]

 The contractions with both inputs in their $D$ spaces lie in $D_r$ and span it. The same assertions hold for each grouped column. Moreover, with $h \( z \)$ from Lemma 14, 
#[#set math.equation(numbering: n => "(33)")
 $ D_(P \, r) = L^2 \( sigma \( h \( z \) \) \) . $ <eq:corner-completeness>]

 Consequently the intersection at every grouped cell is spanned by lines exact simultaneously for its three-cell row and column laws.]
] <lem:contraction-completeness>

#proof[
  Since $\( Y_s \, Y_t \)$ has product marginal, the bilinear contraction is well defined on $H_s times H_t$ and satisfies
  #[#set math.equation(numbering: n => "(34)")
   $ lr(bar.v.double C_r \( g \, h \) bar.v.double)_2 lt.eq lr(bar.v.double g bar.v.double)_2 lr(bar.v.double h bar.v.double)_2 . $ <eq:contraction-bound>]
  For bounded inputs let $L_(r arrow.l t) \( v \)$ be the row Markov operator from $t$ to $r$ given $Y_s = v$. Pairwise independence gives the vector-valued integral formula
  $ C_r \( g \, h \) = integral g \( v \) L_(r arrow.l t) \( v \) h thin upright(d) mu_s \( v \) . $
  Lemma 12 says $P_r L_(r arrow.l t) \( v \) = L_(r arrow.l t) \( v \) P_t$. Moving the projection through the integral proves $P_r C_r \( g \, h \) = C_r \( g \, P_t h \)$. Using instead the edge from $s$ to $r$ conditioned on $Y_t$ proves $P_r C_r \( g \, h \) = C_r \( P_s g \, h \)$. The bound (34) extends both identities to all $L^2$ inputs, including unbounded projected tests. Idempotence then gives
  $ P_r C_r \( g \, h \) = P_r C_r \( g \, P_t h \) = C_r \( P_s g \, P_t h \) \, $
  proving (32). Restricted contractions are fixed by $P_r$ and hence lie in $D_r$. Unrestricted product contractions span the row-active space; projecting that space onto $D_r$ proves the restricted spanning assertion. The column proof is identical.
  Apply this result first in row $A$. For $g in D_(A \, s)$ and $h in D_(A \, t)$, its contraction onto $x = Y_(A \, r)$ is
  $ C_(A \, r) \( g \, h \) \( x \) = chevron.l overline(g) \, L_A \( x \) h chevron.r . $
  Conjugation preserves $D_(A \, s)$. On the restricted spaces, $L_A \( x \) = a \( x \) A_0$ for a fixed positive operator $A_0$ by Lemma 13. Thus every displayed coefficient is a function of $a \( x \)$ alone. The space $L^2 \( sigma \( a \( x \) \) \)$ is closed, being the range of a conditional-expectation projection, so the spanning assertion gives
  $ D_(A \, r) subset.eq L^2 \( sigma \( a \( x \) \) \) \, #h(2em) D_(B \, r) subset.eq L^2 \( sigma \( b \( y \) \) \) . $
  Apply the column version of the spanning assertion in column $r$. Given $z$, we have $a = h \( z \) b$ and $b$ has its fixed marginal law $rho$. For bounded measurable $f \, g$ the contraction of $f \( a \)$ and $g \( b \)$ onto $z$ is therefore
  $ integral_(cal(G)) f \( h \( z \) u \) g \( u \) thin upright(d) rho \( u \) \, $
  a function of $h \( z \)$. The product marginal of $\( x \, y \)$, the bound (34), and bounded approximation extend this conclusion to the two $D$ spaces and their contraction span. Closure therefore yields $D_(P \, r) subset.eq L^2 \( sigma \( h \( z \) \) \)$. In the other direction, the monomials of Lemma 14 are exact for both laws, hence lie in $D_(P \, r)$, and they span $L^2 \( sigma \( h \( z \) \) \)$. This proves (33). We have used no assumption that $D$ was already closed under multiplication. Permuting row groups and column groups places any grouped cell at the corner and proves the last assertion. ◻
]

=== 4.5 From grouped cells to individual coordinates <from-grouped-cells-to-individual-coordinates>

Return to the individual square, with row tuples $p_a$, column tuples $q_j$, and marginal $eta_(p_a \[ j \])$ at cell $\( a \, j \)$. Let $V_(a \, j)$ be the active space there for the full row law $lambda_(p_a)$ and $W_(a \, j)$ the active space for the full column law $lambda_(q_j)$.

#thm([Proposition 4.8.])[
  (Common exact lines).  #emph[For almost every parameter square $E$, the following assertions hold simultaneously at all individual cells.]
  + #emph[The orthogonal projections onto $V_(a \, j)$ and $W_(a \, j)$ commute. Their common range $V_(a \, j) ∩ W_(a \, j)$ is spanned by the lines exact for both the full $k$-coordinate row law $lambda_(p_a)$ and the full $k$-coordinate column law $lambda_(q_j)$.]
  + #emph[For distinct columns $s \, t$, let $L_(s arrow.l t)^a \( v \)$ be the row Markov operator from cell $\( a \, t \)$ to $\( a \, s \)$, conditioned on the remaining $k - 2$ row entries $v$. Then, for almost every $v$, 
$ P_(a \, s)^W L_(s arrow.l t)^a \( v \) = L_(s arrow.l t)^a \( v \) P_(a \, t)^W . $

 Column operators likewise intertwine the corresponding row-active projections.]
  + #emph[If $\( chi_j \)_(j in I)$ is an exact tuple for row $a$, with $product_j chi_j \( Y_(a \, j) \) = c$, then 
#[#set math.equation(numbering: n => "(35)")
 $ L_(s arrow.l t)^a \( v \) chi_t = c #h(-0.16667em) product_(j eq.not s \, t) overline(chi_j \( v_j \)) thin overline(chi_s) . $ <eq:exact-partner-transport>]

 In particular, membership of one partner line in the column-active space is equivalent to membership of any other partner line in its column-active space. The analogous assertion holds with rows and columns exchanged.]
] <prop:common-exact-lines>

#proof[
  Isolate row $a$ and column $j$ as singleton groups, and split each of their complements into two nonempty groups. At the isolated cell, the row-active and column-active spaces do not depend on the chosen splits: the other two grouped cells still contain exactly all the other entries of that row or column. Lemma 12 gives commutation, and Lemma 15 gives a spanning family of simultaneous exact lines for the two split three-cell laws. We take this family to contain all such lines: each is in the intersection, and orthogonality leaves no additional line outside the spanning family.
  Fix the row-group partition and vary the column-group partition. Every resulting family is a subset of the mutually orthogonal exact lines of the same fixed split column law, by Lemma 10. All have the same closed span $V_(a \, j) ∩ W_(a \, j)$. Two subsets of one orthogonal family with the same closed span must coincide: a line belonging only to one would be orthogonal to the other span. Now fix the initial column grouping and vary the row grouping. The same argument, using the fixed split row law, shows that the initial family is exact for every split in both directions.
  For $k = 3$ the grouped laws already have individual coordinates. For $k > 3$, fix a unimodular representative $chi_j$ of one of the lines and consider its row completions. For each split $S$ of $I \\ { j }$, there are unimodular functions $a_S \, b_S$ and $c_S in bb(T)$ with
  $ chi_j \( Y_(a \, j) \) a_S \( Y_(a \, S) \) b_S \( Y_(a \, I \\ \( S union { j } \)) \) = c_S . $
  Absorb $c_S^(- 1)$ into $a_S$. All the resulting completion functions then equal $overline(chi_j \( Y_(a \, j) \))$ under the row law, so they define the same function $phi.alt$ of the other coordinates. Those $k - 1$ coordinates have product marginal. For each singleton split, $phi.alt$ lies in a one-dimensional line in that coordinate tensored with the remaining $L^2$ spaces. The orthogonal projections to these individual line factors commute and all fix $phi.alt$. Their product has the full one-dimensional tensor product as range, so $phi.alt$ is a pure product of its unimodular individual factors, up to one scalar. This proves exactness for the full row law. The column argument is the same. Conversely, every line exact for both full laws is active for both and belongs to their intersection. This proves part (1).
  For part (2), make the chosen row a singleton group, the chosen columns $s \, t$ singleton groups, and put all remaining columns in the third group. Split the remaining rows into two nonempty groups. The intertwining in Lemma 12 is exactly the stated identity for this grouping. To obtain the column assertion, isolate the two chosen rows instead and apply the already proved column intertwining; there is again no interchange of axes.
  Finally, solving the exact product relation for $chi_t$ and conditioning gives (35). Its scalar has modulus one. The projections $P^W$ commute with conjugation. Thus the intertwining in part (2) carries membership of $bb(C) chi_t$ in $W_(a \, t)$ to membership of $bb(C) chi_s$ in $W_(a \, s)$. The reverse row Markov operator gives the converse. The same proof applies to column partners. ◻
]

All constructions in this section were performed at a fixed typical parameter square. Kernel and operator identities can be imposed using countable determining tests, and there are only finitely many groupings and orientations. The resulting conull set of parameter squares can therefore be chosen measurable before any selection of exact lines. The unitary reference choices and diagonal bases were needed only for the pointwise proof: the conclusions of Proposition 16 concern the original conditional laws and do not require those choices to vary measurably with $E$. In the next section these intrinsic conclusions, together with the parameter geometry, will identify the exact lines on individual fibres.

== 5 Measurable labels and finite blocks <sec:labels>

We retain the saturated array object of Section 3. Its local conditional laws are $eta_u$, its parameter-tuple law is $pi$, and its conditional state-tuple laws are $lambda_p$. Proposition 16 describes intersections of active spaces in a square. We must turn that intersection statement into a description on each individual fibre. First we show that an entire active space is spanned by exact lines. We then enumerate those lines measurably over tuple parameters and prove that the family depends only on the local parameter. Finally, we partition the lines into finite sets on which time has a fixed permutation rule. One such moving set will retain a nonzero coefficient of the original mixing witness, providing the input for the cancellation argument in Section 6.

Write $H_u = L^2 \( eta_u \)$. For a tuple $p = \( p_1 \, dots.h \, p_k \)$ and a slot $i in I$, let $Pi_i \( p \)$ be the active projection in $H_(p_i)$ for $lambda_p$, and let $C_i \( p \)$ be the closed span of its exact lines. At this point $C_i \( p \)$ is defined separately for each tuple; no measurability of its line family is assumed. We use $p_a \[ j \]$ for the entry of row tuple $p_a$ in column $j$, so that the row index on $p_a$ is distinguished from a coordinate of a single tuple. Let $theta.alt$ denote the law of the complete parameter square $E = \( u_(a \, j) \)_(a \, j in I)$.

=== 5.1 From intersections to entire active spaces <from-intersections-to-entire-active-spaces>

The fields $H_u$ can be coordinated measurably using a countable algebra of bounded simple functions on the standard state space and Gram–Schmidt orthogonalization. Zero vectors are omitted, or retained as zero padding in a fixed coordinate space $ell^2$. These local coordinates depend on $u$ alone. In particular, two tuple parameters with the same entry $u$ refer to the same coordinated Hilbert space. Conditional-expectation contractions of countably many product tests give a measurable spanning family for each active space. Increasing finite-dimensional projections onto these spans show that $p mapsto Pi_i \( p \)$ is a measurable operator field.

#thm([Lemma 5.1.])[
  (Active-space exactness).  #emph[For $pi$-almost every $p$ and every $i in I$, 
#[#set math.equation(numbering: n => "(36)")
 $ "Ran" Pi_i \( p \) = C_i \( p \) . $ <eq:active-exact>]

]
] <lem:active-exact>

#proof[
  Fix $i$. By Lemma 8, the row and column tuples meeting at cell $\( i \, i \)$ are conditionally independent with law
  $ pi_i^u := pi \( thin upright(d) p divides p_i = u \) $
  given their common entry $u$. Proposition 16 therefore gives, for almost every such pair $\( p \, q \)$,
  #[#set math.equation(numbering: n => "(37)")
   $ Pi_i \( p \) Pi_i \( q \) = Pi_i \( q \) Pi_i \( p \) \, #h(2em) "Ran" Pi_i \( p \) ∩ "Ran" Pi_i \( q \) subset.eq C_i \( p \) . $ <eq:random-projection-intersection>]
  Here the almost-everywhere assertion does not presuppose a measurable description of $C_i$. Indeed, choose a measurable conull set of parameter squares on which the conditional kernel hypotheses of Proposition 16 hold on countable determining classes. That Proposition gives its pointwise conclusion on every square in this set. Disintegrate this set over the two tuples meeting at $\( i \, i \)$. On a measurable conull set of pairs the conditional measure assigns probability one to admissible squares, and is concentrated on the prescribed pair. Each such pair has an admissible completion. The conclusions in (37) depend only on the two tuple laws, so they hold for that pair. No measurable choice of a completion or of an exact line is required. Disintegration over $u$ then gives conull sections for the product law $pi_i^u ⊗ pi_i^u$.
  For a typical $u$ define the positive contraction on $H_u$
  #[#set math.equation(numbering: n => "(38)")
   $ B_(i \, u) = integral Pi_i \( q \) thin pi_i^u \( thin upright(d) q \) \, #h(2em) Q_(i \, u) = upright("the projection onto ") "Ker" B_(i \, u) . $ <eq:mean-active-projection>]
  The weak operator integral is well defined, and its matrix entries are measurable in $u$. Since $0 lt.eq B_(i \, u) lt.eq "id"$, $Q_(i \, u)$ is the strong limit of $\( "id" - B_(i \, u) \)^n$ and is measurable too. In the fixed ambient $ell^2$ coordinates, use the projection of each standard basis vector $e_j$ into $H_u$ and extend the operators by zero on $H_u^perp$. Then
  $ integral lr(bar.v.double Pi_i \( p \) Q_(i \, u) e_j bar.v.double)^2 thin pi_i^u \( thin upright(d) p \) = chevron.l Q_(i \, u) e_j \, B_(i \, u) Q_(i \, u) e_j chevron.r = 0 . $
  After a countable intersection, $Pi_i \( p \) Q_(i \, u) = 0$ for almost every $p$. Taking adjoints gives
  #[#set math.equation(numbering: n => "(39)")
   $ "Ran" Pi_i \( p \) subset.eq \( "Ker" B_(i \, u) \)^perp . $ <eq:active-support>]
  This range containment is an operator assertion on a measurable conull set: it is tested by $Q_(i \, u) Pi_i \( p \) e_j = 0$ for all $j$.
  Fix $p$ satisfying (39) and having a conull $q$-section in (37). If $v in "Ran" Pi_i \( p \)$ is orthogonal to $C_i \( p \)$, commutation implies that $Pi_i \( q \) v$ belongs to the intersection in (37). Consequently
  $ lr(bar.v.double Pi_i \( q \) v bar.v.double)^2 = chevron.l v \, Pi_i \( q \) v chevron.r = 0 quad upright("for ") pi_i^u upright("-almost every ") q . $
  Thus $chevron.l v \, B_(i \, u) v chevron.r = 0$, and $v in "Ker" B_(i \, u)$. Equation (39) forces $v = 0$. The conull $q$-section used here gives whole-subspace statements, so it works for every such $v$; a measurable selection of $v$ is unnecessary. Every exact line is active, by its defining product relation. This proves (36). There are finitely many slots $i$. ◻
]

=== 5.2 A measurable group of lines over each local parameter <a-measurable-group-of-lines-over-each-local-parameter>

A measurable countable family over $U$ will mean a standard measurable space over $U$ whose fibres admit countably many measurable partial sections enumerating them without repetition. In this description, measurability of a fibrewise operation means measurability of its indices in these enumerations. A line is represented by a unit vector; for the exact lines below such a vector has modulus one almost surely. Different scalar phases represent the same line.

#thm([Proposition 5.2.])[
  (Measurable local labels).  #emph[There is a measurable countable family of abelian groups $u mapsto cal(L) \( u \)$, defined on a $nu$-conull set, with the following properties.]
  + #emph[Each $ell in cal(L) \( u \)$ labels a line in $H_u$ with a measurable modulus-one representative $chi_(u \, ell)$. The identity label $0$ has representative $1$. Distinct labels are orthogonal, every nonidentity representative has mean zero, and 
$ chi_(u \, ell) chi_(u \, ell') in bb(T) chi_(u \, ell + ell') . $

]
  + #emph[For $pi$-almost every $p$, the exact lines at slot $i$ of $lambda_p$ are precisely $cal(L) \( p_i \)$, for every $i$, and they span its active space. Unique exact matching gives measurable group isomorphisms 
$ Phi_(s t) \( p \) : cal(L) \( p_s \) arrow.r cal(L) \( p_t \) #h(2em) \( s \, t in I \) \, $

 where $Phi_(s s) \( p \) = "id"$.]
  + #emph[Local time gives measurable group isomorphisms 
$ tau_u : cal(L) \( u \) arrow.r cal(L) \( T_U u \) \, #h(2em) \[ chi \] mapsto \[ chi compose T_Y^(- 1) \] . $

 They respect exact matching. All local time assertions may be imposed on an invariant conull set.]
  + #emph[For $theta.alt$-almost every parameter square, prescribing a label at any one cell gives a unique array of labels matched along every row and every column.]
] <prop:measurable-labels>

#proof[
  We first enumerate the exact lines over tuple parameters, then show that these enumerations describe a family depending only on a local entry. The distinction is necessary: Lemma 17 alone gives no such independence from the other parameters.
  ===== 5.2.1 Enumerating the tuple-dependent lines. <enumerating-the-tuple-dependent-lines.>
  Fix $i$ and another slot $j eq.not i$. Let
  $ Delta_i \( p \) : H_(p_i) arrow.r ⨂_(t eq.not i) H_(p_t) $
  be conditional expectation onto all the other coordinates under $lambda_p$. Their joint marginal is product, so the displayed target is their $L^2$ space. This is a measurable contraction field. It is the adjoint of conditional expectation in the other direction, and hence vanishes on the inactive complement. For a unit representative of an exact line, $Delta_i \( p \)$ gives, up to a scalar phase, the unit tensor of the conjugated matched representatives in the other slots.
  Choose dense unit-ball test sections $g_n \( u \)$ in each $H_u$. If $theta_g h = g chevron.l g \, h chevron.r$, set
  #[#set math.equation(numbering: n => "(40)")
   $ A_n \( p \) = Delta_i \( p \)^(*) #scale(x: 120%, y: 120%)[\(] theta_(g_n \( p_j \)) ⊗ "id"_(t eq.not i \, j) #scale(x: 120%, y: 120%)[\)] Delta_i \( p \) . $ <eq:line-detection-operators>]
  All their matrix entries are measurable before any exact-line enumeration. Pointwise, Lemma 17 and Lemma 10 give an orthogonal exact-line basis of the active space. Write $w_(j \, ell)$ for the unit partner appearing at $j$ in $Delta_i \( p \) chi_ell$. The operators in (40) are diagonal on this basis, with eigenvalues
  $ a_n \( ell \) = \| chevron.l g_n \( p_j \) \, w_(j \, ell) chevron.r \|^2 . $
  Indeed, for two distinct labels the partners are orthogonal in every other slot. Since $k gt.eq 3$, at least one slot outside $i \, j$ is untouched by the insertion, and its inner product kills the off-diagonal entry. The partners at $j$ are orthonormal, so Bessel’s inequality gives
  #[#set math.equation(numbering: n => "(41)")
   $ "tr" A_n \( p \) = sum_ell a_n \( ell \) lt.eq 1 . $ <eq:line-operator-trace>]
  Dense tests detect each line and distinguish any two different lines: the corresponding rank-one projections at $j$ are different.
  Here is a measurable spectral construction which does not assume that the basis just used pointwise is already enumerated measurably. Choose independent continuously distributed weights $w_n in \( 0 \, 2^(- n) \)$ and form
  $ A \( p \, w \) = sum_(n gt.eq 1) w_n A_n \( p \) . $
  The series converges in operator norm and is jointly measurable. It is positive and has trace at most $sum_n w_n$ on the conull set where the preceding arguments apply. Trace finiteness is itself measurable, being the finiteness of the sum of nonnegative diagonal entries in the fixed coordinate space. Set the operator to zero on its null exceptional set, so that the ensuing recursion always acts on a positive compact operator.
  For such an operator $A$, its norm is measurable from a countable dense set of unit vectors. If $a = lr(bar.v.double  bar.v.double) A > 0$, the strong limit
  $ Q = lim_(m arrow.r oo) \( A \/ a \)^m $
  is its top-eigenvalue projection. Its matrix entries and rank are measurable. Remove $a Q$ and repeat, taking zero projections if the remainder is zero. Compactness ensures that this lists every distinct positive eigenvalue and its finite-dimensional eigenspace. Thus a repeated positive eigenvalue is detected by the measurable event that some nonzero projection in the recursion has rank at least two.
  For a fixed $p$, two distinct exact lines have different coefficient sequences $\( a_n \( ell \) \)_n$. Conditioning on all but a weight where they differ shows that their weighted eigenvalues coincide with probability zero. There are only countably many lines in the separable Hilbert space. Fubini applied to the measurable collision event therefore chooses one deterministic sequence of weights for which the positive spectrum is simple for almost every $p$. Every active line has a strictly positive eigenvalue, because some test detects it and all weights are positive. The zero eigenspace is precisely the inactive complement; eigenvalues tending to zero add no kernel vectors. The positive spectral projections therefore enumerate exactly the exact lines. Zero padding of the Hilbert coordinates supplies no positive eigenvectors and hence no extra lines.
  Choose a unit vector in each one-dimensional projection by projecting the first coordinate vector with nonzero image and normalizing. These measurable Hilbert sections have jointly measurable function representatives. One direct verification is to approximate a section in each fibre within $2^(- m)$ by the first suitable member of a countable family of rational combinations of simple sections. The choices are measurable. The successive differences are summable in the integrated $L^2$ norm, and hence in $L^1$, giving a measurable almost-everywhere limit that represents the section. Each unit vector on an exact line has modulus one, so its representative does also. For a listed tuple of such representatives, their product $Z$ is constant under $lambda_p$ exactly when
  #[#set math.equation(numbering: n => "(42)")
   $ \| integral Z thin upright(d) lambda_p \| = 1 . $ <eq:exact-tuple-test>]
  This measurable scalar test enumerates the unique matched tuples and is unchanged by all choices of scalar phases.
  ===== 5.2.2 Forcing all column memberships. <forcing-all-column-memberships.>
  Return to a typical parameter square. Fix a matched tuple along row $a$, with unit representatives $v_j$ in its cells. At cell $\( a \, j \)$ let $Q_j$ denote the column-active projection $Pi_a \( q_j \)$. Proposition 16 and orthogonality of distinct row exact lines show that
  #[#set math.equation(numbering: n => "(43)")
   $ Q_j v_j = epsilon_j v_j \, #h(2em) epsilon_j in { 0 \, 1 } . $ <eq:membership-indicator>]
  Here $epsilon_j = 1$ precisely when this row line is also an exact line of the column law. The row Markov operator between two cells, given the remaining cells, intertwines their column-active projections. The exact relation maps one chosen representative to the conjugate partner times a modulus-one scalar depending on the remaining cells. Since the projections commute with conjugation, this intertwining and (43) imply $epsilon_j = epsilon_t$ for every $j \, t$.
  Choose the row tuple measurably from the enumeration just obtained. Given $p_a$, each $epsilon_j$ depends only on $q_j$ and this fixed tuple. Lemma 8 makes these indicators pairwise conditionally independent. Their common conditional probability $r \( p_a \)$ therefore satisfies $r \( p_a \) = r \( p_a \)^2$: indeed, writing $r_j \( p_a \) = bb(E) \[ epsilon_j divides p_a \]$, the almost-sure equality of the indicators makes all $r_j$ equal, while conditional independence gives $r_j = r_j r_t$ for $j eq.not t$. At the matched column $j = a$, however,
  $ r \( p_a \) = integral lr(bar.v.double Pi_a \( q \) v_a bar.v.double)^2 thin pi \( thin upright(d) q divides q_a = p_a \[ a \] \) = chevron.l v_a \, B_(a \, p_a \[ a \]) v_a chevron.r > 0 . $
  The strict inequality follows from (39), since $v_a$ is a nonzero active vector. Thus $r \( p_a \) = 1$. Countably many row labels and finitely many cells make the resulting inclusions simultaneous: every row exact line is a column exact line at its cell, almost surely in the parameter square.
  ===== 5.2.3 Descent to the local parameter. <descent-to-the-local-parameter.>
  At $\( i \, i \)$ two conditionally iid families of exact lines over the shared parameter $u$ satisfy inclusion almost surely. Swapping the two copies gives reverse inclusion, so the families agree. To descend this agreement measurably, for each local dense test $g_n \( u \)$ encode a family $cal(S)$ of orthogonal unit lines by
  #[#set math.equation(numbering: n => "(44)")
   $ K_n \( cal(S) \) = sum_(v in cal(S)) \| chevron.l g_n \( u \) \, v chevron.r \|^2 theta_v . $ <eq:line-family-encoding>]
  The sum is independent of phases and order, has trace at most one, and is measurable for our tuple-dependent enumeration. For every matrix entry, the two conditional iid encodings are equal almost surely. Their conditional squared difference is twice the conditional variance, so that variance is zero. Each entry equals its conditional expectation given $u$. The encodings consequently give measurable operator fields depending only on $u$. The family of encodings detects and distinguishes its orthogonal lines, so the same positive-weight spectral construction recovers a measurable family $cal(L)_i \( u \)$ agreeing with the slot-$i$ exact lines for almost every tuple with that entry.
  At a nonmatched cell $\( a \, j \)$ the already proved inclusion now reads $cal(L)_j \( u_(a \, j) \) subset.eq cal(L)_a \( u_(a \, j) \)$. The marginal of $u_(a \, j)$ is $nu$. Applying this to every ordered pair $a \, j$ yields one common family $cal(L) \( u \)$ almost everywhere. We have now removed the dependence on the other entries of a tuple: the remaining construction can be made on the local parameter space.
  By Lemma 10, multiplication of representatives modulo scalars makes each family an abelian group. Orthogonality and the zero-mean assertion for nonidentity labels follow from the same Lemma. Equality of unit lines is tested by $\| chevron.l \, chevron.r v w \| = 1$. Testing the product of two representatives against the countable list therefore makes multiplication measurable; conjugation gives the inverse. The constant line is measurably identifiable and we choose its representative to be $1$. Equation (42) and uniqueness give the measurable group isomorphisms $Phi_(s t) \( p \)$.
  The equivariant versions of $eta_u$ and $lambda_p$ show that composition with $T_Y^(- 1)$ carries exact tuples to exact tuples. It consequently induces $tau_u$ and respects all matchings. Equality tests against the measurable line lists show that this map and its inverse are measurable. Intersecting local conull sets over all integer translates makes the local assertions time invariant. Tuple and square assertions are imposed separately on their own conull sets, also intersected over integer time translates; nothing asserts validity for every tuple over the local conull set.
  ===== 5.2.4 Consistency around the square. <consistency-around-the-square.>
  Start with a matched label tuple along a row and extend every one of its labels along its column by exact matching. Choose representatives for the resulting labels at all cells. The product down each column is constant under the conditional square law, as is the product along the initial row. Dividing the product of the column relations by that row relation shows that the product of the remaining $k - 1$ row products is constant. Those rows are independent as wholes by Proposition 7. Each row product has modulus one. The absolute mean of their product is one, so each has absolute mean one and is itself constant. Thus every row is matched. Starting from a single cell, its row and then all columns are uniquely determined; the preceding argument supplies consistency along the other rows. Countability of the label lists makes this simultaneous for every initial label. This proves the final assertion. ◻
]

We now have a countable group of lines over each local parameter, with matchings consistent across the square. It remains to find a finite moving set of labels that retains the nonzero level-$1$ correlation.

=== 5.3 Counting labels and their transition operators <counting-labels-and-their-transition-operators>

We next use the parameter-square geometry to compare labels over different local parameters. Counting measure is the appropriate measure on each group: exact matching is a bijection, even when the group is infinite. Set

$ Z = { \( u \, ell \) : ell in cal(L) \( u \) } \, #h(2em) integral_Z F thin upright(d) xi = integral_U sum_(ell in cal(L) \( u \)) F \( u \, ell \) thin upright(d) nu \( u \) quad \( F gt.eq 0 \) . $

The measurable enumeration makes $xi$ sigma-finite. The measurable map $tau \( u \, ell \) = \( T_U u \, tau_u ell \)$ preserves $xi$, because time preserves $nu$ and bijects the label fibres.

#thm([Lemma 5.3.])[
  (Counting lift).  #emph[There are sigma-finite measures $tilde(pi)$ on $Z^I$ and $tilde(theta.alt)$ on $Z^(I times I)$, obtained by counting matched label tuples and arrays over $pi$ and $theta.alt$, respectively. Every coordinate marginal is $xi$, and each row and column marginal of $tilde(theta.alt)$ is $tilde(pi)$. For $s eq.not t$ the coordinate transition in $tilde(pi)$ is the probability kernel 
#[#set math.equation(numbering: n => "(45)")
 $ K_(s t) \( \( u \, ell \) \, A \) = integral upright(bold(1))_A #scale(x: 120%, y: 120%)[\(] p_t \, Phi_(s t) \( p \) ell #scale(x: 120%, y: 120%)[\)] thin pi \( thin upright(d) p divides p_s = u \) . $ <eq:label-transition-kernel>]

 Its operator $M_(s t)$ on $L^2 \( xi \)$ is a contraction, has adjoint $M_(t s)$, and commutes with $V F = F compose tau$. For all $a eq.not b$, 
#[#set math.equation(numbering: n => "(46)")
 $ M_(s t) = M_(a b)^(*) M_(s t) M_(a b) . $ <eq:label-square-identity>]

 Given a labelled row in $tilde(theta.alt)$, any proper family of labelled columns has the product of the column laws conditioned on their respective shared labelled points.]
] <lem:counting-lift>

#proof[
  For a nonnegative measurable function $F$ on $Z^I$, define
  #[#set math.equation(numbering: n => "(47)")
   $ integral F thin upright(d) tilde(pi) = integral sum_(ell in cal(L) \( p_s \)) F #scale(x: 120%, y: 120%)[\(] \( p_t \, Phi_(s t) \( p \) ell \)_(t in I) #scale(x: 120%, y: 120%)[\)] thin upright(d) pi \( p \) . $ <eq:tuple-counting-lift>]
  Unique exact matching makes this independent of the chosen source slot $s$. Define the square measure in the same way, counting its unique matched arrays from one chosen cell. The last assertion of Proposition 18 makes this independent of the chosen cell. Counting from a coordinate, row, or column gives the claimed marginals. The preimages of the first $N$ labels of any one coordinate have measure at most $N$ and exhaust the lifted spaces. Thus the measures are sigma-finite.
  Disintegrating (47) first over $p_s = u$ gives (45). For each prescribed source label there is exactly one completion over every compatible tuple; fixing that label introduces no weight into the parameter kernel. This proves directly that the conditional kernels are probability kernels even when the total lifted measure is infinite. Similarly, given a labelled row of the square, its label has exactly one extension over every compatible parameter square. Its conditional parameter-square law is therefore the original law given that row’s parameter tuple. Lemma 8 gives independent proper columns; their labels are then determined separately by their shared labels and their own parameter tuples. This proves the last assertion of the Lemma.
  Write $tilde(pi)_(s t)$ for the $\( s \, t \)$ marginal. Its two marginals are $xi$, and its kernels in the two directions are $K_(s t)$ and $K_(t s)$. Jensen’s inequality and the marginal identities give $L^2$ contraction and $M_(s t)^(*) = M_(t s)$. Time equivariance of exact matching preserves both lifted measures and gives $V M_(s t) = M_(s t) V$.
  Finally, test the $\( s \, t \)$ pair in row $b$ of the lifted square with $f \, g in L^2 \( xi \)$. Conditional on labelled row $a$, its two column transitions are independent applications of $M_(a b)$, since two columns form a proper family when $k gt.eq 3$. Hence
  $ chevron.l \, chevron.r f M_(s t) g & = integral overline(f \( z_(b \, s) \)) thin g \( z_(b \, t) \) thin upright(d) tilde(theta.alt)\
 & = integral overline(\( M_(a b) f \) \( z_(a \, s) \)) thin \( M_(a b) g \) \( z_(a \, t) \) thin upright(d) tilde(theta.alt)\
 & = chevron.l M_(a b) f \, M_(s t) M_(a b) g chevron.r = chevron.l \, chevron.r f M_(a b)^(*) M_(s t) M_(a b) g . $
  These integrals are absolutely integrable by Cauchy–Schwarz with the pair marginals $xi$. Alternatively one may first use bounded tests of finite-measure support and then pass in $L^2$. The calculation proves (46) without normalizing the sigma-finite measures. ◻
]

=== 5.4 Finite blocks and the time permutation <finite-blocks-and-the-time-permutation>

The transition operators constrain how the countable groups can vary with the parameter. We now extract finite pieces that have fixed sizes and a common permutation under time. Their individual labels need not follow a parameter-independent time rule. The construction starts with the information transported deterministically by a transition operator. Independence of the local parameters will make its possible values countable; a positive $L^2$ test will make each corresponding set of labels finite. The group matchings will then make these finite sizes the same in almost every fibre.

#thm([Lemma 5.4.])[
  (Finite label blocks).  #emph[There are a countable index set $cal(B)$, measurable partitions 
$ cal(L) \( u \) = union.sq.big_(b in cal(B)) B_b \( u \) quad upright("for ") nu upright("-almost every ") u \, $

 and permutations $D_0 \, S_0$ of $cal(B)$ with these properties. Every $B_b \( u \)$ has a fixed finite positive cardinality $m_b$, independent of $u$. For one fixed pair $s eq.not t$, exact matching satisfies 
$ Phi_(s t) \( p \) B_b \( p_s \) = B_(D_0 b) \( p_t \) quad \( pi upright("-almost every ") p \) \, $

 and time satisfies 
$ tau_u B_b \( u \) = B_(S_0 b) \( T_U u \) . $

 Moreover, there are a countable abelian group $cal(L)$, a partition $cal(L) = union.sq.big_b B_b$ into sets of cardinalities $m_b$, block-preserving group isomorphisms $J_u : cal(L) arrow.r cal(L) \( u \)$ for typical $u$, and an automorphism $G$ of $cal(L)$ such that 
#[#set math.equation(numbering: n => "(48)")
 $ G^r B_b = B_(S_0^(- r) b) #h(2em) \( r in bb(Z) \) . $ <eq:abstract-block-time>]

 The isomorphisms $J_u$ are only asserted to exist separately in each fibre; they need not be chosen measurably or intertwine individual time trajectories.]
] <lem:finite-blocks>

#proof[
  Fix $s eq.not t$ and write $M = M_(s t)$. Taking $\( a \, b \) = \( s \, t \)$ and $\( t \, s \)$ in (46) gives
  #[#set math.equation(numbering: n => "(49)")
   $ M = M^(*) M M = M M M^(*) . $ <eq:partial-unitary-identities>]
  Let $cal(H)_1 = overline("Ran" M)$ and $cal(H)_2 = overline("Ran" M^(*))$. The first identity puts $cal(H)_1$ in the fixed space of $M^(*) M$, which lies in $cal(H)_2$. The adjoint of the second identity puts $cal(H)_2$ in the fixed space of $M M^(*)$, which lies in $cal(H)_1$. They are therefore equal to a closed space $cal(H)$. On it $M^(*) M = M M^(*) = "id"$, while $M$ vanishes on $cal(H)^perp = "Ker" M$. Thus $M$ is unitary on $cal(H)$, with inverse $M^(*)$ there. For every $F in cal(H)$, equality in the conditional-expectation norm gives
  #[#set math.equation(numbering: n => "(50)")
   $ F \( z_t \) = \( M F \) \( z_s \) quad tilde(pi)_(s t) upright("-almost everywhere") . $ <eq:deterministic-label-transition>]
  Indeed, the integral of the squared difference is $lr(bar.v.double  bar.v.double) F_2^2 - lr(bar.v.double M F bar.v.double)_2^2 = 0$.
  Choose a measurable enumeration $ell_n \( u \)$ without repetition, and set $h \( u \, ell_n \( u \) \) = 2^(- n)$ on its domain, starting at $n = 1$. Then $h > 0$ and $lr(bar.v.double  bar.v.double) h_2^2 lt.eq sum_(n gt.eq 1) 4^(- n) < oo$. The probability kernel sends $h$ to a strictly positive function $v = M h$ almost everywhere: the kernel avoids every $xi$-null set for almost every source point, by its marginal identity, and the integral of a positive function under a probability law is positive. Also $v in cal(H)$.
  The time operator $V$ is unitary and commutes with $M$ in both directions, so it preserves $cal(H)$. Define the measurable countable vector
  #[#set math.equation(numbering: n => "(51)")
   $ psi \( z \) = #scale(x: 120%, y: 120%)[\(] \( M^n V^r v \) \( z \) #scale(x: 120%, y: 120%)[\)]_(\( n \, r \) in bb(Z)^2) in bb(C)^(bb(Z)^2) . $ <eq:label-orbit-vector>]
  Negative powers of $M$ are taken on $cal(H)$. All its coordinates have finite versions outside one null set, and its $\( 0 \, 0 \)$ coordinate is positive there. On $bb(C)^(bb(Z)^2)$ define
  $ \( D_0 c \)_(n \, r) = c_(n + 1 \, r) \, #h(2em) \( S_0 c \)_(n \, r) = c_(n \, r + 1) . $
  These are commuting invertible coordinate reindexings. Using (50) for the countably many coordinates gives
  #[#set math.equation(numbering: n => "(52)")
   $ psi \( z_t \) = D_0 psi \( z_s \) \, #h(2em) psi \( tau z \) = S_0 psi \( z \) $ <eq:psi-transports>]
  almost everywhere in the respective measures.
  We claim that $psi$ has countable essential image. Given a source point $z = \( u \, ell \)$, the parameter of its $K_(s t)$ target has law $nu$, since $p_s \, p_t$ are independent under $pi$ and fixing a source label does not tilt that law. Consider the occurrence relation
  $ R \( z \, u' \) quad arrow.l.r.double quad D_0 psi \( z \) = psi \( u' \, ell_n \( u' \) \) upright(" for some defined ") ell_n \( u' \) . $
  It is measurable: existence is a countable union and equality of vectors is a countable conjunction of coordinate equalities. The first identity in (52) implies $nu { u' : R \( z \, u' \) } = 1$ for $xi$-almost every $z$. Tonelli’s theorem for the sigma-finite product $xi ⊗ nu$ selects one $u'$ for which $R \( z \, u' \)$ holds for $xi$-almost every $z$. That target fibre has only countably many $psi$-values. Invertibility of $D_0$ proves the claim.
  Let $cal(B)$ be the positive-mass values in this countable essential image. For $b in cal(B)$ put
  $ E_b = { z : psi \( z \) = b } \, #h(2em) B_b \( u \) = { ell : \( u \, ell \) in E_b } . $
  Every $b$ has positive $\( 0 \, 0 \)$ coordinate $b_(0 \, 0)$, and
  #[#set math.equation(numbering: n => "(53)")
   $ 0 < xi \( E_b \) lt.eq frac(lr(bar.v.double  bar.v.double) v_2^2, \| b_(0 \, 0) \|^2) < oo . $ <eq:finite-level-mass>]
  Equal marginals in the first identity of (52) and time invariance in the second show that $D_0$ and $S_0$ permute $cal(B)$, preserving each level’s mass along their orbits. After discarding a $nu$-null set, all labels in every remaining fibre belong to these levels, and each $B_b \( u \)$ is finite. Countability of $cal(B)$ makes these assertions simultaneous.
  Counting the labels in (52) shows that, for $pi$-almost every $p$, its matching isomorphism $Phi_(s t) \( p \)$ carries every block $b$ onto block $D_0 b$. Because each fibre’s label list and $cal(B)$ are countable, intersecting the corresponding conull sets upgrades the transported label identity to every label in every block for such a tuple. Disintegrate the measurable conull set of such tuples over $\( p_s \, p_t \)$. Since its marginal is $nu ⊗ nu$, there is a measurable conull set of pairs $\( u \, w \)$ admitting a tuple with this property. Fubini chooses a common source $u_(*)$ for which almost every target is in this set. For each such target $u$, choose one resulting group isomorphism $I_u : cal(L) \( u_(*) \) arrow.r cal(L) \( u \)$. Each $I_u$ takes block $b$ to block $D_0 b$ simultaneously for every $b$. The choices are used only pointwise.
  Fix one typical target $u_0$, set $cal(L) = cal(L) \( u_0 \)$, and define $J_u = I_u I_(u_0)^(- 1)$. These group isomorphisms preserve every block index. Thus all $\| B_b \( u \) \|$ are constant almost everywhere. Equation (53) makes each constant finite, and its positive left side makes it nonzero. Let $B_b = B_b \( u_0 \)$ and $m_b = \| B_b \|$.
  The second identity of (52) gives the asserted time permutation of blocks. Restrict the local parameter set to the intersection of all integer translates of the conull sets just used and of the time-equivariance set. Choose $u$ in this invariant conull set. The automorphism
  $ A = J_(T_U u)^(- 1) tau_u J_u $
  of $cal(L)$ maps every $B_b$ to $B_(S_0 b)$. Take $G = A^(- 1)$. Iteration gives (48). This last step fixes one automorphism realizing the permutation of blocks; it makes no assertion about the maps inside a block at other parameters or later times. ◻
]

=== 5.5 A finite block carrying the witness <a-finite-block-carrying-the-witness>

All structural objects needed for the final argument are now available. The next Proposition records the precise connection to the nonzero correlation retained from the original process. Its measurable quantities are sums over finite blocks, so the abstract identifications in Lemma 20 will cause no measurability issue.

#thm([Proposition 5.5.])[
  (A block carrying the witness).  #emph[Let the saturated array object lie over the zero-entropy finite-alphabet mixing process $\( X \, mu_X \, T_X \)$ supplied by Proposition 2, with its centered finite-valued one-site functions $f_1 \, dots.h \, f_k$ and nonzero level-$1$ product integral. There exist a function $f in { f_1 \, dots.h \, f_k }$, a countable abelian group $cal(L)$, an automorphism $G$ of $cal(L)$, a finite nonempty set $B subset cal(L)$, and a number $c > 0$ with the following properties.]
  #emph[For $nu$-almost every $u$, the probability space $\( Y \, eta_u \)$ has factor map $x : Y arrow.r X$ with $x_(*) eta_u = mu_X$, and admits representatives $\( chi_ell^u \)_(ell in cal(L))$ such that 
#[#set math.equation(numbering: n => "(54)")
 $ chi_0^u = 1 \, #h(2em) \| chi_ell^u \| = 1 \, #h(2em) chi_ell^u chi_(ell')^u in bb(T) chi_(ell + ell')^u \,\
integral chi_ell^u thin upright(d) eta_u = 0 quad \( ell eq.not 0 \) \, #h(2em) chevron.l chi_ell^u \, chi_(ell')^u chevron.r_(L^2 \( eta_u \)) = upright(bold(1))_({ ell = ell' }) . $ <eq:block-character-laws>]

 For every $r gt.eq 0$ the function 
#[#set math.equation(numbering: n => "(55)")
 $ s_r \( u \) = sum_(ell in B) lr(|integral f \( T_X^r x \( y \) \) thin overline(chi_(G^r ell)^u \( y \)) thin upright(d) eta_u \( y \)|) $ <eq:block-witness-sum>]

 has a measurable version and satisfies 
#[#set math.equation(numbering: n => "(56)")
 $ 0 lt.eq s_r \( u \) lt.eq \| B \| lr(bar.v.double  bar.v.double) f_oo \, #h(2em) integral_U s_r \( u \) thin upright(d) nu \( u \) = c > 0 . $ <eq:block-witness-integral>]

 The group identifications used to choose the representatives in (54) need not be measurable in $u$. Their finite sums in (55) are intrinsic sums over the measurable moving blocks. In particular, no time invariance of an individual $eta_u$ is asserted or required.]
] <prop:block-witness>

#proof[
  Condition the nonzero product integral at level $1$ on $p$. For any chosen slot $i$, the conditional expectation of the product of the other bounded inputs onto that slot belongs to its active space. If $f_i \( x \)$ were orthogonal to that space for almost every $p$, the product integral would vanish. In using complex inner products here one can conjugate the other product; the active space is conjugation invariant. Lemma 17 and Proposition 18 therefore give a choice $f = f_i$ with a nonzero coefficient on some local label on a set of positive $nu$-measure. The identity-label coefficient is zero:
  $ integral f \( x \( y \) \) thin upright(d) eta_u \( y \) = integral f thin upright(d) mu_X = 0 . $
  Thus nonidentity labels supply the nonzero coefficient.
  For a block $b in cal(B)$ define the measurable function
  $ c_b \( u \) = sum_(ell in B_b \( u \)) lr(|integral f \( x \( y \) \) overline(chi_(u \, ell) \( y \)) thin upright(d) eta_u \( y \)|) . $
  The countably many blocks cover all labels, so some fixed block $b$ has $integral c_b thin upright(d) nu > 0$. Its cardinality $m_b$ is fixed and finite, and hence $c_b lt.eq m_b lr(bar.v.double  bar.v.double) f_oo$. Set $B = B_b subset cal(L)$ using Lemma 20, and $c = integral c_b thin upright(d) nu$.
  For each typical $u$ choose the block-preserving identification $J_u$ from that Lemma and put $chi_ell^u = chi_(u \, J_u ell)$. Proposition 18 gives (54). By (48), the sum in (55) equals the intrinsic measurable sum
  #[#set math.equation(numbering: n => "(57)")
   $ sum_(ell' in B_(S_0^(- r) b) \( u \)) lr(|integral f \( T_X^r x \( y \) \) overline(chi_(u \, ell') \( y \)) thin upright(d) eta_u \( y \)|) . $ <eq:intrinsic-moving-block-sum>]
  Only the set of lines is relevant; changing representative phases or permuting labels inside this set changes no summand magnitude. This proves measurability without a measurable choice of $J_u$.
  The conditional laws are equivariant: $\( T_Y^r \)_(*) eta_u = eta_(T_U^r u)$. Time carries $B_(S_0^(- r) b) \( u \)$ bijectively onto $B_b \( T_U^r u \)$, taking representatives to representatives up to scalar phase. The change of variables $y' = T_Y^r y$ in (57) consequently gives
  #[#set math.equation(numbering: n => "(58)")
   $ s_r \( u \) = c_b \( T_U^r u \) . $ <eq:witness-block-transport>]
  Invariance of $nu$ proves its integral is $c$ for every $r$. Finally, $G^r$ bijects $B$ onto $B_(S_0^(- r) b)$, so every moving block has the same cardinality $\| B \| = m_b$. Each coefficient is at most $lr(bar.v.double  bar.v.double) f_oo$. This proves the bound in (56) and completes the Proposition. ◻
]

Proposition 21 leaves a problem on a single probability fibre: show that the absolute coefficients along each orbit $G^r ell$ have Cesàro mean zero. The uniform finite-block bound will then allow integration over $u$. The next section proves this cancellation using only the mixing zero-entropy $X$ marginal and the group relations (54).

== 6 Cancellation in one time dimension <sec:cancellation>

The structural argument has produced finite sets of orthogonal lines whose motion is described by an automorphism of an abstract abelian group. We now prove the cancellation statement needed to rule out a nonzero correlation with the zero-entropy witness. The probability law in this section need not be invariant under any transformation of the space carrying the lines. Only its marginal on the original process is used.

Let $\( X \, mu_X \, T_X \)$ be a mixing system, let $\( Y \, eta \)$ be a probability space, and let $x : Y arrow.r X$ have law $mu_X$. Suppose that a countable abelian group $L$ is represented by measurable functions $chi_l : Y arrow.r bb(C)$ such that

#[#set math.equation(numbering: n => "(59)")
 $ \| chi_l \| = 1 \, #h(2em) chi_0 = 1 \, #h(2em) chi_l chi_(l') in bb(T) chi_(l + l') \, #h(2em) integral chi_l thin upright(d) eta = 0 quad \( l eq.not 0 \) . $ <eq:projective-characters>]

Here $bb(T) chi$ denotes all constant multiples of $chi$ by scalars of modulus one; in particular, the scalar in the product relation is independent of $y$. These assumptions imply that distinct $chi_l$ are orthogonal. Let $G : L arrow.r L$ be a group automorphism.

#thm([Proposition 6.1.])[
  (Orbit cancellation).  #emph[Assume that $X$ is a mixing two-sided finite-alphabet stationary process whose alphabet partition has entropy rate zero. For every centered finite-valued one-site function $f$ on $X$, every probability coupling $x : Y arrow.r X$, every family satisfying (59), every automorphism $G$, and every $l in L$, one has 
#[#set math.equation(numbering: n => "(60)")
 $ lim_(N arrow.r oo) 1 / N sum_(r = 0)^(N - 1) lr(|integral f \( T_X^r x \) overline(chi_(G^r l)) thin upright(d) eta|) = 0 . $ <eq:orbit-cancellation>]

]
] <prop:orbit-cancellation>

The proof separates three possibilities for a label orbit. A dissociated orbit is handled by entropy. A finite relation either produces dissociated subsequences on arithmetic progressions, or makes the orbit polynomial on such progressions. Mixing then handles the polynomial case.

=== 6.1 Entropy against dissociated labels <entropy-against-dissociated-labels>

#prodef([Definition 6.2.])[
  A sequence $\( l_m \)_(m gt.eq 0)$ in an abelian group is #emph[dissociated] if
  $ sum_(m in A) epsilon_m l_m eq.not 0 $
  for every finite nonempty set $A subset bb(N) union { 0 }$ and every choice $epsilon_m in { - 1 \, 1 }$.
]

This definition concerns distinct indices. Thus it excludes zero labels and repetitions, and also applies to groups with torsion.

The proof begins with the exponential-moment argument for dissociated characters; see #cite(label("Green2002SetAddition")) Section 2.2, Proposition 17. We give the argument for the projective characters above and then use the sublinear word-entropy hypothesis.

#thm([Lemma 6.3.])[
  (Entropy cancellation).  #emph[Suppose (59) holds and $\( l_m \)$ is dissociated. Let $\( F_m \)_(m gt.eq 0)$ be complex random variables on $\( Y \, eta \)$ taking values in a fixed finite subset of the closed unit disk. If the Shannon entropy $H_n$ of $\( F_0 \, dots.h \, F_(n - 1) \)$ satisfies $H_n = o \( n \)$, then 
$ 1 / n sum_(m < n) lr(|integral F_m overline(chi_(l_m)) thin upright(d) eta|) arrow.r 0 . $

 No independence between the variables $F_m$ and the functions $chi_(l_m)$ is assumed.]
] <lem:entropy-cancellation>

#proof[
  For deterministic complex numbers $w_m$ with $\| w_m \| lt.eq 1$ and $0 < theta lt.eq 1$, the elementary inequality $e^t lt.eq 1 + t + 2 t^2$ for $\| t \| lt.eq 1$ gives
  $ exp #scale(x: 120%, y: 120%)[\(] theta Re \( w_m overline(chi_(l_m)) \) #scale(x: 120%, y: 120%)[\)] lt.eq 1 + theta Re \( w_m overline(chi_(l_m)) \) + 2 theta^2 . $
  The right side is nonnegative. Multiply these inequalities over $m < n$ and integrate. On expanding the product, a nonconstant term contains one factor $chi_(l_m)$ or $overline(chi_(l_m))$ at each of a nonempty set of distinct indices. By (59), it is a constant multiple of the representative of a signed sum of those labels. Dissociation makes that label nonzero, so its integral vanishes. Hence
  #[#set math.equation(numbering: n => "(61)")
   $ integral exp (theta sum_(m < n) Re \( w_m overline(chi_(l_m)) \)) thin upright(d) eta lt.eq \( 1 + 2 theta^2 \)^n lt.eq e^(2 theta^2 n) . $ <eq:dissociated-exponential>]
  For $0 < epsilon lt.eq 1$, choose $theta = epsilon \/ 4$ and apply Markov’s inequality. Uniformly over the deterministic coefficients,
  #[#set math.equation(numbering: n => "(62)")
   $ eta {1 / n sum_(m < n) Re \( w_m overline(chi_(l_m)) \) > epsilon} lt.eq e^(- epsilon^2 n \/ 8) . $ <eq:dissociated-tail>]
  We next allow the coefficients to be the random word $\( F_m \)$. Put
  $ a_n = sqrt(H_n \/ n) + n^(- 1 \/ 2) . $
  Call a word likely if its probability is at least $e^(- a_n n)$. There are at most $e^(a_n n)$ likely words. For the random word, the mean of minus the logarithm of its probability is $H_n$, so the total probability of the other words is at most $H_n \/ \( a_n n \)$. Both $a_n$ and this last bound tend to zero.
  Fix arbitrary deterministic phases $omega_m in bb(T)$. On the event that $\( F_m \)_(m < n)$ equals a particular likely word $\( v_m \)$, the sum
  $ Y_n = 1 / n sum_(m < n) Re \( omega_m F_m overline(chi_(l_m)) \) $
  is the sum in (62) with $w_m = omega_m v_m$. We do not condition the character law on that word: the event in question is simply a subset of the corresponding event for deterministic coefficients. A union bound therefore gives
  #[#set math.equation(numbering: n => "(63)")
   $ eta { Y_n > epsilon } lt.eq frac(H_n, a_n n) + exp (a_n n - frac(epsilon^2 n, 8)) arrow.r 0 . $ <eq:likely-word-bound>]
  This explains why arbitrary coupling is allowed.
  Finally choose each $omega_m$ to make $omega_m integral F_m overline(chi_(l_m)) thin upright(d) eta$ nonnegative real, choosing any phase if that integral is zero. These choices are deterministic. Since $Y_n lt.eq 1$, we have
  $ 0 lt.eq 1 / n sum_(m < n) lr(|integral F_m overline(chi_(l_m)) thin upright(d) eta|) = integral Y_n thin upright(d) eta lt.eq epsilon + eta { Y_n > epsilon } . $
  First let $n$ tend to infinity and then let $epsilon$ tend to zero. ◻
]

For the process in Proposition 22, fix integers $p gt.eq 1$ and $0 lt.eq j < p$. The word $\( f \( T_X^(p m + j) x \) \)_(m < n)$ is a function of a consecutive alphabet window of length at most $p n + p$. Stationarity and zero entropy give entropy $o \( n \)$ for this word. After scaling $f$, Lemma 24 therefore proves (60) on any arithmetic progression on which its label sequence is dissociated.

=== 6.2 The algebra of a single orbit <the-algebra-of-a-single-orbit>

The finite-generation and spectral steps below have predecessors in Rokhlin’s compact-group argument #cite(label("Rokhlin1949")) Sections 2.3 and 3.2. Here the labels may have torsion, and the case in which a power acts unipotently is retained for polynomial cancellation.

#thm([Lemma 6.4.])[
  (Orbit alternatives).  #emph[Let $G$ be an automorphism of an abelian group $L$ and $l in L$. At least one of the following holds:]
  + #emph[The sequence $\( G^r l \)_(r gt.eq 0)$ is dissociated.]
  + #emph[There is $p gt.eq 1$ such that $\( G^(p m + j) l \)_(m gt.eq 0)$ is dissociated for every $0 lt.eq j < p$.]
  + #emph[There are $p \, d gt.eq 1$ such that, on the subgroup $K = chevron.l G^r l : r in bb(Z) chevron.r$, the endomorphism $N = G^p - "id"$ satisfies $N^d = 0$. In this case 
#[#set math.equation(numbering: n => "(64)")
 $ G^(p m + j) l = sum_(a = 0)^(d - 1) binom(m, a) N^a G^j l #h(2em) \( m gt.eq 0 \, med 0 lt.eq j < p \) . $ <eq:binomial-orbit>]

]
] <lem:orbit-alternatives>

#proof[
  Suppose the first alternative fails. Remove any initial zero coefficients from a nonempty signed relation and apply a power of $G^(- 1)$. We obtain
  $ b_0 l + b_1 G l + dots.h.c + b_q G^q l = 0 \, #h(2em) b_0 \, b_q in { - 1 \, 1 } \, quad b_a in { - 1 \, 0 \, 1 } . $
  If $q = 0$, then $l = 0$ and the third alternative holds with $p = d = 1$. For $q gt.eq 1$, the unit coefficient at the upper end expresses $G^q l$ as an integral combination of the preceding $q$ labels. The coefficient at the lower end does the same in the other direction. Applying the relation to all translates shows that $K$ is generated by $l \, G l \, dots.h \, G^(q - 1) l$. In particular, its torsion subgroup $K_(upright("tor"))$ is finite and its quotient $overline(K)$ is a finite-rank lattice.
  The induced map $overline(G)$ is a lattice automorphism. If it has an eigenvalue $lambda$ with $\| lambda \| > 1$, choose a nonzero complex left eigenfunctional $phi$ on $overline(K) ⊗_(bb(Z)) bb(C)$. The two-sided orbit of $overline(l)$ spans this vector space. Thus $phi \( overline(l) \) eq.not 0$, since otherwise $phi \( overline(G)^r overline(l) \) = lambda^r phi \( overline(l) \) = 0$ for every integer $r$. Choose $p$ with $R = \| lambda \|^p > 2$. On each residue class $j$, the absolute values of the projected labels are $\| lambda^j phi \( overline(l) \) \| R^m$. In any finite signed relation on distinct indices, the term with largest index strictly dominates the sum of all earlier terms, because $sum_(a < m) R^a < R^m$. There can be no such relation in $K$. This proves the second alternative.
  It remains to consider the case with no expanding eigenvalue. If the lattice has positive rank, $det overline(G) = plus.minus 1$ implies that every eigenvalue has modulus one. We use the bounded-coefficient argument in Kronecker’s root-of-unity criterion #cite(label("Kronecker1857")) Theorem I; see also #cite(label("Damianou2015")) Theorem 1 and its proof. The characteristic polynomial of $overline(G)^n$ has integer coefficients, each bounded independently of $n$: its coefficients are elementary symmetric functions of a fixed number of numbers of modulus one. Only finitely many such polynomials exist. For each eigenvalue $lambda$, all the powers $lambda^n$ are roots of these finitely many polynomials. Hence two powers agree and $lambda$ is a root of unity.
  Choose $p$ such that $overline(G)^p$ is unipotent and $G^p$ is the identity on $K_(upright("tor"))$. The latter is possible because the automorphism group of a finite group is finite. This argument includes the rank-zero case. For some $d_0 gt.eq 1$, the map $N = G^p - "id"$ satisfies $N^(d_0) K subset.eq K_(upright("tor"))$, and $N K_(upright("tor")) = 0$. Consequently $N^(d_0 + 1) K = 0$. The additional application of $N$ accounts for possible maps from a free part into torsion; an invariant splitting of $K$ has not been assumed. Taking $d = d_0 + 1$ and expanding $\( "id" + N \)^m$ proves (64). ◻
]

=== 6.3 Polynomial labels and mixing <polynomial-labels-and-mixing>

A group-valued polynomial of degree at most $d$ on the nonnegative integers will mean a sequence

$ P \( m \) = sum_(a = 0)^d binom(m, a) l_a \, #h(2em) l_a in L . $

For each fixed integer $h gt.eq 1$, the difference $P \( m + h \) - P \( m \)$ has degree at most $d - 1$. Indeed, Vandermonde’s identity expands $binom(m + h, a) - binom(m, a)$ as an integral combination of $binom(m, 0) \, dots.h \, binom(m, a - 1)$. This observation is valid in every abelian group, including groups with torsion.

We use Hilbert-space van der Corput differencing and induction on polynomial degree; compare #cite(label("Bergelson1987")) Theorems 1.4–1.5 and p. 339. The argument below works in the present coupling, whose law need not be invariant.

#thm([Lemma 6.5.])[
  (Polynomial cancellation).  #emph[Let $\( X \, mu_X \, T_X \)$ be mixing, let $x : Y arrow.r X$ have law $mu_X$, and assume (59). For every bounded centered function $F$ on $X$, every $p gt.eq 1$, and every group-valued polynomial $P \( m \)$, one has 
$ 1 / n sum_(m < n) lr(|integral F \( T_X^(p m) x \) overline(chi_(P \( m \))) thin upright(d) eta|) arrow.r 0 . $

 Here neither zero entropy nor invariance of $eta$ is required.]
] <lem:polynomial-cancellation>

#proof[
  We induct on the degree. If $P \( m \) = l_0$ is constant, condition $overline(chi_(l_0))$ onto $x$. Its conditional expectation is a bounded measurable function $g$ on $X$, and
  $ integral F \( T_X^(p m) x \) overline(chi_(l_0)) thin upright(d) eta = integral F \( T_X^(p m) x \) g \( x \) thin upright(d) mu_X \( x \) arrow.r 0 $
  by mixing and centering. Mixing for bounded functions follows from the set formulation by simple-function approximation. This proves the base case, including $l_0 = 0$.
  For the inductive step, choose deterministic phases $omega_m$ aligning the integrals in the assertion. In the fixed Hilbert space $L^2 \( eta \)$ put
  $ v_m = omega_m F \( T_X^(p m) x \) overline(chi_(P \( m \))) . $
  Their norms are bounded by $lr(bar.v.double  bar.v.double) F_oo$. At a fixed positive lag $h$, the absolute value of $chevron.l v_m \, v_(m + h) chevron.r$ equals
  $ lr(|integral F_h \( T_X^(p m) x \) overline(chi_(P \( m + h \) - P \( m \))) thin upright(d) eta|) \, #h(2em) F_h = \( F compose T_X^(p h) \) overline(F) . $
  The constant phases from alignment and from (59) disappear inside this absolute value. Apply the induction hypothesis to the centered function $F_h - integral F_h thin upright(d) mu_X$ and the polynomial of lower degree. The remaining constant contribution has absolute value at most $\| integral F_h thin upright(d) mu_X \|$. Therefore
  #[#set math.equation(numbering: n => "(65)")
   $ limsup_(n arrow.r oo) 1 / n sum_(m < n) \| chevron.l v_m \, v_(m + h) chevron.r \| lt.eq lr(|integral F_h thin upright(d) mu_X|) . $ <eq:lag-correlation-bound>]
  The following averaging step is the Hilbert-space van der Corput argument; see #cite(label("BergelsonKnutson2008")) Theorem 4.1 for a real Hilbert-space formulation, using the real part of the inner product in the complex case. For completeness, fix $H gt.eq 1$. Replacing each $v_m$ in its mean by $H^(- 1) sum_(a = 0)^(H - 1) v_(m + a)$ changes the mean by a vector of norm at most $2 H lr(bar.v.double  bar.v.double) F_oo \/ n$. Convexity of the squared norm bounds the squared norm of this new mean by the mean of the squared norms of its summands. Expanding those squares, grouping terms by the lag, and using (65) gives
  $ limsup_(n arrow.r oo) ∥1 / n sum_(m < n) v_m∥^2 lt.eq frac(lr(bar.v.double  bar.v.double) F_oo^2, H) + 2 / H sum_(h = 1)^(H - 1) (1 - h / H) lr(|integral F_h thin upright(d) mu_X|) . $
  The harmless shift of the averaging range by at most $H$ indices does not change any of these limiting bounds. Mixing and centering imply $integral F_h thin upright(d) mu_X arrow.r 0$ as $h arrow.r oo$. Letting $H arrow.r oo$ shows that the Hilbert-space means tend to zero. Testing them against the constant function $1$ yields exactly the mean of the aligned absolute integrals, proving the induction. ◻
]

#proof[
  Apply Lemma 25. In the first alternative, Lemma 24 applies directly. In the second, apply it on each of the finitely many residue classes modulo $p$, using the progression-word entropy estimate after that lemma. In the third, (64) gives a polynomial on every residue class. Apply Lemma 26 there with $F = f compose T_X^j$. This function is centered by invariance of $mu_X$. In each case the finitely many progression averages tend to zero and combine to give the full average in (60). ◻
]

== 7 Proof of the main theorem <sec:main-proof>

We apply orbit cancellation in each conditional fibre and integrate the measurable finite-block averages from Proposition 21.

#proof[
  Suppose the conclusion fails, and let $k gt.eq 3$ be the least failing order. Proposition 2 gives a mixing finite-alphabet process $\( X \, mu_X \, T_X \)$ of zero entropy, centered finite-valued one-site functions, and a sequence of layouts witnessing failure at order $k$. All proper sublayouts satisfy the lower-order mixing conclusions.
  Construct the ordered array laws and their saturated extension by Section 3. The square locality and operator results of Sections 3 and 4 apply to this extension. Proposition 21 supplies a centered one-site witness $f$, a countable abelian group $cal(L)$, an automorphism $G$, a finite nonempty set $B subset cal(L)$, and representatives $chi_l^u$ in each typical fibre. The measurable coefficient sums $s_r \( u \)$ defined in (55) satisfy
  $ 0 lt.eq s_r \( u \) lt.eq \| B \| lr(bar.v.double  bar.v.double) f_oo \, #h(2em) integral_U s_r thin upright(d) nu = c > 0 #h(2em) \( r gt.eq 0 \) . $
  Fix a typical $u$. The marginal of $x$ under $eta_u$ is exactly $mu_X$. The representatives obey (59) by (54). Apply Proposition 22 to each of the finitely many $l in B$. It gives
  $ 1 / N sum_(r < N) s_r \( u \) arrow.r 0 . $
  This is a pointwise argument in the fibre; it uses neither invariance of $eta_u$ under time nor a measurable choice of the abstract identification. The original sums are already measurable, and are bounded by $\| B \| lr(bar.v.double  bar.v.double) f_oo$ for every $r$ and almost every $u$. Bounded convergence therefore makes their integrals tend to zero. Every such integrated average equals $c > 0$, a contradiction.
  There is consequently no least failing finite order. Since ordinary mixing supplies order two, all the conclusions in Theorem 1 follow. ◻
]

== 8 Endomorphisms and flows <sec:consequences>

Theorem 1 also yields higher-order mixing for noninvertible transformations and for flows. The first deduction applies the theorem to the invertible extension of a finite-symbol factor; the second approximates real-time layouts by integer-time layouts.

#thm([Corollary 8.1.])[
  (Endomorphisms and continuous flows).  #emph[Let $\( Omega \, cal(F) \, mu \)$ be an arbitrary probability space.]
  + #emph[Suppose $T : Omega arrow.r Omega$ is measurable, preserves $mu$, and $mu \( A ∩ T^(- n) B \) arrow.r mu \( A \) mu \( B \)$ as $n arrow.r + oo$ for every $A \, B in cal(F)$. Then, for every fixed $k gt.eq 2$ and measurable $A_1 \, dots.h \, A_k$, 
$ mu (⋂_(i = 1)^k T^(- t_i) A_i) arrow.r product_(i = 1)^k mu \( A_i \) $

 along nonnegative integer times $t_1 < dots.h.c < t_k$ whose least successive gap tends to infinity. Only preimages under forward iterates are used.]
  + #emph[Let $\( S_t \)_(t in bb(R))$ be a probability-preserving group of invertible measurable transformations. Assume $mu \( A ∩ S_t^(- 1) B \) arrow.r mu \( A \) mu \( B \)$ as $t arrow.r + oo$ for every $A \, B in cal(F)$, and that its Koopman operators $U_t f = f compose S_t$ are strongly continuous on $L^1 \( mu \)$; equivalently, 
$ lr(bar.v.double U_s 1_A - 1_A bar.v.double)_1 arrow.r 0 #h(2em) \( s arrow.r 0 \) quad upright("for every ") A in cal(F) . $

 The same product limit holds with $T^(- t_i) A_i$ replaced by $S_(t_i)^(- 1) A_i$ and with arbitrary real times $t_1 < dots.h.c < t_k$ whose least successive gap tends to infinity.]
] <cor:endomorphisms-flows>

Jointly measurable probability-preserving flows on standard probability spaces satisfy the continuity hypothesis #cite(label("Rokhlin1960")) Section 1.7, p. 7.

#proof[
  For the endomorphism assertion, fix the tested sets and let $alpha$ be the finite partition they generate, with alphabet $D$. The one-sided name map $pi$ records the atom of $alpha$ containing $T^n omega$ in coordinate $n gt.eq 0$. It takes values in $D^(bb(Z)_(gt.eq 0))$ and intertwines $T$ with the left shift $V$. The Borel measure $nu = pi_(*) mu$ is stationary and mixing, by pulling back any two Borel sets. Its completion is still mixing, by null representatives. Take the mixing invertible natural extension of this standard factor, $\( hat(Y) \, hat(nu) \, hat(V) \)$ with projection $p$ #cite(label("Rokhlin1960")) Section 9. If $C_i$ is the time-zero cylinder coding $A_i$, then for every nonnegative layout,
  $ mu (⋂_i T^(- t_i) A_i) = hat(nu) (⋂_i hat(V)^(- t_i) p^(- 1) C_i) . $
  Theorem 1 gives the required product limit. Only Borel cylinders are pulled back to the original space; no natural extension of that possibly nonstandard space is asserted.
  For the flow assertion, $S_1$ is mixing: integer positive times are a subsequence of the assumed limit, and invertibility gives negative times by exchanging the tested sets. Subtract $t_1$ from each layout and write $t_i = n_i + r_i$, where $n_i = floor.l t_i floor.r$ and $0 lt.eq r_i < 1$. The successive integer gaps still diverge. Along any sequence of layouts, pass to a subsequence on which every $r_i$ converges to $r_i^(*) in \[ 0 \, 1 \]$. The product telescoping bound and the $L^1$ isometry of $U_(n_i)$ give
  $ & lr(|integral product_i U_(n_i + r_i) 1_(A_i) thin upright(d) mu - integral product_i U_(n_i + r_i^(*)) 1_(A_i) thin upright(d) mu|)\
 & #h(2em) lt.eq sum_i lr(bar.v.double U_(r_i) 1_(A_i) - U_(r_i^(*)) 1_(A_i) bar.v.double)_1 arrow.r 0 . $
  Theorem 1 applied to $S_1$ and the fixed indicators $U_(r_i^(*)) 1_(A_i)$ gives the product of their unchanged means. Every hypothetical sequence violating the real-time limit has such a subsequence, proving the assertion. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
