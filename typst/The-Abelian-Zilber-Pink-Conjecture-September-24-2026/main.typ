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

#align(center)[#text(size: 16pt, weight: "bold")[The abelian Zilber--Pink conjecture]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

A dimension count predicts how a subvariety of an abelian variety meets a fixed torsion coset. The abelian Zilber–Pink conjecture asks for a finiteness statement when the intersection is larger than this prediction, even though the torsion coset is allowed to vary. We prove the conjecture over number fields in arbitrary dimension.

=== 1.1 The finiteness statement <the-finiteness-statement>

Fix a number field $K$, an algebraic closure $macron(K)$, and an abelian variety $A \/ K$. All subvarieties below are closed and irreducible over $macron(K)$. A #emph[special subvariety] of $A_(macron(K))$ is a torsion coset $B + tau$, where $B$ is an abelian subvariety and $tau$ is a torsion point. For a subvariety $Z$, write $chevron.l Z chevron.r_(upright("sp"))$ for the smallest special subvariety containing $Z$.

This smallest subvariety exists: choose a special subvariety of least dimension containing $Z$, and intersect it with any other such subvariety. Each irreducible component of a nonempty intersection of torsion cosets is a torsion coset. The component containing $Z$ has the same dimension as the chosen one, and hence equals it. This also proves uniqueness and the implication

#[#set math.equation(numbering: n => "(1.1)")
 $ Z subset.eq Z' quad arrow.r.double quad chevron.l Z chevron.r_(upright("sp")) subset.eq chevron.l Z' chevron.r_(upright("sp")) . $ <eq:closure-monotonicity>]

Here the assertion about intersections follows by intersecting the underlying algebraic subgroups: a nonempty intersection is a coset of their intersection, torsion points lift through surjective homomorphisms of abelian varieties, and every component of an algebraic subgroup of an abelian variety contains a torsion point.

Let $X subset.eq A_(macron(K))$ and put $S = chevron.l X chevron.r_(upright("sp"))$. An irreducible component $Y$ of $X ∩ T$, for a special $T subset.eq S$, is #emph[atypical for $X$ in $S$] if

#[#set math.equation(numbering: n => "(1.2)")
 $ dim Y > dim X + dim T - dim S . $ <eq:atypical>]

Maximality of an atypical subvariety always means maximality for inclusion among the atypical subvarieties of $X$ in $S$.

#thm([Theorem 1.1.])[
  #emph[For every number field $K$, every abelian variety $A \/ K$, and every irreducible subvariety $X subset.eq A_(macron(K))$, there are only finitely many maximal atypical subvarieties of $X$ in $S = chevron.l X chevron.r_(upright("sp"))$. Equivalently, there are finitely many proper atypical subvarieties $Y_1 \, dots.h \, Y_m subset.neq X$ such that every atypical subvariety is contained in one of the $Y_j$.]
] <thm:main>

The list can be empty. No bound on the degrees or heights of the intersection points is assumed, and no simplicity, endomorphism, or complex multiplication hypothesis is imposed on $A$. The theorem concerns torsion cosets in abelian varieties; it gives no effective or uniform bound for the number of maximal atypical subvarieties.

For a torsion coset $S$ and an integer $r gt.eq 0$, set

$ S^(\[ r \]) = union.big_(T subset.eq S med upright("special")\
"codim"_S T gt.eq r) T . $

We first prove the following non-density theorem, with universal quantifiers on the ambient abelian variety and its subvarieties.

#thm([Theorem 1.2.])[
  #emph[Let $A$ be an abelian variety over $overline(bb(Q))$, and let $X subset.eq A$ be an irreducible subvariety contained in no proper torsion coset. Then $X ∩ A^(\[ dim X + 1 \])$ is not Zariski dense in $X$.]
] <thm:nondensity>

The passage from this assertion to Theorem 1 uses the optimal-subvariety reduction of Barroero and Dill. Section 9 checks its universal hypotheses and gives the final inclusion argument. In particular, the proof does not stop with non-density for one fixed $X$.

The same universal non-density theorem also gives a consequence for translations by finite-rank subgroups. For point sets $E \, Gamma subset.eq A \( overline(bb(Q)) \)$, write $E + Gamma = { e + gamma : e in E \, med gamma in Gamma }$.

#thm([Corollary 1.3.])[
  (Finite-rank translated intersections).  #emph[Let $A$ be an abelian variety over $overline(bb(Q))$, let $Gamma subset.eq A \( overline(bb(Q)) \)$ be a subgroup satisfying 
$ dim_(bb(Q)) #scale(x: 120%, y: 120%)[\(] Gamma ⊗_(bb(Z)) bb(Q) #scale(x: 120%, y: 120%)[\)] < oo \, $

 and let $X subset.eq A$ be an irreducible closed subvariety of dimension $d$ contained in no translate of a proper algebraic subgroup of $A$. Then 
$ X \( overline(bb(Q)) \) ∩ #scale(x: 120%, y: 120%)[\(] A^(\[ d + 1 \]) \( overline(bb(Q)) \) + Gamma #scale(x: 120%, y: 120%)[\)] $

 is not Zariski dense in $X$. If $d = 1$, this intersection is finite.]
] <cor:finite-rank-translates>

This is the abelian algebraic-point case of Pink’s Conjecture 5.2 #cite(label("Pink2005")). The group $Gamma$ need not be finitely generated: torsion subgroups and division hulls of finitely generated subgroups are included. Section 10 applies Pink’s reduction #cite(label("Pink2005")) Theorem 5.3 and records where the stronger no-proper-translate hypothesis is used.

=== 1.2 Historical context <historical-context>

Zilber formulated the unlikely-intersection principle for semiabelian varieties #cite(label("Zilber2002")). Pink’s semiabelian formulation #cite(label("Pink2005")) Conjecture 5.1 specializes to the high-codimension non-density statement considered here.

The torsion-point case belongs to the Manin–Mumford theorem of Raynaud #cite(label("Raynaud1983Torsion")) p. 327, Théorème: a subvariety with dense torsion points is a torsion coset. Unlikely intersections allow the torsion points to be replaced by torsion cosets of varying positive dimensions. Even when these cosets have large codimension, their intersections can contain positive-dimensional components; the maximality condition in Theorem 1 accounts for this possibility.

For curves in powers of a CM elliptic curve, Viada proved codimension-two finiteness under the hypothesis that the curve lies in no translate of a proper algebraic subgroup #cite(label("Viada2003")) Theorem 2. Rémond and Viada removed this transversality restriction, retaining the necessary exclusion of proper algebraic subgroups #cite(label("RemondViada2003")) Theorem 1.7. Habegger and Pila proved finiteness for curves in arbitrary abelian varieties over number fields #cite(label("HabeggerPila2016")) Theorem 1.1. Barroero, Kühne and Schmidt subsequently established the corresponding curve theorem for general semiabelian varieties over number fields #cite(label("BarroeroKuhneSchmidt2023")) Theorem 1.1. More recently, Dogra and Pandit obtained bounded-degree results for smooth curves whose Jacobians surject onto the ambient abelian variety. Together with established height bounds, these give finiteness. Their local theorem gives explicit reduction bounds under good-reduction and genus hypotheses, and cardinality bounds under further restrictions on the simple isogeny factors #cite(label("DograPandit2026")) Theorem 1 and Corollary 1.

Higher-dimensional non-density was known under additional geometric or height restrictions. For positive-dimensional $X$, consider the condition

$ dim pi \( X \) = min { dim X \, dim \( A \/ B \) } #h(2em) upright("for every quotient ") pi : A arrow.r A \/ B . $

In the CM case, Rémond proved finite-rank translated non-density under this condition #cite(label("Remond2009")) Theorem 1.3; Habegger independently proved the untranslated case #cite(label("Habegger2009")) Corollary 2. Viada obtained a non-CM elliptic-power case #cite(label("Viada2009")) Theorem 1.3. Habegger and Pila established non-density under the same quotient condition for arbitrary abelian varieties #cite(label("HabeggerPila2016")) Theorem 1.3(ii). Without that condition, their Theorem 1.3(i) gives non-density at every fixed height bound when $X$ is contained in no proper torsion coset.

There were also higher-dimensional finiteness results for maximal atypical subvarieties. Habegger and Pila’s results imply finiteness of those of codimension one in $X$ #cite(label("HabeggerPila2016")) Theorem 9.14(i). For codimension-two subvarieties of powers of an elliptic curve contained in no proper torsion coset, maximal-atypical finiteness was proved in the CM case by Checcoli, Veneziano and Viada #cite(label("CheccoliVenezianoViada2014")) Corollary 1.5 and without the CM restriction by Hubschmid and Viada #cite(label("HubschmidViada2019")) Theorem 1.1. Theorem 1 treats arbitrary abelian varieties and all codimensions, without the additional quotient-dimension or height restrictions.

The geometric inputs are Ax’s analytic-subgroup theorem #cite(label("Ax1972")), in the precise analytic-subset form stated in #cite(label("HabeggerPila2016")) Theorem 5.3, and the finiteness of directions of geodesic-optimal subvarieties of a fixed parent #cite(label("HabeggerPila2016")) Proposition 6.1. Habegger and Pila explicitly attribute the latter finiteness to earlier results of Rémond #cite(label("Remond2009")) Lemma 2.6 and Proposition 3.2.

The height argument follows Vojta’s curve method #cite(label("Vojta1991")), Faltings’ extension to abelian varieties #cite(label("Faltings1991")), and Rémond’s generalized inequality #cite(label("Remond2005Vojta")). We use Dill’s version with separate height thresholds for the factors; his introduction credits Ange with the preceding extension to different projective varieties #cite(label("Dill2020")). The bounded-scale argument adapts the two-measure comparison in the Bogomolov proofs of Ullmo and Zhang #cite(label("Ullmo1998")) #cite(label("Zhang1998")), based on Szpiro–Ullmo–Zhang equidistribution #cite(label("SzpiroUllmoZhang1997")). Zhang’s account #cite(label("Zhang1998ICM")) Section 3 explicitly traces the consecutive-difference map to Faltings. The metric-variation calculation uses Yuan’s arithmetic bigness method #cite(label("Yuan2008")), in the nef adelic form of Yuan and Zhang #cite(label("YuanZhang2021")). The local weighted-index argument follows Faltings’ method, and the final cut uses his product theorem in Evertse’s explicit form #cite(label("Evertse1995Product")).

The estimates proved here keep these inputs uniform across several height scales and across auxiliary varieties with bounded fields of definition. The argument for the bounded scale compares measures only on the fixed low factor; it does not invoke an equidistribution theorem for a fixed variety as a substitute for uniformity.

=== 1.3 Proof strategy and organization <proof-strategy-and-organization>

The proof studies a hypothetical Zariski-generic sequence of high-codimension intersection points. The square roots of their Néron–Tate heights need not be comparable. Repeatedly taking a quotient of largest dimension on which the height is smaller separates the ambient variety, up to isogeny, into at most one bounded level and finitely many successively larger unbounded levels. Normalizing each level separately makes the point vectors bounded. Their algebraic subgroup relations then converge to a real-endomorphism projector that sends the normalized vectors to zero in the limit.

The auxiliary sequence theorem in Section 2 excludes the high-codimension limit just obtained. Its geometric input is uniform tangent positivity, obtained in Section 3 from Ax’s theorem and the finiteness of geodesic-optimal directions in a fixed parent variety. Projection to smaller abelian varieties handles every possible failure of this positivity.

There are two arithmetic parts. When every height level is unbounded, Section 4 applies Dill’s generalized Vojta–Rémond inequality. The relevant multiplicative constant is independent of the accuracy of a rational approximation to the limiting projector. This permits the approximation error to be made small before taking points of sufficiently large height.

A bounded level requires a different argument. Section 5 chooses auxiliary products of minimal dimension whose degrees and fields of definition are bounded. These bounds concern the varieties, while the marked points may have arbitrarily large degree. A zero-dimensional bounded factor reduces to the unbounded case. For a positive-dimensional bounded factor, Section 6 proves a uniform arithmetic intersection lower bound. The proof compares two limiting measures on that fixed factor: one from a product map and one from a consecutive difference map. The first has positive density at a suitable diagonal point; the second has zero density there. A variational argument on the changing varieties converts this disagreement into arithmetic positivity.

Small sections supplied by that positivity have a uniformly positive weighted vanishing index at the marked points (Section 7). The product theorem then yields a proper factor through a marked point. A multiplicity calculation bounds both its degree and the number of its Galois conjugates (Section 8). This contradicts minimality and completes the sequence theorem.

=== 1.4 Conventions <conventions>

We identify $macron(K)$ with $overline(bb(Q))$ and fix an embedding $overline(bb(Q)) arrow.r.hook bb(C)$. A coset without the adjective special may be translated by an arbitrary point. Its direction is the abelian subvariety being translated. All logarithmic heights and arithmetic intersection numbers are absolute, normalized by the degree of the field of definition. Constants in asymptotic estimates may depend on fixed varieties, embeddings and polarizations, but not on the sequence index unless explicitly stated. The notation $u_i asymp v_i$ means that both ratios are bounded above by positive constants.

== 2 Height scales and an auxiliary sequence theorem <sec:sequences>

The proof separates coordinates whose heights grow at different rates. We first explain the linear algebra that permits real homomorphisms to act on normalized points. We then state the sequence theorem and show that it implies Theorem 2. Its proof occupies the subsequent sections.

=== 2.1 Real homomorphisms and height norms <real-homomorphisms-and-height-norms>

For an abelian variety $G$ over $overline(bb(Q))$, choose a symmetric ample line bundle and write

$ cal(H) \( G \) = G \( overline(bb(Q)) \) ⊗_(bb(Z)) bb(R) \, #h(2em) parallel x parallel^2 = hat(h) \( x \) . $

The canonical height pairing extends to a positive-definite real quadratic form on $cal(H) \( G \)$. Indeed, every finite collection of points is defined over one number field, and the assertion on its real span is the positive definiteness of the Néron–Tate pairing on the Mordell–Weil group modulo torsion. We use the same notation for a point and its image in $cal(H) \( G \)$. In particular, torsion points have image zero. Polarizations also give Hermitian forms on the complex Lie algebras $"Lie" \( G \)$. On products we choose product polarizations and product norms. We use the standard complex uniformization, complete reducibility, finite-rank homomorphism groups and polarization adjoints recalled in #cite(label("Milne2008AV")) Chapter I, Sections 2, 10 and 14. Canonical metrics and heights are taken with the multiplication normalization of #cite(label("Zhang1995")) Theorem 2.2.

#thm([Lemma 2.1.])[
  (Real homomorphism calculus).  #emph[Let $G \, G'$ be abelian varieties over $overline(bb(Q))$ with the preceding choices. Every element of $"Hom" \( G \, G' \)_(bb(R)) = "Hom" \( G \, G' \) ⊗_(bb(Z)) bb(R)$ acts on both $"Lie" \( G \)$ and $cal(H) \( G \)$. The Lie action is faithful. Convergence in this finite-dimensional real homomorphism space implies operator-norm convergence on the height spaces.]
  #emph[The polarization adjoint of a real homomorphism is a real homomorphism. Its kernel and image in the Lie algebras have orthogonal projectors in the corresponding real endomorphism algebras, and it has a generalized inverse in the opposite real homomorphism space. In particular, if $f$ is fixed and $parallel f \( x_i \) parallel arrow.r 0$, then 
$ parallel P_(\( ker f \)^perp) \( x_i \) parallel arrow.r 0 . $

]
] <lemma:real-calculus>

#proof[
  Fix integral homomorphisms $f_1 \, dots.h \, f_b$ forming a real basis of $"Hom" \( G \, G' \)_(bb(R))$. For each $j$, ample domination of $f_j^(*) L'$ by a power of $L$ gives $hat(h)_(L') \( f_j \( x \) \) lt.eq C_j hat(h)_L \( x \)$ for all algebraic points $x$. The same inequality holds on $cal(H) \( G \)$, by its quadratic-form interpretation on every finite-dimensional span. Hence
  $ ∥sum_j t_j f_j \( x \)∥ lt.eq (sum_j \| t_j \| sqrt(C_j)) parallel x parallel . $
  The constants are independent of the fields of definition of the points. This proves the assertion about operator norms.
  The underlying real Lie representation identifies with the real extension of the representation on rational homology. It is faithful, also after scalar extension from $bb(Q)$ to $bb(R)$. The polarization adjoint belongs to rational homomorphisms, and therefore extends to real homomorphisms. For a real homomorphism $f$, the operator $f^(*) f$ is nonnegative and self-adjoint on $"Lie" \( G \)$. Choose a real polynomial $p$ that is zero at zero and equals $1 \/ t$ at every positive eigenvalue $t$ of $f^(*) f$. Then
  $ f^dagger = p \( f^(*) f \) f^(*) $
  is a real homomorphism and $f^dagger f = P_(\( ker f \)^perp)$, $f f^dagger = P_("im" f)$. Faithfulness makes these identities identities of real homomorphisms, so they also hold on the height spaces. The last assertion follows by applying the fixed bounded operator $f^dagger$. ◻
]

In particular, the image of any real homomorphism into $G$ is the image of a real idempotent endomorphism of $G$. Images, inverse images, and intersections of finitely many such Lie subspaces can therefore be handled by real homomorphisms. These subspaces need not be Lie algebras of abelian subvarieties.

=== 2.2 The sequence theorem <the-sequence-theorem>

Local fiber dimension at a point always means the maximum of the dimensions of the irreducible components of the fiber through that point. This convention matters when a marked point is singular.

The fiber bounds in the sequence theorem record the dimension contributed by each height level. Let $W_1 \, W_2$ be abelian varieties. Consider an irreducible $X subset.eq W_1 times W_2$, points $\( p_(i 1) \, p_(i 2) \) in X$, and scales $H_(i ell) gt.eq 1$ with $parallel p_(i ell) parallel = O \( sqrt(H_(i ell)) \)$ and $H_(i 1) \/ H_(i 2) arrow.r 0$. Retain the first coordinate when forming the second ambient factor:

$ A_1 = W_1 \, & Y_1 = "pr"_1 \( X \) \, & m_1 = dim Y_1 \,\
A_2 = W_1 times W_2 \, & Y_2 = X \, & m_2 = dim X - dim Y_1 . $

The distinguished subgroups are $W_1 subset.eq A_1$ and ${ 0 } times W_2 subset.eq A_2$. The integers $m_1 \, m_2$ are the generic dimensions of the corresponding fibers, and $m_1 + m_2 = dim X$. The copied coordinate $p_(i 1) \/ sqrt(H_(i 2))$ tends to zero, so it disappears after normalization at the second scale. In the reduction below, genericity of the sequence ensures that the marked points eventually have these fiber dimensions. The following definition allows arbitrary pairs $W_ell subset.eq A_ell$, accommodating both this construction with any number of levels and the quotients used in Section 3.

#prodef([Definition 2.2.])[
  (Sequence data).  Let $I$ be the ordered list $1 \, dots.h \, s$, possibly preceded by $0$. The list is nonempty; if $0$ occurs, $s$ may be zero. For each $ell in I$, fix an abelian variety $A_ell$ over $overline(bb(Q))$, a nonzero abelian subvariety $W_ell subset.eq A_ell$, an irreducible subvariety $Y_ell subset.eq A_ell$, and an integer $m_ell gt.eq 0$. Put
  $ cal(A) = product_(ell in I) A_ell \, #h(2em) W = product_(ell in I) W_ell \, #h(2em) D_ell = A_ell \/ W_ell . $
  For positive integers $i$, let $y_(i ell) in Y_ell \( overline(bb(Q)) \)$ and $H_(i ell) gt.eq 1$ satisfy
  #[#set math.equation(numbering: n => "(2.1)")
   $ dim_(y_(i ell)) #scale(x: 120%, y: 120%)[\(] Y_ell ∩ \( y_(i ell) + W_ell \) #scale(x: 120%, y: 120%)[\)] lt.eq m_ell \, #h(2em) parallel y_(i ell) parallel = O \( sqrt(H_(i ell)) \) . $ <eq:sequence-fibers>]
  For consecutive indices $ell \, ell'$ in $I$, require $H_(i ell) \/ H_(i ell') arrow.r 0$.
  The factors $ell gt.eq 1$ are called high factors. They satisfy $H_(i ell) arrow.r oo$, and, for every fixed homomorphism $g : A_ell arrow.r G$ to an abelian variety whose restriction to $W_ell$ is nonzero,
  #[#set math.equation(numbering: n => "(2.2)")
   $ liminf_(i arrow.r oo) frac(parallel g \( y_(i ell) \) parallel, sqrt(H_(i ell))) > 0 . $ <eq:sequence-nondegenerate>]
  If the index $0$ occurs, it is called the low factor and satisfies $W_0 = A_0$, $H_(i 0) = 1$. Its points eventually avoid each fixed proper torsion coset of $A_0$.
] <def:sequence-data>

