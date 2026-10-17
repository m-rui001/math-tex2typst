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

#align(center)[#text(size: 16pt, weight: "bold")[The Artinian Lex-Plus-Powers Betti Theorem]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

A Hilbert function records the dimensions of a graded quotient; its graded Betti numbers also record the relations among its generators and all higher syzygies. The lex-plus-powers conjecture predicts one extremal ideal for both kinds of data when the original ideal contains a regular sequence. We prove its full Artinian form over $bb(C)$, and deduce the full characteristic-zero statement for regular sequences of arbitrary positive length by the established Artinian reduction and coefficient-field descent.

Let

$ S = bb(C) \[ x_1 \, dots.h \, x_n \] \, #h(2em) 2 lt.eq a_1 lt.eq dots.h.c lt.eq a_n \, #h(2em) P = \( x_1^(a_1) \, dots.h \, x_n^(a_n) \) \, $

where each variable has degree one. Lexicographic order always has $x_1 > dots.h.c > x_n$, and a lex segment starts with the #emph[greatest] monomials. Suppose that a homogeneous ideal $I subset.eq S$ contains a homogeneous regular sequence $f_1 \, dots.h \, f_n$ with $deg f_i = a_i$. Here regularity means that multiplication by $f_i$ is injective on $S \/ \( f_1 \, dots.h \, f_(i - 1) \)$ for each $i$. Its full length makes $S \/ I$ Artinian: the complete-intersection Hilbert series is $product_i \( 1 + z + dots.h.c + z^(a_i - 1) \)$. For each $d gt.eq 0$, prescribe

#[#set math.equation(numbering: n => "(1.1)")
 $ J_d = L_d + P_d \, #h(2em) dim_(bb(C)) J_d = dim_(bb(C)) I_d \, $ <eq:prescription>]

where $L_d$ is the largest lex-segment subspace with this property. Part of the assertion below is that these dimensions can be attained and that the prescribed spaces form an ideal.

For a standard graded polynomial ring $A$ over a field $F$, write

$ beta_(p \, j)^A \( B \) = dim_F "Tor"_p^A \( B \, F \)_j \, #h(2em) F = A \/ A_(> 0) . $

The index $p$ is the homological degree and $j$ is the internal degree.

#thm([Theorem 1.1.])[
  #emph[For every $n gt.eq 1$, every ordered degree sequence $2 lt.eq a_1 lt.eq dots.h.c lt.eq a_n$, and every homogeneous ideal $I subset.eq bb(C) \[ x_1 \, dots.h \, x_n \]$ containing a regular sequence of these degrees, the spaces in (1.1) exist and $J = xor.big_(d gt.eq 0) J_d$ is a homogeneous ideal. For this single ideal, 
$ beta_(p \, j)^S \( S \/ I \) lt.eq beta_(p \, j)^S \( S \/ J \) #h(2em) upright("for every ") p gt.eq 0 upright(" and ") j in bb(Z) . $

 There is no restriction on the degrees or number of the additional generators of $I$.]
] <thm:main>

Thus Theorem 1 resolves the Artinian lex-plus-powers conjecture positively over $bb(C)$. Its Hilbert-function assertion is the Artinian Eisenbud–Green–Harris statement; the Betti inequalities are stronger.

The Artinian restriction can be removed from these two conclusions. Caviglia and Maclagan proved the Artinian reduction for the Eisenbud–Green–Harris conjecture [6] Proposition 10; Caviglia and Kummini proved the corresponding reduction for lex-plus-powers Betti numbers [5] Section 4, Theorem 4.1. Together with a finite coefficient-field descent, these reductions give the following form over every characteristic-zero field.

#thm([Corollary 1.2.])[
  (Eisenbud–Green–Harris and lex-plus-powers in characteristic zero).  #emph[Let $F$ be a field of characteristic zero, let 
$ S_F = F \[ x_1 \, dots.h \, x_n \] \, #h(2em) 1 lt.eq c lt.eq n \, #h(2em) 2 lt.eq a_1 lt.eq dots.h.c lt.eq a_c \, #h(2em) P_F = \( x_1^(a_1) \, dots.h \, x_c^(a_c) \) \, $

 with the standard grading and lexicographic order $x_1 > dots.h.c > x_n$. Suppose that a homogeneous ideal $I subset.eq S_F$ contains a homogeneous regular sequence $f_1 \, dots.h \, f_c$ with $deg f_i = a_i$. For $d gt.eq 0$, put 
$ q_d = dim_F I_d - dim_F \( P_F \)_d . $

 This integer lies between zero and the number of degree-$d$ monomials outside $P_F$. Let $J_d$ be the sum of $\( P_F \)_d$ and the span of the $q_d$ lexicographically greatest such monomials. Then $J = xor.big_(d gt.eq 0) J_d$ is a homogeneous ideal, and for this single ideal 
$ dim_F \( S_F \/ I \)_d = dim_F \( S_F \/ J \)_d quad \( d gt.eq 0 \) \, #h(2em) beta_(p \, j)^(S_F) \( S_F \/ I \) lt.eq beta_(p \, j)^(S_F) \( S_F \/ J \) quad \( p gt.eq 0 \, med j in bb(Z) \) . $

 There is no restriction on the degrees or number of the additional generators of $I$.]
] <cor:characteristic-zero>

Corollary 2 includes non-Artinian quotients and fields that are not algebraically closed. The case with no prescribed regular sequence is the classical lex-ideal theorem cited below. The division-coefficient construction itself remains the full-length construction over $bb(C)$; Section 9 proves the corollary from Theorem 1.

=== 1.1 Context and previous results <context-and-previous-results>

The Eisenbud–Green–Harris (EGH) Hilbert-function conjecture arose in their work on higher Castelnuovo theory [9] Section 4. The lex-plus-powers conjecture, generally attributed to Charalambous and Evans, strengthens that prediction to graded Betti numbers. Francisco and Richert discuss its origins and identify its first printed appearance in the work of Evans and Richert [10] Section 5; see also the public formulations in [18] Section 1 and [7] Conjectures 1.1 and 1.2. Without a prescribed regular sequence, the extremality of lex ideals at fixed Hilbert function is the theorem of Bigatti, Hulett, and Pardue [2,11,17]. The additional powers encode the degrees of the regular sequence and give the sharper comparison studied here. For ideals already containing these powers, Clements–Lindström compression supplies the Hilbert-function comparison [8].

The prescribed-powers Betti comparison developed through several stages. Mermin, Peeva, and Stillman proved the comparison for ideals containing the squares of the variables in characteristic zero [14] Theorem 1.1; Murai established it for strongly stable ideals plus the prescribed powers over any field [15] Theorem 1.1. Mermin and Murai then proved the lex-plus-powers comparison for ideals containing a monomial regular sequence, again over every field [13] Theorems 3.1 and 8.1. They also isolated the reduction to a Hilbert-matching monomial ideal with no smaller graded Betti numbers [13] Conjecture 10.2. It is this reduction that we obtain from division coefficients. Our proof of the subsequent monomial comparison is included for completeness; its conclusion is not new.

For nonmonomial regular sequences, the Hilbert-function and Betti problems have had different ranges of known cases. Abedelfatah proved EGH for full regular sequences whose forms split into linear factors [1] Corollary 4.3. Caviglia and Maclagan established EGH for fast-growing degrees [6], and Caviglia and De Stefani weakened the required growth to $a_i gt.eq sum_(j < i) \( a_j - 1 \)$ for $i gt.eq 3$ [4] Theorem A. These Hilbert-function results hold over any field. The characteristic-zero Betti theorem of Caviglia and Sammartano requires $a_i gt.eq 1 + sum_(j < i) \( a_j - 1 \)$ for $i gt.eq 3$ [7] Theorem 3.8. No such growth condition is imposed here.

More recently, Kuzmanovski [12] Theorem 1.9 obtained asymptotic Betti estimates in characteristic zero in a bounded degree range, for fixed regular-sequence degree offsets and generator counts and sufficiently large initial degree. That comparison uses the reverse-lexicographic generic initial ideal of a lex-plus-powers ideal, rather than the lex-plus-powers ideal itself as in Theorem 1.

Our treatment of the monomial comparison retains the resolution-level mechanism of distractions [3] Theorem 2.19 and Corollary 2.20 and the endpoint decomposition for stable-plus-powers ideals [7] Lemma 3.7, while organizing the last comparison through ranks in the Koszul complex.

=== 1.2 The reduction that carries the Betti numbers <the-reduction-that-carries-the-betti-numbers>

The essential step is to find a monomial ideal $M supset.eq P$ such that

#[#set math.equation(numbering: n => "(1.2)")
 $ "Hilb" \( S \/ I \) = "Hilb" \( S \/ M \) \, #h(2em) beta_(p \, j)^S \( S \/ I \) lt.eq beta_(p \, j)^S \( S \/ M \) quad upright("for all ") p \, j . $ <eq:overview-bound>]

Matching Hilbert functions alone cannot give the second conclusion.

Theorem 1.1 of the companion article [16] supplies a field $k \/ bb(C)$, a finite-dimensional central division $k$-algebra $Delta$, and commuting linear forms $t_1 \, dots.h \, t_n$ in $N = Delta \[ x_1 \, dots.h \, x_n \]$. They satisfy triangular power identities adapted to the $f_i$, and their ordered monomials form a left-$Delta$ basis of $N$. Section 2 states exactly the input needed here, including the basis assertion for the full algebra rather than only its complete-intersection quotient.

Let $T = k \[ y_1 \, dots.h \, y_n \]$ act on $N$ on the right by $y_i mapsto t_i$. Then $N$ is simultaneously left-$S$ free and right-$T$ free, the latter of rank $m = dim_k Delta$, with generators in degree zero. A minimal $S$-resolution of $S \/ I$ therefore gives a #emph[minimal] $T$-resolution of $N \/ I N$, multiplying every Betti number by the same factor $m$. With a monomial order adapted to the triangular identities, the leading coefficient spaces of $I N$ in the $t^alpha$-expansion are left ideals of $Delta$, hence either zero or all of $Delta$. Their nonzero positions define $M$; the triangular identities ensure that $M$ contains $P$. A filtered Koszul comparison then gives (1.2) after cancelling $m$. This resolution transfer is the additional ingredient beyond the Hilbert-function reduction in [16].

Starting from $M$, we work with the monomials in the exponent box $0 lt.eq u_i < a_i$. A transfer replaces a factor $x_ell$ by $x_h$, where $h < ell$, provided the result remains in the box. Root-of-unity distractions followed by initial ideals produce an ideal $H supset.eq P$ closed under these transfers, with unchanged Hilbert function and no smaller quotient Betti numbers. In each degree, replace the box monomials belonging to $H$ by the same number of greatest lexicographic monomials in the box, and retain $P$. Comparing their bounded shadows—the multiples by one variable that remain in the box—shows that the resulting space $G$ is an ideal.

