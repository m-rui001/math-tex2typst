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

#align(center)[#text(size: 16pt, weight: "bold")[Unitarizability implies amenability for discrete groups]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

A representation $pi : G arrow.r upright("GL") \( H \)$ of a discrete group on a complex Hilbert space is #emph[uniformly bounded] if

$ \| pi \| := sup_(g in G) ∥pi \( g \)∥ < oo . $

Here $upright("GL") \( H \)$ consists of the bounded invertible operators. The representation is #emph[unitarizable] if some bounded invertible $S$ makes every $S pi \( g \) S^(- 1)$ unitary. Equivalently, the Hilbert space admits an equivalent inner product invariant under the representation. A group is unitarizable when every uniformly bounded representation on every complex Hilbert space is unitarizable. The similarity may depend on the representation; its condition number $∥S∥ ∥S^(- 1)∥$ is not assumed to have a common bound.

A discrete group $G$ is #emph[amenable] if there is a positive linear functional $m : ell^oo \( G \) arrow.r bb(C)$ with $m \( 1 \) = 1$ and $m \( L_g f \) = m \( f \)$, where $\( L_g f \) \( x \) = f \( g^(- 1) x \)$. The one-operator case goes back to Sz.-Nagy: an invertible operator whose integer powers are uniformly bounded is similar to a unitary operator #cite(label("SzNagy1947")) Theorem I. His generalized-limit construction of an invariant inner product preceded the invariant-mean argument of Day and Dixmier #cite(label("Day1950")) #cite(label("Dixmier1950")). Thus amenability implies unitarizability. Dixmier explicitly asked whether this property characterizes groups admitting an invariant mean #cite(label("Dixmier1950")) §5, p. 221. The question asks whether changing the Hilbert norm separately for every uniformly bounded representation already forces the existence of such a mean.

#thm([Theorem 1.1.])[
  #emph[A discrete group is amenable if and only if it is unitarizable. For every discrete nonamenable group $G$ and every $epsilon > 0$, there are a complex Hilbert space $cal(K)$ and a representation $pi : G arrow.r upright("GL") \( cal(K) \)$ with $\| pi \| lt.eq 1 + epsilon$ that is not similar to a unitary representation. If $G$ is countable, $cal(K)$ may be chosen separable.]
] <thm:main>

We work in ZFC. All Hilbert spaces below are complex, and $bb(N) = { 1 \, 2 \, dots.h }$. The main point is the absence of a similarity for one representation, without any a priori control on possible similarities. For an uncountable group the induced witness may be nonseparable, as is allowed by the definition of unitarizability used here.

=== Prior work and the remaining obstruction <prior-work-and-the-remaining-obstruction>

Early counterexamples showed that uniform boundedness alone does not force unitarizability. Ehrenpreis and Mautner constructed examples for the locally compact group $upright("SL")_2 \( bb(R) \)$ #cite(label("EhrenpreisMautner1955")); explicit families for free groups include those of Pytlik and Szwarc #cite(label("PytlikSzwarc1986")). Nonunitarizability passes from a subgroup to the ambient group by induction. The free-group examples therefore cover groups containing nonabelian free subgroups, but leave nonamenable groups without such subgroups to be understood.

Quantitative unitarizability gives one route to amenability. Pisier proved that a discrete group $G$ is amenable exactly when there are constants $C$ and $alpha < 3$, depending only on $G$, such that every uniformly bounded representation admits a unitarizer with condition number at most $C \| pi \|^alpha$ #cite(label("Pisier1998")) Theorem 0.1. The estimate is uniform over all Hilbert spaces and representations of the fixed group. Unitarizability itself implies a polynomial bound of this form for some finite exponent #cite(label("Pisier2004")) Theorem 4.1; the additional content of the amenability criterion is the threshold $alpha < 3$.

Random forests gave a route beyond free subgroups. Epstein and Monod used invariant random forests to relate unitarizability to $ell^2$-Betti numbers and cost. Their estimates imply nonunitarizability for residually finite groups with positive first $ell^2$-Betti number, and for finitely generated residually finite groups of cost greater than one #cite(label("EpsteinMonod2009")) Theorems 1.1–1.3. Combining their criterion with group constructions, Osin obtained finitely generated torsion and torsion-free nonunitarizable groups containing no nonabelian free subgroup #cite(label("Osin2009")) Theorems 1.2–1.3.

A different approach uses measurable actions. Gaboriau and Lyons showed that a Bernoulli action of a countable nonamenable group contains, within its orbits, those of an essentially free probability-preserving action of the free group $F_2$ #cite(label("GaboriauLyons2009")) Theorem 1. Monod and Ozawa used this to show that, for an infinite abelian group $A$, the restricted wreath product $A wreath G = \( xor.big_G A \) times.r G$ is unitarizable exactly when $G$ is amenable #cite(label("MonodOzawa2010")) Theorem 1. This places the obstruction on an extension of $G$. Alpeev subsequently allowed every nontrivial countable lamp group $A$ when $G$ is countable and nonamenable, so the conclusion also holds for finite lamps #cite(label("Alpeev2023")) Theorem A. The distinction remains between a witness for an extension and one for $G$ itself.

Approximation properties give a complementary route. Vergara proved that a discrete unitarizable group satisfying the $M_d$-approximation property for every $d gt.eq 2$ is amenable. These conditions hold for countable groups acting properly on finite-dimensional CAT(0) cube complexes #cite(label("Vergara2023")) Theorems 1.2–1.3. His later extension theorem preserves $M_d$-AP when both a normal subgroup and the quotient possess it #cite(label("Vergara2025")) Theorem 1.3.

Littlewood functions give the analytic formulation closest to the present proof. Their scalar convolution kernels split into a part with uniformly absolutely summable rows and a part with uniformly absolutely summable columns. Epstein and Monod, following Bożejko and Fendler, use this splitting to obtain bounded commutators and triangular representations #cite(label("EpsteinMonod2009")) Propositions 2.3–2.4. Gerasimova, Gruber, Monod and Thom relate the corresponding norms to Cheeger constants and study the resulting restrictions on unitarizable groups #cite(label("GGMT2018")) §2.B. The passage from bounded non-inner operator cocycles to nonunitarizable representations is classical #cite(label("MonodOzawa2010")) §2, #cite(label("Pisier2011")) Remark 4 and Proposition 5(ii). The present construction retains that mechanism while allowing finite-dimensional matrix coefficients. Positive rank-one weights preserve the row and column bounds while increasing the kernel’s Hilbert–Schmidt energy relative to the fibre dimension. This gives a direct obstruction with no prescribed bound on possible unitarizers.

The passage from countable groups to arbitrary discrete groups uses standard facts. Følner’s finite-set criterion implies that every nonamenable discrete group has a finitely generated nonamenable subgroup #cite(label("Folner1955")) Main Theorem, p. 245. Induction carries a nonunitarizable representation of that subgroup to the full group with the same uniform bound #cite(label("Pisier2004")) Proposition 0.5; Pisier’s Corollaries 0.10–0.11 also show that unitarizability of discrete groups is countably determined.

=== The operator obstruction and the proof <the-operator-obstruction-and-the-proof>

Let $U$ be a unitary representation of $G$ on a Hilbert space $cal(H)$, and write $cal(B) \( cal(H) \)$ for its bounded operators. A bounded operator cocycle is a map $D : G arrow.r cal(B) \( cal(H) \)$ with $sup_g ∥D \( g \)∥ < oo$ and

$ D \( g h \) = D \( g \) + U \( g \) D \( h \) U \( g \)^(- 1) . $

It is #emph[inner] if one bounded operator $B$ satisfies $D \( g \) = B - U \( g \) B U \( g \)^(- 1)$ for all $g$. The cocycle gives the uniformly bounded triangular representation

$ pi \( g \) = mat(delim: "(", U \( g \), D \( g \) U \( g \); 0, U \( g \)) . $

