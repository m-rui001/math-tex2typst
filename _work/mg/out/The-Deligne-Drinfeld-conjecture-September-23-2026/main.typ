#import "@preview/cetz:0.5.0"
#let page_rotate = rotate
#set page(paper: "us-letter", margin: (x: 74.4pt, y: 74.4pt), numbering: "1")
#set text(lang: "en", size: 11pt)
#set par(justify: true, first-line-indent: (amount: 1.5em, all: true), leading: 0.75em)
#set heading(numbering: none)
#set math.equation(numbering: none)
#set figure(numbering: none)
#show heading: set text(size: 11.5pt)
#show heading.where(level: 1): set text(size: 13pt)
#show link: set text(fill: blue)

#let thm(head, body) = block(above: 0.6em, below: 0.6em, inset: (left: 0.5em), breakable: true)[#strong(head) #body]
#let prodef(head, body) = block(above: 0.6em, below: 0.6em, inset: (left: 0.5em), breakable: true)[#strong(head) #body]
#let proof(body) = block(above: 0.6em, below: 0.6em)[#emph([Proof.]) #body]
#let paperabstract(body) = block(inset: (left: 1.6em, right: 1.6em), above: 0.4em, below: 1.2em)[#align(center)[#strong[Abstract]] #body]
#let bibitem(num, body) = grid(columns: (2.6em, 1fr), gutter: 0.4em, num, body)
#let unconverted(lbl) = block(fill: rgb("#fff3cd"), inset: 4pt)[#text(fill: red, weight: "bold")[unconverted: #lbl]]

#align(center)[#text(size: 16pt, weight: "bold")[The Deligne--Drinfeld conjecture]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

The Grothendieck–Teichmüller Lie algebra records the infinitesimal symmetries of the associativity and braiding constraints for parenthesized braids. Its defining equations are short, but they place conditions in every weight on a free Lie algebra in two letters. The Deligne–Drinfeld conjecture predicts that these conditions leave exactly a free Lie algebra with one generator in each odd weight starting at three. We prove this conjecture, including generation of the entire solution space.

=== 1.1 The statement <the-statement>

Let $L = "Lie"_(bb(Q)) chevron.l x \, y chevron.r$, graded by the total number of letters. We call this degree the #emph[weight]. For a finite set of labels, the infinitesimal pure braid Lie algebra $frak(t)_n$ has generators $t_(i j) = t_(j i)$, $i eq.not j$, and relations

$ \[ t_(i j) \, t_(k ell) \] = 0 quad \( i \, j \, k \, ell upright(" distinct") \) \, #h(2em) \[ t_(i j) \, t_(i k) + t_(j k) \] = 0 quad \( i \, j \, k upright(" distinct") \) . quad "(1.1)" $ <eq:braid-relations>

Every generator has weight one. Let $W subset L$ be the graded vector space of polynomials satisfying

$ psi \( x \, y \) + psi \( y \, x \) & = 0 \,\
psi \( x \, y \) + psi \( y \, - x - y \) + psi \( - x - y \, x \) & = 0 . quad "(1.2)" $ <eq:antisymmetry>

$ & psi \( t_12 \, t_23 + t_24 \) + psi \( t_13 + t_23 \, t_34 \)\
 & #h(2em) = psi \( t_23 \, t_34 \) + psi \( t_12 + t_13 \, t_24 + t_34 \) + psi \( t_12 \, t_23 \) . quad "(1.3)" $ <eq:pentagon>

The last equation is imposed in $frak(t)_4$. These are the usual defining equations of $frak(g r t)_1$; see [16] Section 6.1. We work first with their polynomial solution space $W = xor.big_n W_n$, where $W_n$ is its weight-$n$ piece. The usual completed algebra is $hat(W) = product_n W_n$.

For $psi in L$, define the derivation

$ D_psi \( x \) = 0 \, #h(2em) D_psi \( y \) = \[ y \, psi \] . quad "(1.4)" $ <eq:ihara-derivation>

The Ihara bracket, with the convention used throughout this paper, is

$ { psi \, phi.alt } = D_psi \( phi.alt \) - D_phi.alt \( psi \) + \[ psi \, phi.alt \] . quad "(1.5)" $ <eq:ihara>

#thm([Theorem 1.1.])[
  #emph[There are homogeneous elements $sigma_(2 k + 1) in W_(2 k + 1)$, one for each $k gt.eq 1$, for which 
$ "Lie"_(bb(Q)) chevron.l e_3 \, e_5 \, e_7 \, dots.h chevron.r arrow.r \( W \, { thin \, thin } \) \, #h(2em) e_(2 k + 1) mapsto sigma_(2 k + 1) \, $

 is an isomorphism of graded Lie algebras. In particular, $W$ is closed under the bracket (1.5). The induced map on completions by weight is a continuous graded isomorphism.]
] <thm:main>

The generators in Theorem 1 are not canonical. The assertion combines two requirements: there are no additional Lie relations among them, and they span every solution of (1.2)–(1.3).

=== 1.2 Context and the main estimate <context-and-the-main-estimate>

The arithmetic study of the fundamental group of the projective line minus three points provides a central setting for these symmetry questions; Deligne developed its motivic and tangential-basepoint framework in [5] Introduction and Section 15. Drinfeld’s associators express compatibility between reassociation and braiding, and their symmetries led to the Grothendieck–Teichmüller group and its Lie algebra [6]. The equations above are the corresponding infinitesimal compatibility conditions.

The conjecture has three parts: existence of the proposed odd-weight elements, freeness of the Lie algebra they generate, and exhaustion of the equation space. Drinfeld’s Proposition 6.3 credits Ihara with the odd-weight existence result and gives an associator proof. Brown’s work on mixed Tate motives over $bb(Z)$ proves the faithfulness of the motivic action on the fundamental group of the three-punctured line [3]. The graded Lie algebra of the prounipotent motivic Galois group is free on generators corresponding to weights $3 \, 5 \, 7 \, dots.h$; its inclusion in the associator symmetry algebra therefore supplies a free Lie subalgebra of $W$ [4] Section 1.4.2. Willwacher subsequently proved freeness for any homogeneous family of solutions, one in each odd weight $2 k + 1 gt.eq 3$, whose corresponding element has nonzero coefficient of $x^(2 k) y$ [17] Theorem 1.2. This coefficient lies in the #emph[depth-one] component, consisting of words with exactly one occurrence of $y$.

Freeness leaves open whether there are additional solutions of the defining equations; see [16] Section 9. Naef and Willwacher’s computations of the linearized Kashiwara–Vergne algebra, together with the known inclusions, establish the required equality through weight 29 [13] Theorem 5 and Corollary 7. Our main estimate is the all-weight upper bound

$ dim_(bb(Q)) W_n lt.eq dim_(bb(Q)) "Lie"_(bb(Q)) chevron.l e_3 \, e_5 \, e_7 \, dots.h chevron.r_n \, #h(2em) "wt" \( e_j \) = j \, $

proved in Corollary 17 for the full rational equation space. The known free subalgebra gives the reverse inequality. The proof here also obtains that lower bound internally: Sections 6–8 construct a rational subspace of solutions closed under the Ihara bracket, supply its odd-weight depth-one values, and choose integral generators attaining the bound. These choices connect the rational construction to the characteristic-two argument.

The completed assertion has a graph-theoretic consequence. Over $bb(Q)$, Willwacher’s isomorphism [16] Theorem 1.1 identifies the zeroth cohomology of Kontsevich’s graph complex with $hat(W)$. Thus

$ H^0 \( upright("GC")_2 \) tilde.equiv accent("Lie"_(bb(Q)) chevron.l e_3 \, e_5 \, e_7 \, dots.h chevron.r, ̂) . $

The graph complex and its completion are taken in the conventions of that source. The superscript zero is a cohomological degree, whereas the generator indices specify weights; no other cohomological degree is computed here.

=== 1.3 Proof strategy <proof-strategy>

The main step is a degeneration of the pentagon in characteristic two. Inside the free associative algebra, put

$ A = x^2 \, #h(2em) C = \[ x \, y \] \, #h(2em) B = y \, $

and filter by the number of occurrences of $B$. The pentagon for a leading part becomes a relation in the enveloping algebra of the level-two cyclotomic hyperplane arrangement [7] Section 1.4, modulo terms of lower count. The comparison uses a common ordering procedure: corrections raise the count in the braid algebra and lower it in the arrangement algebra. Keeping only the common count-preserving terms transfers the relation without any independence assumption on the target algebra.

Integral deletion operators on words then detect the leading part after setting $A = 0$. Their analytic antecedents are the total-differential formulas for iterated integrals and hyperlogarithms of Goncharov [8] Theorem 2.1 and Panzer [14] Lemma 3.3.30. The operators used here specialize the integral algebraic differential operators of Hirose and Sato [10] Section 2; their use with cyclotomic braid algebras and ratios of sums and differences follows Hirose’s construction [9] Sections 4.3 and 6. Here the arrangement relations are proved over the integers before reduction, and the characteristic-two comparison is proved directly. A shift symmetry $B mapsto B + s \( C \)$, followed by a Vandermonde argument, confines the image to the ordinary free Lie algebra on

$ "ad"_C^k B \, #h(2em) k gt.eq 1 . $

These letters have exactly the weights predicted by the conjecture. The ordering comparison and the integral deletion test provide separate tools for extracting information from filtered braid relations.

To attain the bound within the proof, we construct rational solutions with a nonzero coefficient of $x^(n - 1) y$ in every odd weight $n gt.eq 3$. Following Drinfeld’s associator proof [6] Proposition 6.3, we compare regularized braid holonomy with the rule obtained by conjugating paths and negating the chord generators. We implement this comparison in the parenthesized-chord formalism of Bar-Natan [2] Sections 2–3, with the required operations and limits proved explicitly. The logarithm of the comparison, evaluated on a reassociation arrow, has the required nonzero coefficient. This uses the nonvanishing of a convergent integral, and requires no arithmetic independence assertion about its values.

Finally, we work with saturated lattices over $bb(Z)_(\( 2 \))$. The characteristic-two bound applies to reductions of rational solutions. Independent Hall words in previously chosen generators, together with a new depth-one value in odd weight, attain the bound at each step. Equality forces the next integral generator to occupy the required leading filtration piece. This proves generation and freeness simultaneously.

=== 1.4 Organization and conventions <organization-and-conventions>

Section 2 establishes the integral algebra and a special-derivation identity. Sections 3–5 prove the dimension bound. Sections 6 and 7 construct the odd-weight values. Section 8 completes the induction.

All Lie algebras in characteristic two are #emph[ordinary] Lie algebras, with $\[ u \, u \] = 0$. Their enveloping algebras are ordinary associative enveloping algebras. We never identify all primitive elements in characteristic two with ordinary Lie elements. All completions are by weight, and all infinite constructions are interpreted first in each finite weight quotient.

== 2 Integral Lie algebras and the special identity <sec:algebra>

Throughout, a Lie algebra is an ordinary Lie algebra: its bracket is alternating, including in characteristic two. Put $R = bb(Z)_(\( 2 \)) = { a \/ b in bb(Q) : b upright(" is odd") }$, with residue field $bb(F)_2 = R \/ 2 R$. We will pass from the rational solution space to an embedded reduction of the same dimension. For this passage we need torsion-free integral targets for the defining equations, together with an additional identity proved over $bb(Q)$ before reduction.

#thm([Lemma 2.1.])[
  #emph[The solution spaces $W_1$ and $W_2$ are zero.]
] <lem:low-weights>

#proof[
  For $psi \( x \, y \) = alpha x + beta y$, the left side minus the right side of the pentagon is $- alpha t_12 - beta t_34$. The degree-one braid generators are linearly independent, so $alpha = beta = 0$. The degree-two free Lie algebra is spanned by $\[ x \, y \]$, and the three-term expression for this polynomial is $3 \[ x \, y \]$. Thus it too has no nonzero rational solution. ◻
]

#thm([Lemma 2.2.])[
  (Ordinary Lie lattices).  #emph[Let $X$ be a finite alphabet, and let $K \( X \)$ be the $R$-span of all bracket monomials in the free associative algebra $R chevron.l X chevron.r$. It is the free ordinary Lie algebra over $R$. Each multihomogeneous piece is finite free, and its rationalization and reduction are, respectively, 
$ K \( X \) ⊗_R bb(Q) = "Lie"_(bb(Q)) chevron.l X chevron.r \, #h(2em) K \( X \) \/ 2 K \( X \) = "Lie"_(bb(F)_2) chevron.l X chevron.r med subset med bb(F)_2 chevron.l X chevron.r . $

 In particular, this reduction is injective in associative words, and free ordinary Lie dimensions in every multidegree agree over $bb(Q)$ and $bb(F)_2$. The same statements hold for an alphabet with positive integer weights and finitely many letters in each bounded weight.]
] <lem:lie-lattice>

#proof[
  We recall the integral free-Lie and PBW facts being used. The Hall–Lyndon construction gives a basis of the free Lie algebra over $bb(Z)$: iterated use of alternation and Jacobi expresses bracket monomials in the standard Lyndon brackets, and the associative expansion of each such bracket has its Lyndon word as leading word, with coefficient one. Distinct leading words give independence over every coefficient ring. Thus base change to $R$ identifies the abstract free Lie algebra with precisely the displayed bracket span. PBW applies to this free $R$-module; in particular its universal enveloping algebra is $R chevron.l X chevron.r$. These are the usual integral versions of the free-Lie basis and PBW theorems [15] Theorems 0.2, 0.5, 4.9 and 5.1; the integral Lyndon and PBW bases are also recalled in [12] Section 2.
  The same Lyndon brackets form bases after base change to $bb(Q)$ and $bb(F)_2$, with unchanged multidegrees. This proves the asserted injectivity and equality of dimensions. For a weighted alphabet, restriction to any bounded weight leaves finitely many letters, so the same basis argument applies. ◻
]

In particular, ordinary Lie membership is a condition stronger than being primitive in a characteristic-two enveloping algebra. For example, $x^2$ is primitive in $bb(F)_2 chevron.l x chevron.r$, whereas the ordinary Lie algebra generated by $x$ is just $bb(F)_2 x$. We will always retain ordinary Lie membership when using associative words.

For a coefficient ring $k in { R \, bb(Q) \, bb(F)_2 }$, write $frak(t)_q \( k \)$ for the infinitesimal braid Lie algebra on $q$ strands, with the presentation in (1.1).

#thm([Lemma 2.3.])[
  (The free fiber).  #emph[The map $frak(t)_q \( k \) arrow.r frak(t)_(q - 1) \( k \)$ which forgets the last strand is split, and its kernel is the free ordinary Lie algebra on $s_i = t_(i q)$, $1 lt.eq i < q$. Explicitly, 
$ frak(t)_q \( k \) = "Lie"_k chevron.l s_1 \, dots.h \, s_(q - 1) chevron.r times.r frak(t)_(q - 1) \( k \) \, quad "(2.1)" $ <eq:free-fiber>

 where a base generator $t_(i j)$ acts by the derivation 
$ D_(i j) \( s_i \) = \[ s_i \, s_j \] \, #h(2em) D_(i j) \( s_j \) = \[ s_j \, s_i \] \, #h(2em) D_(i j) \( s_h \) = 0 quad \( h in.not { i \, j } \) . quad "(2.2)" $ <eq:free-fiber-action>

 Multiplication gives an isomorphism of $k$-modules 
$ k chevron.l s_1 \, dots.h \, s_(q - 1) chevron.r ⊗_k U \( frak(t)_(q - 1) \( k \) \) arrow.r^(med tilde.op med) U \( frak(t)_q \( k \) \) . quad "(2.3)" $ <eq:enveloping-fiber>

 Thus recursive products of free associative fiber words are a basis. Over $R$, the Lie algebra and its enveloping algebra are torsion free, and this normal form commutes with rationalization and reduction.]
] <lem:free-fiber>

#proof[
  Any prescription on free generators extends uniquely to a derivation. Derivations $D_(i j)$ and $D_(h k)$ with disjoint supports commute. For three distinct indices $i \, j \, h$, put $S_(i j h) = s_i + s_j + s_h$. On the free subalgebra on these three letters,
  $ D_(i j) + D_(i h) + D_(j h) : z mapsto \[ z \, S_(i j h) \] . $
  Moreover $D_(i j) \( S_(i j h) \) = 0$, so $D_(i j)$ commutes with this sum. On every other free generator all these derivations vanish. It follows that $\[ D_(i j) \, D_(i h) + D_(j h) \] = 0$ on the whole free Lie algebra. Hence (2.2) defines an action of the presented base algebra.
  Form its semidirect product with the free Lie algebra on the $s_i$. The braid relations involving the last strand say precisely
  $ \[ t_(i j) \, s_h \] = 0 med \( h in.not { i \, j } \) \, quad \[ t_(i j) \, s_i + s_j \] = 0 \, quad \[ s_i \, t_(i j) + s_j \] = \[ s_j \, t_(i j) + s_i \] = 0 . $
  They hold by (2.2). Conversely, these relations in the presented braid algebra give exactly that action. The maps between the presented algebra and the semidirect product, taking each generator to its namesake, are consequently inverse. This proves both the presentation and the assertion about the actual kernel.
  Inductively the base is a free $k$-module. Choose Lie bases for fiber and base, and place the entire fiber basis before the base basis. PBW identifies their ordered products with a basis of the enveloping algebra. Since the enveloping algebra of a free Lie algebra is the free associative algebra, this is exactly (2.3). Induction, starting with one strand, gives the asserted word basis. Lemma 3 and the same basis over $R$, $bb(Q)$, and $bb(F)_2$ give the last assertions. ◻
]

We next deduce an additional identity from the defining equations. The first conclusion below is Drinfeld’s special identity [6] Proposition 5.7. We give a direct proof that also establishes the stated linearization. We use the convention $"ad"_a \( z \) = \[ a \, z \]$.

#thm([Lemma 2.4.])[
  (The special identity).  #emph[Let $psi in W_n$, where $n > 2$. In the free Lie algebra on $a \, b$, with $c = - a - b$, one has 
$ \[ a \, psi \( b \, a \) \] + \[ c \, psi \( b \, c \) \] = 0 . quad "(2.4)" $ <eq:special>

 In addition, for an extra free letter $T$, 
$ partial_2 psi \( a \, - a \) T = 0 \, quad "(2.5)" $ <eq:special-linearization>

 where $partial_2$ means the coefficient of a central parameter $t$ in $psi \( a \, - a + t T \)$.]
] <lem:special>

#proof[
  All calculations in this proof take place over $bb(Q)$. We first rewrite the pentagon in a free kernel, then linearize at $a + b + c = 0$. Equality of mixed derivatives will force the possible linearization coefficient to vanish.
  #emph[The free-fiber identity.] Forget strand $2$ in $frak(t)_4 \( bb(Q) \)$, and put
  $ a = t_12 \, #h(2em) b = t_23 \, #h(2em) c = t_24 \, #h(2em) u = t_13 \, #h(2em) v = t_34 . $
  By Lemma 4, the kernel is the actual free Lie algebra on $a \, b \, c$. Define
  $ F_a & = psi \( u + b \, v \) - psi \( u \, v \) \,\
F_b & = psi \( u + a \, v + c \) - psi \( u \, v \) \,\
F_c & = psi \( u \, v + b \) - psi \( u \, v \) . $
  Forgetting the fiber sends each displayed difference to zero, so $F_a \, F_b \, F_c$ are elements of this free kernel. They are homogeneous of degree $n$.
  Each of the three expressions before subtracting $psi \( u \, v \)$ commutes with its corresponding letter. For example, $\[ a \, u + b \] = \[ a \, v \] = 0$ and $\[ b \, u + a \] = \[ b \, v + c \] = 0$; the third case is the same braid relation at $c$. The base action fixes $S = a + b + c$. Summing the resulting commutators therefore gives
  $ \[ a \, F_a \] + \[ b \, F_b \] + \[ c \, F_c \] = 0 . $
  Set $Delta_a = F_b - F_a$ and $Delta_c = F_b - F_c$. We obtain the identity in the free fiber
  $ \[ S \, F_b \] = \[ a \, Delta_a \] + \[ c \, Delta_c \] . quad "(2.6)" $ <eq:special-fiber>
  The pentagon gives $Delta_a = psi \( a \, b + c \) - psi \( a \, b \) - psi \( b \, v \)$. The element $v + b + c$ is central in the subalgebra on $v \, b \, c$. A Lie polynomial of degree greater than one is unchanged when a central element is added to an argument: every term in the difference contains that element in a bracket. Thus $psi \( b \, v \) = psi \( b \, - b - c \)$. Exchanging strands $1$ and $4$ in the same calculation and using antisymmetry gives the second formula below:
  $ Delta_a & = psi \( a \, b + c \) - psi \( a \, b \) - psi \( b \, - b - c \) \,\