For the Betti comparison, put $z = x_n$. The modules $H \/ z H$ and $G \/ z G$ over the earlier variables have equal Hilbert functions and retain the Betti numbers of the ideals $H$ and $G$. They split into components according to the exponent of $z$, from $0$ to $a_n$. Stability makes every earlier variable annihilate the components at exponents $1 \, dots.h \, a_n - 1$. Only the two extreme components can therefore contribute nonzero ranks to the Koszul differentials. The comparisons on the box slices $u_n = 0$ and $u_n = a_n - 1$, induction in the number of variables, and monotonicity of differential ranks under submodules and quotients compare these endpoint contributions. Since the Koszul terms have equal dimensions, the resulting reverse inequality for adjacent rank sums gives the required Betti bound.

Sections 3 and 4 establish the filtered comparison and the transfer to $M$. Sections 5–7 give the complete monomial comparison. Section 8 identifies its output with (1.1) and proves Theorem 1. Section 9 then removes the Artinian and complex-coefficient restrictions from the Hilbert and Betti conclusions.

== 2 Commuting forms with division coefficients <sec:forms>

We state the construction theorem from the companion article [16] in the precise form used below. A central division algebra over $k$ is a finite-dimensional $k$-algebra with center $k$ in which every nonzero element is invertible. In $Delta \[ x \]$, the variables $x_i$ are central and have degree one, and elements of $Delta$ have degree zero.

#thm([Theorem 2.1.])[
  (Commuting-form construction, [16] Theorem 1.1).  #emph[Let $f_1 \, dots.h \, f_n$ be a homogeneous regular sequence in $bb(C) \[ x_1 \, dots.h \, x_n \]$, of degrees $2 lt.eq a_1 lt.eq dots.h.c lt.eq a_n$. There are a field extension $k \/ bb(C)$, a central division $k$-algebra $Delta$, and a commutative graded $k$-subalgebra 
$ k \[ x_1 \, dots.h \, x_n \] subset.eq A subset.eq N = Delta \[ x_1 \, dots.h \, x_n \] $

 generated by finitely many elements of degree one, containing $t_1 \, dots.h \, t_n in A_1$, such that 
#[#set math.equation(numbering: n => "(2.1)")
 $ t_h^(a_h) = c_h f_h + sum_(ell < h) B_(h ell) f_ell + sum_(ell > h) C_(h ell) t_ell #h(2em) \( 1 lt.eq h lt.eq n \) . $ <eq:triangular-forms>]

 Here $c_h in k^times$, $B_(h ell) \, C_(h ell) in A$, and every summand has degree $a_h$. Moreover, 
$ { t^alpha = t_1^(alpha_1) dots.h.c t_n^(alpha_n) : alpha in bb(Z)_(gt.eq 0)^n } $

 is a graded left-$Delta$ basis of the #emph[full] algebra $N$.]
] <thm:forms>

The basis assertion in Theorem 3 is stronger than a basis of the finite complete-intersection quotient: every monomial $t^alpha$, without an upper bound on its exponents, occurs in the decomposition of $N$. This is what will make $N$ a free module over a polynomial ring and allow us to transfer an entire resolution. The Hilbert-function consequence of the foundation theorem alone would not suffice.

#prodef([Remark 2.2.])[
  Commutativity of the forms does not mean that their individual $Delta$-coefficients commute. The proof below always places those coefficients on the left and multiplies by the $t_i$ on the right. The construction itself has no hypothesis on the additional generators of $I$.
] <rem:coefficients>

== 3 Graded resolutions and leading coefficient spaces <sec:filtered>

We first prove a comparison for quotients of a free module whose monomial positions have vector-space coefficients. The application in the next section will use a division algebra as that coefficient space. The comparison must retain each internal degree separately, so we work with the graded Koszul complex throughout.

Let $F$ be a field and let $A = F \[ y_1 \, dots.h \, y_r \]$, with each variable of degree one. For a finitely generated graded $A$-module $B$, put

$ beta_(p \, j)^A \( B \) = dim_F "Tor"_p^A \( B \, F \)_j \, #h(2em) F = A \/ \( y_1 \, dots.h \, y_r \) . $

We use the shift convention $B \( - s \)_d = B_(d - s)$. All modules considered below are bounded below and have finite-dimensional graded components.

#thm([Lemma 3.1.])[
  (Minimal graded resolutions).  #emph[Every finitely generated graded $A$-module $B$ has a graded free resolution whose differentials have entries in $A_(> 0)$. In such a resolution, the number of free generators of degree $j$ in homological position $p$ is $beta_(p \, j)^A \( B \)$. If $H subset.neq A$ is a homogeneous ideal, then 
#[#set math.equation(numbering: n => "(3.1)")
 $ beta_(p + 1 \, j)^A \( A \/ H \) = beta_(p \, j)^A \( H \) #h(2em) \( p gt.eq 0 \, med j in bb(Z) \) . $ <filt:ideal-quotient>]

 If $H$ is monomial, a minimal resolution of $A \/ H$ can be chosen homogeneous for the exponent multigrading, with all generator multidegrees in $bb(Z)_(gt.eq 0)^r$.]
] <filt:minimal>

#proof[
  Lift a homogeneous $F$-basis of $B \/ A_(> 0) B$ to $B$ and map the free module on these lifts to $B$. This map is surjective: in each degree, an element not yet expressed in the lifts differs from such an expression by a sum of positive-degree multiples of elements of smaller degree, to which induction applies. Its kernel is finitely generated because $A$ is Noetherian. Repeating the construction for successive kernels gives a free resolution. At each stage, reduction modulo $A_(> 0)$ identifies the chosen free generators with a basis of the corresponding module modulo $A_(> 0)$, so the next kernel lies in $A_(> 0)$ times that free module. Thus every differential between free modules has positive-degree entries. Tensoring with $F$ makes these differentials zero and proves the assertion about $"Tor"$.
  A minimal resolution of a proper homogeneous ideal $H$, followed by the inclusion $H arrow.r.hook A$ and the quotient $A arrow.r.twohead A \/ H$, is a minimal resolution of $A \/ H$: the additional entries also have positive degree since $H subset.eq A_(> 0)$. This proves (3.1), including $H = 0$.
  For a monomial quotient, carry out the same construction with multihomogeneous lifts. The initial free module is $A$ in multidegree zero. A free module whose generator multidegrees are nonnegative has no component in a multidegree outside $bb(Z)_(gt.eq 0)^r$; neither does its kernel or a quotient of that kernel. Induction therefore gives the last assertion. ◻
]

#thm([Lemma 3.2.])[
  (Koszul calculation).  #emph[Let $K_bullet \( B \)$ be the Koszul complex on $y_1 \, dots.h \, y_r$ with coefficients in $B$. Its term of internal degree $j$ in position $p$ is 
$ K_p \( B \)_j = xor.big_(sigma subset.eq { 1 \, dots.h \, r }\
\| sigma \| = p) B_(j - p) e_sigma \, $

 where $e_sigma$ has degree $p$. Its homology satisfies 
$ dim_F H_p \( K_bullet \( B \)_j \) = beta_(p \, j)^A \( B \) . $

]
] <filt:koszul>

#proof[
  For $sigma = { i_1 < dots.h.c < i_p }$ the differential is
  $ d \( b e_sigma \) = sum_(q = 1)^p \( - 1 \)^(q - 1) y_(i_q) b thin e_(sigma \\ { i_q }) . $
  The complex $K_bullet \( A \)$ is the tensor product over $F$ of the one-variable complexes
  $ 0 arrow.r F \[ y_i \] \( - 1 \) arrow.r^(med y_i med) F \[ y_i \] arrow.r 0 . $
  Each has homology $F$ in position zero and no other homology. A complex of vector spaces splits as its homology with zero differential plus contractible two-term summands. Tensoring these splittings shows that $K_bullet \( A \)$ is a free resolution of $F$.
  To compare this computation with a resolution of $B$, take any graded free resolution $F_bullet arrow.r B$ and form the first-quadrant double complex $F_bullet ⊗_A K_bullet \( A \)$. Augmenting either factor gives maps from its total complex to $F_bullet ⊗_A F$ and to $B ⊗_A K_bullet \( A \)$, respectively. The kernels have exact columns or exact rows, since the terms of the other factor are free. Their total complexes are exact. For exact columns, eliminate a cycle’s component of greatest horizontal index by a vertical boundary; the correction introduces terms only in the next column to the left. There are finitely many components on each total-degree diagonal, so iteration eliminates the cycle. The argument for exact rows interchanges the two indices. Both augmentation maps consequently induce homology isomorphisms. This identifies the homology of $B ⊗_A K_bullet \( A \) = K_bullet \( B \)$ with $"Tor"^A \( B \, F \)$, preserving the internal grading. ◻
]

We now order monomial positions without choosing an order on their coefficients. Let $V$ be a finite-dimensional $F$-vector space in degree zero, and set

$ E = V ⊗_F A = xor.big_(alpha in bb(Z)_(gt.eq 0)^r) V y^alpha . $

Choose a total order $prec$ on the exponents of each fixed total degree, compatible with addition: if $alpha prec beta$, then $alpha + gamma prec beta + gamma$ for every $gamma in bb(Z)_(gt.eq 0)^r$. The first nonzero position of an element is its leading position in this order.

For a homogeneous submodule $W subset.eq E$ and an exponent $alpha$, define

$ V_alpha = {v in V : v y^alpha + sum_(\| gamma \| = \| alpha \|\
alpha prec gamma) v_gamma y^gamma in W upright(" for some ") v_gamma in V} . $

This is an $F$-subspace of $V$. The resulting leading submodule is

$ "in"_prec W = xor.big_(alpha in bb(Z)_(gt.eq 0)^r) V_alpha y^alpha . $

Indeed, multiplication of a witnessing element by $y_i$ shows that $V_alpha subset.eq V_(alpha + e_i)$, so this direct sum is an $A$-submodule.

#thm([Proposition 3.3.])[
  (Leading-submodule comparison).  #emph[ With $A \, V \, E \, W$ and $prec$ as above, for every $d in bb(Z)$, every $p gt.eq 0$, and every $j in bb(Z)$ one has 
#[#set math.equation(numbering: n => "(3.2)")
 $ dim_F \( E \/ W \)_d & = dim_F \( E \/ "in"_prec W \)_d \,\
beta_(p \, j)^A \( E \/ W \) & lt.eq beta_(p \, j)^A \( E \/ "in"_prec W \) . $ <filt:hilbert>]

]
] <filt:comparison>