A similarity making this representation unitary would produce an invariant complement to $cal(H) xor 0$. Writing that complement as the graph of a bounded operator makes $D$ inner. Thus it suffices to construct a bounded cocycle with no bounded implementer.

The criterion in 2 reduces this task to operators $T_j$ on $ell^2 \( G \; bb(C)^(k_j) \)$. Their conjugation differences under left translation must be bounded uniformly in both $j$ and $g$, while their distance from the operators commuting with left translation must tend to infinity. A translation-invariant comparison operator $A_j$, with blocks $A_j \[ x \, y \] = W_j \( x^(- 1) y \)$, detects that distance: if the block row at $e$ of $T_j$ and the block column at $e$ of $A_j - T_j$ have norm at most $K$, then

$ "dist" \( T_j \, U_j \( G \)' \) gt.eq 1 / 2 (frac(sum_(s in G) ∥W_j \( s \)∥_(upright("HS"))^2, k_j))^(1 \/ 2) - K . $

Here $U_j$ is left translation, $U_j \( G \)'$ is its commutant, and $∥W∥_(upright("HS"))^2 = "Tr" \( W^(*) W \)$ uses the unnormalized trace. This estimate compares one finite-dimensional row with one finite-dimensional column; it imposes no bound on $∥T_j∥$.

Nonamenability supplies the operators in two steps. In 3, a contracting finite average gives lists $s_1 \, dots.h \, s_n$ of group elements, with multiplicity. For $x in G$ and $1 lt.eq i lt.eq n$, the labelled edge $\( x \, i \)$ joins row $x$ to column $x s_i$. These edges can be assigned to their endpoints so that each endpoint receives at most $r$ edges, where $\( r \/ n \) log n arrow.r 0$. Compare an assignment with any left translate. At a row, the edges whose assignment changes lie in the two sets assigned to that row; at a column, they lie in the two sets assigned to that column. Thus at most $2 r$ labels change at either endpoint. In 4, we choose $n$ unit vectors in $bb(C)^k$, with $k$ of order $r log n$, whose synthesis operators have bounded norm on every subfamily of at most $2 r$ vectors. This is the concentration, finite-net and union-bound method familiar from random matrix estimates; compare #cite(label("BDDW2008")) Section 5. Only its upper norm bound is needed here.

The rank-one projections onto these vectors weight the convolution edges, and $T_j$ retains the row-assigned edges. Factoring through the scalar Hilbert space indexed by the edges bounds the relevant rows, columns and all conjugation differences. Keeping the edge labels is essential: distinct products may coincide in $G$, yet correspond to distinct coordinates in the factorization. Positivity ensures that such coincidences do not reduce the kernel energy, which is at least $n$. Since $k \/ n arrow.r 0$, the distance estimate diverges. Finally, 5 rescales these operators and applies the obstruction to one direct sum of their cocycles, giving any prescribed uniform bound $1 + epsilon$. Induction passes the witness from a finitely generated nonamenable subgroup to an arbitrary discrete group. The Day–Dixmier averaging argument completes the equivalence. 6 then uses the separate companion similarity theorem to show that the resulting $ell^1 \( G \)$-representations have no bounded algebra-homomorphism extension to either group $C^(*)$-algebra.

== 2 An invariant-kernel obstruction <sec:obstruction>

We first prove the criterion announced in the introduction. A large Hilbert–Schmidt energy will force an operator far from the translation commutant; a sequence of such operators with uniformly bounded conjugation differences will then give one bounded non-inner cocycle. Write $cal(B) \( H \)$ for the bounded operators on $H$ and $∥X∥_(upright("HS"))^2 = "Tr" \( X^(*) X \)$ for the Hilbert–Schmidt norm of a finite matrix, with the unnormalized trace $"Tr"$. All operator norms below are ordinary Hilbert-space operator norms. The finite-dimensional fibres will enter through Hilbert–Schmidt estimates for one block row and one block column.

For a countable group $G$ and a positive integer $k$, put

$ cal(H)_k = ell^2 \( G \; bb(C)^k \) \, #h(2em) \( U_k \( g \) xi \) \( x \) = xi \( g^(- 1) x \) . $

For $x in G$, let $iota_x : bb(C)^k arrow.r cal(H)_k$ be the isometric inclusion into the coordinate indexed by $x$. For $F in cal(B) \( cal(H)_k \)$, write

$ F \[ x \, y \] = iota_x^(*) F iota_y \, #h(2em) "row"_e \( F \) = iota_e^(*) F \, #h(2em) "col"_e \( F \) = F iota_e . $

Thus a block row has codomain $bb(C)^k$ and a block column has domain $bb(C)^k$. Write $U_k \( G \)'$ for the bounded operators commuting with every $U_k \( g \)$. If $F in U_k \( G \)'$, then $F \[ x \, y \] = F \[ g^(- 1) x \, g^(- 1) y \]$, because $U_k \( g \) iota_y = iota_(g y)$. Taking $g = x$ gives

$ F \[ x \, y \] = V \( x^(- 1) y \) \, #h(2em) V \( s \) = F \[ e \, s \] . $

This statement concerns the blocks of a bounded operator and requires no summability assumption on a convolution formula.

#thm([Lemma 2.1.])[
  (Distance from the translation commutant).  #emph[Let $G$ be a countable group, let $k$ be a positive integer, and let $A \, T in cal(B) \( cal(H)_k \)$ with $A in U_k \( G \)'$. Write 
$ A \[ x \, y \] = W \( x^(- 1) y \) \, #h(2em) E = sum_(s in G) ∥W \( s \)∥_(upright("HS"))^2 . $

 Suppose that, for some $K gt.eq 0$, 
$ ∥"row"_e \( T \)∥ lt.eq K \, #h(2em) ∥"col"_e \( A - T \)∥ lt.eq K . $

 Then $E$ is finite and, for every $C in U_k \( G \)'$, 
#[#set math.equation(numbering: n => "(2.1)")
 $ E lt.eq 4 k #scale(x: 120%, y: 120%)[\(] K + ∥T - C∥ #scale(x: 120%, y: 120%)[\)]^2 . $ <eq:kernel-energy-obstruction>]

 Consequently, 
#[#set math.equation(numbering: n => "(2.2)")
 $ "dist" #scale(x: 120%, y: 120%)[\(] T \, U_k \( G \)' #scale(x: 120%, y: 120%)[\)] gt.eq 1 / 2 sqrt(E / k) - K \, $ <eq:kernel-distance-obstruction>]

 where $"dist" \( T \, U_k \( G \)' \) = inf_(C in U_k \( G \)') ∥T - C∥$.]
] <lem:kernel-obstruction>

#proof[
  Fix $C in U_k \( G \)'$, and put
  $ B = T - C \, #h(2em) h = K + ∥B∥ \, #h(2em) Q \( s \) = C \[ e \, s \] . $
  The kernel identity above gives $C \[ x \, y \] = Q \( x^(- 1) y \)$. Since $C = T - B$, the operator
  $ R = "row"_e \( C \) : cal(H)_k arrow.r bb(C)^k $
  has norm at most $h$. Any bounded operator with codomain $bb(C)^k$ is Hilbert–Schmidt and has squared Hilbert–Schmidt norm at most $k$ times its squared operator norm: indeed,
  $ ∥R∥_(upright("HS"))^2 = "Tr" \( R R^(*) \) lt.eq k ∥R∥^2 . $
  Computing this norm using the coordinate orthonormal basis of $cal(H)_k$ therefore gives
  #[#set math.equation(numbering: n => "(2.3)")
   $ sum_(s in G) ∥Q \( s \)∥_(upright("HS"))^2 = ∥R∥_(upright("HS"))^2 lt.eq k h^2 . $ <eq:kernel-row-energy>]
  On the other hand, $A - C = \( A - T \) + B$, so
  $ L = "col"_e \( A - C \) : bb(C)^k arrow.r cal(H)_k $
  also has norm at most $h$. Its domain has dimension $k$, whence
  $ ∥L∥_(upright("HS"))^2 = "Tr" \( L^(*) L \) lt.eq k ∥L∥^2 lt.eq k h^2 . $
  The block of this column at row $x$ is
  $ \( A - C \) \[ x \, e \] = W \( x^(- 1) \) - Q \( x^(- 1) \) . $
  Inversion is a bijection of $G$; computing the Hilbert–Schmidt norm by blocks and reindexing therefore gives
  #[#set math.equation(numbering: n => "(2.4)")
   $ sum_(s in G) ∥W \( s \) - Q \( s \)∥_(upright("HS"))^2 = ∥L∥_(upright("HS"))^2 lt.eq k h^2 . $ <eq:kernel-column-energy>]
  In both computations, the sum of the squared block norms is exactly the sum of squared matrix coefficients defining the Hilbert–Schmidt norm. The group is countable, and all these summands are nonnegative.
  By (2.3), (2.4), both $Q$ and $W - Q$ are square summable in the Hilbert–Schmidt norm. The triangle inequality for these coefficient families gives
  $ (sum_(s in G) ∥W \( s \)∥_(upright("HS"))^2)^(1 \/ 2) lt.eq sqrt(k) thin h + sqrt(k) thin h = 2 sqrt(k) thin h . $
  This proves finiteness of $E$ and (2.1). Rearranging that inequality and then taking the infimum over $C$ proves (2.2). ◻
]