Delta_c & = - psi \( c \, a + b \) + psi \( c \, b \) + psi \( b \, - b - a \) . quad "(2.7)" $ <eq:special-delta-a>
  Both differences vanish when $S = 0$: the two remaining terms cancel by antisymmetry and $psi \( z \, - z \) = 0$ in degree greater than one.
  The ideal generated by $S$ is stable under the base action, so the quotient fiber is $"Lie"_(bb(Q)) chevron.l a \, b chevron.r$, with $c = - a - b$. In this quotient the actions of $u \, v$ are $"ad"_c \, "ad"_a$, respectively. For example,
  $ \[ u \, a \] = \[ a \, b \] = \[ c \, a \] \, quad \[ u \, b \] = \[ b \, a \] = \[ c \, b \] \, quad \[ u \, c \] = 0 \, $
  and $\[ v \, a \] = 0$, $\[ v \, b \] = \[ b \, c \] = \[ a \, b \]$, $\[ v \, c \] = \[ c \, b \] = \[ a \, c \]$. It follows that $psi \( u \, v \)$ acts on the quotient fiber by $"ad"_(psi \( c \, a \))$. Since the expression defining $F_b + psi \( u \, v \)$ commutes with $b$, we have
  $ \[ b \, F_b + psi \( c \, a \) \] = 0 $
  in this free Lie quotient.
  The centralizer of $b$ in the ordinary free Lie algebra on $a \, b$ is $bb(Q) b$. To see this directly, embed it in associative words. For a homogeneous polynomial $P = sum_w p_w w$ commuting with $b$, comparison in $b P = P b$ gives $p_(a v) = 0$ and $p_(b^j a v) = p_(b^(j - 1) a v b)$ for every word $v$ and $j > 0$. Iterating shows that every word containing $a$ has coefficient zero. Hence $P$ is a polynomial in $b$. Setting $a = 0$ now shows that a Lie element of this form belongs to the one-dimensional ordinary Lie algebra on $b$. The homogeneous element at hand has degree $n > 1$, and is therefore zero. We have proved an equality of quotient fiber elements, not just of their induced derivations:
  $ F_b \|_(S = 0) = - psi \( c \, a \) . quad "(2.8)" $ <eq:special-fb>
  #emph[The first variation at $S = 0$.] We have determined the quotient value of $F_b$. We now differentiate (2.6) transversely to this quotient and compare the result with the derivative of the expression in (2.4). All subsequent derivatives mean coefficient extraction after adjoining free direction letters and commuting scalar parameters. Thus
  $ partial_1 psi \( p \, q \) T = \[ t \] psi \( p + t T \, q \) \, #h(2em) partial_2 psi \( p \, q \) T = \[ t \] psi \( p \, q + t T \) . $
  The degree-$n$ Lie polynomials on $a \, T$ containing exactly one $T$ and $n - 1$ copies of $a$ form the one-dimensional space spanned by $"ad"_a^(n - 1) T$: in a nonzero bracket monomial, each branch not containing $T$ must be a single $a$. Consequently there is a scalar $k in bb(Q)$, depending only on $psi$, such that
  $ partial_2 psi \( a \, - a \) T = k "ad"_a^(n - 1) T . quad "(2.9)" $ <eq:special-k>
  Differentiating the identity $psi \( a \, - a \) = 0$ while varying both arguments gives
  $ partial_1 psi \( a \, - a \) T = partial_2 psi \( a \, - a \) T . quad "(2.10)" $ <eq:special-diagonal>
  Take $c = S - a - b$, keep $a \, b$ fixed, and extract the coefficient linear in $S = t T$. In these same coordinates the two differences are
  $ Delta_a & = psi \( a \, S - a \) - psi \( a \, b \) - psi \( b \, a - S \) \,\
Delta_c & = - psi \( S - a - b \, a + b \) + psi \( S - a - b \, b \) + psi \( b \, - b - a \) . $
  Writing $c = - a - b$ after differentiation, their derivatives at zero are exactly
  $ d_S Delta_a \( T \) & = k "ad"_a^(n - 1) T + partial_2 psi \( b \, a \) T \,\
d_S Delta_c \( T \) & = - partial_1 psi \( c \, - c \) T + partial_1 psi \( c \, b \) T\
 & = - k "ad"_c^(n - 1) T - partial_2 psi \( b \, c \) T . $
  The last equality uses (2.10) and antisymmetry. In differentiating (2.6), the left side becomes $\[ T \, F_b \|_(S = 0) \]$: its other product-rule term has outside letter $S = 0$. On the right the outside $a$ is fixed, and the derivative of the outside $c$ contributes $\[ T \, Delta_c \|_(S = 0) \] = 0$. Thus no outside-letter term remains, and (2.8) gives
  $ - \[ T \, psi \( c \, a \) \] =  & k \( "ad"_a^n - "ad"_c^n \) T\
 & + \[ a \, partial_2 psi \( b \, a \) T \] - \[ c \, partial_2 psi \( b \, c \) T \] . quad "(2.11)" $ <eq:special-transverse>
  Now define $G \( a \, b \) = \[ a \, psi \( b \, a \) \] + \[ c \, psi \( b \, c \) \]$, where $c = - a - b$. Hold $b$ fixed and vary $a$ in direction $T$, so that $c$ varies in direction $- T$. The full product rule is
  $ d_a G \( T \) =  & \[ T \, psi \( b \, a \) - psi \( b \, c \) \]\
 & + \[ a \, partial_2 psi \( b \, a \) T \] - \[ c \, partial_2 psi \( b \, c \) T \] . $
  The three-term identity and antisymmetry give $psi \( b \, a \) - psi \( b \, c \) = psi \( c \, a \)$. Comparing with (2.11), we conclude that
  $ d_a G \( T \) = - k \( "ad"_a^n - "ad"_c^n \) T . quad "(2.12)" $ <eq:special-dg>
  #emph[Vanishing of the scalar obstruction.] Equation (2.12) expresses the derivative of $G$ in terms of the single scalar $k$. To show that this scalar is zero, introduce two independent constant directions $U \, V$. The coefficients of their two commuting scalar parameters in $G$ are unchanged when the differentiations are interchanged. After forming these mixed derivatives, specialize
  $ a = a_0 \, #h(2em) b = - a_0 \, #h(2em) c = 0 \, #h(2em) U = a_0 \, #h(2em) V = T \, $
  where $a_0 \, T$ are free letters. The derivative of $"ad"_c^n$ vanishes there, since every summand contains $n - 1 > 0$ copies of $"ad"_c$. The two derivatives of the other term are
  $ d_U \( "ad"_a^n V \) \| & = n "ad"_(a_0)^n T \,\
d_V \( "ad"_a^n U \) \| & = sum_(j = 0)^(n - 1) "ad"_(a_0)^j "ad"_T "ad"_(a_0)^(n - 1 - j) a_0 = - "ad"_(a_0)^n T . $
  Only $j = n - 1$ survives in the second sum. Equality of the mixed derivatives in (2.12) implies
  $ \( n + 1 \) k "ad"_(a_0)^n T = 0 . $
  The word $a_0^n T$ has coefficient one in $"ad"_(a_0)^n T$. Since the calculation is over $bb(Q)$, it follows that $k = 0$. This proves (2.5).
  Equation (2.12) now says that every directional derivative of $G$ in $a$ vanishes. Equivalently, setting the direction equal to $a$ multiplies its component with $j$ occurrences of $a$ by $j$. In characteristic zero every such component with $j > 0$ is zero. Thus $G$ is independent of $a$, and evaluation at $a = 0 \, c = - b$ gives $G = 0$. This is (2.4). ◻
]

#thm([Proposition 2.5.])[
  (Saturated reduction).  #emph[Let 
$ K_n = "Lie"_R chevron.l x \, y chevron.r_n \, #h(2em) L_n = W_n ∩ K_n . $

 Then $L_n$ is a saturated finite free $R$-submodule of $K_n$, and its reduction embeds in $K_n \/ 2 K_n$. Writing its image as $overline(L)_n$, one has 
$ dim_(bb(F)_2) overline(L)_n = dim_(bb(Q)) W_n . quad "(2.13)" $ <eq:saturated-dimension>

 More generally, for any rational subspace $V_n subset W_n$, the lattice $M_n = V_n ∩ K_n$ has an embedded reduction $overline(M)_n subset overline(L)_n$ of dimension $dim_(bb(Q)) V_n$.]
  #emph[Every element of $overline(L)_n$ satisfies the reductions of the three defining identities. If $n > 2$, it also satisfies (2.4) and (2.5) after reduction, together with all formal coefficient consequences of these identities. In particular, putting $z = x + y$, 
$ \[ x \, overline(psi) \( x \, y \) + overline(psi) \( z \, y \) \] + \[ y \, overline(psi) \( z \, y \) \] = 0 #h(2em) \( overline(psi) in overline(L)_n \) . quad "(2.14)" $ <eq:special-mod-two>

]
] <prop:saturated-reduction>

#proof[
  An intersection of a rational subspace with a finite free $R$-module is saturated: if $v in K_n$ and $2 v in L_n$, then $v in W_n$, hence $v in L_n$. Thus $L_n ∩ 2 K_n = 2 L_n$, which gives the asserted injection after reduction. It is a finite free module because $R$ is a principal ideal domain. Clearing denominators in a rational basis of $W_n$ shows that $bb(Q) L_n = W_n$, so its rank and its reduction dimension are $dim_(bb(Q)) W_n$. Exactly the same argument applies to $M_n$; embedding both reductions in $K_n \/ 2 K_n$ proves their stated inclusion.
  For a representative $psi in L_n$, each defining identity is an expression with coefficients in $R$. Its target is either a free Lie lattice or the braid Lie algebra over $R$. These targets embed in their rationalizations by Lemmas 3 and 4. An expression which vanishes over $bb(Q)$ therefore already vanishes over $R$, and can be reduced modulo two. The identical argument applies to the special identity and its linearization, which were established over $bb(Q)$ in Lemma 5. Adjoining free letters and commuting parameters preserves the word bases; extracting a parameter coefficient involves no division and commutes with reduction. This justifies the assertion about formal coefficient consequences.
  Finally, reduce (2.4), take $a = x \, b = y \, c = x + y$, and use the reduced antisymmetry to replace $overline(psi) \( y \, x \)$ and $overline(psi) \( y \, x + y \)$ by $overline(psi) \( x \, y \)$ and $overline(psi) \( x + y \, y \)$. Expanding the outside bracket with $x + y$ gives (2.14). ◻
]

In the characteristic-two arguments that follow, the permitted polynomials are these reductions of rational solutions. No identification of $overline(L)_n$ with the full solution space of equations written over $bb(F)_2$ is asserted or needed. In particular, the characteristic-zero mixed-derivative argument proving $\( n + 1 \) k = 0$ has already been completed before reduction.

== 3 A filtered degeneration of the pentagon <sec:degeneration>

We now work over $bb(F)_2$. The elements to which we apply the argument are the reductions $macron(psi) in overline(L)_n$ of Proposition 6, with $n > 2$. In particular, they are ordinary Lie polynomials and satisfy the reduced pentagon. We first introduce a filtration in which a leading part of that pentagon can be tested in a different Lie algebra.

#thm([Lemma 3.1.])[
  #emph[The assignments 
$ A mapsto x^2 \, #h(2em) C mapsto \[ x \, y \] \, #h(2em) B mapsto y $

 define an injective homomorphism $bb(F)_2 chevron.l A \, C \, B chevron.r arrow.r bb(F)_2 chevron.l x \, y chevron.r$. Its restriction embeds the ordinary free Lie algebra $"Lie"_(bb(F)_2) chevron.l A \, C \, B chevron.r$ in the latter associative algebra. Every homogeneous element of $"Lie"_(bb(F)_2) chevron.l x \, y chevron.r$ of weight greater than one belongs to this embedded Lie algebra.]
] <lem:abc-free>

#proof[
  Order words of each fixed length lexicographically with $x > y$. The leading words of $x^2 \, \[ x \, y \] \, y$ are respectively $x x \, x y \, y$, each with coefficient one. These form a prefix code: none is a proper initial segment of another. Thus their concatenations have unique decodings, so distinct words in $A \, C \, B$ have distinct leading words. Split a putative relation by its total $x \, y$ length and take the largest leading word in each part; its coefficient proves associative injectivity. Ordinary free Lie algebras embed in their free associative enveloping algebras, so the Lie assertion follows as well.
  We use the ordinary free-Lie elimination construction [15] Theorem 0.6, whose needed instance can be seen directly. Set $e_j = "ad"_x^j y$ for $j gt.eq 0$. The Lie subalgebra generated by the $e_j$ is stable under $"ad"_x$, because $"ad"_x \( e_j \) = e_(j + 1)$ and $"ad"_x$ is a derivation. Its sum with the line $bb(F)_2 x$ is therefore a Lie algebra containing $x \, y$, hence the whole free Lie algebra. The subalgebra is thus an ideal with one-dimensional quotient spanned by the class of $x$. Every homogeneous Lie polynomial of weight greater than one consequently lies in this subalgebra. It is itself free on the $e_j$: their leading words $x^j y$ form a prefix code, which proves injectivity of the corresponding free associative algebra and hence of its ordinary free Lie algebra.
  In characteristic two, the associative identity $"ad"_x^2 \( P \) = \[ x^2 \, P \]$ gives
  $ e_(2 i) = "ad"_A^i B \, #h(2em) e_(2 i + 1) = "ad"_A^i C #h(2em) \( i gt.eq 0 \) . quad "(3.1)" $ <eq:elimination-abc>
  Both expressions belong to the ordinary Lie algebra on the three abstract letters $A \, C \, B$, which proves the final assertion. ◻
]

The statement does not assert that $x^2$ is an ordinary Lie polynomial in $x \, y$. Rather, it embeds an ordinary Lie algebra on three new letters into an associative algebra; the original Lie polynomials of weight greater than one happen to lie in its image.

Give $A \, C$ weight two and $B$ weight one, and let $F^r$ be the span of ordinary Lie monomials containing at least $r$ occurrences of $B$. The multigrading of the free Lie algebra makes this a decreasing filtration. Through Lemma 7, we regard $overline(L)_n$ as a subspace of $"Lie"_(bb(F)_2) chevron.l A \, C \, B chevron.r$ and give it the induced filtration $F^r overline(L)_n = overline(L)_n ∩ F^r$; write $"gr"_F^r overline(L)_n = F^r overline(L)_n \/ F^(r + 1) overline(L)_n$. Write $Psi \( A \, C \, B \)$ for the unique polynomial representing $macron(psi)$ under Lemma 7. If $Psi in F^r$, let $chi \( A \, C \, B \)$ be its component containing exactly $r$ letters $B$. Whenever $chi eq.not 0$, there is an integer $m gt.eq 0$ such that

$ n = 2 m + r \, quad "(3.2)" $ <eq:leading-count-weight>

and every associative word of $chi$ has $m$ letters from ${ A \, C }$ and total length $m + r$. The case $m = 0$ is zero: an ordinary Lie polynomial in $B$ alone has only its degree-one component, whereas $n > 2$. Thus a nonzero leading part always has $m > 0$, and in particular $n > r$. We shall later study the ordinary Lie polynomial $f = chi \( 0 \, C \, B \)$. This section establishes the relation satisfied by $chi$ before that projection.

We need two algebras with the same named symbols. The source is the ordinary enveloping algebra of the infinitesimal braid Lie algebra on strands $0 \, 1 \, dots.h \, d$, over $bb(F)_2$. In it put

$ X_i = t_(0 i) \, #h(2em) u_(i j) = t_(i j) \, #h(2em) a_i = X_i^2 \,\
v_(i j) = \[ X_i \, u_(i j) \] = \[ X_j \, u_(i j) \] = \[ X_i \, X_j \] . quad "(3.3)" $ <eq:source-symbols>

The equalities defining $v_(i j)$ follow from the three-strand braid relations and characteristic two. Here the $a_i$ are associative squares.

For the target, let $cal(A)_d$ be the arrangement in $bb(Q)^d$ with hyperplanes

$ z_i = 0 quad \( 1 lt.eq i lt.eq d \) \,\
z_i - z_j = 0 \, #h(2em) z_i + z_j = 0 quad \( 1 lt.eq i < j lt.eq d \) . $

Let $frak(h)_(bb(Z) \, d)$ be the ordinary Lie algebra over $bb(Z)$ with one generator $t_H$ for each $H in cal(A)_d$ and relations

$ [t_H \, sum_(K supset T) t_K] = 0 #h(2em) \( H supset T \) \, quad "(3.4)" $ <eq:flat-relations>

where $T$ ranges over the codimension-two intersections of the arrangement and the sum ranges over its hyperplanes containing $T$. This is the level-two cyclotomic infinitesimal braid arrangement [7] Section 1.4. We use the integral incidence presentation (3.4), not a characteristic-zero freeness assertion. All intersections in this definition are taken over $bb(Q)$. Set $frak(h)_d = frak(h)_(bb(Z) \, d) ⊗ bb(F)_2$, and write

$ a_i = t_({ z_i = 0 }) \, #h(2em) u_(i j)^s = t_({ z_i - s z_j = 0 }) quad \( s in { + 1 \, - 1 } \) \,\
u_(i j) = u_(i j)^(+ 1) \, quad v_(i j) = u_(i j)^(+ 1) + u_(i j)^(- 1) . $

Thus plus and minus hyperplanes remain distinct generators even after scalar reduction. For $d = 3$ abbreviate these Lie algebras to $frak(h)_(bb(Z))$ and $frak(h)$. Each target symbol $a_i \, v_(i j) \, u_(i j)$ has enveloping degree one.

The #emph[count] of a word in either named alphabet is its number of $u$ symbols; $a \, v$ symbols have count zero. Count is attached to an expression in the generators, not asserted to be a grading of either quotient algebra. We can now state the relation to be transferred.

#thm([Proposition 3.2.])[
  #emph[Let $macron(psi) in overline(L)_n$, $n > 2$, and suppose its expression $Psi \( A \, C \, B \)$ lies in $F^r$. Let $chi$ be its component of count $r$, and write $n = 2 m + r$, with $m > 0$. In $U \( frak(h) \)$ let $cal(U)_(ell \, < r)$ be the span of all products of exactly $ell$ symbols from ${ a_i \, v_(i j) \, u_(i j) }$ that contain fewer than $r$ symbols $u$. Then 
$ 0 equiv  & chi \( a_1 \, v_12 + v_13 \, u_12 + u_13 \) + chi \( a_2 + v_12 \, v_23 \, u_23 \)\
 & + chi \( a_1 + a_2 + v_12 \, v_13 + v_23 \, u_13 + u_23 \)\
 & + chi \( a_1 \, v_12 \, u_12 \) med \( mod med cal(U)_(m + r \, < r) \) . quad "(3.5)" $ <eq:leading-pentagon>

 For $r = 0$ the indicated lower-count subspace is zero.]
] <prop:leading-pentagon>

The lower-count remainder belongs to the stated linear subspace of words of fixed target length $m + r$. In the next section, scalar deletion tests on words of length $m + r$ containing $r$ zeros will annihilate this subspace. To prove the proposition, we compare ordering calculations in the two alphabets; no homomorphism between the two algebras is used. In the source, terms omitted from the leading pentagon have higher count; in the target, the permitted remainder has lower count. We will show that source ordering never lowers count and target ordering never raises it, with identical count-preserving parts.

Add a newest strand $d$. The old symbols are called base symbols; the new symbols are called fiber symbols. In the source write

$ X = X_d \, #h(2em) H = X^2 \, #h(2em) U_i = u_(i d) \, #h(2em) V_i = \[ X \, U_i \] quad \( i < d \) \, $

and in the target write

$ H = a_d \, #h(2em) U_i^s = u_(i d)^s \, #h(2em) U_i = U_i^(+ 1) \, #h(2em) V_i = U_i^(+ 1) + U_i^(- 1) . $