#proof[
  Write $Q = E \/ W$. In degree $d gt.eq 0$, let $E_(succ.curly.eq alpha)$ be the sum of the positions $V y^gamma$ with $\| gamma \| = d$ and $alpha prec.curly.eq gamma$, and define $E_(succ alpha)$ similarly with strict inequality. Their images in $Q_d$ give a finite descending filtration. Its quotient at $alpha$ is
  #[#set math.equation(numbering: n => "(3.3)")
   $ frac("im" \( E_(succ.curly.eq alpha) arrow.r Q_d \), "im" \( E_(succ alpha) arrow.r Q_d \)) tilde.eq frac(E_(succ.curly.eq alpha), E_(succ alpha) + \( W_d ∩ E_(succ.curly.eq alpha) \)) tilde.eq \( V \/ V_alpha \) y^alpha . $ <filt:slot-quotient>]
  The last isomorphism takes the coefficient at $alpha$. Summing its dimensions proves (3.2); both sides vanish for $d < 0$.
  Fix an internal degree $j gt.eq 0$. We give all terms of $K_bullet \( Q \)_j$ a common filtration indexed by the degree-$j$ exponents. For a subset $sigma$, put $upright(bold(1))_sigma = sum_(i in sigma) e_i$. In the summand with exterior label $e_sigma$, place the coefficient position $alpha$ at
  $ alpha + upright(bold(1))_sigma . $
  More explicitly, the filtration subspace at $beta$ in that summand is the image of the span of all $V y^alpha$ satisfying $beta prec.curly.eq alpha + upright(bold(1))_sigma$. The full filtration subspace is the direct sum over the labels $sigma$. Addition compatibility means that the relative order of the positions within one summand agrees with their order in $Q_(j - \| sigma \|)$.
  A differential deleting $i in sigma$ multiplies its coefficient by $y_i$. It sends the position with exponent $alpha$ to that with exponent $alpha + e_i$, and
  $ \( alpha + e_i \) + upright(bold(1))_(sigma \\ { i }) = alpha + upright(bold(1))_sigma . $
  Thus the differential preserves the filtration. By (3.3), its map on the corresponding associated graded positions is, up to the Koszul sign,
  $ V \/ V_alpha arrow.r V \/ V_(alpha + e_i) \, #h(2em) \[ v \] mapsto \[ v \] . $
  This is well defined by $V_alpha subset.eq V_(alpha + e_i)$. Consequently the associated graded complex is exactly $K_bullet \( E \/ "in"_prec W \)_j$, decomposed by the total exponent $beta$.
  For completeness, if $d : C arrow.r C'$ is a filtration-preserving linear map between finite-dimensional filtered spaces, the filtration induced on $ker d$ gives an injection
  $ "gr" \( ker d \) arrow.r.hook ker \( "gr" d \) . $
  Indeed a leading class represented by an element of $ker d$ maps to zero, and the induced filtration on the kernel makes this inclusion injective. Since taking associated graded preserves dimension, it follows that $"rank" d gt.eq "rank" \( "gr" d \)$. At a fixed term of a complex, the homology dimension is the term dimension minus the ranks of its incoming and outgoing maps. Applying the rank inequality to these two maps proves that passing to the associated graded complex cannot decrease this homology dimension. Lemma 6 now gives (3.2). For $j < 0$ all the relevant Koszul terms vanish, so the same assertion holds. ◻
]

Taking $V = F$ recovers the usual comparison with a monomial initial ideal; see also [13] Section 2. Keeping $V$ arbitrary is essential for the next application: the coefficient algebra will enlarge all dimensions by the same finite factor, which can then be cancelled.

== 4 A monomial bound containing the prescribed powers <sec:monomial>

We use the commuting forms of Theorem 3 to construct a monomial ideal containing the prescribed powers. The construction preserves the Hilbert function and increases every graded Betti number. The first step explains why the original resolution remains minimal over the polynomial ring acting through these forms.

#thm([Lemma 4.1.])[
  (Transfer of a minimal resolution).  #emph[Let $S = bb(C) \[ x_1 \, dots.h \, x_n \]$, let $k$ be a field containing $bb(C)$, and let $Delta$ be a finite-dimensional central division $k$-algebra. Put $m = dim_k Delta$ and $N = Delta \[ x_1 \, dots.h \, x_n \]$, where the $x_i$ are central. Suppose that $t_1 \, dots.h \, t_n in N_1$ commute and that 
#[#set math.equation(numbering: n => "(4.1)")
 $ N = xor.big_(alpha in bb(Z)_(gt.eq 0)^n) Delta t^alpha $ <mono:basis>]

 is a graded direct-sum decomposition. Give $T = k \[ y_1 \, dots.h \, y_n \]$ a right action on $N$ by multiplication, $u dot.op y_i = u t_i$. For every homogeneous ideal $I subset.eq S$, the right $T$-module $Q = N \/ I N$ satisfies 
#[#set math.equation(numbering: n => "(4.2)")
 $ dim_k Q_d & = m dim_(bb(C)) \( S \/ I \)_d &  & \( d in bb(Z) \) \,\
beta_(p \, j)^T \( Q \) & = m beta_(p \, j)^S \( S \/ I \) &  & \( p gt.eq 0 \, med j in bb(Z) \) . $ <mono:dimension-transfer>]

 Here right and left modules over the commutative ring $T$ are identified when computing $"Tor"$.]
] <mono:transfer>

#proof[
  Commutativity of the $t_i$ and centrality of $k$ make the stated right $T$-action well defined. The map
  #[#set math.equation(numbering: n => "(4.3)")
   $ Delta ⊗_k T arrow.r N \, #h(2em) b ⊗ y^alpha mapsto b t^alpha $ <mono:free-map>]
  is a graded vector-space isomorphism by (4.1). It is right $T$-linear because $\( b t^alpha \) t_i = b t^(alpha + e_i)$. Thus $N$ is right $T$-free of rank $m$, with a basis in degree zero, and
  #[#set math.equation(numbering: n => "(4.4)")
   $ N_(> 0) = N T_(> 0) . $ <mono:positive-degree>]
  The left $S$-action commutes with the right $T$-action by associativity of multiplication in $N$. Moreover, $N = Delta ⊗_(bb(C)) S$ as a left $S$-module, so $N$ is left $S$-free and therefore flat. Each element of $I$ is central in $N$, whence $I N$ is a two-sided ideal. In particular it is a right $T$-submodule, and
  $ Q tilde.eq Delta ⊗_(bb(C)) \( S \/ I \) . $
  Taking a complex basis of $\( S \/ I \)_d$ proves (4.2).
  Let $F_bullet arrow.r S \/ I$ be a minimal graded $S$-free resolution. Since $S$ is commutative, regard its terms as right $S$-modules and tensor with the $\( S \, T \)$-bimodule $N$. Flatness gives a resolution
  $ F_bullet ⊗_S N arrow.r Q $
  by graded free right $T$-modules. An entry $f$ of an original differential acts on $N$ by left multiplication. This map is right $T$-linear, again by associativity.
  Choose a $k$-basis $b_1 \, dots.h \, b_m$ of $Delta$, which is a right $T$-basis of $N$ under (4.3). If $f$ is nonzero and has degree $e > 0$, then each $f b_u$ belongs to $N_e$. By the graded decomposition (4.1), its coefficients in the basis $b_1 \, dots.h \, b_m$ are homogeneous polynomials in $T$ of degree $e$. They therefore lie in $T_(> 0)$. Every nonzero original differential entry has positive degree, so the transferred resolution is minimal. Each summand $S \( - s \)$ of $F_p$ becomes $m$ summands $T \( - s \)$. Lemma 5 proves (4.2) for every $p \, j$. If $I = S$, both quotients and their resolutions may be taken to be zero, and the same formulas hold. ◻
]

The next proposition supplies the monomial ideal used by the rest of the proof. Its ideal is allowed to depend on $I$, but it is fixed simultaneously for all homological and internal degrees.

#thm([Proposition 4.2.])[
  (Monomial reduction).  #emph[Let $S = bb(C) \[ x_1 \, dots.h \, x_n \]$, let $2 lt.eq a_1 lt.eq dots.h.c lt.eq a_n$, and let $I subset.eq S$ be a homogeneous ideal containing a homogeneous regular sequence $f_1 \, dots.h \, f_n$ with $deg f_h = a_h$. Put $P = \( x_1^(a_1) \, dots.h \, x_n^(a_n) \)$. There is a monomial ideal $M subset.eq S$ containing $P$ such that 
#[#set math.equation(numbering: n => "(4.5)")
 $ dim_(bb(C)) \( S \/ M \)_d & = dim_(bb(C)) \( S \/ I \)_d &  & \( d in bb(Z) \) \,\
beta_(p \, j)^S \( S \/ I \) & lt.eq beta_(p \, j)^S \( S \/ M \) &  & \( p gt.eq 0 \, med j in bb(Z) \) . $ <mono:hilbert-bound>]

]
] <mono:bound>

#proof[
  If $I = S$, take $M = S$. Assume henceforth that $I$ is proper. Apply Theorem 3 to the given regular sequence. It supplies $k$, $Delta$, and commuting degree-one forms $t_h$ satisfying the basis property (4.1) and homogeneous identities
  #[#set math.equation(numbering: n => "(4.6)")
   $ t_h^(a_h) = c_h f_h + sum_(ell < h) B_(h ell) f_ell + sum_(ell > h) C_(h ell) t_ell \, #h(2em) c_h in k^times \, $ <mono:triangular>]
  where the multipliers belong to $N = Delta \[ x_1 \, dots.h \, x_n \]$. In particular $C_(h ell)$ is homogeneous of degree $a_h - 1$ when nonzero. Define $T = k \[ y_1 \, dots.h \, y_n \]$, $m = dim_k Delta$, $W = I N$, and $Q = N \/ W$ as in Lemma 8.
  Under (4.3), view $N$ as the free $T$-module with coefficient space $V = Delta$. In each total degree, order exponents by placing the lexicographically smallest tuple
  $ \( alpha_n \, dots.h \, alpha_1 \) $
  first. This order is compatible with addition. Apply Proposition 7 to the homogeneous $T$-submodule $W$ with this order.
  For an exponent $alpha$, let $V_alpha subset.eq Delta$ be its leading coefficient space. It is closed under left multiplication by $Delta$: if $w in W$ witnesses a coefficient $b$ at $alpha$ with no earlier coefficients, then $lambda w in W$ witnesses $lambda b$. Here $W$ is left $Delta$-linear because it is an ideal of $N$. Hence $V_alpha$ is a left ideal of $Delta$. Since $Delta$ is a division algebra,
  $ V_alpha = 0 quad upright("or") quad Delta . $
  Explicitly, if $0 eq.not b in V_alpha$, every $c in Delta$ is $\( c b^(- 1) \) b$ and therefore also belongs to $V_alpha$.
  The set
  $ cal(U) = { alpha in bb(Z)_(gt.eq 0)^n : V_alpha = Delta } $
  is upward closed under addition of exponent vectors, since the leading object is a $T$-submodule. Define $M subset.eq S$ to be the monomial ideal with exponent set $cal(U)$, and define $M_k subset.eq T$ by the same exponent set. Then
  #[#set math.equation(numbering: n => "(4.7)")
   $ N \/ "in"_prec W tilde.eq Delta ⊗_k \( T \/ M_k \) tilde.eq \( T \/ M_k \)^(xor m) $ <mono:initial-quotient>]
  as graded right $T$-modules.
  We next verify the power containment. Since every $f_ell$ lies in $I$, Equation (4.6) gives
  $ t_h^(a_h) - sum_(ell > h) C_(h ell) t_ell in W . $
  Expand each $C_(h ell)$ in the left $Delta$-basis $t^alpha$. Right multiplication by $t_ell$ turns a term $b t^alpha$ into $b t^(alpha + e_ell)$, using only commutativity of the forms. Every resulting exponent has a positive coordinate of index greater than $h$. It consequently lies strictly after $a_h e_h$ in the chosen order, because $a_h e_h$ has zero coordinates at all indices greater than $h$. The displayed element therefore has leading position $a_h e_h$ with coefficient $1$. Thus $a_h e_h in cal(U)$ for every $h$, proving $P subset.eq M$.
  It remains to compare the numerical invariants. The scalar extension of $S \/ M$ from $bb(C)$ to $k$, with $x_i$ renamed $y_i$, is $T \/ M_k$. Its Hilbert function is unchanged. Tensoring the Koszul complex over $bb(C)$ with the field $k$ also preserves exactness and commutes with homology, so
  $ dim_k \( T \/ M_k \)_d & = dim_(bb(C)) \( S \/ M \)_d \,\