The homomorphism in (2.2) is integral; the condition is equivalently unchanged by allowing rational homomorphisms. Its positive lower bound may depend on $g$. No bound on the degrees of the marked points is assumed.

#thm([Theorem 2.3.])[
  (Auxiliary sequence theorem).  #emph[For sequence data as in Definition 5, let $V subset.eq "Lie" \( W \)$ be the image of an idempotent in $"End" \( cal(A) \)_(bb(R))$. Let $Phi$ be the orthogonal projector with kernel $V$, and put 
$ q_i = \( y_(i ell) \/ sqrt(H_(i ell)) \)_(ell in I) in cal(H) \( cal(A) \) . $

 The following two conditions cannot both hold: 
#[#set math.equation(numbering: n => "(2.3)")
 $ "codim"_("Lie" \( W \)) V > sum_(ell in I) m_ell \, #h(2em) parallel Phi \( q_i \) parallel arrow.r 0 . $ <eq:forbidden-sequence>]

]
] <thm:sequence>

We will first prove this theorem for all-high data in every dimension. We then treat data with a low factor. At each stage, a hypothetical counterexample of least $dim cal(A)$ gives the geometric exclusion proved in Section 3. The order of these two stages permits a projection that removes the low factor.

=== 2.3 Decomposing a sequence into height scales <decomposing-a-sequence-into-height-scales>

#thm([Lemma 2.4.])[
  (Height decomposition).  #emph[Let $A$ be a nonzero abelian variety and $x_i in A \( overline(bb(Q)) \)$. After passing to a subsequence, there is an isogeny 
$ alpha : A arrow.r product_(ell in I) W_ell $

 with nonzero factors, and scales $H_(i ell) gt.eq 1$, such that the coordinates $p_(i ell)$ of $alpha \( x_i \)$ have norms $O \( sqrt(H_(i ell)) \)$ and successive scale ratios tend to zero. There is at most one bounded scale, placed first and equal to one. Every other scale tends to infinity and satisfies (2.2) with $A_ell = W_ell$ for every fixed nonzero homomorphism on $W_ell$.]
] <lemma:height-decomposition>

#proof[
  If the point heights are bounded, use $A$ itself as the bounded factor. Otherwise take a subsequence with $H_i = parallel x_i parallel^2 arrow.r oo$. Among fixed quotient homomorphisms $pi : A arrow.r Q$ for which $parallel pi \( x_i \) parallel^2 = o \( H_i \)$ on some subsequence, choose one with maximal $dim Q$, and restrict to that subsequence. The zero quotient is allowed. A quotient of dimension $dim A$ is an isogeny and cannot have this property, by height comparison. Poincaré reducibility provides an isogeny $A arrow.r Q times W'$ whose first component is $pi$; harmless fixed isogenies of the targets can be absorbed here.
  Write $p'_i$ for the $W'$ coordinate. Suppose a fixed nonzero homomorphism $g$ on $W'$ satisfies
  $ liminf_(i arrow.r oo) frac(parallel g \( p'_i \) parallel, sqrt(H_i)) = 0 . $
  Take a further subsequence on which this ratio tends to zero. The homomorphism whose coordinates are $pi$ and $g$ on the complementary factor has image of dimension $dim Q + dim g \( W' \) > dim Q$, and its point heights are $o \( H_i \)$. Quotienting by the identity component of its kernel changes its image only by an isogeny. This contradicts the maximality of $Q$. Thus $W'$ is a high factor with scale $H_i$ and the required nondegeneracy for every fixed homomorphism.
  If $Q = 0$, stop. Otherwise continue on $Q$ with the points $pi \( x_i \)$. If their heights are bounded, this is the low factor; if not, extract a diverging scale and repeat. At each step the remaining quotient has smaller dimension and its squared heights are little-oh of the preceding scale. The process therefore terminates. Reverse the order of the extracted factors, so that the scales are increasing. Composing the finitely many fixed isogenies gives $alpha$. Fixed height comparisons preserve all the asserted bounds and ratios. ◻
]

#thm([Proposition 2.5.])[
  #emph[The auxiliary sequence theorem implies Theorem 2 for every abelian variety over $overline(bb(Q))$.]
] <prop:sequence-implies-nondensity>

#proof[
  Let $X subset.eq A$ be irreducible and contained in no proper torsion coset. If $dim A = 0$, there are no torsion cosets of codimension $dim X + 1$, so there is nothing to prove. Suppose otherwise that $X ∩ A^(\[ dim X + 1 \])$ is Zariski dense. Since $overline(bb(Q))$ is countable, choose a sequence in this intersection that eventually avoids every fixed proper closed subset of $X$ defined over $overline(bb(Q))$. Apply Lemma 7 and replace $A \, X$ and the sequence by their isogeny images. Dimensions of subvarieties and codimensions of torsion cosets are preserved by this finite map. Its image $X$ is still contained in no proper torsion coset. We have now written $A = product_(ell in I) W_ell$ and $x_i = \( p_(i ell) \)_ell$.
  For each $i$, choose a torsion coset $B_i + tau_i$ containing $x_i$ with $"codim"_A B_i > dim X$. After extraction its codimension is constant. In $"Lie" \( A \)$ let
  $ U_i = "diag" \( H_(i ell)^(- 1 \/ 2) \) "Lie" \( B_i \) . $
  The orthogonal projector $P_i$ onto $U_i$ is a real endomorphism by Lemma 4, applied to the scaled subgroup inclusion. All these projectors have the same rank. A subsequence converges to an orthogonal projector $P$ of the same rank. Moreover $P in "End" \( A \)_(bb(R))$, because this finite-dimensional subspace is closed in the space of real linear maps on $"Lie" \( A \)$. Put $U = "im" P$. Then
  #[#set math.equation(numbering: n => "(2.4)")
   $ "codim"_("Lie" \( A \)) U > dim X \, #h(2em) ∥\( 1 - P \) \( p_(i ell) \/ sqrt(H_(i ell)) \)_ell∥ arrow.r 0 . $ <eq:initial-limit-projector>]
  For the second assertion, torsion vanishes in the height space, so $1 - P_i$ kills the indicated normalized vector exactly. Those vectors are bounded, and Lemma 4 converts convergence of the projectors into degree-independent operator-norm convergence.
  To obtain the local fiber bounds in the sequence theorem, we retain copies of all slower coordinates. For each $ell in I$ set
  $ A_ell = product_(h lt.eq ell) W_h \, #h(2em) Y_ell = "pr"_(lt.eq ell) \( X \) \, #h(2em) y_(i ell) = \( p_(i h) \)_(h lt.eq ell) . $
  Regard $W_ell$ as the last coordinate in $A_ell$. Let $m_ell = dim Y_ell - dim Y_(ell^(-))$, where $Y_(ell^(-))$ is the preceding projection and is a point for the first index. These integers are nonnegative and sum to $dim X$. The local dimension of the fiber of $Y_ell arrow.r Y_(ell^(-))$ equals $m_ell$ on a nonempty open subset. The sequence eventually lies in that subset: the inverse image in $X$ of its complement is a fixed proper closed set. Thus (2.1) holds after discarding finitely many terms.
  For a high factor, every slower coordinate is $o \( sqrt(H_(i ell)) \)$ in norm. A fixed homomorphism on $A_ell$ nonzero on its last $W_ell$ coordinate is the sum of a nonzero homomorphism on that coordinate and fixed homomorphisms on the slower ones. The triangle inequality and Lemma 7 prove (2.2). If a low factor occurs, its image of $X$ is contained in no proper torsion coset: the inverse image of such a coset is a finite union of proper torsion cosets, one of which would contain irreducible $X$. The same pullback argument proves eventual avoidance for the low sequence.
  Finally let $j : A arrow.r cal(A)$ insert each $W_ell$ into the distinguished last coordinate of $A_ell$, and let $rho : cal(A) arrow.r A$ be the coordinate retraction. Put $V = j \( U \)$. Since $rho j = 1$, the real endomorphism $j P rho$ is idempotent with image $V$, and
  $ "codim"_("Lie" \( W \)) V = "codim"_("Lie" \( A \)) U > dim X = sum_ell m_ell . $
  Write $q_i^0 = \( p_(i ell) \/ sqrt(H_(i ell)) \)_ell$ for the normalized vector before enlargement, and $q_i$ for the enlarged vector in Theorem 6. Their difference has only copied slower coordinates. With product norms,
  $ parallel q_i - j q_i^0 parallel^2 = sum_ell sum_(h < ell) frac(parallel p_(i h) parallel^2, H_(i ell)) = O #h(-0.16667em) (sum_ell sum_(h < ell) H_(i h) / H_(i ell)) arrow.r 0 . $
  If $Phi$ is the complementary projector for $V$, then $Phi j = Phi j \( 1 - P \)$. Equation (2.4) and the displayed error bound therefore give $parallel Phi q_i parallel arrow.r 0$. We have constructed (2.3), a contradiction to Theorem 6. ◻
]

== 3 Projection and tangent positivity <sec:tangent>

The sequence theorem will be proved by two inductions: first for all-high data, and then for data with a low factor. In a counterexample of least ambient dimension, quotienting by a product of abelian subvarieties must fail to preserve the strict codimension inequality. We express this obstruction precisely and use it to prove two positivity statements for every subproduct through the marked points. The first statement will feed the height inequality; the second will distinguish measures in the bounded-height argument.

=== 3.1 Quotients of minimal counterexamples <quotients-of-minimal-counterexamples>

#thm([Lemma 3.1.])[
  (Projection exclusion).  #emph[Suppose that sequence data as in Definition 5, together with $V$ and $Phi$ as in Theorem 6, satisfy (2.3) and have least $dim cal(A)$ among counterexamples with the same presence or absence of a low factor. If a low factor occurs, assume also that Theorem 6 has already been proved for all-high data in every dimension. There do not exist fixed abelian subvarieties $C_ell subset.eq A_ell$, with $C = product_ell C_ell eq.not 0$, and nonnegative integers $a_ell$ such that, on an infinite subsequence, 
#[#set math.equation(numbering: n => "(3.1)")
 $ dim_(y_(i ell)) #scale(x: 120%, y: 120%)[\(] Y_ell ∩ \( y_(i ell) + C_ell \) #scale(x: 120%, y: 120%)[\)] gt.eq a_ell quad \( ell in I \) \, #h(2em) sum_ell a_ell gt.eq "rank" \( Phi \|_("Lie" \( C \)) \) . $ <eq:projection-obstruction>]

]
] <lemma:projection>

#proof[
  Suppose such subvarieties and integers exist and restrict to the given subsequence. Let $pi_ell : A_ell arrow.r A'_ell = A_ell \/ C_ell$ be the quotient, let $W'_ell = pi_ell \( W_ell \)$, and let $e_ell$ be the dimension of the image of $C_ell$ in $D_ell = A_ell \/ W_ell$. We first construct fixed irreducible parents $Y'_ell subset.eq A'_ell$ for the projected points with local $W'_ell$-fiber bounds
  #[#set math.equation(numbering: n => "(3.2)")
   $ m'_ell = m_ell + e_ell - a_ell . $ <eq:projected-fiber-bound>]
  Fix one factor and temporarily omit its index. In $Y$ let $S$ be the intersection of the open locus where local fiber dimension over $A \/ W$ is at most $m$ and the closed locus where local fiber dimension over $A \/ C$ is at least $a$. Local fiber dimension is upper semicontinuous, so $S$ is locally closed and contains every marked point under consideration. Every nonempty fiber of $S arrow.r A \/ C$ has dimension at least $a$. Indeed, through each of its points there is an irreducible component of the original $C$-fiber of dimension at least $a$. That whole component belongs to the closed high-fiber locus, and its intersection with the open low-fiber locus is a nonempty open subset of the same dimension.
  Put $E = A \/ \( W + C \) = A' \/ W'$. The map from a fiber of $S arrow.r E$ to $A \/ W$ has image in an $e$-dimensional coset, and all of its nonempty fibers have dimension at most $m$. Consequently every fiber of $S arrow.r E$ has dimension at most $m + e$. Let $Q$ be the constructible image of $S$ in $A'$. The fibers of $S arrow.r Q$ have dimension at least $a$, so the dimension inequality for fibers, applied over every point $t in E$, gives
  $ dim Q_t lt.eq m + e - a . $
  This can also be seen by applying the fiber dimension theorem to each irreducible locally closed stratum of $Q_t$: one of the finitely many strata in its inverse image dominates it with generic fiber dimension at least $a$. In particular $m + e - a gt.eq 0$ when a marked point exists.
  Partition $Q$ into finitely many irreducible locally closed subsets. After taking a subsequence, the projected points lie in one such subset $Q^compose$. Set $Y' = overline(Q^compose)$. Because $Q^compose$ is open in its closure, its local germ at any of the selected points equals the germ of $Y'$. The local fiber dimension of $Y' arrow.r E$ at that point is therefore at most $m + e - a$. Performing this construction in each of the finitely many factors, with successive subsequences, proves (3.2). All these parents are defined over $overline(bb(Q))$.
  The new parents provide the local fiber bounds. We next check the small-projection condition and the strict codimension inequality. Let $pi = product_ell pi_ell$ and $V' = pi \( V \) subset.eq "Lie" \( W' \)$. This is the image of a real homomorphism, so Lemma 4 supplies its orthogonal projector. If $Phi'$ is the complementary projector, then
  $ Phi' pi = Phi' pi Phi \, $
  since $pi \( V \) = V'$. Thus the projected normalized points satisfy the required small-projection condition. The height upper bounds are preserved by the fixed quotient homomorphisms.
  The gain in fiber bounds compensates for the rank lost under projection:
  #[#set math.equation(numbering: n => "(3.3)")
   $ "codim"_("Lie" \( W' \)) V' & = dim W - dim C + sum_ell e_ell - dim V + dim \( V ∩ "Lie" \( C \) \)\
 & = "codim"_("Lie" \( W \)) V + sum_ell e_ell - "rank" \( Phi \|_("Lie" \( C \)) \)\
 & > sum_ell \( m_ell + e_ell - a_ell \) = sum_ell m'_ell . $ <eq:projection-codimension>]
  Here $dim \( W ∩ C \) = dim C - sum e_ell$ and $ker \( Phi \|_("Lie" \( C \)) \) = V ∩ "Lie" \( C \)$.
  It remains to obtain nonzero distinguished factors and check the scale conditions. Discard each factor with $W'_ell = 0$. In such a factor $V'$ has zero coordinate, so deletion does not change the codimension inside $"Lie" \( W' \)$ and only decreases the sum of the nonnegative bounds $m'_ell$. The small-projection condition on the remaining product follows by composition with its coordinate projection. At least one factor survives, since otherwise (3.3) would say that zero is strictly greater than a sum of nonnegative integers. The scales on the remaining ordered list still have successive ratios tending to zero. For a surviving high factor, a homomorphism nonzero on $W'_ell$ composes with $pi_ell$ to one nonzero on $W_ell$, proving (2.2). If the low factor survives, then $W'_0 = A'_0$ and its torsion-coset avoidance follows by pulling a proper torsion coset back under $pi_0$.
  We have obtained counterexample data of smaller total ambient dimension because $C eq.not 0$. If the low factor is present both before and after projection, or absent both before and after, this contradicts minimality. If it has disappeared, it contradicts the already-established all-high case. This proves the exclusion. ◻
]

=== 3.2 A product tangent obstruction <a-product-tangent-obstruction>

Let $Z = product_(ell in I) Z_ell$ be a product of subvarieties of $product_ell A_ell$, and let $g$ be a complex linear map from its ambient Lie algebra to a Hermitian vector space with positive $\( 1 \, 1 \)$-form $omega$. Define

#[#set math.equation(numbering: n => "(3.4)")
 $ P_Z \( g \) = integral_Z \( g^(*) omega \)^(dim Z) \, $ <eq:tangent-integral>]

where the pullback is regarded as an invariant form on the ambient abelian variety. We use the usual integral over the smooth locus, or equivalently the integral on a resolution. When polarizations are involved, the invariant forms represent their first Chern classes. If $dim Z = 0$, the integral is the degree of the reduced point, hence is one. In every dimension semipositivity gives

$ P_Z \( g \) > 0 quad arrow.l.r.double quad g upright(" is injective on ") T_z Z upright(" for some smooth ") z in Z . $

For positive scalars $b_ell$ the direct-sum decomposition of a product tangent space gives

#[#set math.equation(numbering: n => "(3.5)")
 $ P_Z #scale(x: 120%, y: 120%)[\(] g "diag" \( b_ell \) #scale(x: 120%, y: 120%)[\)] = (product_ell b_ell^(2 dim Z_ell)) P_Z \( g \) . $ <eq:product-scaling>]

Indeed each factor scaling acts on the complex determinant of its tangent space by $b_ell^(dim Z_ell)$, and the associated real top form acquires the square of its absolute value. The same formula holds for nonzero complex scalars with $\| b_ell \|$ in place of $b_ell$.

For a subvariety $D$ of a complex abelian variety, its #emph[geodesic closure] $chevron.l D chevron.r_(upright("geo"))$ is the smallest coset of an abelian subvariety containing $D$. The translating point need not be torsion. We will use Ax’s theorem to turn failure of tangent injectivity into a product direction having large fibers.

#thm([Lemma 3.2.])[
  (Product tangent obstruction).  #emph[Let $A_ell$, $ell in I$, be complex abelian varieties, let $Z_ell subset.eq A_ell$ be subvarieties, and put $Z = product_(ell in I) Z_ell$ and $A = product_(ell in I) A_ell$. Let $g : "Lie" \( A \) arrow.r E$ be a complex linear map to a Hermitian vector space. If $P_Z \( g \) = 0$, there are abelian subvarieties $C_ell subset.eq A_ell$ such that, for every $z = \( z_ell \)_ell in Z$, 
#[#set math.equation(numbering: n => "(3.6)")
 $ sum_(ell in I) dim_(z_ell) #scale(x: 120%, y: 120%)[\(] Z_ell ∩ \( z_ell + C_ell \) #scale(x: 120%, y: 120%)[\)] > "rank" (g \|_(xor.big_(ell in I) "Lie" \( C_ell \))) . $ <eq:ax-product-obstruction>]

 In particular, $product_ell C_ell$ is nonzero.]
] <lem:ax-product>