In this notation count includes the $U$ symbols, while $H \, V$ have count zero. The following exact formulas will justify the two opposite count inequalities.

#thm([Lemma 3.3.])[
  #emph[All commutators of a base symbol with a fiber symbol are given by the following formulas. In both algebras use the abbreviations 
$ R_i = \[ H \, U_i \] \, #h(2em) Q_i = \[ H + V_i \, U_i \] \, #h(2em) W_(i j) = \[ V_i \, U_j \] + \[ U_i \, V_j \] . $

 In the source the exact formulas are 
$ \[ a_i \, H \] & = \[ H \, V_i \] + \[ R_i \, U_i \] \,\
 & = Q_i \, & \[ a_i \, U_k \] & = 0 quad \( k eq.not i \) \,\
 & = \[ H \, V_i \] + \[ \[ V_i \, U_i \] \, U_i \] \,\
 & = \[ Q_i \, U_k \] quad \( k eq.not i \) \, quad "(3.6)" $ <eq:source-a-actions>

 
$ \[ u_(i j) \, H \] & = 0 \,\
 & = \[ u_(i j) \, U_j \] = \[ U_i \, U_j \] \,\
 & = \[ u_(i j) \, V_j \] = W_(i j) \,\
 & = \[ u_(i j) \, V_k \] = 0 quad \( k in.not { i \, j } \) \, quad "(3.7)" $ <eq:source-u-actions>

 and 
$ \[ v_(i j) \, H \] & = \[ H \, \[ U_i \, U_j \] \] \,\
 & = \[ U_i \, V_j \] \, & \[ v_(i j) \, U_j \] & = \[ U_j \, V_i \] \,\
 & = \[ V_i \, V_j \] + \[ W_(i j) \, U_i \] + \[ U_i \, R_j \] \,\
 & = \[ V_i \, V_j \] + \[ W_(i j) \, U_j \] + \[ U_j \, R_i \] \,\
 & = 0 quad \( k in.not { i \, j } \) \,\
 & = \[ W_(i j) \, U_k \] quad \( k in.not { i \, j } \) . quad "(3.8)" $ <eq:source-v-actions>

 In the target the exact formulas are 
$ \[ a_i \, H \] & = \[ H \, V_i \] \, & \[ a_i \, U_i \] & = Q_i \,\
 & = \[ H \, V_i \] \, & \[ a_i \, U_k \] & = \[ a_i \, V_k \] = 0 quad \( k eq.not i \) \, quad "(3.9)" $ <eq:target-a-actions>

 
$ \[ u_(i j) \, H \] & = 0 \,\
 & = \[ u_(i j) \, U_j \] = \[ U_i \, U_j \] \,\
 & = \[ u_(i j) \, V_j \] = W_(i j) + \[ V_i \, V_j \] \,\
 & = \[ u_(i j) \, V_k \] = 0 quad \( k in.not { i \, j } \) \, quad "(3.10)" $ <eq:target-u-actions>

 and 
$ \[ v_(i j) \, H \] & = 0 \,\
 & = \[ U_i \, V_j \] \, & \[ v_(i j) \, U_j \] & = \[ U_j \, V_i \] \,\
 & = \[ v_(i j) \, V_j \] = \[ V_i \, V_j \] \,\
 & = \[ v_(i j) \, V_k \] = 0 quad \( k in.not { i \, j } \) . quad "(3.11)" $ <eq:target-v-actions>

 Every source output has at least the count of its input pair; every target output has at most that count. The parts preserving count are identical in the two lists and have symbolic length two.]
] <lem:action-tables>

#proof[
  For the source, the braid relations give the following derivations on its free fiber on $X \, U_1 \, dots.h \, U_(d - 1)$:
  $ delta_i = "ad"_(X_i) : & quad X mapsto V_i \, quad U_i mapsto V_i \, quad U_k mapsto 0 med \( k eq.not i \) \,\
epsilon.alt_(i j) = "ad"_(u_(i j)) : & quad X mapsto 0 \, quad U_i \, U_j mapsto \[ U_i \, U_j \] \, quad U_k mapsto 0 med \( k in.not { i \, j } \) . $
  The derivation rule and $\[ X \, V_i \] = \[ X^2 \, U_i \] = R_i$ imply
  $ delta_i H = R_i \, #h(2em) delta_i V_i = Q_i \, #h(2em) delta_i V_k = \[ V_i \, U_k \] quad \( k eq.not i \) . $
  Since $"ad"_(a_i) = delta_i^2$, applying $delta_i$ again gives (3.6). For its incident $V_i$ entry, in particular, $R_i + Q_i = \[ V_i \, U_i \]$ gives
  $ delta_i Q_i = \[ R_i + Q_i \, U_i \] + \[ H + V_i \, V_i \] = \[ \[ V_i \, U_i \] \, U_i \] + \[ H \, V_i \] . $
  Applying $epsilon.alt_(i j)$ to $H \, V_k$ gives (3.7), since $\[ X \, \[ U_i \, U_j \] \] = W_(i j)$.
  Next $"ad"_(v_(i j)) = \[ delta_i \, epsilon.alt_(i j) \]$ sends $X$ to $W_(i j)$, sends $U_i$ to $\[ U_i \, V_j \]$, sends $U_j$ to $\[ U_j \, V_i \]$, and kills the other $U_k$. Its action on $H$ is $\[ X \, W_(i j) \] = \[ H \, \[ U_i \, U_j \] \]$. Its remaining actions follow uniformly from
  $ \[ v_(i j) \, V_k \] = \[ W_(i j) \, U_k \] + \[ X \, \[ v_(i j) \, U_k \] \] \, $
  which proves (3.8), including the nonincident entries.
  For the target, the flat where $z_i = z_d = 0$ lies in exactly the four hyperplanes with generators $a_i \, H \, U_i^(+ 1) \, U_i^(- 1)$. Its relations give
  $ \[ a_i \, H \] = \[ H \, V_i \] \, #h(2em) \[ a_i \, U_i^t \] = \[ H + V_i \, U_i^t \] quad \( t in { + 1 \, - 1 } \) . $
  Summing the second formula over $t$ proves the $V_i$ entry of (3.9). The signed triple flat containing $u_(i j)^s \, U_i^t \, U_j^(s t)$ gives
  $ \[ u_(i j)^s \, U_i^t \] = \[ U_j^(s t) \, U_i^t \] \, #h(2em) \[ u_(i j)^s \, U_j^t \] = \[ U_i^(s t) \, U_j^t \] . $
  Substitute $U_k^(- 1) = U_k + V_k$. For example,
  $ \[ u_(i j) \, V_i \] & = \[ U_j \, U_i \] + \[ U_j + V_j \, U_i + V_i \]\
 & = W_(i j) + \[ V_i \, V_j \] . $
  Summing also over $s$ gives $\[ v_(i j) \, U_i \] = \[ U_i \, V_j \]$ and $\[ v_(i j) \, V_i \] = \[ V_i \, V_j \]$; exchanging $i \, j$ gives the other incident entries. Every remaining pair in the claimed zero entries meets in a flat contained in just those two hyperplanes, so its generators commute. This proves all target formulas.
  The count assertions can now be read term by term. In the source, the terms beyond the common quadratic terms add two $U$’s. In the target, the only extra term is $\[ V_i \, V_j \]$ in (3.10), whose count is zero instead of one. This also proves agreement of the parts preserving count. ◻
]

For clarity, their common incident actions are the short table

$ & H & U_i & V_i\
a_i & \[ H \, V_i \] & \[ H + V_i \, U_i \] & \[ H \, V_i \]\
u_(i j) & 0 & \[ U_i \, U_j \] & \[ U_i \, V_j \] + \[ V_i \, U_j \]\
v_(i j) & 0 & \[ U_i \, V_j \] & \[ V_i \, V_j \] quad "(3.12)" $ <eq:common-actions>

with the exchanged-index versions supplied by the full formulas above and zero common actions at nonincident indices.

We next specify exactly how to use the tables. At a fixed newest strand, scan a word from left to right for its first adjacent pair $b f$ consisting of a base symbol followed by a fiber symbol. Replace it by

$ b f = f b + \[ b \, f \] \, quad "(3.13)" $ <eq:ordering-swap>

using the appropriate exact formula of Lemma 9 and expanding brackets into associative words. Fix the order of those expansions once and for all. On each resulting branch the lexicographic pair

$ #scale(x: 120%, y: 120%)[\(] upright("number of base symbols") \, thin upright("number of base-before-fiber inversions") #scale(x: 120%, y: 120%)[\)] $

strictly decreases. The swapped branch lowers the second entry; every commutator branch removes a base symbol and inserts only fiber symbols, hence lowers the first entry. This proves termination even for a source correction that increases symbolic length. When all fiber letters precede the base suffix, repeat the procedure on that suffix with one fewer strand. The result is an iterated ordered expression with the newest fiber first.

There are two further facts about this algorithm. First, in the source its ordered products are linearly independent. Indeed, Lemma 4 identifies the ordinary enveloping algebra, as a vector space, with the tensor product of the free associative fiber algebras in this order. In each fiber the subalgebra generated by $H \, V_i \, U_i$ is free associative: with $X$ larger than all $U_i$, these elements have the respective leading words

$ X X \, #h(2em) X U_i \, #h(2em) U_i . $

They again form a prefix code. Thus distinct words in each restricted fiber alphabet are independent, and so are their ordered products over all fibers. At the final one-strand stage this says simply that the powers of $X_1^2$ are independent.

Second, source ordering never lowers count, while target ordering never raises it. This remains true through every recursive stage, since the unchanged surrounding word contributes the same count and the action formulas have the required inequality term by term. A source branch that has acquired count greater than $r$ can never contribute at count $r$; a target branch of count less than $r$ can never return to count $r$. Consequently the branches that preserve count throughout are described in both algebras by exactly the same algorithm using (3.12).

#proof[
  Relabel the four braid strands $0 \, 1 \, 2 \, 3$. Since signs disappear over $bb(F)_2$, the reduced pentagon says that the sum of
  $ macron(psi) \( X_1 \, u_12 + u_13 \) \, #h(2em) macron(psi) \( X_2 + u_12 \, u_23 \) \, #h(2em) macron(psi) \( u_12 \, u_23 \) \,\
macron(psi) \( X_1 + X_2 \, u_13 + u_23 \) \, #h(2em) macron(psi) \( X_1 \, u_12 \) $
  is zero in the source. Express these five terms using $Psi$. Their exact triples of arguments $\( A \, C \, B \)$ are, in the same order,
  $ & \( a_1 \, med v_12 + v_13 \, med u_12 + u_13 \) \,\
 & \( a_2 + v_12 + u_12^2 \, med v_23 + \[ u_12 \, u_23 \] \, med u_23 \) \,\
 & \( u_12^2 \, med \[ u_12 \, u_23 \] \, med u_23 \) \,\
 & \( a_1 + a_2 + v_12 \, med v_13 + v_23 \, med u_13 + u_23 \) \,\
 & \( a_1 \, med v_12 \, med u_12 \) . quad "(3.14)" $ <eq:five-substitutions>
  In particular,
  $ \( X_2 + u_12 \)^2 = a_2 + v_12 + u_12^2 \, #h(2em) \( X_1 + X_2 \)^2 = a_1 + a_2 + v_12 . $
  Only the former square has a $u_12^2$ summand.
  Expand the pentagon as a polynomial in the restricted source symbols before ordering. Its part of count exactly $r$ is precisely the four-term polynomial $P$ on the right of (3.5). To verify this, the higher components of $Psi$ already have more than $r$ occurrences of $B$, each of which becomes a single $u$. Either extra summand $u_12^2$ or $\[ u_12 \, u_23 \]$ in the second triple increases count by two. The third triple, being entirely in the $u$ alphabet, gives count $n > r$. All remaining replacements preserve the original $B$-count. Thus the full source pentagon has the form $P + E = 0$, where every word of $E$ has count greater than $r$.
  The distinction between original weight and symbolic length is essential here. Assign source weight two to each $a \, v \, H \, V$ and weight one to each $u \, U$. A word of length $ell$ and count $q$ has original weight
  $ n = 2 ell - q . quad "(3.15)" $ <eq:weight-length-count>
  All source action formulas preserve this weight. Thus a correction that raises count by two raises length by one, and every ordered word of weight $n$ and count $r$ has length $\( n + r \) \/ 2 = m + r$. In particular $P$ has that length, while the higher-count expressions are allowed to have greater length.
  Apply the deterministic source ordering to $P + E = 0$. Since count never decreases, $E$ contributes nothing at count $r$. Independence of the ordered restricted source products, proved above from the free fibers, implies that every ordered coefficient of count $r$ in $P$ is zero separately. This conclusion uses independence across all the restricted words, so expressions of other lengths or counts cannot cancel a coefficient under consideration.
  Now interpret only the polynomial $P$, of length $m + r$, in the target. Apply the same deterministic ordering, discarding a branch as soon as its count falls below $r$. Such a branch can never return to count $r$. The retained branches use the identical quadratic formulas that retained count $r$ in the source. Their ordered coefficient vector is therefore the zero vector just obtained. Every target replacement preserves length, so every discarded branch has length $m + r$ and count less than $r$. Their sum belongs to $cal(U)_(m + r \, < r)$, proving (3.5).
  Only source independence enters this argument. In the target the ordering procedure is a sequence of valid equalities yielding a spanning expression; no independence or free-fiber assertion for $frak(h)$ is required. ◻
]

== 4 Deletion operators and injectivity of the leading projection <sec:deletion>

Our goal is to show that setting $A = 0$ loses no leading part $chi \( A \, C \, B \)$ of a reduced rational solution. We use deletion operators to test the four-term relation of Proposition 8. These tests first show that a leading part killed by $A = 0$ can involve only $A \, B$; the special identity then excludes this remaining kernel.

=== 4.1 The integral deletion representation <the-integral-deletion-representation>

The operators below specialize the integral algebraic differential operators of Hirose and Sato [10] Section 2. Their logarithmic-form and cyclotomic braid interpretation follows Hirose’s construction [9] Section 4.3. Here we construct an integral representation of the signed-hyperplane algebra of Section 3. After reduction modulo two it will turn the leading pentagon into individual coefficient equations. Throughout the integral construction, hyperplanes and their incidences are taken over characteristic zero.

Following the ratio alphabet in [9] Section 6, put

$ e = 1 \, #h(2em) p = frac(z_2 - z_3, z_2 + z_3) \, #h(2em) w = frac(z_2 - z_1, z_2 + z_1) . quad "(4.1)" $ <eq:deletion-letters>

For an integer $N gt.eq 0$, let $E_N$ be the free abelian group with basis the words of length at most $N$ in the alphabet ${ 0 \, e \, p }$, including the empty word. Every word has fixed left and right endpoints $0 \, w$; these endpoints are never deleted. If $P \, Q in { 0 \, e \, p \, w }$ are distinct, and $H in cal(A)_3$, write

$ nu_H \( P \, Q \) = "ord"_H \( P - Q \) . $

For equal letters we set $nu_H \( P \, P \) = 0$, rather than taking the order of the zero function. Thus the convention is part of the definition of the operators.

Define an endomorphism $T_H$ of $E_N$ by

$ T_H \( P_1 dots.h.c P_k \) = sum_(j = 1)^k #scale(x: 120%, y: 120%)[\(] nu_H \( P_j \, P_(j + 1) \) - nu_H \( P_(j - 1) \, P_j \) #scale(x: 120%, y: 120%)[\)] P_1 dots.h.c hat(P_j) dots.h.c P_k \, #h(2em) P_0 = 0 \, quad P_(k + 1) = w . quad "(4.2)" $ <eq:deletion-operator>

In particular $T_H$ kills the empty word. Every $T_H$ is a finite integer matrix. The specialization from [10] Section 2 uses the field $bb(Q) \( z_1 \, z_2 \, z_3 \)$, the valuation $"ord"_H$, and endpoints $0 \, w$, with the same zero-difference convention.

#thm([Proposition 4.1.])[
  #emph[The assignment $t_H mapsto T_H$ defines a representation of $frak(h)_(bb(Z))$ on $E_N$. Equivalently, for every codimension-two flat $X$ and every hyperplane $H_0 supset X$, 
$ [T_(H_0) \, sum_(H supset X) T_H] = 0 . quad "(4.3)" $ <eq:deletion-flat>

 It therefore extends to the ordinary enveloping algebra, over $bb(Z)$ and after reduction over $bb(F)_2$.]
] <prop:deletion-representation>

#proof[
  For distinct letters put $omega_(P Q) = d log \( P - Q \)$, and put $omega_(P P) = 0$. Signs of differences have no effect on these forms. The nonconstant differences, up to sign, factor as
  $ p & = frac(z_2 - z_3, z_2 + z_3) \, & w & = frac(z_2 - z_1, z_2 + z_1) \,\
1 - p & = frac(2 z_3, z_2 + z_3) \, & 1 - w & = frac(2 z_1, z_2 + z_1) \,\
p - w & = frac(2 z_2 \( z_1 - z_3 \), \( z_2 + z_3 \) \( z_2 + z_1 \)) . &  & quad "(4.4)" $ <eq:deletion-factorization>
  The remaining nonzero difference $1 - 0$ is constant. Consequently every $omega_(P Q)$ is an integer linear combination of $d log ell_H$, where $ell_H$ is a linear defining equation of $H$.
  Consider the matrix-valued rational one-form
  $ Omega = sum_(H in cal(A)_3) T_H thin d log ell_H . $
  The coefficient of a deletion at $P_j$ is exactly $omega_(P_j P_(j + 1)) - omega_(P_(j - 1) P_j)$. We claim that $Omega and Omega = 0$. For two nonadjacent deleted positions, neither deletion changes the neighbors of the other, so the contributions of the two orders cancel by antisymmetry of the wedge product. For two adjacent positions, denote the four successive letters by $L \, P \, Q \, R$. The sum of the contributions, with the rightmost matrix acting first, is
  $ & \( omega_(Q R) - omega_(L Q) \) and \( omega_(P Q) - omega_(L P) \)\
 & thin + \( omega_(P R) - omega_(L P) \) and \( omega_(Q R) - omega_(P Q) \) . quad "(4.5)" $ <eq:adjacent-deletions>
  Expanding this expression cancels the cross terms involving $omega_(L P)$ and $omega_(Q R)$. The remaining terms are the two logarithmic triangle identities for $\( L \, P \, Q \)$ and $\( P \, Q \, R \)$. The triangle identity is
  $ omega_(I J) and omega_(J K) + omega_(J K) and omega_(K I) + omega_(K I) and omega_(I J) = 0 . $
  For three distinct letters it follows by differentiating the relation $\( I - J \) + \( J - K \) + \( K - I \) = 0$ and putting the terms over a common denominator. If exactly two letters agree, one form is zero and the other two are equal; if all three agree, all three forms are zero. Thus it also holds in every repeated-letter case. This proves that (4.5) vanishes, including when other pairs among $L \, P \, Q \, R$ agree. It proves the claimed matrix identity.
  Take its residue first along a fixed $H_0$. Terms involving no $d log ell_(H_0)$ have no pole at a generic point of $H_0$, and the result is the rational one-form identity on $H_0$
  $ sum_(H eq.not H_0) \[ T_(H_0) \, T_H \] thin d log \( ell_H \|_(H_0) \) = 0 . $
  Now take the residue on $H_0$ along a codimension-one subspace $X subset H_0$ which is a flat of the arrangement. For $H eq.not H_0$, the restricted nonzero linear form $ell_H \|_(H_0)$ has order one along $X$ precisely when $H supset X$, and has order zero otherwise. This gives (4.3); including $H_0$ in the sum adds a zero commutator.
  This residue calculation is performed over $bb(Q)$. Distinct hyperplanes may restrict to multiples of the same equation on $H_0$; each matrix then contributes separately with coefficient one. In particular, restrictions proportional to $z$, $- z$, or $2 z$ all have residue one. There is no division by the number of coincident restrictions, nor by the constant $2$. Finally every matrix in (4.3) has integer entries. Its vanishing over $bb(Q)$ is therefore its vanishing over $bb(Z)$, which permits reduction modulo two without changing the characteristic-zero incidence relations. ◻
]

For a word $s$ of length $ell$, and an enveloping-algebra element $q$ of length $ell$, choose $N gt.eq ell$ and define its scalar deletion test by