beta_(p \, j)^T \( T \/ M_k \) & = beta_(p \, j)^S \( S \/ M \) . $
  Equations (4.2) and (4.7), together with (3.2), now give
  $ m dim_(bb(C)) \( S \/ I \)_d = dim_k Q_d = dim_k \( N \/ "in"_prec W \)_d = m dim_(bb(C)) \( S \/ M \)_d . $
  Likewise, (4.2), (3.2), and (4.7) yield, for every $p gt.eq 0$ and every $j in bb(Z)$,
  $ m beta_(p \, j)^S \( S \/ I \) = beta_(p \, j)^T \( Q \) lt.eq beta_(p \, j)^T \( N \/ "in"_prec W \) = m beta_(p \, j)^S \( S \/ M \) . $
  Cancelling the positive integer $m$ proves both assertions. ◻
]

The right action in Lemma 8 and the placement of the $Delta$-coefficients on the left are deliberate. The argument uses commutativity among the forms $t_i$, but never requires an individual coefficient in $Delta$ to commute with a form. Proposition 9 completes the reduction to an ideal containing $P$. The remaining comparison is the prescribed-powers theorem of Mermin and Murai [13] Theorem 3.1. Sections 5–7 give a direct proof by stabilization, box compression, and a Koszul-rank induction.

== 5 Stabilization inside the exponent box <sec:stabilization>

We now start with a monomial ideal containing the prescribed powers. The aim of this section is to impose stability inside the finite exponent box while preserving the Hilbert function and weakly increasing every graded Betti number of the quotient. This is the pure-power deformation strategy of Mermin and Murai [13] Section 3.

Let

$ S = bb(C) \[ x_1 \, dots.h \, x_n \] \, #h(2em) 2 lt.eq a_1 lt.eq dots.h.c lt.eq a_n \, #h(2em) P = \( x_1^(a_1) \, dots.h \, x_n^(a_n) \) \, #h(2em) b_i = a_i - 1 . $

For $1 lt.eq r lt.eq n$ and $d in bb(Z)$, put

$ cal(B)_r \( d \) = { u in bb(Z)_(gt.eq 0)^r : \| u \| = d \, med 0 lt.eq u_i lt.eq b_i upright(" for ") 1 lt.eq i lt.eq r } . $

In particular, this set is empty when $d < 0$.

#prodef([Definition 5.1.])[
  A subset $X subset.eq cal(B)_r \( d \)$ is #emph[stable] if
  $ u in X \, quad h < ell \, quad u + e_h - e_ell in cal(B)_r \( d \) quad arrow.r.double quad u + e_h - e_ell in X . $
  A monomial ideal containing $\( x_1^(a_1) \, dots.h \, x_r^(a_r) \)$ is #emph[stable in the box] if its included exponent vectors in $cal(B)_r \( d \)$ form a stable set for every $d$. This definition imposes no transfer condition on monomials outside the box.
] <stab:definition>

The modification used below acts on one pair of variables. Fix $h < ell$, write $xi = x_h$ and $q = x_ell$, and choose a primitive $a_ell$-th root of unity $zeta in bb(C)$. Define a graded $bb(C)$-linear map $D : S arrow.r S$ on monomials by

#[#set math.equation(numbering: n => "(5.1)")
 $ D \( x^u \) = (product_(i eq.not ell) x_i^(u_i)) product_(s = 0)^(u_ell - 1) \( q - zeta^s xi \) \, #h(2em) u in bb(Z)_(gt.eq 0)^n \, $ <stab:distraction-formula>]

with the empty product equal to $1$. The resolution argument below is the nested-factor mechanism used for distractions in [3] Theorem 2.19 and Corollary 2.20. We give the argument directly because the root-of-unity factors here are periodic, rather than eventually constant.

#thm([Lemma 5.2.])[
  #emph[For every monomial ideal $K subset.eq S$, its vector-space image $D \( K \)$ is a homogeneous ideal. Moreover, 
$ dim_(bb(C)) \( S \/ D \( K \) \)_d = dim_(bb(C)) \( S \/ K \)_d quad \( d in bb(Z) \) \,\
beta_(p \, j)^S \( S \/ D \( K \) \) = beta_(p \, j)^S \( S \/ K \) quad \( p gt.eq 0 \, med j in bb(Z) \) . $

 The map also satisfies $D \( P \) = P$.]
] <stab:distraction>

#proof[
  The expansion of $D \( x^u \)$ has coefficient $1$ at $x^u$, and every other monomial is lexicographically larger than $x^u$. Thus $D$ is unitriangular on each finite-dimensional graded piece and is invertible. Multiplication by a variable other than $q$ commutes with $D$, while
  #[#set math.equation(numbering: n => "(5.2)")
   $ q D \( x^u \) = D \( q x^u \) + zeta^(u_ell) xi D \( x^u \) . $ <stab:multiplication>]
  Since $K$ is spanned by monomials and is an ideal, these identities show that $D \( K \)$ is an ideal. The invertibility and degree preservation of $D$ give the Hilbert-function equality.
  To check preservation of $P$, first observe that
  $ product_(s = 0)^(a_ell - 1) \( q - zeta^s xi \) = q^(a_ell) - xi^(a_ell) in P . $
  Here the second term belongs to $P$ because $a_h lt.eq a_ell$. If a monomial is divisible by $q^(a_ell)$, its image under $D$ is divisible by this displayed polynomial. If it is divisible by another generator of $P$, that generator remains a factor of its image. Consequently $D \( P \) subset.eq P$. In each degree this inclusion is an inclusion between vector spaces of the same finite dimension, so it is an equality.
  It remains to compare Betti numbers. If $K = S$, both quotients are zero. Otherwise, choose a minimal exponent-multigraded free resolution $F_bullet arrow.r S \/ K$ with $F_0 = S$, as in Lemma 5. A nonzero differential entry from a generator of multidegree $u$ to one of multidegree $v$ has the form $c x^(u - v)$, where $u gt.eq v$ coordinatewise. Keeping the ordinary graded free modules, replace this entry by
  #[#set math.equation(numbering: n => "(5.3)")
   $ c frac(D \( x^u \), D \( x^v \)) . $ <stab:ratio-entry>]
  The ratio is a polynomial: all unchanged monomial factors are nested, as are the products in (5.1).
  For each free summand whose generator has multidegree $v$, define a linear change on its coefficient polynomials by
  #[#set math.equation(numbering: n => "(5.4)")
   $ C_v \( x^(w - v) \) = frac(D \( x^w \), D \( x^v \)) \, #h(2em) w gt.eq v . $ <stab:coefficient-change>]
  More explicitly, the right-hand side is
  $ (product_(i eq.not ell) x_i^(w_i - v_i)) product_(s = v_ell)^(w_ell - 1) \( q - zeta^s xi \) . $
  It has the original monomial $x^(w - v)$ with coefficient $1$ and only lexicographically larger additional terms. Hence $C_v$ is an invertible graded vector-space map. These maps need not be $S$-linear; the new differential defined by (5.3) is $S$-linear.
  The changes on the free summands intertwine the old and new differentials. Indeed, for a source coefficient $x^(w - u)$ and a nonzero entry $c x^(u - v)$, the required equality is precisely
  $ frac(D \( x^w \), D \( x^u \)) (c frac(D \( x^u \), D \( x^v \))) = c frac(D \( x^w \), D \( x^v \)) . $
  Thus the new maps form a complex that is exact in every positive homological degree. At $F_0 = S$ the change is $C_0 = D$, so its image from $F_1$ is $D \( K \)$. We have obtained a free resolution of $S \/ D \( K \)$ with the same ordinary graded free modules as $F_bullet$. Every replaced nonzero entry still has its original positive degree, so this resolution is minimal. Its free ranks in each degree give the asserted equality of all graded Betti numbers. ◻
]

#thm([Proposition 5.3.])[
  #emph[Let $S = bb(C) \[ x_1 \, dots.h \, x_n \]$, let $2 lt.eq a_1 lt.eq dots.h.c lt.eq a_n$, and put $P = \( x_1^(a_1) \, dots.h \, x_n^(a_n) \)$. For every monomial ideal $K supset.eq P$, there is a monomial ideal $H supset.eq P$ stable in the box such that 
$ dim_(bb(C)) \( S \/ H \)_d = dim_(bb(C)) \( S \/ K \)_d quad \( d in bb(Z) \) $

 and 
$ beta_(p \, j)^S \( S \/ K \) lt.eq beta_(p \, j)^S \( S \/ H \) #h(2em) \( p gt.eq 0 \, med j in bb(Z) \) . $

]
] <stab:main>