#proof[
  We will replace the subgroup supplied by Ax’s theorem by a product subgroup. The degeneration used for this replacement cannot decrease the tangent-intersection dimension. Its $g$-rank must also be bounded by the rank appearing in Ax’s inequality. We arrange this comparison first by choosing factor scalings that maximize the rank on every abelian subgroup; only then do we apply Ax’s theorem.
  Write $D \( lambda \) = "diag" \( lambda_ell \)$ for $lambda in \( bb(C)^times \)^I$. For every abelian subvariety $B subset.eq A$, the rank of $g D \( lambda \) \|_("Lie" \( B \))$ attains its maximum on a nonempty Zariski open subset of $\( bb(C)^times \)^I$. There are only countably many abelian subvarieties of $A$: their rational homology groups determine distinct rational subspaces of $H_1 \( A \, bb(Q) \)$. The Baire category theorem therefore gives one $lambda$ at which all these ranks are maximal. Fix such a $lambda$ and set $h = g D \( lambda \)$.
  At a smooth point of $Z$, its tangent space is the direct sum of the tangent spaces of its factors. It is consequently preserved by $D \( lambda \)$. The failure of tangent injectivity for $g$, which is equivalent to $P_Z \( g \) = 0$, thus also holds for $h$ at every smooth point. This is the same product property underlying (3.5).
  Choose a very general smooth point $z in Z$. We require that the rank of $h$ on $T_z Z$ be maximal, and that, for every abelian product subgroup $C subset.eq A$, the differential of $Z arrow.r A \/ C$ have its generic rank at $z$. These requirements exclude only countably many proper closed subsets of $Z$, so they can be imposed simultaneously. On a sufficiently small logarithmic chart around $z$, the map obtained by applying $h$ to the logarithm has constant rank less than $dim Z$. Its fiber through $z$ therefore has a positive-dimensional irreducible analytic germ. Let $J$ be a sufficiently small irreducible representative in the logarithmic chart, let $U_1$ be the Zariski closure of $exp \( J \)$, and let $z + C^(*)$ be the smallest coset containing $U_1$. Writing $tilde(z)$ for the logarithm of $z$, we have
  $ J subset.eq tilde(z) + #scale(x: 120%, y: 120%)[\(] "Lie" \( C^(*) \) ∩ ker h #scale(x: 120%, y: 120%)[\)] . $
  We use Ax’s theorem #cite(label("Ax1972")), in the precise analytic-subset formulation #cite(label("HabeggerPila2016")) Theorem 5.3. If an irreducible analytic subset $K$ of an open subset of a translate of a complex vector space $U$ has exponential image with Zariski closure $B$, that theorem gives
  $ dim chevron.l B chevron.r_(upright("geo")) - dim B lt.eq dim U - dim K \, $
  where $chevron.l B chevron.r_(upright("geo"))$ denotes the smallest abelian coset containing $B$. Applied to $J$ and $U = "Lie" \( C^(*) \) ∩ ker h$, it gives
  $ dim U_1 gt.eq "rank" #scale(x: 120%, y: 120%)[\(] h \|_("Lie" \( C^(*) \)) #scale(x: 120%, y: 120%)[\)] + dim J > "rank" #scale(x: 120%, y: 120%)[\(] h \|_("Lie" \( C^(*) \)) #scale(x: 120%, y: 120%)[\)] . $
  Since $U_1 subset.eq Z ∩ \( z + C^(*) \)$ contains $z$, the Zariski tangent space at $z$ gives
  #[#set math.equation(numbering: n => "(3.7)")
   $ dim #scale(x: 120%, y: 120%)[\(] T_z Z ∩ "Lie" \( C^(*) \) #scale(x: 120%, y: 120%)[\)] gt.eq dim U_1 > "rank" #scale(x: 120%, y: 120%)[\(] h \|_("Lie" \( C^(*) \)) #scale(x: 120%, y: 120%)[\)] . $ <eq:ax-tangent-before-degeneration>]
  No smoothness assumption on $U_1$ at $z$ is needed for this inequality.
  We now replace $C^(*)$ by a product direction. Order the index set $I$ and choose strictly increasing integers $w_ell$. Put $S = "Lie" \( C^(*) \)$ and $F_ell = xor.big_(j gt.eq ell) "Lie" \( A_j \)$. A basis of $S$ adapted to the filtration $S ∩ F_ell$ shows that the Grassmannian limit
  $ S_0 = lim_(t arrow.r 0) "diag" \( t^(w_ell) \) S = xor.big_(ell in I) "pr"_ell \( S ∩ F_ell \) $
  exists. Indeed, after dividing an adapted basis vector by the power of $t$ corresponding to its first nonzero coordinate, its limit is the projection to that coordinate. Each summand is the Lie algebra of an abelian subvariety $C_ell subset.eq A_ell$: take the identity component of the intersection of $C^(*)$ with the product subgroup corresponding to $F_ell$, and project to $A_ell$.
  The product tangent space $T_z Z$ is preserved by all the displayed diagonal scalings. Upper semicontinuity of intersection dimension on the Grassmannian therefore gives
  $ dim \( T_z Z ∩ S_0 \) gt.eq dim \( T_z Z ∩ S \) . $
  Set $R = "rank" \( h \|_S \)$. By the choice of $lambda$, for every $t eq.not 0$,
  $ "rank" (g \|_("diag" \( t^(w_ell) \) S)) = "rank" #scale(x: 120%, y: 120%)[\(] g "diag" \( t^(w_ell) \) \|_S #scale(x: 120%, y: 120%)[\)] lt.eq R . $
  The condition that the restriction of a fixed linear map have rank at most $R$ is closed on the Grassmannian. Hence $"rank" \( g \|_(S_0) \) lt.eq R$. Together with (3.7), this proves
  $ dim (T_z Z ∩ xor.big_ell "Lie" \( C_ell \)) > "rank" (g \|_(xor.big_ell "Lie" \( C_ell \))) . $
  By the choice of $z$, the dimension on the left is the generic fiber dimension of $Z arrow.r A \/ product_ell C_ell$. Local fiber dimension at every point is at least this generic value. Since both $Z$ and the subgroup are products, local fiber dimensions add over the factors. This proves (3.6) for every point of $Z$. ◻
]

=== 3.3 Finite directions in fixed parents <finite-directions-in-fixed-parents>

We next explain why the subgroup directions obtained from this lemma can be chosen from finite sets when the varieties $Z_ell$ vary inside fixed parents. For a subvariety $D$ of an abelian variety, put

$ delta_(upright("geo")) \( D \) = dim chevron.l D chevron.r_(upright("geo")) - dim D . $

A subvariety $D subset.eq Y$ is #emph[geodesic-optimal in $Y$] if every proper enlargement $D subset.neq E subset.eq Y$ has $delta_(upright("geo")) \( E \) > delta_(upright("geo")) \( D \)$.

#thm([Lemma 3.3.])[
  (Finite directions for local rank inequalities).  #emph[Fix subvarieties $Y_ell subset.eq A_ell$ of complex abelian varieties. For each $ell$, there is a finite set $cal(H)_ell$ of abelian subvarieties of $A_ell$ with the following property. Suppose that $y_ell in Z_ell subset.eq Y_ell$, that $C_ell subset.eq A_ell$ are abelian subvarieties, and that $g : xor.big_ell "Lie" \( A_ell \) arrow.r E$ is complex linear. Put 
$ d_ell = dim_(y_ell) #scale(x: 120%, y: 120%)[\(] Z_ell ∩ \( y_ell + C_ell \) #scale(x: 120%, y: 120%)[\)] . $

 If $epsilon in { 0 \, 1 }$ and 
$ sum_ell d_ell gt.eq "rank" (g \|_(xor.big_ell "Lie" \( C_ell \))) + epsilon \, $

 there are $H_ell in cal(H)_ell$ such that 
#[#set math.equation(numbering: n => "(3.8)")
 $ sum_ell dim_(y_ell) #scale(x: 120%, y: 120%)[\(] Y_ell ∩ \( y_ell + H_ell \) #scale(x: 120%, y: 120%)[\)] gt.eq "rank" (g \|_(xor.big_ell "Lie" \( H_ell \))) + epsilon . $ <eq:fixed-parent-rank>]

 If $sum_ell d_ell > 0$, the product $product_ell H_ell$ is nonzero.]
] <lem:finite-directions>

#proof[
  Choose an irreducible component $D_ell$ of $Z_ell ∩ \( y_ell + C_ell \)$ through $y_ell$ of dimension $d_ell$. Write its smallest containing coset as $y_ell + B_ell$; then $B_ell subset.eq C_ell$. Among the subvarieties of $Y_ell$ containing $D_ell$ and having geodesic defect at most $delta_(upright("geo")) \( D_ell \)$, choose one, denoted $E_ell$, of maximum dimension. Such a choice is possible because $D_ell$ is an admissible choice and dimensions are bounded integers. It is geodesic-optimal: a proper enlargement of no greater defect would contradict its choice.
  Write $chevron.l E_ell chevron.r_(upright("geo")) = y_ell + H_ell$. The inclusion $D_ell subset.eq E_ell$ implies $B_ell subset.eq H_ell$. The defect comparison gives
  $ dim H_ell - dim B_ell lt.eq dim E_ell - d_ell . $
  Rank increases by at most the dimension added to the domain. Therefore
  $ "rank" (g \|_(xor.big_ell "Lie" \( H_ell \))) & lt.eq "rank" (g \|_(xor.big_ell "Lie" \( B_ell \))) + sum_ell \( dim H_ell - dim B_ell \)\
 & lt.eq "rank" (g \|_(xor.big_ell "Lie" \( C_ell \))) + sum_ell \( dim E_ell - d_ell \)\
 & lt.eq sum_ell dim E_ell - epsilon . $
  Since $E_ell subset.eq Y_ell ∩ \( y_ell + H_ell \)$ contains $y_ell$, this implies (3.8). Moreover, a positive-dimensional $D_ell$ forces $H_ell eq.not 0$.
  By #cite(label("HabeggerPila2016")) Proposition 6.1, the directions of the geodesic closures of geodesic-optimal subvarieties of a fixed $Y_ell$ belong to a finite set. Take this set as $cal(H)_ell$. The cited proposition applies to arbitrary subvarieties of complex abelian varieties and imposes no condition on the translating points. Thus the sets are independent of $y_ell$, $Z_ell$, $C_ell$, and $g$. ◻
]

=== 3.4 Uniform positivity for the sequence <uniform-positivity-for-the-sequence>

We now return to sequence data over $overline(bb(Q))$. All abelian subgroup directions produced by the preceding complex arguments are defined over $overline(bb(Q))$. Indeed, an abelian subvariety of the complexification of an abelian variety over $overline(bb(Q))$ is the image of a rational endomorphism, by complete reducibility, and homomorphisms of abelian varieties are unchanged by algebraically closed field extension. Thus these directions are eligible for Lemma 9.

The finite sets in Lemma 11 let us replace directions depending on the marked points and subproducts by one fixed direction along a subsequence. For a fixed product direction, the tuple of local fiber dimensions takes only finitely many integer values. Consequently Lemma 9 also excludes a fixed nonzero direction whose sum of local fiber dimensions is at least its $Phi$-rank for infinitely many indices: pass to a subsequence on which that tuple is constant. We use this equivalent form in the following proposition.

#thm([Proposition 3.4.])[
  (Uniform tangent positivity).  #emph[Consider fixed sequence data as in Definition 5, and let $V$ and $Phi$ be as in Theorem 6. Suppose that the conclusion of Lemma 9 excludes every fixed nonzero product $C = product_ell C_ell$ for which 
#[#set math.equation(numbering: n => "(3.9)")
 $ sum_ell dim_(y_(i ell)) #scale(x: 120%, y: 120%)[\(] Y_ell ∩ \( y_(i ell) + C_ell \) #scale(x: 120%, y: 120%)[\)] gt.eq "rank" #scale(x: 120%, y: 120%)[\(] Phi \|_("Lie" \( C \)) #scale(x: 120%, y: 120%)[\)] $ <eq:excluded-tangent-configuration>]

 holds for infinitely many $i$. Put $r = dim cal(A) + 1$, and, for a linear map $g$ on $"Lie" \( cal(A) \)$, define 
$ Delta g \( v_1 \, dots.h \, v_r \) = #scale(x: 120%, y: 120%)[\(] g \( v_2 \) - g \( v_1 \) \, dots.h \, g \( v_r \) - g \( v_(r - 1) \) #scale(x: 120%, y: 120%)[\)] . $

 Then the following assertions hold.]
  + #emph[There are a neighborhood $cal(U)$ of $Phi$ in $"End" \( cal(A) \)_(bb(R))$ and an index $i_0$ such that $P_Z \( g \) > 0$ for every $i gt.eq i_0$, every $g in cal(U)$, and every subproduct $Z = product_ell Z_ell$ with $y_(i ell) in Z_ell subset.eq Y_ell$.]
  + #emph[For every sufficiently large $i$ and every such subproduct $Z$, $P_(Z^r) \( Delta Phi \) > 0$.]
] <prop:tangent>

#proof[
  Suppose first that the first assertion fails. Choosing successively smaller neighborhoods and larger indices produces a subsequence, relabeled by $i$, maps $g_i arrow.r Phi$, and subproducts $Z_i = product_ell Z_(i ell)$ through the marked points such that $P_(Z_i) \( g_i \) = 0$. Lemma 10 gives product subgroups $C_i = product_ell C_(i ell)$ satisfying
  $ sum_ell dim_(y_(i ell)) #scale(x: 120%, y: 120%)[\(] Z_(i ell) ∩ \( y_(i ell) + C_(i ell) \) #scale(x: 120%, y: 120%)[\)] gt.eq "rank" #scale(x: 120%, y: 120%)[\(] g_i \|_("Lie" \( C_i \)) #scale(x: 120%, y: 120%)[\)] + 1 . $
  The sum on the left is positive. Apply Lemma 11 with $epsilon = 1$ and pass to a subsequence on which all the resulting directions $H_ell$ are fixed. Their product $H$ is nonzero. Passing again to a subsequence, we may also fix the integers
  $ a_ell = dim_(y_(i ell)) #scale(x: 120%, y: 120%)[\(] Y_ell ∩ \( y_(i ell) + H_ell \) #scale(x: 120%, y: 120%)[\)] . $
  They are bounded between $0$ and $dim Y_ell$. We obtain $"rank" \( g_i \|_("Lie" \( H \)) \) lt.eq sum_ell a_ell - 1$. Since a rank upper bound is closed under limits of linear maps,
  $ "rank" \( Phi \|_("Lie" \( H \)) \) lt.eq sum_ell a_ell - 1 . $
  This contradicts the assumed exclusion of (3.9).
  For the second assertion, suppose that there are arbitrarily large indices $i$ and subproducts $Z_i$ through the marked points with $P_(Z_i^r) \( Delta Phi \) = 0$. Apply Lemma 10 to the product whose factors are indexed by both $ell in I$ and $j in { 1 \, dots.h \, r }$. For a fixed $i$, suppress $i$ from the notation, write $C_j = product_ell C_(j ell)$ for the resulting subgroup in copy $j$, and set
  $ a_j = sum_ell dim_(y_(i ell)) #scale(x: 120%, y: 120%)[\(] Z_(i ell) ∩ \( y_(i ell) + C_(j ell) \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) E_j = Phi \( "Lie" \( C_j \) \) . $
  The consecutive-difference map on $xor.big_j E_j$ has kernel the diagonal copy of $⋂_j E_j$. Its rank is consequently $sum_j dim E_j - dim ⋂_j E_j$, and the lemma gives
  #[#set math.equation(numbering: n => "(3.10)")
   $ sum_(j = 1)^r a_j > sum_(j = 1)^r dim E_j - dim ⋂_(j = 1)^r E_j . $ <eq:difference-direction-deficit>]
  There is an index $j$ such that $C_j eq.not 0$ and $a_j gt.eq dim E_j$. Indeed, if some $C_j = 0$, then the intersection term vanishes and (3.10) forces a strict surplus in another copy. If all $C_j$ are nonzero and every $a_j < dim E_j$, the integral deficits sum to at least $r = dim cal(A) + 1$, whereas $dim ⋂_j E_j lt.eq dim cal(A)$, again contradicting (3.10).
  Select one such copy for each $i$. If its $a_j$ is zero for any index, then its nonzero product subgroup is contained in $ker Phi$. That one fixed subgroup satisfies (3.9) for every index, since all local fiber dimensions are nonnegative. This is impossible. Thus the selected sum is positive. Apply Lemma 11 with $g = Phi$ and $epsilon = 0$. It supplies a nonzero product direction in a fixed finite set and satisfying the parent inequality. Passing to a fixed direction along an infinite subsequence contradicts (3.9) once more. ◻
]

The first assertion supplies one neighborhood for all subproducts through the tail of marked points. Section 4 will choose a rational box inside it and derive a degree-dependent numerical lower bound for the tangent integrals. The second assertion gives positivity at the limiting consecutive-difference map. In Section 6, its numerical lower bound will follow after the auxiliary products have fixed cycle classes. Neither assertion here is a uniform positive numerical bound over all subproducts.

== 4 When every height scale diverges <sec:high>

We now prove the auxiliary sequence theorem when all its scales tend to infinity. Proposition 12 supplies positivity on every subproduct through the marked points. To use this positivity in a height inequality, we first bound the intersection numbers from below in terms of the degrees of those subproducts. The resulting bound will be uniform over a fixed neighborhood of the real projector. This uniformity lets us choose the rational approximation only after fixing the multiplicative constant in the height inequality.

=== 4.1 A uniform lower bound for intersections <a-uniform-lower-bound-for-intersections>

Fix symmetric very ample line bundles $L_ell$ on the abelian varieties $A_ell$, and a symmetric very ample line bundle $L$ on $cal(A)$. We may replace the $L_ell$ by powers so that their embeddings are projectively normal. Give $L$ its invariant Chern form $omega_L$. For an irreducible subproduct $Z = product_ell Z_ell$, write

$ d_ell = dim Z_ell \, #h(2em) d = sum_ell d_ell \, #h(2em) D_Z = product_ell deg_(L_ell) Z_ell . $

We use the function $P_Z \( g \) = integral_Z \( g^(*) omega_L \)^d$ defined in the preceding section. A zero-dimensional factor is a point over $overline(bb(Q))$; it contributes degree one and dimension zero.

#thm([Lemma 4.1.])[
  #emph[Let $cal(B)$ be a fixed closed box with rational endpoints in the coordinates of an integral basis of $"End" \( cal(A) \)$. There are positive integers $theta \, omega_1$, depending only on the fixed ambients, polarizations, and box, with the following property. For every irreducible subproduct $Z subset.eq cal(A)$ such that $P_Z$ is strictly positive everywhere on $cal(B)$, 
#[#set math.equation(numbering: n => "(4.1)")
 $ P_Z \( g \) gt.eq theta^(- 1) D_Z^(- omega_1) #h(2em) \( g in cal(B) \) . $ <eq:intersection-lower-bound>]

]
] <lemma:intersection-lower-bound>

#proof[
  Put $n = dim cal(A)$ and $q = "rank"_(bb(Z)) "End" \( cal(A) \)$, and choose an integral basis $e_1 \, dots.h \, e_q$. The polynomial
  $ p_Z \( x_1 \, dots.h \, x_q \) = P_Z (sum_(j = 1)^q x_j e_j) $
  has degree $2 d lt.eq 2 n$: pullback of a Hermitian form is quadratic in the real coordinates of the map. At integral arguments it is an integer, because it is the top intersection number of the pullback of $L$ by an actual endomorphism.
  Set $K = 2 n$. In the multivariate Newton expansion,
  $ p_Z \( x \) = sum_(\| alpha \| lt.eq K) \( Delta^alpha p_Z \) \( 0 \) product_(j = 1)^q binom(x_j, alpha_j) \, $
  all finite differences are integers. Since $product_j alpha_j !$ divides $K !$, every coefficient of $p_Z$ has denominator dividing $Q = K !$. This denominator is independent of $Z$.
  The coefficients also have absolute value at most $C D_Z$ for a fixed $C$. Indeed, on the fixed interpolation grid ${ 0 \, dots.h \, K }^q$, the semipositive forms $g^(*) omega_L$ are bounded above by a fixed multiple of $Omega = sum_ell "pr"_ell^(*) omega_(L_ell)$. Consequently
  $ 0 lt.eq p_Z \( x \) lt.eq C_0^d integral_Z Omega^d = C_0^d frac(d !, product_ell d_ell !) D_Z . $
  Fixed-grid interpolation gives the coefficient bound. There are only finitely many possible dimension tuples, so the constants are uniform. These integrations can be taken over the regular locus, and the same argument therefore includes singular subvarieties.
  Here is the real-algebraic step which turns these bounds into a lower bound for a positive minimum. Let $p_c \( x \)$ be the universal polynomial of degree at most $K$, whose coefficients form the free parameter vector $c$. Apply quantifier elimination over the real numbers to
  $ exists x thin #scale(x: 120%, y: 120%)[\(] x in cal(B) med upright("and") med t = p_c \( x \) #scale(x: 120%, y: 120%)[\)] \, $
  leaving $c$ and $t$ free. The resulting formula is a Boolean combination of sign conditions on finitely many polynomials $R_j \( c \, t \) in bb(Z) \[ c \, t \]$; denominators from the rational box have been cleared. Quantifier elimination with free variables, including its coefficient-ring formulation, is recalled in #cite(label("Basu2017")) arXiv version, Section 2.5.2, Theorem 2.27.
  Specialize to the coefficient vector $c \( Z \)$, and put $m_Z = min_(cal(B)) p_Z > 0$. At least one specialized polynomial $R_j \( c \( Z \) \, t \)$ which is not identically zero must vanish at $m_Z$. Otherwise the signs of every nonzero specialized polynomial would be constant in a neighborhood of $m_Z$, and the identically zero ones would have constant sign zero there. The formula describing the range would then be locally constant. This is impossible: it holds at $m_Z$ and fails immediately to its left.
  Let $b = max_j deg_c R_j$ and $h = max_j deg_t R_j$. Multiplication by $Q^b$ makes each specialization an integer polynomial, of degree at most $h$ and coefficient size at most $C_1 D_Z^b$. Choose a nonzero one which vanishes at $m_Z$ and remove its maximal power of $t$. Its constant coefficient is now a nonzero integer. If $m_Z lt.eq 1$, its root equation implies
  $ 1 lt.eq sum_(k = 1)^h \| a_k \| m_Z^k lt.eq h C_1 D_Z^b m_Z . $
  For $m_Z > 1$ a lower bound is immediate. Enlarging fixed integer constants gives (4.1). The case $d = 0$, where $p_Z = 1$, is included directly. ◻
]