$ chevron.l q \, s chevron.r = \[ diameter \] thin T \( q \) s \, $

where $\[ diameter \]$ extracts the coefficient of the empty word and $T \( q_1 dots.h.c q_ell \) = T \( q_1 \) dots.h.c T \( q_ell \)$. Thus the rightmost factor acts first. This convention will make successive deletion at the right endpoint read an associative coefficient in its usual left-to-right order.

#thm([Lemma 4.2.])[
  #emph[In the integral generator basis $a_i = t_(z_i = 0)$, $u_(i j) = t_(z_i - z_j = 0)$, $v_(i j) = t_(z_i - z_j = 0) + t_(z_i + z_j = 0)$, the complete nonzero edge weights are the following linear functionals: 
$ upright("edge") & a \, v upright(" part") & u upright(" part")\
0 p & 0 & u_23^(*)\
0 w & 0 & u_12^(*)\
0 e & 0 & 0\
e p & a_3^(*) - v_23^(*) & 0\
e w & a_1^(*) - v_12^(*) & 0\
p w & a_2^(*) + v_13^(*) - v_12^(*) - v_23^(*) & u_13^(*) quad "(4.6)" $ <eq:deletion-edge-table>

 Equal-letter edges have weight zero. After reduction modulo two, a word containing $r$ zeros has zero scalar test on every product with fewer than $r$ factors of type $u$. For a product with exactly $r$ such factors, every $u$-factor must delete a zero in any nonzero contribution.]
] <lem:edge-table>

#proof[
  If a difference has orders $lambda_(-)$ and $lambda_(+)$ along $z_i - z_j = 0$ and $z_i + z_j = 0$, its evaluations on $u_(i j)$ and $v_(i j)$ are respectively $lambda_(-)$ and $lambda_(-) + lambda_(+)$. Applying this to (4.4) gives every entry of (4.6). For example $p$ has orders $1 \, - 1$, so its $v_23$ weight is zero already integrally; the factor $2$ in $p - w$ contributes no hyperplane valuation.
  Every $a$- or $v$-weight on an edge touching $0$ is zero. Thus an $a$- or $v$-operation cannot delete a zero, regardless of preceding deletions, because all remaining letters and endpoints still belong to ${ 0 \, e \, p \, w }$. Each $u$-operation removes at most one zero. Emptying $r$ zeros consequently requires at least $r$ such operations. If there are exactly $r$, using even one to remove a nonzero letter makes it impossible to remove the remaining zeros. The same conclusion holds for linear combinations within the indicated slots. ◻
]

=== 4.2 Detecting mixed terms <detecting-mixed-terms>

We now work over $bb(F)_2$. Let $macron(psi) in overline(L)_n$ have leading $B$-count $r$ and leading part $chi \( A \, C \, B \)$, with $n = 2 m + r > 2$. Every word of $chi$ has $m$ letters from ${ A \, C }$ and $r$ letters $B$. Proposition 8, tested on a word with $m$ nonzero internal letters and $r$ zeros, is an exact scalar identity: the lower-count remainder is killed by Lemma 11. We use this exact identity to eliminate every component involving both $A$ and $C$ from a possible kernel of the projection $A = 0$.

#thm([Lemma 4.3.])[
  #emph[If $chi \( 0 \, C \, B \) = 0$, then $chi$ belongs to the ordinary free Lie algebra on $A \, B$; in particular it has the form $P \( A \, B \)$ with exactly $m$ letters $A$ and $r$ letters $B$.]
] <lem:deletion-kernel>

#proof[
  The associative multihomogeneous components of an ordinary Lie polynomial are again ordinary Lie polynomials. Since the component with no $A$ vanishes, suppose that $h > 0$ is the least $A$-count of a nonzero component $chi_h$. We will rule out $h < m$.
  Fix any internal word $s$ with $h$ letters $e$, $m - h$ letters $p$, and $r$ zeros. In each summand of (3.5), an $A$-, $C$-, or $B$-slot means the corresponding first, second, or third argument of $chi$. Every $B$-slot must delete a zero by Lemma 11. The other relevant actions follow directly from the edge table; the four rows are in the order of that equation:
  $ & A upright("-slot") & C upright("-slot on nonzero letters") & B upright("-slot on zeros")\
1 & upright("terminal ") e & upright("terminal ") e & upright("terminal ") 0\
2 & upright("terminal ") e & p upright(" adjacent to ") e upright(" or ") w \;\
e upright(" adjacent to ") p & 0 upright(" adjacent to ") p\
3 & 0 & upright("unneeded") & upright("unneeded")\
4 & upright("terminal ") e & upright("terminal ") e upright(" or ") p & upright("terminal ") 0 quad "(4.7)" $ <eq:deletion-slot-actions>
  Here “terminal” means the last remaining internal letter, adjacent to $w$. Each indicated boundary contributes weight one, so two such boundaries contribute zero. For instance, the third $A$-slot is $a_1 + a_2 + v_12$: its weights on $e p \, e w \, p w$ are respectively $0 \, 1 + 1 \, 1 + 1$, and its weights on edges touching zero vanish. Its deletion operator is identically zero. In the second row the $C$-slot is $v_23$ and the $B$-slot is $u_23$.
  A nonzero contribution from an $A$-count-$t$ component must use each $A$-slot to delete an $e$, so $t lt.eq h$. Minimality gives $t gt.eq h$. Hence only $chi_h$ can contribute, and all $h$ letters $e$ must be deleted by its $A$-slots. In particular, the possible $C$-deletions of $e$ in the table cannot occur in a surviving contribution. This also excludes contributions from every larger $A$-count.
  In the fourth summand every deletion is therefore at the right endpoint, and a slot word has at most one complete deletion sequence. It succeeds precisely when it is the word $s'$ obtained by $e mapsto A$, $p mapsto C$, $0 mapsto B$, in which case its weight is one. Thus the fourth summand evaluates to the coefficient $\[ s' \] chi_h$. The first summand cannot delete any $p$, so it vanishes because $m - h > 0$. The third summand vanishes because $h > 0$ and its $A$-operator is zero.
  Consider the second summand. Suppose an $e$ is followed by a nonempty maximal block consisting of $p$’s and zeros, ending at the next $e$ or at $w$. Its left $e$ cannot disappear while any of this block remains: all $e$’s must be removed by $A$-slots, which remove only a terminal $e$. If the right boundary is an $e$ and that $e$ disappears before the block does, it must already be terminal, so the new right boundary is $w$. Thus a surviving nonempty part of the block always has boundaries $e \, e$ or $e \, w$. The final surviving letter of this block cannot be removed. If that letter is $p$, its $C$-weight is $1 + 1 = 0$; if it is $0$, its $B$-weight is $0 + 0 = 0$. Consequently the second summand has no complete deletion sequence whenever some $e$ occurs before a non-$e$. Figure 1 records the two possible boundaries and the last-letter obstruction.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((-5.7, 1.15), [A nonempty block and its boundaries], anchor: "west")
  content((-4.94, -0.24), (-4.46, 0.24), [$e$], frame: "rect", stroke: (thickness: 0.6pt))
  content((-4.075, -0.34), (-0.825, 0.34), [$p 0 dots.h p 0$], frame: "rect", fill: rgb("#f5f5f5"), stroke: (paint: rgb("#737373")))
  content((-0.44, -0.24), (0.04, 0.24), [$e$], frame: "rect", stroke: (thickness: 0.6pt))
  content((1, 0), [$w$])
  line((-4.7, 0), (-2.45, 0), (-0.2, 0), (1, 0))
  line((-4, -0.48), (-0.9, -0.48))
  content((-2.45, -0.48), [letters in $\{p,0\}$])
  content((1.75, 0), [If the right $e$ is terminal,#linebreak()it may be removed.], anchor: "west")
  line((-2.45, -1.2), (-2.45, -1.85), stroke: (thickness: 0.65pt))
  content((-4.94, -2.59), (-4.46, -2.11), [$e$], frame: "rect", stroke: (thickness: 0.6pt))
  content((-4.075, -2.69), (-0.825, -2.01), [$p 0 dots.h p 0$], frame: "rect", fill: rgb("#f5f5f5"), stroke: (paint: rgb("#737373")))
  content((-0.44, -2.59), (0.04, -2.11), [$w$], frame: "rect", stroke: (thickness: 0.6pt))
  line((-4.7, -2.35), (-2.45, -2.35), (-0.2, -2.35))
  content((1.75, -2.35), [The left $e$ is still not terminal:#linebreak()it cannot be removed first.], anchor: "west")
  line((-2.45, -2.95), (-2.45, -3.6), stroke: (thickness: 0.65pt))
  content((-2.45, -3.275), [any further deletions])
  content((-5.7, -4), [The final surviving block letter, with $q in \{e,w\}$], anchor: "west")
  content((-4.94, -5.04), (-4.46, -4.56), [$e$], frame: "rect", stroke: (thickness: 0.6pt))
  content((-3.5, -4.8), [$p$])
  content((-2.54, -5.04), (-2.06, -4.56), [$q$], frame: "rect", stroke: (thickness: 0.6pt))
  line((-4.7, -4.8), (-3.5, -4.8), (-2.3, -4.8))
  content((-4.1, -4.8), [$1$], anchor: "south")
  content((-2.9, -4.8), [$1$], anchor: "south")
  content((-3.5, -5.5), [$C$-weight: $1+1=0$])
  content((0.36, -5.04), (0.84, -4.56), [$e$], frame: "rect", stroke: (thickness: 0.6pt))
  content((1.8, -4.8), [$0$])
  content((2.76, -5.04), (3.24, -4.56), [$q$], frame: "rect", stroke: (thickness: 0.6pt))
  line((0.6, -4.8), (1.8, -4.8), (3, -4.8))
  content((1.2, -4.8), [$0$], anchor: "south")
  content((2.4, -4.8), [$0$], anchor: "south")
  content((1.8, -5.5), [$B$-weight: $0+0=0$])
})],
    caption: [Figure 1: The obstruction in the second summand of the leading pentagon, after the minimal $A$-count forces every $e$ to be removed by an $A$-operation. Such an operation removes only a terminal $e$. While the displayed $p \, 0$ block is nonempty, its left boundary remains $e$; removing a terminal right boundary changes $e$ to $w$. With either right boundary, the final surviving $p$ or $0$ has deletion weight zero in $bb(F)_2$. Thus no nonzero deletion sequence empties the block. ],
  ) <fig:deletion-block>
  The scalar leading pentagon now gives $\[ s' \] chi_h = 0$ for every such $s$. The only remaining words have the form $v e^h$, with $v$ a word of $p$’s and zeros. Because $m - h > 0$, the word $v$ is nonempty. Let $"rev"$ denote reversal of associative words. For every ordinary homogeneous Lie polynomial $q$ of associative length $d$,
  $ "rev" \( q \) = \( - 1 \)^(d - 1) q . $
  Indeed reversal sends $\[ q_1 \, q_2 \]$ to $- \[ "rev" \( q_1 \) \, "rev" \( q_2 \) \]$, proving the formula by induction on Lie monomials. In characteristic two it fixes $chi_h$. The coefficient of $v e^h$ therefore equals the coefficient of $e^h "rev" \( v \)$, which has already been shown to vanish. Every coefficient of $chi_h$ is zero, a contradiction.
  Thus a least nonzero $A$-count can only be $m$. All $A$-counts are at most $m$, so only the component using $A \, B$ remains. It is an ordinary Lie polynomial as asserted. ◻
]

=== 4.3 Excluding the residual kernel <excluding-the-residual-kernel>

Deletion has reduced the possible kernel to polynomials $P \( A \, B \)$. To exclude them, we now use the special identity rather than further deletion tests. Its lowest-count part compares coefficients obtained by exchanging an $A$ and a $B$; antisymmetry will handle the remaining case with only one $A$.

#thm([Proposition 4.4.])[
  #emph[For $n > 2$ and every $r gt.eq 0$, the leading projection 
$ "gr"^r overline(L)_n arrow.r "Lie"_(bb(F)_2) chevron.l C \, B chevron.r \, #h(2em) chi mapsto chi \( 0 \, C \, B \) $

 is injective. Its source is zero unless $n = 2 m + r$ for an integer $m gt.eq 0$; in that case its image has $C$-count $m$ and $B$-count $r$.]
] <prop:projection-injective>

#proof[
  The map is well defined because changing a representative by an element of $F^(r + 1)$ does not change its count-$r$ component. The parity assertion and the multidegree of its image follow from $"wt" \( A \) = "wt" \( C \) = 2$ and $"wt" \( B \) = 1$. If $m = 0$, the leading part is an ordinary Lie polynomial in $B$ alone and is zero in the weights at issue. We may therefore assume $m > 0$.
  Suppose that $chi \( 0 \, C \, B \) = 0$. By Lemma 12, $chi = P \( A \, B \)$. If $r = 0$, this is an ordinary Lie polynomial in $A$ alone, and hence zero except possibly in weight two. Thus a nonzero kernel would require $r gt.eq 1$.
  Apply the reduction of Lemma 5 and antisymmetry with $z = x + y$. They give
  $ \[ x \, macron(psi) \( x \, y \) + macron(psi) \( z \, y \) \] + \[ y \, macron(psi) \( z \, y \) \] = 0 . quad "(4.8)" $ <eq:deletion-special>
  Indeed the special identity with $a = x$, $b = y$, $c = z$ becomes $\[ x \, macron(psi) \( y \, x \) \] + \[ z \, macron(psi) \( y \, z \) \] = 0$, and antisymmetry in characteristic two interchanges each pair of arguments.
  Under $x mapsto x + y$, the three associative elements become
  $ A mapsto A + C + B^2 \, #h(2em) C mapsto C \, #h(2em) B mapsto B . $
  Moreover, on their free associative algebra,
  $ \[ x \, A \] = 0 \, #h(2em) \[ x \, B \] = C \, #h(2em) \[ x \, C \] = \[ A \, B \] . $
  The part of $"ad"_x$ that lowers $B$-count by one is consequently the derivation
  $ D \( A \) = D \( C \) = 0 \, #h(2em) D \( B \) = C \; $
  its other part raises $B$-count by one. The substitution $A mapsto A + C + B^2$ never lowers that count. Therefore components of $macron(psi)$ with count greater than $r$ cannot contribute to count $r - 1$ in (4.8), and its outside bracket with $y$ has count at least $r + 1$. Within the leading part, using any $B^2$ in the substitution also raises the count by two. The count-$r - 1$ component of (4.8) is exactly
  $ D #scale(x: 120%, y: 120%)[\(] P \( A + C \, B \) + P \( A \, B \) #scale(x: 120%, y: 120%)[\)] = 0 . quad "(4.9)" $ <eq:residual-kernel-identity>
  Write $c \( v \)$ for the coefficient of a word $v$ with $m$ letters $A$ and $r$ letters $B$ in $P$. Fix any target word with $m - 1$ letters $A$, $r - 1$ letters $B$, and two letters $C$. Its coefficient on the left of (4.9) is the sum of exactly two coefficients of $P$: fill the two marked $C$-positions with $\( A \, B \)$ or with $\( B \, A \)$. In each case the original $A$ is replaced by $C$ in the substitution and the original $B$ by $C$ under $D$; these are the only possibilities. The term $D \( P \( A \, B \) \)$ has only one $C$ and contributes nothing here. Thus the coefficients of $P$ are invariant under exchanging any chosen $A$-position and $B$-position. These exchanges connect all words with the specified multiplicities, so
  $ c \( v \) = lambda quad upright("for every such word ") v quad "(4.10)" $ <eq:constant-residual-coefficients>
  for one $lambda in bb(F)_2$.
  If $m gt.eq 2$, fix a target word with $m - 2$ letters $A$, $r - 1$ letters $B$, and three letters $C$. Exactly one of its three $C$-positions must have been the $B$ differentiated by $D$; the other two must have been $A$’s replaced in the substitution. There are exactly three choices. Its coefficient is therefore $3 lambda = lambda$, which (4.9) forces to vanish. Hence $P = 0$.
  It remains to consider $m = 1$. The polynomial $P$ has original $\( x \, y \)$-bidegree $\( 2 \, r \)$. An $A \, C \, B$ word with counts $\( a \, c \, b \)$ has original bidegree $\( 2 a + c \, c + b \)$. Solving for bidegree $\( 2 \, r \)$ gives only
  $ \( a \, c \, b \) = \( 1 \, 0 \, r \) quad upright("or") quad \( 0 \, 2 \, r - 2 \) . $
  The latter possibility is excluded by the assumption $macron(psi) in F^r$, and the former is precisely $P$. Thus if $P eq.not 0$, the entire bidegree-$\( 2 \, r \)$ component of $macron(psi)$ is nonzero. Symmetry under $x arrow.l.r y$ forces a nonzero component of bidegree $\( r \, 2 \)$. Its $B$-count is at most its $y$-count, namely two, so $F^r$ forces $r lt.eq 2$.
  For $r = 2$, the ordinary free Lie component with one $A$ and two $B$’s is spanned by
  $ \[ B \, \[ A \, B \] \] = A B B + B B A . $
  To see the spanning assertion directly, every three-letter bracketing with two identical $B$’s either has the inner bracket $\[ B \, B \] = 0$, or is $\[ B \, \[ A \, B \] \]$ up to sign and skew-symmetry. The coefficients on $A B B \, B A B \, B B A$ are therefore $\( mu \, 0 \, mu \)$, which are all equal as required by (4.10) only when $mu = 0$.
  For $r = 1$, the forced swapped bidegree is $\( 1 \, 2 \)$. The count equations $2 a + c = 1$, $c + b = 2$ have the unique nonnegative solution $\( a \, c \, b \) = \( 0 \, 1 \, 1 \)$. Thus this nonzero component is a multiple of $\[ C \, B \]$, lies in count one, and survives the projection $A = 0$. No higher-filtration component has this bidegree, so it cannot cancel this projection. This contradicts $chi \( 0 \, C \, B \) = 0$. Both exceptional cases are excluded, proving injectivity. ◻
]

== 5 The image of the leading projection <sec:image>

Throughout this section the coefficient field is $bb(F)_2$. Recall that $overline(L)_n$ denotes the reduction of the saturated $bb(Z)_(\( 2 \))$-lattice of rational solutions of weight $n$, and that $F^r$ consists of polynomials containing at least $r$ occurrences of $B$ in the free associative algebra on

$ A = x^2 \, #h(2em) C = \[ x \, y \] \, #h(2em) B = y . $

We use the ordinary free Lie algebra on $A \, C \, B$ inside this associative algebra, as justified in Lemma 7. For $psi in F^r overline(L)_n$, let $chi \( A \, C \, B \)$ be its component with exactly $r$ occurrences of $B$, and put

$ f \( C \, B \) = chi \( 0 \, C \, B \) . $

If this component is nonzero, then $n = 2 m + r$, where $m$ is the total number of $A$’s and $C$’s in $chi$. Proposition 13 says that this projection is injective on the corresponding associated graded space. We shall identify a free Lie algebra containing its image.

The argument begins with a restriction on products of iterated adjoints, obtained from symmetry in $x \, y$ in Lemma 14. This restriction gives invariance under the polynomial shifts $B mapsto B + s \( C \)$, and a Vandermonde argument then places $f$ in the ordinary free Lie algebra generated by $"ad"_C^k B$, $k gt.eq 1$. This proves the all-weight dimension bound. We then establish a separate compatibility: projected leading Ihara brackets become ordinary brackets. It will provide the independent Hall words in Section 8.

=== 5.1 Symmetry and polynomial shifts <symmetry-and-polynomial-shifts>

#thm([Lemma 5.1.])[
  (The even-index bound).  #emph[Suppose that $n > 2$, $psi in F^r overline(L)_n$, and $n = 2 m + r$. The component of $psi$ of original $\( x \, y \)$-bidegree $\( m \, m + r \)$ is an associative linear combination of products 
$ \( "ad"_y^(j_1) x \) dots.h.c \( "ad"_y^(j_m) x \) quad "(5.1)" $ <eq:swapped-products>

 in which at least $r$ of the indices $j_1 \, dots.h \, j_m$ are even, with zero counted as even. Its image under $A = 0$ is exactly $f \( C \, B \)$. In particular, if $r > m$, then $f = 0$.]
] <lem:even-indices>