#proof[
  If $K$ is stable in the box, take $H = K$. Otherwise choose a failed transfer from $q = x_ell$ to $xi = x_h$, with $h < ell$, and form the map $D$ above. Replace $K$ by
  $ K' = "in"_(upright("lex")) D \( K \) \, $
  where the leading monomial is the lexicographically largest one. By Lemma 11, $P subset.eq D \( K \)$, and hence $P subset.eq K'$. That lemma and Proposition 7 show that the Hilbert function is preserved and
  $ beta_(p \, j)^S \( S \/ K \) lt.eq beta_(p \, j)^S \( S \/ K' \) #h(2em) \( p gt.eq 0 \, med j in bb(Z) \) . $
  We prove that repeated replacements terminate by measuring progress in every lexicographic prefix.
  Fix a degree $d$ and a prefix $E$ of the degree-$d$ monomials, listed from greatest to least. Let $pi_E$ be the projection onto their span. Gaussian elimination with this ordered list of columns gives
  $ \# { m in E : m in K' } = dim_(bb(C)) pi_E \( D \( K \)_d \) . $
  For the monomials $m in K ∩ E$, the vectors $pi_E \( D \( m \) \)$ are linearly independent: their coordinates in their original monomial positions form a triangular matrix with diagonal entries $1$. Consequently
  #[#set math.equation(numbering: n => "(5.5)")
   $ \# \( K' ∩ E \) gt.eq \# \( K ∩ E \) $ <stab:prefix-growth>]
  for every such prefix in every degree.
  There is a strict inequality for at least one prefix. Choose a monomial $x^u in K$ inside the box witnessing the failed transfer, so
  $ m' = xi / q x^u quad upright("lies inside the box but does not belong to ") K . $
  Its existence implies $1 lt.eq u_ell < a_ell$. Let $E$ be the degree-$\| u \|$ prefix ending at $m'$. Every monomial in $K ∩ E$ is strictly larger than $m'$, so its $D$-image has zero coefficient at $m'$. On the other hand, the coefficient at $m'$ of $D \( x^u \)$ is
  $ - sum_(s = 0)^(u_ell - 1) zeta^s = - frac(1 - zeta^(u_ell), 1 - zeta) eq.not 0 . $
  Thus $pi_E \( D \( x^u \) \)$ is independent of the projected vectors already used for $K ∩ E$, proving strictness in (5.5).
  Every monomial ideal containing $P$ is determined by the monomials it includes in the finite box $0 lt.eq u_i < a_i$. There are therefore only finitely many such ideals. The nondecreasing prefix counts, with at least one strict increase at every replacement, prevent a repetition. Continuing whenever stability fails must consequently stop at an ideal $H$ stable in the box. The Hilbert-function equalities and all Betti inequalities persist along this finite sequence. ◻
]

== 6 Shadows and end slices in an exponent box <sec:boxes>

We now replace the monomials of a stable ideal, degree by degree, by lex segments in the exponent box. The shadow comparison below will ensure that the replacement is an ideal. At the same time we prove two comparisons for its first and last slices. The bounded-monomial theorem of Clements and Lindström gives the shadow comparison for arbitrary subsets when the bounds are nondecreasing [8]. Here we assume stability of the subsets, allow the bounds in arbitrary order, and prove the two endpoint comparisons together with the shadow inequality.

Recall the notation for a box with positive integer bounds $b_1 \, dots.h \, b_r$:

$ cal(B)_r \( d \) = {u in bb(Z)_(gt.eq 0)^(thin r) : sum_(h = 1)^r u_h = d \, quad u_h lt.eq b_h upright(" for every ") h} . $

Here $d$ may be any integer; in particular the box is empty when $d < 0$ or $d > sum_h b_h$. We also set $cal(B)_0 \( 0 \) = { \( \) }$ and $cal(B)_0 \( d \) = diameter$ for $d eq.not 0$. No ordering of the bounds is required in this section.

Vectors are ordered lexicographically, with the first coordinate taking precedence, and lex segments start with the largest vectors. For $X subset.eq cal(B)_r \( d \)$, let $"Lex" \( X \)$ be the lex segment of cardinality $\| X \|$. Recall that $X$ is #emph[stable] if

$ u in X \, quad h < ell \, quad u + e_h - e_ell in cal(B)_r \( d \) quad arrow.r.double quad u + e_h - e_ell in X . $

Every lex segment is stable, since each allowed transfer increases the vector in lex order. Define the bounded shadow and the slices by

$ partial X & = { u + e_h in cal(B)_r \( d + 1 \) : u in X \, med 1 lt.eq h lt.eq r } \,\
X \( s \) & = { u in cal(B)_(r - 1) \( d - s \) : \( u \, s \) in X } #h(2em) \( 0 lt.eq s lt.eq b_r \) . $

The bounds in $cal(B)_(r - 1)$ are the first $r - 1$ bounds. Empty sets have empty shadows; thus these definitions also cover negative degrees and empty slices.

#thm([Lemma 6.1.])[
  (Shadows and end slices).  #emph[Let $r gt.eq 1$, let $b_1 \, dots.h \, b_r$ be positive integers, and let $d in bb(Z)$. If $X subset.eq cal(B)_r \( d \)$ is stable and $Y = "Lex" \( X \)$, then $partial Y$ is a lex segment and 
#[#set math.equation(numbering: n => "(6.1)")
 $ \| partial X \| gt.eq \| partial Y \| \, #h(2em) \| X \( 0 \) \| gt.eq \| Y \( 0 \) \| \, #h(2em) \| X \( b_r \) \| lt.eq \| Y \( b_r \) \| . $ <box:three-inequalities>]

]
] <box:inequalities>

#proof[
  We first prove the assertion about lex shadows, without assuming stability of $X$. Empty shadows need no argument. For $v in cal(B)_r \( d + 1 \)$, with $d gt.eq 0$, its lex largest degree-$d$ predecessor is
  $ p \( v \) = v - e_(max { h : v_h > 0 }) . $
  Every predecessor belongs to the bounded box. Moreover, the map $p$ preserves weak lex order. Indeed, suppose $v > w$, with first difference at coordinate $k$. Subtraction at the last nonzero coordinate cannot change an earlier coordinate of $v$. If the operation changes a coordinate of $w$ before $k$, then $p \( v \) > p \( w \)$ already at that coordinate. Otherwise the strict inequality at $k$ can disappear only if $v_k = w_k + 1$ and the tail of $v$ after $k$ is zero. Equality of total degrees then says that the tail of $w$ contains exactly one unit. Subtracting its last nonzero coordinate gives $p \( v \) = p \( w \)$. In all other cases the first strict inequality remains. Membership of $v$ in the shadow of a lex segment is equivalent to membership of $p \( v \)$ in that segment, proving that its shadow is lex.
  We prove the three inequalities simultaneously by induction on $r$. If $cal(B)_r \( d \)$ is empty, they are immediate. For $r = 1$, each degree box has at most one vector, so $X = Y$. Assume henceforth that $r > 1$. A prime will indicate lex replacement or shadow in the first $r - 1$ coordinates.
  Each slice $X \( s \)$ is stable, and stability between slices gives
  #[#set math.equation(numbering: n => "(6.2)")
   $ partial' X \( s \) subset.eq X \( s - 1 \) #h(2em) \( 1 lt.eq s lt.eq b_r \) . $ <box:original-slices>]
  Replace each slice by $Z \( s \) = "Lex"' \( X \( s \) \)$, and let $Z subset.eq cal(B)_r \( d \)$ be the set with these slices. By the induction hypothesis and (6.2),
  $ \| partial' Z \( s \) \| lt.eq \| partial' X \( s \) \| lt.eq \| X \( s - 1 \) \| = \| Z \( s - 1 \) \| . $
  The shadow on the left and the slice on the right are lex segments in the same degree box. Consequently
  #[#set math.equation(numbering: n => "(6.3)")
   $ partial' Z \( s \) subset.eq Z \( s - 1 \) #h(2em) \( 1 lt.eq s lt.eq b_r \) . $ <box:compressed-slices>]
  Thus a unit in the last coordinate of a member of $Z$ may be moved to any earlier coordinate with available capacity, while remaining in $Z$.
  #emph[The zero slice.] If $Z \( 0 \) = cal(B)_(r - 1) \( d \)$, then $\| Y \( 0 \) \| lt.eq \| Z \( 0 \) \| = \| X \( 0 \) \|$. Otherwise let $v$ be the largest vector of $cal(B)_(r - 1) \( d \)$ omitted from $Z \( 0 \)$; all members of $Z \( 0 \)$ are strictly larger than $v$.
  We claim that every $\( u \, s \) in Z$ is strictly larger than $\( v \, 0 \)$. Equality is excluded by the choice of $v$. If instead $\( u \, s \) < \( v \, 0 \)$, let $k < r$ be their first differing coordinate. Then $u_k < v_k$ and earlier coordinates agree. Also $s > 0$, since every member of the lex slice $Z \( 0 \)$ is larger than $v$. We will move the $s$ units of the last coordinate into the first $r - 1$ coordinates to obtain a vector $w lt.eq v$.
  Let
  $ c = sum_(k < j < r) \( b_j - u_j \) $
  be the available capacity strictly after coordinate $k$. If $s lt.eq c$, distribute all $s$ units among those positions; the result still has $w_k = u_k < v_k$. If $s > c$, fill all those positions and put the remaining $s - c$ units at coordinate $k$. Since $\| u \| + s = \| v \| = d$ and the prefixes before $k$ agree,
  #[#set math.equation(numbering: n => "(6.4)")
   $ s - c = v_k - u_k - sum_(k < j < r) \( b_j - v_j \) lt.eq v_k - u_k . $ <box:tail-filling>]
  The remaining units therefore fit at $k$. If the inequality in (6.4) is strict, then $w_k < v_k$. If equality holds, every coordinate of the tail of $v$ is full, and the constructed vector is exactly $v$. In either case $w lt.eq v$. All the moves stay within the bounds, so repeated use of (6.3) gives $w in Z \( 0 \)$, a contradiction. This proves the claim.
  There are thus at least $\| Z \| = \| X \|$ vectors preceding $\( v \, 0 \)$. The lex segment $Y$ of that cardinality also consists entirely of vectors preceding $\( v \, 0 \)$. Its zero slice is therefore contained in $Z \( 0 \)$, proving
  #[#set math.equation(numbering: n => "(6.5)")
   $ \| Y \( 0 \) \| lt.eq \| Z \( 0 \) \| = \| X \( 0 \) \| . $ <box:zero-slice>]
  #emph[The top slice.] Put $B = sum_(h = 1)^r b_h$ and let $rho \( u \) = \( b_1 - u_1 \, dots.h \, b_r - u_r \)$. The reflected complement
  $ X^(*) = rho #scale(x: 120%, y: 120%)[\(] cal(B)_r \( d \) \\ X #scale(x: 120%, y: 120%)[\)] subset.eq cal(B)_r \( B - d \) $
  is stable. In fact, if an allowed upward transfer took a member of $X^(*)$ outside $X^(*)$, reflection would give an upward transfer from a member of $X$ to a vector outside $X$, contradicting stability. Reflection reverses lex order, so $Y^(*) = rho \( cal(B)_r \( d \) \\ Y \)$ is the lex segment of cardinality $\| X^(*) \|$.
  The zero-slice inequality, already proved in $r$ coordinates, applies to $X^(*) \, Y^(*)$. Their zero-slice cardinalities are
  $ \| X^(*) \( 0 \) \| & = \| cal(B)_(r - 1) \( d - b_r \) \| - \| X \( b_r \) \| \,\
