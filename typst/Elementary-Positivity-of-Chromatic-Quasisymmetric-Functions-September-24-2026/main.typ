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

#align(center)[#text(size: 16pt, weight: "bold")[Elementary positivity of chromatic \
quasisymmetric functions]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <main:introduction>

Let $h = \( h \( 1 \) \, dots.h \, h \( n \) \)$ be a weakly increasing integer sequence with $i lt.eq h \( i \) lt.eq n$. The associated #emph[natural unit interval graph] has vertex set $\[ n \] = { 1 \, dots.h \, n }$ and edges

$ E \( G \) = { { i \, j } : i < j lt.eq h \( i \) #scale(x: 120%, y: 120%)[}] . $

These are also called naturally labeled Dyck graphs. A proper coloring is a map $f : \[ n \] arrow.r bb(N)_(> 0)$ that has distinct values on adjacent vertices. In the variable alphabet $X = \( x_1 \, x_2 \, dots.h \)$ put

#[#set math.equation(numbering: n => "(1.1)")
 $ chi_G \( X \; q \) = sum_(f upright(" proper")) q^("asc"_G \( f \)) product_(a = 1)^n x_(f \( a \)) \, #h(2em) "asc"_G \( f \) = \# { { a \, b } in E \( G \) : a < b \, med f \( a \) < f \( b \) } . $ <main:csf>]

Shareshian and Wachs proved that this function is symmetric for this graph class and conjectured that its coefficients in the elementary basis belong to $bb(N) \[ q \]$ #cite(label("SW16")). Here $e_k \( X \) = sum_(i_1 < dots.h.c < i_k) x_(i_1) dots.h.c x_(i_k)$ and $e_lambda = product_i e_(lambda_i)$ for a partition $lambda$.

The coefficients admit a more precise interpretation in terms of permutations. Define

$ D_G^0 & = { sigma in S_n : sigma_i > sigma_(i + 1) arrow.r.double { sigma_i \, sigma_(i + 1) } in E \( G \) } \,\
"ginv"_G \( sigma \) & = \# { \( i \, j \) : i < j \, med sigma_i > sigma_j \, { sigma_i \, sigma_j } in E \( G \) } . $

Thus $D_G^0$ forbids adjacent descents between nonneighbors, and $"ginv"_G$ counts only inversions supported on edges.

#thm([Theorem 1.1.])[
  (Elementary positivity and a permutation witness).  #emph[There is a deterministic terminating procedure which, given a natural unit interval graph $G$ on $\[ n \]$ and $sigma in D_G^0$, returns a partition $theta_G \( sigma \) tack.r n$ such that 
#[#set math.equation(numbering: n => "(1.2)")
 $ chi_G \( X \; q \) = sum_(sigma in D_G^0) q^("ginv"_G \( sigma \)) e_(theta_G \( sigma \)) \( X \) . $ <main:witness>]

 In particular every elementary coefficient of $chi_G \( X \; q \)$ belongs to $bb(N) \[ q \]$. The assertion holds as a formal symmetric-function identity, uniformly in $n$ and $G$.]
] <main:theorem>

This proves the elementary-positivity part of the Shareshian–Wachs conjecture. The theorem makes no assertion of elementary unimodality. The construction specifies a map on individual inputs: it does not take the elementary coefficient list as input and redistribute permutations according to that list. Its running time may nevertheless be large.

For example, let $G$ be the path $1$–$2$–$3$. Its expansion is

#[#set math.equation(numbering: n => "(1.3)")
 $ chi_G \( X \; q \) = q thin e_(\( 2 \, 1 \)) \( X \) + \( 1 + q + q^2 \) e_(\( 3 \)) \( X \) . $ <main:path-example>]

Write $m_lambda$ for the sum of the distinct monomials with exponent multiset $lambda$. To check this directly, the colorings with a repeated color contribute $q thin m_(\( 2 \, 1 \)) \( X \)$, while those with three distinct colors contribute $\( 1 + 4 q + q^2 \) m_(\( 1 \, 1 \, 1 \)) \( X \)$. Now use $e_(\( 2 \, 1 \)) = m_(\( 2 \, 1 \)) + 3 m_(\( 1 \, 1 \, 1 \))$ and $e_(\( 3 \)) = m_(\( 1 \, 1 \, 1 \))$. The domain $D_G^0$ consists of $123 \, 132 \, 213 \, 321$, with graph-inversion degrees $0 \, 1 \, 1 \, 2$. The theorem assigns one of the two degree-one permutations to $\( 2 \, 1 \)$ and the other three permutations to $\( 3 \)$. Thus the map refines the degree count by an entire elementary partition. Equation (1.3) alone does not specify which of $132$ and $213$ receives which partition; the procedure in Section 6 makes that individual choice.

The positivity question is difficult because the coloring definition already has nonnegative coefficients in the monomial variables, whereas rewriting it in the elementary basis can involve subtraction. Our proof separates this issue from the individual assignment. It first identifies each relevant elementary coefficient with a positive algebraic object. It then realizes the algebraic identities by finite bijections between ordered collections of independent sets. Neither stage uses the sought elementary coefficient list as input to the permutation rule.

=== 1.1 History and significance <history-and-significance>

The problem grew out of positivity questions for immanants of Jacobi–Trudi matrices, studied by Haiman and by Stanley and Stembridge #cite(label("Hai93")) #cite(label("SS93")). Stanley introduced the chromatic symmetric function as a symmetric-function refinement of the chromatic polynomial #cite(label("Sta95")); it is the specialization of Equation (1.1) at $q = 1$. In this language, the Stanley–Stembridge conjecture asks for elementary positivity of the incomparability graphs of $\( 3 + 1 \)$-free posets #cite(label("SS93")) Conjecture 5.5. The incomparability graph joins two elements exactly when neither is below the other. A poset is $\( 3 + 1 \)$-free if it has no induced three-element chain together with an element incomparable to that chain. Guay-Paquet’s reduction expresses its chromatic symmetric function as a nonnegative rational combination of those of unit interval orders #cite(label("GP13")) Theorem 5.1. Their naturally labeled incomparability graphs are the graphs in Theorem 1. Specializing our theorem at $q = 1$ therefore also proves the classical positivity theorem, previously established by Hikita #cite(label("Hik24")).

Positive expansions in other bases provided important earlier structure. Haiman’s immanant results imply Schur positivity for incomparability graphs of $\( 3 + 1 \)$-free posets #cite(label("Hai93")); Gasharov gave a positive formula using poset tableaux #cite(label("Gas96")). Chow’s quasisymmetric expansion related chromatic symmetric functions to permutation descents #cite(label("Cho99")). Shareshian and Wachs introduced the $q$-refinement in Equation (1.1), proved its symmetry and Schur positivity for natural unit interval graphs, and formulated the elementary-positivity and elementary-unimodality conjecture #cite(label("SW12")) #cite(label("SW16")). Their acyclic-orientation formula gives elementary coefficients after grouping partitions by their number of parts #cite(label("SW16")) Theorem 5.3; Athanasiadis supplied a power-sum expansion #cite(label("Ath15")). These descriptions do not determine a nonnegative coefficient formula for each elementary partition.

The geometric connection gives another reason to study the $q$-grading. Tymoczko constructed permutation actions on equivariant cohomology #cite(label("Tym08")), and Shareshian and Wachs related their chromatic functions conjecturally to the graded representation on regular semisimple Hessenberg varieties #cite(label("SW12")) #cite(label("SW16")). Brosnan–Chow and Guay-Paquet proved this representation-theoretic identity #cite(label("BC18")) #cite(label("GP16")). That result is distinct from the elementary-positivity assertion addressed here. Geometric, combinatorial and algebraic approaches subsequently established positivity for substantial families: abelian Hessenberg varieties #cite(label("HP19")), classes treated by explicit elementary expansions #cite(label("CH19")), melting lollipops #cite(label("HNY20")), and the $q$-rook formulas for abelian Dyck paths #cite(label("CMP23")). The modular law also provided a systematic tool for organizing chromatic functions and their relations #cite(label("AN21")).

Hikita’s proof uses a probabilistic formula #cite(label("Hik24")). His formula gives numerical nonnegativity for every positive real $q$, while its rational $q$-weights do not establish coefficientwise nonnegativity in $bb(N) \[ q \]$; the refined conjecture remains explicitly distinguished in #cite(label("Hik24")) Section 1.3. Griffin, Mellit, Romero, Weigl and Wen gave an independent proof through Macdonald expansions, recovering Hikita’s elementary formula #cite(label("GMRWW25")). Further developments include positivity at $q = 1$ of the Abreu–Nigro $g$-functions, proved by Huh, Hwang, Kim, Kim and Oh as a refinement of Hikita’s theorem #cite(label("HHKKO25")), Chow’s combinatorial interpretation of the probabilities #cite(label("Chow26")), and lower bounds for elementary coefficients studied by Siegl #cite(label("Siegl26")). Theorem 1 gives a formal polynomial formula with nonnegative integer coefficients and an individual assignment preserving the specified graph-inversion weight.

The representation identity and Theorem 1 give the following degreewise consequence.

#thm([Corollary 1.2.])[
  (Young permutation modules in Hessenberg cohomology).  #emph[Let $n gt.eq 1$, let $h$ be as above with graph $G = G \( h \)$, and let $S in M_n \( bb(C) \)$ be regular semisimple. Write 
$ "Hess" \( S \, h \) = { F_bullet in "Flag" \( bb(C)^n \) : S F_i subset.eq F_(h \( i \)) upright(" for all ") i } . $

 For $lambda = \( lambda_1 \, dots.h \, lambda_ell \) tack.r n$, let $M^lambda = "Ind"_(S_lambda)^(S_n) upright(bold(1))_(bb(C))$ be the Young permutation module, where $S_lambda = S_(lambda_1) times dots.h.c times S_(lambda_ell)$ is the standard Young subgroup, and put 
$ m_(lambda \, d) \( h \) = \# { sigma in D_G^0 : theta_G \( sigma \) = lambda \, med "ginv"_G \( sigma \) = d } . $

 Then for every integer $d gt.eq 0$, under Tymoczko’s dot action on ordinary cohomology there is an abstract $bb(C) \[ S_n \]$-module isomorphism 
$ H^(2 d) \( "Hess" \( S \, h \) \; bb(C) \) tilde.equiv xor.big_(lambda tack.r n) \( M^lambda \)^(xor m_(lambda \, d) \( h \)) . $

]
] <main:hessenberg>

#proof[
  Write $"ch"$ for the Frobenius characteristic and $omega$ for the usual symmetric-function involution, so $omega \( e_lambda \) = h_lambda$, the product of complete homogeneous symmetric functions. The identity of Brosnan–Chow #cite(label("BC18")) Theorem 129 and Guay-Paquet #cite(label("GP16")), followed by Equation (1.2), gives
  $ "ch" H^(2 d) \( "Hess" \( S \, h \) \; bb(C) \) = \[ q^d \] thin omega chi_G \( X \; q \) = sum_(lambda tack.r n) m_(lambda \, d) \( h \) h_lambda . $
  Since $"ch" M^lambda = h_lambda$ #cite(label("BC18")) proof of Proposition 10, injectivity of the Frobenius characteristic and complete reducibility of finite-dimensional complex $S_n$-modules give the isomorphism. The argument supplies no preferred isomorphism, geometric basis, or compatibility with cup product. ◻
]

There is also a direct precedent for asking for a partition-valued permutation rule. Stanley and Stembridge proposed such an assignment on their compatible permutations #cite(label("SS93")) Remark 5.6. That proposal concerns the ungraded elementary expansion. The rule here retains the full graph-inversion degree and specifies a terminating procedure on each input. The finite cancellation used to pass from required ascents to exact ascents belongs to the bijective-cancellation tradition represented by the Garsia–Milne involution principle #cite(label("GM81")).

Our algebraic reduction likewise has substantial antecedents. Stanley’s graph specialization #cite(label("Sta98")) Section 2, chromatic functions in noncommuting variables #cite(label("GS01")), and the noncommutative symmetric-function methods of Fomin–Greene and Blasiak–Fomin #cite(label("FG98")) #cite(label("BF17")) provide a framework for commuting symmetric expressions inside a noncommutative algebra. Hwang’s noncommutative $P$-symmetric functions #cite(label("Hwa24")) and the poset algebras of Blasiak, Eriksson, Pylyavskyy and Siegl #cite(label("BEPS25")) provide direct predecessors of the graph-alphabet evaluation and its elementary/monomial coefficient pairing. We give a short proof in the centered quantum torus conventions needed for the subsequent argument.

The positive factorization and transport stages use the mathematical framework of Hall algebras and scattering diagrams. Ordered slope factorization and polynomial shuffle products were developed in #cite(label("Rei03")) #cite(label("KS11")), with semistable quotient and integrality results in #cite(label("Ef12")) #cite(label("FR18")) #cite(label("DMe20")). The connection from Hall factorization to wall transformations appears in Reineke’s Poisson automorphisms and Bridgeland’s stability scattering diagrams #cite(label("Rei10")) #cite(label("Bri17")). Scattering constructions originate in work of Kontsevich–Soibelman and Gross–Siebert #cite(label("KS06")) #cite(label("GS11")) #cite(label("KS14")); theta bases and mutation are central to the cluster framework of Gross–Hacking–Keel–Kontsevich #cite(label("GHKK18")), and Davison–Mandel prove strong quantum positivity #cite(label("DM21")). We prove the particular reordering, completion and transport statements needed here with their explicit gradings and finite coefficient bounds. The graph-specific step is then an identification: general positivity of theta sections does not itself show that a graph-alphabet monomial symmetric function is one such section. The triangular chart below proves that identity before the packet construction extracts the individual witness.

=== 1.2 Proof structure <proof-structure>

The first reduction replaces colorings by coefficients in an algebra whose monomials record vertex multiplicities. Write $q = v^2$ and let $X_m$ denote the basis monomial indexed by a vertex-multiplicity vector $m$. Multiplication of these monomials is twisted by an alternating form recording ordered edges. For a larger unit interval graph $Gamma$ containing $G$, let $E_k$ be the sum of the monomials of independent $k$-sets. We prove that the $E_k$ commute, so they may be evaluated as elementary symmetric functions $e_k \( Y \)$ of a formal alphabet $Y$. If $u$ is the sum of the original vertex exponents and $M = \| E \( G \) \|$, the elementary coefficient becomes

#[#set math.equation(numbering: n => "(1.4)")
 $ \[ e_lambda \( X \) \] chi_G \( X \; v^2 \) = v^M \[ X_u \] m_lambda \( Y \) . $ <main:reduction>]

Here $m_lambda$ is the monomial symmetric function. The identity is proved in Proposition 5.

The central step is to identify $m_lambda \( Y \)$ as a chamber value of a single positive section of a system of wall transformations. A wall is a portion of a hyperplane in the real dual of the exponent lattice, equipped with conjugation by a formal series. A section is a family of chamber values related by these transformations. We construct sections $Theta_m$, indexed by lattice exponents, by prescribing their coefficients in test directions determined by the alternating form. The auxiliary graph is arranged in a triangle with distinguished independent vertices $d_1 \, dots.h \, d_D$, called anchors. For a partition $lambda$ of length at most $D$, padded by zeroes to length $D$, the essential identification in the all-negative chamber is

#[#set math.equation(numbering: n => "(1.5)")
 $ m_lambda \( Y \) = Theta_(lambda_1 d_1 + dots.h.c + lambda_D d_D) . $ <main:identification>]

Repeated interval rotations establish this identity. A support argument using positive powers of $E_1$ is essential: stationarity under the rotations alone does not force an exponent to involve anchors only.

The proof has three main components. First, positive quantum factors remain positive when their order is reversed. We realize the new multiplicities as dimensions of explicit graded vector spaces, and prove the coefficient bounds needed for all infinite series. Second, the interval rotations identify a family of graph symmetric functions with single positive theta sections. Together with Equation (1.4), this already proves coefficientwise elementary positivity. Third, we extract the individual assignment. After reversing an input permutation, we group vertices into packets, each an independent set written in increasing order. A local packet bijection transports them to subsets of the independent anchors and records weighted jumps. The total jump histories are independent of packet sizes. Finite matching cancellation refines required nonedge ascents of input words and required strict ascents of anchor words to exact sets of such positions. The empty set on the anchor side leaves a weakly decreasing word, whose multiplicities give the output partition. The finite matching argument supplies termination without consulting the desired final shape counts.

Section 2 proves the coloring reduction and fixes permutation conventions. Section 3 proves the reordering result. Section 4 constructs the wall sections and proves their positivity and mutation rules. Section 5 establishes Equation (1.5), and Section 6 constructs the individual permutation map. Section 7 returns to the original graph and proves Theorem 1, including the reversal needed for the convention in $D_G^0$.

== 2 Graph alphabets and the coloring reduction <graph:section>

This section reduces the elementary expansion to coefficients of monomial symmetric functions evaluated in a quantum torus. It also fixes the permutation convention used by the transport construction.

=== 2.1 Admissible words and insertion digits <admissible-words-and-insertion-digits>

For the graph $G$ in the introduction put $l_a = \# { b < a : { b \, a } in E \( G \) }$ and $M = sum_a l_a$. The earlier neighbors of $a$ are a suffix of $\[ a - 1 \]$, and they form a clique. Let

$ cal(A)_G = { w in S_n : w_i < w_(i + 1) arrow.r.double { w_i \, w_(i + 1) } in E \( G \) } . $

We call these words #emph[admissible]. Their forbidden adjacent pairs are nonedge ascents. Write $"inv"_G \( w \)$ for their edge-inversion count, given by the same formula as $"ginv"_G$.

#thm([Lemma 2.1.])[
  (Insertion digits).  #emph[There is a bijection between $cal(A)_G$ and the sequences $\( j_1 \, dots.h \, j_n \)$ with $0 lt.eq j_a lt.eq l_a$. Under this bijection, $"inv"_G \( w \) = sum_a j_a$. Reversal is a bijection $D_G^0 arrow.r cal(A)_G$, and 
#[#set math.equation(numbering: n => "(2.1)")
 $ "inv"_G \( "reverse" sigma \) = M - "ginv"_G \( sigma \) . $ <graph:reverse>]

]
] <graph:digits>

#proof[
  Delete the largest letter $a$ from an admissible word on $\[ a \]$. If it has predecessor $b$ and successor $c$, then $b < a$ and $h \( b \) gt.eq a > c$, so the newly consecutive pair $\( b \, c \)$ is allowed. The cases without a predecessor or successor are immediate. Conversely, $a$ can be inserted at the beginning or immediately after any earlier neighbor, and these are exactly the allowed positions. At such a position the new inversions are the earlier neighbors lying to its right. Reading those neighbors in their order in the shorter word shows that the available counts are $l_a \, l_a - 1 \, dots.h \, 0$, each once. Successive insertion and deletion prove the bijection and degree formula. Reversal exchanges nonedge descents and nonedge ascents and reverses the order of the endpoints of every edge, proving Equation (2.1). ◻
]

The relation $a < b$ and ${ a \, b } in.not E \( G \)$ is transitive: it is equivalent to $h \( a \) < b$. Consequently, an increasing word in which each adjacent pair is a nonedge lists an independent set. This observation will identify packets of independent vertices with required ascent positions in Section 6.

=== 2.2 The quantum torus of an ordered graph <the-quantum-torus-of-an-ordered-graph>

For this subsection let $Gamma$ be any natural unit interval graph on a finite ordered vertex set. Let $L_Gamma$ be the free abelian group on its vertices, identifying a vertex with its basis vector. Define an integer alternating form by

#[#set math.equation(numbering: n => "(2.2)")
 $ Omega \( b \, a \) = cases(delim: "{", 1 \, & a < b upright(" and ") { a \, b } in E \( Gamma \) \,, 0 \, & a < b upright(" and ") { a \, b } in.not E \( Gamma \) \,) $ <graph:form>]

and extend by bilinearity and skew symmetry. Over $bb(Q) \( \( v^(- 1) \) \)$, the quantum torus has basis $X_m$, $m in L_Gamma$, and product

#[#set math.equation(numbering: n => "(2.3)")
 $ X_m X_(m') = v^(Omega \( m \, m' \)) X_(m + m') . $ <graph:torus>]

The coefficient field consists of Laurent series with bounded upper powers of $v$. All elements considered in this section are finite Laurent polynomials; the additional cone completions will be specified when needed.

For a set $I$ of vertices write $a_I = sum_(a in I) a$, and define

#[#set math.equation(numbering: n => "(2.4)")
 $ E_k \( Gamma \) = sum_(I subset.eq V \( Gamma \) upright(" independent")\
\| I \| = k) X_(a_I) \, #h(2em) E_0 \( Gamma \) = 1 . $ <graph:elementaries>]

The graph alphabet used here is a centered quantum-torus version of noncommutative poset symmetric functions #cite(label("Hwa24")) #cite(label("BEPS25")). More precisely, on $V \( Gamma \)$ define $a <_P b$ when $a < b$ and ${ a \, b }$ is a nonedge. The chain elementary sums in #cite(label("BEPS25")) Equation (2.4) become our independent-set sums, and the relations in #cite(label("BEPS25")) Definition 3.16 become the relations above under $u_a mapsto X_a$ and $t mapsto v^2$. We prove commutation directly in these conventions.

#thm([Proposition 2.2.])[
  (Commuting independent-set sums).  #emph[For every natural unit interval graph $Gamma$ and all $j \, k gt.eq 0$, $E_j \( Gamma \) E_k \( Gamma \) = E_k \( Gamma \) E_j \( Gamma \)$.]
] <graph:commutation>