#proof[
  By the elimination argument in Lemma 7, every homogeneous Lie polynomial in $x \, y$ of weight greater than one is a Lie polynomial in $U_j = "ad"_x^j y$, $j gt.eq 0$. In characteristic two these elimination letters are
  $ U_(2 i) = E_i = "ad"_A^i B \, #h(2em) U_(2 i + 1) = O_i = "ad"_A^i C . $
  Associative words in the $E_i \, O_i$ are linearly independent. Indeed, order the letters with $A$ largest and use degree followed by lexicographic order. The leading words of these letters are $A^i B \, A^i C$, respectively, with coefficient one. They form a prefix code: one reads a string of $A$’s up to its next $B$ or $C$, thereby determining each successive codeword. Distinct products consequently have distinct leading words.
  Each $E_i$ is homogeneous of $B$-count one, whereas each $O_i$ has $B$-count zero. Thus the expansion of $psi$ in independent associative words in this alphabet is graded by the number of $E$-factors. The hypothesis $psi in F^r$ forces the coefficients of all words with fewer than $r$ such factors to vanish separately. This establishes a termwise restriction before any substitution or quotient is taken.
  Select the component of original bidegree $\( m + r \, m \)$. Every $U_j$ has exactly one $y$, so every product in this component has exactly $m$ factors. The reduced antisymmetry equation gives $psi \( x \, y \) = psi \( y \, x \)$. Swapping $x$ and $y$ therefore gives the desired expression (5.1) for bidegree $\( m \, m + r \)$, with the same lower bound on the number of even indices. If $r > m$, no such product exists.
  For completeness, an $A \, C \, B$-word with respective counts $\( a \, c \, b \)$ has original bidegree $\( 2 a + c \, c + b \)$. In bidegree $\( m \, m + r \)$ this means
  $ c = m - 2 a \, #h(2em) b = r + 2 a . quad "(5.2)" $ <eq:bidegree-counts>
  The terms with $a > 0$ have higher $B$-count and vanish under $A = 0$; the terms with $a = 0$ have $c = m \, b = r$ and are precisely $f$. Thus the even-index bound applies to the whole bidegree component, including every term subsequently removed by the projection. ◻
]

#thm([Lemma 5.2.])[
  (Polynomial shift invariance).  #emph[For every $f$ obtained as above and every polynomial $s \( C \)$, 
$ f \( C \, B + s \( C \) \) = f \( C \, B \) . quad "(5.3)" $ <eq:polynomial-shift>

 The identity holds after adjoining any finite collection of commuting scalar indeterminates to the coefficients; in particular, it is a polynomial identity in the coefficients of $s$.]
] <lem:shift-invariance>

#proof[
  Let $R$ be any commutative $bb(F)_2$-algebra, and work in $S = R chevron.l C \, B chevron.r$. Define an $R$-linear derivation $D$ by
  $ D B = C \, #h(2em) D C = 0 . $
  In characteristic two the square of a derivation is again a derivation: the two middle terms in the twice-applied product rule cancel. Since $D^2$ vanishes on $B \, C$, it vanishes on all of $S$. Consequently the Ore extension, followed by the indicated quotient,
  $ cal(E) = S \[ X \; D \] \/ \( X^2 \) \, #h(2em) X q = q X + D q quad \( q in S \) \, $
  has underlying left $S$-module $S xor S X$. Indeed $X^2 q = q X^2 + D^2 q = q X^2$, so $X^2$ is central in the Ore extension and its quotient introduces no relation in $S$. In particular, $S$ embeds in $cal(E)$. The substitutions $x mapsto X$, $y mapsto B$ give
  $ x^2 mapsto 0 \, #h(2em) \[ x \, y \] mapsto C . $
  Equivalently, $cal(E)$ acts on $S$ with $X$ acting by $D$ and elements of $S$ acting by left multiplication. For an element written $q + q' X$, its value on $1$ is its constant term $q$.
  Fix $s in R \[ C \]$, and put $F = B + s \( C \)$. The substitution $B mapsto F$, $C mapsto C$ commutes with $D$, since $D \( s \) = 0$. It therefore extends to an automorphism of $cal(E)$ fixing $X$. Let $h \( x \, y \)$ be the whole bidegree-$\( m \, m + r \)$ component in Lemma 14. Evaluation at $x = X \, y = B$ kills the terms containing $A$ in its $A \, C \, B$ expression, so that $h \( X \, B \) = f \( C \, B \)$ in the embedded subalgebra $S$ of $cal(E)$. Applying the shift automorphism just constructed gives $h \( X \, F \) = f \( C \, F \)$. We may therefore evaluate the even-index product expansion of $h$ term by term in $cal(E)$. Its sum belongs to $S$, so its value on $1$ is exactly $f \( C \, F \)$. The factors of positive index become elements of $S$:
  $ "ad"_F^j X = P_j := "ad"_F^(j - 1) C quad \( j gt.eq 1 \) \, $
  whereas the index-zero factor is $X$. We shall bound the $B$-degree of the constant term of each product separately.
  Write
  $ L = "ad"_B \, #h(2em) Q = "ad"_(s \( C \)) \, #h(2em) K = "ad"_C \, #h(2em) P_j = \( L + Q \)^(j - 1) C . $
  Here $L$ raises $B$-degree by one and $Q$ preserves it. The relations needed below are
  $ Q \( C \) = 0 \, #h(2em) Q K = K Q \, #h(2em) D L = L D + K \, #h(2em) D Q = Q D . $
  For the two smallest positive indices one has
  $ P_1 = C \, quad D P_1 = 0 \, #h(2em) P_2 = \[ B \, C \] \, quad D P_2 = 0 . quad "(5.4)" $ <eq:small-indices>
  For $j gt.eq 2$, every nonzero operator word in $\( L + Q \)^(j - 1) C$ has rightmost operator $L$, because $Q \( C \) = 0$. Thus $P_j$ has no $B$-degree-zero component, and its degree-one component is
  $ \( P_j \)_(\[ 1 \]) = Q^(j - 2) L C . $
  This is killed by $D$, since $D L C = K C = \[ C \, C \] = 0$. As $D$ lowers $B$-degree by one, $D P_j$ has no degree-zero component for any $j gt.eq 1$.
  For $j gt.eq 3$, the degree-two component is explicitly
  $ \( P_j \)_(\[ 2 \]) = sum_(a + b = j - 3) Q^a L Q^b L C . $
  Upon applying $D$, differentiating the rightmost $L$ gives zero, and differentiating the other $L$ gives $Q^a K Q^b L C$. The commutation of $Q$ and $K$ therefore gives
  $ \( D P_j \)_(\[ 1 \]) = \( j - 2 \) Q^(j - 3) K L C . quad "(5.5)" $ <eq:differentiated-linear-part>
  For even $j$ this is zero in $R$. Together with (5.4), these calculations prove the following lower bounds; the zero polynomial satisfies every listed bound:
  $ & P_j & D P_j\
j gt.eq 1 upright(" odd") & 0 & 1\
j gt.eq 2 upright(" even") & 1 & 2 #h(2em) upright("(minimum ") B upright("-degree).") $
  The bound for odd $P_j$ is deliberately weak, so that it includes $P_1 = C$. All these calculations allow constant terms in $s$ and arbitrary scalar coefficients in $R$.
  Now consider one product with $q$ index-zero factors and $e$ positive even-index factors. Move each $X$ to the right using $X P = P X + D P$, and apply the resulting expression to $1$. Every surviving term must use each of the original $q$ copies of $X$ as a differentiation, since a terminal $X$ kills $1$. Repeated use of the product rule assigns these differentiations to positive-index factors to their right. An allocation assigning two differentiations to the same factor vanishes, because $D^2 = 0$. Hence every surviving term is a product in which exactly $q$ distinct positive-index factors have been differentiated once. An undifferentiated positive even-index factor contributes a lower bound of one, and an odd-index factor contributes a lower bound of zero. Differentiating either type increases the respective lower bound by one. The resulting $B$-degree is therefore at least
  $ e + q \, $
  which is precisely the number of all even indices, including zero. If no such allocation is possible the constant term is zero, which also satisfies the bound. Cancellations among allocations cannot create lower-degree terms.
  Lemma 14 now shows that $f \( C \, B + s \( C \) \)$ has no $B$-degree below $r$. On the other hand, $f$ is homogeneous of $B$-degree $r$, and replacing $B$ by $B + s \( C \)$ cannot increase that degree. Its degree-$r$ component is exactly $f \( C \, B \)$, obtained by choosing $B$ at every occurrence. This proves (5.3) over $R$, and in particular over any polynomial ring in scalar indeterminates. ◻
]

=== 5.2 The ordinary Lie image and the dimension bound <the-ordinary-lie-image-and-the-dimension-bound>

#thm([Proposition 5.3.])[
  (The image bound).  #emph[Set $g_k = "ad"_C^k B$ for $k gt.eq 1$. These elements freely generate an ordinary free Lie algebra inside $"Lie"_(bb(F)_2) chevron.l C \, B chevron.r$. For $n > 2$, the image of the leading projection of $"gr"_F^r overline(L)_n$ belongs to its weight-$n$, length-$r$ component, where $"wt" \( g_k \) = 2 k + 1$ and each $g_k$ has length one. The associated graded piece with $r = 0$ is zero.]
] <prop:image-bound>

#proof[
  First suppose $r gt.eq 1$. Encode the associative words of $B$-degree $r$ by the vector-space isomorphism
  $ cal(P)_r : C^(i_0) B C^(i_1) dots.h.c B C^(i_r) mapsto s_0^(i_0) s_1^(i_1) dots.h.c s_r^(i_r) quad upright("in ") bb(F)_2 \[ s_0 \, dots.h \, s_r \] . $
  Put $P = cal(P)_r \( f \)$. For $1 lt.eq i lt.eq r$, let $R_i P$ be its restriction obtained by identifying $s_(i - 1)$ and $s_i$, written in the same polynomial ring $bb(F)_2 \[ t_0 \, dots.h \, t_(r - 1) \]$ for every $i$:
  $ R_i P = P \( t_0 \, dots.h \, t_(i - 2) \, t_(i - 1) \, t_(i - 1) \, t_i \, dots.h \, t_(r - 1) \) . $
  Empty initial or final strings in this formula are omitted. In the coefficient of $lambda$ in $f \( C \, B + lambda C^j \)$, replacing the $i$th $B$ merges its two neighboring powers of $C$ and adds $j$ to their exponent. Its encoding with $r - 1$ remaining $B$’s is consequently $t_(i - 1)^j R_i P$. Lemma 15, applied with the independent scalar $lambda$, gives
  $ sum_(i = 1)^r t_(i - 1)^j R_i P = 0 #h(2em) \( j gt.eq 0 \) . quad "(5.6)" $ <eq:vandermonde-system>
  Taking $j = 0 \, dots.h \, r - 1$ produces a Vandermonde matrix whose determinant is
  $ product_(0 lt.eq a < b lt.eq r - 1) \( t_b - t_a \) . $
  It is a nonzero polynomial over $bb(F)_2$, because the $t_i$ are independent indeterminates. Thus the matrix is invertible over $bb(F)_2 \( t_0 \, dots.h \, t_(r - 1) \)$, and all $R_i P$ vanish. This argument also applies to even $r$; it never divides by $r$ or specializes the $t_i$ to elements of the two-element field. For $r = 1$ the matrix is simply $\( 1 \)$.
  The kernel of the $i$th identification is the principal ideal generated by $d_i = s_(i - 1) - s_i$. These $d_i$ are distinct nonassociate prime linear polynomials. Their individual divisibility therefore implies
  $ d_1 dots.h.c d_r divides P quad upright("in ") bb(F)_2 \[ s_0 \, dots.h \, s_r \] . quad "(5.7)" $ <eq:consecutive-divisibility>
  It remains to translate this associative statement into an ordinary Lie statement.
  Temporarily include $g_0 = B$. The ordinary Lie ideal generated by $B$ in $"Lie"_(bb(F)_2) chevron.l C \, B chevron.r$ is the subalgebra generated by $g_k = "ad"_C^k B$, $k gt.eq 0$. Indeed, this subalgebra contains $B$ and is stable under $"ad"_C$ by the derivation rule and $\[ C \, g_k \] = g_(k + 1)$; the reverse inclusion is immediate. Since $f$ has positive $B$-degree, it belongs to this ordinary Lie subalgebra.
  Expanding the iterated adjoints gives the useful product formula
  $ cal(P)_r \( g_(k_1) dots.h.c g_(k_r) \) = product_(i = 1)^r \( s_(i - 1) - s_i \)^(k_i) = d_1^(k_1) dots.h.c d_r^(k_r) . quad "(5.8)" $ <eq:gap-monomials>
  The variables $d_1 \, dots.h \, d_r \, s_r$ are an invertible linear change of coordinates from $s_0 \, dots.h \, s_r$. In particular, the monomials in the right side of (5.8) are linearly independent. For different product lengths the $B$-degrees differ, so all associative words in the $g_k$, $k gt.eq 0$, are independent. Their ordinary Lie algebra is therefore the ordinary free Lie algebra on these letters, by its embedding in the free associative algebra.
  Write the associative expansion of $f$ uniquely in these independent words. Its encoding lies in $bb(F)_2 \[ d_1 \, dots.h \, d_r \]$. By (5.7), every monomial appearing with nonzero coefficient has positive exponent of every $d_i$. Equivalently, the expansion of $f$ contains no word with any factor $g_0$. The ordinary free Lie algebra on $g_0 \, g_1 \, dots.h$ has a retraction
  $ rho \( g_0 \) = 0 \, #h(2em) rho \( g_k \) = g_k quad \( k gt.eq 1 \) . $
  Its extension to the free associative algebra fixes the expansion of $f$. Hence $rho \( f \) = f$, proving that $f$ belongs to the ordinary free Lie algebra on $g_k$, $k gt.eq 1$. This retraction preserves ordinary Lie membership throughout; no identification with all primitive elements in characteristic two is being made.
  Each $g_k$ contains one $B$ and $k$ copies of $C$. The original weight is therefore $2 k + 1$, and the $B$-count of a Lie word is its length in these generators. This proves the asserted weight and length statement.
  If $r = 0$, then $f$ is an ordinary Lie polynomial in $C$ alone. The ordinary Lie algebra on one generator is its one-dimensional linear span, of original weight two; thus $f = 0$ for $n > 2$. Proposition 13 then gives $"gr"_F^0 overline(L)_n = 0$. The possible boundary $m = 0$ also contributes nothing: its leading component would be an ordinary Lie polynomial in $B$ alone, whose only possible positive weight is one. ◻
]

Define the ordinary free Lie algebra

$ frak(f)_(upright("odd")) = "Lie"_(bb(F)_2) chevron.l z_k : k gt.eq 1 chevron.r \, #h(2em) "wt" \( z_k \) = 2 k + 1 \, $

and give each $z_k$ length one. Write $frak(f)_(upright("odd") \, n \, r)$ for its component of weight $n$ and length $r$, and set

$ d_(n \, r) = dim_(bb(F)_2) frak(f)_(upright("odd") \, n \, r) \, #h(2em) d_n = sum_(r gt.eq 0) d_(n \, r) . quad "(5.9)" $ <eq:free-dimensions>

These are also the corresponding dimensions over $bb(Q)$, by the ordinary free Lie lattice of Lemma 3. The sum is finite: a length-$r$ word has weight at least $3 r$, and only finitely many generators can occur in any fixed weight.

#thm([Corollary 5.4.])[
  (The all-weight upper bound).  #emph[For every $n$ and $r gt.eq 0$ there is an injection 
$ "gr"_F^r overline(L)_n arrow.r.hook frak(f)_(upright("odd") \, n \, r) \, $

 obtained by the leading projection and the identification $g_k arrow.l.r z_k$. In particular, 
$ dim_(bb(Q)) W_n = dim_(bb(F)_2) overline(L)_n lt.eq sum_(r gt.eq 0) d_(n \, r) = d_n . quad "(5.10)" $ <eq:dimension-upper-bound>

]
] <cor:dimension-bound>

#proof[
  For $n > 2$, combine Proposition 13 with Proposition 16. If $n - r$ is odd or negative the source piece is zero by the weights of $A \, C \, B$, and the target piece is likewise zero since the weight of a length-$r$ word in odd-weight letters has parity $r$. The cases $r = 0$ and $m = 0$ were disposed of in Proposition 16. Weights one and two have zero solution space by Lemma 2, and have no generators or Lie words in $frak(f)_(upright("odd"))$. Finally, $F^(n + 1) overline(L)_n = 0$, so this is a finite filtration in weight $n$ and the dimensions of its associated graded pieces sum to $dim_(bb(F)_2) overline(L)_n$. The equality of this dimension with $dim_(bb(Q)) W_n$ is Proposition 6. ◻
]

=== 5.3 Leading Ihara brackets <leading-ihara-brackets>

The upper bound concerns the full equation space. To attain it in Section 8, we will construct elements whose projected leading terms are the $g_k$ and compare their iterated Ihara brackets with ordinary Lie words. The following compatibility is computed in the ambient Lie algebra and does not require closure of $W$.

#thm([Proposition 5.5.])[
  (The leading Ihara bracket).  #emph[Let $psi in F^r overline(L)_n$ and $phi.alt in F^s overline(L)_(n')$, where $n \, n' > 2$ and $r \, s gt.eq 1$. Write $f \, g$ for their leading projections at counts $r \, s$. Their Ihara bracket, computed in the ambient Lie algebra in $x \, y$, belongs to $F^(r + s)$ in the $A \, C \, B$ presentation, and the projection of its component of count $r + s$ is 
$ \[ f \, g \] . quad "(5.11)" $ <eq:leading-ihara>

 This assertion does not require prior closure of the full solution space under the Ihara bracket.]
] <prop:leading-ihara>

#proof[
  We first prove the filtration assertion before applying $A = 0$. The derivation $delta = "ad"_x$ acts on the free $A \, C \, B$ algebra by
  $ delta A = 0 \, #h(2em) delta B = C \, #h(2em) delta C = \[ A \, B \] . $
  Write $delta = delta_(-) + delta_(+)$, where
  $ delta_(-) B = C \, quad delta_(-) A = delta_(-) C = 0 \, #h(2em) delta_(+) C = \[ A \, B \] \, quad delta_(+) A = delta_(+) B = 0 . $
  These two derivations respectively lower and raise the $B$-count by one. In particular, $delta \( F^r \) subset F^(r - 1)$. Directly from the definition of the Ihara derivation,
  $ D_psi A = 0 \, #h(2em) D_psi B = \[ B \, psi \] \, #h(2em) D_psi C = \[ C \, psi \] + \[ B \, delta psi \] . quad "(5.12)" $ <eq:ihara-abc-action>
  The last formula is the derivation identity applied to $\[ x \, B \]$. Thus $D_psi B in F^(r + 1)$ and $D_psi C in F^r$: the outside $B$ in $\[ B \, delta psi \]$ restores the one count that $delta_(-)$ can remove. Replacing a $B$ in a word of count $s$ adds at least $r$ to its count, and replacing a $C$ also adds at least $r$; the derivative of an $A$ vanishes. It follows that
  $ D_psi \( F^s \) subset F^(r + s) . $
  Interchanging $psi \, phi.alt$ and including their ordinary bracket proves the asserted containment of the Ihara bracket.
  Let $chi \, eta$ be the components of $psi \, phi.alt$ of counts $r \, s$. In (5.12), only $chi$ can contribute to the part of the derivation that raises count by exactly $r$. Its action is
  $ A mapsto 0 \, #h(2em) B mapsto \[ B \, chi \] \, #h(2em) C mapsto \[ C \, chi \] + \[ B \, delta_(-) chi \] . $
  Indeed, a higher-count component of $psi$ still has higher count after applying $\[ B \, delta_(-) \( - \) \]$, while $\[ B \, delta_(+) chi \]$ raises the count by two more. This derivation preserves the ideal generated by $A$, so it descends under $A = 0$. The projection commutes with $delta_(-)$, whose induced action on $bb(F)_2 chevron.l C \, B chevron.r$ is the derivation $D$ from Lemma 15. The induced leading action is consequently
  $ B mapsto \[ B \, f \] \, #h(2em) C mapsto \[ C \, f \] + \[ B \, D f \] . $
  By Proposition 16, $f$ is an ordinary Lie polynomial in $g_k$, $k gt.eq 1$; each of these is killed by $D$, because
  $ D g_k = "ad"_C^k \( C \) = 0 quad \( k gt.eq 1 \) . $
  Thus the extra term $\[ B \, D f \]$ vanishes, and the induced derivation on $bb(F)_2 chevron.l C \, B chevron.r$ is $q mapsto \[ q \, f \]$. One can also read $D f = 0$ directly as the coefficient of $lambda$ in (5.3) with $s \( C \) = lambda C$.
  The two Ihara derivations therefore project to $\[ g \, f \]$ and $\[ f \, g \]$, respectively, and the ordinary bracket projects to $\[ f \, g \]$. Their specified combination is
  $ \[ g \, f \] - \[ f \, g \] + \[ f \, g \] = \[ g \, f \] = \[ f \, g \] $
  over $bb(F)_2$. All higher components of $psi$ or $phi.alt$ have already been excluded by the filtration calculation, so this proves (5.11). ◻
]