=== 4.2 The height inequality and its constants <the-height-inequality-and-its-constants>

The height inequality follows the line of Vojta’s curve method #cite(label("Vojta1991")), Faltings’ abelian-variety method #cite(label("Faltings1991")), and Rémond’s generalized projective inequality #cite(label("Remond2005Vojta")). We use Dill’s version with separate height thresholds for the factors; his introduction credits Ange with the preceding extension to different projective varieties #cite(label("Dill2020")) Introduction. We record its precise specialization below; the independence of its multiplicative constant from coefficient heights is essential to our approximation argument. All point heights in this subsection are absolute logarithmic projective heights with the maximum norm at every place. The notation $h \( X \)$ in the following statement denotes the projective variety height with the normalization in the setup of #cite(label("Dill2020")) Theorem 1.1.

#thm([Theorem 4.2.])[
  (Dill).  #emph[Let $X_1 \, dots.h \, X_s$ be fixed irreducible positive-dimensional projective varieties over $overline(bb(Q))$, with $s gt.eq 2$, and fix embeddings $X_ell subset.eq bb(P)^(N_ell)$ given by very ample bundles $L_ell$. For positive integral weights $a_ell$, put $N_a = times.square_ell L_ell^(a_ell)$. Let $cal(M)$ be a nef bundle on $product_ell X_ell$ and $cal(P) = N_a^(t_1)$, with its full monomial coordinate system $Xi$. Suppose $cal(P) ⊗ cal(M)^(- 1)$ is generated by $J$ sections $cal(Z)$, whose images under an injection 
$ cal(P) ⊗ cal(M)^(- 1) arrow.r.hook N_a^(t_2) $

 are polynomials of multidegree $t_2 a$ with joint coefficient height at most $sum_ell a_ell delta_ell$. Assume the injection is an isomorphism on a nonempty open set $U^0$. Here $t_1 \, t_2 \, J$ are positive integers and $delta_ell gt.eq 1$.]
  #emph[Let $x = \( x_ell \) in U^0 \( overline(bb(Q)) \)$. Suppose that, for every irreducible subproduct $Z = product_ell Z_ell$ with $x_ell in Z_ell subset.eq X_ell$, 
#[#set math.equation(numbering: n => "(4.2)")
 $ \( cal(M)^(dim Z) dot.op Z \) gt.eq theta^(- 1) product_ell \( deg Z_ell \)^(- omega) a_ell^(dim Z_ell) \, $ <eq:dill-intersections>]

 where $theta gt.eq 1$ and $omega gt.eq - 1$ are integers. Put 
$ u_0 & = sum_ell dim X_ell \,\
Lambda & = theta \( 2 t_1 u_0 \)^(u_0) max_ell \( N_ell + 1 \) product_ell deg X_ell \,\
psi \( u \) & = product_(j = u + 1)^(u_0) \( \( 3 + omega \) j + 1 \) \, #h(2em) c_1 = c_2 = Lambda^(psi \( 0 \)) \,\
c_3^(\( ell \)) & = Lambda^(2 psi \( 0 \)) \( J t_2 \)^(u_0) \( h \( X_ell \) + delta_ell \) . $

 If $a_ell gt.eq c_2 a_(ell + 1)$ for $ell < s$ and $h \( x_ell \) gt.eq c_3^(\( ell \))$ for every $ell$, then 
#[#set math.equation(numbering: n => "(4.3)")
 $ sum_ell a_ell h \( x_ell \) lt.eq c_1 #scale(x: 120%, y: 120%)[\(] h \( Xi \( x \) \) - h \( cal(Z) \( x \) \) #scale(x: 120%, y: 120%)[\)] . $ <eq:dill-height>]

]
] <thm:dill-form>

This is #cite(label("Dill2020")) Theorem 1.1 with the product as its own proper model and with the identity injection $cal(P) arrow.r.hook N_a^(t_1)$. In that theorem the intersection is taken on the closure of the inverse image of $Z ∩ U^0$; here this closure is $Z$, because $Z$ is irreducible and contains $x in U^0$. The constants do not involve the complement of $U^0$. In particular, the statement can be applied to different such open sets with the same numerical parameters.

The crucial distinction is that $c_1$ depends only on the geometric data, $t_1$, $theta$, and $omega$. The number $J$ of generators, their coefficient heights, and $t_2$ enter only the height thresholds $c_3^(\( ell \))$. We will fix $c_1$ before choosing a rational approximation; the height thresholds may be fixed afterward.

=== 4.3 The all-high contradiction <the-all-high-contradiction>

#thm([Theorem 4.3.])[
  #emph[Theorem 6 holds for all-high sequence data.]
] <thm:all-high>

#proof[
  We first fix a positivity neighborhood and the constant in Dill’s inequality. For an arbitrary approximation accuracy, we then balance the height scales by integer multipliers and construct the required bundles. The final comparison will determine how small the accuracy must be.
  Suppose that all-high data violate Theorem 6, and choose a counterexample with $dim cal(A)$ minimal. The projection exclusion and Proposition 12 then apply. Every parent $Y_ell$ has positive dimension: if it were a point, the positive normalized lower bound (2.2), applied to the identity homomorphism, would contradict $H_(i ell) arrow.r oo$. Choose a closed rational box $cal(B)$ which contains $Phi$ in its interior and lies in the neighborhood supplied by Proposition 12. After discarding finitely many indices, $P_Z \( g \) > 0$ on this box for every subproduct through $y_i$ in the fixed parents. Lemma 13 gives constants $theta \, omega_1$ valid for all these products.
  If there is only one factor, use two subsequences $n_i \, m_i arrow.r oo$ with $H_(n_i) \/ H_(m_i) arrow.r 0$. They exist by choosing $H_(m_i) gt.eq i^2 H_(n_i)$. On the two copies use the maps $g xor g$ and the external product target polarization. For subvarieties $Z_1 \, Z_2$ through the corresponding points,
  $ P_(Z_1 times Z_2) \( g xor g \) = binom(dim Z_1 + dim Z_2, dim Z_1) P_(Z_1) \( g \) P_(Z_2) \( g \) . $
  Thus the required bound holds with $theta^2$ and the same $omega_1$. The block diagonal limiting projector still sends the normalized point pairs to zero. From now on there are at least two factors. In the duplicated case all approximations remain in this block diagonal family; no new minimality argument in the larger ambient is needed. We relabel the doubled data and replace $theta$ by $theta^2$ in this case, retaining the notation already introduced.
  Choose a positive integer $t_1$, fixed independently of the rational approximation, so large that
  $ t_1 sum_ell "pr"_ell^(*) omega_(L_ell) - g^(*) omega_L $
  is positive definite for every $g in cal(B)$ (or for the indicated block diagonal family). Compactness of the box makes this possible. With the parent embeddings and $theta \, omega_1 \, t_1$ fixed, Theorem 14 has a fixed multiplicative constant $c_1$.
  Let $0 < eta < 1 \/ 2$. The following construction is available for every such $eta$, with $c_1$ already fixed. Choose a rational homomorphism $f \/ e$ in the box with $parallel f \/ e - Phi parallel lt.eq eta$, where $e > 0$ is even and $f$ is an integral homomorphism divisible by two.
  We want the multiplied points in every factor to have the same height scale: $v_(i ell) sqrt(H_(i ell))$ should be close to one number $R_i$. At the same time, the multiplication maps must have polynomial formulas whose coefficient heights grow at most quadratically in $v_(i ell)$. Both requirements are met by a dyadic family. Choose an integer $N > 2 \/ eta$ and put $U = { N \, N + 1 \, dots.h \, 2 N }$. The numbers $u 2^k$, with $u in U$ and $k gt.eq 0$, approximate every real number at least $N$ to relative error at most $eta$. Taking $R_i gt.eq N max_ell sqrt(H_(i ell))$, choose
  #[#set math.equation(numbering: n => "(4.4)")
   $ v_(i ell) = u 2^k \, #h(2em) u in U \, quad k gt.eq 0 \, $ <eq:dyadic-multipliers>]
  so that
  $ 1 - eta lt.eq frac(v_(i ell) sqrt(H_(i ell)), R_i) lt.eq 1 + eta . $
  We verify the coefficient-height requirement below.
  On the ambient product set
  $ cal(Q)_0 = (times.square_ell L_ell^(t_1 e^2)) ⊗ \( f^(*) L \)^(- 1) . $
  The choice of $t_1$ makes its invariant curvature positive definite, hence makes this bundle ample #cite(label("GenestierNgo2009")) Theorem 1.1.4. Writing $e = 2 e_0$ and $f = 2 f_0$, symmetry identifies it with the fourth power of the ample bundle
  $ (times.square_ell L_ell^(t_1 e_0^2)) ⊗ \( f_0^(*) L \)^(- 1) . $
  It is therefore globally generated #cite(label("GenestierNgo2009")) Theorem 2.2.3. Fix a generating system $z_1 \, dots.h \, z_J$ for $cal(Q)_0$.
  Let $\[ v_i \]$ denote factorwise multiplication by the chosen integers, and define
  $ a_(i ell) = e^2 v_(i ell)^2 \, #h(2em) N_(a_i) = times.square_ell L_ell^(a_(i ell)) \, #h(2em) cal(M)_i = \( f compose \[ v_i \] \)^(*) L \|_(product Y_ell) \, #h(2em) cal(P)_i = N_(a_i)^(t_1) . $
  The bundle $cal(M)_i$ is nef. Symmetry identifies $cal(P)_i ⊗ cal(M)_i^(- 1)$ with $\[ v_i \]^(*) cal(Q)_0 \|_(product Y_ell)$, which is generated by the pullbacks of the $z_j$.
  Choose a coordinate section $sigma$ of the target $L$ which is nonzero at $f \( \[ v_i \] y_i \)$. Multiplication by $\( f compose \[ v_i \] \)^(*) sigma$ gives the injection
  $ cal(P)_i ⊗ cal(M)_i^(- 1) arrow.r.hook N_(a_i)^(t_1) . $
  It is an isomorphism on the nonvanishing open set of that section, which contains $y_i$. Thus we may take $t_2 = t_1$ in Theorem 14. Before pullback, each product $z_j f^(*) sigma$ is a section of $times.square_ell L_ell^(t_1 e^2)$. Projective normality of the ambient factor embeddings, together with the external-product formula for global sections, represents these sections by multihomogeneous polynomials of multidegree $\( t_1 e^2 \, dots.h \, t_1 e^2 \)$. There are only finitely many systems, one for each choice of target coordinate $sigma$.
  We next check that the dyadic choice (4.4) gives the uniform coefficient bound required by Dill. Symmetry and projective normality give polynomial coordinate systems of degree four for $\[ 2 \]$ and of degree $u^2$ for each $\[ u \]$, $u in U$. Their compositions give the required degree $v_(i ell)^2$ formulas.
  Fix a number field containing the ambient data, $f$, and the chosen generating systems. At a finite place use the maximum coefficient norm, and at an infinite place use the sum of absolute coefficient values. If $b_w \( k \)$ is the logarithm of the maximum of one and the coefficient norm after $k$ iterations of the degree-four system, submultiplicativity gives
  $ b_w \( k + 1 \) lt.eq 4 b_w \( k \) + C_w . $
  Thus $b_w \( k \) = O_w \( 4^k \)$. Composition with one of the finitely many $\[ u \]$ gives $O_w \( \( u 2^k \)^2 \)$. At finite places the constants vanish outside a fixed finite set. Substitution in the finitely many fixed systems representing $z_j f^(*) sigma$ now bounds their joint coefficient height by
  $ C_(f \, e \, U) sum_ell a_(i ell) . $
  Consequently we may fix $delta_ell = max \( 1 \, C_(f \, e \, U) \)$ for every $ell$, independently of $i$ and of the chosen nonvanishing coordinate. The generator count $J$ is also fixed. Dependence on the approximation and on $U$ changes only the height thresholds.
  For every subproduct $Z$ through $y_i$, the scaling identity for $P_Z$ and (4.1) give
  $ \( cal(M)_i^(dim Z) dot.op Z \) = P_Z \( f \/ e \) product_ell a_(i ell)^(dim Z_ell) gt.eq theta^(- 1) product_ell \( deg Z_ell \)^(- omega_1) a_(i ell)^(dim Z_ell) . $
  This verifies the last geometric hypothesis of Dill’s theorem.
  #emph[Height comparison and choice of accuracy.]
  All geometric and coefficient conditions have now been checked for each fixed $eta$. The balancing of the multipliers will make the source height large and the image height small after division by $e^2 R_i^2$.
  Let $Xi_i$ be the full monomial coordinates for $cal(P)_i$, and let $cal(Z)_i$ be the pulled-back generating system just constructed. Then
  #[#set math.equation(numbering: n => "(4.5)")
   $ h \( Xi_i \( y_i \) \) - h \( cal(Z)_i \( y_i \) \) = hat(h)_L \( f \( \[ v_i \] y_i \) \) + O_(f \, e) (1 + sum_ell a_(i ell)) . $ <eq:high-height-comparison>]
  Indeed, the monomial height is exactly $t_1 sum_ell a_(i ell) h \( y_(i ell) \)$. Multiplying all generator values by the same nonzero injection section does not change their projective height. Their height is therefore the fixed generator height of $cal(Q)_0$ at $\[ v_i \] y_i$. As $cal(Q)_0$ is symmetric, this equals
  $ t_1 sum_ell a_(i ell) hat(h)_(L_ell) \( y_(i ell) \) - hat(h)_L \( f \( \[ v_i \] y_i \) \) + O_(f \, e) \( 1 \) . $
  The bounded difference between projective and canonical heights on each fixed factor proves (4.5).
  By the high-scale condition applied to the identity, there are constants $kappa_ell > 0$, independent of the approximation, such that
  $ h \( y_(i ell) \) gt.eq kappa_ell H_(i ell) $
  for all sufficiently large $i$. The normalized vectors $q_i$ are bounded. Operator-norm comparison for real homomorphisms therefore gives a constant $C$ independent of $eta$, $f \/ e$, and the multipliers: the maps $f \/ e$ lie in the fixed box, and the balancing ratios lie in $\[ 1 \/ 2 \, 3 \/ 2 \]$. Let $D_i$ be the diagonal real endomorphism with entries $v_(i ell) sqrt(H_(i ell)) \/ R_i$. In the real height space,
  $ frac(f \( \[ v_i \] y_i \), e R_i) = \( f \/ e \) D_i q_i . $
  Writing this as the sum of $Phi q_i$, $\( f \/ e - Phi \) D_i q_i$, and $Phi \( D_i - 1 \) q_i$ gives
  #[#set math.equation(numbering: n => "(4.6)")
   $ frac(sqrt(hat(h)_L \( f \( \[ v_i \] y_i \) \)), e R_i) lt.eq C eta + o \( 1 \) . $ <eq:high-small-image>]
  For the weights, separation of successive scales gives
  $ a_(i ell) / a_(i \, ell + 1) arrow.r oo \, #h(2em) frac(sum_ell a_(i ell), e^2 R_i^2) lt.eq \( 1 + eta \)^2 sum_ell H_(i ell)^(- 1) arrow.r 0 . $
  Moreover
  #[#set math.equation(numbering: n => "(4.7)")
   $ frac(sum_ell a_(i ell) h \( y_(i ell) \), e^2 R_i^2) gt.eq \( 1 - eta \)^2 sum_ell kappa_ell gt.eq 1 / 4 sum_ell kappa_ell . $ <eq:high-large-source>]
  Once $eta$, the approximation, and $U$ are fixed, all the height thresholds in Theorem 14 are fixed. The projective heights tend to infinity and the weight ratios cross the fixed ratio threshold, so (4.3) applies for all sufficiently large $i$. Dividing it by $e^2 R_i^2$ and using (4.5)–(4.7) yields
  $ 1 / 4 sum_ell kappa_ell lt.eq c_1 C^2 eta^2 + o \( 1 \) . $
  The construction and this inequality hold for every $0 < eta < 1 \/ 2$, whereas $c_1$, $C$, and the $kappa_ell$ are independent of $eta$. Choose $eta$ so that $c_1 C^2 eta^2 < 1 / 4 sum_ell kappa_ell$. Keeping its associated $f \, e \, U$ fixed and letting $i$ tend to infinity gives the contradiction. All constants depending on this approximation enter only fixed thresholds or errors which vanish after normalization. ◻
]

== 5 Auxiliary subvarieties over fields of bounded degree <sec:minimal>

We now treat sequence data with a low factor. Assume that such data violate Theorem 6, and choose a counterexample with $dim cal(A)$ minimal. The all-high case has already been excluded by Theorem 15. Consequently the projection exclusion of Lemma 9 and the tangent positivity of Proposition 12 apply to these data.

Our next objective is to choose smaller varieties through the marked points without losing control of their equations or their fields of definition. We fix symmetric very ample line bundles $L_ell$ on $A_ell$ and the resulting projective embeddings. Write $h_ell$ for the absolute logarithmic projective height. It differs from the corresponding canonical height by a bounded amount. All fixed varieties, embeddings, polarizations and bases of homomorphism groups are defined over one number field $k$, which we enlarge to contain $sqrt(- 1)$. Constants in this section may depend on these fixed data. They do not depend on a field of definition of a marked point.

=== 5.1 Small equations without a degree bound on the point <small-equations-without-a-degree-bound-on-the-point>

#thm([Lemma 5.1.])[
  #emph[Fix integers $N \, D gt.eq 1$. Let $F$ be a number field and let $cal(S)$ be a set of points in $bb(P)^N \( overline(bb(Q)) \)$ of height at most $T$, where $T gt.eq 1$. Suppose the vector space of homogeneous degree-$D$ polynomials vanishing on $cal(S)$ is defined over $F$. This space has an $F$-basis whose coefficient heights are $O_(N \, D) \( T \)$.]
] <lemma:height-kernel>

#proof[
  Let $q = binom(N + D, D)$ and form the rows of evaluations of the degree-$D$ monomials at points of $cal(S)$. Each row is a projective vector of height at most $D T$. Select a maximal independent set of these rows; there are at most $q$ of them. Their kernel is the required polynomial space. Choose pivot columns and give the free variables their standard basis values. The resulting kernel vectors have entries which are ratios of minors of the selected matrix. The determinant height inequalities bound their coefficient heights by $O_(N \, D) \( T \)$.
  Although the rows can have entries in an extension of arbitrarily large degree, the resulting vectors lie in $F$. Indeed the kernel is $"Gal" \( overline(bb(Q)) \/ F \)$-invariant, and its normalized basis with the chosen free coordinates is unique. Each automorphism therefore fixes that basis. Both the number of rows and all height estimates are independent of their fields of definition. ◻
]

For example, if a degree-$D$ equation over $F$ vanishes at a point $y$, we apply the lemma to all conjugates of $y$ over $F$. We obtain a basis of the equations over $F$ vanishing at $y$, of height $O_D \( h \( y \) + 1 \)$. If one such equation does not vanish identically on a variety $Z$, at least one equation in this basis also does not vanish identically on $Z$.

We also need a degree bound for equations that detect smoothness.