#proof[
  We adapt the two-color involution underlying #cite(label("SW16")) Lemma 4.4 and Theorem 4.5. A term on the left is an ordered pair of independent sets $\( I \, J \)$, with exponent $a_I + a_J$ and weight $v^(Omega \( a_I \, a_J \))$. Vertices in $I ∩ J$ have no neighbors in $I union J$ and contribute no skew weight. In the remaining induced graph, every earlier-neighbor set and every later-neighbor set is a clique. Since the graph is bipartite with parts $I \\ J$ and $J \\ I$, each vertex has at most one earlier and one later neighbor. More explicitly, an edge that skipped a vertex of $I union J$ in the total order would make a triangle: the interval-closure property supplies both intervening edges. Thus each nontrivial component is an increasing path with alternating membership in $I$ and $J$.
  On every component with an odd number of vertices, exchange the two memberships; keep the even components and the doubled isolated vertices unchanged. Every even component has equally many vertices in the two sets. Every odd component reverses its size difference, so the new ordered pair $\( I' \, J' \)$ has sizes $k \, j$. On an odd component the successive edge contributions to $Omega \( a_I \, a_J \)$ alternate between $1$ and $- 1$, with equally many of each. Its skew contribution is therefore zero before and after the exchange. There are no edges between components. Exponents and weights are preserved, and repeating the exchanges recovers $\( I \, J \)$. This is the required bijection of terms. ◻
]

Let $alpha \( Gamma \)$ denote the maximum size of an independent set in $Gamma$, and suppose $alpha \( Gamma \) lt.eq D$. The ring of symmetric polynomials in $D$ commuting variables is the polynomial ring in $e_1 \, dots.h \, e_D$. Proposition 4 therefore defines an algebra homomorphism by $e_k mapsto E_k \( Gamma \)$, with $E_k = 0$ for $k > D$. We denote its value on a symmetric polynomial $F$ by $F \( Y \)$, and write $e_k \( Y \) = E_k$. The symbol $Y$ denotes this evaluation; no individual roots $y_i$ in the quantum torus are being asserted. In particular, $m_lambda \( Y \)$ is well defined for partitions of length at most $D$, where $m_lambda$ is the sum of distinct monomials with exponent multiset $lambda$.

=== 2.3 The elementary coefficient identity <the-elementary-coefficient-identity>

Let $G$ be the induced ordered graph on distinct vertices $a_1 \, dots.h \, a_n$ of $Gamma$, and put $u = a_1 + dots.h.c + a_n$. For a proper coloring $f$ define $"inv"_G \( f \) = \# { a < b : { a \, b } in E \( G \) \, med f \( a \) > f \( b \) }$ and let $X_G \( X \; q \)$ be the corresponding proper-color inversion generating function.

The following coefficient reduction is the elementary/monomial form of the noncommutative Cauchy pairing in #cite(label("Hwa24")) Theorem 4.4, Corollary 4.5 and Proposition 4.25 and #cite(label("BEPS25")) Proposition 2.9 and Corollary 2.10. We include its proof to fix the graph-inversion and centered-monomial factors.

#thm([Proposition 2.3.])[
  (Coloring kernel).  #emph[If $alpha \( Gamma \) lt.eq D$, then $X_G \( X \; q \)$ is symmetric and 
#[#set math.equation(numbering: n => "(2.5)")
 $ X_G \( X \; v^2 \) = sum_(lambda tack.r n\
ell \( lambda \) lt.eq D) v^M \[ X_u \] m_lambda \( Y \) thin e_lambda \( X \) . $ <graph:coefficient>]

 The equality is independent of the extra vertices of $Gamma$.]
] <graph:kernel>

#proof[
  Work first with $r$ colors. Expand the product, in increasing color order,
  $ product_(c = 1)^r (sum_(k = 0)^D x_c^k E_k) . $
  Its $X_u$ coefficient chooses a disjoint independent set for each color, covering precisely the original vertices. Extra vertices cannot occur because each exponent in each factor has nonnegative vertex coordinates. These choices are exactly the proper colorings. An edge whose later vertex has smaller color contributes $+ 1$ to the torus exponent, and an edge whose earlier vertex has smaller color contributes $- 1$. The total exponent is $2 "inv"_G \( f \) - M$. Hence multiplying this coefficient by $v^M$ gives $X_G \( x_1 \, dots.h \, x_r \; v^2 \)$.
  For ordinary variables $y_1 \, dots.h \, y_D$ the elementary dual kernel identity is
  $ product_(c = 1)^r product_(i = 1)^D \( 1 + x_c y_i \) = sum_lambda e_lambda \( x_1 \, dots.h \, x_r \) m_lambda \( y_1 \, dots.h \, y_D \) . $
  Indeed, select for each labeled $y_i$ a subset of the $x$ variables; grouping its subset sizes by their multiset gives the displayed sum. Evaluate the symmetric $y$ polynomials at $Y$, extract $X_u$, and multiply by $v^M$. This proves Equation (2.5) for every $r$, and therefore as a symmetric-function identity. The coloring interpretation proves independence of the ambient graph. ◻
]

#prodef([Example 2.4.])[
  (The centered normalization on two vertices).  Let $Gamma = G$ have ordered vertices $a < b$. If they are adjacent, $E_2 = 0$ and $m_(\( 2 \)) \( Y \) = E_1^2$ has $X_(a + b)$-coefficient $v + v^(- 1)$. The factor $v^M = v$ in Equation (2.5) therefore gives $X_G \( X \; q \) = \( 1 + q \) e_2 \( X \)$. If they are nonadjacent, $E_2 = X_(a + b)$ and the two terms in $E_1^2$ at this exponent each have weight one. Hence $\[ X_(a + b) \] m_(\( 2 \)) \( Y \) = \[ X_(a + b) \] \( E_1^2 - 2 E_2 \) = 0$, whereas $\[ X_(a + b) \] m_(\( 1 \, 1 \)) \( Y \) = \[ X_(a + b) \] E_2 = 1$, giving $X_G \( X \; q \) = e_1 \( X \)^2$. Even in this small case, evaluating a monomial symmetric function requires subtraction; positivity of the generators $E_k$ by itself does not settle the elementary coefficients.
]

#thm([Lemma 2.5.])[
  (Color reversal and shape reciprocity).  #emph[For every natural unit interval graph $G$, $X_G \( X \; q \) = chi_G \( X \; q \)$. Writing $c_lambda \( q \) = \[ e_lambda \] X_G \( X \; q \)$, one has 
#[#set math.equation(numbering: n => "(2.6)")
 $ c_lambda \( q \) = q^M c_lambda \( q^(- 1) \) $ <graph:reciprocity-eq>]

 for every partition $lambda$.]
] <graph:reciprocity>

#proof[
  Use $r$ colors and send $f$ to $r + 1 - f$. This interchanges color ascents and inversions and reverses the variable alphabet. Symmetry, which follows from Proposition 5 with $Gamma = G$, removes the variable reversal and gives $X_G = chi_G$. Since a proper coloring has $"asc"_G \( f \) + "inv"_G \( f \) = M$, the same argument gives $X_G \( X \; q \) = q^M X_G \( X \; q^(- 1) \)$. Take $r gt.eq n$, so the elementary functions of degree $n$ are independent, and compare their coefficients. Passing to the symmetric-function limit proves Equation (2.6). ◻
]

It now suffices to prove positivity of $\[ X_u \] m_lambda \( Y \)$ for a suitable ambient graph. The graph used in Section 5 has $D$ independent anchors and lies in an interval of length $D - 1$; independent vertices are spaced by at least one, so its independence number is $D$. Lemma 25 places every original graph among its vertices. The next two sections develop the positive wall sections with which these monomial symmetric functions will be identified.

== 3 Positive reordering in a quantum torus <alg:section>

We prove the algebraic statement that supplies positivity at a wall joint. The proof keeps two gradings distinct: polynomial degree records powers of $v$, whereas an auxiliary filtration makes a coproduct regular. The resulting algebra need not be commutative. Its graded vector-space dimensions nevertheless have the required symmetric-algebra form.

Let $Gamma$ be a lattice with an integral alternating form $Omega$, and let $C subset Gamma$ be an additive monoid contained in a strictly convex cone in a real two-dimensional subspace. Fix an additive charge $c : C arrow.r bb(N)$ that is positive away from zero, and assume that ${ p in C : c \( p \) lt.eq B }$ is finite for every $B$. The completed quantum torus has multiplication

#[#set math.equation(numbering: n => "(3.1)")
 $ X_p X_q = v^(Omega \( p \, q \)) X_(p + q) $ <alg:torus>]

and coefficients in $bb(Q) \( \( v^(- 1) \) \)$. Thus a coefficient has a bounded upper $v$-degree and can have infinitely many negative degrees. For $p in C \\ { 0 }$ and $k in bb(Z)$, define

#[#set math.equation(numbering: n => "(3.2)")
 $ E_(p \, k) = product_(j gt.eq 0) \( 1 + v^(k - 2 j) X_p \) \, #h(2em) H_(p \, k) = product_(j gt.eq 0) \( 1 - v^(k - 2 j) X_p \)^(- 1) . $ <alg:units>]

We call these #emph[elementary units]. A list of their occurrences is #emph[admissible] if, for each charge bound $B$, their parameters $k$ are bounded above and only finitely many occurrences with $c \( p \) lt.eq B$ have $k gt.eq L$, for each $L in bb(Z)$. Occurrences are counted with multiplicity.

#thm([Theorem 3.1.])[
  (Positive reordering).  #emph[Suppose an admissible product of elementary units is written in ray order, with $Omega \( p_i \, p_j \) > 0$ whenever the ray of $p_i$ precedes the distinct ray of $p_j$. Its factorization in the opposite ray order is again a product of elementary units, with nonnegative integral multiplicities. The output list is admissible.]
  #emph[Every coefficient at fixed exponent and fixed $v$-degree is a finite sum of nonnegative integers, and each exponent has bounded upper $v$-degree. The assertion also holds modulo any fixed charge cutoff. For the algorithmic assertion, assume that lattice operations, the form $Omega$ and the charge are effectively computable, that input occurrences at bounded charge and above a given parameter threshold can be listed effectively, and that for every $B$ one can compute an integer $A_B gt.eq 1$ such that 
$ \| Omega \( p \, q \) \| lt.eq A_B #h(2em) upright("whenever ") p \, q in C \, quad c \( p \) \, c \( q \) lt.eq B . $

 Then every prescribed coefficient and every bounded part of the output unit list can be calculated by finite rational linear algebra.]
] <alg:reordering>

We first decompose shuffle spaces by slope and use separated-center restrictions to construct a coproduct on an auxiliary associated graded space. Polynomiality of the restriction symbols removes negative separation powers before evaluation at zero. A signed vector-space PBW decomposition and primitive strings then give the positive elementary factors. Throughout, polynomial degree with its shifts records powers of $v$; the final energy bounds control infinite input lists.

A ray factorization with constant term one exists uniquely over $bb(Q) \( \( v^(- 1) \) \)$: at charge $B$, subtract the contributions already determined at smaller charges, and assign the remaining coefficient of $X_p$ to the ray of $p$. Products involving that new coefficient and a nonconstant term have larger charge. We shall prove that, in the order specified in Theorem 8, each resulting ray factor has the stronger form asserted there.

=== 3.1 Shuffle spaces and destabilizing quotients <shuffle-spaces-and-destabilizing-quotients>

Begin with finitely many input occurrences, indexed by $1 \, dots.h \, t$ in input ray order. Units on one ray may be ordered arbitrarily. Set $a_(i i) = 0$ for $E_(p_i \, k_i)$ and $a_(i i) = 1$ for $H_(p_i \, k_i)$. For $i eq.not j$, put

$ a_(j i) = max { Omega \( p_i \, p_j \) \, 0 } . $

For dimension vectors $d \, e in bb(N)^t$, define

#[#set math.equation(numbering: n => "(3.3)")
 $ p \( d \) & = sum_i d_i p_i \, & chi \( d \, e \) & = sum_i d_i e_i - sum_(i \, j) a_(i j) d_i e_j \,\
s \( d \) & = 1 / 2 chi \( d \, d \) \, & u \( d \) & = sum_i d_i \( k_i + 1 - a_(i i) \) . $ <alg:euler>]

Then

#[#set math.equation(numbering: n => "(3.4)")
 $ chi \( d \, e \) - chi \( e \, d \) = Omega \( p \( d \) \, p \( e \) \) . $ <alg:skew>]

Choose a linear functional $eta$ on the plane so that $mu \( d \) = eta \( p \( d \) \) \/ c \( p \( d \) \)$ increases in input ray order. This is possible by intersecting the strictly convex cone with $c = 1$. Dimension vectors of a common slope have symmetric pairings under $chi$. We use $\| d \|_1 = sum_i d_i$ only to count variables and to perform inductions; it is different from charge.

Let

$ S_d = bb(Q) \[ x_(i \, alpha) : 1 lt.eq i lt.eq t \, med 1 lt.eq alpha lt.eq d_i \]^(product_i frak(S)_(d_i)) \, #h(2em) S_0 = bb(Q) \, $

with every variable of polynomial degree one. Variables with a fixed $i$ form a pack. The polynomial shuffle presentation is the cohomological Hall product of Kontsevich–Soibelman #cite(label("KS11")) Section 2.4, Theorem 2; see also #cite(label("Ef12")) Theorem 2.2. In our normalization it is

#[#set math.equation(numbering: n => "(3.5)")
 $ f * g = sum_(upright("pack shuffles")) f \( x \) g \( y \) K_(d \, e) \( x \, y \) \, #h(2em) K_(d \, e) \( x \, y \) = product_(i \, j) product_(alpha lt.eq d_i \, thin beta lt.eq e_j) \( y_(j \, beta) - x_(i \, alpha) \)^(a_(i j) - bold(1)_(i = j)) . $ <alg:shuffle>]

Each shuffle chooses, in each output pack, the variables assigned to the first input; there is no factorial normalization. The only possible poles are simple poles between two variables of the same output pack. Interchanging those two variables pairs the residues with opposite signs. After taking a common denominator, the numerator is therefore divisible by every such difference. The differences are relatively prime irreducible polynomials, so all poles cancel. Consequently $f * g in S_(d + e)$. A simultaneous shuffle of three input groups proves associativity: each pair of groups contributes exactly one kernel in either parenthesization. Polynomial degree changes by $- chi \( d \, e \)$.

The destabilizing quotient below is the polynomial form of the semistable restriction quotient in #cite(label("FR18")) Theorem 8.1. We establish its needed properties directly for our charge-weighted slope. For $d eq.not 0$, put

#[#set math.equation(numbering: n => "(3.6)")
 $ I_d = sum_(a + b = d \, med a \, b eq.not 0\
mu \( a \) > mu \( d \)) S_a * S_b \, #h(2em) B_d = S_d \/ I_d \, #h(2em) B_0 = bb(Q) . $ <alg:quotient>]

Every image $S_a * S_b$ is an ordinary $S_d$-submodule. Indeed an output symmetric polynomial, restricted to the two input packs, is a finite sum of polynomial tensors; multiplication by it can be moved inside the shuffle. Thus $I_d$ is an ordinary homogeneous ideal.

The product descends to $B_d ⊗ B_e arrow.r B_(d + e)$ when $mu \( d \) = mu \( e \) = theta$. If $a + b = d$ and $mu \( a \) > theta$, a term $\( S_a * S_b \) * S_e$ has the same destabilizing first group $a$. If $a + b = e$ and $mu \( a \) > theta$, a term $S_d * \( S_a * S_b \) = \( S_d * S_a \) * S_b$ has destabilizing first group $d + a$. This proves descent in both arguments. Give $B_d$ shifted degree

#[#set math.equation(numbering: n => "(3.7)")
 $ deg_(upright("sh")) f = deg_(upright("pol")) f + s \( d \) . $ <alg:shifted-degree>]

On a common slope, $s \( d + e \) = s \( d \) + s \( e \) + chi \( d \, e \)$, so the descended product preserves the sum of shifted degrees.

=== 3.2 Separated centers and ordered decomposition <separated-centers-and-ordered-decomposition>

We record carefully the restriction operation used throughout the proof. For an ordered list $P = \( r_1 \, dots.h \, r_m \)$ of nonzero dimension vectors summing to $d$, divide each pack of $d$ into labeled groups with multiplicities $r_ell$, replace the variables in group $ell$ by $x^ell + z_ell$, and reduce modulo $I_(r_ell)$ in every group. This defines

#[#set math.equation(numbering: n => "(3.8)")
 $ tilde(R)_P^z : S_d arrow.r (⨂_(ell = 1)^m B_(r_ell)) \[ z_1 \, dots.h \, z_m \] . $ <alg:restriction-S>]

The choices inside a pack do not matter because its input is symmetric. Common translation preserves $I_d$: all kernels in Equation (3.5) depend on differences. Hence translation also defines an automorphism of $B_d \[ z \]$.

Here is the useful way to apply Equation (3.8) to a shuffle expression. Split each source group into subgroups assigned to the target groups. At distinct centers expand the kernels between different targets in their internal variables, over $bb(Q) \( z_1 \, dots.h \, z_m \)$. Each coefficient is separately symmetric in the source subgroups and is a finite sum of polynomial tensors. The kernels within one target are left unexpanded and give its ordinary shuffle product. If a prefix of the source groups has dimension $b$ inside a target of dimension $r$, with $mu \( b \) > mu \( r \)$, that target contribution is in $I_r$ by associativity and vanishes. All these operations are legitimate in the product of homogeneous internal-degree spaces. Vanishing of the Taylor expansion implies vanishing of the original polynomial restriction, since its target ideals are homogeneous and extension of scalars to $bb(Q) \( z_1 \, dots.h \, z_m \)$ is injective.

The slope ordering follows the Harder–Narasimhan factorization formalism #cite(label("Rei03")) Propositions 4.8 and 4.12, #cite(label("KS11")) Sections 5.2–5.3. Ordered multiplication of semistable pieces is established in #cite(label("FR18")) Theorem 6.2; the next argument proves the required decomposition for the explicit quotients above. Here the locator for #cite(label("FR18")) refers to its published version.

#thm([Lemma 3.2.])[
  (Ordered decomposition).  #emph[Choose graded vector-space sections $B_d arrow.r S_d$ of all quotient maps. For every $d$, multiplication induces a vector-space isomorphism 
#[#set math.equation(numbering: n => "(3.9)")
 $ S_d tilde.equiv xor.big_(d^(\( 1 \)) + dots.h.c + d^(\( m \)) = d\
mu \( d^(\( 1 \)) \) > dots.h.c > mu \( d^(\( m \)) \)) B_(d^(\( 1 \))) ⊗ dots.h.c ⊗ B_(d^(\( m \))) \, $ <alg:ordered-sum>]

 with the polynomial-degree shifts prescribed by the shuffle kernels.]
] <alg:ordered>

#proof[
  Induct on $\| d \|_1$. Modulo the chosen lift of $B_d$, every element is a sum of destabilizing products. Expand their two factors by induction. Draw a polygon for a resulting list by joining the successive points
  $ (c \( p \( d^(\( 1 \)) + dots.h.c + d^(\( j \)) \) \) \, eta \( p \( d^(\( 1 \)) + dots.h.c + d^(\( j \)) \) \)) . $
  The original destabilizing cut lies strictly above the chord joining the endpoints. If adjacent slopes are nondecreasing, merge those two factors and apply the induction hypothesis to their product. Their total dimension is smaller than $d$: a list of only two such factors could not have a destabilizing cut. The replacement polygons are concave and lie above the chord of the merged pair, hence above the old pair. Equality can occur only for a straight pair, in which case the number of segments decreases. The polygon remains strictly above the total chord somewhere. There are only finitely many lists of nonzero subdimension vectors of $d$, so this process terminates at strictly decreasing slopes. This proves spanning.
  For independence, restrict an ordered product to targets $r_1 \, dots.h \, r_m$ of strictly decreasing slopes. A surviving split has no destabilizing source prefix in any target. At a source cut, if the portion in target $r_j$ has charge $b_j$, its height is at most $b_j mu \( r_j \)$. Among all choices with fixed sum $sum_j b_j$, this upper bound is maximized by filling the targets in decreasing slope order. Thus the source polygon lies below the target polygon at every source corner, and hence everywhere: the target polygon is concave. If the polygons coincide, strictness of their slopes forces equality at each corner. The first target must be completely filled at the first corner, the first two at the second, and so on. Consequently the only surviving split assigns whole source groups to the matching whole targets. In particular the #emph[dimension vectors], not only their charges and slopes, must agree.
  In a finite relation choose a polygon minimal under pointwise comparison. Restriction to its dimension-vector list kills every other list: a surviving source polygon would have to be smaller, or equal with that same list. For the matching list the restriction is the tensor of the translated lifts, multiplied by all intergroup kernels. These kernels are invertible Taylor series at separated centers. They act on the quotient tensor because they are separately symmetric in each whole target group. Cancel them. Translation is an automorphism of each quotient, and the chosen lifts identify with the quotient vector spaces. Thus the original tensor in that summand must be zero. Applying this to a minimal nonzero summand contradicts the proposed relation. ◻
]

#thm([Lemma 3.3.])[
  (Restrictions on a slope).  #emph[If all $r_ell$ have the slope of $d$, Equation (3.8) factors through a map 
#[#set math.equation(numbering: n => "(3.10)")
 $ R_P^z : B_d arrow.r (⨂_ell B_(r_ell)) \[ z \] . $ <alg:restriction>]

 These maps compose under refinement, with the successive centers added. When a same-slope product is restricted, only splits whose nonempty subgroups have this slope survive; the restrictions of its two factors may already be taken in their respective quotients.]
] <alg:restrictions>

#proof[
  Consider a destabilizing product with first dimension $a$. If every piece of $a$ in a target had slope at most the common slope, their sum would too, contrary to $mu \( a \) > mu \( d \)$. Some target is therefore destabilized, and the preceding Taylor test kills the term. This proves descent. Refinement is composition of polynomial substitutions; the descended maps therefore compose as claimed.
  For a product with first total dimension of the common slope, split that dimension among equal-slope targets. If any nonempty piece is off the slope, some piece must lie above it, by the weighted-average identity for slopes. That target is destabilized. In every remaining split both pieces of a target have the common slope. Internal shuffle products descend by Equation (3.6); multiplication by the Taylor coefficients preserves the quotient ideals because they are ordinary ideals. This justifies taking all input subgroups in their quotients before the remaining computation. ◻
]