== 6 A rational Lie algebra of categorical values <sec:category>

The upper bound on the full equation space is now established. To attain it, we construct a rational subspace that is closed under the Ihara bracket and contains an element with nonzero coefficient of $x^(n - 1) y$ in every odd weight $n gt.eq 3$. This section proves the closure property; the next constructs the nonzero values. Only configurations with at most four labels will be needed. We use the parenthesized-chord formalism of Bar-Natan [2] Sections 2–3, restricted to the finite arities and operations specified below. All completions in this section are by weight, and all tensor products of completed spaces are completed by total weight.

We use the standard label sets $\[ k \] = { 1 \, dots.h \, k }$ for $1 lt.eq k lt.eq 4$; other label sets denote their relabeled copies. For such a finite label set $I$, let $cal(T) \( I \)$ be the set of planar binary trees whose leaves are bijectively labeled by $I$. Thus the objects record both parentheses and a linear ordering. Put $frak(t)_I = 0$ for $\| I \| = 1$, and otherwise use the infinitesimal braid algebra on $I$. Over a field $K$ of characteristic zero define a $K$-linear category $cal(C) \( I \; K \)$ by

$ "Hom" \( p \, q \) = hat(U) \( frak(t)_I ⊗ K \) #h(2em) \( p \, q in cal(T) \( I \) \) . $

Composition is multiplication, with the last arrow on the left. Write $1_(p q)$ for the arrow with coefficient $1$, so that $1_(q r) 1_(p q) = 1_(p r)$. Each arrow space carries the coproduct determined by

$ Delta \( t_(i j) \) = t_(i j) ⊗ 1 + 1 ⊗ t_(i j) \, #h(2em) Delta \( 1_(p q) \) = 1_(p q) ⊗ 1_(p q) . $

In particular, the unit coefficient arrow between different objects is distinguished from an identity endomorphism.

Here are all the additional operations that we impose. Relabeling is allowed along every bijection of label sets. For an outer tree on $I$ and fixed trees on disjoint nonempty sets $B_i$, graft the latter at its leaves. On arrows this operation is the algebra homomorphism

$ t_(i j) mapsto t_(B_i B_j) := sum_(a in B_i \, med b in B_j) t_(a b) . quad "(6.1)" $ <eq:category-block-sum>

There is also insertion of a varying tree in one fixed leaf of a fixed outer tree: on arrows this retains each inner chord $t_(a b)$ with its labels. Both operations are used whenever the resulting number of leaves is at most four; single-leaf trees permit identity insertions. These are functors preserving coproducts. Indeed, the disjoint-chord relations and the three-label relations imply the corresponding relations between the block sums in (6.1), by summing first over labels in each block. Inner chords commute with outer block sums: for $a \, b in B_i$ and $c in.not B_i$ the only possibly nonzero terms are $\[ t_(a b) \, t_(a c) + t_(b c) \] = 0$. These observations also show that successive insertions agree with grafting the same trees in one step.

A #emph[compatible derivation of weight $n$] is a family $delta$ of $K$-linear maps on these arrow spaces, raising weight by $n$, such that

$ delta \( b a \) = delta \( b \) a + b delta \( a \) \, #h(2em) Delta delta = \( delta ⊗ upright("id") + upright("id") ⊗ delta \) Delta . $

It must commute with all the operations just specified and vanish on all arrow spaces in arity two. The arity-one derivation is necessarily zero. Let $cal(D)_n \( K \)$ denote this space. Commutators of such families are again compatible derivations, of the sum of their weights.

Set

$ a = \( \( 12 \) 3 \) \, #h(2em) b = \( 1 \( 23 \) \) \, #h(2em) alpha = 1_(a b) \, #h(2em) x = t_12 \, quad y = t_23 . $

Evaluation on $alpha$ will be understood as its coefficient in $hat(U) \( frak(t)_3 ⊗ K \)$.

#thm([Proposition 6.1.])[
  #emph[For $n gt.eq 2$, evaluation $delta mapsto delta \( alpha \)$ takes $cal(D)_n \( bb(Q) \)$ into $W_n$. Its images 
$ V_n = { delta \( alpha \) : delta in cal(D)_n \( bb(Q) \) } \, #h(2em) V = xor.big_(n gt.eq 2) V_n \, $

 form a rational Lie subalgebra under the Ihara bracket (1.5).]
] <prop:categorical-values>

#proof[
  Write $psi = delta \( alpha \)$. The coderivation rule at the group-like arrow $alpha$ says
  $ Delta psi = psi ⊗ 1 + 1 ⊗ psi . $
  Primitives in a characteristic-zero enveloping algebra are its Lie algebra: by the PBW filtration, a primitive of filtration degree $d > 1$ would give a primitive homogeneous polynomial of degree $d$ in a symmetric algebra, whereas its coproduct has a nonzero component of bidegree $\( 1 \, d - 1 \)$. Induction on filtration degree proves the assertion. Now
  $ frak(t)_3 = "Lie"_K chevron.l x \, y chevron.r xor K T \, #h(2em) T = t_12 + t_13 + t_23 \, quad "(6.2)" $ <eq:category-three-split>
  with $T$ central: replacing $t_13$ by $T - x - y$ transforms exactly the three defining relations into the centrality of $T$. Thus a primitive of weight $n gt.eq 2$ is a Lie polynomial $psi \( x \, y \)$.
  Reversing the two children at any fork is insertion, followed if necessary by an inner insertion, of a unit arrow in arity two. Its $delta$-value is zero. The values of unit coefficient arrows add under composition, and inverse unit arrows have opposite values. Relabel $alpha$ by $1 arrow.l.r 3$. Its source $\( \( 32 \) 1 \)$ is carried to $b$ by fork reversals, and its target $\( 3 \( 21 \) \)$ is carried to $a$ in the same way. Its value is therefore both $psi \( y \, x \)$ and $- psi \( x \, y \)$, giving
  $ psi \( x \, y \) + psi \( y \, x \) = 0 . quad "(6.3)" $ <eq:category-antisymmetry>
  For the cyclic relation, use the successive trees $\( \( 12 \) 3 \) \, \( \( 23 \) 1 \) \, \( \( 31 \) 2 \)$. Reassociation on the ordered triples $\( 1 \, 2 \, 3 \) \, \( 2 \, 3 \, 1 \) \, \( 3 \, 1 \, 2 \)$, each followed by a root-fork reversal, forms a cycle of unit arrows. Consequently
  $ psi \( t_12 \, t_23 \) + psi \( t_23 \, t_31 \) + psi \( t_31 \, t_12 \) = 0 . $
  An occurrence of the central $T$ in a Lie monomial of degree greater than one contributes zero. Substitution of $t_31 = T - x - y$ gives
  $ psi \( x \, y \) + psi \( y \, - x - y \) + psi \( - x - y \, x \) = 0 . quad "(6.4)" $ <eq:category-cyclic>
  Figure 2 shows the five four-leaf trees and the two paths of reassociation arrows:
  $ A = \( \( \( 12 \) 3 \) 4 \) \, quad B = \( \( 1 \( 23 \) \) 4 \) \, quad C = \( 1 \( \( 23 \) 4 \) \) \,\
D = \( \( 12 \) \( 34 \) \) \, #h(2em) E = \( 1 \( 2 \( 34 \) \) \) \,\
A arrow.r D arrow.r E \, #h(2em) A arrow.r B arrow.r C arrow.r E . $
  The two edge values on the first path are $psi \( t_13 + t_23 \, t_34 \)$ and $psi \( t_12 \, t_23 + t_24 \)$. Those on the second are $psi \( t_12 \, t_23 \)$, $psi \( t_12 + t_13 \, t_24 + t_34 \)$, and $psi \( t_23 \, t_34 \)$. Both composites are $1_(A E)$, hence
  $ psi \( t_12 \, t_23 + t_24 \) + psi \( t_13 + t_23 \, t_34 \) =  & psi \( t_23 \, t_34 \)\
 & + psi \( t_12 + t_13 \, t_24 + t_34 \) + psi \( t_12 \, t_23 \) . quad "(6.5)" $ <eq:category-pentagon>
  This proves membership in $W_n$ using only the stated operations.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  line((-4.2, 0), (0, 2.4), stroke: (thickness: 0.7pt))
  content((-2.1, 1.2), [$p_1$], anchor: "south-east")
  line((0, 2.4), (4.2, 0), stroke: (thickness: 0.7pt))
  content((2.1, 1.2), [$p_2$], anchor: "south-west")
  line((-4.2, 0), (-2.7, -3), stroke: (thickness: 0.7pt))
  content((-3.45, -1.5), [$p_3$], anchor: "east")
  line((-2.7, -3), (2.7, -3), stroke: (thickness: 0.7pt))
  content((0, -3), [$p_4$], anchor: "south")
  line((2.7, -3), (4.2, 0), stroke: (thickness: 0.7pt))
  content((3.45, -1.5), [$p_5$], anchor: "west")
  line((-4.2, 0.75), (-4.5, 0.4), (-4.8, 0.05), (-5.1, -0.3), (-4.8, 0.05), (-4.5, -0.3), (-4.5, 0.4), (-3.9, -0.3), (-4.2, 0.75), (-3.3, -0.3), stroke: (thickness: 0.65pt))
  content((-5.1, -0.3), [$1$], anchor: "north")
  content((-4.5, -0.3), [$2$], anchor: "north")
  content((-3.9, -0.3), [$3$], anchor: "north")
  content((-3.3, -0.3), [$4$], anchor: "north")
  content((-4.2, -0.78), [$A :\ (((12)3)4)$])
  line((0, 3.15), (-0.6, 2.6), (-0.9, 2.1), (-0.6, 2.6), (-0.3, 2.1), (0, 3.15), (0.6, 2.6), (0.3, 2.1), (0.6, 2.6), (0.9, 2.1), stroke: (thickness: 0.65pt))
  content((-0.9, 2.1), [$1$], anchor: "north")
  content((-0.3, 2.1), [$2$], anchor: "north")
  content((0.3, 2.1), [$3$], anchor: "north")
  content((0.9, 2.1), [$4$], anchor: "north")
  content((0, 1.62), [$D :\ ((12)(34))$])
  line((4.2, 0.75), (3.3, -0.3), (4.2, 0.75), (4.5, 0.4), (3.9, -0.3), (4.5, 0.4), (4.8, 0.05), (4.5, -0.3), (4.8, 0.05), (5.1, -0.3), stroke: (thickness: 0.65pt))
  content((3.3, -0.3), [$1$], anchor: "north")
  content((3.9, -0.3), [$2$], anchor: "north")
  content((4.5, -0.3), [$3$], anchor: "north")
  content((5.1, -0.3), [$4$], anchor: "north")
  content((4.2, -0.78), [$E :\ (1(2(34)))$])
  line((-2.7, -2.25), (-3, -2.6), (-3.6, -3.3), (-3, -2.6), (-2.7, -2.95), (-3, -3.3), (-2.7, -2.95), (-2.4, -3.3), (-2.7, -2.25), (-1.8, -3.3), stroke: (thickness: 0.65pt))
  content((-3.6, -3.3), [$1$], anchor: "north")
  content((-3, -3.3), [$2$], anchor: "north")
  content((-2.4, -3.3), [$3$], anchor: "north")
  content((-1.8, -3.3), [$4$], anchor: "north")
  content((-2.7, -3.78), [$B :\ ((1(23))4)$])
  line((2.7, -2.25), (1.8, -3.3), (2.7, -2.25), (3, -2.6), (2.7, -2.95), (2.4, -3.3), (2.7, -2.95), (3, -3.3), (3, -2.6), (3.6, -3.3), stroke: (thickness: 0.65pt))
  content((1.8, -3.3), [$1$], anchor: "north")
  content((2.4, -3.3), [$2$], anchor: "north")
  content((3, -3.3), [$3$], anchor: "north")
  content((3.6, -3.3), [$4$], anchor: "north")
  content((2.7, -3.78), [$C :\ (1((23)4))$])
  content((0, -0.55), [$p_1+p_2=p_3+p_4+p_5$])
})
  table(
  columns: 4,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Label
], table.cell(rowspan: 1, colspan: 1)[Infinitesimal value
], table.cell(rowspan: 1, colspan: 1)[Label
], table.cell(rowspan: 1, colspan: 1)[Infinitesimal value
]),
  table.cell(rowspan: 1, colspan: 1)[$p_1$
], table.cell(rowspan: 1, colspan: 1)[$psi \( t_13 + t_23 \, t_34 \)$
], table.cell(rowspan: 1, colspan: 1)[$p_3$
], table.cell(rowspan: 1, colspan: 1)[$psi \( t_12 \, t_23 \)$
],
  table.cell(rowspan: 1, colspan: 1)[$p_2$
], table.cell(rowspan: 1, colspan: 1)[$psi \( t_12 \, t_23 + t_24 \)$
], table.cell(rowspan: 1, colspan: 1)[$p_4$
], table.cell(rowspan: 1, colspan: 1)[$psi \( t_12 + t_13 \, t_24 + t_34 \)$
],
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[$p_5$
], table.cell(rowspan: 1, colspan: 1)[$psi \( t_23 \, t_34 \)$
],
)],
    caption: [Figure 2: The five parenthesizations of four ordered leaves. Each arrow reassociates $\( \( I J \) K \)$ to $\( I \( J K \) \)$, with the appropriate fixed subtrees inserted. The labels $p_1 \, dots.h \, p_5$ denote the infinitesimal values in the table, not the arrows themselves. The two paths $sans(A) arrow.r sans(D) arrow.r sans(E)$ and $sans(A) arrow.r sans(B) arrow.r sans(C) arrow.r sans(E)$ have the same unit arrow as composite. Their infinitesimal values add, yielding the pentagon identity. ],
  ) <fig:reassociation>
  It remains to check the bracket, including its sign. Let $d_a \, d_b$ be the loop derivations at $a \, b$. Inner insertion gives $d_a \( x \) = 0$ and $d_b \( y \) = 0$. Differentiating the equality of arrows $alpha y_a = y_b alpha$ gives
  $ psi y + d_a \( y \) = y psi \, #h(2em) d_a \( y \) = \[ y \, psi \] . $
  Outer arity-two insertion also kills $t_13 + t_23$ at $a$, so $d_a \( T \) = 0$. In the decomposition (6.2) its restriction is exactly $D_psi$. An arrow from $a$ to $b$ with coefficient $h$ equals $alpha h_a$; therefore
  $ delta_(a b) \( h \) = psi h + D_psi \( h \) #h(2em) \( h in K chevron.l #h(-1em) chevron.l x \, y chevron.r #h(-1em) chevron.r \) . quad "(6.6)" $ <eq:category-arrow-derivative>
  If another derivation $epsilon$ has value $phi.alt$, their commutator has value
  $ \[ delta \, epsilon \] \( alpha \) = D_psi \( phi.alt \) - D_phi.alt \( psi \) + psi phi.alt - phi.alt psi = { psi \, phi.alt } . $
  Evaluation is thus a Lie homomorphism onto its image. No injectivity of evaluation is required. ◻
]

#thm([Lemma 6.2.])[
  (Rational finite data).  #emph[For every $n > 0$ and every characteristic-zero extension $K \/ bb(Q)$, 
$ cal(D)_n \( K \) = cal(D)_n \( bb(Q) \) ⊗_(bb(Q)) K . $

 For $n gt.eq 2$, the image of evaluation is $V_n ⊗_(bb(Q)) K$. In particular, if the coefficient of a fixed associative word is nonzero on a complex categorical value of weight $n$, it is nonzero on some rational categorical value of that weight.]
] <lem:rational-descent>

#proof[
  At each arity choose a base object $o$. For a composition derivation put $h_p = delta \( 1_(o p) \)$, with $h_o = 0$, and let $d$ be its derivation on loops at $o$. Since every arrow has the factorization $1_(o q) thin u_o thin 1_(p o)$, the product and inverse rules force
  $ delta_(p q) \( u \) = h_q u + d \( u \) - u h_p . quad "(6.7)" $ <eq:category-finite-data>
  Conversely, an algebra derivation $d$ and elements $h_p$ define a composition derivation by this formula. In weight $n$ the data are
  $ h_p in U \( frak(t)_I \)_n \, #h(2em) d \( t_(i j) \) in U \( frak(t)_I \)_(n + 1) . $
  There are finitely many objects and generators, and every displayed space is finite dimensional over $bb(Q)$.
  The conditions that $d$ preserve the defining braid relations are rational linear equations in these data. The coderivation conditions are equivalent to primitivity of all $h_p$ and $d \( t_(i j) \)$: necessity follows on the reference unit arrows and generator loops, and sufficiency follows by the product rule and (6.7). These are again finitely many rational linear equations, since coproducts in the indicated weights take values in finite sums of finite-dimensional spaces.
  Finally, there are only finitely many label permutations, object graftings, and inner placements through arity four. For each associated functor $rho$, the condition $delta rho = rho delta$ need only be checked on the reference unit arrows and generator loops: all other arrows follow by composition, the product rule, and continuity. These checks, and the requirement of zero arity-two action, are rational linear equations. Thus $cal(D)_n$ is the kernel of a linear map between finite-dimensional rational spaces. Kernels and images of such maps commute with scalar extension. Evaluation and coefficient extraction are rational linear maps, proving the last assertion as well. ◻
]

== 7 Holonomy and odd depth-one values <sec:holonomy>

By Lemma 20, a complex categorical value with nonzero coefficient of $x^(n - 1) y$ gives a rational value with the same nonvanishing property. We construct these complex values directly from a flat connection. This follows the associator approach to odd-weight elements in [6] Proposition 6.3; we include the regularization and compatibility arguments needed here. The section first constructs regularized transport (Proposition 21), then compares the two transport rules through their operator logarithm, and finally extracts the nonzero coefficient in Proposition 23.

=== 7.1 Tree endpoints and regularized transport <tree-endpoints-and-regularized-transport>

Write $lambda = \( 2 pi i \)^(- 1)$ and

$ X_I = { \( z_i \)_(i in I) in bb(C)^I : z_i eq.not z_j upright(" for ") i eq.not j } . $

On $X_I$ consider the universal logarithmic braid connection [11] Section 1.3

$ Omega = lambda sum_(i < j) t_(i j) thin d log \( z_i - z_j \) \, #h(2em) d g = Omega g . quad "(7.1)" $ <eq:holonomy-connection>

At every fixed weight this is an ordinary differential equation in a finite-dimensional nilpotent quotient of the enveloping algebra. Its solution is the finite sum of iterated integrals in that quotient, with later differentials multiplying on the left.

The connection is flat. Its coefficients are closed; terms supported on four different labels commute; and the remaining terms in $Omega and Omega$ vanish by the three-label braid relations and

$ d log \( z_i - z_j \) and d log \( z_j - z_k \) + d log \( z_j - z_k \) and d log \( z_k - z_i \) + d log \( z_k - z_i \) and d log \( z_i - z_j \) = 0 . $

This is Arnold’s logarithmic-form relation [1]. It follows by putting $u = z_i - z_j$, $v = z_j - z_k$ and using $z_k - z_i = - u - v$. The usual homotopy variation formula for an ordinary differential equation now shows that transport is homotopy invariant: the variation of transport with fixed endpoints is the integral of its curvature conjugated by partial transports, and is zero here. Alternatively this formula follows by differentiating the finite iterated-integral expression in each weight. Since $Omega$ is primitive, transport is group-like. Indeed its coproduct and the tensor square of transport solve the same equation with form $Omega ⊗ 1 + 1 ⊗ Omega$ and initial value $1$.