The next proposition turns an unbounded sequence of these distances into one uniformly bounded representation that cannot be unitarized. The relation between bounded operator cocycles and triangular representations is standard; see #cite(label("EpsteinMonod2009")) Proposition 2.4, #cite(label("MonodOzawa2010")) Section 2, and #cite(label("Pisier2011")) Remark 4 and Proposition 5(ii). We include the argument, in particular the bounded-complement step and the direct-sum quantifiers.

#thm([Proposition 2.2.])[
  (Direct-sum obstruction).  #emph[Let $G$ be a countable group. For each $j in bb(N)$, let $k_j$ be a positive integer, put 
$ cal(H)_j = ell^2 \( G \; bb(C)^(k_j) \) \, #h(2em) \( U_j \( g \) xi \) \( x \) = xi \( g^(- 1) x \) \, $

 and let $A_j \, T_j in cal(B) \( cal(H)_j \)$ with $A_j in U_j \( G \)'$. Write 
$ A_j \[ x \, y \] = W_j \( x^(- 1) y \) \, #h(2em) E_j = sum_(s in G) ∥W_j \( s \)∥_(upright("HS"))^2 . $

 Suppose that one constant $K gt.eq 0$ satisfies 
$ ∥"row"_e \( T_j \)∥ & lt.eq K \, & ∥"col"_e \( A_j - T_j \)∥ & lt.eq K &  & \( j in bb(N) \) \,\
∥T_j - U_j \( g \) T_j U_j \( g \)^(- 1)∥ & lt.eq K &  &  &  & \( j in bb(N) \, med g in G \) . $

 Assume also that 
$ E_j / k_j arrow.r oo . $

 Then $G$ has a representation on a separable complex Hilbert space whose operators are bounded and invertible, with 
$ sup_(g in G) ∥pi \( g \)∥ lt.eq 1 + K \, $

 and which is not similar to a unitary representation. No uniform bound on $∥T_j∥$ or $∥A_j∥$ is assumed.]
] <prop:direct-sum-obstruction>

#proof[
  On the Hilbert direct sum
  $ cal(H) = xor.big_(j in bb(N)) cal(H)_j $
  define
  $ U \( g \) = xor.big_(j in bb(N)) U_j \( g \) \, #h(2em) D_j \( g \) = T_j - U_j \( g \) T_j U_j \( g \)^(- 1) \, #h(2em) D \( g \) = xor.big_(j in bb(N)) D_j \( g \) . $
  The operator $U \( g \)$ is unitary and $∥D \( g \)∥ lt.eq K$ by the hypotheses. Thus these direct sums are bounded operators on all of $cal(H)$. No bounded operator $xor.big_j T_j$ is needed. Each $cal(H)_j$ is separable because $G$ is countable and $k_j$ is finite; consequently $cal(H)$ and $cal(H) xor cal(H)$ are separable.
  Expanding the definition of $D_j$ gives
  $ D_j \( g h \) = D_j \( g \) + U_j \( g \) D_j \( h \) U_j \( g \)^(- 1) . $
  Taking bounded direct sums gives the cocycle identity
  #[#set math.equation(numbering: n => "(2.5)")
   $ D \( g h \) = D \( g \) + U \( g \) D \( h \) U \( g \)^(- 1) #h(2em) \( g \, h in G \) . $ <eq:direct-sum-cocycle>]
  Define an operator on $cal(H) xor cal(H)$ by
  #[#set math.equation(numbering: n => "(2.6)")
   $ pi \( g \) = mat(delim: "(", U \( g \), D \( g \) U \( g \); 0, U \( g \)) . $ <eq:triangular-representation>]
  By (2.5), its upper-right block satisfies
  $ D \( g h \) U \( g h \) = D \( g \) U \( g \) U \( h \) + U \( g \) D \( h \) U \( h \) . $
  Multiplication of block matrices now shows $pi \( g \) pi \( h \) = pi \( g h \)$. Also $D \( e \) = 0$, so $pi \( e \) = upright(bold(1))$. It follows that each $pi \( g \)$ is invertible, with $pi \( g \)^(- 1) = pi \( g^(- 1) \)$. The factorization
  $ pi \( g \) = mat(delim: "(", upright(bold(1)), D \( g \); 0, upright(bold(1))) mat(delim: "(", U \( g \), 0; 0, U \( g \)) $
  has a unitary second factor, whereas the first factor is the identity plus an operator of norm $∥D \( g \)∥$. Therefore $∥pi \( g \)∥ lt.eq 1 + ∥D \( g \)∥ lt.eq 1 + K$ for every $g$.
  Suppose, for a contradiction, that a bounded invertible operator $S$ makes $V \( g \) = S pi \( g \) S^(- 1)$ unitary for all $g in G$. The closed subspace $M = cal(H) xor 0$ is invariant under every $pi \( g \)$ and its inverse. Consequently $S M$ is closed and invariant under every $V \( g \)$ and its inverse, so $\( S M \)^perp$ is also invariant. The subspace
  $ N = S^(- 1) #scale(x: 120%, y: 120%)[\(] \( S M \)^perp #scale(x: 120%, y: 120%)[\)] $
  is thus a closed invariant complement of $M$: $cal(H) xor cal(H) = M plus.dot N$.
  Let $P_1 \, P_2 : cal(H) xor cal(H) arrow.r cal(H)$ be the coordinate projections. The restriction $P_2 \|_N : N arrow.r cal(H)$ is injective, because $N ∩ M = 0$, and surjective, because every $\( 0 \, eta \)$ has a decomposition into an element of $M$ and an element of $N$. It is a bounded bijection between Banach spaces, hence has bounded inverse. Therefore
  $ B = P_1 \( P_2 \|_N \)^(- 1) in cal(B) \( cal(H) \) \, #h(2em) N = { \( B eta \, eta \) : eta in cal(H) } . $
  Applying $pi \( g \)$ to this graph and using its invariance gives
  $ U \( g \) B eta + D \( g \) U \( g \) eta = B U \( g \) eta #h(2em) \( eta in cal(H) \) . $
  Since $U \( g \)$ is invertible, this is equivalent to
  #[#set math.equation(numbering: n => "(2.7)")
   $ D \( g \) = B - U \( g \) B U \( g \)^(- 1) . $ <eq:global-cocycle-implementer>]
  Let $I_j : cal(H)_j arrow.r cal(H)$ be the canonical isometric inclusion, and set $B_j = I_j^(*) B I_j$. The summand $cal(H)_j$ reduces every $U \( g \)$, so
  $ I_j^(*) U \( g \) B U \( g \)^(- 1) I_j = U_j \( g \) B_j U_j \( g \)^(- 1) . $
  Compressing (2.7) therefore yields
  $ D_j \( g \) = B_j - U_j \( g \) B_j U_j \( g \)^(- 1) \, #h(2em) ∥B_j∥ lt.eq ∥B∥ . $
  This compression does not require $B$ to preserve the summands. Comparison with the definition of $D_j$ shows that
  $ C_j = T_j - B_j in U_j \( G \)' . $
  Apply 2 to $A_j \, T_j$ and this choice of $C_j$. Its energy estimate gives, for every $j$,
  $ E_j lt.eq 4 k_j #scale(x: 120%, y: 120%)[\(] K + ∥B_j∥ #scale(x: 120%, y: 120%)[\)]^2 lt.eq 4 k_j #scale(x: 120%, y: 120%)[\(] K + ∥B∥ #scale(x: 120%, y: 120%)[\)]^2 . $
  This contradicts $E_j \/ k_j arrow.r oo$, because $B$ is one bounded operator. Hence the representation in (2.6) is not similar to a unitary representation. ◻
]