=== 3.3 The Hilbert-series target <the-hilbert-series-target>

The ordered decomposition gives a formula for each factor in the reversed ray order. We derive that formula now, so that the remaining problem is a precise statement about graded dimensions.

The Hilbert series of the ordinary pack-symmetric polynomial space is

#[#set math.equation(numbering: n => "(3.11)")
 $ "Hilb"_(S_d) \( t \) = product_i product_(j = 1)^(d_i) \( 1 - t^j \)^(- 1) . $ <alg:ordinary-hilbert>]

Indeed monomial orbit sums are indexed by weakly decreasing exponent lists in each pack, and their successive differences contribute independent degrees $1 \, dots.h \, d_i$.

The coefficient of $X_(m p)$ in $E_(p \, k)$ is the generating series of $0 lt.eq j_1 < dots.h.c < j_m$, weighted by $v^(k m - 2 sum j_r)$; subtracting $0 \, 1 \, dots.h \, m - 1$ turns this into a weakly increasing list. For $H_(p \, k)$ the list is weakly increasing from the outset. Thus those two coefficients are respectively

$ frac(v^(k m - m \( m - 1 \)), product_(j = 1)^m \( 1 - v^(- 2 j) \)) \, #h(2em) frac(v^(k m), product_(j = 1)^m \( 1 - v^(- 2 j) \)) . $

Taking the ordered torus product shows that the finite input is

#[#set math.equation(numbering: n => "(3.12)")
 $ sum_(d in bb(N)^t) X_(p \( d \)) v^(u \( d \) - chi \( d \, d \)) "Hilb"_(S_d) \( v^(- 2) \) . $ <alg:input-series>]

The diagonal terms give exactly the two displayed unit coefficients; the off-diagonal terms $- chi \( d \, d \)$ supply $sum_(i < j) d_i d_j Omega \( p_i \, p_j \)$, which is the torus multiplication shift.

Apply Lemma 9. For two blocks $a \, b$, the shuffle degree shift is $- chi \( a \, b \)$. Hence normalization by $v^(- chi \( d \, d \))$ changes their combined exponent relative to the separate normalizations by

$ 2 chi \( a \, b \) - chi \( a \, b \) - chi \( b \, a \) = chi \( a \, b \) - chi \( b \, a \) = Omega \( p \( a \) \, p \( b \) \) . $

This is precisely Equation (3.1). Equation (3.12) therefore factors in decreasing slope order, with slope factor

#[#set math.equation(numbering: n => "(3.13)")
 $ 1 + sum_(mu \( d \) = theta) X_(p \( d \)) v^(u \( d \) - chi \( d \, d \)) "Hilb"_(B_d) \( v^(- 2) \) \, $ <alg:slope-factor>]

where $"Hilb"_(B_d)$ uses ordinary polynomial degree.

In this formula an element of shifted degree $h$ contributes the weight $v^(u \( d \) - 2 h)$. It therefore suffices to show that the direct sum of $B_0$ and the spaces $B_d$ of this slope has the graded dimensions of a tensor product of polynomial and exterior algebras, with the generators grouped into strings of fixed dimension $d$ and shifted degrees $h \, h + 1 \, h + 2 \, dots.h$. A string of polynomial generators contributes $H_(p \( d \) \, u \( d \) - 2 h)$; a string of exterior generators contributes $E_(p \( d \) \, u \( d \) - 2 h)$. We will obtain exterior strings when $chi \( d \, d \)$ is odd and polynomial strings when it is even. These are assertions about a vector-space decomposition; they will not require the same-slope shuffle product itself to be commutative.

The next construction supplies this decomposition through a coproduct. Its auxiliary filtration makes separated restrictions regular at coincident centers, while retaining the original shifted degree that appears in the weight $v^(u \( d \) - 2 h)$.

=== 3.4 A filtration and polynomial restriction symbols <a-filtration-and-polynomial-restriction-symbols>

Fix a slope $theta$ for this subsection and the next two. All dimension vectors in a splitting have slope $theta$, unless they are zero. For each $d eq.not 0$ and $w in 1 / 2 bb(Z)$, define a decreasing filtration by

#[#set math.equation(numbering: n => "(3.14)")
 $ f in cal(F)_w B_d quad arrow.l.r.double quad upright("every term of ") R_P^z f upright(" has internal degree ") + sum_(r in P) s \( r \) gt.eq w upright(" for every ") P . $ <alg:filtration>]

Centers have degree zero in this test; the one-block list $\( d \)$ is included. There are finitely many lists $P$ for fixed $d$. Their internal degrees are nonnegative, giving a finite lower bound for the filtration. In original polynomial degree $ell$, the one-block test has internal degree at most $ell$, giving a finite upper bound $ell + s \( d \)$. The filtration is consequently exhaustive and finite in each original degree. Put $"gr"_w B_d = cal(F)_w B_d \/ cal(F)_(w + 1 \/ 2) B_d$ and give $B_0 = bb(Q)$ weight zero.

For $f in "gr"_w B_d$ and $P = \( r_1 \, dots.h \, r_m \)$ define

#[#set math.equation(numbering: n => "(3.15)")
 $ L_P \( f \) = product_(i < j) \( z_j - z_i \)^(chi \( r_i \, r_j \)) \( R_P^z f \)_w \, $ <alg:symbol>]

where the subscript retains internal degree $w - sum_i s \( r_i \)$. A priori this expression has rational center coefficients.

#prodef([Example 3.4.])[
  (The two gradings in one variable).  Let $d_i = 1$ and let all other entries of $d$ be zero. There is no proper splitting of $d$, so $B_d = bb(Q) \[ x \]$ and the only restriction is $R_(\( d \))^z f = f \( x + z \)$. For $f = x^ell$ with $ell gt.eq 0$, the term $z^ell$ has internal degree zero. Hence every $x^ell$ has filtration weight $s \( d \) = \( 1 - a_(i i) \) \/ 2$, whereas its original shifted degree is $ell + s \( d \)$. Its symbol is
  $ L_(\( d \)) \( \[ x^ell \] \) = z^ell . $
  The auxiliary grade therefore retains every polynomial degree, even though they all have the same filtration weight. On these symbols, multiplication by $x$ becomes multiplication by $z$, and differentiation becomes differentiation in $z$. This is the simplest instance of the polynomial strings constructed below.
] <alg:one-variable>

#thm([Lemma 3.5.])[
  (Polynomial symbols and detection).  #emph[Every $L_P \( f \)$ is polynomial in its centers. The maps $L_P$ jointly inject $"gr"_w B_d$ into their polynomial targets. For the additive tensor filtration 
#[#set math.equation(numbering: n => "(3.16)")
 $ cal(F)_w \( B_a ⊗ B_b \) = sum_(u + v gt.eq w) cal(F)_u B_a ⊗ cal(F)_v B_b \, $ <alg:tensor-filtration>]

 tensor products of the restriction tests characterize membership, and tensor products $L_R ⊗ L_S$ jointly detect its associated grades.]
] <alg:detection>

#proof[
  Write $S \( P \) = sum_(r in P) s \( r \)$. Merge two groups $a \, b$ of $P$. The shift sum becomes $S \( P \) + chi \( a \, b \)$. Refine this merged group again, giving the two groups a relative center $delta = z_b - z_a$. This refinement is homogeneous if $delta$ is counted, together with the internal variables, as degree one. By the coarse filtration test, every term before this refinement has degree at least $w - S \( P \) - chi \( a \, b \)$. Therefore a term of fine internal degree $w - S \( P \)$ must have $delta$-degree at least $- chi \( a \, b \)$. When $chi \( a \, b \) < 0$, this proves exactly the divisibility required to cancel the denominator in Equation (3.15). Perform this argument for every pair. To justify simultaneous cancellation, choose a $bb(Q)$-basis of the quotient tensor space and write the polynomial in that basis. Each scalar coefficient is divisible by the requisite power of each diagonal difference. Distinct differences $z_j - z_i$, for unordered pairs ${ i \, j }$, are relatively prime irreducibles, so their product divides that coefficient. No domain property of a quotient algebra is needed.
  Joint injectivity follows directly from Equation (3.14): if all leading restrictions vanish, the representative belongs to $cal(F)_(w + 1 \/ 2)$. Multiplication by the nonzero center prefactors cannot change this conclusion, as can be seen after adjoining the independent centers as a field extension.
  For completeness, a tensor satisfies all lower-bound restriction tests exactly when it belongs to Equation (3.16). One implication follows by applying the defining tests to each factor. For the other, choose filtration complements in each finite-dimensional original-degree space. If a tensor violated the bound, take its lowest nonzero total filtration grade below $w$. Tensoring the two injective families of graded restriction maps over $bb(Q)$ is injective. At a fixed total grade, contributions of different factor grades $u \, v$ cannot cancel: in tests $R \, S$ their two separate internal degrees are $u - S \( R \)$ and $v - S \( S \)$, respectively. Thus some tensor test detects the violating grade. The same argument proves joint detection on every associated tensor grade, including after adjoining center variables or localizing their nonzero differences. ◻
]

#thm([Lemma 3.6.])[
  (Product symbols).  #emph[The same-slope product preserves the sum of filtration weights. For $f in "gr"_u B_d$, $g in "gr"_v B_e$, and $R = \( r_1 \, dots.h \, r_m \)$, its leading symbols satisfy 
#[#set math.equation(numbering: n => "(3.17)")
 $ L_R \( f * g \) = sum_(r_i = d'_i + e'_i\
sum_i d'_i = d \, med sum_i e'_i = e) \( - 1 \)^(sum_(i > j) chi \( d'_i \, e'_j \)) \( *^(⊗ R) \) #scale(x: 120%, y: 120%)[\(] L_(\( d'_i \)) \( f \) ⊗ L_(\( e'_i \)) \( g \) #scale(x: 120%, y: 120%)[\)] . $ <alg:product-symbol-formula>]

 All nonzero entries in this sum have slope $theta$; zero entries in a list of symbols are omitted. The operator $*^(⊗ R)$ places the two factors belonging to each target group next to each other, without a sign, and applies its shuffle product.]
] <alg:product-symbol>

#proof[
  Use Lemma 10 and expand intergroup kernels at separated centers. Every nonconstant internal Taylor term increases internal degree. In target $i$, internal shuffling changes polynomial degree by $- chi \( d'_i \, e'_i \)$, exactly compensated by
  $ s \( r_i \) - s \( d'_i \) - s \( e'_i \) = chi \( d'_i \, e'_i \) . $
  This proves the filtration bound. On its leading grade only the scalar intergroup kernels remain. For $i < j$, their contribution is
  $ \( z_j - z_i \)^(- chi \( d'_i \, e'_j \)) \( z_i - z_j \)^(- chi \( d'_j \, e'_i \)) . $
  Multiplication by the $L_R$ prefactor cancels these exponents against the cross terms in $chi \( r_i \, r_j \)$, leaving the two input prefactors and the sign $\( - 1 \)^(chi \( d'_j \, e'_i \))$. Multiplying these signs over $i < j$ gives Equation (3.17). ◻
]

=== 3.5 The coproduct and its regular specialization <the-coproduct-and-its-regular-specialization>

Let $cal(H) = xor.big_(mu \( d \) = theta) "gr" B_d$, with $cal(H)_0 = bb(Q)$. Its product was just constructed. We next construct an actual coproduct on these vector spaces. This requires removing negative separation powers on the associated grade before setting the separation to zero.

#thm([Lemma 3.7.])[
  (Graded coproduct).  #emph[For $d = a + b$ on the fixed slope there is a map 
$ Delta_(a \, b) : "gr" B_d arrow.r "gr" B_a ⊗ "gr" B_b $

 preserving both original shifted degree and total filtration weight, characterized by 
#[#set math.equation(numbering: n => "(3.18)")
 $ \( L_R ⊗ L_S \) \( Delta_(a \, b) f \) = L_(R \, S) \( f \) $ <alg:coproduct-symbol>]

 for all lists $R \, S$ of $a \, b$, with independent centers and with the lists concatenated on the right. When a dimension is zero its component is the usual identity tensor unit.]
] <alg:coproduct>

#proof[
  Take first $a \, b eq.not 0$ and a representative $f in cal(F)_w B_d$ homogeneous of polynomial degree $ell$. Form the Laurent expansion at $Z = oo$
  #[#set math.equation(numbering: n => "(3.19)")
   $ K_(a \, b) \( x + Z \, y \)^(- 1) f \( x + Z \, y \) = sum_j C_j \( f \) Z^j quad upright("in ") \( B_a ⊗ B_b \) \( \( Z^(- 1) \) \) . $ <alg:separation-expansion>]
  Each coefficient is an actual polynomial tensor before quotienting: expand the finitely many integer powers of linear factors, and note that a specified $Z$-power receives only finitely many binomial choices. The expansion is separately symmetric in the two packs. It descends from $B_d$ because the restriction descends and the target ideals are ordinary ideals. Homogeneity, counting $Z$ as degree one, gives
  #[#set math.equation(numbering: n => "(3.20)")
   $ deg_(upright("pol")) C_j \( f \) = ell + chi \( a \, b \) - j . $ <alg:coefficient-degree>]
  In particular $C_j \( f \) = 0$ for $j > ell + chi \( a \, b \)$.
  Apply arbitrary refinements $R = \( r_i \)$ of $a$ and $S = \( s_j \)$ of $b$ to each coefficient. Their centers in the first list are shifted by $Z$. The internal-degree-zero part of the inverse kernel is
  #[#set math.equation(numbering: n => "(3.21)")
   $ product_(i \, j) \( z_j^S - z_i^R - Z \)^(chi \( r_i \, s_j \)) \, $ <alg:inverse-scalar>]
  and all its other internal terms have positive degree. The restriction of $f$ to the concatenated list has internal shifted degree at least $w$, by its defining filtration tests. Thus the refined tests of every $C_j \( f \)$ have the same lower bound. Tensor detection in Lemma 12 proves $C_j \( f \) in cal(F)_w \( B_a ⊗ B_b \)$, coefficient by coefficient.
  On the weight-$w$ grade only Equation (3.21) contributes. Multiplying by the two separate symbol prefactors supplies exactly the missing cross-list factors, so
  #[#set math.equation(numbering: n => "(3.22)")
   $ \( L_R ⊗ L_S \) (sum_j \[ C_j \( f \) \] Z^j) = L_(R \, S) \( \[ f \] \) \( z^R + Z \, z^S \) . $ <alg:polynomial-Z>]
  By Lemma 12, the right side is a polynomial in all its centers and in $Z$. Consequently every $j < 0$ has zero image under every tensor symbol. The same Lemma implies $\[ C_j \( f \) \] = 0$ for each $j < 0$. This conclusion holds in the actual associated graded tensor space; it is not a conclusion drawn after a specialization of a rational kernel.
  Equation (3.20) leaves only finitely many nonnegative $Z$-powers. We may therefore evaluate this finite tensor polynomial at zero and define
  $ Delta_(a \, b) \[ f \] = \[ C_0 \( f \) \] . $
  Changing $f$ by $cal(F)_(w + 1 \/ 2)$ changes every coefficient by that higher tensor filtration, so the definition is independent of the representative. Setting $Z = 0$ in Equation (3.22) proves Equation (3.18). Finally the original shifted degree of $C_0 \( f \)$ is
  $ ell + chi \( a \, b \) + s \( a \) + s \( b \) = ell + s \( d \) \, $
  as required. ◻
]

Write $epsilon \( a \, b \) = \( - 1 \)^(chi \( a \, b \))$. Symmetry of $chi$ on the slope makes this a symmetric bilinear interchange sign. Give tensor products the multiplication

#[#set math.equation(numbering: n => "(3.23)")
 $ \( x ⊗ y \) \( x' ⊗ y' \) = epsilon \( deg y \, deg x' \) thin \( x * x' \) ⊗ \( y * y' \) \, $ <alg:signed-tensor>]

where degrees in this formula are dimension vectors.

#thm([Proposition 3.8.])[
  #emph[With $Delta = sum_(a + b = d) Delta_(a \, b)$, $cal(H)$ is a connected dimension-graded bialgebra, and its coproduct is cocommutative with the interchange sign $epsilon \( a \, b \)$.]
] <alg:bialgebra>

#proof[
  Testing either iterated coproduct against three independent lists of symbols gives the symbol for their concatenation. Joint tensor detection gives coassociativity. Swapping two lists changes their cross-list prefactor by $\( - 1 \)^(chi \( a \, b \))$; the underlying restriction is simply permuted. Detection therefore gives signed cocommutativity. The empty-list components give the counit and the unit identities.
  For multiplicativity apply Equation (3.17) to the two tensor factors separately. If the first input contributes dimensions $d_R \, d_S$ to the two lists, and the second contributes $e_R \, e_S$, concatenating the lists adds to the two separate symbol signs exactly
  $ sum_(i in S \, med j in R) chi \( d'_i \, e'_j \) = chi \( d_S \, e_R \) . $
  This is the interchange sign in Equation (3.23). Both sides therefore have the symbols of the product restricted to the concatenation, and detection proves multiplicativity. Positive dimension grading and $cal(H)_0 = bb(Q)$ give connectedness. ◻
]

=== 3.6 Primitive vectors and polynomial strings <primitive-vectors-and-polynomial-strings>

The symmetric-algebra form of the graded dimensions is the cohomological-integrality and PBW phenomenon developed in #cite(label("KS11")) #cite(label("Ef12")) #cite(label("DMe20")). Efimov’s freeness theorem assumes a symmetric quiver, whereas our quiver need only have symmetric Euler pairing on the selected slope. Davison–Meinhardt use a perverse associated graded in #cite(label("DMe20")) Theorem C; the separated-center filtration here has its own explicit construction. We include the vector-space argument needed from our bialgebra, because its conclusion does not require commutativity of the product. Let $cal(P) subset cal(H)$ be the primitive subspace, namely the positive-dimensional elements killed by every proper $Delta_(a \, b)$. By Equation (3.18) and tensor detection, these are exactly the elements killed by all proper symbols $L_P$, where a proper list has at least two nonempty entries.

The convolution-logarithm proof below is the signed/braided Eulerian-idempotent argument. For the classical cocommutative characteristic-zero method, see #cite(label("Patras93")) Sections 3–4, Theorem 3.5 and Lemma 4.1; the proof here supplies the bilinear-sign adaptation.

#thm([Lemma 3.9.])[
  (Signed vector-space PBW).  #emph[Symmetrized multiplication gives an isomorphism of graded vector spaces 
#[#set math.equation(numbering: n => "(3.24)")
 $ "Sym"_epsilon \( cal(P) \) arrow.r cal(H) . $ <alg:pbw-map>]

 Here the left side is the signed symmetric vector space: exchanging homogeneous vectors of dimensions $a \, b$ multiplies a tensor by $epsilon \( a \, b \)$. The gradings retained are dimension, original shifted degree, and filtration weight; tensor length is summed over.]
] <alg:pbw>

#proof[
  For linear maps out of $cal(H)$, convolution uses its coproduct and multiplication in the target. Let $e$ be augmentation followed by inclusion of the unit, and put
  $ J = "id" - e \, #h(2em) sans(P) = log^(*) \( "id" \) = sum_(r gt.eq 1) frac(\( - 1 \)^(r - 1), r) J^(* r) . $
  On dimension $d$, a nonzero term has at most $\| d \|_1$ positive dimensions, so this sum and all subsequent convolution series are finite there. In the target algebra $cal(H) ⊗ cal(H)$ define $alpha \( h \) = h ⊗ 1$ and $beta \( h \) = 1 ⊗ h$. Then $alpha * beta = Delta$, while signed cocommutativity gives $beta * alpha = Delta$ as well. Since $Delta$ is multiplicative,
  $ Delta compose sans(P) = log^(*) \( Delta \) = log^(*) \( alpha \) + log^(*) \( beta \) = sans(P) ⊗ 1 + 1 ⊗ sans(P) . $
  Thus $sans(P)$ takes values in $cal(P)$. Exponentiating,
  $ "id" = e + sum_(r gt.eq 1) frac(1, r !) sans(P)^(* r) . $
  The iterated coproduct is invariant under signed permutations, and $sans(P)$ preserves all gradings. This expression therefore spans $cal(H)$ by signed symmetrized products of primitives.
  To prove independence, identify signed symmetric tensors in characteristic zero with the invariant tensors obtained by averaging over signed permutations. In a finite relation among their products, let $r$ be the largest tensor length. Apply the iterated coproduct with $r$ factors and project each factor to positive dimension. Terms of length less than $r$ vanish. A product of $r$ primitives gives the sum of their $r !$ signed permutations; on its symmetrized tensor this is $r !$ times that tensor. Hence the length-$r$ part of the relation is zero. Descending on $r$ proves independence.
  For a homogeneous basis of $cal(P)$, a multiset contributes one signed symmetric tensor unless an element with self-sign $- 1$ repeats, in which case it contributes zero. This proves the stated description of dimensions. In particular, an odd primitive may have a nonzero square in $cal(H)$. Its square is then an even primitive, since the two middle coproduct terms cancel, and is accounted for in the even primitive subspace. No assertion that raw odd squares vanish is used in Equation (3.24). ◻
]

#thm([Lemma 3.10.])[
  (Primitive strings).  #emph[For each nonzero dimension $d$, the primitive space is a direct sum of strings with original shifted degrees 
$ h \, h + 1 \, h + 2 \, dots.h \, #h(2em) h - s \( d \) in bb(N) . $

 Each degree has finite dimension. Every vector in these strings has self-interchange sign $\( - 1 \)^(chi \( d \, d \))$.]
] <alg:strings>

#proof[
  On $S_d$, consider common differentiation and multiplication by the variable mean,
  $ D_d = sum_(i \, alpha) frac(partial, partial x_(i \, alpha)) \, #h(2em) T_d f = (frac(1, \| d \|_1) sum_(i \, alpha) x_(i \, alpha)) f . $
  The translation invariance of the shuffle kernels implies $D_d \( I_d \) subset I_d$. The ideal property implies $T_d \( I_d \) subset I_d$. Thus both operators descend to $B_d$. For $P = \( r_1 \, dots.h \, r_m \)$, restriction gives
  $ R_P^z \( D_d f \) & = (sum_ell partial_(z_ell)) R_P^z f \,\