We first define the endpoint data for a fixed choice of scales. For an internal node $d$ of a tree $p in cal(T) \( I \)$ assign a scale $s_d = epsilon.alt^(a_d)$, with $a_(upright("root")) = 0$ and exponents strictly increasing along descent. Anchor the root at $0$. The left child of a node has its anchor at that node’s anchor, and the right child has its anchor displaced by $s_d$; repeat down the tree. Thus the coordinate of a leaf is explicitly

$ z_i \( epsilon.alt \) = sum_(d upright(" above ") i) upright(bold(1))_({ i upright(" lies in the right child of ") d }) epsilon.alt^(a_d) . quad "(7.2)" $ <eq:holonomy-tree-coordinate>

For sufficiently small positive $epsilon.alt$ these are distinct real points in the prescribed leaf order. The curve $epsilon.alt mapsto \( z_i \( epsilon.alt \) \)_(i in I)$ is the #emph[collar] of $p$. For example, the three-leaf objects $a = \( \( 12 \) 3 \)$ and $b = \( 1 \( 23 \) \)$ give respectively $\( 0 \, epsilon.alt^u \, 1 \)$ and $\( 0 \, 1 \, 1 + epsilon.alt^v \)$, with $u \, v > 0$. Thus the coordinate $\( z_2 - z_1 \) \/ \( z_3 - z_1 \)$ approaches $0$ and $1$ from inside the real interval, as will be used for reassociation. Let

$ K_d = sum_(i upright(" in the left child of ") d\
j upright(" in the right child of ") d) t_(i j) \, #h(2em) E_p \( epsilon.alt \) = exp (lambda sum_d K_d log s_d) $

for the object $p$. All $K_d$ of a fixed tree commute. Disjoint nodes are immediate from the disjoint-chord relation. For nested nodes, any chord within the smaller cluster commutes with the total of the chords from that cluster to a fixed outside point, since the two incident terms give $\[ t_(i j) \, t_(i k) + t_(j k) \] = 0$; summing proves the claim.

For these chosen collar families, a path between limiting endpoints means a homotopy class represented by an initial outward collar, a fixed piecewise smooth path between ordinary configurations, and a terminal inward collar. Denote their groupoid by $cal(P) \( I \)$. Truncations at different $epsilon.alt$ are identified by collar segments. It is an ordinary fundamental groupoid after identifying each limiting endpoint with a chosen point on its collar. Different admissible exponent systems will be compared below, rather than identified in this definition.

For $gamma : p arrow.r q$, truncate the collars at $epsilon.alt$ and write $G \( gamma_epsilon.alt \)$ for ordinary transport. The proposed regularized rule is

$ H_(+) \( gamma \) = lim_(epsilon.alt arrow.r 0^(+)) E_q \( epsilon.alt \)^(- 1) G \( gamma_epsilon.alt \) E_p \( epsilon.alt \) . quad "(7.3)" $ <eq:holonomy-regularized>

We also consider the rule $H_(-)$ obtained by conjugating the path and replacing every chord $t_(i j)$ by $- t_(i j)$; its endpoint frame is $E_p^(- 1)$. Existence of these limits is part of the next proposition.

The path representatives for the two insertion operations are equally concrete. For outer insertion, replace an outer coordinate $z_i \( s \)$ by the cluster $z_i \( s \) + epsilon.alt^M w_(i a)$, where the $w_(i a)$ are fixed along the outer path at each $epsilon.alt$ and give the coordinates of the inserted tree. For inner insertion, fix the outer anchors and let one such cluster follow a scaled inner path $epsilon.alt^M w_(i a) \( s \)$. Use nested smaller scales within each tree, and choose the inserted scale sufficiently small relative to every outer separation. These recipes are used only when the resulting number of labels is at most four. The proof below establishes that they define coherent operations on continued path classes, independent of the sufficiently separated scale choices.

#thm([Proposition 7.1.])[
  (Regularized transport).  #emph[For the tree endpoints and frames just defined, (7.3) has a limit in every weight. The limit is independent of the admissible scale exponents under real interpolation of the endpoint collars. The insertion recipes define coherent operations on the continued path classes, and the limit respects relabeling, outer block insertion, and inner insertion. The same assertions hold for $H_(-)$. The two transport rules agree on all arity-two paths, including paths reversing the two real points.]
] <prop:regularized-holonomy>

#proof[
  #emph[Convergence at each endpoint.] If $d$ is the lowest common ancestor of $i \, j$, formula (7.2) gives
  $ z_i - z_j = sigma_(i j) epsilon.alt^(a_d) \( 1 + r_(i j) \( epsilon.alt \) \) \, #h(2em) sigma_(i j) in { 1 \, - 1 } \, quad "(7.4)" $ <eq:holonomy-collar-difference>
  where $r_(i j)$ is a finite signed sum of powers $epsilon.alt^(a_e - a_d)$ with positive exponents. Choose a positive lower bound $eta$ for all these exponent gaps. Then
  $ r_(i j) = O \( epsilon.alt^eta \) \, #h(2em) r'_(i j) = O \( epsilon.alt^(eta - 1) \) \, #h(2em) Omega = lambda sum_d K_d thin d log s_d + R \( epsilon.alt \) thin d epsilon.alt \, $
  where every coefficient of $R$ is $O \( epsilon.alt^(eta - 1) \)$. The sign $sigma_(i j)$ contributes no logarithmic differential.
  Here and below estimates are at a fixed weight cutoff $N$, using any norm on the finite-dimensional quotient by weights greater than $N$. Changing from $g$ to $E_p^(- 1) g$ removes the singular term exactly, because the $K_d$ commute. The remaining form is $E_p^(- 1) R E_p thin d epsilon.alt$. In weight at most $N$, conjugation adds only polynomial powers of $log epsilon.alt$, so its norm is bounded by
  $ C_N epsilon.alt^(eta - 1) \( 1 + \| log epsilon.alt \| \)^N thin d epsilon.alt . quad "(7.5)" $ <eq:holonomy-collar-bound>
  Its integral between $0$ and $epsilon.alt$ is $O_N \( epsilon.alt^eta \( 1 + \| log epsilon.alt \| \)^N \)$. The finite iterated-integral formula, or the differential equation in the truncated algebra, therefore proves convergence and gives the same bound for the difference between collar transport in these frames and the identity.
  The collar bound proves the limit in (7.3); concatenation, homotopy invariance and group-likeness pass to the limit. Different choices of middle representatives of a continued homotopy class give the same answer by flatness.
  #emph[Independence of endpoint scales.] To check exponent independence, interpolate two systems of exponents linearly with a parameter $u in \[ 0 \, 1 \]$. The inequalities between parent and child exponents persist, and their finitely many gaps have a uniform positive lower bound $eta$. On this interpolation at fixed $epsilon.alt$,
  $ \| r_(i j) \| lt.eq C epsilon.alt^eta \, #h(2em) \| partial_u r_(i j) \| lt.eq C epsilon.alt^eta \| log epsilon.alt \| . $
  Again the singular part is precisely $E^(- 1) d E$ before changing frame. The remaining form on the interpolation has integral norm at most $C_N epsilon.alt^eta \( 1 + \| log epsilon.alt \| \)^(N + 1)$ after changing frame. Its transport tends to the identity. Thus identifying endpoints by these real interpolation paths does not change (7.3).
  #emph[The two insertion identities.] We have constructed transport on $cal(P) \( I \)$, independently of the endpoint exponents. It remains to verify the insertion operations required of a functor to the chord categories in Section 6. We first compare the connection forms for each kind of insertion, then check the operations on path classes. On a truncated outer path of the above form, there are constants $c \, K > 0$ such that all distinct outer coordinates are separated by at least $c epsilon.alt^K$. Their total variations are bounded independently of $epsilon.alt$, and the integral norms of their logarithmic differences are $O \( 1 + \| log epsilon.alt \| \)$. These statements follow from (7.4) on collars and compactness on the middle path.
  Insert fixed configurations at offsets of size $O \( epsilon.alt^M \)$, with their own smaller nested scales, and choose $M > 2 K$, also larger than all outer scale exponents. Write $D = z_i - z_j$ for an outer difference and $e$ for the constant difference of the two inserted offsets. Then
  $ d log \( D + e \) - d log D = - frac(e thin d D, D \( D + e \)) \, #h(2em) integral lr(|d log \( D + e \) - d log D|) lt.eq C epsilon.alt^(M - 2 K) . quad "(7.6)" $ <eq:holonomy-outer-error>
  Internal differences are constant along the outer path. Replacing all cross-cluster forms by the outer forms gives precisely the connection obtained from (7.1) by $t_(i j) mapsto t_(B_i B_j)$. A difference of iterated integrals of length at most $N$ is expanded by changing one factor at a time. The error bound (7.6) and the logarithmic bounds for the other factors give an error bounded by a positive power of $epsilon.alt$ times a power of $1 + \| log epsilon.alt \|$. Multiplication by the two endpoint frames preserves convergence to zero: their coefficients of weight at most $N$ are polynomials in $log epsilon.alt$. A single bound sufficient for all these errors is
  $ C_N epsilon.alt^gamma \( 1 + \| log epsilon.alt \| \)^(3 N) \, #h(2em) gamma > 0 . quad "(7.7)" $ <eq:holonomy-insertion-bound>
  The full endpoint frame factors exactly as the outer frame under the block substitution, times the internal frames of the fixed inserted trees. The latter frames are the same at both endpoints, and every inner chord commutes with every outer block sum, as checked in Section 6. They therefore cancel from normalized transport. This proves compatibility with outer insertion.
  For inner insertion, keep the outer configuration fixed and insert a varying inner path $xi$ scaled uniformly by $epsilon.alt^M$. Choose $M > K$, where $c epsilon.alt^K$ bounds the distance between its anchor and outside points from below. Inner coordinate variations are bounded as above. Each cross-cluster differential now has integral norm at most $C epsilon.alt^(M - K)$; the inner logarithmic differentials are unchanged by uniform scaling. The same iterated-integral argument gives (7.7). There is one additional frame factor. If $B$ is the inner label set, it is
  $ exp #scale(x: 120%, y: 120%)[\(] lambda M log epsilon.alt thin T_B #scale(x: 120%, y: 120%)[\)] \, #h(2em) T_B = sum_({ i \, j } subset B) t_(i j) = sum_(d upright(" inner")) K_d . quad "(7.8)" $ <eq:holonomy-central-scale>
  Indeed scaling multiplies every inner scale by $epsilon.alt^M$. The total chord $T_B$ is central in $frak(t)_B$, by summing its three-label relations. All outer frame factors commute with inner chords as well. These common factors at the two endpoints cancel, leaving the unscaled inner transport embedded with its original labels. The argument includes insertion into a single leaf. For sufficiently small $epsilon.alt$ all the cabled paths remain in the configuration space and vary continuously with $epsilon.alt$; after collar identification they consequently define a single continued homotopy class. A homotopy of representatives has a compact middle part, so the inserted scales can be chosen sufficiently small uniformly on it; applying the same insertion throughout gives a homotopy of the cabled paths. Increasing the scale exponent also gives a homotopy through collision-free paths. Thus the path operations are well defined on the continued classes and compatible with concatenation, and the limiting identities are identities for these operations.
  #emph[Coherence of the path operations.] For truncated outer and inner paths, with parameters $s \, t in \[ 0 \, 1 \]$ and the uniform bounds above, use the homotopy square
  $ F \( s \, t \)_(i a) = z_i \( s \) + epsilon.alt^M w_(i a) \( t \) . $
  If $\| z_i \( s \) - z_j \( s \) \| gt.eq c epsilon.alt^K$ and $\| w_(i a) \( t \) \| lt.eq C$, then distinct clusters remain separated by $c epsilon.alt^K - 2 C epsilon.alt^M > c epsilon.alt^K \/ 2$ for sufficiently small $epsilon.alt$ and $M > 2 K$; within a cluster, differences are $epsilon.alt^M \( w_(i a) \( t \) - w_(i b) \( t \) \) eq.not 0$. Thus the two boundary routes give the same path class. Nested insertions agree after flattening, since $z + epsilon.alt^M \( w + epsilon.alt^N v \) = z + epsilon.alt^M w + epsilon.alt^(M + N) v$. The exponent-interpolation estimate identifies other admissible scale choices with these, with normalized transport tending to the identity. The commuting frame factors above therefore identify these operations exactly. For a one-leaf outer tree, restoring root scale one uses a positive real dilation by $rho$; its transport is $exp \( lambda log rho thin T_B \)$ and cancels from normalized transport at the two endpoints by centrality of $T_B$.
  #emph[The second transport rule and arity two.] For $H_(-)$, apply the same construction to $macron(gamma)$ with $t_(i j)$ replaced by $- t_(i j)$ and endpoint frame $E_p^(- 1)$. All estimates and cancellation identities just proved remain valid; relabeling is immediate for both rules. In arity two the root scale is $1$, and the difference of the two endpoint coordinates is $1$ or $- 1$. Every path has logarithmic-difference integral $k pi i$ for some integer $k$, of the parity determined by the endpoint orders. Its first holonomy is $exp \( k t_12 \/ 2 \)$. Conjugating the path negates $k$, and negating the chord negates it once again, so the second holonomy is the same. This checks both full turns and half-turns. ◻
]

=== 7.2 Comparison of the completed path categories <comparison-of-the-completed-path-categories>

The two transport rules now respect exactly the operations imposed in Section 6. To compare them by an automorphism of the chord category, we first show that each becomes an isomorphism after completion. Linearize $cal(P) \( I \)$ over $bb(C)$. At an object, filter its loop group algebra by powers of the augmentation ideal; transport this filtration to every arrow space by any chosen reference path. Changing the reference path multiplies by a group element and preserves each filtration step. Write $accent(bb(C) cal(P) \( I \), ̂)$ for the resulting completion, with coproduct $Delta gamma = gamma ⊗ gamma$.

The following associated-graded comparison is the standard pure-braid holonomy argument; compare [2] Proposition 3.6. We give the meridian and completion steps for the path categories just constructed.

#thm([Lemma 7.2.])[
  #emph[Each of $H_(+)$ and $H_(-)$ extends to an isomorphism of the completed linear path categories with $cal(C) \( I \; bb(C) \)$. Both preserve coproducts and all specified operations, and their associated graded maps are identical.]
] <lem:holonomy-isomorphism>

#proof[
  Fix an object, let $P = pi_1 \( X_I \)$ and let $I_P$ be the augmentation ideal in $bb(C) \[ P \]$. Pair-collision meridians normally generate $P$. To see this directly, fill a loop by a disk in $bb(C)^I$ and perturb its interior to meet the collision hyperplanes transversely in finitely many smooth points, avoiding their complex-codimension-two intersections. Removing small disks about these points expresses the loop as a product of conjugated positive or negative meridians. Meridians around the same hyperplane are conjugate, since its smooth part outside the other hyperplanes is path connected. It follows that their classes generate $I_P \/ I_P^2$. They are also independent: the winding numbers of the functions $z_i - z_j$ take value $1$ on the corresponding positive meridian and $0$ on all the others.
  Every augmentation associated graded algebra is generated by its degree-one part, since $I_P^r \/ I_P^(r + 1)$ is spanned by products of $r$ classes from $I_P \/ I_P^2$. These meridian classes satisfy the infinitesimal braid relations. Near a disjoint pair of collisions the two local meridians commute. Near a triple collision, consider the orbit loop rotating the small three-point cluster simultaneously through $2 pi$. It commutes with every local meridian: a circle action carries any such loop through a homotopy whose two boundary composites are the two orders of these loops. Its degree-one class is the sum of the three pair-meridian classes, because each of the three differences winds once and all other differences wind zero times. The degree-two commutator therefore says $\[ t_(i j) \, t_(i k) + t_(j k) \] = 0$ (the commutator with $t_(i j)$ itself is zero). Transporting these local loops to the basepoint only changes them by conjugation, which changes their classes by terms in $I_P^2$ and does not affect their degree-two commutators. Hence there is a surjective graded algebra map
  $ f : U \( frak(t)_I ⊗ bb(C) \) arrow.r "gr"_(I_P) bb(C) \[ P \] . quad "(7.9)" $ <eq:holonomy-meridian-surjection>
  Residues show that $H_(+)$ of a positive pair meridian is $1 + t_(i j) + upright("terms of weight at least two")$: the integral of the corresponding logarithmic form is $2 pi i$. For $H_(-)$ both the turn and the chord change sign, giving the same result. Endpoint normalization conjugates loop transport by a series with constant term $1$ and hence does not change its degree-one term. Thus both holonomies are filtered and each induces a graded map
  $ g : "gr"_(I_P) bb(C) \[ P \] arrow.r U \( frak(t)_I ⊗ bb(C) \) quad upright("with") quad g f \( t_(i j) \) = t_(i j) . $
  Since the chords generate the enveloping algebra, $g f = upright("id")$. Surjectivity of $f$ now implies that $f$ and $g$ are inverse isomorphisms. In particular both associated graded holonomies are the same inverse of (7.9).
  An isomorphism on associated graded spaces lifts inductively to an isomorphism on every finite filtration quotient: lift the constant term, then correct the error successively in each weight; injectivity follows by the first nonzero weight. Passing to inverse limits proves the completed assertion on loop algebras. A reference path identifies each other arrow space with a loop-algebra torsor, so the same assertion holds on the whole category. Coproduct preservation follows from group-likeness, and preservation of insertions and relabeling follows from Proposition 21, first on paths and then on their linear completions by continuity. ◻
]

We can now compare the two isomorphisms on the same category:

$ S = H_(-) H_(+)^(- 1) : cal(C) \( I \; bb(C) \) arrow.r cal(C) \( I \; bb(C) \) . $

It fixes the objects, preserves the coproducts and all operations, and is the identity on arity two. Its associated graded is the identity, so $S - upright("id")$ raises weight on every arrow space. The operator

$ delta = log S = sum_(j gt.eq 1) frac(\( - 1 \)^(j + 1), j) \( S - upright("id") \)^j quad "(7.10)" $ <eq:holonomy-operator-log>

is well defined weight by weight and is a compatible derivation and coderivation. Here is a direct justification of both rules. Modulo weights greater than $N$, the binomial polynomial

$ S^s = sum_(j = 0)^N binom(s, j) \( S - upright("id") \)^j $

agrees with the usual power for every nonnegative integer $s$. The assertions that it preserve composition, coproduct, and every insertion are polynomial identities in $s$. They hold at all such integers and hence identically. For the coproduct use the tensor product truncated by total weight $N$. Differentiating at $s = 0$ gives exactly the derivation and coderivation rules for (7.10), as well as compatibility with the operations. Taking homogeneous components gives $delta_n in cal(D)_n \( bb(C) \)$ for all $n > 0$.

=== 7.3 A nonzero depth-one value <a-nonzero-depth-one-value>

The compatible derivations are now available. We evaluate their homogeneous components on the reassociation unit arrow and compare this operator-logarithm value with the holonomy of a real path.

#thm([Proposition 7.3.])[
  #emph[For every odd $n gt.eq 3$ there exists $psi_n in V_n$ for which the coefficient of $x^(n - 1) y$ is nonzero. Equivalently, its ordinary $y$-depth-one part is a nonzero multiple of $"ad"_x^(n - 1) y$.]
] <prop:odd-depth-one>