#thm([Lemma 5.2.])[
  #emph[Let $Z subset.eq bb(P)^N$ be an irreducible projective variety of degree $D$ over an algebraically closed field of characteristic zero. At every smooth point of $Z$, the differentials of homogeneous equations of $Z$ of degree at most $D$, dehomogenized in an affine chart, span its conormal space.]
] <lemma:bounded-conormal>

#proof[
  Linear equations defining the linear span of $Z$ supply its normal directions in $bb(P)^N$. We may therefore work in that span and assume $Z$ nondegenerate. Put $d = dim Z$ and $c = N - d$. There is nothing to prove if $c = 0$, and the hypersurface equation proves the case $c = 1$.
  Suppose $c gt.eq 2$ and let $z$ be smooth. Choose a hyperplane $H$ containing the projective tangent space at $z$. Since $Z$ is nondegenerate, $H$ does not contain $Z$. The closed join of $z$ and $Z$ has dimension at most $d + 1$, and its intersection with $H$ has dimension at most $d$. A general $\( c - 2 \)$-plane $Lambda$ in $H$ therefore avoids this join and the tangent space. Projection from $Lambda$ gives a morphism
  $ pi : Z arrow.r Z' subset.eq bb(P)^(d + 1) . $
  It is finite because $pi^(*) cal(O) \( 1 \) = cal(O)_Z \( 1 \)$ is ample. It has just one point over $pi \( z \)$ and is immersive at $z$. The scheme-theoretic fiber has length one: its tangent space is zero and its residue field is the ground field. For the finite local algebra over the local ring of $Z'$ at $pi \( z \)$, Nakayama’s lemma now says that $1$ generates. Since $Z'$ is the scheme-theoretic image, the local map is an isomorphism. In particular $Z'$ is smooth at $pi \( z \)$.
  The hypersurface $Z'$ has degree at most $D$. Its equation pulls back to an equation of $Z$ whose differential at $z$ defines $H$: the inverse image of the tangent hyperplane is the span of $Lambda$ and the tangent space of $Z$, which is $H$. Varying $H$ supplies all conormal directions. ◻
]

=== 5.2 A minimal choice of subproducts <a-minimal-choice-of-subproducts>

The choice below adapts the minimal-subproduct descent of #cite(label("Remond2005Vojta")) Section 3 and #cite(label("Dill2020")) Section 2 to auxiliary varieties whose fields of definition have uniformly bounded degrees.

Call a sequence of subproducts

$ Z_i = product_(ell = 0)^s Z_(i ell) \, #h(2em) y_(i ell) in Z_(i ell) subset.eq Y_ell \, $

#emph[admissible] if the following bounds hold uniformly in $i$: the geometric degrees of its factors are bounded; all factors are geometrically integral over a field $k_i supset.eq k$ with $\[ k_i : bb(Q) \]$ bounded; and each $Z_(i ell)$ contains a Zariski dense set of algebraic points of height at most $C H_(i ell)$ for one constant $C$. We also allow passage to a subsequence in making such a choice. This definition places no condition on $\[ k_i \( y_(i ell) \) : k_i \]$.

Admissible products exist: take the fixed parents. To see the dense height condition directly, take a finite linear projection of each parent onto projective space. The inverse images of the dense set of projective points with root-of-unity coordinates have bounded height, by functoriality of heights for that fixed projection. Since $H_(i ell) gt.eq 1$, these points give the required bound.

Keep the ambient counterexample fixed. Among all admissible choices on all subsequences, minimize the sum of factor dimensions. This second minimality concerns the auxiliary products, not the ambient abelian variety. After a further extraction, write

$ d_ell = dim Z_(i ell) \, #h(2em) d = sum_(ell = 0)^s d_ell . $

#thm([Proposition 5.3.])[
  #emph[For a minimal admissible choice, the following assertions hold after discarding finitely many indices and passing to a subsequence.]
  + #emph[For every pair of positive integers $D \, B$, there is an index $i_0 \( D \, B \)$ such that, for every $i gt.eq i_0 \( D \, B \)$ and every factor $ell$, any hypersurface of degree at most $D$ defined over an extension $F_i \/ k_i$ with $\[ F_i : k_i \] lt.eq B$ which contains $y_(i ell)$ also contains $Z_(i ell)$.]
  + #emph[For each fixed degree, the equations of $Z_(i ell)$ in that degree have a $k_i$-basis of coefficient heights $O \( H_(i ell) \)$. The points $y_(i ell)$ are smooth on $Z_(i ell)$, and equations of bounded degree and height $O \( H_(i ell) \)$ span their conormal spaces.]
  + #emph[The low factor belongs to a finite set of varieties. We may therefore suppose $Z_(i 0) = Z_0$ independent of $i$.]
] <prop:minimal-products>

#proof[
  Suppose the first assertion fails for fixed $D \, B$. Choose violating hypersurfaces along an infinite subsequence, pass to a fixed factor and a fixed degree, and denote their fields by $F_i$. Lemma 16, applied to the conjugates of $y_(i ell)$ over $F_i$, replaces each equation by one of height $O \( H_(i ell) \)$ which still vanishes at the marked point and does not vanish identically on $Z_(i ell)$. Here we used the height bound in the original sequence data, rather than any bound on the degree of the marked point.
  Take a geometric irreducible component through $y_(i ell)$ of the intersection with this hypersurface. Its dimension is strictly smaller than $d_ell$, and its degree is bounded by ordinary Bézout. Its conjugates over $F_i$ are also components of this intersection. The degree bound therefore bounds the number of conjugates, and Galois descent defines the chosen component over an extension of $F_i$ of bounded degree.
  We check the dense height condition on that component. Use the standard projective adelic metrics, with Fubini–Study metrics at infinity. For effective cycles use the additive absolute arithmetic intersection degree. The normalized height of an $n$-dimensional irreducible variety is this degree divided by the product of $n + 1$ and its geometric degree. The dense height condition, the fundamental height inequality, and the bounded geometric degrees therefore bound the arithmetic degree of $Z_(i ell)$ by $O \( H_(i ell) \)$. The arithmetic divisor intersection formula bounds the arithmetic degree of its intersection with a degree-bounded polynomial by the polynomial degree times the original arithmetic degree, plus the geometric degree times the absolute weighted sum of logarithmic sup norms of that polynomial. The latter sum is at most its coefficient height plus a constant depending only on the degree and the projective space. Thus the intersection has arithmetic degree $O \( H_(i ell) \)$. Additivity and nonnegativity give the same bound for the selected component. Dividing by its positive geometric degree and dimension factor, and using the other direction of the successive minima inequality, gives a dense set of points on it of height $O \( H_(i ell) \)$; see #cite(label("Zhang1995")) Theorem 1.10, or #cite(label("YuanZhang2021")) Theorem 5.3.3 with absolute normalization. The arithmetic divisor estimate used here is the usual intersection formula for a section, equivalently the arithmetic divisor formula of #cite(label("BostGilletSoule1994")) Proposition 3.2.1(iv), Equation (3.2.2); see also the divisor identity in the proof of #cite(label("YuanZhang2021")) Corollary A.4.3. We have produced an admissible product of smaller total dimension, a contradiction.
  For the second assertion apply Lemma 16 to the dense set of bounded-height points on $Z_(i ell)$. Its evaluation kernel is the space of equations of $Z_(i ell)$, hence is defined over $k_i$. In degrees up to the bounded degree of $Z_(i ell)$, these bases span the conormal at every smooth point by Lemma 17.
  Suppose a marked point were singular for infinitely many indices. Choose an affine chart containing that point. Among the Jacobian minors of size equal to the codimension, formed from the bounded equations just obtained, some minor is nonzero generically on the variety. Every such minor vanishes at a singular point: otherwise the corresponding equations would cut out a smooth germ of the same dimension containing the germ of the reduced variety, which would itself then be smooth. Homogenizing a suitable minor gives a bounded-degree hypersurface over $k_i$ containing the marked point and not the variety. This contradicts the first assertion. The codimension-zero case has no singular points.
  Finally $H_(i 0) = 1$. The low-factor equations just constructed have bounded degrees and bounded coefficient heights over fields of bounded degree. Northcott’s theorem gives a finite set of possible coefficient vectors. The conormal assertion at a smooth point shows that each $Z_(i 0)$ is an irreducible component of a zero locus of these bounded-degree equations. There are only finitely many such zero loci and components. This proves the last assertion. ◻
]

The point of minimality is now explicit: a bounded-degree equation over a bounded-degree extension which cuts a factor properly is impossible, regardless of its original coefficient height. The remaining argument will construct exactly such an equation.

=== 5.3 Removing a zero-dimensional low factor <removing-a-zero-dimensional-low-factor>

#thm([Lemma 5.4.])[
  #emph[In a minimal admissible product for the putative low-factor counterexample, $d_0 > 0$.]
] <lemma:fixed-low-point>

#proof[
  If $d_0 = 0$, the fixed low variety is a point $p$, so $y_(i 0) = p$ for every $i$. Eventual avoidance implies that $p$ lies in no proper torsion coset of $A_0$.
  First $V$ projects onto $"Lie" \( A_0 \)$. Otherwise let $P$ be the orthogonal projector onto the orthogonal complement of that projection. This is a nonzero element of $"End" \( A_0 \)_(bb(R))$. Writing $pi_0$ for the low projection, the identity $P pi_0 = P pi_0 Phi$ and the small-projection hypothesis give $P \( p \) = 0$ in the real height space. But evaluation at $p$ is injective on $"End" \( A_0 \)_(bb(Q))$: a nonzero rational endomorphism taking $p$ to torsion places $p$ in a proper torsion coset. Tensoring this injection with $bb(R)$ proves the same assertion for real endomorphisms. This contradicts $P eq.not 0$. If there are no high factors, surjectivity already contradicts the strict codimension hypothesis.
  Put $L = "Lie" \( A_0 \)$, $H = xor.big_(ell gt.eq 1) "Lie" \( W_ell \)$, and write $a = dim L$, $b = dim H$, and $c = "codim"_(L xor H) V$. For a positive integer $h$ define
  $ V_(*) = { \( v_1 \, dots.h \, v_h \) in H^h : upright("there is ") v_0 in L upright(" with ") \( v_0 \, v_j \) in V upright(" for every ") j } . $
  Kernels and images realize this as the image of a real homomorphism, hence of a real idempotent. The space before forgetting $v_0$ has dimension $a + h \( b - c \)$, since $V arrow.r L$ is surjective. The kernel of forgetting $v_0$ has dimension $t = dim \( V ∩ \( L xor 0 \) \)$. Consequently
  $ "codim"_(H^h) V_(*) = h c - a + t gt.eq h c - a . $
  Since $c > sum_(ell = 0)^s m_ell$, a sufficiently large fixed $h$ makes this strictly greater than $h sum_(ell gt.eq 1) m_ell$.
  Choose $h$ subsequences of indices so that, in the ordered list of their high factors, the largest scale in one copy divided by the smallest scale in the next tends to zero. This is possible recursively because all the high scales tend to infinity. Take the corresponding high marked points, retaining their original parents and fiber bounds. All the high nonvanishing hypotheses remain valid on these subsequences.
  Their normalized tuples satisfy the small-projection condition for $V_(*)$. Write $A_(+) = product_(ell gt.eq 1) A_ell$ and consider the fixed real homomorphism whose Lie action is
  $ T : "Lie" \( A_0 \) xor "Lie" \( A_(+) \)^h arrow.r "Lie" \( cal(A) \)^h \, #h(2em) T \( v_0 \, v_1 \, dots.h \, v_h \) = #scale(x: 120%, y: 120%)[\(] Phi \( v_0 \, v_j \) #scale(x: 120%, y: 120%)[\)]_(j = 1)^h . $
  Let $K = ker T$ and let $pi_(+)$ forget the low coordinate. Since $ker Phi = V subset.eq L xor H$, we have $pi_(+) \( K \) = V_(*)$. Let $Phi_(*)$ be the orthogonal projector with kernel $V_(*)$ in the full high ambient space $"Lie" \( A_(+) \)^h$. The generalized inverse from Lemma 4 gives the identity
  $ Phi_(*) pi_(+) = Phi_(*) pi_(+) T^dagger T \, $
  because $1 - T^dagger T$ projects onto $K$, whose image under $pi_(+)$ is killed by $Phi_(*)$. This identity also holds in the real height spaces. At the tuple formed from $p$ and the selected normalized high points, $T$ tends to zero. Applying the fixed bounded operator $Phi_(*) pi_(+) T^dagger$ therefore proves the required small-projection condition. The high points need only lie in $cal(H) \( A_(+) \)^h$; the codimension inequality is measured in $H^h$. We have obtained forbidden all-high sequence data, contrary to Theorem 15. ◻
]

We henceforth have a fixed positive-dimensional low variety $Z_0$. The auxiliary varieties in the high factors may still vary. Their bounded degrees and fields will suffice for the arithmetic argument in the next section.

== 6 Arithmetic positivity at the bounded scale <sec:arithmetic>

We continue the minimal-counterexample argument with a low factor. Let $Z_i = product_(ell = 0)^s Z_(i ell)$ be the subproducts supplied by Proposition 18, and write

$ d_ell = dim Z_(i ell) \, #h(2em) d = sum_(ell = 0)^s d_ell \, #h(2em) r = dim cal(A) + 1 . $

The dimensions are constant after extraction. The goal is an arithmetic lower bound for these varying products. Its proof compares two measures on the fixed low factor: a measure from separate outputs and one from consecutive differences. The model is the metric-variation method of Szpiro, Ullmo and Zhang #cite(label("SzpiroUllmoZhang1997")) Theorem 3.1 and its proof, in the arithmetic bigness form developed by Yuan #cite(label("Yuan2008")) Section 3.2. We give the uniform estimates here because both the high factors and their fields of definition vary. Lemma 19 has disposed of the case $d_0 = 0$. Thus $Z_(i 0) = Z_0$ is fixed and $d_0 > 0$. Each product is geometrically integral over a number field $k_i$, the degrees $\[ k_i : bb(Q) \]$ are bounded, and the fields contain all fixed ambient data. Enlarge them by $bb(Q) \( sqrt(- 1) \)$, preserving this bound. They carry the embedding in $bb(C)$ fixed at the start of the proof. The degrees of all factors are bounded, and each $Z_(i ell)$ has a dense set of points whose projective heights are at most $C H_(i ell)$, with one constant $C$. Recall that $H_(i 0) = 1$. These bounds concern the auxiliary varieties and their defining fields; the marked points may have arbitrarily large degree.

=== 6.1 Scaled bundles and their geometric degrees <scaled-bundles-and-their-geometric-degrees>

Retain the symmetric very ample line bundles $L_ell$ on $A_ell$ and fix a symmetric very ample line bundle $L$ on $cal(A)$, all with their canonical adelic metrics. We denote the resulting nef adelic bundles by $macron(L)_ell$ and $macron(L)$. All arithmetic intersection numbers and heights below are absolute: intersection numbers over $k_i$ are divided by $\[ k_i : bb(Q) \]$.

After another extraction, the homology class of every high factor $Z_(i ell) \( bb(C) \)$ is constant. Indeed, integrals of fixed smooth forms are bounded in terms of the projective degree, so these integral homology classes lie in a bounded subset of a lattice. Choose positive integers $M_i arrow.r oo$ and $b_(i ell)$ such that

$ b_(i 0) = M_i \, #h(2em) b_(i ell) tilde.op M_i / sqrt(H_(i ell)) \, #h(2em) min_ell b_(i ell) arrow.r oo . $

Because $M_i$ is unrestricted, lattice approximation in the fixed homomorphism groups gives homomorphisms $F_i : cal(A) arrow.r cal(A)$ with

#[#set math.equation(numbering: n => "(6.1)")
 $ phi_i := F_i "diag" \( b_(i ell)^(- 1) \) arrow.r Phi . $ <eq:scaled-homomorphisms>]

The maps $F_i$ may be chosen to be isogenies: first approximate $Phi$ by invertible real endomorphisms, then choose the scaling integers sufficiently large that lattice approximation preserves invertibility. Set

$ macron(E)_i = F_i^(*) macron(L) \, #h(2em) B_i = product_(ell = 0)^s b_(i ell)^(2 d_ell) . $

The normalized marked tuples are bounded, and their images under $Phi$ tend to zero. Together with (6.1), this gives

#[#set math.equation(numbering: n => "(6.2)")
 $ h_(macron(E)_i) \( y_i \) = o \( M_i^2 \) . $ <eq:small-marked-height>]

More explicitly, the vector with coordinates $b_(i ell) y_(i ell) \/ M_i$ differs by a vector tending to zero from $\( y_(i ell) \/ sqrt(H_(i ell)) \)_ell$; apply $phi_i$ and use the norm comparison for real homomorphisms.

On $cal(A)^r$, let $macron(E)_(i \, 1)$ be the pullback of the external product of $r$ copies of $macron(L)$ under

$ \( x_1 \, dots.h \, x_r \) mapsto \( F_i \( x_1 \) \, dots.h \, F_i \( x_r \) \) \, $

and let $macron(E)_(i \, 2)$ be the analogous pullback for the $r - 1$ consecutive differences $F_i \( x_(a + 1) \) - F_i \( x_a \)$. Both are nef. The tangent positivity in Proposition 12, the block scaling identity for top forms, and the fixed cycle classes give

#[#set math.equation(numbering: n => "(6.3)")
 $ \( E_i^d dot.op Z_i \) asymp B_i \, #h(2em) \( E_(i \, j)^(r d) dot.op Z_i^r \) asymp B_i^r quad \( j = 1 \, 2 \) . $ <eq:arithmetic-geometric-degrees>]

The lower bounds here are uniform. After division by the displayed scaling factors, the degrees converge to the positive integrals for $Phi$ and its consecutive-difference map on the fixed cycle classes.

=== 6.2 Two measures and arithmetic positivity <two-measures-and-arithmetic-positivity>

Although the marked points have $macron(E)_i$-height $o \( M_i^2 \)$, the following proposition shows that the normalized arithmetic intersections of the whole varieties have a positive lower bound. We will compare the curvature measures of the separate-output and difference bundles on the fixed low product $Z_0^r$.

#thm([Proposition 6.1.])[
  #emph[Let $Z_i = product_(ell = 0)^s Z_(i ell)$ be the bounded-degree, bounded-field-degree subproducts above, with fixed positive-dimensional low factor $Z_0$, dense factorwise height bounds $h_(L_ell) = O \( H_(i ell) \)$, and fixed high cycle classes. Suppose the two tangent integrals for $Phi$ in Proposition 12 are positive. For the homomorphisms and scalings in (6.1), one has 
#[#set math.equation(numbering: n => "(6.4)")
 $ liminf_(i arrow.r oo) frac(\( macron(E)_i^(d + 1) dot.op Z_i \), M_i^2 B_i) > 0 . $ <eq:arithmetic-positive>]

]
] <prop:arithmetic-positive>