R_P^z \( T_d f \) & = (frac(sum_ell \| r_ell \|_1 z_ell, \| d \|_1) + frac(sum_(ell \, i \, alpha) x_(i \, alpha)^ell, \| d \|_1)) R_P^z f . $
  Both preserve the filtration lower bound. On the associated grade, the internal-variable term in the second line raises internal degree and disappears. The prefactor of $L_P$ depends only on center differences, so its common center derivative vanishes. Consequently
  $ L_P \( D_d f \) & = (sum_ell partial_(z_ell)) L_P \( f \) \,\
L_P \( T_d f \) & = frac(sum_ell \| r_ell \|_1 z_ell, \| d \|_1) L_P \( f \) . $
  They preserve the common kernel of all proper symbols, hence the primitive space. They satisfy $D_d T_d - T_d D_d = "id"$ there; $D_d$ is locally nilpotent, and $T_d$ raises original shifted degree by one.
  Here is an explicit string decomposition. On a space with these operators define the finite-on-each-vector operator
  $ pi \( f \) = sum_(j gt.eq 0) frac(\( - 1 \)^j, j !) T_d^j D_d^j f . $
  The commutator identity gives $D_d pi = 0$. Binomial cancellation gives
  $ f = sum_(j gt.eq 0) frac(T_d^j, j !) pi \( D_d^j f \) . $
  Choose a homogeneous basis of $ker D_d$ in the primitive space. Its $T_d$-iterates therefore span. They are independent: in a finite relation $sum_(j = 0)^r T_d^j b_j = 0$ with $D_d b_j = 0$, applying $D_d^r$ gives $r ! b_r = 0$, and induction removes the other terms.
  Every component of $cal(H)_d$ is a subquotient of $B_d$, with original shifted degree equal to nonnegative polynomial degree plus $s \( d \)$. Thus every string begins at $h gt.eq s \( d \)$ with the indicated integral difference. The polynomial spaces in any fixed degree are finite-dimensional, and the filtration is finite there, proving the finiteness assertion. Finally the self-sign depends only on the dimension vector, as stated. ◻
]

Combining Lemmas 16 and 17, the shifted Hilbert series on a slope is the Hilbert series of independent polynomial strings when $chi \( d \, d \)$ is even and exterior strings when it is odd. Passing to the auxiliary associated grade has not changed any original shifted graded dimension.

=== 3.7 Elementary factors and the infinite-list bounds <elementary-factors-and-the-infinite-list-bounds>

We now finish the finite-input case of Theorem 8 using the slope factor (3.13). Lemmas 16 and 17 give exactly the polynomial and exterior strings required above. In shifted degree $h$, their weight is $v^(u \( d \) - 2 h)$.

A primitive string beginning at $h$ contributes one elementary unit with

#[#set math.equation(numbering: n => "(3.25)")
 $ p = p \( d \) \, #h(2em) k = u \( d \) - 2 h \, $ <alg:output-parameter>]

of type $E$ if $chi \( d \, d \)$ is odd and type $H$ if it is even. These are integer parameters because $2 h$ is an integer. The primitive-basis dimensions give nonnegative integral multiplicities. Finiteness of each original graded piece proves that, for a fixed finite list and bounded dimension, only finitely many output parameters lie above any threshold. This proves the finite-input case.

Now allow an admissible infinite input list. Give each occurrence its own index and use finite-support dimension vectors $d$. All polynomial spaces, ideals, restrictions, filtrations, and primitive spaces for a fixed $d$ use only the finitely many indices in its support. Adding other indices changes none of them. The preceding constructions are consequently compatible as the finite input list increases.

We give uniform bounds to justify this passage. Fix an integer charge cutoff $B gt.eq 1$. Every active $p_i$ belongs to the finite set $C_B = { p in C : 0 < c \( p \) lt.eq B }$, and $D = \| d \|_1 lt.eq B$ whenever $c \( p \( d \) \) lt.eq B$. Choose $K gt.eq 0$ bounding all their input parameters above, and choose $A gt.eq 1$ bounding $1$ and $\| Omega \( p \, q \) \|$ for $p \, q in C_B$. Then

$ chi \( d \, d \) gt.eq - A D^2 \, #h(2em) u \( d \) lt.eq sum_i d_i k_i + D . $

Since $h gt.eq s \( d \)$, Equation (3.25) gives

#[#set math.equation(numbering: n => "(3.26)")
 $ k lt.eq u \( d \) - chi \( d \, d \) lt.eq sum_i d_i k_i + B + A B^2 lt.eq B K + B + A B^2 . $ <alg:parameter-bound>]

If an output parameter satisfies $k gt.eq L$, every active occurrence has

#[#set math.equation(numbering: n => "(3.27)")
 $ k_i gt.eq L - \( B - 1 \) K - B - A B^2 . $ <alg:active-input-bound>]

To see this, single out one of its $d_i$ copies in the preceding sum and bound the other at most $B - 1$ copies by $K$. Admissibility leaves only finitely many possible input occurrences in Equation (3.27), hence only finitely many possible $d$. For each one, $k gt.eq L$ also bounds $h lt.eq \( u \( d \) - L \) \/ 2$, so only finitely many primitive starts can occur. This proves both parts of admissibility for the output list.

Finally, consider a coefficient at exponent of charge at most $B$ and fixed energy $v^e$ in any of the unit products under discussion. Expand its selected units into the index lists used above. There are at most $B$ selected monomial copies. Let $K' gt.eq 0$ bound the parameters of that list at this charge, and let $A'$ bound absolute pairings of its possible exponents. A term has energy

#[#set math.equation(numbering: n => "(3.28)")
 $ e = sum_(nu = 1)^D k_nu - 2 sum_(nu = 1)^D j_nu + Q \, #h(2em) D lt.eq B \, quad j_nu gt.eq 0 \, quad \| Q \| lt.eq A' B^2 . $ <alg:energy-bound>]

It follows that

$ e lt.eq B K' + A' B^2 \, #h(2em) k_nu gt.eq e - \( B - 1 \) K' - A' B^2 \, #h(2em) sum_nu j_nu lt.eq frac(B K' + A' B^2 - e, 2) . $

Only finitely many unit occurrences meet the lower parameter bound, and only finitely many nonnegative index lists meet the last bound. Thus the coefficient is a finite nonnegative integer and its upper energy is bounded. These bounds justify all coefficientwise limits of the finite-list identities, proving the infinite case.

For effectiveness, compute $K$ as the maximum of zero and the parameters in the finite input list at charge at most $B$ and threshold zero, and take $A = A_B$ from the supplied pairing bound. A charge and output-parameter cutoff now give the finite set of relevant input occurrences by Equation (3.27). For each resulting $d$, the bound on $h$ gives finitely many polynomial degrees. In those degrees the shuffle images, quotient ideals, restriction maps, filtrations, coproduct, primitive kernels, and $D_d$-kernels are matrices over $bb(Q)$ on finite polynomial spaces. Their ranks give the required unit multiplicities. Equation (3.28) then computes any desired product coefficient from a finite list.

The effective bound is available in the wall applications below. There the roots lie in an explicit finite free cone with basis $r_1 \, dots.h \, r_s$ and coordinate-sum charge. If $c \( p \) \, c \( q \) lt.eq B$, then

$ \| Omega \( p \, q \) \| lt.eq B^2 max_(i \, j) \| Omega \( r_i \, r_j \) \| . $

Taking the maximum of this integer and one supplies $A_B$, also for the monoids in the two-dimensional joint planes. Thus those applications satisfy the additional effective hypothesis. This completes the proof of Theorem 8.

== 4 Positive wall transport and change of chart <wall:section>

The reordering theorem gives positive local changes of coordinates. We now assemble them into a consistent system, define its incoming coordinates, and prove the two properties needed later: positivity of sections and compatibility with a change of simple roots. All wall arrangements in the argument are finite after a specified truncation.

This is a scattering-diagram construction in the framework originating with Kontsevich–Soibelman and Gross–Siebert #cite(label("KS06")) #cite(label("GS11")). Its description by a total transport element is the wall-crossing construction of #cite(label("KS14")) Theorem 2.1.6 and Proposition 2.1.12, expressed here in completed quantum-torus coordinates; the locators refer to the version recorded in the bibliography. Quantum wall and theta positivity are developed in #cite(label("DM21")). We retain direct proofs to specify exactly the support bounds and coefficient algorithms used by the permutation map.

=== 4.1 The completion and the incoming prescription <the-completion-and-the-incoming-prescription>

Let $M$ be a lattice with an integral alternating form $Omega$, and put $K = bb(Q) \( \( v^(- 1) \) \)$. We use the centered quantum torus convention

#[#set math.equation(numbering: n => "(4.1)")
 $ X_a X_b = v^(Omega \( a \, b \)) X_(a + b) \, #h(2em) V \( a \) = Omega \( thin dot.op thin \, a \) in M_(bb(R))^or . $ <wall:torus>]

We may assume that $Omega$ is nondegenerate: replace $M$ by $M xor M^or$ and extend the form by $Omega \( \( a \, f \) \, \( b \, g \) \) = Omega \( a \, b \) + f \( b \) - g \( a \)$. The original monomials form a subalgebra, so this enlargement changes none of their computations.

A #emph[chart] is a finite set $C subset M$ contained in a lattice basis. Write

$ C^(+) = sum_(c in C) bb(N) c \, #h(2em) \| sum_c u_c c \|_C = sum_c u_c \, #h(2em) a lt.eq_C b med arrow.l.r.double med b - a in C^(+) . $

Every interval ${ a : m lt.eq_C a lt.eq_C n }$ is finite. The completed positive group is

$ G_C = 1 + product_(r in C^(+) \\ { 0 }) K X_r . $

Multiplication, inversion, logarithms, and exponentials are defined by root degree. A coefficient of any such operation is a finite sum over decompositions of its exponent. A section value will belong to the corresponding completed torus module supported in a finite union of translates of $C^(+)$. These support conditions are maintained throughout.

For a covector $h$, let $G_(C \, +) \( h \)$, $G_(C \, 0) \( h \)$, and $G_(C \, -) \( h \)$ denote the subgroups supported on roots with, respectively, positive, zero, and negative $h$-value. Every $g in G_C$ has a unique factorization

#[#set math.equation(numbering: n => "(4.2)")
 $ g = g_(+) \( h \) g_0 \( h \) g_(-) \( h \) . $ <wall:three-factors>]

Indeed, suppose all coefficients below degree $d$ have been found. For a root $r$ of degree $d$, its coefficient in the product is the as-yet unknown coefficient in exactly one of the three factors, plus known products of smaller roots. Subtraction determines that coefficient. This also proves the following refinement rule: near $h$, the factors are obtained by factoring $g_0 \( h \)$ according to the perturbation of $h$, while keeping the already strict signs fixed. Both assertions may equally be made modulo roots outside a finite addition-order ideal.

The factors define walls. At a generic point of $r^perp$, the middle factor is supported on the positive ray through $r$; it may be the identity on some portions of that hyperplane. Crossing from positive to negative on that ray applies $"Ad" \( g_0 \) : F mapsto g_0 F g_0^(- 1)$, and crossing in reverse applies its inverse. Products of crossing elements have the earlier element on the right. The transformation from an all-positive chamber to $h$ is $"Ad" \( g_(-) \( h \) \)$. Indeed, for a positive-to-negative crossing from $I$ to $I I$, the refinement rule gives

$ g_(-) \( I I \) = g_0 g_(-) \( I \) \, #h(2em) "Ad" \( g_(-) \( I I \) \) = "Ad" \( g_0 \) compose "Ad" \( g_(-) \( I \) \) . $

Thus each crossing agrees with the transformation determined by its endpoint, proving path independence and the stated order of composition. At degree at most $d$, there are finitely many roots, hyperplanes, and cells, so generic polygonal paths and their crossings have their usual literal meaning at that order. We use no assertion of local finiteness for the untruncated arrangement.

Conversely, a consistent assignment of such wall elements, constant on the cells of finite arrangements at each order, comes from (4.2). Take $g$ to be the ordered product from an all-positive to an all-negative chamber. Near a given generic crossing point, a perturbed straight path to that point crosses only roots negative there; a path completing the journey crosses only roots positive there. The resulting factorization of $g$ has the prescribed crossing element as its middle factor, by uniqueness.

Each simple root carries the specific unit

#[#set math.equation(numbering: n => "(4.3)")
 $ D_p = product_(j gt.eq 0) \( 1 + v^(- 1 - 2 j) X_p \) \, #h(2em) p in C . $ <wall:initial-unit>]

Define the wall system by requiring

#[#set math.equation(numbering: n => "(4.4)")
 $ \[ X_r \] log g_0 \( V \( r \) \) = cases(delim: "{", \[ X_r \] log D_p \, & r = j p \, quad p in C \, med j gt.eq 1 \,, 0 \, & upright("otherwise") .) $ <wall:incoming-prescription>]

These equations determine $g$ uniquely. To see this directly, write $log g = sum_r ell_r X_r$ and solve by $\| r \|_C$. In factoring at $V \( r \)$, the linear term $ell_r X_r$ belongs to the middle factor, since $V \( r \) \( r \) = 0$. All other contributions to its coefficient use strictly smaller roots. Thus the equation for $r$ has coefficient one on $ell_r$ and determines it from previous equations. In particular, every bounded-order part of the system is computable.

Here and below, “incoming” refers to the end of a wall in the direction $V \( r \)$. We verify that this geometric meaning agrees with (4.4), even when $V \( r \)$ lies on several hyperplanes. On the algebra supported in $ker V \( r \)$, the functional $tau_r \( B \) = \[ X_r \] B$ is a trace: a term with exponents $a + b = r$ has $Omega \( a \, b \) = Omega \( a \, r \) = 0$. Consequently

#[#set math.equation(numbering: n => "(4.5)")
 $ tau_r log \( B_1 B_2 \) = tau_r log B_1 + tau_r log B_2 $ <wall:trace>]

for elements with constant term one in that algebra. For completeness, replace each $X_a$ by $z^(\| a \|_C) X_a$ and differentiate. Cyclic permutation in the trace gives $tau_r \( \( log B \)' \) = tau_r \( B' B^(- 1) \)$; the product rule proves equality of the derivatives in (4.5), and the constant terms are zero. This is a formal calculation at each root degree. Factor $g_0 \( V \( r \) \)$ using a small generic displacement within $r^perp$. Of those factors, only the middle one can contain $X_r$. Equation (4.5) therefore identifies its logarithmic $r$-coefficient with the prescribed one. Applying the argument to each positive multiple of the primitive ray shows that the incoming wall element is exactly $D_p$ on a simple ray and the identity on every other ray.

=== 4.2 Positive wall factors and incoming coordinates <positive-wall-factors-and-incoming-coordinates>

Recall the two elementary unit types from Theorem 8:

$ U_(a \, k \, f) = product_(j gt.eq 0) f \( v^(k - 2 j) X_a \) \, #h(2em) f \( T \) = 1 + T quad upright("or") quad f \( T \) = \( 1 - T \)^(- 1) . $

An allowed list has its parameters $k$ bounded above at bounded root degree, and has only finitely many occurrences above any fixed lower threshold on $k$. Occurrences, including repeated units, are counted separately.

#thm([Lemma 4.1.])[
  (The unit normalization and positive crossing).  #emph[For $j gt.eq 0$, 
#[#set math.equation(numbering: n => "(4.6)")
 $ \[ X_(j p) \] D_p = frac(v^(- j^2), product_(i = 1)^j \( 1 - v^(- 2 i) \)) . $ <wall:unit-coefficient>]

 Let $t = Omega \( a \, m \)$. Then 
#[#set math.equation(numbering: n => "(4.7)")
 $ "Ad" \( U_(a \, k \, f) \) X_m = X_m frac(U_(a \, k \, f) \( v^(2 t) X_a \), U_(a \, k \, f) \( X_a \)) . $ <wall:unit-ratio>]

 For $t > 0$ the ratio is $product_(ell = 1)^t f \( v^(k + 2 ell) X_a \)$. For $t < 0$ the inverse adjoint has ratio $product_(ell = t + 1)^0 f \( v^(k + 2 ell) X_a \)$. Thus $"Ad" \( U_(a \, k \, f) \)^epsilon X_m$ has nonnegative integral Laurent-series coefficients whenever $epsilon t gt.eq 0$. Its constant, or no-jump, coefficient is one.]
] <wall:unit>

#proof[
  Choosing $j$ distinct indices $0 lt.eq i_1 < dots.h.c < i_j$ in (4.3) gives weight $v^(- j - 2 sum i_s)$. Subtracting $0 \, 1 \, dots.h \, j - 1$ from these indices leaves a weakly increasing nonnegative list. Its successive differences have weights $v^(- 2) \, dots.h \, v^(- 2 j)$, which proves (4.6). The commutation relation $X_a X_m = v^(2 t) X_m X_a$ proves (4.7). Cancellation of the two infinite strings leaves the displayed finite strings. Each factor $1 + v^b X_a$, or $\( 1 - v^b X_a \)^(- 1)$, has nonnegative coefficients. Replacing $X_m X_(j a)$ by its centered monomial changes only the power of $v$. The case $t = 0$ is the identity. ◻
]

For later use, the finite formula for the normalized simple unit is particularly convenient. If $t = Omega \( p \, m \) eq.not 0$ and $a = \| t \|$, then

#[#set math.equation(numbering: n => "(4.8)")
 $ "Ad" \( D_p \)^("sign" \( t \)) X_m = sum_(j = 0)^a e_j \( v^(1 - a) \, v^(3 - a) \, dots.h \, v^(a - 1) \) X_(m + j p) . $ <wall:binomial>]

Here $e_j$ is the ordinary elementary polynomial in the displayed $a$ scalar letters. In particular, when $t = 1$ the result is $X_m + X_(m + p)$, with no additional scalar.

#thm([Proposition 4.2.])[
  (Positive factors on every wall).  #emph[At every generic point of a wall, and to every specified root order, its element is a product of elementary units on its ray with the finiteness conditions above. The same conclusion holds if the simple incoming data are replaced by allowed products of elementary units. If a crossing has the sign of $- V \( m \)$ on its wall normal, the resulting monomial jump from $X_m$ has coefficients in $bb(N) \( \( v^(- 1) \) \)$.]
] <wall:factors>

#proof[
  Fix a root-degree bound $d$, and argue inductively in $d$. For a given ray $bb(R)_(> 0) r$, follow a generic line in $r^perp$, parallel to $V \( r \)$, from far in the positive direction towards the specified cell. The initial element is the incoming element just proved. At the finitely many joints met by the line, all relevant normals lie in a two-dimensional plane containing $r$. A normal $s$ with $Omega \( s \, r \) = 0$ gives a hyperplane parallel to the line, which a generic offset avoids. Thus a joint at which a change occurs has nonzero skew form on its plane. The offset can also avoid every intersection involving three independent normals.
  Order the positive rays in this plane so that the skew pairing of an earlier ray with a later ray is positive. At the incoming end $V \( a \)$ of a ray $a$, earlier normals evaluate positively and later ones negatively. The local middle element is therefore the ordered product of its incoming ray elements in this order. Its factorization in the reverse order gives its outgoing ray elements. Theorem 8 applies to precisely this positive ordering and to the pointed monoid obtained by intersecting the plane with $C^(+)$.
  There is a small induction issue at degree $d$. The incoming element on the ray being followed is already known through degree $d$ from the previous segment. On all other incoming rays it is enough to know positive factorizations through degree $d - 1$. Indeed, a degree-$d$ input term can affect an output term of degree $d$ only linearly: multiplication with any nonconstant term raises the degree. Its linear contribution remains on its own ray. Unknown degree-$d$ terms on other rays consequently do not affect the ray under consideration. Extend their known positive lists arbitrarily to the required truncation, apply Theorem 8, and use uniqueness of ray factorization. This proves the assertion at each successive joint and completes the induction.
  For the last assertion, a positive-to-negative crossing has $Omega \( r \, m \) > 0$ and uses the adjoint of the wall element; a negative-to-positive crossing has $Omega \( r \, m \) < 0$ and uses its inverse. All elementary arguments are positive multiples of $r$, so Lemma 18 applies to every factor.
  We spell out why infinite lists still give finite integer coefficients at a specified energy. At a fixed root bound there are finitely many possible arguments, the total multiplicity of selected nonconstant factors is bounded, and all skew-pairing shifts between these factors are bounded. Their parameters have a common upper bound $K_0$. If a contribution has energy $E$, no selected parameter can tend to $- oo$: the bounded number of other parameters and the bounded interaction shifts could not compensate for it. Every selected parameter is therefore above an explicit lower threshold depending on the root bound and $E$. Only finitely many occurrences lie above that threshold. Their nonnegative string indices are then bounded as well. This proves both finite multiplicity at each energy and a common upper energy bound. The corresponding output-list bounds are supplied by Theorem 8. Thus all the asserted coefficients belong to $bb(N) \( \( v^(- 1) \) \)$, rather than merely being formal infinite sums of nonnegative integers. ◻
]

A #emph[section] is a family of values transported by these consistent wall operations. Any value with the stipulated support in one generic chamber determines a section. Its #emph[incoming coefficient] is

#[#set math.equation(numbering: n => "(4.9)")
 $ A_n \( F \) = \[ X_n \] F \( V \( n \) + epsilon.alt \) \, $ <wall:incoming-coordinate>]

where a sufficiently small generic perturbation is chosen at the finite order needed for that coefficient. This does not depend on the perturbation. A wall that can separate two such choices has normal $r$ with $Omega \( r \, n \) = 0$, and its action cannot alter the $X_n$-coefficient: a possible contributing input $n - j r$ also has zero pairing with $r$, so that monomial is fixed.