\| Y^(*) \( 0 \) \| & = \| cal(B)_(r - 1) \( d - b_r \) \| - \| Y \( b_r \) \| . $
  It follows that $\| X \( b_r \) \| lt.eq \| Y \( b_r \) \|$.
  #emph[The shadow.] We have established both end-slice comparisons. To recover the shadow bound, we separate its zero slice from the remaining vectors. For any stable set $X$,
  #[#set math.equation(numbering: n => "(6.6)")
   $ \| partial X \| = \| partial' X \( 0 \) \| + \| X \| - \| X \( b_r \) \| . $ <box:shadow-count>]
  Indeed, its shadow vectors with last coordinate zero are precisely $partial' X \( 0 \)$. Every shadow vector $v$ with positive last coordinate has $v - e_r in X$: if it was obtained as $v = u + e_h$ with $h < r$, transfer one unit of the positive last coordinate of $u$ to coordinate $h$. This transfer is within bounds because $v$ is within bounds. Stability gives $v - e_r in X$. Thus adding $e_r$ bijects the members of $X$ outside its top slice with shadow vectors having positive last coordinate, proving (6.6).
  The same identity holds for the stable set $Y$. Its zero slice is a lex segment, and (6.5) gives $Y \( 0 \) subset.eq "Lex"' \( X \( 0 \) \)$. The induction hypothesis and monotonicity of shadows under inclusion imply
  $ \| partial' X \( 0 \) \| gt.eq \| partial' "Lex"' \( X \( 0 \) \) #scale(x: 120%, y: 120%)[\|] gt.eq \| partial' Y \( 0 \) \| . $
  Combining this with the top-slice inequality in (6.6) proves $\| partial X \| gt.eq \| partial Y \|$ and completes the induction. ◻
]

We apply the shadow comparison to the degree pieces of a monomial ideal. For $A = bb(C) \[ x_1 \, dots.h \, x_r \]$ and $P_r = \( x_1^(b_1 + 1) \, dots.h \, x_r^(b_r + 1) \)$, a monomial ideal $H supset.eq P_r$ is stable in the box sense precisely when each set

$ X_d = { u in cal(B)_r \( d \) : x^u in H } $

is stable. Define its degreewise lex replacement by

#[#set math.equation(numbering: n => "(6.7)")
 $ \( Lambda H \)_d = \( P_r \)_d + "span"_(bb(C)) { x^u : u in "Lex" \( X_d \) } \, #h(2em) Lambda H = xor.big_(d gt.eq 0) \( Lambda H \)_d . $ <box:lex-replacement>]

At this point $Lambda H$ is a graded vector subspace; the next proposition verifies its closure under multiplication.

#thm([Proposition 6.2.])[
  (Lex replacement is an ideal).  #emph[Let $b_1 \, dots.h \, b_r$ be positive integers, and let $H subset.eq bb(C) \[ x_1 \, dots.h \, x_r \]$ be a monomial ideal containing $P_r = \( x_1^(b_1 + 1) \, dots.h \, x_r^(b_r + 1) \)$ and stable in the box sense. Then the subspace $Lambda H$ defined in (6.7) is a monomial ideal containing $P_r$. It is stable in the box sense and has the same Hilbert function as $H$.]
] <box:ideal>

#proof[
  Write $Y_d = "Lex" \( X_d \)$. Since $H$ is an ideal, $partial X_d subset.eq X_(d + 1)$. Lemma 13 therefore gives
  $ \| partial Y_d \| lt.eq \| partial X_d \| lt.eq \| X_(d + 1) \| = \| Y_(d + 1) \| . $
  Both $partial Y_d$ and $Y_(d + 1)$ are lex segments in $cal(B)_r \( d + 1 \)$, so $partial Y_d subset.eq Y_(d + 1)$. Thus multiplying a monomial of $Lambda H$ by a variable either gives a monomial of the next lex segment or leaves the box and enters $P_r$. Products of monomials already in $P_r$ stay in $P_r$. This proves the ideal assertion. Each $Y_d$ is stable and has cardinality $\| X_d \|$, which proves stability and equality of Hilbert functions. ◻
]

== 7 Betti bounds for stable ideals <sec:tor>

The preceding section shows that degreewise lex replacement of a monomial ideal stable in the box is again an ideal with the same Hilbert function. We prove that this replacement also bounds every graded Betti number. The induction on the number of variables uses the first and last box slices. After reduction modulo the last variable, these determine two endpoint modules; the middle modules have zero Koszul differentials.

For modules with the same Hilbert function, the Koszul terms have equal dimensions in every homological and internal degree. An upper bound on Betti numbers is therefore equivalent to a lower bound on the sum of the two adjacent differential ranks. We first isolate this rank sum, which does not increase under taking either submodules or quotients. Let $m gt.eq 0$ and $R = bb(C) \[ x_1 \, dots.h \, x_m \]$. For a graded $R$-module $B$ with finite-dimensional graded pieces, write $K_bullet^R \( B \)$ for its Koszul complex and define its #emph[Koszul rank deficit] by

#[#set math.equation(numbering: n => "(7.1)")
 $ D_(p \, j)^R \( B \) = dim_(bb(C)) K_p^R \( B \)_j - beta_(p \, j)^R \( B \) \, #h(2em) p gt.eq 0 \, quad j in bb(Z) . $ <tor:deficit-definition>]

Terms of the Koszul complex outside its homological range are zero.

#thm([Lemma 7.1.])[
  #emph[For every $p gt.eq 0$ and $j in bb(Z)$, the quantity $D_(p \, j)^R \( B \)$ is the sum of the ranks of the two Koszul differentials adjacent to $K_p^R \( B \)_j$. If $U subset.eq B$ is a graded submodule and $V$ is a graded quotient of $B$, then 
$ D_(p \, j)^R \( U \) lt.eq D_(p \, j)^R \( B \) \, #h(2em) D_(p \, j)^R \( V \) lt.eq D_(p \, j)^R \( B \) . $

 The quantity is additive on finite direct sums, satisfies 
$ D_(p \, j)^R \( B \( - s \) \) = D_(p \, j - s)^R \( B \) \, $

 and vanishes when $R_(> 0) B = 0$.]
] <tor:deficit>

#proof[
  Write $d_p \( B \)_j : K_p^R \( B \)_j arrow.r K_(p - 1)^R \( B \)_j$ for the Koszul differential. Since its homology computes $"Tor"^R \( B \, bb(C) \)$,
  $ beta_(p \, j)^R \( B \) = dim_(bb(C)) K_p^R \( B \)_j - "rank" d_p \( B \)_j - "rank" d_(p + 1) \( B \)_j . $
  This proves the rank formula. The Koszul complex of $U$ embeds termwise into that of $B$, and the image of each of its differentials embeds into the corresponding differential image for $B$. For the quotient $V$, the termwise surjections give
  $ "im" d_p \( V \)_j = upright("the image of ") "im" d_p \( B \)_j upright(" in ") K_(p - 1)^R \( V \)_j . $
  Thus each of the two ranks can only decrease under either operation. Direct sums and grading shifts commute with the Koszul complex. Finally, if all the variables annihilate $B$, every Koszul differential is zero. ◻
]

#thm([Theorem 7.2.])[
  #emph[Let $r gt.eq 1$, let $2 lt.eq a_1 lt.eq dots.h.c lt.eq a_r$, and let $A = bb(C) \[ x_1 \, dots.h \, x_r \]$. Suppose that $H subset.eq A$ is a monomial ideal containing $\( x_1^(a_1) \, dots.h \, x_r^(a_r) \)$ and is stable in the box. Let $G = Lambda H$ be its degreewise lex replacement inside the box, together with the prescribed pure powers. Then, for every $p gt.eq 0$ and $j in bb(Z)$, 
$ beta_(p \, j)^A \( H \) lt.eq beta_(p \, j)^A \( G \) \, #h(2em) beta_(p \, j)^A \( A \/ H \) lt.eq beta_(p \, j)^A \( A \/ G \) . $

]
] <tor:stable>