#proof[
  We first compute two distinct limiting measures geometrically. We then show that a vanishing subsequence of the arithmetic intersection quotients would force those same measures to agree.
  #emph[The two measures and their geometric limits.]
  Put $X_i = Z_i^r$, $u = r d$, and let $p_0 : cal(A)^r arrow.r A_0^r$ denote projection to the low coordinates. For $j = 1 \, 2$, define a probability measure on $A_0^r \( bb(C) \)$ by
  $ mu_(i \, j) = frac(\( p_0 \)_(*) #scale(x: 120%, y: 120%)[\(] c_1 \( macron(E)_(i \, j) \)^u \|_(X_i) #scale(x: 120%, y: 120%)[\)], \( E_(i \, j)^u dot.op X_i \)) . $
  Curvatures in this formula are taken at the chosen complex embedding. Both measures are supported on the fixed low product $Z_0^r$. The geometric comparison follows the product-versus-pullback argument of the Bogomolov method #cite(label("Ullmo1998")) Section 4; the consecutive-difference construction is explained in #cite(label("Zhang1998ICM")) Section 3, following Faltings.
  Let $omega = c_1 \( macron(L) \)$ at the fixed complex embedding. For a real homomorphism $g$, let $beta_1 \( g \)$ be the invariant form on $cal(A)^r$ obtained by summing the pullbacks of $omega$ under $g$ in the $r$ separate copies. Let $beta_2 \( g \)$ be the sum of the pullbacks under the consecutive differences of those outputs. These definitions use only linear maps on Lie algebras and therefore make sense also for $g = Phi$.
  On a product tangent space, block scaling multiplies the top form by $B_i^r$. For any smooth real function $f$ on $A_0^r \( bb(C) \)$, multiplication by $p_0^(*) f$ does not alter that pointwise identity. It follows that
  #[#set math.equation(numbering: n => "(6.5)")
   $ mu_(i \, j) \( f \) = frac(integral_(Z_i^r) p_0^(*) f thin beta_j \( phi_i \)^u, integral_(Z_i^r) beta_j \( phi_i \)^u) . $ <eq:remove-scales-with-test>]
  No multiplication map on points or change of the test function is being used in this identity.
  Write $Q_i = product_(ell = 1)^s Z_(i ell)$, allowing a point when there are no high factors. Integration of an invariant form along $Q_i^r$ gives an invariant form on $A_0^r$: in invariant coordinates its coefficients are integrals of fixed invariant forms over $Q_i^r$, hence depend only on its homology class. Choose one of the products $Q_i$ as a fixed representative $Q$. Integrating $beta_j \( g \)^u$ over $Q^r$ produces a smooth invariant form $gamma_j \( g \)$ of bidegree $\( r d_0 \, r d_0 \)$ on $A_0^r$. Its coefficients are polynomial in those of $g$. Thus $gamma_j \( phi_i \) arrow.r gamma_j \( Phi \)$ smoothly, and (6.5) shows that $mu_(i \, j)$ converges to the probability measure $mu_j$ given by
  $ mu_j \( f \) = frac(integral_(Z_0^r) f thin gamma_j \( Phi \), integral_(Z_0^r) gamma_j \( Phi \)) . $
  Both denominators are positive by the tangent positivity already used in (6.3). Singularities cause no problem in these integrations: one may integrate over resolutions, and the resulting densities on $\( Z_0^(upright("sm")) \)^r$ are smooth.
  The first tangent integral supplies smooth points $z in Z_0$ and $q in Q$ such that $Phi$ is injective on $T_z Z_0 xor T_q Q$, where the tangent spaces are translated into the ambient Lie algebras. At the diagonal low tuple $\( z \, dots.h \, z \)$, the density $gamma_1 \( Phi \) \|_(Z_0^r)$ is strictly positive. Indeed, at $\( q \, dots.h \, q \)$ the separate-output form is positive on the full product tangent space, and it remains positive on a nonempty open set of high tuples, whose integration gives a positive density.
  At this same low tuple the density $gamma_2 \( Phi \) \|_(Z_0^r)$ is zero. Choose a nonzero tangent vector $v in T_z Z_0$, possible because $d_0 > 0$. For every smooth high tuple, the tangent vector which has low part $\( v \, dots.h \, v \)$ and zero high parts is killed by every consecutive difference. The top power of the semipositive form $beta_2 \( Phi \)$ therefore vanishes on that full product tangent space; its integral over the high factors vanishes as well.
  After their positive normalizations, the two smooth densities still differ at $\( z \, dots.h \, z \)$. Their difference has a fixed positive sign on a sufficiently small neighborhood in the smooth locus. Choose a nonnegative smooth function $f_(*)$ on $A_0^r \( bb(C) \)$, supported in a coordinate neighborhood of this point and positive on a smaller neighborhood. We have proved
  #[#set math.equation(numbering: n => "(6.6)")
   $ lim_i #scale(x: 120%, y: 120%)[\(] mu_(i \, 1) \( f_(*) \) - mu_(i \, 2) \( f_(*) \) #scale(x: 120%, y: 120%)[\)] > 0 . $ <eq:low-measure-gap>]
  Figure 1 records this comparison on the low product.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#text(size: 9pt)[Common source $X_i=Z_0^r times Q_i^r$]])
  content((-3, -1.1), [#box(width: 5.623cm, inset: 0.2117cm, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Separate-output curvature#linebreak()$c_1( macron(E)_(i,1))^u|_(X_i)$]]])])
  content((3, -1.1), [#box(width: 5.623cm, inset: 0.2117cm, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Consecutive-difference curvature#linebreak()$c_1( macron(E)_(i,2))^u|_(X_i)$]]])])
  line((0, -0.2727), (-3, -0.5454), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((0, -0.2727), (3, -0.5437), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  content((-3, -3.1), [#box(width: 5.623cm, inset: 0.2117cm, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$mu_(i,1) arrow.r.long mu_1$ on $Z_0^r$#linebreak()positive density at $(z, dots.h ,z)$]]])])
  content((3, -3.1), [#box(width: 5.623cm, inset: 0.2117cm, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$mu_(i,2) arrow.r.long mu_2$ on $Z_0^r$#linebreak()zero density at $(z, dots.h ,z)$]]])])
  line((-3, -1.655), (-3, -2.546), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  content((-3, -2.1), [#box(inset: 0.1058cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[normalize; apply $(p_0)_*$]]])])
  line((3, -1.656), (3, -2.546), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  content((3, -2.1), [#box(inset: 0.1058cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[normalize; apply $(p_0)_*$]]])])
  content((0, -3.1), [$!=$])
})],
    caption: [Figure 1: The two curvature measures on the changing product $X_i$ are normalized by their geometric degrees and projected to the fixed low product $Z_0^r$. Their limits differ: a common nonzero low tangent vector is killed by consecutive differences. If the arithmetic intersection quotient $\( macron(E)_i^(d + 1) dot.op Z_i \) \/ \( M_i^2 B_i \)$ tended to zero, uniform metric variation would force these limits to agree. The smooth density comparison gives the test function in (6.6). ],
  ) <fig:low-measures>
  #emph[Small points from a vanishing arithmetic intersection.] We now suppose, contrary to the proposition, that the nonnegative quotient in (6.4) tends to zero along a subsequence. We recall the two arithmetic inequalities used here and in the small-section construction below. For a nef adelic bundle $macron(D)$ on a projective variety $X$ of dimension $n$, with $D$ geometrically big, the fundamental inequalities read
  #[#set math.equation(numbering: n => "(6.7)")
   $ frac(e_1 \( X \, macron(D) \), n + 1) lt.eq frac(\( macron(D)^(n + 1) dot.op X \), \( n + 1 \) \( D^n dot.op X \)) lt.eq e_1 \( X \, macron(D) \) . $ <eq:fundamental-inequalities>]
  Here $e_1$ is the essential minimum of the point height. We use the nef, geometrically big form of these inequalities #cite(label("YuanZhang2021")) Theorem 5.3.3; the ample projective case is #cite(label("Zhang1995")) Theorem 1.10. We also use the arithmetic Siu inequality
  #[#set math.equation(numbering: n => "(6.8)")
   $ hat("vol") \( macron(D) - macron(N) \) gt.eq \( macron(D)^(n + 1) dot.op X \) - \( n + 1 \) \( macron(D)^n macron(N) dot.op X \) $ <eq:arithmetic-siu>]
  for nef adelic bundles, with the same absolute normalization #cite(label("YuanZhang2021")) Theorem A.5.1(2). These statements apply after a projective resolution; pullback preserves the intersection numbers and essential minima used here. Resolution in characteristic zero can be performed over the original field $k_i$, by smooth-center blowups of a smooth projective ambient variety, with centers disjoint from the original smooth locus of $X$ #cite(label("Wlodarczyk2005")) Theorems 1.0.2–1.0.3 and Section 5.7. Thus using a resolution requires no extension of the bounded-degree field $k_i$. A bundle of positive arithmetic volume has a nonzero section of some positive power with supremum norm at most one at every place. Its point height is therefore nonnegative outside a proper closed subset.
  By (6.7) and (6.3), each $Z_i$ has a dense set of points of $macron(E)_i$-height at most $epsilon.alt_i M_i^2$, where $epsilon.alt_i arrow.r 0$. Products of these sets give a dense subset $cal(S)_i subset X_i \( overline(bb(Q)) \)$ such that
  #[#set math.equation(numbering: n => "(6.9)")
   $ h_(macron(E)_(i \, 1)) \( x \) \, med h_(macron(E)_(i \, 2)) \( x \) lt.eq C_r epsilon.alt_i M_i^2 #h(2em) \( x in cal(S)_i \) . $ <eq:simultaneous-small-height>]
  For the difference bundle this follows from $parallel a - b parallel^2 lt.eq 2 parallel a parallel^2 + 2 parallel b parallel^2$. We will use these common dense sets to show that, for every smooth real function $f$ on $A_0^r \( bb(C) \)$,
  #[#set math.equation(numbering: n => "(6.10)")
   $ mu_(i \, 1) \( f \) - mu_(i \, 2) \( f \) arrow.r 0 . $ <eq:low-measure-comparison>]
  Applied to $f_(*)$, this will contradict (6.6). The required metric variation must be uniform in both the varieties and their defining fields.
  #emph[Uniform bounds for metric variation.] Let $v_i$ be the complex place of $k_i$ determined by the chosen embedding, and put $lambda_i = 2 \/ \[ k_i : bb(Q) \]$. Thus $lambda_i$ is bounded below by a positive constant. Write $overline(cal(O))_(v_i) \( f \)$ for the trivial bundle whose negative logarithmic norm is $p_0^(*) f$ at this embedding, its conjugate at the conjugate embedding, and zero at all other places. Write $macron(upright(bold(1)))$ for the trivial bundle with negative logarithmic norm one at every archimedean place and zero at the finite places. Its absolute point height is one.
  Fix $eta > 0$. For either $j$, abbreviate $macron(D)_i = macron(E)_(i \, j) \|_(X_i)$, $mu_i = mu_(i \, j)$, and set
  $ a_i = lambda_i mu_i \( f \) - eta \, #h(2em) macron(U)_i = overline(cal(O))_(v_i) \( f \) - a_i macron(upright(bold(1))) . $
  In particular $\| a_i \| lt.eq parallel f parallel_oo + eta$. There are nef bundles $macron(U)_(i \, 1) \, macron(U)_(i \, 2)$, pulled back from the low ambient product, such that
  #[#set math.equation(numbering: n => "(6.11)")
   $ macron(U)_i = macron(U)_(i \, 1) - macron(U)_(i \, 2) \, #h(2em) macron(U)_(i \, 2) = C macron(H) + K macron(upright(bold(1))) \, $ <eq:uniform-nef-decomposition>]
  where $macron(H)$ is a fixed canonical symmetric ample bundle on $A_0^r$, and $C \, K$ are fixed positive constants. To obtain this, choose an integer $C$ so that $C c_1 \( macron(H) \) + d d^c f$ is semipositive, and then choose $K > parallel f parallel_oo + sup_i \| a_i \|$.
  We spell out why this is nef in the model sense required by (6.8). Start with a relatively ample projective model of a power of $H$, give it the invariant archimedean curvature, and add a constant so that it is nef. Normalized pullbacks by multiplication, on graph models, converge to $macron(H)$; their archimedean curvatures are all the same invariant form. Adding the metric in (6.11) leaves every vertical curve degree unchanged. At infinity the new curvature is semipositive by the choice of $C$. The added negative-log-norm function is nonnegative at each archimedean place by the choice of $K$, so the arithmetic degree of every horizontal integral curve can only increase. This verifies the nef criterion for hermitian models: semipositive curvature and nonnegative degrees on all integral arithmetic curves. The perturbed nef models converge to $macron(U)_(i \, 1)$. The construction also applies to $macron(U)_(i \, 2)$, and its constants are independent of $i$ and of the field extension.
  Every arithmetic mixed intersection of total order $u + 1$ formed from
  $ macron(D)_i \, #h(2em) M_i^2 macron(U)_(i \, 1) \, #h(2em) M_i^2 macron(U)_(i \, 2) $
  is bounded by
  #[#set math.equation(numbering: n => "(6.12)")
   $ O \( M_i^2 B_i^r \) \, $ <eq:uniform-mixed-intersections>]
  with one constant for all these finitely many types of intersections. For a direct proof, let $p_(a ell)$ be the coordinate projection from $cal(A)^r$ to factor $ell$ in copy $a$, and put
  $ macron(T)_i = sum_(a = 1)^r sum_(ell = 0)^s b_(i ell)^2 p_(a ell)^(*) macron(L)_ell \, #h(2em) macron(S)_i = macron(D)_i + M_i^2 macron(U)_(i \, 1) + M_i^2 macron(U)_(i \, 2) + macron(T)_i $
  on $X_i$. This is nef and geometrically ample. Remove the factors $b_(i ell)$ on each product tangent space. The remaining forms for $D_i$ are bounded by (6.1); those for $M_i^2 U_(i \, a)$ are bounded because their geometric parts use only the low coordinates, where $b_(i 0) = M_i$. Consequently
  $ \( S_i^u dot.op X_i \) = O \( B_i^r \) . $
  On the products of the dense factorwise sets of height $O \( H_(i ell) \)$, all the point heights just displayed are $O \( M_i^2 \)$. For $D_i$, use boundedness of $phi_i$ to get
  $ h_(macron(D)_i) \( x \) lt.double sum_(a \, ell) b_(i ell)^2 h_(macron(L)_ell) \( x_(a ell) \) = O \( M_i^2 \) . $
  The same estimate holds for $macron(T)_i$. The heights of $macron(U)_(i \, 1) \, macron(U)_(i \, 2)$ are bounded on these sets because the low point heights and the metric shifts are bounded. Thus $e_1 \( X_i \, macron(S)_i \) = O \( M_i^2 \)$, and the upper inequality in (6.7) yields $\( macron(S)_i^(u + 1) dot.op X_i \) = O \( M_i^2 B_i^r \)$. Mixed intersections of nef adelic bundles are nonnegative. Each term in (6.12) occurs with a positive coefficient in this last self-intersection, which proves the assertion. Absolute normalization has introduced no field-dependent constant.
  #emph[Comparison against a low-factor test function.] The metric intersection formula gives
  $ \( macron(D)_i^u macron(U)_i dot.op X_i \) = \( D_i^u dot.op X_i \) #scale(x: 120%, y: 120%)[\(] lambda_i mu_i \( f \) - a_i #scale(x: 120%, y: 120%)[\)] = eta \( D_i^u dot.op X_i \) . $
  Apply (6.8) to the two nef bundles $macron(D)_i + t M_i^2 macron(U)_(i \, 1)$ and $t M_i^2 macron(U)_(i \, 2)$, where $t > 0$ is rational. Expansion and (6.12) give
  $ hat("vol") \( macron(D)_i + t M_i^2 macron(U)_i \) med & gt.eq \( macron(D)_i^(u + 1) dot.op X_i \) + \( u + 1 \) t M_i^2 eta \( D_i^u dot.op X_i \) - O \( t^2 M_i^2 B_i^r \) . $
  The first term is nonnegative. By (6.3), a sufficiently small fixed $t > 0$, depending on $f \, eta$ but not on $i$, makes the right side positive for all sufficiently large $i$. Hence the perturbed height is nonnegative outside a proper closed subset of $X_i$.
  Repeat this argument for both $j$ and for $f$ and $- f$. Choose $x_i in cal(S)_i$ outside the four resulting proper closed subsets. Let $"av"_(i \, x_i) \( f \)$ be the average of $f$ on the low projections of the conjugates of $x_i$ over $k_i$ at the chosen embedding. Then
  $ h_(overline(cal(O))_(v_i) \( f \)) \( x_i \) = lambda_i "av"_(i \, x_i) \( f \) . $
  Divide the perturbed height inequalities by $t M_i^2$, and use (6.9). For $j = 1 \, 2$ this yields
  $ lr(|lambda_i "av"_(i \, x_i) \( f \) - lambda_i mu_(i \, j) \( f \)|) lt.eq eta + o \( 1 \) . $
  Since $inf_i lambda_i > 0$ and $eta$ is arbitrary, this proves (6.10). This is the only point in this metric-variation argument that needs the bounded degrees of the fields $k_i$; the degrees of the points $x_i$ are unrestricted.
  Taking $f = f_(*)$ in (6.10) contradicts (6.6). This proves (6.4). ◻
]

=== 6.3 Sections with a uniform exponential bound <sections-with-a-uniform-exponential-bound>

The arithmetic intersection lower bound permits subtracting a constant adelic bundle while keeping positive arithmetic volume. Returning to the original metric gives the following small sections over the fields $k_i$.

#thm([Lemma 6.2.])[
  #emph[For the products $Z_i$, bundles $macron(E)_i$, and scalings above, there is a constant $c > 0$ such that, for all sufficiently large $i$, a projective resolution $pi_i : tilde(Z)_i arrow.r Z_i$ over $k_i$ carries a nonzero section defined over $k_i$, 
$ s_i in H^0 \( tilde(Z)_i \, pi_i^(*) E_i^(⊗ n_i) \) quad upright("for some integer ") n_i > 0 $

 whose adelic supremum norms satisfy 
#[#set math.equation(numbering: n => "(6.13)")
 $ parallel s_i parallel_(v \, upright("sup")) lt.eq cases(delim: "{", exp \( - c n_i M_i^2 \) \, & v divides oo \,, 1 \, & v divides.not oo .) $ <eq:small-section-norms>]

 The resolution may be chosen to be an isomorphism over the smooth locus.]
] <lemma:small-sections>

#proof[
  By Proposition 20 and (6.3), there are constants $delta \, C > 0$ with
  $ \( macron(E)_i^(d + 1) dot.op Z_i \) gt.eq delta M_i^2 B_i \, #h(2em) \( E_i^d dot.op Z_i \) lt.eq C B_i . $
  Choose $0 < c < delta \/ \( \( d + 1 \) C \)$. The constant bundle $c M_i^2 macron(upright(bold(1)))$ is nef, and (6.8) shows that $macron(E)_i - c M_i^2 macron(upright(bold(1)))$ has positive arithmetic volume. After pulling back to the resolution, take a nonzero section of a positive power with norms at most one for this shifted metric. Restoring the original metric gives exactly (6.13). ◻
]

The exponent $n_i$ need not be bounded. Its role is homogeneous: the logarithmic norm bound is proportional to $n_i M_i^2$, and the weighted order in the next section is normalized by $n_i b_(i ell)^2$. The fixed positive constant $c$, together with $h_(macron(E)_i) \( y_i \) = o \( M_i^2 \)$, will force a positive weighted index at the marked point. Enlarging the field to calculate at that point will not change the field of definition of the section.

== 7 A uniform local index <sec:index>

The small sections constructed above vanish to a definite weighted order at the marked points. The essential issue is uniformity: the marked points can have arbitrarily large degrees, and the coefficients of the homomorphisms tend to infinity. We prove the local assertion with these two features explicit. The weighted Taylor-coefficient and Cauchy argument follows the method of Faltings #cite(label("Faltings1991")) p. 560; the estimates below supply the required uniformity for our varying varieties and homomorphisms.

For a smooth point $y = \( y_ell \)_ell$ of a product $Z = product_ell Z_ell$, choose regular parameters $T_ell = \( T_(ell \, 1) \, dots.h \, T_(ell \, d_ell) \)$ on each factor and a local frame $e$ of a line bundle $E$. If a nonzero section of $E^n$ has expansion $s = e^n sum_alpha a_alpha T^alpha$, define

#[#set math.equation(numbering: n => "(7.1)")
 $ "ind"_(n \, b) \( s \; y \) = min_(a_alpha eq.not 0) sum_ell frac(\| alpha_ell \|, n b_ell^2) . $ <eq:weighted-index>]

A zero-dimensional factor contributes no parameters. All parameters in a given factor have the same weight. Factorwise changes of regular parameters preserve the corresponding filtration of the completed local ring; multiplication by a unit also preserves its first nonzero graded piece. Thus the index is independent of these choices.

#thm([Proposition 7.1.])[
  #emph[Fix projective embeddings of abelian varieties $A_ell$ by symmetric very ample bundles $L_ell$, a symmetric very ample canonically metrized bundle $macron(L)$ on $cal(A) = product_ell A_ell$, and integral bases of the homomorphism groups between the fixed varieties. Let $F_i : cal(A) arrow.r cal(A)$ be homomorphisms. Suppose that:]
  + #emph[$y_(i ell)$ is a smooth point of an irreducible $Z_(i ell) subset A_ell$, its projective height is $O \( H_(i ell) \)$, and its conormal space is spanned by equations of bounded degree and coefficient height $O \( H_(i ell) \)$, with $H_(i ell) gt.eq 1$;]
  + #emph[$M_i arrow.r oo$, the positive integers $b_(i ell)$ satisfy $b_(i ell) lt.double M_i$ and $b_(i ell)^2 H_(i ell) asymp M_i^2$, and the coefficients of $F_i \|_(A_ell)$ in the fixed bases are $O \( b_(i ell) \)$;]
  + #emph[for $macron(E)_i = F_i^(*) macron(L)$ one has $h_(macron(E)_i) \( y_i \) = o \( M_i^2 \)$, and a nonzero section $s_i$ of $E_i^(n_i)$ on a resolution of $Z_i = product_ell Z_(i ell)$ satisfies 
#[#set math.equation(numbering: n => "(7.2)")
 $ parallel s_i parallel_(v \, sup) lt.eq cases(delim: "{", e^(- c n_i M_i^2) \, & v divides oo \,, 1 \, & v divides.not oo \,) $ <eq:index-small-section>]

 for a fixed $c > 0$, over a number field containing its data.]
  #emph[Assume that the resolution is an isomorphism over the smooth locus. Then, for some $eta > 0$ independent of $i$, $"ind"_(n_i \, b_i) \( s_i \; y_i \) gt.eq eta$ for all sufficiently large $i$. No bound on the degree of the field of $y_i$ is required.]
] <prop:index>