In any fixed chamber $H$, transport adds only positive roots. Consequently $A_n \( F \)$ equals $\[ X_n \] F \( H \)$ plus a linear combination of coefficients at strictly smaller exponents. On every finite interval this is a triangular change of coordinates with diagonal one. It defines a unique section $Theta_m$, supported in $m + C^(+)$, such that

#[#set math.equation(numbering: n => "(4.10)")
 $ A_n \( Theta_m \) = cases(delim: "{", 1 \, & n = m \,, 0 \, & n eq.not m .) $ <wall:theta-definition>]

Its leading monomial is $X_m$ in every chamber. This incoming-coordinate description plays the role of the theta functions in the scattering framework of #cite(label("GHKK18")) #cite(label("DM21")). The definition and positivity argument below use only the explicit coefficient recursion in our convention. More generally, within any fixed finite union of translates of $C^(+)$,

#[#set math.equation(numbering: n => "(4.11)")
 $ F = sum_n A_n \( F \) Theta_n . $ <wall:theta-expansion>]

For a requested exponent this is a finite sum, by the interval property of the free cone.

#thm([Lemma 4.3.])[
  (The positive coefficient recursion).  #emph[Fix a generic target chamber $H$, represented by $h$, and a target exponent $n$. At sufficient finite root order, follow $h + s V \( n \)$ from sufficiently large $s$ down to $s = 0$. Let its successive crossings be $W_i : I_i arrow.r I_(i + 1)$, with primitive positive wall normal $p_i$. Define 
$ J_i \( a \, j \) = \[ X_(a + j p_i) \] W_i \( X_a \) \, #h(2em) j gt.eq 0 . $

 Then $J_i \( a \, 0 \) = 1$, and for the exponents $a = n - j p_i$ that can contribute one has $J_i \( a \, j \) in bb(N) \( \( v^(- 1) \) \)$. Moreover, 
#[#set math.equation(numbering: n => "(4.12)")
 $ \[ X_n \] F \( H \) = A_n \( F \) + sum_i med sum_(j > 0\
n - j p_i med upright("in the support bound")) J_i \( n - j p_i \, j \) \[ X_(n - j p_i) \] F \( I_i \) . $ <wall:coefficient-recursion>]

 All sums are finite at a fixed exponent. With the simple data (4.3), the jump coefficients are effectively computable at every fixed energy by finite rational arithmetic and Laurent expansion in $v^(- 1)$. The same holds for the section coefficients when its initial value is a specified finite Laurent polynomial, or when its incoming data are finitely specified rational functions of $v$.]
] <wall:recursion>

#proof[
  After rescaling by $s$, the initial point tends to $V \( n \)$, so its $X_n$-coefficient is $A_n \( F \)$. Hyperplanes whose normals pair trivially with $n$ are parallel to this line and are avoided by choosing $h$ generically. Every actual crossing has the sign of $- V \( n \)$; the input $n - j p_i$ has the same pairing with the wall as $n$. Proposition 19 proves the stated positivity and the no-jump assertion. Taking the $X_n$-coefficient in each crossing identity and summing the successive differences proves (4.12). The exponents in each inner sum lie in a finite cone interval. The arrangement contains only the roots needed for those intervals, so the outer sum is finite as well.
  For effectivity, (4.6) gives rational functions of $v$ for the input coefficients. The triangular equations (4.4) and (4.2), followed by inversion and multiplication at bounded root order, therefore give rational functions of $v$ for every required wall coefficient. Their Laurent expansions at $v^(- 1) = 0$ compute the requested jump coefficients and their upper energy bounds. No positive factorization needs to be found by the algorithm. A finite polynomial initial value can be transported by these same finite rational operations; finitely specified incoming data can instead be used in (4.12). Recursing on its strictly smaller exponents terminates, since the cone intervals are finite. At fixed total energy, upper bounds on the finitely many factor energies also give lower bounds on each of them. Hence the required integer coefficient is obtained by a finite computation. ◻
]

#thm([Theorem 4.4.])[
  (Positive sections).  #emph[Every $Theta_m$ has coefficients in $bb(N) \( \( v^(- 1) \) \)$ in every chamber. More generally, the same is true of a section $F$ all of whose incoming coefficients belong to $bb(N) \( \( v^(- 1) \) \)$.]
] <wall:positivity>

#proof[
  Fix a target exponent and its finite interval above the support lower bounds. Induct on the addition order in this interval, using (4.12). Its initial term is nonnegative by hypothesis, and every other term is a nonnegative jump coefficient times a coefficient at a strictly smaller exponent. The induction proves positivity. The energy bounds in Proposition 19 and Lemma 20 justify each multiplication and sum in the Laurent completion. Equation (4.10) gives the special case. ◻
]

#thm([Corollary 4.5.])[
  (Positive products).  #emph[The structure coefficients in 
$ Theta_(m_1) dots.h.c Theta_(m_b) = sum_n A_n \( Theta_(m_1) dots.h.c Theta_(m_b) \) Theta_n $

 belong to $bb(N) \( \( v^(- 1) \) \)$. Products and expansions are locally finite at every specified exponent.]
] <wall:product>

#proof[
  Evaluate the product near $V \( n \)$ to compute its incoming $n$-coefficient. Each factor is positive by Theorem 21; the scalar contributed by torus multiplication is a power of $v$. For fixed total exponent there are only finitely many tuples of factor exponents above their specified lower bounds. Their Laurent products have finite coefficients at each energy. Thus the incoming coefficient is nonnegative, and (4.11) proves the assertion. ◻
]

=== 4.3 A finite bound in the mutation direction <a-finite-bound-in-the-mutation-direction>

Mutation compatibility is a basic feature of classical cluster theta functions #cite(label("GHKK18")) Theorem 1.24 and Proposition 3.6 and their quantum counterparts #cite(label("DM21")) Appendix A. We next compare two different cone completions, keeping the finite-fiber argument needed for equality of actual coefficients. From this point the simple incoming data are exactly (4.3). Fix $p in C$ and put

#[#set math.equation(numbering: n => "(4.13)")
 $ alpha_c = Omega \( p \, c \) \, #h(2em) c' = c + \[ - alpha_c \]_(+) p quad \( c eq.not p \) \, #h(2em) C' = { - p } union { c' : c in C \\ { p } } \, $ <wall:mutated-roots>]

where $\[ x \]_(+) = max \( x \, 0 \)$. The set $C'$ is again part of a lattice basis. Define

#[#set math.equation(numbering: n => "(4.14)")
 $ S \( m \) = m - Omega \( p \, m \) p \, #h(2em) S^or h = h compose S^(- 1) . $ <wall:linear-mutation>]

The map $S$ preserves $Omega$ and hence acts on the quantum torus by $X_m mapsto X_(S \( m \))$. On covectors, the change of chart is

#[#set math.equation(numbering: n => "(4.15)")
 $ T \( h \) = cases(delim: "{", h \, & h \( p \) gt.eq 0 \,, S^or h \, & h \( p \) lt.eq 0 .) $ <wall:piecewise-mutation>]

The two definitions coincide on $p^perp$.

For a non-pure root, write

$ r = k p + u \, #h(2em) u = sum_(c eq.not p) u_c c eq.not 0 \, #h(2em) k \, u_c in bb(N) . $

Its #emph[non-$p$ degree] is $\| u \| = sum_(c eq.not p) u_c$. For $sigma in { + 1 \, - 1 }$ set

#[#set math.equation(numbering: n => "(4.16)")
 $ M_sigma \( u \) = sum_(c eq.not p) \[ - sigma alpha_c \]_(+) u_c . $ <wall:fiber-bound-function>]

#thm([Lemma 4.6.])[
  (Finite support in each $p$-fiber).  #emph[On the open side $"sign" h \( p \) = sigma$, a non-pure root $k p + u$ occurring in a wall element or its logarithm satisfies 
#[#set math.equation(numbering: n => "(4.17)")
 $ 0 lt.eq k lt.eq M_sigma \( u \) . $ <wall:fiber-bound-equation>]

 The pure $p$-wall has element $D_p$ everywhere on the cut where no other wall direction is present.]
] <wall:fiber-bound>

#proof[
  Projection to the face $bb(N) p$ is an algebra homomorphism: a sum of roots with a nonzero non-$p$ component cannot be pure. At any point of $p^perp$, the pure part of the middle factor is thus the pure part of $g$, which is $D_p$ by (4.4). This proves the last assertion.
  We prove (4.17) by induction on $\| u \|$, not on $k + \| u \|$. During this induction, an assertion about an individual coefficient at $k p + u$ is always checked first in a finite full-degree truncation containing that coefficient. No uniform finiteness in $k$ is presumed.
  Put $t = Omega \( p \, u \) = sum_c alpha_c u_c$. If $t eq.not 0$, call the side $sigma = "sign" \( t \)$ upstream. A line in $\( k p + u \)^perp$, followed from the incoming direction $V \( k p + u \)$ to a point on that side, never crosses $p^perp$: the evaluation on $p$ along its forward tail is $h \( p \) + s t$ with $s gt.eq 0$. If $t = 0$, the line is parallel to the cut and the same argument applies on either side. At its incoming end the bound holds, since the only nontrivial incoming rays are simple ones, with $k = 0$.
  Consider a joint off the cut along this line. Every normal involved has positive non-$p$ degree. In an ordered refactorization, a genuinely new contribution of non-$p$ degree $\| u \|$ is a product of at least two such terms and therefore uses only smaller non-$p$ degrees. A term already of degree $\| u \|$ contributes linearly on its own ray, so it is merely carried to the next segment. By induction every smaller term satisfies (4.17). The bound is additive in $u$: sums of supported exponents are still supported in
  $ { k p + u : 0 lt.eq k lt.eq M_sigma \( u \) } . $
  It follows, by the coefficient recursion for ray factorization, that the bound persists at this joint. This proves the upstream assertion for each $k$ separately, through finitely many joints at the order needed for that $k$. Only now do we conclude that the entire upstream fiber has finite support, since the numerical upper bound $M_sigma \( u \)$ is independent of the truncation.
  Suppose $t eq.not 0$ and continue to the other side. At a generic transverse joint on $p^perp ∩ u^perp$, the normals lie in the plane spanned by $p$ and $u$. Their non-pure projections are positive multiples of the same ray through $u$. Their pairings with $p$ are consequently nonzero and have the common sign $sigma$. Such genericity is imposed only through the finite non-$p$ degrees currently needed; the upstream bounds just proved make the corresponding full-degree arrangement finite.
  Separate the pure factor $D_p$ from the incoming ordered product of non-pure factors. If $sigma = + 1$, $p$ is first in the incoming order, and refactorization conjugates the non-pure product by $D_p$. If $sigma = - 1$, $p$ is last, and it conjugates that product by $D_p^(- 1)$. Formula (4.8) shows that an input monomial $X_(k p + w)$ acquires only additional exponents $j p$ with
  $ 0 lt.eq j lt.eq \| Omega \( p \, w \) \| . $
  All relevant $w$ have the same pairing sign. On this ray,
  $ M_(- sigma) \( w \) = M_sigma \( w \) + \| Omega \( p \, w \) \| . $
  Thus the whole conjugated non-pure product has the downstream bound. So do its ray factors: coefficientwise factorization cannot introduce an exponent outside an additive support monoid containing the product’s support. Explicitly, for the first putative such exponent the defining coefficient is zero in the product, and every term subtracted from it is a sum of already permitted exponents, a contradiction.
  At the current degree, the coefficients needed at the cut are either of smaller non-$p$ degree, or already established upstream coefficients of the current degree. This avoids a circular appeal to downstream finiteness. Further joints off the cut are treated by the same smaller-degree argument as before. Finally, the support monoid is additive, so its bound is preserved by both logarithm and exponential. The statement holds for wall elements and their logarithms. ◻
]

The numerical bound also controls the change of completion. Let $L_(+) = "id"$ and $L_(-) = S$. A direct calculation gives

#[#set math.equation(numbering: n => "(4.18)")
 $ L_sigma \( k p + u \) = sum_(c eq.not p) u_c c' + \( M_sigma \( u \) - k \) \( - p \) . $ <wall:root-image>]

Thus every supported root off the cut maps into $C' ""^(+)$. Put $B = max_(c eq.not p) \| alpha_c \|$, with $B = 0$ if the index set is empty. Since $M_sigma \( u \) lt.eq B \| u \|$, a root of new degree at most $d$ comes from one with $\| u \| lt.eq d$ and old degree at most $\( B + 1 \) d$. In particular, the pushed wall elements and their cells at bounded new order are determined by finite old data.

=== 4.4 Mutation and equality of actual coefficients <mutation-and-equality-of-actual-coefficients>

#thm([Theorem 4.7.])[
  (Change of chart).  #emph[The wall system for $C$, with simple data $D_c$, is carried to the wall system for $C'$, with simple data $D_(c')$, as follows. Off the cut $p^perp$, use the covector map $T$ from (4.15) and act on exponents by $L_sigma$ on the side of sign $sigma$. On the cut, replace the pure wall by $D_(- p)$.]
  #emph[Suppose $F$ and $F'$ are sections specified by finite Laurent polynomials in the respective all-negative chambers, and these initial polynomials satisfy the rational identity 
#[#set math.equation(numbering: n => "(4.19)")
 $ F = "Ad" \( D_p \) F' . $ <wall:initial-comparison>]

 For $h \( p \) > 0$ their transported values agree coefficientwise under the identity; for $h \( p \) < 0$ they agree coefficientwise under $S$. In particular, 
#[#set math.equation(numbering: n => "(4.20)")
 $ A_n \( F \) = A_(mu_p \( n \)) \( F' \) \, #h(2em) mu_p \( n \) = n + \[ - Omega \( p \, n \) \]_(+) p . $ <wall:incoming-mutation>]

 The map $mu_p : M arrow.r M$ is a bijection.]
] <wall:mutation>

#proof[
  First we establish the identity of transformations at the cut, with the normalization of Lemma 18:
  #[#set math.equation(numbering: n => "(4.21)")
   $ S compose "Ad" \( D_p \) = "Ad" \( D_(- p) \)^(- 1) . $ <wall:cut-identity>]
  For $t = Omega \( p \, m \) gt.eq 0$, the coefficient of $X_(m + j p)$ in $"Ad" \( D_p \) X_m$ is
  $ b_(t \, j) = e_j \( v^(1 - t) \, v^(3 - t) \, dots.h \, v^(t - 1) \) . $
  The displayed letters are invariant under inversion and have product one, so $b_(t \, j) = b_(t \, t - j)$. Applying $S$ sends the exponent $m + j p$ to $m - \( t - j \) p$. On the other hand, the finite formula for $"Ad" \( D_(- p) \)^(- 1) X_m$ has coefficients $b_(t \, j)$ at $m - j p$. This proves (4.21) on $X_m$. When $t < 0$, apply the proved identity to $X_(- m)$ and take its inverse. Both sides are algebra homomorphisms, so the identity follows on all rational monomial expressions.
  #emph[A common ring for the comparison.] Set $Z = X_p$, choose a lattice complement $M = bb(Z) p xor L$ containing $C \\ { p }$, and allow coefficients in $K \( Z \)$ on the monomials $X_ell$, $ell in L$. Complete in the free positive monoid generated by the images of $C \\ { p }$ modulo $p$, allowing a finite union of translates for section values. Multiplication is specified by (4.1) and the rule
  #[#set math.equation(numbering: n => "(4.22)")
   $ X_ell f \( Z \) = f \( v^(- 2 Omega \( p \, ell \)) Z \) X_ell . $ <wall:rational-commutation>]
  Consequently a coefficient at each specified non-$p$ exponent is a rational function of $Z$. Products use finitely many decompositions of that non-$p$ exponent. This ring will be used only for comparisons; it does not identify the two Laurent completions in $Z$.
  By Lemma 23, a non-cut wall element is polynomial in $Z$ at each fixed non-$p$ degree. Its constant term in non-$p$ degree is one. Its inverse, computed by the geometric series in positive non-$p$ degree, is therefore polynomial in $Z$ at each such degree as well. The same assertions hold with Laurent polynomials after applying either linear piece of the chart map. Conjugation by these elements is thus a well-defined operation on the common ring. Pure conjugation by $D_p^(plus.minus 1)$ fixes $Z$ and sends any $X_ell$ to a rational function of $Z$ times $X_ell$, by (4.7). It, too, acts on this ring. The map $S$ is the identity modulo $p$, so it preserves the non-$p$ degree and acts in the same ring.
  We justify importing the old consistency into this ring. The expansion homomorphism
  $ K \( Z \) arrow.r K \( \( Z \) \) $
  at $Z = 0$ is injective. On a monomial input, expansion of every old crossing operation agrees with its operation in the old positive completion: its increments lie in $C^(+)$, and the pure ratios have their usual power-series expansions at zero. At bounded non-$p$ degree, all non-cut wall elements are controlled by finitely many old roots by Lemma 23. The path may be made generic for these data. To test a further coefficient in its expansion in $Z$, perturb through the additional finite old order needed for that coefficient; this does not alter the already specified projected operations. Old path independence holds at each such full order. Hence a rational difference between two path operations has zero Laurent expansion in every non-$p$ degree, and injectivity forces that difference to be zero. This proves old consistency in the common ring, on every monomial and therefore on its completed modules.
  #emph[Consistency and incoming data after mutation.] Push the non-cut elements by $L_sigma$ and put $D_(- p)$ on the pure cut. Equation (4.18) shows that this is a system in the new cone completion, finite to every new root order. On any loop, the linear identifications on successive open sides cancel; at a cut crossing their discrepancy is exactly corrected by (4.21). Thus the pushed path operations are consistent in the common rational ring. Expand now at $Z^(- 1) = 0$ to obtain their operations in the new cone completion. Replacing $c$ by $c' = c + \[ - alpha_c \]_(+) p$ changes the coefficient at a fixed projected exponent only by a Laurent monomial in $Z$ and a scalar power of $v$. Equation (4.18) ensures that every pushed increment is $C' ""^(+)$-positive, so this fiberwise expansion is precisely the one in the new completion. The finite-order bounds already proved make this expansion coefficientwise legitimate. They are consistent there as well. Since the form is nondegenerate, adjoint actions detect the wall group elements: for a nonzero first root $r$ in the logarithm of an element, choose $m$ with $Omega \( r \, m \) eq.not 0$; its commutator with $X_m$ is nonzero. Consequently consistency of the actions also gives consistency of the wall products.
  It remains to identify this system by its incoming prescription. A symplectic linear map $L$ satisfies $V \( L r \) = L^or V \( r \)$. Thus on each eventual open side, the incoming direction of a pushed ray is the image of its old incoming direction. For a simple $c eq.not p$, $V \( c \) \( p \) = alpha_c$, so that the relevant piece sends $c$ to exactly $c' = c + \[ - alpha_c \]_(+) p$. Its unit is therefore $D_(c')$. All other non-pure incoming logarithmic coefficients vanish. If an incoming direction is parallel to the cut, its pairing with $p$ is zero; the two pieces agree on its exponent, and either sufficiently small generic offset gives the same conclusion by the trace argument (4.5). A component with no preimage wall has zero coefficient. The pure incoming element is $D_(- p)$ by construction. Uniqueness of (4.4) identifies the pushed system with the system for $C'$.
  #emph[Actual coefficients of polynomial sections.] We now use the finite-polynomial hypothesis in (4.19). Choose a point on the cut with $h \( c \) < - 1$ for all $c eq.not p$, and take $h \( p \)$ very small on either side. Such covectors exist because $C$ is part of a basis. With the constant $B$ defined after (4.18), choosing $\| h \( p \) \| < \( B + 1 \)^(- 1)$ ensures that every non-pure supported root off the cut has negative evaluation:
  $ h \( k p + u \) lt.eq B \| u \| thin \| h \( p \) \| - \| u \| < 0 . $
  At the cut itself $h \( u \) < 0$. Hence the short crossing between these points meets only the pure wall. The negative side is in the old all-negative chamber. The positive side is in the new all-negative chamber, since $h \( - p \) < 0$ and $h \( c' \) < 0$.
  On the positive side, the old value is
  $ "Ad" \( D_p \)^(- 1) F = F' \, $
  which is the actual finite Laurent polynomial specified in the new chamber. On the negative side the pushed old value is $S F$, while (4.21) and (4.19) give
  $ S F = "Ad" \( D_(- p) \)^(- 1) F' . $
  This too is a finite Laurent polynomial, because $F$ is one and $S$ is linear. We have therefore established equality of actual finite values on both sides near the cut.
  To reach any other chamber on a fixed open side, transport entirely within that half-space. Only non-cut walls occur. Their elements and inverses have finite Laurent support in the $p$-fiber at every fixed non-$p$ degree, as proved above. Starting from a finite Laurent polynomial, successive transport consequently retains finite Laurent support in each such fiber: the required coefficient uses finitely many decompositions of the non-$p$ degree and finitely many crossings in its bounded arrangement. Applying $L_sigma$ preserves this property. The compared fiber is therefore the same finite Laurent polynomial on the two sides of the identification. Its coefficient equality is independent of whether it is regarded in the old or the new completion. This establishes the claimed equality of actual section coefficients throughout both open sides. In particular, the argument never equates the expansions at zero and infinity of an arbitrary rational function.
  Finally, put $t = Omega \( p \, n \)$. The incoming direction $V \( n \)$ lies on the side of sign $t$. The relevant linear piece sends $n$ to $n$ if $t > 0$, and to $S \( n \) = n - t p$ if $t < 0$. If $t = 0$, both pieces fix $n$, and either generic perturbation computes the same incoming coefficient. This proves (4.20). Its label map preserves $Omega \( p \, n \)$, so its inverse subtracts $\[ - Omega \( p \, n \) \]_(+) p$. The label map is thus a bijection, as asserted. ◻
]

== 5 The triangular chart and monomial sections <tri:section>

We now identify the evaluated monomial symmetric polynomials with single positive sections. The auxiliary graph used for this purpose contains every naturally labeled unit interval graph as an ordered induced subgraph. All lattice vectors in this section belong to the free lattice on the vertices; the extra dual directions, if used to make the skew form nondegenerate, never occur in their support.