#proof[
  By Proposition 14, $G$ is an ideal stable in the box and has the same Hilbert function as $H$. If $H = A$, then $G = A$ and both comparisons are equalities. For proper $H$, the ideal comparison implies the quotient comparison in positive homological degrees by Lemma 5:
  #[#set math.equation(numbering: n => "(7.2)")
   $ beta_(p + 1 \, j)^A \( A \/ H \) = beta_(p \, j)^A \( H \) \, #h(2em) beta_(p + 1 \, j)^A \( A \/ G \) = beta_(p \, j)^A \( G \) . $ <tor:ideal-quotient>]
  The two quotient Betti numbers in homological degree zero are both $1$ when $j = 0$ and $0$ otherwise. We prove the two comparisons simultaneously by induction on $r$, establishing the ideal comparison and then using (7.2). When $r = 1$, a monomial ideal containing $x_1^(a_1)$ is a power ideal or the full ring, and $H = G$.
  Assume $r > 1$ and $H$ proper, and put
  $ R = bb(C) \[ x_1 \, dots.h \, x_(r - 1) \] \, #h(2em) z = x_r \, #h(2em) a = a_r . $
  For $s gt.eq 0$, define coefficient ideals
  $ H^(\( s \)) = { u in R : u z^s in H } \, #h(2em) G^(\( s \)) = { u in R : u z^s in G } . $
  These are ascending monomial ideals containing the earlier prescribed powers, and they equal $R$ for $s gt.eq a$. For $s < a$, their stability in the earlier-variable box follows by applying stability with the last exponent fixed at $s$. For $1 lt.eq s < a$ we also have
  #[#set math.equation(numbering: n => "(7.3)")
   $ R_(> 0) H^(\( s \)) subset.eq H^(\( s - 1 \)) \, #h(2em) R_(> 0) G^(\( s \)) subset.eq G^(\( s - 1 \)) . $ <tor:slice-annihilation>]
  To see the first inclusion, it is enough to multiply a monomial of $H^(\( s \))$ by an earlier variable $x_i$. If its earlier-variable exponent, or that exponent after multiplication by $x_i$, is outside the box, the earlier powers already imply the required membership. Otherwise stability moves one factor of $z$ to $x_i$. The proof for $G$ is identical.
  We next pass from ideals over $A$ to modules over $R$. Multiplication by $z$ is injective on $H$, since $H$ is an ideal in the domain $A$. Set
  $ B_H = H \/ z H \, #h(2em) B_G = G \/ z G . $
  Reducing a minimal $A$-free resolution of $H$ modulo $z$ gives a minimal $R$-free resolution of $B_H$. Here is a direct exactness check. Lift a cycle in positive homological degree modulo $z$ to an element $y$ of the free resolution, and write $d y = z v$. Applying the next differential shows that $v$ is a cycle, using injectivity of $z$ on the free modules; in degree zero, apply the augmentation and use injectivity of $z$ on $H$ instead. Exactness gives $v = d u$, so $y - z u$ is a cycle and hence a boundary. Its reduction modulo $z$ is the original cycle. Right exactness identifies the cokernel with $B_H$, and all differential entries remain of positive degree or become zero, so minimality is preserved. The same argument applies to $G$. Therefore
  #[#set math.equation(numbering: n => "(7.4)")
   $ beta_(p \, j)^A \( H \) = beta_(p \, j)^R \( B_H \) \, #h(2em) beta_(p \, j)^A \( G \) = beta_(p \, j)^R \( B_G \) . $ <tor:reduction>]
  The injective multiplication maps also give
  $ dim_(bb(C)) \( B_H \)_d = dim_(bb(C)) H_d - dim_(bb(C)) H_(d - 1) \, #h(2em) dim_(bb(C)) \( B_G \)_d = dim_(bb(C)) G_d - dim_(bb(C)) G_(d - 1) . $
  Consequently $B_H$ and $B_G$ have equal Hilbert functions.
  The monomial decomposition by powers of $z$ describes these modules more precisely; this is the decomposition appearing in [7] Lemma 3.7. The coefficient of $z^0$ in $H \/ z H$ is $H^(\( 0 \))$, and its coefficient of $z^s$ for $s gt.eq 1$ is $H^(\( s \)) \/ H^(\( s - 1 \))$. Since $H^(\( s \)) = R$ for $s gt.eq a$, this gives an isomorphism of graded $R$-modules
  #[#set math.equation(numbering: n => "(7.5)")
   $ B_H tilde.equiv H^(\( 0 \)) xor xor.big_(s = 1)^(a - 1) \( H^(\( s \)) \/ H^(\( s - 1 \)) \) \( - s \) xor \( R \/ H^(\( a - 1 \)) \) \( - a \) . $ <tor:slice-decomposition>]
  There are no terms for $s > a$. The shifts record that multiplication by $z^s$ raises ordinary degree by $s$. By (7.3), all middle summands are annihilated by the variables of $R$, as illustrated in Figure 1. The decomposition is $R$-linear because multiplying by an earlier variable preserves the exponent of $z$. The middle summands still contribute to $"Tor"$, but their Koszul differentials have rank zero. Thus they contribute nothing to the deficits. Lemma 15 yields
  #[#set math.equation(numbering: n => "(7.6)")
   $ D_(p \, j)^R \( B_H \) = D_(p \, j)^R \( H^(\( 0 \)) \) + D_(p \, j - a)^R \( R \/ H^(\( a - 1 \)) \) \, $ <tor:endpoint-deficits>]
  and the identical formula holds for $G$.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((-3.3, 0), [#text(size: 9pt)[$"uz"^s in H$]])
  content((3.3, 0), [#text(size: 9pt)[$x_"iuz"^s in "zH"$]])
  content((3.3, -1.5), [#text(size: 9pt)[$x_"iuz"^(s-1) in H$]])
  line((-2.731, 0), (2.517, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((0, 0), [#text(size: 9pt)[$times x_i$]], anchor: "south", padding: 0.1176cm)
  line((3.3, -1.223), (3.3, -0.2569), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((3.3, -0.75), [#text(size: 9pt)[$times z$]], anchor: "west", padding: 0.1176cm)
  line((-2.731, -0.1293), (2.485, -1.315), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ">>", fill: black)))
  content((-0.198, -0.705), [#text(size: 9pt)[transfer $z$ to $x_i$]], anchor: "north", padding: 0.1176cm)
  content((-3.2, -1.55), [#text(size: 9pt)[$x_i["uz"^s]=0$ in $H"/""zH"$#linebreak() $1 lt.eq s<a$]])
})],
    caption: [Figure 1: A middle slice is annihilated by every earlier variable. The dashed arrow is supplied by box stability, or by an earlier prescribed power if the monomial leaves the earlier-variable box. Consequently all Koszul differentials on a middle slice vanish. At $s = 0$ there is no factor of $z$ to transfer; at $s = a$ the last exponent is outside the box. These are the two endpoints. ],
  ) <fig:endpoint-slices>
  It remains to compare the two endpoint contributions. Write $Lambda'$ for lex replacement with the earlier prescribed powers in $R$. The induction hypothesis applies to both $H^(\( 0 \))$ and $H^(\( a - 1 \))$. It gives an ideal comparison for the first and a quotient comparison for the second. Their respective lex replacements have the same Hilbert functions, and hence the same Koszul term dimensions. Subtracting the Betti inequalities from these dimensions gives
  #[#set math.equation(numbering: n => "(7.7)")
   $ D_(p \, j)^R \( H^(\( 0 \)) \) & gt.eq D_(p \, j)^R \( Lambda' H^(\( 0 \)) \) \,\
D_(p \, j - a)^R \( R \/ H^(\( a - 1 \)) \) & gt.eq D_(p \, j - a)^R \( R \/ Lambda' H^(\( a - 1 \)) \) . $ <tor:induction-zero>]
  This also covers any coefficient ideal equal to $R$: its lex replacement is $R$, the corresponding ideal comparison is equality, and its quotient is zero.
  The slice inequalities of Lemma 13 imply
  #[#set math.equation(numbering: n => "(7.8)")
   $ G^(\( 0 \)) subset.eq Lambda' H^(\( 0 \)) \, #h(2em) Lambda' H^(\( a - 1 \)) subset.eq G^(\( a - 1 \)) . $ <tor:endpoint-inclusions>]
  Indeed, fix an earlier-variable degree $e gt.eq 0$. For the first inclusion, apply the zero-slice inequality to the included exponent sets of $H$ and $G$ in total degree $e$. For the second, apply the top-slice inequality in total degree $e + a - 1$. Each slice of $G$ is already a lex segment in the earlier-variable box, so its cardinality comparison with the corresponding slice of $H$ becomes the stated containment in the appropriate lex replacement. All monomials outside the earlier-variable box belong to both ideals. This proves the inclusions in every degree.
  Apply Lemma 15 to the first inclusion in (7.8) and to the quotient map furnished by the second:
  $ R \/ Lambda' H^(\( a - 1 \)) arrow.r R \/ G^(\( a - 1 \)) . $
  Together with (7.7) and (7.7), this gives
  $ D_(p \, j)^R \( H^(\( 0 \)) \) & gt.eq D_(p \, j)^R \( G^(\( 0 \)) \) \,\
D_(p \, j - a)^R \( R \/ H^(\( a - 1 \)) \) & gt.eq D_(p \, j - a)^R \( R \/ G^(\( a - 1 \)) \) . $
  Adding and using (7.6), we obtain
  $ D_(p \, j)^R \( B_H \) gt.eq D_(p \, j)^R \( B_G \) . $
  The equal Hilbert functions of $B_H$ and $B_G$ imply
  $ dim_(bb(C)) K_p^R \( B_H \)_j = binom(r - 1, p) dim_(bb(C)) \( B_H \)_(j - p) = dim_(bb(C)) K_p^R \( B_G \)_j \, $
  with the binomial coefficient interpreted as zero outside its range. Subtracting the deficit inequality from these equal dimensions gives $beta_(p \, j)^R \( B_H \) lt.eq beta_(p \, j)^R \( B_G \)$. Equation (7.4) proves the ideal comparison over $A$, and (7.2) completes the quotient comparison. Every step applies to every $p gt.eq 0$ and $j in bb(Z)$; in particular, negative internal degrees and Koszul terms outside their homological range introduce no additional cases. ◻
]

== 8 The prescribed lex-plus-powers ideal <sec:assembly>

We now combine the comparisons, keeping the same ideal at every homological and internal degree.

#proof[
  If $I = S$, then $L_d = S_d$ is allowed in every degree and $J = S$; all quotient Betti numbers are zero. Assume $I eq.not S$. Proposition 9 gives a monomial ideal $M supset.eq P$ with the Hilbert function of $I$ and
  $ beta_(p \, j)^S \( S \/ I \) lt.eq beta_(p \, j)^S \( S \/ M \) #h(2em) \( p gt.eq 0 \, med j in bb(Z) \) . $
  Proposition 12 gives a box-stable monomial ideal $H supset.eq P$, with the same Hilbert function, and
  $ beta_(p \, j)^S \( S \/ M \) lt.eq beta_(p \, j)^S \( S \/ H \) . $
  By Proposition 14, the degreewise box-lex replacement $G = Lambda H$ is an ideal, with the same Hilbert function. Theorem 16 gives
  $ beta_(p \, j)^S \( S \/ H \) lt.eq beta_(p \, j)^S \( S \/ G \) . $
  It remains to check that $G$ is the ideal prescribed in (1.1). In degree $d$, list all monomials in decreasing lex order and remove those belonging to $P_d$. The remaining list is exactly $cal(B)_n \( d \)$ in decreasing lex order. The monomials of $G_d$ outside $P_d$ are the first
  $ q_d = dim_(bb(C)) I_d - dim_(bb(C)) P_d $
  positions of this remaining list. This integer lies between zero and $\| cal(B)_n \( d \) \|$, because $H supset.eq P$ has the same Hilbert function as $I$.
  Every box prefix is obtained by intersecting some full-list prefix with the box. Thus a lex-segment subspace $L_d$ with $dim_(bb(C)) \( L_d + P_d \) = dim_(bb(C)) I_d$ exists. Enlarging that full-list prefix to the largest one of the same resulting dimension adds only monomials already in $P_d$, and does not change the sum. Consequently $L_d + P_d = G_d$ for every $d$, including the empty and full box cases. Hence $J = G$. The displayed comparisons prove all the asserted Betti bounds for this single $J$. ◻
]

The argument proves idealness and all syzygy bounds together. The use of $bb(C)$ enters the commuting-form construction and supplies the roots of unity for stabilization; no conclusion in positive characteristic is asserted for an arbitrary regular sequence.

== 9 Arbitrary regular-sequence length and characteristic-zero fields <sec:characteristic-zero>

The new input of this paper is the Artinian theorem over $bb(C)$. We now apply the published Artinian reduction and record the coefficient-field argument needed for Corollary 2.

#proof[
  If $I = S_F$, the prescription gives $J = S_F$, and all quotient Betti numbers vanish. We may therefore assume that $I$ is proper.
  First let $F = bb(C)$. After a linear change of coordinates, one may arrange that
  $ f_1 \, dots.h \, f_c \, x_(c + 1) \, dots.h \, x_n $
  is a regular sequence; the list of variables is empty when $c = n$. Write $overline(f)_i$ for the images of the $f_i$ in $overline(S) = bb(C) \[ x_1 \, dots.h \, x_c \]$. They form a full regular sequence of degrees $a_1 \, dots.h \, a_c$. Theorem 1, applied in $overline(S)$ to every homogeneous ideal containing this sequence, gives both the Eisenbud–Green–Harris and lex-plus-powers assertions for $overline(f)_1 \, dots.h \, overline(f)_c$.
  The Artinian reduction of Caviglia–Maclagan [6] Proposition 10 transfers the Hilbert-function assertion to $f_1 \, dots.h \, f_c$. Theorem 4.1 of Caviglia–Kummini [5] transfers the Betti assertion as well. Their formulation uses Betti numbers of ideals. For any proper homogeneous ideal $K$ in a standard graded polynomial ring $A$, the exact sequence $0 arrow.r K arrow.r A arrow.r A \/ K arrow.r 0$ gives
  $ beta_(p + 1 \, j)^A \( A \/ K \) = beta_(p \, j)^A \( K \) #h(2em) \( p gt.eq 0 \, med j in bb(Z) \) . $
  The remaining quotient Betti number is $beta_(0 \, 0)^A \( A \/ K \) = 1$. Thus their convention is equivalent to the quotient convention used here. The lexicographic embedding modulo $P_F$ in that reduction selects exactly the prescribed $q_d$ greatest monomials outside $P_F$ in each degree. A linear change of coordinates preserves Hilbert functions and graded Betti numbers, so this proves the corollary over $bb(C)$.
  Now let $F$ be any characteristic-zero field. Choose homogeneous generators $g_1 \, dots.h \, g_r$ of $I$, and let $F_0 subset.eq F$ be the field generated over $bb(Q)$ by all coefficients of the $g_i$ and the $f_i$. Set
  $ S_0 = F_0 \[ x_1 \, dots.h \, x_n \] \, #h(2em) I_0 = \( g_1 \, dots.h \, g_r \, f_1 \, dots.h \, f_c \) subset.eq S_0 . $
  Then $I_0 S_F = I$. The sequence $f_1 \, dots.h \, f_c$ is regular in $S_0$: after tensoring each multiplication map with the faithfully flat extension $F \/ F_0$, it is the corresponding injective map over $S_F$. The finitely generated characteristic-zero field $F_0$ admits an embedding into $bb(C)$. Extending by this embedding preserves regularity, so the case just proved applies to
  $ S_(bb(C)) = bb(C) ⊗_(F_0) S_0 \, #h(2em) I_(bb(C)) = I_0 S_(bb(C)) . $
  No embedding of $F$ into $bb(C)$ is needed.
  Let $J_(bb(C))$ be the resulting lex-plus-powers ideal. It is a monomial ideal, so let $J_0 subset.eq S_0$ be generated by the same monomials and put $J_F = J_0 S_F$. For $E = F$ or $E = bb(C)$, let $S_E = E ⊗_(F_0) S_0$. Graded field base change preserves the dimensions of homogeneous pieces. It also gives, for $M_0 = S_0 \/ I_0$ and for $M_0 = S_0 \/ J_0$,
  $ E ⊗_(F_0) "Tor"_p^(S_0) \( M_0 \, F_0 \)_j #h(0.27778em) tilde.equiv #h(0.27778em) "Tor"_p^(S_E) \( E ⊗_(F_0) M_0 \, E \)_j . $
  For example, this follows by tensoring the Koszul complex of the variables with $E$; its graded homology commutes with this flat extension. Consequently the Hilbert equalities and Betti inequalities over $bb(C)$ give the same equalities and inequalities over $F$. Finally, the monomials of $P_F$ and the lexicographic order are determined by their exponents, while the dimensions defining $q_d$ are unchanged by these field extensions. Hence $J_F$ is precisely the degreewise ideal $J$ prescribed in the corollary. ◻
]

The argument changes the coefficient field only through extensions of the common characteristic-zero field $F_0$. It makes no assertion for arbitrary regular sequences in positive characteristic.

#heading(level: 1)[References]
#bibitem([1])[A.~Abedelfatah, #emph[On the Eisenbud--Green--Harris conjecture], Proc. Amer. Math. Soc. #strong[143] (2015), no.~1, 105--115. #link("https://doi.org/10.1090/S0002-9939-2014-12216-7")[doi:10.1090/S0002-9939-2014-12216-7]. Numbered statements refer to #link("https://arxiv.org/abs/1212.2653v1")[arXiv:1212.2653v1].]
#bibitem([2])[A.~M.~Bigatti, #emph[Upper bounds for the Betti numbers of a given Hilbert function], Comm.~Algebra #strong[21] (1993), no.~7, 2317--2334. #link("https://doi.org/10.1080/00927879308824679")[doi:10.1080/00927879308824679].]
#bibitem([3])[A.~M.~Bigatti, A.~Conca, and L.~Robbiano, #emph[Generic initial ideals and distractions], Comm.~Algebra #strong[33] (2005), no.~6, 1709--1732. #link("https://doi.org/10.1081/AGB-200058217")[doi:10.1081/AGB-200058217]. Author version: #link("https://arxiv.org/abs/math/0308004")[arXiv:math/0308004].]
#bibitem([4])[G.~Caviglia and A.~De Stefani, #emph[The Eisenbud--Green--Harris conjecture for fast-growing degree sequences], Ann. Sc. Norm. Super. Pisa Cl. Sci. (5) #strong[25] (2024), no.~3, 1753--1762. #link("https://doi.org/10.2422/2036-2145.202203_025")[doi:10.2422/2036-2145.202203\_025]. Numbered statements refer to #link("https://arxiv.org/abs/2007.15467v2")[arXiv:2007.15467v2].]
#bibitem([5])[G.~Caviglia and M.~Kummini, #emph[Poset embeddings of Hilbert functions and Betti numbers], J. Algebra #strong[410] (2014), 244--257. #link("https://doi.org/10.1016/j.jalgebra.2014.04.007")[doi:10.1016/j.jalgebra.2014.04.007]. Numbered statements refer to #link("https://arxiv.org/abs/1210.5562v2")[arXiv:1210.5562v2].]
#bibitem([6])[G.~Caviglia and D.~Maclagan, #emph[Some cases of the Eisenbud--Green--Harris conjecture], Math. Res. Lett. #strong[15] (2008), no.~3, 427--433. #link("https://www.math.purdue.edu/~gcavigli/Articles-PDF/%5B4%5D.pdf")[Author manuscript].]
#bibitem([7])[G.~Caviglia and A.~Sammartano, #emph[On the Lex-plus-powers Conjecture], Adv.~Math.~#strong[340] (2018), 284--299. #link("https://doi.org/10.1016/j.aim.2018.10.005")[doi:10.1016/j.aim.2018.10.005]. Numbered statements refer to #link("https://arxiv.org/abs/1802.03035v2")[arXiv:1802.03035v2].]
#bibitem([8])[G.~F.~Clements and B.~Lindström, #emph[A generalization of a combinatorial theorem of Macaulay], J. Combin. Theory #strong[7] (1969), no.~3, 230--238. #link("https://doi.org/10.1016/S0021-9800(69)80016-5")[doi:10.1016/S0021-9800(69)80016-5].]
#bibitem([9])[D.~Eisenbud, M.~Green, and J.~Harris, #emph[Higher Castelnuovo theory], Astérisque #strong[218] (1993), 187--202. #link("https://www.numdam.org/item/AST_1993__218__187_0/").]
#bibitem([10])[C.~A.~Francisco and B.~P.~Richert, #emph[Lex-plus-powers ideals], in I.~Peeva (ed.), #emph[Syzygies and Hilbert Functions], Lecture Notes in Pure and Applied Mathematics #strong[254], Chapman & Hall/CRC, Boca Raton, FL, 2007, 113--144. Author version: #link("https://math.okstate.edu/people/chris/lpp-updated-final.pdf").]
#bibitem([11])[H.~A.~Hulett, #emph[Maximum Betti numbers of homogeneous ideals with a given Hilbert function], Comm.~Algebra #strong[21] (1993), no.~7, 2335--2350. #link("https://doi.org/10.1080/00927879308824680")[doi:10.1080/00927879308824680].]
#bibitem([12])[N.~Kuzmanovski, #emph[A Structural Property of Generic Initial Ideals], preprint, 18 August 2026. #link("https://arxiv.org/abs/2608.17281v1")[arXiv:2608.17281v1].]
#bibitem([13])[J.~Mermin and S.~Murai, #emph[The Lex-Plus-Powers Conjecture holds for pure powers], Adv.~Math.~#strong[226] (2011), no.~4, 3511--3539. #link("https://doi.org/10.1016/j.aim.2010.08.022")[doi:10.1016/j.aim.2010.08.022]. Author version: #link("https://s-murai.w.waseda.jp/papers/LPP.pdf").]
#bibitem([14])[J.~Mermin, I.~Peeva, and M.~Stillman, #emph[Ideals containing the squares of the variables], Adv.~Math.~#strong[217] (2008), no.~5, 2206--2230. #link("https://doi.org/10.1016/j.aim.2007.11.014")[doi:10.1016/j.aim.2007.11.014]. Author version: #link("https://pi.math.cornell.edu/~mermin/papers/ideals_containing_the_squares_of_the_variables.pdf").]
#bibitem([15])[S.~Murai, #emph[Borel-plus-powers monomial ideals], J. Pure Appl. Algebra #strong[212] (2008), no.~6, 1321--1336. #link("https://doi.org/10.1016/j.jpaa.2007.09.010")[doi:10.1016/j.jpaa.2007.09.010]. Author version: #link("https://s-murai.w.waseda.jp/papers/BPP.pdf").]
#bibitem([16])[OpenAI, #emph[Commuting Division-Coefficient Forms and the Artinian Eisenbud--Green--Harris Conjecture], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Commuting-Division-Coefficient-Forms-and-the-Artinian-Eisenbud-Green-Harris-Conjecture-September-23-2026/paper.pdf")[OAI:Commuting-Division-Coefficient-Forms-and-the-Artinian-Eisenbud-Green-Harris-Conjecture-September-23-2026], 2026.]
#bibitem([17])[K.~Pardue, #emph[Deformation classes of graded modules and maximal Betti numbers], Illinois J. Math.~#strong[40] (1996), no.~4, 564--585. #link("https://doi.org/10.1215/ijm/1255985937")[doi:10.1215/ijm/1255985937].]
#bibitem([18])[B.~P.~Richert, #emph[A study of the lex plus powers conjecture], J. Pure Appl. Algebra #strong[186] (2004), no.~2, 169--183. #link("https://doi.org/10.1016/S0022-4049(03)00130-0")[doi:10.1016/S0022-4049(03)00130-0].]