#proof[
  Use the objects $a \, b$ and unit arrow $alpha$ from Section 6. Let $beta$ be the real order-preserving path of reassociation from $a$ to $b$, and put
  $ Phi = H_(+) \( beta \) \, #h(2em) U = S \( alpha \) \, #h(2em) theta = S \|_("End" \( a \)) . $
  We identify $Phi \, U$ with arrow coefficients. Since an arrow with coefficient $h$ is $alpha h_a$, one has exactly
  $ S_(a b) \( h \) = U theta \( h \) . quad "(7.11)" $ <eq:holonomy-arrow-action>
  The path $beta$ is real, so its conjugate is itself and $H_(-) \( beta \) = Phi \( - t_(i j) \)$. Hence
  $ U theta \( Phi \) = Phi \( - t_(i j) \) . quad "(7.12)" $ <eq:holonomy-exact-comparison>
  Source $x$ and target $y$ are fixed by the arity-two insertion operations. Applying $S$ to $alpha y_a = y_b alpha$ therefore yields
  $ theta \( x \) = x \, #h(2em) theta \( y \) = U^(- 1) y U . quad "(7.13)" $ <eq:holonomy-source-action>
  The source total chord $T$ is fixed as well.
  The linear term of $Phi$ is zero. Along a real order-preserving path the sign of each difference is constant, so its integral is the logarithm of the ratio of endpoint absolute differences. Normalizing by the frames subtracts the logarithms of their lowest-common-ancestor scales. By (7.4), each remaining ratio tends to $1$. This proves the claim for every chord separately. As $theta$ preserves filtration, equation (7.12) implies that $U$ too has zero linear term. Both series are group-like. Their logarithms are primitive and have weight at least two, so (6.2) places these logarithms in the completed free Lie algebra on $x \, y$. Every such Lie monomial uses both letters, since the free Lie algebra on one letter has only weight one. Consequently $Phi \, U$ depend only on $x \, y$ and
  $ U theta \( Phi \) = Phi \( - x \, - y \) \, #h(2em) Phi - 1 \, med U - 1 in J \, quad "(7.14)" $ <eq:holonomy-exact-xy>
  where $J$ is the closed two-sided ideal of series having at least one $y$ in $bb(C) chevron.l #h(-1em) chevron.l x \, y chevron.r #h(-1em) chevron.r$.
  Conjugation in (7.13) changes $y$ only by terms in $J^2$, because $U - 1 in J$. Substitution therefore gives
  $ \( theta - upright("id") \) \( J^r \) subset.eq J^(r + 1) quad \( r gt.eq 1 \) \, #h(2em) theta equiv upright("id") med \( mod med J^2 \) $
  on the full series algebra (it fixes the pure-$x$ terms). Reducing (7.14) modulo $J^2$ gives
  $ U - 1 = Phi \( - x \, - y \) - Phi \( x \, y \) med \( mod med J^2 \) . quad "(7.15)" $ <eq:holonomy-unit-difference>
  This is a statement about the image of the unit arrow. To pass to its infinitesimal value, put $N = S_(a b) - upright("id")$ on this arrow space. By (7.11), for $h in J$,
  $ N \( h \) = \( U - 1 \) theta \( h \) + \( theta \( h \) - h \) in J^2 . $
  More generally $N \( J^r \) subset.eq J^(r + 1)$ for $r gt.eq 1$. Since $N \( 1 \) = U - 1 in J$, all $N^j \( 1 \)$ with $j gt.eq 2$ belong to $J^2$. The operator logarithm consequently gives
  $ delta \( alpha \) = U - 1 = Phi \( - x \, - y \) - Phi \( x \, y \) med \( mod med J^2 \) . quad "(7.16)" $ <eq:holonomy-log-depth-one>
  It remains to compute a single convergent coefficient of $Phi$. Set the central $T$ to zero and use $s = \( z_2 - z_1 \) \/ \( z_3 - z_1 \)$. Writing the three differences as a common factor times $s \, s - 1 \, 1$ shows that the common logarithmic differential has coefficient $T$, while the remaining connection is
  $ lambda (x frac(d s, s) + y frac(d s, s - 1)) \, #h(2em) 0 < s < 1 . quad "(7.17)" $ <eq:holonomy-interval-connection>
  The reassociation path runs from $s = 0$ to $s = 1$ with positive real tangents. With the convention $d g = Omega g$, the coefficient of $x^(n - 1) y$ has $y$ at the earliest integration time. Thus for $n gt.eq 2$ it is
  $ \[ x^(n - 1) y \] Phi & = lambda^n integral_(0 < s_1 < dots.h.c < s_n < 1) frac(d s_1, s_1 - 1) frac(d s_2, s_2) dots.h.c frac(d s_n, s_n)\
 & = - frac(lambda^n, \( n - 1 \) !) integral_0^1 frac(\( - log t \)^(n - 1), 1 - t) thin d t = - lambda^n sum_(q gt.eq 1) 1 / q^n . quad "(7.18)" $ <eq:holonomy-zeta-integral>
  Here $\[ w \]$ denotes the coefficient of the associative word $w$. To justify convergence and the last equality, expand $\( 1 - t \)^(- 1) = sum_(q gt.eq 0) t^q$ and apply monotone convergence to the nonnegative integrand; substitution $t = e^(- u)$ gives the individual integrals $\( n - 1 \) ! \/ \( q + 1 \)^n$. The series converges for $n gt.eq 2$. Regularization does not change this coefficient. Its frame factors are pure-$y$ series on the left and pure-$x$ series on the right; a nonconstant factor would make a word begin with $y$ or end with $x$, whereas $x^(n - 1) y$ does neither.
  Negating both arguments multiplies a weight-$n$ word by $\( - 1 \)^n$. Equations (7.16) and (7.18) therefore give, for odd $n gt.eq 3$,
  $ \[ x^(n - 1) y \] delta_n \( alpha \) = 2 lambda^n sum_(q gt.eq 1) 1 / q^n eq.not 0 . quad "(7.19)" $ <eq:holonomy-nonzero-odd>
  This only uses positivity of the real series, with no arithmetic independence assertion. The functional $\[ x^(n - 1) y \]$ is rational on the finite data of Lemma 20. Its nonvanishing on $delta_n in cal(D)_n \( bb(C) \)$ implies nonvanishing on some $cal(D)_n \( bb(Q) \)$, and evaluation gives the required $psi_n in V_n$. Finally, Lie elimination, or direct induction on bracketed words with one $y$, shows that the weight-$n$, depth-one free Lie space is the line spanned by $"ad"_x^(n - 1) y$; its $x^(n - 1) y$ coefficient is $1$. ◻
]

== 8 Integral generators and the dimension squeeze <sec:induction>

We now combine the upper bound on the full equation space with the odd-weight values constructed by holonomy. The integral choice of generators is part of the argument: a rational depth-one value need not initially have the desired reduction modulo two.

=== 8.1 Depth and integral independence <depth-and-integral-independence>

For a Lie polynomial in $x \, y$, its ordinary $y$-depth is the smallest number of occurrences of $y$ in any nonzero associative word. Write $cal(D)^p L$ for the subspace of depth at least $p$. A homogeneous Lie polynomial of weight greater than one has depth at least one, since the free Lie algebra on $x$ alone has no such homogeneous component. This depth is distinct from the $B$-count used after reduction modulo two: $C = \[ x \, y \]$ contributes one $y$ but has $B$-count zero.

#thm([Lemma 8.1.])[
  #emph[If $psi in cal(D)^p L$ and $phi.alt in cal(D)^q L$, then 
$ { psi \, phi.alt } in cal(D)^(p + q) L . $

 Consequently every Lie word of length at least two in homogeneous elements of weights greater than one has zero depth-one component.]
] <lem:depth-addition>

#proof[
  An application of $D_psi$ replaces one occurrence of $y$ by $\[ y \, psi \]$, while it kills $x$. Each nonzero resulting word therefore has at least $p$ more occurrences of $y$ than the original word. Thus $D_psi \( phi.alt \) in cal(D)^(p + q) L$. The same reasoning applies to $D_phi.alt \( psi \)$, and the ordinary bracket also adds depth. Equation (1.5) proves the assertion. Its consequence follows by induction on the length of the Lie word. ◻
]

#thm([Lemma 8.2.])[
  #emph[Let $K$ be a finite free $bb(Z)_(\( 2 \))$-module, and suppose that $w_1 \, dots.h \, w_s in K$ have linearly independent reductions in $K \/ 2 K$. Then they are linearly independent over $bb(Q)$, and 
$ (sum_(i = 1)^s bb(Q) w_i) ∩ K = sum_(i = 1)^s bb(Z)_(\( 2 \)) w_i . $

]
] <lem:hall-saturation>

#proof[
  In a nonzero rational relation, multiply by a rational scalar so that every coefficient belongs to $bb(Z)_(\( 2 \))$ and at least one is a unit. Reduction modulo two gives a contradiction.
  Now let $v = sum_i c_i w_i in K$, with $c_i in bb(Q)$. If some $c_i in.not bb(Z)_(\( 2 \))$, let $e gt.eq 1$ be the smallest integer for which every $2^e c_i$ belongs to $bb(Z)_(\( 2 \))$. At least one of these coefficients is a unit, whereas
  $ sum_i \( 2^e c_i \) w_i = 2^e v in 2 K . $
  Reduction gives the same contradiction. Thus all the $c_i$ belong to $bb(Z)_(\( 2 \))$, proving the equality. ◻
]

Let $V = xor.big_(n gt.eq 2) V_n$ be the rational subalgebra of categorical values from Proposition 19, so that $V_n subset W_n$. Let $K_n$ be the ordinary free-Lie $bb(Z)_(\( 2 \))$-lattice of weight $n$, and put

$ M_n = V_n ∩ K_n \, #h(2em) L_n = W_n ∩ K_n . $

By Proposition 6, their reductions $overline(M)_n subset overline(L)_n subset K_n \/ 2 K_n$ have dimensions $dim_(bb(Q)) V_n$ and $dim_(bb(Q)) W_n$, respectively. The Ihara bracket has integral coefficients on Lie words. Since $V$ is a Lie subalgebra, $M = xor.big_n M_n$ is closed under that bracket.

Recall the free Lie algebra

$ frak(f)_(upright("odd")) = "Lie"_(bb(F)_2) chevron.l z_k : k gt.eq 1 chevron.r \, #h(2em) "wt" \( z_k \) = 2 k + 1 \, $

and let $d_(n \, r)$ and $d_n = sum_r d_(n \, r)$ be its dimensions in weight $n$ and length $r$, and in weight $n$, respectively. These dimensions agree with their characteristic-zero counterparts by Lemma 3. Corollary 17 gives

$ dim_(bb(Q)) V_n lt.eq dim_(bb(Q)) W_n = dim_(bb(F)_2) overline(L)_n lt.eq sum_r d_(n \, r) = d_n . quad "(8.1)" $ <eq:dimension-squeeze>

All sums here are finite. In particular, we have not assumed that every characteristic-two solution lifts to a rational one.

=== 8.2 Choosing the next generator <choosing-the-next-generator>

We construct $sigma_(2 k + 1) in M_(2 k + 1)$ inductively so that its reduction has leading $B$-count one, with projection

$ pi #scale(x: 120%, y: 120%)[\(] "in"_1 overline(sigma)_(2 k + 1) #scale(x: 120%, y: 120%)[\)] = "ad"_C^k B . quad "(8.2)" $ <eq:generator-leading-term>

Here $"in"_1$ denotes the count-one component and $pi$ sets $A = 0$. We identify the right side with $z_k$.

Suppose the generators of all odd weights below $n$ have been chosen. Choose a Hall basis for the free Lie algebra on their formal symbols, and consider its words of weight $n$. All intermediate values lie in $M$, since $M$ is closed under the Ihara bracket. If such a word has length $r$, repeated application of Proposition 18 places its reduced value in filtration $F^r$ and identifies its projected leading part with the same Hall word in the $z_k$’s. Those leading parts are linearly independent for each $r$. They are independent across different $r$ as well: in any putative relation take the smallest length occurring, pass to that associated graded piece, and project. Its coefficients must all vanish; repeat for the remaining lengths.

Thus the Hall-word values have independent reductions in $K_n \/ 2 K_n$. Lemma 25 proves both their rational independence and the fact that their rational span intersects $K_n$ in precisely their $bb(Z)_(\( 2 \))$-span. Each of these Hall words has length at least two, since the available generators have weights below $n$. Every integral vector in their rational span therefore still reduces into $F^2$, and cannot provide the required leading-count-one class.

Every free Lie word of weight $n$ and length at least two uses only generators of weights below $n$. The only possible missing Hall word is the single generator of weight $n$, which exists exactly when $n$ is odd and $n gt.eq 3$. Therefore the old Hall-word values supply

$ d_n - epsilon_n quad upright("independent elements of ") V_n \, #h(2em) epsilon_n = cases(delim: "{", 1 \, & n gt.eq 3 upright(" odd") \,, 0 \, & n upright(" even") .) $

If $n$ is even, this already attains the upper bound (8.1). If $n gt.eq 3$ is odd, Proposition 23 gives $tau_n in V_n$ with a nonzero coefficient of $x^(n - 1) y$. Every old Hall-word value of weight $n$ is decomposable and has zero depth-one component by Lemma 24. Hence $tau_n$ is independent of them. In both cases,

$ dim_(bb(Q)) V_n = dim_(bb(Q)) W_n = d_n . quad "(8.3)" $ <eq:dimension-equality>

For odd $n = 2 k + 1$, we must still obtain the integral choice (8.2). The filtration on $overline(M)_n$ is induced by its embedding in the ambient ordinary Lie algebra on $A \, C \, B$. Its associated graded embeds in that of $overline(L)_n$, and Corollary 17 gives

$ dim_(bb(F)_2) "gr"^r overline(M)_n lt.eq d_(n \, r) . $

Equation (8.3) and saturation give equality of the sums of these dimensions. Each individual deficit is nonnegative, so equality holds for every $r$. For $r = 1$, the target is the one-dimensional line spanned by $z_k$. The injective projection is therefore an isomorphism onto that line. Choose its nonzero preimage in $"gr"^1 overline(M)_n$, represent it by a vector of $F^1 overline(M)_n$, and lift that vector to $M_n$. This lift is $sigma_n$. Its projected coefficient is one because the coefficient field is $bb(F)_2$. There is no requirement that the initially constructed $tau_n$ have this reduction.

The induction begins at $n = 3$, with no previously chosen generators. The same argument supplies $sigma_3$. Weights one and two vanish by Lemma 2. Proceeding through successive weights proves (8.3) in all weights and makes every required choice.

=== 8.3 Freeness, spanning, and completion <freeness-spanning-and-completion>

#proof[
  Send $e_(2 k + 1)$ to the elements $sigma_(2 k + 1)$ just constructed. Since the target $V$ is a Lie algebra, the universal property gives a graded Lie homomorphism
  $ "Lie"_(bb(Q)) chevron.l e_3 \, e_5 \, dots.h chevron.r arrow.r V . $
  In each weight, its Hall-basis images have independent reductions by the preceding leading-term argument. They are therefore rationally independent, so the map is injective. Their number in weight $n$ is $d_n$, and (8.3) shows that they span both $V_n$ and $W_n$. Thus $V = W$ and the map is surjective. This also proves closure of $W$ under the stated Ihara bracket without having to assume closure during the upper-bound argument.
  Each homogeneous piece is finite-dimensional. The isomorphism therefore extends componentwise to the products of the weight pieces. The bracket in a fixed weight involves only finitely many pairs of positive weights, so it extends to these products and the two mutually inverse maps are continuous for the weight filtration. This proves the completed assertion. ◻
]

#heading(level: 1)[References]
#bibitem([1])[V.~I.~Arnol'd, #emph[The cohomology ring of the colored braid group], Mathematical Notes #strong[5] (1969), no.~2, 138--140; Russian original: Matematicheskie Zametki #strong[5] (1969), no.~2, 227--231. #link("https://doi.org/10.1007/BF01098313")[doi:10.1007/BF01098313].]
#bibitem([2])[D.~Bar-Natan, #emph[On associators and the Grothendieck--Teichmüller group I], Selecta Mathematica (N.S.) #strong[4] (1998), no.~2, 183--212. Preprint version cited: #link("https://arxiv.org/abs/q-alg/9606021v4")[arXiv:q-alg/9606021v4].]
#bibitem([3])[F.~Brown, #emph[Mixed Tate motives over $bb(Z)$], Annals of Mathematics (2) #strong[175] (2012), no.~2, 949--976. #link("https://doi.org/10.4007/annals.2012.175.2.10")[doi:10.4007/annals.2012.175.2.10].]
#bibitem([4])[F.~Brown, #emph[Depth-graded motivic multiple zeta values], Compositio Mathematica #strong[157] (2021), no.~3, 529--572. #link("https://doi.org/10.1112/S0010437X20007654")[doi:10.1112/S0010437X20007654]. Preprint version cited: #link("https://arxiv.org/abs/1301.3053v2")[arXiv:1301.3053v2].]
#bibitem([5])[P.~Deligne, #emph[Le groupe fondamental de la droite projective moins trois points], in #emph[Galois Groups over $bb(Q)$], Mathematical Sciences Research Institute Publications, vol.~16, Springer, New York, 1989, pp.~79--297. #link("https://publications.ias.edu/sites/default/files/61_LeGroupeFondamentalDroite.pdf")[Author-hosted text].]
#bibitem([6])[V.~G.~Drinfel'd, #emph[On quasitriangular quasi-Hopf algebras and a group closely connected with $"Gal" \( overline(bb(Q)) \/ bb(Q) \)$], Leningrad Mathematical Journal #strong[2] (1991), no.~4, 829--860; Russian original: Algebra i Analiz #strong[2] (1990), no.~4, 149--181. #link("https://www.mathnet.ru/eng/aa199")[Journal archive].]
#bibitem([7])[B.~Enriquez, #emph[Quasi-reflection algebras and cyclotomic associators], Selecta Mathematica (N.S.) #strong[13] (2007), no.~3, 391--463. #link("https://doi.org/10.1007/s00029-007-0048-2")[doi:10.1007/s00029-007-0048-2]. Preprint version cited: #link("https://arxiv.org/abs/math/0408035v2")[arXiv:math/0408035v2].]
#bibitem([8])[A.~B.~Goncharov, #emph[Multiple polylogarithms and mixed Tate motives], preprint, 2001. \
#link("https://arxiv.org/abs/math/0103059v4")[arXiv:math/0103059v4].]
#bibitem([9])[M.~Hirose, #emph[The cyclotomic Grothendieck--Teichmüller group and the motivic Galois group], preprint, 2023. #link("https://arxiv.org/abs/2301.04064v1")[arXiv:2301.04064v1].]
#bibitem([10])[M.~Hirose and N.~Sato, #emph[Algebraic differential formulas for the shuffle, stuffle and duality relations of iterated integrals], Journal of Algebra #strong[556] (2020), 363--384. #link("https://doi.org/10.1016/j.jalgebra.2020.01.032")[`doi:10.1016/j.jalgebra.2020.01.032`]. Preprint version cited: #link("https://arxiv.org/abs/1801.03165v3")[arXiv:1801.03165v3].]
#bibitem([11])[T.~Kohno, #emph[Monodromy representations of braid groups and Yang--Baxter equations], Annales de l'Institut Fourier #strong[37] (1987), no.~4, 139--160. #link("https://doi.org/10.5802/aif.1114")[doi:10.5802/aif.1114].]
#bibitem([12])[G.~Melançon and C.~Reutenauer, #emph[Lyndon words, free algebras and shuffles], Canadian Journal of Mathematics #strong[41] (1989), no.~4, 577--591. #link("https://doi.org/10.4153/CJM-1989-025-2")[doi:10.4153/CJM-1989-025-2].]
#bibitem([13])[F.~Naef and T.~Willwacher, #emph[Numerical computation of linearized KV and the Deligne--Drinfeld and Broadhurst--Kreimer conjectures], preprint, 2025. #link("https://arxiv.org/abs/2508.08081v1")[arXiv:2508.08081v1].]
#bibitem([14])[E.~Panzer, #emph[Feynman integrals and hyperlogarithms], Ph.D. thesis, Humboldt-Universität zu Berlin, 2015. Updated version cited: #link("https://arxiv.org/abs/1506.07243v1")[arXiv:1506.07243v1].]
#bibitem([15])[C.~Reutenauer, #emph[Free Lie Algebras], London Mathematical Society Monographs, New Series, vol.~7, Clarendon Press, Oxford University Press, 1993. \
#link("https://doi.org/10.1093/oso/9780198536796.001.0001")[`doi:10.1093/oso/9780198536796.001.0001`].]
#bibitem([16])[T.~Willwacher, #emph[M.~Kontsevich's graph complex and the Grothendieck--Teichmüller Lie algebra], Inventiones Mathematicae #strong[200] (2015), 671--760. #link("https://doi.org/10.1007/s00222-014-0528-x")[doi:10.1007/s00222-014-0528-x]. Preprint version cited: #link("https://arxiv.org/abs/1009.1654v4")[arXiv:1009.1654v4].]
#bibitem([17])[T.~Willwacher, #emph[On free generators in the Grothendieck--Teichmüller Lie Algebra], preprint, 2026. #link("https://arxiv.org/abs/2607.18793v2")[arXiv:2607.18793v2].]