Positive theta sections do not yet give elementary positivity: we must identify each evaluated monomial symmetric function with a single such section. We first introduce an auxiliary graph with a distinguished independent set of vertices. Repeated rotations constrain the incoming coefficients, but those constraints alone do not force the desired identity. A separate analysis of the degree-one symmetric function will give a positive support bound for its higher-degree analogues; that bound is what makes the final subtraction argument possible.

=== 5.1 The chart and its rotations <the-chart-and-its-rotations>

Fix an integer $D gt.eq 1$, and put $n_0 = D - 1$. There are anchors $d_1 \, dots.h \, d_D$ at the integer times $1 \, dots.h \, D$. For each $1 lt.eq j lt.eq i lt.eq n_0$ there is a bridge $b_(j \, i)$ at time $i + theta_(j \, i)$, where $0 < theta_(j \, i) < 1$. The phases are distinct. For $D > 1$, their increasing order is

#[#set math.equation(numbering: n => "(5.1)")
 $ \( n_0 \, n_0 \) \; quad \( n_0 - 1 \, n_0 - 1 \) \, \( n_0 - 1 \, n_0 \) \; quad dots.h \; quad \( 1 \, 1 \) \, \( 1 \, 2 \) \, dots.h \, \( 1 \, n_0 \) . $ <tri:phase-order>]

The index $i$ is the #emph[level], and $j$ is the #emph[row]. Two vertices are adjacent precisely when their times differ by less than $1$. In particular, the anchors are independent, bridges on one level form a clique, and bridges on neighboring levels are adjacent precisely when the bridge on the higher level has the earlier phase.

Use the vertex names also for their independent lattice vectors. The skew form has $Omega \( b \, a \) = 1$ when $a$ precedes $b$ and they are adjacent, and is zero on nonedges. We use the quantum torus normalization $X_a X_b = v^(Omega \( a \, b \)) X_(a + b)$. The independent-set elements

$ E_k = e_k \( Y \) = sum_(I upright(" independent")\
\| I \| = k) X_(sum_(a in I) a) \, #h(2em) U = E_1 \, $

commute by Proposition 4. An independent set has at most $D$ vertices: its ordered times have successive differences at least $1$ and lie in $\[ 1 \, D \]$. Thus $P \( Y \)$ is defined for every symmetric polynomial $P$ in $D$ variables.

#thm([Lemma 5.1.])[
  (Embedding).  #emph[Every naturally labeled unit interval graph on $n$ vertices occurs as an ordered induced subgraph on $n$ selected bridges of a triangular chart. The times and phases may all be chosen rationally.]
] <tri:embedding>

#proof[
  For $n = 0$ take $D = 1$. For $n > 0$, first construct strictly increasing positive rational times $t_1 \, dots.h \, t_n$, with distinct nonzero fractional parts, such that $a < b$ is an edge exactly when $t_b - t_a < 1$. Choose any positive nonintegral rational $t_1$. For $k gt.eq 2$, suppose the times through $t_(k - 1)$ have been chosen. The earlier neighbors of $k$ form a suffix $s \, s + 1 \, dots.h \, k - 1$ because the defining function $h$ is weakly increasing. If that suffix is empty, choose $t_k > t_(k - 1) + 1$. Otherwise choose
  $ max { t_(k - 1) \, t_(s - 1) + 1 } < t_k < t_s + 1 \, $
  omitting $t_(s - 1) + 1$ when $s = 1$. The interval is nonempty: when $s > 1$ we have $t_(s - 1) < t_s$, and either $s = k - 1$ or $s$ and $k - 1$ are already adjacent, since $h \( s \) gt.eq k$. These inequalities give exactly the required earlier neighbors. At each step an open interval of choices remains, so rational choices avoiding all previously used fractional parts are possible.
  Shift every time by a common integer so that every level $floor.l t_a floor.r$ is at least $n$, and then choose $D$ so large that all these levels are at most $D - 1$. Order the $n$ selected vertices by increasing fractional part and assign them, in that order, to the rows $n \, n - 1 \, dots.h \, 1$. A vertex of level $i gt.eq n$ has an available bridge in every one of these rows. Set that bridge’s phase equal to the vertex’s fractional part. There is one prescribed phase per selected row, and they increase in the order (5.1). Insert all the other phases as rational numbers between these prescribed values, respecting the same order. The selected bridges have exactly the shifted original times, so their ordered induced graph is the given graph. ◻
]

Give every vertex weight $1$. On each level take the successive forward differences in the list

#[#set math.equation(numbering: n => "(5.2)")
 $ d_i \, b_(i \, i) \, b_(i - 1 \, i) \, dots.h \, b_(1 \, i) \, d_(i + 1) . $ <tri:level-list>]

Let $C$ be the union of these roots. Concatenating these lists gives one ordered list of all vertices, and its successive differences, together with $d_1$, form a lattice basis. In particular $C$ is a basis of the weight-zero lattice and $C^(+) = sum_(c in C) bb(N) c$ is a free pointed cone. Every simple root carries the unit $D_c$ of Lemma 18. For any vertex $a$, the difference $a - d_1$ lies in $C^(+)$; consequently every homogeneous evaluation $P \( Y \)$ of degree $N$ has support in

#[#set math.equation(numbering: n => "(5.3)")
 $ N d_1 + C^(+) . $ <tri:support-cone>]

Here and below $P \( Y \)$ also denotes the section whose value in the all-negative chamber is this polynomial.

A #emph[rotation] moves the globally first bridge $b$, on level $i$, to the last phase and replaces its vector by

#[#set math.equation(numbering: n => "(5.4)")
 $ b' = b + delta_i \, #h(2em) delta_i = d_(i + 1) - d_i \, #h(2em) p = b - d_i . $ <tri:rotation>]

The anchors are fixed. At this step

$ Omega \( p \, d_i \) = 1 \, quad Omega \( p \, d_(i + 1) \) = - 1 \, quad Omega \( p \, b \) = 1 \, $

and $p$ pairs to zero with every other vertex. Thus the root mutation $p mapsto - p$, $c mapsto c + \[ - Omega \( p \, c \) \]_(+) p$ of Theorem 24 gives precisely the new forward lists. On the moved level, the next and the last old gaps each receive $p$; when these are the same gap it receives $2 p$. The root $- p$ is the new final gap $d_(i + 1) - b'$. All other gaps are unchanged. Pairing the new vertex vectors also gives the interval-graph rule with $b'$ last in phase order.

#thm([Lemma 5.2.])[
  (Polynomial comparison under rotation).  #emph[Let $Y'$ be the alphabet after one rotation. For every symmetric polynomial $P$, 
#[#set math.equation(numbering: n => "(5.5)")
 $ P \( Y \) = "Ad" \( D_p \) P \( Y' \) . $ <tri:polynomial-comparison>]

 Both sides are finite Laurent polynomials, so the actual incoming coefficients satisfy 
#[#set math.equation(numbering: n => "(5.6)")
 $ A_m \( P \( Y \) \) = A_(m + \[ - Omega \( p \, m \) \]_(+) p) \( P \( Y' \) \) . $ <tri:incoming-rotation>]

]
] <tri:rotation-comparison>

#proof[
  It suffices to prove (5.5) for $E_k$. Relative to all vertices outside ${ d_i \, b \, d_(i + 1) }$, the old bridge $b$ has the same neighbors as $d_i$, whereas the new bridge $b'$ has the same neighbors as $d_(i + 1)$. The elementary conjugation formulas give
  $ "Ad" \( D_p \) X_(d_i) & = X_(d_i) + X_b \,\
"Ad" \( D_p \) \( X_(d_(i + 1)) + X_(b') \) & = X_(d_(i + 1)) \,\
"Ad" \( D_p \) X_(d_i + d_(i + 1)) & = X_(d_i + d_(i + 1)) . $
  For completeness, the first identity is the centered binomial formula with pairing $1$ and $d_i + p = b$; the second is its inverse with pairing $- 1$ and $d_(i + 1) + p = b'$; the last uses pairing zero. Fix an independent set outside this triple. Its monomial commutes with $X_p$. The displayed identities match all ways to extend it by no vertex, one vertex, or the independent pair ${ d_i \, d_(i + 1) }$. Their sum proves the assertion for each $E_k$. Since conjugation is an algebra automorphism and the $E_k$ commute, the assertion follows for $P$. Theorem 24, applied to these finite polynomial values, now gives (5.6). ◻
]

Repeat the rotations indefinitely. One #emph[period] moves every bridge once. After $L$ periods the bridge originally on level $i$ is $b + L delta_i$, the phase order is again (5.1), and the roots are denoted by $C_L$.

=== 5.2 Stationarity and pure incoming coefficients <stationarity-and-pure-incoming-coefficients>

#thm([Lemma 5.3.])[
  (Stationary incoming labels).  #emph[Let $P$ be a homogeneous symmetric polynomial of degree $N$, and suppose $A_m \( P \( Y \) \) eq.not 0$. Write the label in the original vertex basis as 
$ m = sum_(i = 1)^D nu_i d_i + sum_(j lt.eq i) kappa_(j \, i) b_(j \, i) \, #h(2em) K_i = sum_(j = 1)^i kappa_(j \, i) \, #h(2em) K_0 = K_D = 0 . $

 Then 
#[#set math.equation(numbering: n => "(5.7)")
 $ K_i = 0 quad \( 1 lt.eq i < D \) \, #h(2em) xi_(j \, i) := Omega \( b_(j \, i) - d_i \, m \) gt.eq 0 quad \( 1 lt.eq j lt.eq i < D \) . $ <tri:stationary-conditions>]

 The lattice label $m$ is fixed by every tropical step in Equation (5.6). If $m$ is pure, meaning that all its bridge coordinates vanish, then $m = sum_i mu_i d_i$, where $mu_1 gt.eq dots.h.c gt.eq mu_D gt.eq 0$ and $sum_i mu_i = N$.]
] <tri:stationary>

#proof[
  For $D = 1$ the support bound already gives $m = N d_1$, so assume $D > 1$. Track the nonzero coefficient using (5.6). At each stage use the current vertex basis to write its current label as $sum nu_i d_i + sum kappa_b b$. When $b$ on level $i$ is moved, put $t = \[ - Omega \( b - d_i \, m \) \]_(+)$. Reexpressing $m + t \( b - d_i \)$ using $b' = b + d_(i + 1) - d_i$ gives
  #[#set math.equation(numbering: n => "(5.8)")
   $ kappa'_b = kappa_b + t \, #h(2em) nu'_i = nu_i + kappa_b \, #h(2em) nu'_(i + 1) = nu_(i + 1) - kappa'_b \, $ <tri:coordinate-step>]
  with all other coordinates unchanged. Thus every individual bridge coordinate, and every $K_i$, is a nondecreasing integer along the tracked sequence.
  In every chart the current polynomial has support $N d_1 + C^(+)$. Triangularity of incoming coordinates preserves this lower support bound. In particular the cut just before $d_(i + 1)$ gives the nonnegative deficit
  #[#set math.equation(numbering: n => "(5.9)")
   $ B_i = N - sum_(j lt.eq i) \( nu_j + K_j \) gt.eq 0 . $ <tri:cut-deficit>]
  Equation (5.8) shows that $B_i$ changes only at moves on level $i$, and then changes by $- kappa'_b$. If $K_i$ were positive at any stage, each subsequent complete period would decrease $B_i$ by at least this positive integer: each bridge’s coordinate at its next move is at least its coordinate at the start of the period. This contradicts (5.9). Therefore $K_i lt.eq 0$ at every stage.
  Since each $kappa_b$ is nondecreasing and their level sum is bounded above by zero, each $kappa_b$ is bounded above as well; one may use the initial lower bounds for the other bridge coordinates on its level. All these integer sequences stabilize. From that time on every $t$ is zero, and the #emph[lattice vector] of the tracked label is a fixed vector $m_(*)$. Its anchor coordinates in the moving vertex basis need not be fixed.
  At the event originally named $b$ on level $i$, the root in period $L$ is $b - d_i + L delta_i$. For all sufficiently large $L$ its pairing with $m_(*)$ is nonnegative. Its slope as a function of $L$ is
  #[#set math.equation(numbering: n => "(5.10)")
   $ Omega \( delta_i \, m_(*) \) = 2 K_i - K_(i - 1) - K_(i + 1) gt.eq 0 . $ <tri:concavity>]
  Indeed $delta_i$ pairs by $2$ with a bridge on level $i$, by $- 1$ with a bridge on either neighboring level, and by zero with all other vertices. The sequence $K_0 \, dots.h \, K_D$ is therefore discretely concave. With zero endpoints it lies above the zero chord, so $K_i gt.eq 0$. Together with $K_i lt.eq 0$, this proves $K_i = 0$.
  The slopes in (5.10) now vanish. Consequently $m_(*)$ pairs with every original event root just as it does with its late counterparts; all these pairings are nonnegative. It is fixed by every tropical step, including the earlier ones. Each map $T_p \( x \) = x + \[ - Omega \( p \, x \) \]_(+) p$ is invertible, with inverse $x mapsto x - \[ - Omega \( p \, x \) \]_(+) p$, because adding $p$ leaves its pairing with $p$ unchanged. Applying these inverses recovers the same $m_(*)$ at every earlier stage. This proves (5.7) for the original label.
  For a pure label, $xi_(j \, i) = mu_i - mu_(i + 1)$, so its coordinates decrease. The last cut in (5.9) says $mu_D gt.eq 0$. Weight is unchanged by every operation, hence $sum_i mu_i = N$. ◻
]

#prodef([Example 5.4.])[
  Stationarity permits mixed labels. For $D = 3$ the phase order is $b_(2 \, 2) \, b_(1 \, 1) \, b_(1 \, 2)$, and
  $ m = d_2 + b_(1 \, 2) - b_(2 \, 2) $
  satisfies $K_1 = K_2 = 0$ and $xi_(1 \, 1) = xi_(2 \, 2) = xi_(1 \, 2) = 0$. Moreover,
  $ m - d_1 = \( b_(1 \, 1) - d_1 \) + \( d_2 - b_(1 \, 1) \) + \( b_(1 \, 2) - b_(2 \, 2) \) in C^(+) . $
  It is therefore a stationary candidate of weight $1$, although its $b_(2 \, 2)$ coordinate is negative. Its incoming coefficient in $U$ will be excluded by a separate argument.
] <tri:mixed-stationary>

#thm([Lemma 5.5.])[
  (Pure coefficient extraction).  #emph[Let $P$ be a homogeneous symmetric polynomial of degree $N$, and let $m = sum_i mu_i d_i$ with $mu_1 gt.eq dots.h.c gt.eq mu_D gt.eq 0$ and $sum_i mu_i = N$. For commuting indeterminates $z_1 \, dots.h \, z_D$, 
#[#set math.equation(numbering: n => "(5.11)")
 $ A_m \( P \( Y \) \) = \[ z_1^(mu_1) dots.h.c z_D^(mu_D) \] P \( z_1 \, dots.h \, z_D \) . $ <tri:pure-formula>]

]
] <tri:pure>

#proof[
  We choose a single sufficiently large integer $L$ after fixing the finite set of possible increments for this coefficient. Since $m - N d_1 in C^(+)$, that set is
  #[#set math.equation(numbering: n => "(5.12)")
   $ cal(R)_m = { r in C^(+) : 0 < r lt.eq m - N d_1 } \, $ <tri:finite-candidates>]
  where $r lt.eq s$ means $s - r in C^(+)$. It is finite because $C$ is a finite free basis. Its members have bounded original vertex coordinates, independently of $L$.
  Define a covector by
  #[#set math.equation(numbering: n => "(5.13)")
   $ Q_L \( d_i \) = D - i \, #h(2em) Q_L \( b - d_i \) = L - theta_b quad upright("for an original bridge on level ") i . $ <tri:test-covector>]
  For the moved bridge $b^(\( L \)) = b + L delta_i$ its value is $Q_L \( b^(\( L \)) \) = D - i - theta_b$. The values strictly decrease along each moved forward list, so $Q_L$ is in the all-negative chamber for $C_L$. Every mutation cut used in the first $L$ periods has root $p_b^(\( ell \)) = b - d_i + ell delta_i$ for some $0 lt.eq ell < L$, and
  $ Q_L \( p_b^(\( ell \)) \) = L - theta_b - ell > 0 \, #h(2em) Omega \( p_b^(\( ell \)) \, m \) = mu_i - mu_(i + 1) gt.eq 0 . $
  Hence the entire ray $Q_L + s V \( m \)$, $s gt.eq 0$, lies on the identity side of all these cuts. Repeated application of Theorem 24 identifies the wall systems there by the identity on lattice vectors, and identifies the section at $Q_L$ with the finite graph polynomial in the chart after $L$ periods.
  Consider a wall capable of changing the coefficient of $X_m$ along this ray. Any positive increment on its ray belongs to $cal(R)_m$: the starting exponent is at least $N d_1$ in the original cone. Furthermore an actual contributing wall root belongs to $C_L^(+)$, by the successive identity-side wall identifications. This assertion concerns the roots on those walls; it does not assert an inclusion between the entire old and new cones.
  For $r in cal(R)_m$, write its original coordinates as $nu_i \( r \) \, kappa_b \( r \)$ and put
  $ P_i \( r \) = sum_(j lt.eq i) \( nu_j \( r \) + K_j \( r \) \) . $
  As a #emph[fixed vector] reexpressed after $L$ periods, $r$ has unchanged bridge coordinates and anchor coordinates
  #[#set math.equation(numbering: n => "(5.14)")
   $ nu_i^(\( L \)) \( r \) = nu_i \( r \) + L #scale(x: 120%, y: 120%)[\(] K_i \( r \) - K_(i - 1) \( r \) #scale(x: 120%, y: 120%)[\)] . $ <tri:moving-prefix>]
  Thus its moved prefix is $P_i \( r \) + L K_i \( r \)$. A weight-zero member of $C_L^(+)$ has nonpositive prefixes, giving $P_i \( r \) + L K_i \( r \) lt.eq 0$. Choose $L$ larger than all $- P_i \( r \)$ for $r in cal(R)_m$ and $1 lt.eq i < D$. Since the $K_i \( r \)$ are integers, every contributing candidate must then satisfy $K_i \( r \) lt.eq 0$ for all $i$.
  There is also an $L$-independent quantity $q_0 \( r \)$ such that
  $ Q_L \( r \) = L sum_i K_i \( r \) + q_0 \( r \) . $
  Increasing the same $L$ to exceed all $q_0 \( r \)$ makes $Q_L \( r \) < 0$ whenever some $K_i \( r \) < 0$ and all are nonpositive. For every contributing candidate,
  #[#set math.equation(numbering: n => "(5.15)")
   $ Omega \( r \, m \) = sum_(i = 1)^(D - 1) K_i \( r \) \( mu_i - mu_(i + 1) \) lt.eq 0 . $ <tri:no-crossing-pairing>]
  If some $K_i \( r \) < 0$, then $\( Q_L + s V \( m \) \) \( r \) = Q_L \( r \) + s Omega \( r \, m \) < 0$ for every $s gt.eq 0$, so the ray never crosses its hyperplane. If all $K_i \( r \)$ vanish, the pairing is zero. A wall on this ray fixes every monomial $X_(m - a r)$, since $Omega \( r \, m - a r \) = 0$, and cannot change the $X_m$ coefficient.
  All these comparisons require only finitely many orders for the fixed target and the chosen $L$. Perturb $Q_L$ by a sufficiently small generic covector at these orders, retaining the strict cut inequalities and the strict negative inequalities just established. This also handles any walls parallel to the unperturbed ray; their zero-pairing actions still fix the target coefficient. For large $s$, the target coefficient at $Q_L + s V \( m \)$ is the incoming coefficient by its definition. It therefore equals the coefficient at $Q_L$.
  Finally, in the moved vertex basis the target $m$ still has zero bridge coordinates. Every graph monomial using a bridge has a positive coordinate at that bridge, and hence cannot contribute. Suppressing all bridges leaves the independent anchors; their monomials commute without powers of $v$. The coefficient at $Q_L$ is exactly the right side of (5.11). ◻
]

=== 5.3 The linear section and its gap recurrence <the-linear-section-and-its-gap-recurrence>

#thm([Lemma 5.6.])[
  #emph[In the all-negative chamber of the triangular chart, 
$ U = Theta_(d_1) . $

]
] <tri:linear>