For clarity, each individual $D_j$ in this construction is already implemented by the bounded operator $T_j$. The obstruction is to a bounded implementer on the whole direct sum. Indeed, 2 shows that any operator $B_j$ satisfying $D_j \( g \) = B_j - U_j \( g \) B_j U_j \( g \)^(- 1)$ for all $g$ must obey

$ ∥B_j∥ gt.eq 1 / 2 sqrt(E_j / k_j) - K . $

Thus the proof requires only the existence of a similarity for one representation in order to obtain a contradiction; it assumes no uniform bound on similarity operators across different representations.

== 3 Sparse assignments from nonamenability <sec:sparse>

The obstruction requires uniform operator bounds together with increasing energy per fibre dimension. This section supplies its combinatorial input: a list of convolution edges that can be assigned to their endpoints with small loads. The matrix weights in 4 will convert those loads into operator bounds.

Write $\( R_t f \) \( x \) = f \( x t \)$ for right translation on $ell^2 \( G \)$. Thus $R_s R_t = R_(s t)$. We first obtain the finite averaging operator needed for the construction. This is the elementary averaging-norm form of the random-walk criterion for nonamenability; compare #cite(label("Kesten1959")). We give the implication at the precise strength used here.

#thm([Lemma 3.1.])[
  #emph[If $G$ is a nonamenable discrete group, there are a finite set $S subset G$ containing $e$, with $d = \| S \| gt.eq 2$, and a number $0 < rho < 1$ such that 
$ ∥1 / d sum_(t in S) R_t∥ lt.eq rho . $

]
] <lem:contracting-average>

#proof[
  Every such average is a contraction. Suppose all have norm one. For a unit vector $f$ and a finite $S$ of cardinality $d$,
  $ ∥1 / d sum_(t in S) R_t f∥_2^2 = 1 - frac(1, 2 d^2) sum_(t \, t' in S) ∥R_t f - R_(t') f∥_2^2 . $
  Taking vectors on which the average has norm arbitrarily close to one, and using $e in S$, gives unit vectors arbitrarily close to invariant under any prescribed finite set of right translations.
  For each such vector define the mean
  $ m_f \( b \) = sum_(x in G) \| f \( x \) \|^2 b \( x^(- 1) \) \, #h(2em) b in ell^oo \( G \) . $
  Changing variables $y = x g$ gives $m_f \( L_g b \) = m_(R_(g^(- 1)) f) \( b \)$. The Cauchy–Schwarz inequality yields
  $ \| m_f \( L_g b \) - m_f \( b \) \| lt.eq 2 ∥b∥_oo ∥R_(g^(- 1)) f - f∥_2 . $
  Direct the finite translation tests and their positive error tolerances by refinement. A weak-star cluster point of the resulting means exists by compactness of the dual unit ball. It is positive, normalized, and left invariant by the displayed estimate. This contradicts nonamenability. Some average therefore has norm less than one; choose $rho$ between its norm and one. The set has at least two elements, since the average for ${ e }$ is the identity. ◻
]

The next argument converts an operator-norm estimate into an assignment of edges with bounded loads at their endpoints. It is related to the rectangular kernel estimates for Littlewood functions #cite(label("GGMT2018")) Proposition 2.6; we include the complete assignment argument and retain all multiplicities. The conversion from endpoint assignments to row–column bounds also parallels the forest orientation in #cite(label("EpsteinMonod2009")) Propositions 2.3–2.4.

#thm([Proposition 3.2.])[
  #emph[Let $G$ be countable and nonamenable, and fix $S \, d \, rho$ as in 4. For every $ell gt.eq 1$, list the products of $ell$ elements of $S$, with multiplicity, as $s_1 \, dots.h \, s_n$, where $n = d^ell$, and put $r = ceil.l n rho^ell ceil.r$. There is a function $a : G times { 1 \, dots.h \, n } arrow.r { 0 \, 1 }$ such that 
#[#set math.equation(numbering: n => "(3.1)")
 $ \# { i : a \( x \, i \) = 1 } lt.eq r quad \( x in G \) \, #h(2em) \# { i : a \( y s_i^(- 1) \, i \) = 0 } lt.eq r quad \( y in G \) . $ <eq:sparse-mask>]

]
] <prop:sparse-splitting>

#proof[
  The product list satisfies
  $ sum_(i = 1)^n R_(s_i) = (sum_(t in S) R_t)^ell \, #h(2em) ∥sum_(i = 1)^n R_(s_i)∥ lt.eq n rho^ell . $
  Consider a bipartite multigraph with row and column vertices in disjoint copies of $G$. Its labelled edge $\( x \, i \)$ joins row $x$ to column $x s_i$. For finite row and column sets $U \, V$, pairing the convolution operator with their indicator functions gives
  #[#set math.equation(numbering: n => "(3.2)")
   $ \# { \( x \, i \) : x in U \, med x s_i in V } lt.eq n rho^ell sqrt(\| U \| \| V \|) . $ <eq:edge-count>]
  Give each vertex $r$ distinct slots. We match every labelled edge to one slot at one of its two endpoints. For a finite edge set $F$, let $U \, V$ be its endpoint sets. Its neighboring slots number $r \( \| U \| + \| V \| \)$, whereas (3.2) gives
  $ \| F \| lt.eq n rho^ell sqrt(\| U \| \| V \|) lt.eq r / 2 \( \| U \| + \| V \| \) lt.eq r \( \| U \| + \| V \| \) . $
  This applies to every finite edge set and hence verifies Hall’s condition for every finite family of edges and all its subfamilies. For completeness, the finite form of Hall’s marriage theorem #cite(label("Hall1935")) follows here by augmenting paths. Take a matching of maximum cardinality for a finite family. If an edge-vertex remains unmatched, follow alternating paths from it. A reachable unmatched slot allows an augmentation. Otherwise every reachable slot is matched to a reachable edge-vertex other than the initial one. All neighbors of the reachable edge-vertices are reachable slots, contradicting Hall’s inequality. Hence every finite family has an injective slot assignment.
  Enumerate the countable edge set. The assignments for its finite initial segments form a tree under restriction, with a node at every depth and at most $2 r$ extensions of each node. Starting at the root, choose at each step a child with descendants at arbitrarily large depths; one exists because there are finitely many children. The resulting infinite branch supplies a simultaneous assignment. Set $a \( x \, i \) = 1$ when the edge is assigned to its row and zero when it is assigned to its column. No vertex receives more than $r$ edges, proving (3.1). Parallel edges remain distinct throughout the matching, and the two endpoints remain distinct vertices even if $s_i = e$. ◻
]

== 4 Finite-dimensional weights and sparse block operators <sec:weights>

The sparse assignment from 3 will now produce the three bounds required by 3: a bound on each block row of $T$, each block column of $A - T$, and every conjugation difference $T - U \( g \) T U \( g \)^(- 1)$. All three bounds will be independent of the number of labels. To make the energy grow faster than the fibre dimension, we use rank-one projections onto many unit vectors in a smaller space.