#proof[
  For a first nonzero Taylor coefficient, Cauchy’s inequality and the product formula will compare the cost of differentiation, $sum_ell \| alpha_ell \| H_(i ell)$, with the small-section gain $n_i M_i^2$. The relation $b_(i ell)^2 H_(i ell) asymp M_i^2$ will turn this comparison into the asserted weighted index. We first choose the algebraic parameters and coefficient to which this argument will apply, then bound the analytic radii and metric variation.
  #emph[An algebraic coefficient and its local estimates.] Enlarge the field of the section to a number field $E$ containing $y_i$ and the equations to be used below. At a place $v$ of $E$ write $nu_v = \[ E_v : bb(Q)_(v \| bb(Q)) \] \/ \[ E : bb(Q) \]$, with the usual absolute values. All heights and sums over places below use these weights. The constants do not depend on $\[ E : bb(Q) \]$.
  Choose an affine projective-coordinate chart at $y_(i ell)$. From the equations in the first hypothesis choose a maximal invertible Jacobian minor. Center the coordinates at $y_(i ell)$, write $U_ell$ for the coordinates in that minor and $T_ell$ for the remaining coordinates, and multiply the equations by the inverse minor matrix. They become
  #[#set math.equation(numbering: n => "(7.3)")
   $ U_ell + beta_ell T_ell + Q_ell \( T_ell \, U_ell \) = 0 \, $ <eq:index-implicit-system>]
  where $Q_ell$ has no terms of degree less than two. All degrees and the number of coefficients are bounded. Translation and matrix inversion are bounded-degree rational operations on the original coefficients and the affine point coordinates. Consequently every coefficient in (7.3) has absolute height $O \( H_(i ell) \)$. Normalizing a nonzero coefficient of each original equation to one justifies this assertion for coefficient vectors initially specified only projectively.
  Fix an algebraic local frame $e$, and a multi-index $alpha$ attaining (7.1) in the factorwise parameters $T_ell$ just chosen. If $a_alpha$ is its coefficient, then
  $ a_(upright("fib")) = a_alpha e \( y_i \)^(n_i) in \( E_i^(n_i) \)_(y_i) $
  is a nonzero algebraic fiber element. In any analytic frame its coefficient times the value of that frame to the power $n_i$ equals $a_(upright("fib"))$. Indeed a change of frame multiplies the coefficient by its constant term, while all other contributions involve coefficients of strictly smaller weighted order and vanish. The multi-index is kept fixed here; only the index itself is asserted to be independent of a change of parameters.
  We will realize the parameters $T_ell$ on analytic polydisks of radii $rho_(i ell v)$ and choose analytic frames $e_v$ there. If
  $ kappa_v = sup_z log frac(parallel e_v \( y_i \) parallel_v, parallel e_v \( z \) parallel_v) \, $
  Cauchy’s coefficient inequality, or its nonarchimedean Gauss-norm counterpart, gives
  #[#set math.equation(numbering: n => "(7.4)")
   $ log parallel a_(upright("fib")) parallel_v lt.eq log parallel s_i parallel_(v \, sup) + n_i kappa_v + sum_ell \| alpha_ell \| log rho_(i ell v)^(- 1) . $ <eq:index-cauchy>]
  The estimate is first applied on smaller closed polydisks and then passed to the indicated radii. Because the left side uses the same algebraic fiber element at every place, the product formula says
  $ sum_v nu_v log parallel a_(upright("fib")) parallel_v = - n_i h_(macron(E)_i) \( y_i \) . $
  It remains to bound the two losses on the right of (7.4): the inverse radii and the metric variation.
  #emph[Analytic radii from the conormal equations.] Let $S_(i ell v)$ be the maximum of one and the absolute values of the coefficients of (7.3). Then
  #[#set math.equation(numbering: n => "(7.5)")
   $ sum_v nu_v log S_(i ell v) lt.double H_(i ell) . $ <eq:index-coefficient-sum>]
  Fix tolerances $0 < gamma_v lt.eq 1$, determined by the place of a fixed field of definition of the ambient data, equal to one outside its infinite and finitely many finite places. We may use the radii
  #[#set math.equation(numbering: n => "(7.6)")
   $ rho_(i ell v) = (frac(gamma_v, c_v S_(i ell v)))^4 \, #h(2em) sum_v nu_v log rho_(i ell v)^(- 1) lt.eq C_gamma H_(i ell) \, $ <eq:index-radii>]
  where $c_v = 1$ at finite places and a fixed sufficiently large constant at infinite places.
  Here is the analytic justification, including uniformity over extensions. At a finite place, on a smaller closed $T_ell$-polydisk of radius $s < rho_(i ell v)$, solve $U = - beta T - Q \( T \, U \)$ in the Gauss-norm ball $parallel U parallel lt.eq S_(i ell v) s$. The quadratic term has norm at most $S_(i ell v)^3 s^2$, and its Lipschitz constant in $U$ is at most $S_(i ell v)^2 s < 1$. The map therefore preserves the ball and is a contraction. At an infinite place use instead the ball $parallel U parallel lt.eq C_1 S_(i ell v) s$, with a fixed $C_1$ larger than twice the maximum number of entries in a row of $beta_ell$. This absorbs the row sums in its linear term. Bounds for the quadratic term and its Lipschitz constant now acquire only fixed factors depending on $C_1$, the degrees and the number of monomials. Increasing $c_v$ makes the quadratic contribution smaller than half the ball radius and makes the Lipschitz constant less than one. The solutions for smaller disks agree and give an analytic parametrization on the open polydisk of radius $rho_(i ell v)$. All affine coordinate displacements have norm less than $gamma_v$, and the Jacobian in $U$ remains invertible. At the center these equations define the germ of $Z_(i ell)$: they define a smooth complete intersection of its dimension containing that germ. Every further equation of $Z_(i ell)$ thus vanishes as a power series after substitution, and hence on the whole analytic branch. The invertible minor shows that this branch remains in the smooth locus. Finally (7.5) gives the second assertion of (7.6). Notice that sums of weights over the places above a fixed place do not change under extension of $E$.
  #emph[Metric variation at the infinite places.] We next choose the tolerances so that the metric varies little on the product of these branches. At infinity, fix a small $xi > 0$. The bound on affine coordinate displacements gives a uniform bound on projective distance: for $x = \[ 1 : a \]$ and $x' = \[ 1 : a + u \]$, the chordal distance is at most a fixed constant times $parallel u parallel$, because both homogeneous coordinate norms are at least one. Compactness of the fixed complex abelian varieties and local exponential charts therefore allow us to make each group difference from the center have an analytic logarithm of norm at most $xi$. Its image under $F_i$ has a logarithmic lift of norm $O \( xi sum_ell b_(i ell) \) = O \( xi M_i \)$. The same coefficient bound holds at every infinite embedding: all norms on the fixed finite-dimensional real homomorphism spaces are comparable.
  On the target universal cover, centered at a lift of $F_i \( y_i \)$, the canonical curvature has a fixed quadratic potential $Q$. There is a holomorphic frame $e_v$ whose negative log norm differs from its value at the origin by $Q$: subtracting this potential leaves a flat metric, with a unitary holomorphic frame on the simply connected cover. Pull this frame back along the logarithmic lift of our polydisk. We obtain
  #[#set math.equation(numbering: n => "(7.7)")
   $ sup_z log frac(parallel e_v \( y_i \) parallel_v, parallel e_v \( z \) parallel_v) lt.eq C xi^2 M_i^2 . $ <eq:index-infinite-metric>]
  The constant is independent of the center. The image of the polydisk need not lie in an injectivity neighborhood on the target: the construction takes place on its universal cover.
  #emph[Metric variation at the finite places.] At a finite place we need a different estimate, independent of all integer coefficients of $F_i$. Outside a fixed finite set of places, the varieties, group laws, polarization data and basis homomorphisms extend over good models. Differences of reduction zero remain of reduction zero under every integral linear combination of the basis homomorphisms. The choice $gamma_v = 1$ therefore suffices there.
  At one of the remaining places, work over the completed algebraic closure. Arbitrarily small analytic balls at the identity are subgroups. Indeed, in fixed smooth group parameters addition is $u + v$ plus terms of degree at least two, and inversion is $- u$ plus terms of degree at least two; on a sufficiently small ball the nonarchimedean inequality makes both operations preserve that ball. In particular the ball is stable under multiplication by every integer. Choose a target subgroup ball small enough that translation by any of its points preserves the reduction class in the fixed projective embedding. Such a choice is uniform in the point being translated. Here is a uniform projective estimate for this assertion. For normalized homogeneous coordinates, write
  $ d_v \( x \, x' \) = frac(max_(a \, b) \| x_a x'_b - x_b x'_a \|_v, max_a \| x_a \|_v max_a \| x'_a \|_v) . $
  In a common affine chart, coordinate displacements of norm less than $gamma_v lt.eq 1$ imply $d_v \( x \, x' \) < gamma_v$, even when the affine coordinates of the center are unbounded. A fixed projective morphism $f$ has finitely many homogeneous polynomial presentations which together have no base point on its source. A homogeneous Nullstellensatz identity gives a fixed $epsilon_v > 0$ such that at every normalized source point one presentation has value of norm at least $epsilon_v$. Polynomial difference estimates give a fixed $C'_v$ such that, when $d_v \( x \, x' \)$ is below a fixed threshold, the same presentation remains nonzero and
  $ d_v \( f \( x \) \, f \( x' \) \) lt.eq C'_v d_v \( x \, x' \) . $
  To apply the polynomial estimate, rescale nearby normalized coordinate vectors so that their coordinate differences are bounded by their projective distance; this is possible in a coordinate which is a unit at both points. All constants are in the fixed coefficient field and remain valid over its completed algebraic closure. Apply the estimate to the difference morphism and to translation $A times A arrow.r A$, comparing $\( a \, b \)$ with $\( a \, 0 \)$. Thus the source coordinate tolerances uniformly control identity neighborhoods, and translation by a sufficiently small identity neighborhood preserves projective reduction for every center.
  The finitely many basis homomorphisms carry sufficiently small source identity neighborhoods into this target subgroup ball. Every integral linear combination does so too. We can therefore choose the input tolerances $gamma_v$ independently of $i$ so that the target remains in the reduction class of $F_i \( y_i \)$ throughout the product branch. A homogeneous coordinate having maximal absolute value at this center defines a nonvanishing frame with constant projective metric norm on the branch. The comparison between this metric and the canonical metric gives
  #[#set math.equation(numbering: n => "(7.8)")
   $ sup_z log frac(parallel e_v \( y_i \) parallel_v, parallel e_v \( z \) parallel_v) lt.eq C_v \, #h(2em) sum_(v divides.not oo) nu_v C_v lt.eq C_0 \, $ <eq:index-finite-metric>]
  where $C_v = 0$ outside the fixed bad places. These constants remain unchanged upon extension of the point field. This is the step that prevents a loss depending on the sizes of the integers in $F_i$.
  #emph[Summing over the places.] The constructed frames satisfy $kappa_v lt.eq C xi^2 M_i^2$ at infinity and $kappa_v lt.eq C_v$ at finite places. The section norm bound applies on all the branches because they lie in the resolution’s isomorphic smooth locus. Sum (7.4), using the product formula, the small-section bound (7.2), the radius estimate (7.6), and the two metric estimates (7.7) and (7.8). We obtain
  $ C_gamma sum_ell \| alpha_ell \| H_(i ell) gt.eq n_i #scale(x: 120%, y: 120%)[\(] \( c - C xi^2 \) M_i^2 - C_0 - o \( M_i^2 \) #scale(x: 120%, y: 120%)[\)] . $
  Choose $xi$ so that $C xi^2 < c \/ 2$, then let $i$ tend to infinity. The comparison $b_(i ell)^2 H_(i ell) asymp M_i^2$ now yields a fixed positive lower bound for (7.1). ◻
]

For the products chosen in Proposition 18, the first hypothesis is precisely its smoothness and equation conclusion. The homomorphisms and weights of Section 6 satisfy the second hypothesis; (6.2) and Lemma 21 give the third. We therefore have a fixed positive index at $y_i$. The next section converts it into a hypersurface of bounded degree over a field of bounded degree, which is the contradiction required by minimality.

== 8 The product cut and bounded-degree descent <sec:product-cut>

The positive index from Proposition 22 will produce a hypersurface containing some $y_(i ell)$ but not $Z_(i ell)$. Both its degree and the degree of a field of definition must be bounded: geometric degree alone would not contradict Proposition 18. We first transfer the section to a polynomial on a product of projective spaces, and then keep track of all conjugates of a suitable component of its index locus.

=== 8.1 Finite projections and the norm of a section <finite-projections-and-the-norm-of-a-section>

The section $s_i$ supplied by Lemma 21 is defined over $k_i$. The larger field used in the local index proof serves only to evaluate this section and its coefficients at the marked point; it does not change the section’s field of definition.

Choose a fixed positive integer $t_0$ such that

#[#set math.equation(numbering: n => "(8.1)")
 $ Q_i = t_0 sum_ell b_(i ell)^2 L_ell - F_i^(*) L $ <eq:cut-ample-difference>]

is ample on $cal(A)$. This is possible uniformly in $i$: after changing variables by $"diag" \( b_(i ell) \)$ in the invariant Hermitian forms, the first term is a fixed positive form times $t_0$, whereas the second is bounded because $F_i "diag" \( b_(i ell)^(- 1) \)$ is bounded.

Take a positive power making $Q_i$ globally generated. Replacing $s_i$ by the corresponding power, and $n_i$ by the same multiple, choose a section of $Q_i^(n_i)$ over $k_i$ nonzero at $y_i$ and multiply. Such a section exists over $k_i$: among a $k_i$-basis of a generating space, some member has nonzero value at the algebraic point $y_i$. We obtain a nonzero section $s'_i$ of

$ times.square_ell L_ell^(t_0 n_i b_(i ell)^2)\|_(Z_i) $

on the resolution. Its index with weights $n_i b_(i ell)^2$ is still at least the fixed constant of Proposition 22; taking a power scales numerator and denominator together, and multiplication by a regular section cannot lower weighted order.

Let $Z_i^nu$ be the normalization of $Z_i$. The proper birational map from the resolution to $Z_i^nu$ has pushforward structure sheaf $cal(O)_(Z_i^nu)$. The projection formula therefore descends $s'_i$ to the pullback of the displayed bundle on $Z_i^nu$. We do not require descent to the possibly nonnormal variety $Z_i$ itself.

For each factor choose a finite linear projection

$ pi_(i ell) : Z_(i ell) arrow.r bb(P)^(d_ell) \, #h(2em) pi_(i ell)^(*) cal(O) \( 1 \) = L_ell \|_(Z_(i ell)) \, $

which is étale at $y_(i ell)$. A general projection has this property at a specified smooth point. The same requirements at its finitely many conjugates give a nonempty open condition defined over $k_i$ in the space of projections. Since $k_i$ is infinite, it contains a choice over $k_i$. The degree of this finite map is $deg_(L_ell) Z_(i ell)$ and is bounded. A zero-dimensional geometrically integral factor defined over $k_i$ is a $k_i$-point; its projection to $bb(P)^0$ has degree one.

The product projection, composed with normalization, is a finite map

$ Pi_i : Z_i^nu arrow.r P_i = product_ell bb(P)^(d_ell) $

of bounded degree $e_i = product_ell deg_(L_ell) Z_(i ell)$. Take the field norm of $s'_i$ along this map, as in #cite(label("Faltings1991")) p. 565. It is a nonzero section $G_i$ on $P_i$, defined over $k_i$, with multidegrees

#[#set math.equation(numbering: n => "(8.2)")
 $ D_(i ell) = e_i t_0 n_i b_(i ell)^2 . $ <eq:cut-multidegrees>]

For completeness, on an affine trivializing open of the target, $s'_i$ is an element of a finite algebra over the coordinate ring. It is integral there; the coefficients of its characteristic polynomial in the function-field extension are integral and belong to the fraction field of the normal target ring, and hence belong to that ring. Thus its norm is regular. On overlaps, a change of frame is raised to the power $e_i$, proving (8.2). This also proves that the construction works without a flatness hypothesis for $Pi_i$.

The characteristic polynomial shows that the pullback of $G_i$ is divisible by $s'_i$ in the local ring at $y_i$. Because the projections are étale factor by factor there, their completed local rings over $overline(bb(Q))$ identify through factorwise parameters. If $z_i = Pi_i \( y_i \)$, it follows that

#[#set math.equation(numbering: n => "(8.3)")
 $ "ind"_(D_i) \( G_i \; z_i \) gt.eq eta_1 > 0 \, $ <eq:cut-polynomial-index>]

where $"ind"_(D_i)$ gives parameters in the $ell$th projective factor weight $D_(i ell)^(- 1)$. Indeed the change from the old weights divides the index by $e_i t_0$, which is bounded. We now omit the zero-dimensional projective factors. At least one factor remains because $d_0 > 0$. For the remaining ordered factors,

#[#set math.equation(numbering: n => "(8.4)")
 $ D_(i ell) \/ D_(i \, ell + 1) arrow.r oo \, $ <eq:cut-ratios>]

including when omitted factors occur between them.

=== 8.2 Components of separated index loci <components-of-separated-index-loci>

Let $G$ be a nonzero multihomogeneous polynomial of positive multidegrees $D = \( D_1 \, dots.h \, D_m \)$ on $P = product_(ell = 1)^m bb(P)^(d_ell)$, with $d_ell gt.eq 1$, and write $N = sum_ell d_ell$. Its index at a point is the minimum of $sum_ell \| alpha_ell \| \/ D_ell$ among nonzero coefficients in local affine coordinates and a local frame. Equivalently one may use homogeneous partial derivatives, with their total orders in each block as weights. This equivalence follows by dehomogenizing in a nonzero coordinate: affine derivatives are homogeneous derivatives divided by the local frame, while derivatives in the omitted coordinate are combinations of affine derivatives of no larger weighted order, by homogeneity.

For a positive irrational number $sigma$, let $cal(I)_sigma$ be the closed locus where this index exceeds $sigma$. It is cut out by all homogeneous derivatives having weighted order less than $sigma$. All occurring weights are rational, so changing either strict inequality to a nonstrict one gives the same locus.

Suppose that $z in P$ has index at least $eta > 0$. Following #cite(label("Faltings1991")) Remark 3.4, we first find a component through $z$ that persists between two separated levels. Choose a positive irrational $sigma_0$ and a positive rational $epsilon.alt lt.eq 1$ such that the $N + 2$ levels

$ sigma_j = sigma_0 + j epsilon.alt #h(2em) \( 0 lt.eq j lt.eq N + 1 \) $

all lie below $eta$. These choices depend only on $eta$ and $N$, not on the multidegrees $D$. The point $z$ lies in every corresponding index locus. Choose a component $J_(N + 1)$ through $z$ at the highest level and then, at each lower level, a component containing the one already chosen. This gives