#proof[
  Assume $D > 1$, as the assertion for $D = 1$ is immediate. Take any label $m$ with $A_m \( U \) eq.not 0$. By the support bound and Lemma 27, the vector $m - d_1$ is a nonnegative integer combination of the forward gaps, its bridge totals $K_i$ vanish, and all $xi_(j \, i)$ are nonnegative.
  On level $i$, let $u_(j \, i)$ be the coefficient of the gap immediately following $b_(j \, i)$ in (5.2). Put $a_i = u_(1 \, i)$, and $a_0 = 0$. The sum of the bridge coordinates on that level is the first gap coefficient minus the last gap coefficient. Thus $K_i = 0$ says that the initial gap $b_(i \, i) - d_i$ also has coefficient $a_i$. In particular both end gaps are included in this notation. Figure 1 illustrates these coefficients. All the $u_(j \, i)$ and $a_i$ are nonnegative integers.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  circle((0, 0), radius: 0.05644, fill: black, stroke: none)
  content((0, 0.1764), [$d_1$], anchor: "south", padding: 0.1176cm)
  circle((1.8, 0), radius: 0.05644, fill: black, stroke: none)
  content((1.8, 0.1764), [$b_(1,1)$], anchor: "south", padding: 0.1176cm)
  circle((3.6, 0), radius: 0.05644, fill: black, stroke: none)
  content((3.6, 0.1764), [$d_2$], anchor: "south", padding: 0.1176cm)
  circle((5.4, 0), radius: 0.05644, fill: black, stroke: none)
  content((5.4, 0.1764), [$b_(2,2)$], anchor: "south", padding: 0.1176cm)
  circle((7.2, 0), radius: 0.05644, fill: black, stroke: none)
  content((7.2, 0.1764), [$b_(1,2)$], anchor: "south", padding: 0.1176cm)
  circle((9, 0), radius: 0.05644, fill: black, stroke: none)
  content((9, 0.1764), [$d_3$], anchor: "south", padding: 0.1176cm)
  line((0.108, 0), (1.692, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((0.9, -0.1764), [$a_1$], anchor: "north", padding: 0.1176cm)
  line((1.908, 0), (3.492, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((2.7, -0.1764), [$a_1$], anchor: "north", padding: 0.1176cm)
  line((3.708, 0), (5.292, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((4.5, -0.1764), [$a_2$], anchor: "north", padding: 0.1176cm)
  line((5.508, 0), (7.092, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((6.3, -0.1764), [$u_(2,2)$], anchor: "north", padding: 0.1176cm)
  line((7.308, 0), (8.892, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((8.1, -0.1764), [$a_2$], anchor: "north", padding: 0.1176cm)
  content((1.8, -0.88), [level $1$])
  content((6.3, -0.88), [level $2$])
})],
    caption: [Figure 1: The gap coefficients for $D = 3$. The horizontal order is time order, drawn schematically; phase order is $b_(2 \, 2) \, b_(1 \, 1) \, b_(1 \, 2)$. Vanishing bridge totals equate the two end coefficients on each level. ],
  ) <tri:gap-figure>
  We spell out the pairing calculation underlying the recurrence. For $p = b_(j \, i) - d_i$, its values on the same-level bridges are $2$ before $b_(j \, i)$, $1$ at $b_(j \, i)$, and $0$ after it. On bridges of a neighboring level its values are $- 1$ before this phase and $0$ after it. Its anchor values are $1$ at $d_i$, $- 1$ at $d_(i + 1)$, and zero elsewhere. Evaluate these values on successive differences. The contribution on its own level is minus the two gaps adjacent to $b_(j \, i)$: the additional contributions from the two end gaps cancel because their coefficients agree. On level $i - 1$ the same endpoint cancellation leaves the coefficient of the gap containing the phase of $b_(j \, i)$; on level $i + 1$ that coefficient is obtained directly. The contribution of the initial $d_1$ is $bold(1)_(i = 1)$. With nonexistent terms interpreted as zero, this gives
  #[#set math.equation(numbering: n => "(5.16)")
   $ xi_(j \, i) =  & bold(1)_(i = 1) - u_(j \, i) - cases(delim: "{", u_(j + 1 \, i) \, & j < i \,, a_i \, & j = i \,)\
 & + cases(delim: "{", u_(j \, i - 1) \, & j < i \,, a_(j - 1) \, & j = i \,) + u_(j + 1 \, i + 1) . $ <tri:gap-pairing>]
  Indeed the upper neighboring gap follows the event in row $j + 1$; the lower neighboring gap follows the event in row $j$ when $j < i$, and is its initial gap when $j = i$.
  Set
  $ T_(j \, i) = u_(j \, i) - u_(j + 1 \, i + 1) \, #h(2em) 1 lt.eq j lt.eq i lt.eq n_0 \, $
  again using zero for nonexistent terms. Equation (5.16) is equivalently
  #[#set math.equation(numbering: n => "(5.17)")
   $ T_(j \, j) & = bold(1)_(j = 1) + a_(j - 1) - a_j - xi_(j \, j) \,\
T_(j \, i) & = T_(j \, i - 1) - xi_(j \, i) &  & \( i > j \) . $ <tri:gap-recurrence>]
  Each row of $T$ is weakly decreasing and ends in $T_(j \, n_0) = u_(j \, n_0) gt.eq 0$. Hence every $T_(j \, i) gt.eq 0$. The row-start inequalities then give $a_1 lt.eq 1$ and $a_j lt.eq a_(j - 1)$ for $j > 1$. Integrality shows that
  $ a_1 \, dots.h \, a_(n_0) = underbrace(1 \, dots.h \, 1, e) \, 0 \, dots.h \, 0 $
  for some $0 lt.eq e lt.eq n_0$. The case $e = n_0$ is impossible: every row-start upper bound in Equation (5.17) would be zero, giving $T = 0$ and then $u = 0$, contrary to $a_1 = 1$.
  All rows of $T$ except row $e + 1$ have zero row-start upper bound. Row $e + 1$ has upper bound $1$, so its nonzero entries form an initial stretch of ones in columns $e + 1 \, dots.h \, t$, for some $e lt.eq t lt.eq n_0$; $t = e$ denotes an empty stretch. The definition of $T$ telescopes along southeast diagonals:
  #[#set math.equation(numbering: n => "(5.18)")
   $ u_(j \, i) = sum_(a gt.eq 0) T_(j + a \, i + a) . $ <tri:diagonal-recovery>]
  In particular $u_(1 \, i) = a_i$ is $1$ exactly for $1 lt.eq i lt.eq t - e$. Comparison with its already known run of length $e$ gives $t = 2 e$. Thus every positive gap coefficient is on a level $i lt.eq 2 e$. From (5.17), a positive $xi_(j \, i)$ can occur only at the drop after this stretch, in level $2 e + 1$ (if that level exists). In particular all $xi_(j \, i)$ on a positively used level are zero. When $e = 0$, every gap coefficient is zero and the possible positive value is the initial term $xi_(1 \, 1)$; thus the same conclusion includes the empty stretch.
  Every positively used forward root therefore pairs trivially with $m$. For an interior gap its pairing is the difference of the two adjacent $xi$ values; for the first gap it is $xi_(i \, i)$. For the last gap it is
  $ Omega \( d_(i + 1) - b_(1 \, i) \, m \) = Omega \( delta_i \, m \) - xi_(1 \, i) = 0 \, $
  since $K = 0$ gives $Omega \( delta_i \, m \) = 0$ by Equation (5.10). This verifies both end gaps as well as the interior ones.
  A wall increment capable of changing $\[ X_m \]$ lies in the finite interval $0 < r lt.eq m - d_1$. As $C$ is free, such an $r$ can use only positively used gaps, and hence $Omega \( r \, m \) = 0$. Conjugation on that ray fixes every possible predecessor of $m$. It follows that transport from the all-negative chamber to the incoming direction does not change this coefficient, so $A_m \( U \) = \[ X_m \] U$. The only vertex exponent consistent with Lemma 27 is $d_1$: bridges have nonzero level total, and a pure unit vector is dominant only at the first anchor. Therefore the only nonzero incoming coefficient of $U$ is $A_(d_1) \( U \) = 1$. The definition of the incoming basis proves $U = Theta_(d_1)$. ◻
]

=== 5.4 Positive domination and the monomial identity <positive-domination-and-the-monomial-identity>

#thm([Lemma 5.7.])[
  (Vertex support before subtraction).  #emph[For every partition $mu tack.r N$ with at most $D$ parts, padded by zeroes, put $x_mu = sum_i mu_i d_i$. In the all-negative chamber, $Theta_(x_mu)$ has nonnegative vertex exponents and coefficients in $bb(N) \[ v \, v^(- 1) \]$, and is a finite Laurent polynomial. More precisely, coefficientwise in both vertex exponents and $v$, 
#[#set math.equation(numbering: n => "(5.19)")
 $ frac(N !, product_i mu_i !) thin Theta_(x_mu) med lt.eq med U^N . $ <tri:positive-domination>]

]
] <tri:domination>

#proof[
  Lemma 30 and Corollary 22 give a nonnegative incoming expansion of $U^N$. Lemma 29, applied to $\( z_1 + dots.h.c + z_D \)^N$, gives
  $ A_(x_mu) \( U^N \) = frac(N !, product_i mu_i !) > 0 . $
  Every section in this expansion has nonnegative coefficients in every chamber by Theorem 21. Retaining the one displayed summand therefore gives (5.19). The right side is a finite Laurent polynomial with nonnegative vertex exponents and nonnegative integral coefficients in $v$. No coefficient outside that finite support, and no negative vertex coordinate, can occur in the retained positive summand. This proves all the claims, including finiteness of its Laurent coefficients. The case $N = 0$ is the identity section. ◻
]

#thm([Theorem 5.8.])[
  (Monomial sections).  #emph[For every partition $lambda$ with at most $D$ parts, padded by zeroes to length $D$, one has in the all-negative chamber 
#[#set math.equation(numbering: n => "(5.20)")
 $ m_lambda \( Y \) = Theta_(sum_(i = 1)^D lambda_i d_i) . $ <tri:monomial-identity>]

 In particular, 
#[#set math.equation(numbering: n => "(5.21)")
 $ E_k = Theta_(d_1 + dots.h.c + d_k) #h(2em) \( 0 lt.eq k lt.eq D \) . $ <tri:elementary-identity>]

]
] <tri:monomial>

#proof[
  For $D = 1$ the cone is trivial and the assertion is immediate. Otherwise set $N = \| lambda \|$ and $x_lambda = sum_i lambda_i d_i$. The polynomial $m_lambda \( Y \)$ has nonnegative vertex exponents: it is a polynomial in the independent-set generators, each of which has this support property. This assertion concerns its exponent support and does not assume coefficient positivity. Lemma 31 already gives the same support property for $Theta_(x_lambda)$.
  By Lemmas 27 and 29, the pure incoming coefficients of $m_lambda \( Y \)$ are $1$ at $x_lambda$ and zero at every other pure label. Indeed $m_lambda$ is the sum of the distinct ordinary monomials in the orbit of $lambda$, and that orbit contains exactly one dominant vector. Subtract the indicated section and write
  $ F = m_lambda \( Y \) - Theta_(x_lambda) . $
  Its ordinary support still has nonnegative vertex coordinates, all its pure incoming coefficients vanish, and both its ordinary and incoming support lie in $N d_1 + C^(+)$.
  If an incoming coefficient remains nonzero, its label $m$ is mixed and satisfies $K_i \( m \) = 0$ by Lemma 27; subtracting $Theta_(x_lambda)$ changes only one pure incoming coefficient. A nonzero bridge-coordinate vector with zero sum on each level has some negative bridge coordinate. Among all remaining labels choose one with minimum height in $N d_1 + C^(+)$, where the height is the sum of its nonnegative simple root coordinates. A minimum exists in $bb(N)$, even if the incoming expansion is infinite. Incoming triangularity says that the ordinary coefficient at this label equals its incoming coefficient plus contributions from strictly lower incoming labels. There are no such nonzero lower terms by the choice of height. Hence $\[ X_m \] F = A_m \( F \) eq.not 0$, contradicting the negative bridge coordinate of $m$ and the vertex support already proved. No coefficient remains, proving (5.20). Finally $m_(\( 1^k \)) = e_k$ gives (5.21). ◻
]

#thm([Corollary 5.9.])[
  (Elementary positivity).  #emph[Let $G$ be a natural unit interval graph on $n$ vertices, and put $M = \| E \( G \) \|$. In its elementary expansion 
$ chi_G \( X \; q \) = sum_(lambda tack.r n) c_lambda \( q \) e_lambda \( X \) \, $

 every $c_lambda \( q \)$ belongs to $bb(N) \[ q \]$ and has degree at most $M$. For a triangular embedding with $D gt.eq n$, let $u$ be the sum of the selected vertex exponents and set $x_lambda = sum_i lambda_i d_i$, padding $lambda$ by zeroes. Then 
#[#set math.equation(numbering: n => "(5.22)")
 $ \[ X_u \] Theta_(x_lambda)^(H_(-)) = v^(- M) c_lambda \( v^2 \) in sum_(d = 0)^M bb(N) v^(2 d - M) \, $ <tri:positive-coefficient>]

 where $H_(-)$ is the all-negative chamber.]
] <tri:positivity>

#proof[
  Choose the embedding of Lemma 25, taking $D gt.eq n$. Proposition 5, Lemma 7, and Theorem 32 give
  $ c_lambda \( v^2 \) = v^M \[ X_u \] m_lambda \( Y \) = v^M \[ X_u \] Theta_(x_lambda)^(H_(-)) . $
  The last expression has nonnegative integral coefficients at every power of $v$ by Theorem 21. On the other hand, the coloring definition has $q$-degree at most $M$. In any number of variables at least $n$, the elementary monomials form an integral basis in degree $n$; symmetry therefore gives $c_lambda \( q \) in bb(Z) \[ q \]$ of degree at most $M$. Comparing these finite polynomials with the displayed Laurent-series identity proves coefficientwise nonnegativity and Equation (5.22). ◻
]

This completes the coefficientwise positivity assertion. The remaining construction assigns a partition to each individual graph-nondescent permutation and proves the weight-preserving formula in Theorem 1. The finite coefficient bounds in Equation (5.22) will also bound the histories used by that construction.

== 6 A finite witness on individual words <route:section>

Corollary 33 proves positivity of the elementary coefficients. We now construct the partition assigned to each individual word. The construction matches ordered packets of vertices with finite wall histories and anchor words; the anchor multiplicities specify the partition. Its local matchings use coefficients of elementary sections and individual wall operators, without taking the final elementary coefficient list as input.

Fix a triangular embedding with $D gt.eq max { 1 \, n }$, put $N = n$, and let $u$ be the sum of the indicated vertex exponents. Write $H_(-)$ for its all-negative chamber, $M = \| E \( G \) \|$, and

$ R = u - N d_1 in C^(+) \, #h(2em) B = { y : N d_1 lt.eq y lt.eq u } . $

The order in this display is the free-cone order. If $R = sum_(c in C) R_c c$, set $h \( R \) = sum_c R_c$. The set $B$ has $product_c \( R_c + 1 \)$ elements. Only wall roots $0 < r lt.eq R$ can contribute to the coefficients considered here. All chamber and path choices in this section refer to this finite truncation.

=== 6.1 Decorated coefficients and their finite orders <route:decorations>

For $1 lt.eq k lt.eq N$, let

$ E_k = e_k \( Y \) = Theta_(d_1 + dots.h.c + d_k) \, #h(2em) E_k^H = sum_(a \, e) c_k^H \( a \, e \) v^e X_a . $

The identity is Theorem 32. The coefficients $c_k^H \( a \, e \)$ are nonnegative integers by Theorem 21. A decorated $k$-packet in $H$ is a triple $\( a \, e \, t \)$ with $1 lt.eq t lt.eq c_k^H \( a \, e \)$. The integer $e$ is its energy. For an ordered composition $bold(k) = \( k_1 \, dots.h \, k_b \)$ of $N$, a product state is an ordered tuple of decorated packets. Its exponent and energy are

#[#set math.equation(numbering: n => "(6.1)")
 $ a = sum_(i = 1)^b a_i \, #h(2em) E = sum_(i = 1)^b e_i + sum_(i < j) Omega \( a_i \, a_j \) . $ <route:product-energy>]

Thus these states count the coefficients of $P_(bold(k)) = E_(k_1) dots.h.c E_(k_b)$, with their multiplicities. In $H_(-)$, a packet is just an independent set of size $k$, with energy zero and index one.

If a wall operator $W$ is positive on $X_a$, a decorated jump from $a$ to $a + j p$ is a triple $\( j \, e \, t \)$ with

#[#set math.equation(numbering: n => "(6.2)")
 $ j gt.eq 0 \, #h(2em) 1 lt.eq t lt.eq \[ v^e X_(a + j p) \] W \( X_a \) . $ <route:jump-decoration>]

Here $p$ is the primitive positive lattice vector of the wall ray; an unoccupied multiple simply has coefficient zero. Energies in Equation (6.2) are in centered torus notation and already include the shift arising from multiplication by $X_a$. The unique zero jump is $\( 0 \, 0 \, 1 \)$.

#thm([Lemma 6.1.])[
  (Effective coefficient slices).  #emph[At fixed total exponent in $B$ and fixed total energy, every packet decomposition and local jump decomposition used below is a finite set that can be enumerated effectively. The same holds for a sequence of at most $h \( R \)$ nonzero total jumps.]
] <route:finite>

#proof[
  The support of $E_k$ in every chamber is contained in $k d_1 + C^(+)$. Consequently every packet offset and every jump increment in a decomposition with total exponent at most $u$ is at most $R$. There are finitely many exponent tuples, wall directions, and truncated chambers. This assertion applies to underlying packet states as well as to their states after jumps.
  At each fixed exponent the coefficient of a section or wall jump lies in $bb(Z) \( \( v^(- 1) \) \)$: it has a finite upper energy bound and finite coefficients at individual energies. For a fixed exponent tuple, write its energy equation as
  $ E = kappa + e_1 + dots.h.c + e_s \, $
  where $kappa$ is the fixed sum of torus cross terms. If the coefficient of the $i$th piece has upper energy bound $U_i$, then
  #[#set math.equation(numbering: n => "(6.3)")
   $ E - kappa - sum_(j eq.not i) U_j med lt.eq e_i lt.eq U_i . $ <route:energy-bound>]
  Thus each energy and each decoration ranges over a finite set. For bounded sequences there are again only finitely many exponent types, so the same argument applies to all their pieces at once.
  These are effective bounds. The initial units have the rational coefficients
  $ \[ X_(j p) \] D_p = frac(v^(- j^2), product_(i = 1)^j \( 1 - v^(- 2 i) \)) . $
  The triangular factorization and incoming equations of Section 4 determine every wall coefficient to the required root order by finite rational arithmetic in $v$. Transport of the finite independent-set sums determines the needed $E_k^H$ in the same way. A rational function expanded at $v^(- 1) = 0$ has a computable upper degree, and any finite interval of its coefficients is computable by formal division. Reducing numerator and denominator first also decides whether it vanishes. One may therefore compute the bounds in Equation (6.3), enumerate all choices in them, and compute their multiplicities. No factorization into positive units needs to be found in order to perform these coefficient calculations; positivity justifies interpreting the computed integers as multiplicities. ◻
]

We specify the finite choices used by these definitions. Order lattice coordinates in the basis $d_1$, followed by the forward roots $C$ in time order and then any added dual basis vectors. For a nonnegative integer $a$, let $b \( a \)$ be its binary expansion, with $b \( 0 \) = 0$, and encode it as $1^(\| b \( a \) \|) 0 b \( a \)$. Encode a signed integer by a sign bit followed by the code of its absolute value, a rational by its reduced numerator and positive denominator, and a tuple by its length followed by its component codes. A fixed initial type tag distinguishes these possibilities. Sign vectors are tuples of signed integers. Order codes first by length and then lexicographically. In every finite set below, “the same index” means the same rank in this order. Fix the triangular embedding by the same order: enumerate tuples giving an integer $D gt.eq max { 1 \, n }$, rational phases in the order of Equation (5.1), and $n$ distinct selected bridges, and take the first tuple whose induced ordered graph is $G$. Every candidate is checked by finitely many rational comparisons, and Lemma 25 proves that a candidate exists. For empty input use $D = 1$ and no selected bridges.

All later generic rational choices mean the first code satisfying the listed open inequalities and avoidance conditions. These are decidable finite systems of rational linear conditions. In particular, for a line $h + t V \( y \)$, two distinct wall hyperplanes with nonzero pairings have simultaneous crossings precisely when $h \( r \) Omega \( s \, y \) - h \( s \) Omega \( r \, y \) = 0$. A root $r$ with $Omega \( r \, y \) = 0$ instead requires $h \( r \) eq.not 0$. Thus the path conditions used below have the asserted finite form. A nonempty open rational cell contains a rational point, so the searches terminate.

=== 6.2 The local packet switch <route:local>

Let $W : I arrow.r I I$ be a wall crossing on the positive ray $bb(N) p$. Write its operator as $"Ad" \( g_p \)^epsilon$, where $epsilon = 1$ for a crossing from positive to negative and $epsilon = - 1$ for the reverse crossing. Assume that the target exponent $y$ satisfies

#[#set math.equation(numbering: n => "(6.4)")
 $ epsilon Omega \( p \, y \) gt.eq 0 . $ <route:positive-total>]

This is exactly the positive bend direction of Proposition 19, with the identity direction included as in Lemma 18.

The total pairing in Equation (6.4) can be nonnegative even when an individual packet has negative pairing. The switch must therefore use both directions of single-packet transport. Its invariant is a tuple of packet states retained on the side from which their jumps have nonnegative coefficients.

#thm([Proposition 6.2.])[
  (Packet switch).  #emph[There is a computable energy-preserving bijection 
#[#set math.equation(numbering: n => "(6.5)")
 $ {upright("product states of exponent ") y upright(" in ") I I} arrow.l.r mat(delim: "{", upright("product states of exponent ") z upright(" in ") I upright(", together with"); upright("a decorated jump of ") W upright(" from ") z upright(" to ") y) . $ <route:switch-equation>]

 On the right the energy is the state energy plus the jump energy. If $Omega \( p \, y \) = 0$, the total jump is always the unique zero jump.]
] <route:switch>

#proof[
  For a packet with exponent $a$, call its type positive if $epsilon Omega \( p \, a \) gt.eq 0$, and negative otherwise. Adding a multiple of $p$ does not change this type. In particular the types are recoverable on both sides of Equation (6.5).
  For a positive packet the section identity $E_k^(I I) = W \( E_k^I \)$ expresses each decorated state in $I I$ as a state in $I$ followed by a positive jump of $W$. More precisely, at fixed output exponent and energy the two sets have the same cardinality, so identify them by their finite ranks from Lemma 34. For a negative packet use instead $E_k^I = W^(- 1) \( E_k^(I I) \)$: a state in $I$ is identified with a state in $I I$ followed by a positive jump of $W^(- 1)$. Packets of zero pairing are fixed. These identifications have computable inverses.
  Fix the retained state of each packet: in chamber $I$ for a positive packet, and in chamber $I I$ for a negative packet. Write $x_i$ for its exponent, and keep its energy and decoration index fixed. The two positive expansions to be matched are
  $ upright("packet type") & upright("retained chamber") & L_i med upright("(side ") I I upright(")") & R_i med upright("(side ") I upright(")")\