We first construct vectors whose synthesis operators are bounded on every small subfamily. The proof uses the standard concentration, finite-net and union-bound method for random matrices; compare #cite(label("BDDW2008")) Section 5. Here only an upper bound is needed, and the argument below supplies its constants directly.

#thm([Lemma 4.1.])[
  (An upper bound for all small subfamilies).  #emph[Let $n gt.eq 2$ and $r gt.eq 1$ be integers, and put 
#[#set math.equation(numbering: n => "(4.1)")
 $ p = min \( 2 r \, n \) \, #h(2em) k = ⌈2 r log \( 2 n \)⌉ \, #h(2em) b_0 = 10 \, $ <eq:frame-parameters>]

 where $log$ denotes the natural logarithm. There are unit vectors $v_1 \, dots.h \, v_n in bb(C)^k$ such that, for every $J subset.eq { 1 \, dots.h \, n }$ with $\| J \| lt.eq p$, the operator 
$ V_J : ell^2 \( J \) arrow.r bb(C)^k \, #h(2em) V_J z = sum_(i in J) z_i v_i \, $

 satisfies $∥V_J∥ lt.eq b_0$.]
] <lem:frames>

#proof[
  Choose independent random variables $epsilon_(a \, i)$, for $1 lt.eq a lt.eq k$ and $1 lt.eq i lt.eq n$, each taking the values $1$ and $- 1$ with probability $1 \/ 2$, and set
  $ \( v_i \)_a = k^(- 1 \/ 2) epsilon_(a \, i) . $
  Every $v_i$ has norm exactly one. Fix a set $J = { i_1 < dots.h.c < i_p }$ of cardinality $p$, and fix real unit vectors $w in bb(R)^k$ and $z in bb(R)^p$. The random variable
  $ X = w^(sans(T)) V_J z = 1 / sqrt(k) sum_(a = 1)^k sum_(j = 1)^p w_a z_j epsilon_(a \, i_j) $
  is a sum of independent signs with deterministic coefficients whose squares sum to
  $ 1 / k sum_(a = 1)^k sum_(j = 1)^p w_a^2 z_j^2 = 1 / k . $
  The inequality $cosh t lt.eq exp \( t^2 \/ 2 \)$ consequently gives, for every $t in bb(R)$,
  $ bb(E) exp \( t X \) = product_(a \, j) cosh #h(-0.16667em) (frac(t w_a z_j, sqrt(k))) lt.eq exp #h(-0.16667em) (frac(t^2, 2 k)) . $
  For $u > 0$, applying Markov’s inequality to $exp \( t X \)$ and choosing $t = k u$ yields $Pr \( X > u \) lt.eq exp \( - k u^2 \/ 2 \)$. The same argument for $- X$ therefore proves
  #[#set math.equation(numbering: n => "(4.2)")
   $ Pr \( \| X \| > u \) lt.eq 2 exp \( - k u^2 \/ 2 \) . $ <eq:sign-tail>]
  In particular, the probability that $\| X \| > 5$ is at most $2 exp \( - 25 k \/ 2 \)$.
  For each positive integer $m$, the real Euclidean unit sphere has a $1 \/ 4$-net with at most $9^m$ points. Indeed, take a maximal $1 \/ 4$-separated set on that sphere. The open balls of radius $1 \/ 8$ about its points are pairwise disjoint and lie in the ball of radius $9 \/ 8$ about the origin. Comparing their $m$-dimensional volumes bounds the number of points by $9^m$. Maximality makes the set a $1 \/ 4$-net.
  Fix such nets $cal(N)_k subset bb(R)^k$ and $cal(N)_p subset bb(R)^p$. For any real $k times p$ matrix $M$, let $L$ be its operator norm on real Euclidean spaces. If $\| w_0^(sans(T)) M z_0 \| lt.eq 5$ for all $\( w_0 \, z_0 \) in cal(N)_k times cal(N)_p$, then, for arbitrary real unit vectors $w \, z$, choose net points satisfying $∥w - w_0∥ lt.eq 1 \/ 4$ and $∥z - z_0∥ lt.eq 1 \/ 4$. We obtain
  $ lr(|w^(sans(T)) M z - w_0^(sans(T)) M z_0|) lt.eq ∥w - w_0∥ L ∥z∥ + ∥w_0∥ L ∥z - z_0∥ lt.eq L / 2 . $
  Taking the supremum over $w \, z$ gives $L lt.eq 5 + L \/ 2$, hence $L lt.eq 10$.
  There are at most $n^p$ sets $J$ of size $p$. By (4.2) and the union bound, the probability that one of the corresponding net inequalities fails is at most
  #[#set math.equation(numbering: n => "(4.3)")
   $ 2 n^p 9^(k + p) exp \( - 25 k \/ 2 \) . $ <eq:frame-failure-probability>]
  The parameters satisfy
  $ k gt.eq 2 r log \( 2 n \) gt.eq p \, #h(2em) k gt.eq p log n . $
  Here $log \( 2 n \) gt.eq log 4 > 1$ and $p lt.eq 2 r$. Thus the logarithm of the bound in (4.3) is at most
  $ log 2 + k + 2 k log 9 - frac(25 k, 2) = log 2 - (25 / 2 - 1 - 2 log 9) k < 0 . $
  For example, the coefficient in parentheses exceeds $7$, whereas $k gt.eq 1$ and $log 2 < 1$. The bound in (4.3) is therefore strictly less than one. There is a realization for which every size-$p$ synthesis matrix has real operator norm at most $10$.
  For a real matrix $M$ with real operator norm $L$, and real vectors $u \, v$, one has
  $ ∥M \( u + i v \)∥^2 = ∥M u∥^2 + ∥M v∥^2 lt.eq L^2 #scale(x: 120%, y: 120%)[\(] ∥u∥^2 + ∥v∥^2 #scale(x: 120%, y: 120%)[\)] . $
  Since real vectors are also complex vectors, this proves equality of the real and complex operator norms. The realization just obtained therefore has the claimed complex operator norm bounds. Finally, every set with fewer than $p$ indices is contained in one with $p$ indices, and its synthesis operator is the restriction to a coordinate subspace of that larger synthesis operator. This proves the assertion for all $\| J \| lt.eq p$. ◻
]

The vectors just constructed control each small set of incident labels. We next transfer that finite-dimensional estimate to an operator on the group. The intermediate space keeps one scalar coordinate for each labelled edge, even when several labels describe the same group element.

=== 4.1 A factorization through the indexed edges <a-factorization-through-the-indexed-edges>

Let $G$ be a countable group, let $s_1 \, dots.h \, s_n in G$ be a finite list, and allow the same group element to occur at several distinct indices. Let $v_1 \, dots.h \, v_n in bb(C)^k$ be unit vectors and put

$ P_i = v_i v_i^(*) \, #h(2em) cal(H) = ell^2 \( G \; bb(C)^k \) . $

Thus $P_i$ is a rank-one orthogonal projection and $∥P_i∥ = 1$. For a function $c : G times { 1 \, dots.h \, n } arrow.r bb(C)$ with $\| c \( x \, i \) \| lt.eq 1$, define

#[#set math.equation(numbering: n => "(4.4)")
 $ \( T_c xi \) \( x \) = sum_(i = 1)^n c \( x \, i \) P_i xi \( x s_i \) \, #h(2em) xi in cal(H) . $ <eq:masked-operator>]

For each fixed $i$, the corresponding summand is the composition of the unitary right shift $xi \( x \) mapsto xi \( x s_i \)$, the pointwise application of $P_i$, and multiplication by the scalar function $c \( dot.op \, i \)$. Its norm is at most one. In particular, (4.4) defines a bounded operator and $∥T_c∥ lt.eq n$, without any sparsity assumption. The next lemma gives a bound independent of $n$ under two sparsity assumptions.

#thm([Lemma 4.2.])[
  (The masked operator estimate).  #emph[In the preceding setting, let $1 lt.eq p lt.eq n$ and $b_0 > 0$. Suppose that 