$ J_(N + 1) subset.eq J_N subset.eq dots.h.c subset.eq J_0 \, #h(2em) J_j upright(" a component of ") cal(I)_(sigma_j) . $

Every $J_j$ is proper in $P$, because $G eq.not 0$ and all levels are positive. Two consecutive components coincide: otherwise their dimensions would strictly increase more than $N$ times. Their common value $J$ contains $z$ and is a component of both $cal(I)_sigma$ and $cal(I)_(sigma + epsilon.alt)$ for one of the chosen levels $sigma$.

We use Faltings’ product theorem #cite(label("Faltings1991")) Theorem 3.1 in Evertse’s explicit form: for $m gt.eq 2$, $0 < epsilon.alt lt.eq 1$, and

#[#set math.equation(numbering: n => "(8.5)")
 $ D_ell \/ D_(ell + 1) gt.eq \( m N \/ epsilon.alt \)^N \, $ <eq:cut-product-threshold>]

a common irreducible component of the index loci at levels $sigma$ and $sigma + epsilon.alt$ is a product of subvarieties of the individual projective factors. This is #cite(label("Evertse1995Product")) Theorem 1, an explicit version of Faltings’ theorem; its hypotheses concern a nonzero polynomial over an algebraically closed field of characteristic zero. Thus, over $overline(bb(Q))$, the component just constructed is a product whenever (8.5) holds. For $m = 1$ it is already a subvariety of the single projective factor.

It remains to bound both the factor degrees and a common field of definition independently of $D$. Evertse’s theorem also gives such an arithmetic bound. The next lemma proves the needed weaker bound directly by Faltings’ conjugate-counting method #cite(label("Faltings1991")) Remark 3.2, including the case $m = 1$.

#thm([Lemma 8.1.])[
  #emph[Suppose that $G$ is defined over a number field $k$, and that a proper geometric component $J = product_(ell = 1)^m J_ell$ is common to $cal(I)_sigma$ and $cal(I)_(sigma + epsilon.alt)$, where $sigma > 0$ and $0 < epsilon.alt lt.eq 1$, and neither level is a rational derivative weight. If $q$ is the number of conjugates of $J$ over $k$, then 
#[#set math.equation(numbering: n => "(8.6)")
 $ q product_ell deg J_ell lt.eq C \( N \, epsilon.alt \) . $ <eq:conjugate-product-degree>]

 In particular the factors have bounded degrees and are defined over a common extension of $k$ of bounded degree.]
] <lemma:conjugate-product-degree>

#proof[
  Put $c_ell = "codim"_(bb(P)^(d_ell)) J_ell$ and $c = sum_ell c_ell > 0$. Both index loci are defined over $k$, so every conjugate of $J$ is again a common component. All conjugates have the same factor codimensions. Choose general linear spaces $Lambda_ell tilde.eq bb(P)^(c_ell)$ and put $Lambda = product_ell Lambda_ell$. Each conjugate of $J$ meets $Lambda$ transversely in $product_ell deg J_ell$ reduced points. We may choose the slices so that all these sets are disjoint and none of their points belongs to any other component of $cal(I)_sigma$.
  Here is the incidence justification for this simultaneous choice. The intersection of a component $J'$ with another component of $cal(I)_sigma$ is a proper closed subset of $J'$, hence has dimension less than $dim J'$. For a fixed point, the condition that it belong to $Lambda$ has codimension $sum_ell \( d_ell - c_ell \) = dim J'$ in the product of the Grassmannians parametrizing the slices. Thus a general product slice misses every such proper subset. There are only finitely many components and conjugates. The same argument, together with generic transversality in each factor in characteristic zero, avoids the singular loci. It follows that the indicated $q product_ell deg J_ell$ points are isolated in $Lambda ∩ cal(I)_sigma$. They all belong to the higher index locus.
  Multiply each derivative defining $cal(I)_sigma$ by all monomials of the missing multidegree, so that every resulting equation has multidegree $D$. This operation does not change their common zero set: at any point, some monomial of each specified nonnegative multidegree is nonzero. Near a point of the higher index locus, differentiating by weighted order less than $sigma$ leaves weighted order at least $epsilon.alt$. Multiplying by a monomial cannot lower this order. Restriction to $Lambda$ is factorwise and cannot lower it either.
  Choose $c$ general linear combinations of these restored equations so that their restrictions to $Lambda$ have isolated intersections at every indicated point. This is possible because the common base locus is isolated there: successive general combinations avoid the finitely many associated components of positive dimension through these finitely many points. In completed local coordinates $t_(ell \, 1) \, dots.h \, t_(ell \, c_ell)$ at one such point, their ideal is contained in the monomial ideal generated by monomials of weighted order at least $epsilon.alt$. The local intersection multiplicity is therefore at least the number of monomials of weight less than $epsilon.alt$.
  In particular consider monomials for which every exponent in the $ell$th block is strictly less than $epsilon.alt D_ell \/ \( 2 c \)$. Their total weight is less than $epsilon.alt \/ 2$, and their number is at least
  #[#set math.equation(numbering: n => "(8.7)")
   $ (frac(epsilon.alt, 2 c))^c product_ell D_ell^(c_ell) . $ <eq:cut-local-multiplicity>]
  Indeed there are $ceil.l x ceil.r gt.eq x$ nonnegative integers strictly less than a positive real number $x$.
  On the other hand, the sum of the isolated intersection multiplicities of $c$ divisors of multidegree $D$ on $Lambda$ is at most
  #[#set math.equation(numbering: n => "(8.8)")
   $ (sum_ell D_ell H_ell)^c dot.op Lambda = frac(c !, product_ell c_ell !) product_ell D_ell^(c_ell) \, $ <eq:cut-bezout>]
  where $H_ell$ denotes the hyperplane class from the $ell$th factor. The bound remains valid if other intersection components have positive dimension. Namely, perturb the divisors in their basepoint-free complete linear systems to make the intersection proper; at each original isolated complete intersection the local length is conserved, and its contribution is part of the total degree (8.8). There are $q product_ell deg J_ell$ of the isolated points counted above. Combining their individual multiplicity bound with the total bound gives
  $ q (product_ell deg J_ell) (frac(epsilon.alt, 2 c))^c product_ell D_ell^(c_ell) lt.eq frac(c !, product_ell c_ell !) product_ell D_ell^(c_ell) . $
  The powers of the multidegrees cancel, proving (8.6) independently of $D$. For example, after harmless enlargement the constant is bounded by $N ! \( 2 N \/ epsilon.alt \)^N$.
  Finally, the stabilizer of $J$ in the absolute Galois group of $k$ has index $q$. Galois descent defines $J$ over its fixed field, a degree-$q$ extension of $k$. Each $J_ell$ is the image of $J$ under a factor projection, so it is defined over the same field. All factor degrees are positive integers; hence (8.6) bounds them separately as well. ◻
]

=== 8.3 The contradiction to minimality <the-contradiction-to-minimality>

#thm([Proposition 8.2.])[
  #emph[For the minimal products of Proposition 18 with $d_0 > 0$, the small sections of Lemma 21 cannot satisfy the positive index conclusion of Proposition 22 along an infinite subsequence.]
] <prop:product-cut>

#proof[
  The finite projections and norms above give $G_i$ and $z_i$ with (8.3). Pass to constant dimensions of the projective factors and let $N$ be their sum. Apply the preceding component construction with $eta = eta_1$. Its $N + 2$ levels and their gap $epsilon.alt$ are fixed independently of $i$. It gives a proper component $J_i$ through $z_i$ common to two adjacent index loci; the adjacent pair may depend on $i$.
  For at least two factors, (8.4) eventually implies (8.5), so the product theorem gives $J_i = product_ell J_(i ell)$. With one factor this conclusion requires no theorem. Lemma 23 then gives a common field of definition $k'_i$ with $\[ k'_i : k_i \]$ bounded and all $deg J_(i ell)$ bounded. The finitely many possible choices of adjacent levels do not affect these bounds.
  Because $J_i$ is proper, at least one factor $J_(i ell)$ is proper in $bb(P)^(d_ell)$. After extraction fix this index $ell$. A proper projective variety of bounded degree admits a nonzero homogeneous equation of bounded degree over its field of definition. One can obtain it by projecting generally over that field to a hypersurface in a projective space of one larger dimension than the variety and pulling back its equation; the image degree does not exceed the original degree. Let $R_i$ be such an equation for $J_(i ell)$ over $k'_i$.
  Pulling back $R_i$ through the linear projection $pi_(i ell)$ gives a bounded-degree hypersurface over $k'_i$ containing $y_(i ell)$. It does not contain $Z_(i ell)$, because that projection is surjective onto $bb(P)^(d_ell)$ and $R_i$ is nonzero. The degrees $\[ k'_i : bb(Q) \]$ are bounded, since the degrees $\[ k_i : bb(Q) \]$ were bounded in choosing the minimal products. This is exactly the hypersurface excluded by Proposition 18, a contradiction. ◻
]

#proof[
  #emph[Completion of the proof of Theorem 6.] Theorem 15 handles the case with only unbounded scales. For a counterexample with a low factor, choose one of minimal ambient dimension. The projection and tangent arguments apply in this minimal counterexample. Proposition 18 then provides its auxiliary products. If $d_0 = 0$, Lemma 19 produces an all-high counterexample, already impossible. If $d_0 > 0$, Proposition 20 and Lemma 21 provide the small sections; Proposition 22 gives their positive index; and Proposition 24 contradicts minimality of the auxiliary products. Thus there is no counterexample with a low factor either. ◻
]

== 9 From non-density to maximal atypical finiteness <sec:finiteness>

The sequence theorem and its reduction in Section 2 prove Theorem 2 for every abelian variety over $overline(bb(Q))$. We now explain why this universal statement gives the finiteness asserted in Theorem 1. We use the reduction of Barroero and Dill #cite(label("BarroeroDill2021")) Theorem 1.9; their passage from optimal points to positive-dimensional optimal subvarieties uses Habegger and Pila’s #cite(label("HabeggerPila2016")) Theorem 9.8(i).

For an irreducible subvariety $Z$ of an abelian variety, its #emph[special defect] is

$ delta \( Z \) = dim chevron.l Z chevron.r_(upright("sp")) - dim Z . $

An irreducible $Z subset.eq X$ is #emph[optimal in $X$] if every irreducible $U$ with $Z subset.neq U subset.eq X$ satisfies $delta \( U \) > delta \( Z \)$. This uses special closure, in contrast to the arbitrary-coset closure used for geodesic optimality in Section 3.

#thm([Proposition 9.1.])[
  #emph[Every irreducible subvariety of every abelian variety over $overline(bb(Q))$ contains only finitely many optimal subvarieties.]
] <prop:optimal-finite>

#proof[
  Fix an abelian variety $A$, and nonnegative integers $m \, e$. Theorem 1.9 of #cite(label("BarroeroDill2021"), form: "prose") has the following implication. Suppose that, for every abelian subvariety $B subset.eq A$ and every irreducible $Z subset.eq B$ of dimension at most $m$ which is not contained in a proper special subvariety of $B$, the set
  $ Z ∩ B^(\[ max { dim Z + 1 \, thin dim B - e } \]) $
  is not dense in $Z$. Then each irreducible subvariety of $A$ of dimension at most $m$ has only finitely many optimal subvarieties of defect at most $e$.
  The displayed intersection is a subset of $Z ∩ B^(\[ dim Z + 1 \])$, so Theorem 2 verifies the hypothesis for every $B$ and $Z$ in this statement. All these varieties are defined over number fields after finite extension. The same non-density theorem is available for quotients and isogenous varieties as well, so no ambient restriction is introduced by the reduction. Take $m = dim X$ and $e = dim A$. Every special defect in $A$ lies between $0$ and $dim A$, which proves the proposition. ◻
]

#thm([Lemma 9.2.])[
  #emph[Let $X$ be an irreducible subvariety of an abelian variety and $S = chevron.l X chevron.r_(upright("sp"))$. Every maximal atypical subvariety of $X$ in $S$ is optimal in $X$.]
] <lem:maximal-optimal>

#proof[
  Let $Y$ be maximal atypical, witnessed by a special $T subset.eq S$. Since $chevron.l Y chevron.r_(upright("sp")) subset.eq T$, inequality (1.2) gives
  $ delta \( Y \) lt.eq dim T - dim Y < dim S - dim X = delta \( X \) . $
  Suppose $Y subset.neq U subset.eq X$ and $delta \( U \) lt.eq delta \( Y \)$. Put $T' = chevron.l U chevron.r_(upright("sp"))$; then $T' subset.eq S$ by (1.1). Choose an irreducible component $C$ of $X ∩ T'$ containing $U$. We have
  $ dim C gt.eq dim U = dim T' - delta \( U \) > dim T' - delta \( X \) = dim X + dim T' - dim S . $
  Thus $C$ is atypical and strictly contains $Y$, a contradiction. ◻
]

#proof[
  Write $S = B + tau$ with $tau$ torsion. Translation by $- tau$ identifies $S$ with the abelian variety $B$, preserves dimensions and special subvarieties, and sends $X$ to a subvariety with special closure $B$. The torsion point, $B$ and this translated subvariety are all defined over a number field after a finite extension. We may therefore work inside $B$.
  Proposition 25 and Lemma 26 show that the set of maximal atypical subvarieties is finite. Each is proper: if $X$ were a component witnessing its own atypicality, the witnessing special subvariety would contain $X$ and hence equal its special closure, making the strict dimension inequality impossible. Starting from any atypical subvariety, a sequence of strict atypical enlargements increases dimension and must terminate. Thus every atypical subvariety lies in a maximal one. Their finite union is a proper closed subset of the irreducible variety $X$.
  If $dim X = 0$, a special subvariety containing its only point must contain its special closure, so there are no atypical subvarieties. This also covers the zero-dimensional ambient case. The assertions and the possibility of an empty exceptional list follow in every case. ◻
]

== 10 Finite-rank translated intersections <sec:finite-rank>

We derive Corollary 3 from Theorem 2 by Pink’s reduction #cite(label("Pink2005")) Theorem 5.3, which extends an argument of Rémond and Viada #cite(label("RemondViada2003")) Proposition 4.2 from powers of an elliptic curve to semiabelian varieties. The auxiliary ambient group constructed below is again an abelian variety over $overline(bb(Q))$.

For an abelian variety $V$ and an integer $r gt.eq 0$, the set $V^(\[ r \]) \( overline(bb(Q)) \)$ is also the union of $G \( overline(bb(Q)) \)$ over all algebraic subgroups $G subset.eq V$ of codimension at least $r$. Indeed, every irreducible component of an algebraic subgroup is a torsion coset of the same dimension. Conversely, a torsion coset $D + tau$ is contained in the algebraic subgroup $D + chevron.l tau chevron.r$, which has dimension $dim D$ because $tau$ is torsion. Thus this notation agrees with the algebraic-subgroup union used in Pink’s reduction.

#proof[
  Put $r = dim_(bb(Q)) \( Gamma ⊗_(bb(Z)) bb(Q) \)$ and choose $a_1 \, dots.h \, a_r in Gamma$ whose images form a basis of this vector space. Let $D subset.eq A^r$ be the Zariski closure of the subgroup generated by $\( a_1 \, dots.h \, a_r \)$. Choose a positive integer $m$ that annihilates the finite component group $D \/ D^0$. Multiplication by $m$ is surjective on the abelian variety $D^0$, so $\[ m \] D = D^0$. It is also a finite, hence closed, morphism on $A^r$. Consequently
  $ overline(chevron.l \( m a_1 \, dots.h \, m a_r \) chevron.r) = \[ m \] D = D^0 . $
  Replace each $a_i$ by $m a_i$, write $a = \( a_1 \, dots.h \, a_r \)$, and put $C = D^0$. The images of the new $a_i$ still form a basis of $Gamma ⊗_(bb(Z)) bb(Q)$, and the cyclic subgroup generated by $a$ is Zariski dense in the connected abelian subvariety $C$. When $r = 0$, this construction uses the empty tuple and the zero abelian variety. For every $gamma in Gamma$ there are integers $n > 0$ and $n_1 \, dots.h \, n_r$ such that
  #[#set math.equation(numbering: n => "(10.1)")
   $ n gamma = n_1 a_1 + dots.h.c + n_r a_r . $ <eq:finite-rank-relation>]
  Indeed, a relation after tensoring with $bb(Q)$ has only a torsion error, which a further positive multiple kills.
  Set $B = A times C$ and $Y = X times { a }$. Both are defined over $overline(bb(Q))$; $B$ is abelian and $Y$ is irreducible of dimension $d$. We check that $Y$ is contained in no proper algebraic subgroup of $B$. If an algebraic subgroup $J subset.eq B$ contains $Y$, fix $x_0 in X \( overline(bb(Q)) \)$. Then $J$ contains $\( x - x_0 \, 0 \)$ for every $x in X \( overline(bb(Q)) \)$. The Zariski closure of the subgroup of $A$ generated by these differences is all of $A$: otherwise its translate by $x_0$ would be a proper translate containing $X$. It follows that $A times { 0 } subset.eq J$. The projection of $J$ to $C$ is a closed algebraic subgroup containing $a$, and hence is $C$. These two facts imply $J = B$. Since every proper torsion coset lies in a proper algebraic subgroup of the same dimension, $Y$ is contained in no proper torsion coset. Theorem 2 therefore shows that $Y \( overline(bb(Q)) \) ∩ B^(\[ d + 1 \]) \( overline(bb(Q)) \)$ is not Zariski dense in $Y$.
  It remains to verify the inclusion
  #[#set math.equation(numbering: n => "(10.2)")
   $ #scale(x: 120%, y: 120%)[\(] X \( overline(bb(Q)) \) ∩ \( A^(\[ d + 1 \]) \( overline(bb(Q)) \) + Gamma \) #scale(x: 120%, y: 120%)[\)] times { a } subset.eq Y \( overline(bb(Q)) \) ∩ B^(\[ d + 1 \]) \( overline(bb(Q)) \) . $ <eq:finite-rank-inclusion>]
  Let $x = g + gamma$ belong to the intersection on the left, with $g in G \( overline(bb(Q)) \)$ for an algebraic subgroup $G subset.eq A$ of codimension at least $d + 1$ and $gamma in Gamma$. Choose $n \, n_i$ as in (10.1), and define homomorphisms
  $ phi : A^r arrow.r A \, #h(2em) \( z_1 \, dots.h \, z_r \) mapsto sum_i n_i z_i \, #h(2em) psi : C arrow.r B \, #h(2em) c mapsto \( phi \( c \) \, n c \) . $
  The algebraic subgroup
  $ H = \[ n \]_B^(- 1) #scale(x: 120%, y: 120%)[\(] \( G times { 0 } \) + psi \( C \) #scale(x: 120%, y: 120%)[\)] $
  contains $\( x \, a \)$, since
  $ \[ n \]_B \( x \, a \) = \( n g + n gamma \, n a \) = \( n g \, 0 \) + psi \( a \) . $
  Here $\[ n \]_B^(- 1)$ denotes preimage under multiplication by $n$ on $B$. The kernel of $psi$ is contained in $C \[ n \]$, and so is the preimage in $C$ of $psi \( C \) ∩ \( G times { 0 } \)$. Thus both the kernel and this intersection are finite. Multiplication by $n$ on $B$ is finite as well. Therefore
  $ dim H = dim G + dim C \, #h(2em) "codim"_B H = "codim"_A G gt.eq d + 1 . $
  The algebraic-subgroup description of $B^(\[ d + 1 \])$ now gives $\( x \, a \) in B^(\[ d + 1 \]) \( overline(bb(Q)) \)$, proving (10.2). The isomorphism $X arrow.r Y$, $x mapsto \( x \, a \)$, and the non-density already proved for the right side yield the asserted non-density in $X$. When $d = 1$, the intersection is contained in a proper closed subset of the irreducible curve $X$, and every such subset is finite. ◻
]

The algebraicity of the translating points is used to place $Y$ over $overline(bb(Q))$, where Theorem 2 applies. Thus this deduction is the abelian algebraic-point case of Pink’s Conjecture 5.2, not its general formulation for semiabelian varieties over $bb(C)$. In higher dimensions the conclusion is non-density, and the proper closed exceptional subset may have positive dimension.


#bibliography("refs.bib", style: "ieee", title: [References])