upright("positive") & I & W \( X_(x_i) \) & X_(x_i)\
upright("negative") & I I & X_(x_i) & W^(- 1) \( X_(x_i) \) $
  Via the single-packet bijections, a decorated term of $L_i$ together with its retained state gives a packet in $I I$; a decorated term of $R_i$ together with that state gives a packet in $I$. Each row satisfies $L_i = W \( R_i \)$, so the automorphism property gives
  #[#set math.equation(numbering: n => "(6.6)")
   $ L_1 dots.h.c L_b = W \( R_1 dots.h.c R_b \) . $ <route:automorphism>]
  The left side opens only positive packets. The right side opens only negative packets and then applies one total jump. For a term at $X_y$, the input of the total jump differs from $y$ by a multiple of $p$. Its pairing is therefore $Omega \( p \, y \)$, and Equation (6.4) makes that jump positive.
  We spell out the energy in Equation (6.6). If the individual increments in a term are $j_i p$, its cross-packet shift is
  #[#set math.equation(numbering: n => "(6.7)")
   $ sum_(i < j) Omega \( x_i + j_i p \, x_j + j_j p \) =  & sum_(i < j) Omega \( x_i \, x_j \)\
 & + sum_(i < j) #scale(x: 120%, y: 120%)[\(] j_i Omega \( p \, x_j \) + j_j Omega \( x_i \, p \) #scale(x: 120%, y: 120%)[\)] . $ <route:cross-energy>]
  There is no quadratic term because $Omega \( p \, p \) = 0$. On the right of Equation (6.6), add the energy of the final total jump to this expression and to the individual inverse-jump energies. On the left, add the individual forward-jump energies. Taking a fixed $v$-coefficient of $X_y$ in the identity gives equality of the two finite sets of jump tuples with exactly these energies. Match them by rank. Restoring the fixed underlying packet energies adds the same integer to both sides.
  The bijection is now explicit in either direction. From the left of Equation (6.5), open its positive packets by their single-packet bijections, keep its negative packets as underlying states, apply the jump-tuple rank bijection, and close the negative packets into states in $I$. Conversely, from the right, open the negative packets, retain the positive packets, invert the jump-tuple bijection, and close the positive packets into states in $I I$. Invariant packet types ensure that the same underlying data and rank sets are used on reversal. All ranks are finite by Lemma 34. Finally, if $Omega \( p \, y \) = 0$, every monomial on the line $y + bb(Z) p$ commutes with $g_p$, so its total transform has only the zero jump. ◻
]

#prodef([Example 6.3.])[
  (Zero total jump with changing packets).  In the monomial identity of the switch, take $W = "Ad" \( D_p \)$ and $Omega \( p \, x_1 \) = 1$, $Omega \( p \, x_2 \) = - 1$. The two sides of Equation (6.6) become
  $ \( X_(x_1) + X_(x_1 + p) \) X_(x_2) = X_(x_1) \( X_(x_2) + X_(x_2 + p) \) . $
  The total pairing is zero, so $W$ fixes every monomial in the right-hand product. The terms at exponent $x_1 + x_2 + p$ agree because
  $ Omega \( x_1 + p \, x_2 \) = Omega \( x_1 \, x_2 + p \) = Omega \( x_1 \, x_2 \) - 1 . $
  Thus the local matching transfers the increment from the positive packet to the negative packet while its recorded total jump is zero. The example concerns the monomial matching with retained exponents fixed; its point is that zero total jump need not fix each packet.
] <route:zero-example>

=== 6.3 Common histories and terminal anchor states <route:histories>

Before choosing a composition, fix a generic rational representative $h_(H \, y) in H$ for every truncated chamber $H$ and every $y in B$. Use the line $h_(H \, y) + t V \( y \)$, $t gt.eq 0$. Choose the representatives so that its transverse wall crossings are distinct and avoid joints. There are only finitely many avoidance conditions. At large $t$ it lies in a testing chamber near $V \( y \)$; if $V \( y \) = 0$, the line is constant and has no crossings. List its crossings in the direction of decreasing $t$, toward $H$. Each has the sign required by Equation (6.4). The choices depend on $\( H \, y \)$ only, not on the number, sizes, energies, or indices of packets.

For a section $P$ supported above $N d_1$, the coefficient recursion of Lemma 20 is

#[#set math.equation(numbering: n => "(6.8)")
 $ \[ X_y \] P^H = A_y \( P \) + sum_(W : I arrow.r I I) med sum_(N d_1 lt.eq z < y) \[ X_y \] W \( X_z \) thin \[ X_z \] P^I . $ <route:history-recursion>]

The outer sum follows the selected line, oriented toward $H$. Only increments on the crossed ray have nonzero coefficients. The zero-jump coefficient is one, which is why Equation (6.8) is a sum of increments rather than a product of separate wall choices.

Define a total history from $\( H_(-) \, u \)$ recursively. At a pair $\( H \, y \)$ it either stops, with terminal label $y$, or chooses one crossing $W : I arrow.r I I$ in Equation (6.8), an exponent $z < y$, and a nonzero decorated jump from $z$ to $y$, then continues from $\( I \, z \)$. Its energy is the sum of its jump energies. Let $T_x$ be the set of histories with terminal label $x$, and $T_x \( E \)$ its energy $E$ slice. The choices of crossing and chamber at each step are part of the history, so equal-looking jumps on different portions of a path are distinguished.

Every nonzero jump lowers the cone height by at least one, so a history has at most $h \( R \)$ such jumps. Lemma 34 proves directly that $T_x \( E \)$ is finite. Applying Equation (6.8) to $Theta_x$, whose incoming coordinates are $A_y \( Theta_x \) = upright(bold(1))_(y = x)$, gives

#[#set math.equation(numbering: n => "(6.9)")
 $ sum_(t in T_x) v^(E \( t \)) = \[ X_u \] Theta_x^(H_(-)) . $ <route:history-series>]

This is a coefficientwise identity in the Laurent completion. The definition of $T_x$ itself uses only local monomial jumps.

The packet realization of this recursion is also reversible. Start with a product state of exponent $y$ in $H$, and traverse the chosen line backwards, applying Proposition 35 at each wall. A zero total jump continues to the next wall. At the first nonzero total jump, record its crossing and decoration and recurse from the smaller exponent and its chamber. If every total jump is zero, stop with the product state in the testing chamber. Between two nonzero jumps only finitely many walls are crossed. For the inverse, first reconstruct the state in $\( I \, z \)$ recursively. Apply the inverse local switch with the recorded jump $z arrow.r y$ to obtain its state in chamber II, then undo the zero-jump switches between II and $H$. At a stopping leaf, begin with its terminal testing state and undo every zero-jump switch on that selected line. Thus for every composition this procedure is a bijection to histories with their terminal product states. It uses literally the same $T_x$ for all compositions.

#thm([Lemma 6.4.])[
  (Return to the anchors).  #emph[A nonempty terminal product state has label $x = x_mu = sum_(i = 1)^D mu_i d_i$ for a partition $mu tack.r N$, padded by zeroes. Keeping its total history fixed, it can be transported bijectively to an ordered tuple of anchor subsets of sizes $k_1 \, dots.h \, k_b$ and total exponent $x_mu$. Every such anchor tuple has energy zero.]
] <route:return>

#proof[
  In ordinary commuting variables $z_1 \, dots.h \, z_D$, expand
  #[#set math.equation(numbering: n => "(6.10)")
   $ product_(j = 1)^b e_(k_j) \( z \) = sum_(mu tack.r N) a_(bold(k) \, mu) m_mu \( z \) . $ <route:anchor-product>]
  The nonnegative integer $a_(bold(k) \, mu)$ is the number of ordered subsets of $\[ D \]$ of the specified sizes in which index $i$ occurs $mu_i$ times. By Theorem 32, the incoming coordinates of $P_(bold(k))$ are exactly these constants at $x_mu$ and zero elsewhere. A testing-chamber state therefore has one of these labels, and its total coefficient there is the constant $a_(bold(k) \, mu)$.
  The coefficient at the same pure label in $H_(-)$ is also $a_(bold(k) \, mu)$. Indeed the initial independent-set monomials have nonnegative vertex coordinates, so a tuple using a bridge cannot contribute to an exponent with every bridge coordinate zero. All remaining tuples use anchors, which are mutually independent and pair by zero. Their packet energies and cross-packet shifts are zero.
  Here is a transport of the states, rather than just an equality of their number. Fix a generic all-negative rational covector $h_(-)$. Within a sufficiently small neighborhood of the testing direction $V \( x \)$, move the terminal chamber to the chamber of $h_(-) + t V \( x \)$ for large $t$. Only hyperplanes with $Omega \( p \, x \) = 0$ can separate these two perturbations. Their packet switches have zero total jump by Proposition 35. Next follow $h_(-) + t V \( x \)$ down to $t = 0$. Every crossed positive root $p$ has $Omega \( p \, x \) > 0$, and the crossing is from positive to negative. At each crossing, the coefficient of $X_x$ gains only nonnegative contributions from lower exponents, with its old coefficient retained by the zero jump. Its starting and ending coefficients are the same constant $a_(bold(k) \, mu)$. Coefficientwise positivity forces every gain along this finite path to be zero.
  It follows that, in Equation (6.5) for these product states at $x$, only the zero-total-jump part occurs at every wall. The switches consequently give bijections all the way to the literal anchor tuples in $H_(-)$. Reversing the selected path gives the inverse. All intermediate choices can be fixed by the rational ordering above; they may use the composition but add no total jump to the recorded history. The history determines its terminal testing chamber, so the inverse loses no data. ◻
]

#thm([Proposition 6.5.])[
  (Formal degree bounds).  #emph[For every partition $mu tack.r N$, histories in $T_(x_mu)$ have 
#[#set math.equation(numbering: n => "(6.11)")
 $ - M lt.eq E \( t \) lt.eq M \, #h(2em) E \( t \) equiv M med \( mod med 2 \) . $ <route:parity-range>]

 Consequently $T_(x_mu)$ is finite, and $v^M \[ X_u \] Theta_(x_mu)^(H_(-))$ belongs to $bb(N) \[ q \]$ with $q = v^2$ and degree at most $M$.]
] <route:parity>

#proof[
  Equation (6.9) identifies the history enumerator with $\[ X_u \] Theta_(x_mu)^(H_(-))$. By Equation (5.22), this coefficient is $v^(- M) c_mu \( v^2 \)$, where $c_mu \( q \) in bb(N) \[ q \]$ has degree at most $M$. Its allowed powers of $v$ are therefore exactly among $- M \, - M + 2 \, dots.h \, M$. Histories have nonnegative multiplicities, so none can occur at any other energy. Each of these finitely many energy slices is finite by Lemma 34; hence their union $T_(x_mu)$ is finite as well. Multiplication by $v^M$ changes each history weight to $q^(\( E \( t \) + M \) \/ 2)$, proving the assertion. ◻
]

=== 6.4 Required masks and exact masks <route:masks>

For a permutation word $w = w_1 dots.h.c w_N$ on the indicated vertices, define its nonedge ascent mask by

$ cal(P)_G \( w \) = { j : w_j < w_(j + 1) \, med { w_j \, w_(j + 1) } in.not E \( G \) } . $

For a word $s = s_1 dots.h.c s_N$ on the labeled anchor indices $\[ D \]$, define its ascent mask by $cal(Q) \( s \) = { j : s_j < s_(j + 1) }$. For a subset $J subset.eq \[ N - 1 \]$, a #emph[required] mask means $J subset.eq cal(P)_G \( w \)$ or $J subset.eq cal(Q) \( s \)$; an #emph[exact] mask means equality. These are different conditions.

Place packet boundaries exactly at the complement of $J$. This gives a composition $bold(k) \( J \)$ of $N$. If $J subset.eq cal(P)_G \( w \)$, each packet is an increasing independent set. In fact, if successive letters $a < b$ in a packet satisfy $h \( a \) < b$, then every later letter $c gt.eq b$ also satisfies $h \( a \) < c$. Hence every pair in that packet is a nonedge. Conversely, an independent set in increasing order has precisely the required internal ascents. Product states at $u$ for this composition are therefore exactly the words with the required mask $J$. Their energies are

#[#set math.equation(numbering: n => "(6.12)")
 $ E \( w \) = 2 "inv"_G \( w \) - M \, $ <route:word-energy>]

since no edge is internal to a packet and Equation (6.1) counts every edge between packets.

At a terminal label $x_mu$, writing each anchor subset in increasing index order gives a word with multiplicities $\( mu_1 \, dots.h \, mu_D \)$ and with $J subset.eq cal(Q) \( s \)$. Lemma 37 and the history construction therefore give a computable bijection, with computable inverse,

#[#set math.equation(numbering: n => "(6.13)")
 $ B_J : { w : J subset.eq cal(P)_G \( w \) } arrow.r product.co_(mu tack.r N) { \( t \, s \) : t in T_(x_mu) \, med "mult" \( s \) = mu \, med J subset.eq cal(Q) \( s \) } . $ <route:required-bijection>]

It satisfies $E \( t \) = E \( w \)$. The target histories in this formula are the same for every $J$; only the permitted words $s$ change.

We convert the required-mask bijections to exact-mask bijections by finite bijective cancellation, in the spirit of the Garsia–Milne involution principle #cite(label("GM81")). The complete alternating-path argument below also supplies termination in both directions.

#thm([Lemma 6.6.])[
  (Exact-mask refinement).  #emph[For every $J subset.eq \[ N - 1 \]$ there is a computable energy-preserving bijection $Phi_J$ between the two sides of Equation (6.13) with their masks required to be #emph[exactly] $J$. Both directions terminate on every input.]
] <route:exact>

#proof[
  Construct the bijections in decreasing order of $\| J \|$, breaking ties by the fixed subset order. For an exact-$J$ input $w$, apply $B_J$. If its output $\( t \, s \)$ has exact mask $J$, stop. Otherwise put $K = cal(Q) \( s \) supset.neq J$, apply the already constructed inverse $Phi_K^(- 1)$, and apply $B_J$ again. Repeat this instruction. For the inverse procedure start at an exact-$J$ pair, apply $B_J^(- 1)$, and, whenever the resulting word has exact mask $K supset.neq J$, apply $Phi_K$ followed by $B_J^(- 1)$. Thus every nested call involves a strictly larger mask.
  To prove that the outer repetition terminates, fix its energy $E$. The required-$J$ source is finite, and its target is finite by Lemma 34 (also by Proposition 38). On their disjoint union draw the matching given by $B_J$. On the vertices whose exact masks strictly contain $J$, draw a second matching, the disjoint union of the already defined $Phi_K$ for $K supset.neq J$. Each vertex has one edge of the first matching, and either zero or one edge of the second. Distinct edges that happen to have the same endpoints are retained as distinct matching edges. Figure 2 illustrates the alternating path in their union.
  An exact-$J$ starting vertex is an endpoint of this finite graph. Its component is a path, not a cycle: all vertices have degree at most two, and a component containing a degree-one vertex cannot be a cycle. Following its alternating edges therefore never revisits a vertex and eventually reaches the other endpoint. A return edge of the second matching always lands at a source with a larger exact mask, where the first matching can be followed again. Consequently the other endpoint lies on the target side and has exact mask $J$. Reversing the same path is precisely the inverse procedure described above. Every edge preserves $E$, proving the claimed energy preservation as well as termination. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 1.3), [#box(inset: 0.1411cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$w:#h(0.3333em) J$]]])])
  content((2, 0), [#box(inset: 0.1411cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$(t_1,s_1):K_1$]]])])
  content((4, 1.3), [#box(inset: 0.1411cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$w_1:K_1$]]])])
  content((6, 0), [#box(inset: 0.1411cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$(t_2,s_2):K_2$]]])])
  content((8, 1.3), [#box(inset: 0.1411cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$w_2:K_2$]]])])
  content((10, 0), [#box(inset: 0.1411cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$(t,s):J$]]])])
  line((0.3839, 1.05), (1.539, 0.2999), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((1, 0.65), [#text(size: 9pt)[$B_J$]], anchor: "south", padding: 0.1176cm)
  line((2.461, 0.2999), (3.579, 1.027), stroke: (thickness: 0.8pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ")>", fill: black)))
  content((3, 0.65), [#text(size: 9pt)[$Phi_(K_1)^(-1)$]], anchor: "south", padding: 0.1176cm)
  line((4.421, 1.027), (5.539, 0.2999), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((5, 0.65), [#text(size: 9pt)[$B_J$]], anchor: "south", padding: 0.1176cm)
  line((6.461, 0.2999), (7.579, 1.027), stroke: (thickness: 0.8pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ")>", fill: black)))
  content((7, 0.65), [#text(size: 9pt)[$Phi_(K_2)^(-1)$]], anchor: "south", padding: 0.1176cm)
  line((8.421, 1.027), (9.539, 0.2999), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((9, 0.65), [#text(size: 9pt)[$B_J$]], anchor: "south", padding: 0.1176cm)
  content((5, -0.9), [#text(size: 9pt)[$K_i "supsetneq" J$ at every interior pair; endpoints have exact mask $J$.#linebreak()Solid: required-mask matching. Dashed: larger exact-mask matching.]])
})],
  caption: [Figure 2: The exact-mask algorithm follows a finite alternating path. An endpoint cannot enter a cycle in the union of two matchings. ],
) <route:matching-figure>

=== 6.5 The partition assigned to a word <route:algorithm>

Let $cal(A)_G = { w : cal(P)_G \( w \) = diameter }$ be the admissible domain. For $w in cal(A)_G$, compute

$ Phi_diameter \( w \) = \( t \, s \) \, #h(2em) t in T_(x_mu) \, #h(2em) Lambda_G \( w \) = mu . $

The finite algorithm on an individual input has four steps.

+ Construct the triangular embedding and finite cone interval, and fix the common rational path representatives for every required $\( H \, y \)$ before choosing any packet composition.
+ For each required mask encountered, form its packets and evaluate $B_J$ through the local packet switches, common histories, and return to anchor subsets. Positive and negative packets use the two directions of the local switch, although the total jump has the positive sign.
+ Evaluate $Phi_diameter$ by the exact-mask recursion in Lemma 39, following its alternating walk until the output has exact empty mask.
+ Read the multiplicities of the resulting weakly decreasing anchor word as the partition $Lambda_G \( w \)$.

Nested calls strictly increase mask size, while each outer repetition follows an endpoint path in the finite union of two matchings. Thus the call depth is bounded and each alternating walk terminates. There is no need to enumerate the final fibers of $Lambda_G$ or to supply the final elementary coefficients. Section 7 gives the reversal for the original input convention. If the input is supplied in the insertion digits of Lemma 3, first decode those digits by largest-vertex insertions. The construction then uses the resulting admissible word. Empty input is assigned the empty partition.

#thm([Theorem 6.7.])[
  (Permutation witness).  #emph[For every naturally labeled unit interval graph $G$, the preceding finite rule assigns a partition $Lambda_G \( w \) tack.r n$ to each $w in cal(A)_G$ and satisfies the formal polynomial identity 
#[#set math.equation(numbering: n => "(6.14)")
 $ X_G \( X \; q \) = sum_(w in cal(A)_G) q^("inv"_G \( w \)) e_(Lambda_G \( w \)) \( X \) . $ <route:witness-identity>]

 In particular, every elementary coefficient is in $bb(N) \[ q \]$ and has degree at most $\| E \( G \) \|$.]
] <route:witness>

#proof[
  For any padded partition $mu$, exactly one word of multiplicities $\( mu_1 \, dots.h \, mu_D \)$ has no strict ascent: the weakly decreasing word. This remains true when parts of $mu$ repeat, since the anchor indices themselves are distinct labels. Consequently $Phi_diameter$ identifies the individual words of shape $mu$ with $T_(x_mu)$. Energy preservation, Equation (6.12), and Equation (6.9) give
  $ sum_(w in cal(A)_G\
Lambda_G \( w \) = mu) v^(2 "inv"_G \( w \) - M) = sum_(t in T_(x_mu)) v^(E \( t \)) = \[ X_u \] Theta_(x_mu)^(H_(-)) = \[ X_u \] m_mu \( Y \) . $
  Multiply by $v^M$. The conversion $q = v^2$ is legitimate as a formal polynomial conversion by Proposition 38, including both its parity and its degree bounds. The coefficient identity of Proposition 5 now identifies the right side with $\[ e_mu \] X_G \( X \; q \)$. This proves the identity for each shape and hence Equation (6.14). The algorithms producing $Lambda_G \( w \)$ use only elementary packets and local wall jumps; the coefficient identity certifies their output. ◻
]

== 7 The chromatic expansion <main:completion>

We return to the original graph and its graph-nondescent permutations.

#proof[
  Choose the triangular embedding of Lemma 25, and fix the rational generic choices and finite local orders in Section 6 by the enumeration specified there. Theorem 40 gives a terminating map $Lambda_G : cal(A)_G arrow.r { lambda : lambda tack.r n }$ with
  $ sum_(w in cal(A)_G\
Lambda_G \( w \) = lambda) q^("inv"_G \( w \)) = \[ e_lambda \] X_G \( X \; q \) = c_lambda \( q \) . $
  For $sigma in D_G^0$ define
  $ theta_G \( sigma \) = Lambda_G \( "reverse" sigma \) . $
  By Lemma 3, reversal gives the required input to $Lambda_G$ and complements graph inversions. Lemma 7 then gives, for every $lambda$,
  $ sum_(sigma in D_G^0\
theta_G \( sigma \) = lambda) q^("ginv"_G \( sigma \)) = q^M c_lambda \( q^(- 1) \) = c_lambda \( q \) . $
  Together with $X_G = chi_G$, this proves Equation (1.2). Every coefficient is the generating polynomial of a finite set, so it belongs to $bb(N) \[ q \]$. All choices and all recursions are finite procedures for each input. For $n = 0$, take the empty graph, the empty permutation and the empty partition. ◻
]

#prodef([Remark 7.1.])[
  (Scope of the algorithm).  The map uses the graph, the input permutation, finite wall recursions and local coefficient indexings. The elementary coefficient list is not supplied to it. The result proves termination, but gives no polynomial-time bound. The construction is a mathematical algorithm based on finite rational arithmetic and ordered finite sets.
]


#bibliography("refs.bib", style: "ieee", title: [References])