$ ∥V_J∥ lt.eq b_0 quad upright("for every ") J subset.eq { 1 \, dots.h \, n } upright(" with ") \| J \| lt.eq p \, $

 where $V_J$ is the synthesis operator with columns $v_i$, $i in J$. For a mask $c$ as in (4.4), define 
$ cal(R)_x = { i : c \( x \, i \) eq.not 0 } \, #h(2em) cal(C)_y = { i : c \( y s_i^(- 1) \, i \) eq.not 0 } . $

 If $\| cal(R)_x \| lt.eq p$ for every $x in G$ and $\| cal(C)_y \| lt.eq p$ for every $y in G$, then 
$ ∥T_c∥ lt.eq b_0^2 . $

]
] <lem:masked>

#proof[
  Keep the index $i$ as part of each edge and set
  $ E_c = { \( x \, i \) : c \( x \, i \) eq.not 0 } \, #h(2em) cal(E)_c = ell^2 \( E_c \) . $
  Define the analysis operator $F : cal(H) arrow.r cal(E)_c$, the diagonal multiplication operator $M_c : cal(E)_c arrow.r cal(E)_c$, and the synthesis operator $S : cal(E)_c arrow.r cal(H)$ by
  $ \( F xi \) \( x \, i \) & = v_i^(*) xi \( x s_i \) \,\
\( M_c alpha \) \( x \, i \) & = c \( x \, i \) alpha \( x \, i \) \,\
\( S alpha \) \( x \) & = sum_(i in cal(R)_x) v_i alpha \( x \, i \) . $
  Figure 1 illustrates the role of the edge coordinates. The following estimates both justify these operators on the stated Hilbert spaces and bound their norms.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 2.3cm, inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[column fibre#linebreak()$xi (y) in bb(C)^k$]]])])
  content((4, 1), [#box(width: 2.7cm, height: 0.9cm, inset: 0.3333em, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$v_i^* xi (y) in bb(C)$]]])])
  content((4, -1), [#box(width: 2.7cm, height: 0.9cm, inset: 0.3333em, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$v_j^* xi (y) in bb(C)$]]])])
  content((8, 0), [#box(width: 2.3cm, inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[row fibre#linebreak()$(T_c xi )(x) in bb(C)^k$]]])])
  line((1.15, 0.2875), (2.65, 0.6625), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((2, 0.5), [#text(size: 9pt)[$F$: label $i$]], anchor: "south", padding: 0.1176cm)
  line((1.15, -0.2875), (2.65, -0.6625), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((2, -0.5), [#text(size: 9pt)[$F$: label $j$]], anchor: "north", padding: 0.1176cm)
  line((5.35, 0.6625), (6.85, 0.2875), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((6, 0.5), [#text(size: 9pt)[$c(x,i)v_i$]], anchor: "south", padding: 0.1176cm)
  line((5.35, -0.6625), (6.85, -0.2875), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((6, -0.5), [#text(size: 9pt)[$c(x,j)v_j$]], anchor: "north", padding: 0.1176cm)
  content((4, 1.75), [#text(size: 9pt)[distinct edge coordinates]])
  content((4, -1.75), [#text(size: 9pt)[$s_i=s_j$, $i != j$]])
})],
    caption: [Figure 1: Two different labels with $s_i = s_j$ give parallel edges from row $x$ to column $y = x s_i = x s_j$. The operator acts from the column fibre toward the row fibre. Analysis produces separate scalar coordinates $\( x \, i \)$ and $\( x \, j \)$; multiplication by the mask and synthesis then add their contributions in the row fibre. The picture shows only these two coordinates of the factorization $T_c = S M_c F$. ],
  ) <fig:edge-factorization>
  For $S$, the row assumption gives
  $ ∥S alpha∥^2 = sum_x ∥V_(cal(R)_x) \( alpha \( x \, i \) \)_(i in cal(R)_x)∥^2 lt.eq b_0^2 sum_x sum_(i in cal(R)_x) \| alpha \( x \, i \) \|^2 = b_0^2 ∥alpha∥^2 . $
  For $F$, regroup the nonnegative summands by the column $y = x s_i$. For fixed $y$ and fixed label $i$, there is exactly one possible source, namely $x = y s_i^(- 1)$. The edges arriving at $y$ are therefore indexed by the set $cal(C)_y$, with no repeated index, and
  $ ∥F xi∥^2 & = sum_y sum_(i in cal(C)_y) \| v_i^(*) xi \( y \) \|^2\
 & = sum_y ∥V_(cal(C)_y)^(*) xi \( y \)∥^2 lt.eq b_0^2 sum_y ∥xi \( y \)∥^2 = b_0^2 ∥xi∥^2 . $
  Empty index sets contribute zero in both calculations. These estimates give $∥S∥ lt.eq b_0$ and $∥F∥ lt.eq b_0$, and $\| c \( x \, i \) \| lt.eq 1$ gives $∥M_c∥ lt.eq 1$. Substitution into the definitions yields the exact factorization
  $ T_c = S M_c F . $
  Consequently $∥T_c∥ lt.eq b_0^2$.
  The uniqueness of $x = y s_i^(- 1)$ uses a fixed label $i$, not the distinctness of the elements in the list $s_1 \, dots.h \, s_n$. In particular, if $s_i = s_j$ for $i eq.not j$, the two indexed edges remain distinct coordinates of $cal(E)_c$. Their contributions to a common operator block are summed by the same factorization. No distinctness assumption on the products is needed. ◻
]

=== 4.2 Consequences of an assignment to endpoints <consequences-of-an-assignment-to-endpoints>

We now apply the factorization three times to obtain the hypotheses of 3. An endpoint assignment is sparse only for the ones at rows and the zeros at columns. Restricting to a single row or column, and then subtracting a translated assignment, will give masks that are sparse on both sides.

Fix integers $n gt.eq 2$ and $r gt.eq 1$, and choose $k \, p \, b_0$ and $v_1 \, dots.h \, v_n$ as in 6. Keep the preceding notation $G \, s_i \, P_i \, cal(H) \, T_c$. Suppose a function $a : G times { 1 \, dots.h \, n } arrow.r { 0 \, 1 }$ satisfies

#[#set math.equation(numbering: n => "(4.5)")
 $ sum_(i = 1)^n a \( x \, i \) lt.eq r quad \( x in G \) \, #h(2em) sum_(i = 1)^n #scale(x: 120%, y: 120%)[\(] 1 - a \( y s_i^(- 1) \, i \) #scale(x: 120%, y: 120%)[\)] lt.eq r quad \( y in G \) . $ <eq:weights-orientation-bounds>]

Thus the ones are sparse at rows and the zeros are sparse at columns, with both counts taken over indexed edges. Set

#[#set math.equation(numbering: n => "(4.6)")
 $ A = T_(upright(bold(1))) \, #h(2em) T = T_a \, #h(2em) \( U \( g \) xi \) \( x \) = xi \( g^(- 1) x \) quad \( g \, x in G \) \, $ <eq:weights-A-T-U>]

where $upright(bold(1)) \( x \, i \) = 1$. Both $A$ and $T$ are bounded operators, each with norm at most $n$. For $y in G$, let $iota_y : bb(C)^k arrow.r cal(H)$ be the coordinate inclusion, and write $q_y = iota_y^(*)$ for coordinate evaluation.

#thm([Corollary 4.3.])[
  (Individual block rows and columns).  #emph[Under (4.5), one has 
$ ∥q_x T∥ lt.eq b_0^2 quad \( x in G \) \, #h(2em) ∥\( A - T \) iota_y∥ lt.eq b_0^2 quad \( y in G \) . $

]
] <cor:block-rows-columns>

#proof[
  Write $upright(bold(1))_E$ for the indicator of a condition $E$. For fixed $x_0 \, y_0 in G$, define the masks
  $ c_(upright(r)) \( x \, i \) = upright(bold(1))_({ x = x_0 }) a \( x \, i \) \, #h(2em) c_(upright(c)) \( x \, i \) = upright(bold(1))_({ x s_i = y_0 }) \( 1 - a \( x \, i \) \) . $
  The first inequality in (4.5) gives at most $r$ active edges in total for $c_(upright(r))$; the second gives the same bound for $c_(upright(c))$. Thus every row and every column of either mask has at most $min \( r \, n \) lt.eq p$ active indices, and 7 bounds both associated operator norms by $b_0^2$. Their operators are
  $ T_(c_(upright(r))) = iota_(x_0) q_(x_0) T \, #h(2em) T_(c_(upright(c))) = \( A - T \) iota_(y_0) q_(y_0) . $
  The first norm equals $∥q_(x_0) T∥$ because $iota_(x_0)$ is isometric. The second equals $∥\( A - T \) iota_(y_0)∥$ because $∥q_(y_0)∥ = 1$ and $q_(y_0) iota_(y_0) = I_(bb(C)^k)$. These are the asserted bounds. ◻
]

#thm([Proposition 4.4.])[
  (Uniformly bounded conjugation differences).  #emph[Under (4.5), the maps $U \( g \)$ in (4.6) form a unitary representation of $G$, and $A$ commutes with every $U \( g \)$. Define 
$ D \( g \) = T - U \( g \) T U \( g \)^(- 1) quad \( g in G \) . $

 Then 
#[#set math.equation(numbering: n => "(4.7)")
 $ sup_(g in G) ∥D \( g \)∥ lt.eq b_0^2 = 100 . $ <eq:uniform-difference-bound>]

 Moreover, $D \( e \) = 0$ and 
#[#set math.equation(numbering: n => "(4.8)")
 $ D \( g h \) = D \( g \) + U \( g \) D \( h \) U \( g \)^(- 1) quad \( g \, h in G \) . $ <eq:weights-cocycle>]

]
] <prop:uniform-differences>

#proof[
  Left multiplication by a group element is a bijection of $G$, so each $U \( g \)$ is unitary with inverse $U \( g^(- 1) \)$, and direct substitution gives $U \( g \) U \( h \) = U \( g h \)$. Left and right translations commute and $U \( g \)$ acts trivially on the fibre $bb(C)^k$; alternatively, direct substitution in (4.4) with $c = upright(bold(1))$ gives $U \( g \) A = A U \( g \)$.
  For a general mask $a$, direct calculation gives
  $ \( U \( g \) T U \( g \)^(- 1) xi \) \( x \) = sum_(i = 1)^n a \( g^(- 1) x \, i \) P_i xi \( x s_i \) . $
  Thus $D \( g \) = T_(c_g)$ for the mask
  $ c_g \( x \, i \) = a \( x \, i \) - a \( g^(- 1) x \, i \) in { - 1 \, 0 \, 1 } . $
  At any row $x$, the active indices are contained in
  $ { i : a \( x \, i \) = 1 } med union med { i : a \( g^(- 1) x \, i \) = 1 } . $
  Each set in this union has at most $r$ elements by (4.5). Hence there are at most $min \( 2 r \, n \) = p$ active indices at that row.
  For the column estimate, write
  $ Z_y = { i : a \( y s_i^(- 1) \, i \) = 0 } quad \( y in G \) . $
  The second inequality in (4.5) gives $\| Z_y \| lt.eq r$. The active indices of $c_g$ at a column $y$ are precisely those for which
  $ a \( y s_i^(- 1) \, i \) eq.not a \( g^(- 1) y s_i^(- 1) \, i \) . $
  Since $a$ takes only the values zero and one, this set is $Z_y triangle.stroked.t Z_(g^(- 1) y)$, the symmetric difference of the two zero sets. It has at most $2 r$ elements, and at most $n$, so its cardinality is at most $p$. As in 7, fixed $y$ and fixed label $i$ specify the unique source $y s_i^(- 1)$. These counts therefore concern exactly the indexed edges of the mask, including when products coincide.
  Both hypotheses of 7 now hold for $c_g$, and $\| c_g \( x \, i \) \| lt.eq 1$. That lemma yields $∥D \( g \)∥ lt.eq b_0^2$ for every $g$, proving (4.7).
  Finally, $D \( e \) = T - T = 0$. The cocycle identity in (4.8) follows from the calculation in the proof of 3. ◻
]

== 5 Proof of the main theorem <sec:conclusion>

We first combine the three uniform bounds with the kernel energy estimate for countable groups. We then pass through a finitely generated subgroup to arbitrary discrete groups and include the classical averaging argument for the reverse direction.

#proof[
  #emph[The countable nonamenable case.] Fix a countable discrete nonamenable group $G$, and choose $S \, d \, rho$ from 4. For each $ell gt.eq 1$, take the product list and assignment of 5, with
  $ n_ell = d^ell \, #h(2em) r_ell = ceil.l n_ell rho^ell ceil.r \, #h(2em) k_ell = ceil.l 2 r_ell log \( 2 n_ell \) ceil.r . $
  In particular,
  #[#set math.equation(numbering: n => "(5.1)")
   $ k_ell / n_ell lt.eq 2 (rho^ell + 1 / n_ell) log \( 2 n_ell \) + 1 / n_ell arrow.r 0 . $ <eq:dimension-ratio>]
  Choose the vectors from 6 and let $P_i = v_i v_i^(*)$ at this stage. Use them to form the operators $A_ell \, T_ell \, U_ell$ of 4 on $cal(H)_ell = ell^2 \( G \; bb(C)^(k_ell) \)$. The row and column bounds of 8 and the commutator bound of 9 have the common constant $K = b_0^2 = 100$.
  The invariant kernel of $A_ell$ is
  $ W_ell \( s \) = sum_(i : s_i = s) P_i . $
  It is finitely supported. Positivity of the weights gives
  #[#set math.equation(numbering: n => "(5.2)")
   $ sum_(s in G) ∥W_ell \( s \)∥_(upright("HS"))^2 = sum_(i \, j : s_i = s_j) "Tr" \( P_i P_j \) = sum_(i \, j : s_i = s_j) \| v_i^(*) v_j \|^2 gt.eq n_ell . $ <eq:kernel-energy>]
  The diagonal terms equal one, and every other term is nonnegative; thus collisions among group products only increase this lower bound. By (5.1), the kernel energy divided by $k_ell$ tends to infinity.
  Fix $epsilon > 0$ and put $t = epsilon \/ 100$. Apply 3 to the rescaled operators $t A_ell \, t T_ell$. Their three uniform bounds have the common constant $t K = epsilon$. Their invariant kernels are $t W_ell$, so their energies divided by $k_ell$ still tend to infinity: they are $t^2$ times the ratios just established. The proposition therefore gives a representation on
  $ cal(K) = (xor.big_(ell gt.eq 1) cal(H)_ell) xor (xor.big_(ell gt.eq 1) cal(H)_ell) $
  with uniform bound at most $1 + epsilon$ that is not similar to a unitary representation. This Hilbert space is separable because $G$ is countable and each $k_ell$ is finite. This proves the nonamenable direction and the quantitative assertion for countable groups. ◻
]

We next recall the induction argument for subgroup permanence of unitarizability #cite(label("Pisier2004")) Proposition 0.5, keeping track of its norm and of the invariant inner product on the subgroup representation.

#thm([Lemma 5.1.])[
  (Induction from a subgroup).  #emph[Let $H$ be a subgroup of a discrete group $G$, and let $sigma : H arrow.r upright("GL") \( cal(K) \)$ be a uniformly bounded representation on a complex Hilbert space. There is a uniformly bounded representation $Pi : G arrow.r upright("GL") \( cal(L) \)$ on $cal(L) = ell^2 \( G \/ H \; cal(K) \)$ such that 
$ \| Pi \| = \| sigma \| . $

 If $Pi$ is unitarizable, then $sigma$ is unitarizable.]
] <lem:subgroup-induction>

#proof[
  Write $X = G \/ H$ for the left cosets, and choose representatives $s : X arrow.r G$ with $s \( H \) = e$. For $g in G$ and $x in X$, put
  $ c \( g \, x \) = s \( g x \)^(- 1) g s \( x \) in H . $
  The membership follows because $s \( g x \) H = g s \( x \) H$. Direct multiplication gives
  $ c \( g h \, x \) = c \( g \, h x \) c \( h \, x \) #h(2em) \( g \, h in G \, med x in X \) . $
  On the dense subspace of finitely supported families in the Hilbert direct sum $cal(L) = xor.big_(x in X) cal(K)$, define
  $ \( Pi \( g \) xi \)_(g x) = sigma \( c \( g \, x \) \) xi_x #h(2em) \( x in X \) . $
  If $M = \| sigma \|$, then reindexing by the permutation $x mapsto g x$ gives
  $ ∥Pi \( g \) xi∥^2 = sum_(x in X) ∥sigma \( c \( g \, x \) \) xi_x∥^2 lt.eq M^2 sum_(x in X) ∥xi_x∥^2 . $
  Thus $Pi \( g \)$ extends to a bounded operator of norm at most $M$ on the whole direct sum, without a countability assumption on $X$. The cocycle identity gives $Pi \( g \) Pi \( h \) = Pi \( g h \)$ first on finitely supported families and hence everywhere. Also $Pi \( e \) = I$, so $Pi \( g \)^(- 1) = Pi \( g^(- 1) \)$. This proves $\| Pi \| lt.eq M$.
  Let $j : cal(K) arrow.r cal(L)$ be the isometric inclusion at the identity coset $H$. For $h in H$, one has $h H = H$ and $c \( h \, H \) = h$, whence
  $ Pi \( h \) j = j sigma \( h \) . $
  In particular, $∥Pi \( h \)∥ gt.eq ∥sigma \( h \)∥$ for every $h in H$. Taking suprema gives the reverse inequality $\| Pi \| gt.eq \| sigma \|$, proving equality of the uniform bounds.
  Suppose now that $\[ dot.op \, dot.op \]$ is an invariant equivalent inner product for $Pi$. Let $Q$ be the bounded positive invertible operator representing this form. It satisfies
  $ a I lt.eq Q lt.eq b I \, #h(2em) Pi \( g \)^(*) Q Pi \( g \) = Q quad \( g in G \) $
  for some $0 < a lt.eq b < oo$. The compression $Q_H = j^(*) Q j$ satisfies
  $ a I lt.eq Q_H lt.eq b I \, #h(2em) sigma \( h \)^(*) Q_H sigma \( h \) = j^(*) Pi \( h \)^(*) Q Pi \( h \) j = Q_H quad \( h in H \) . $
  Consequently $\[ v \, w \]_H = \[ j v \, j w \]$ is an equivalent $sigma \( H \)$-invariant inner product on $cal(K)$. The compression does not require $Q$ to preserve the identity-coset summand. Hence $sigma$ is unitarizable. ◻
]

#proof[
  #emph[Arbitrary discrete nonamenable groups.] Let $G$ be a discrete nonamenable group and fix $epsilon > 0$. The Følner criterion for an arbitrary discrete group says that amenability is equivalent to the following condition: for every finite $S subset.eq G$ and every $delta > 0$, there is a finite nonempty $F subset.eq G$ such that
  #[#set math.equation(numbering: n => "(5.3)")
   $ \| s F triangle.stroked.t F \| < delta \| F \| #h(2em) \( s in S \) . $ <eq:folner-finite-test>]
  This is the symmetric-difference form of Følner’s Main Theorem #cite(label("Folner1955")) p. 245: inversion exchanges right and left translations, and $\| s F triangle.stroked.t F \| = 2 \( \| F \| - \| s F ∩ F \| \)$. No Følner sequence is required.
  Since $G$ is nonamenable, some finite $S$ and positive $delta$ fail this condition. The subgroup $H = chevron.l S chevron.r$ is finitely generated and therefore countable. It is nonamenable: otherwise the criterion applied inside $H$ would give a finite nonempty $F subset.eq H$ satisfying (5.3), and the same inequalities would hold in $G$, a contradiction.
  The countable case proved above gives a nonunitarizable representation $sigma$ of $H$ on a separable Hilbert space with $\| sigma \| lt.eq 1 + epsilon$. By Lemma 10, its induced representation $Pi$ of $G$ has $\| Pi \| = \| sigma \| lt.eq 1 + epsilon$ and is nonunitarizable. This proves the nonamenable direction for every discrete group. ◻
]

#proof[
  #emph[The amenable direction.] Let $G$ be amenable and let $pi : G arrow.r upright("GL") \( H \)$ be uniformly bounded, with $M = \| pi \|$. The Day–Dixmier argument #cite(label("Day1950")) #cite(label("Dixmier1950")) works on an arbitrary complex Hilbert space. If $m$ is a left invariant mean, then $m_(upright(r)) \( f \) = m \( x mapsto f \( x^(- 1) \) \)$ is a right invariant mean. Define a sesquilinear form by
  $ \[ xi \, eta \] = m_(upright(r)) #scale(x: 120%, y: 120%)[\(] g mapsto chevron.l pi \( g \) xi \, pi \( g \) eta chevron.r #scale(x: 120%, y: 120%)[\)] . $
  Since both $∥pi \( g \)∥$ and $∥pi \( g \)^(- 1)∥$ are at most $M$, positivity of the mean gives
  $ M^(- 2) ∥xi∥^2 lt.eq \[ xi \, xi \] lt.eq M^2 ∥xi∥^2 . $
  Thus this is an equivalent Hilbert inner product. Right invariance gives $\[ pi \( h \) xi \, pi \( h \) eta \] = \[ xi \, eta \]$ for every $h in G$. Representing the form by a bounded positive invertible operator $Q$, we have $pi \( h \)^(*) Q pi \( h \) = Q$. Hence $S = Q^(1 \/ 2)$ is bounded and invertible, and $S pi \( h \) S^(- 1)$ is unitary for all $h$. This proves unitarizability and completes the equivalence. ◻
]

For uncountable nonamenable $G$, the finitely generated subgroup $H$ above has uncountable index, and the induced witness is nonseparable. The conclusion therefore uses the usual definition quantifying over all Hilbert spaces. The argument concerns discrete groups and does not extend the theorem to nondiscrete locally compact groups, where representations are normally required to be strongly continuous.

== 6 A consequence for group $C^(*)$-algebras <sec:cstar-consequence>

The following consequence uses the companion similarity theorem in addition to 1.

Let $G$ be any discrete group and let $pi : G arrow.r upright("GL") \( H \)$ be a uniformly bounded nonunitarizable representation on a complex Hilbert space. The operator-norm convergent sum

$ T_pi \( f \) = sum_(g in G) f \( g \) pi \( g \) \, #h(2em) f in ell^1 \( G \) \, $

defines a bounded complex-linear unital homomorphism for convolution, with $∥T_pi \( f \)∥ lt.eq \| pi \| ∥f∥_1$; absolute summability justifies multiplication of the sums. Nevertheless, its restriction to $bb(C) \[ G \]$ has no bounded complex-linear unital algebra-homomorphism extension to either the full group algebra $C^(*) \( G \)$ or the reduced group algebra $C_r^(*) \( G \)$. Indeed, a full extension $Phi$ would be similar to a $*$-homomorphism by the companion similarity theorem #cite(label("OpenAIKadison2026")) Theorem 1.1: some bounded invertible $S$ would make $S Phi \( dot.op \) S^(- 1)$ a unital $*$-homomorphism. For each canonical group unitary $u_g$, one has $Phi \( u_g \) = pi \( g \)$, so every $S pi \( g \) S^(- 1)$ would be unitary, a contradiction. A reduced extension would compose with the canonical unital $*$-quotient $C^(*) \( G \) arrow.r C_r^(*) \( G \)$ to give a full extension. Thus the automatic $ell^1$-norm bound does not imply $C^(*)$-norm continuity. Applying this observation to the witnesses in 1 gives such a failure for every nonamenable discrete group, even with uniform representation bounds arbitrarily close to one.


#bibliography("refs.bib", style: "ieee", title: [References])
