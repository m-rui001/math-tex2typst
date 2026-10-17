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

#align(center)[#text(size: 16pt, weight: "bold")[Kadison's similarity theorem through \
uniform derivation estimates]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

Kadison’s similarity problem asks whether the adjoint operation of a $C^(*)$-algebra is respected, after a bounded change of Hilbert space coordinates, by every bounded representation of its underlying algebra. Kadison formulated the problem in 1955 in his study of the orthogonalization of operator representations #cite(label("Kadison1955")). Its force lies in the absence of any assumed relation between the algebraic representation and the involution: multiplicativity and boundedness alone must produce one equivalent Hilbert space inner product for which all represented adjoints are correct. This paper resolves the problem positively in its unrestricted bounded unital form.

#thm([Theorem 1.1.])[
  (Similarity).  #emph[Let $A$ be any unital complex $C^(*)$-algebra, let $H$ be any complex Hilbert space, and let $pi : A arrow.r cal(B) \( H \)$ be a bounded, complex-linear, unital algebra homomorphism. There exists an operator $S in cal(B) \( H \)$, invertible with bounded inverse, such that 
$ rho \( a \) = S pi \( a \) S^(- 1) #h(2em) \( a in A \) $

 is a $*$-homomorphism. In particular, $rho \( a^(*) \) = rho \( a \)^(*)$ for every $a in A$.]
] <thm:similarity>

The theorem imposes no separability, nuclearity, finite generation, faithfulness, or normality condition. The similarity may depend on the whole homomorphism. The result concerns the existence of this single bounded invertible operator, and does not require an a priori bound for its condition number.

=== 1.1 Historical context <historical-context>

The nuclear case was established by Bunce and Christensen #cite(label("Bunce1981")) #cite(label("Christensen1981")); see also the precise quantitative comparison in #cite(label("Pisier2006Nuclear"), form: "prose") Theorem 1. Haagerup’s theorem that every nuclear $C^(*)$-algebra is amenable #cite(label("Haagerup1983Amenable")) Theorem 3.1 connects this case with the cohomology of operator algebras. Complete boundedness provided the principal analytic framework for the general similarity problem. Haagerup solved the cyclic representation case and identified complete boundedness as the criterion for similarity to a $*$-representation #cite(label("Haagerup1983")). He also proved the similarity property for $C^(*)$-algebras without tracial states #cite(label("Haagerup1983")) Proposition 1.8, and Christensen established it for type $upright("II")_1$ factors with property $Gamma$ #cite(label("Christensen1986")); see also #cite(label("Ozawa2006"), form: "prose") Section 1.2, Theorem 1.3. These cases explain the role of the finite-factor argument below, where the estimate must be uniform in the factor and its representation multiplicity.

Christensen established the corresponding criterion for derivations: a derivation into the ambient bounded operators is inner precisely when it is completely bounded #cite(label("Christensen1977")). Paulsen’s similarity theorem extends the homomorphism criterion to unital operator algebras and gives the optimal condition number #cite(label("Paulsen1984")) p. 226. Kirchberg then proved that, for each unital $C^(*)$-algebra, the similarity property is equivalent to innerness of derivations in every faithful $*$-representation #cite(label("Kirchberg1996")); we use the explicit per-algebra formulation in #cite(label("Ozawa2006"), form: "prose") Theorem 1.1. Ringrose’s automatic continuity theorem allows this derivation property to be stated using bounded derivations #cite(label("Ringrose1972")).

A von Neumann algebra is #emph[hyperreflexive] if the distance from any operator to the algebra is bounded by a fixed multiple of the supremum of its off-diagonal compression norms over the algebra’s invariant subspaces. More recently, #cite(label("EleftherakisPaulsen2026"), form: "prose") Theorem 2.4 characterized a positive answer to the similarity problem by preservation of hyperreflexivity when adjoining a projection: whenever $M subset cal(B) \( H \)$ is a hyperreflexive von Neumann algebra and $q in cal(B) \( H \)$ is a projection, $W^(*) \( M \, q \)$ is hyperreflexive. Their result is an equivalence with this extension property and with the assertion that every von Neumann algebra is hyperreflexive. Corollary 3 below makes the latter consequence quantitative with one universal constant.

Pisier organized quantitative similarity estimates through the similarity degree and its interpretation as the length of matrix factorizations #cite(label("Pisier1999Degree")) #cite(label("Pisier2001Remarks")). His characterization of nuclearity by a similarity exponent below three distinguishes the strength of the nuclear case #cite(label("Pisier2006Nuclear")) Theorem 1. These results concern quantitative bounds for homomorphisms. The proof below is organized around a uniform bound for derivations, and concludes with existence of a similarity as stated in Theorem 1.

The companion result on discrete groups identifies unitarizability with amenability #cite(label("OpenAIUnitarizability2026")) Theorem 1.1. Unlike the homomorphisms in Theorem 1, a uniformly bounded group representation need not have a bounded extension to the full or reduced group $C^(*)$-algebra; the automatic extension is to $ell^1 \( G \)$.

=== 1.2 The uniform estimate and proof strategy <the-uniform-estimate-and-proof-strategy>

An inner derivation is a map $a mapsto \[ Y \, a \]$. Complete boundedness means uniform boundedness of all entrywise finite matrix amplifications. Our main estimate controls those amplifications of an inner derivation by its norm at the scalar level. For a represented unital von Neumann algebra $P subset cal(B) \( K \)$ and $Y in cal(B) \( K \)$, put

$ g_P \( Y \) = sup_(a in P \, thin parallel a parallel lt.eq 1) parallel Y a - a Y parallel \, $

and write $Y^(\( h \))$ for the diagonal amplification of $Y$ on $K^h$.

#thm([Theorem 1.2.])[
  (Uniform commutator estimate).  #emph[There is an absolute constant $C < oo$ such that, for every complex Hilbert space $K$, every unital von Neumann algebra $P subset cal(B) \( K \)$, every $Y in cal(B) \( K \)$, every integer $h gt.eq 1$, and every $X in M_h \( P \)$, 
#[#set math.equation(numbering: n => "(1)")
 $ parallel \[ Y^(\( h \)) \, X \] parallel lt.eq C thin g_P \( Y \) thin parallel X parallel . $ <eq:universal>]

 Here $M_h \( P \)$ acts naturally on $K^h$, and $\[ T \, U \] = T U - U T$.]
] <thm:universal>

#thm([Corollary 1.3.])[
  (Universal hyperreflexivity).  #emph[Let $H$ be any complex Hilbert space and let $M subset cal(B) \( H \)$ be a unital von Neumann algebra. For $T in cal(B) \( H \)$, set 
$ alpha_M \( T \) = sup { parallel \( 1 - e \) T e parallel : e in M' \, med e = e^(*) = e^2 } . $

 Then, with the absolute constant $C$ from Theorem 2, 
#[#set math.equation(numbering: n => "(2)")
 $ "dist" \( T \, M \) lt.eq 2 C thin alpha_M \( T \) #h(2em) \( T in cal(B) \( H \) \) . $ <eq:universal-hyperreflexivity>]

 Thus every such $M$ is hyperreflexive with constant at most $2 C$, independently of the algebra, its representation, and the Hilbert space. No optimality of this constant is asserted.]
] <cor:hyperreflexivity>

Applying the commutator estimate to $M'$ gives this distance bound through Arveson’s commutant-distance formula. The proof is given in Section 7.5.

The difficult part is obtaining a constant independent of matrix size for finite factors. Section 2 first combines Dickson’s row estimate #cite(label("Dickson2014")) Lemma 2.9 with its column counterpart to implement rectangular derivations with cyclic domain. Here rectangular derivations take values in operators between two representation spaces. The implementation norm is controlled by the derivation norm with an absolute constant.

Sections 3–5 use this cyclic-domain estimate in a tracial free product $cal(L) = D * A_0$, where $D$ is a $upright("II")_1$ factor generated by increasing full matrix algebras and $A_0$ is a finite von Neumann algebra with a faithful normal tracial state. The input is an operator $G$ on $L^2 \( cal(L) \)$ commuting with left multiplication by $D$, whose commutators with elements of a corner $e cal(L) e$ have norm at most $epsilon.alt$ times the element norm. Here $e in D$ is a projection of trace $1 \/ N$, for an integer $N gt.eq 2$. The output bounds the compression to $L^2 \( A_0 \)$ of its commutator with any trace-zero self-adjoint unitary in $A_0$, by an absolute multiple of $epsilon.alt$ independent of the corner trace. This is Theorem 9.

The reduced-word model belongs to the free-product framework developed by Ching and Voiculescu #cite(label("Ching1973")) #cite(label("Voiculescu1985")). Its role here is to turn the corner hypothesis into a statement about operators on Hilbert tensor products.

In Section 3, averaging over the finite matrix unitary groups reveals the structure of the operator on reduced words. Finite-dimensional Schur–Weyl duality supplies invariant cycle-trace coefficients; the endpoint $L^1$ bound and boundedness on Hilbert tensor products eliminate all contractions except permutations between equally many source and test letters. At each word level, repeated-letter tensors consequently carry an action on their remaining factors that is independent of the repeated $D$-letter. Section 4 approximates $G$, on each sufficiently small right support, by a bounded right multiplier. This propagates the repeated-letter action through arbitrarily long words with a uniform error. Section 5 compresses a multiplication operator built from two free trace-zero self-adjoint unitaries. The resulting Hankel matrix has norm bounded below as the corner trace tends to zero. The trace factors in the upper and lower bounds cancel, completing the free-product corner estimate.

Section 6 uses Popa’s relative independence theorem #cite(label("Popa2014")) Theorem 0.1(a) to place this free product inside the tracial ultrapower of an arbitrary separable-predual $upright("II")_1$ factor after matrix amplification. The irreducible-inclusion case already appears in Popa’s free-independent sequence construction #cite(label("Popa1995")) Theorem 2.1 and proof of Corollary 2.2. The operator under study is passed through a Hilbert space ultrapower and compressed to the tracial $L^2$-space, preserving the necessary commutator coefficients. Section 7 extends the estimate to arbitrary normal factor representations, then uses central decomposition and separable reducing subspaces to obtain Theorem 2. The resulting constant is numerical and independent of matrix size, representation, and Hilbert space. Finally, using the cyclic-domain estimate again, finite collections of cyclic columns of a $*$-representation implement a given derivation locally. Their scalar commutator norms are uniformly bounded, so (1) gives complete boundedness of the full derivation. Paulsen’s theorem implements it, and Kirchberg’s equivalence proves Theorem 1.

== 2 Rows, cyclic modules, and derivations <sec:preliminaries>

This section supplies two inputs to the proof: a uniform implementer for a rectangular derivation with cyclic domain, and the per-algebra derivation criterion that will conclude similarity. The cyclic estimate will first be used to extend control from a small free-product corner to an entire right-supported subspace.

All Hilbert spaces and algebras are complex, and inner products are linear in the first variable. All algebra homomorphisms are complex-linear, and all $*$-representations are unital unless stated otherwise. No separability or faithfulness is implicit. We write $E_1$ for the closed unit ball of a normed space $E$. For a unital self-adjoint operator algebra $P subset cal(B) \( K \)$ and $Y in cal(B) \( K \)$, set

#[#set math.equation(numbering: n => "(3)")
 $ g_P \( Y \) = sup_(a in P_1) parallel Y a - a Y parallel . $ <eq:commutator-seminorm>]

The same notation will be used when $P$ is a specified represented copy of an abstract algebra.

For a linear map $u : A arrow.r cal(B) \( K \, F \)$, its amplification $u_(p \, q)$ acts entrywise on $M_(p \, q) \( A \)$, with values in $cal(B) \( K^q \, F^p \)$. Rectangular matrix norms on $A$ are the usual $C^(*)$-matrix norms. We abbreviate $u_(h \, h)$ to $u_h$, and set

$ parallel u parallel_(upright("cb")) = sup_(h gt.eq 1) parallel u_h parallel \, #h(2em) parallel u parallel_(upright("row")) = sup_(h gt.eq 1) parallel u_(1 \, h) parallel \, #h(2em) parallel u parallel_(upright("col")) = sup_(h gt.eq 1) parallel u_(h \, 1) parallel . $

A map is completely bounded when its cb norm is finite. For an operator $Y$, the notation $Y^(\( h \))$ means the diagonal operator on $h$ copies of its Hilbert space.

If $\( P \, tau \)$ is a finite von Neumann algebra with a faithful normal tracial state, $L^2 \( P \) = L^2 \( P \, tau \)$ is the completion of $P$ for $chevron.l x \, y chevron.r = tau \( y^(*) x \)$. We write $parallel dot.op parallel_2$ for this norm, and $parallel x parallel_1 = tau \( \| x \| \)$ for $x in P$. Left and right multiplication are denoted by $L_a$ and $R_a$, with $R_a xi = xi a$; thus $R_a R_b = R_(b a)$. The tracial commutation theorem identifies $L \( P \)'$ with ${ R_a : a in P }$. The support notation for an $L^2$-vector is understood through its affiliated operator: if $xi = v \| xi \|$ is its polar decomposition, its left and right support projections are $v v^(*)$ and $v^(*) v$, respectively. They are equivalent in $P$, and in particular have the same trace. For a projection $r in P$, the condition that $R_b$ vanish on $L^2 \( P \) \( 1 - r \)$ is exactly $b = r b$. We use these standard facts, and standard-form theory for von Neumann algebras, without separability restrictions #cite(label("Takesaki1979")) #cite(label("Haagerup1975")).

=== 2.1 Uniform row and column estimates <uniform-row-and-column-estimates>

Dickson’s argument derives the row estimate from Haagerup’s little Grothendieck inequality and credits Christensen with the estimate in this form #cite(label("Dickson2014")) Lemmas 2.8–2.9; this is part of the factorization approach to similarity developed by Pisier #cite(label("Pisier1999Degree")) #cite(label("Pisier2001Remarks")). The estimate states that every bounded unital homomorphism $phi : A arrow.r cal(B) \( K \)$, for any unital $C^(*)$-algebra $A$, satisfies

#[#set math.equation(numbering: n => "(4)")
 $ parallel phi parallel_(upright("row")) lt.eq sqrt(2) thin parallel phi parallel^2 #h(2em) #cite(label("Dickson2014"))upright(" Lemma 2.9, Equation (19)") . $ <eq:dickson-row>]

The map $phi^sharp \( a \) = phi \( a^(*) \)^(*)$ is complex-linear and has the same norm as $phi$. It is again a homomorphism, since

$ phi^sharp \( a b \) = #scale(x: 120%, y: 120%)[\(] phi \( b^(*) \) phi \( a^(*) \) #scale(x: 120%, y: 120%)[\)]^(*) = phi^sharp \( a \) phi^sharp \( b \) . $

Apply (4) to $phi^sharp$ on the row $\[ a_1^(*) \, dots.h \, a_h^(*) \]$, and take the rectangular adjoint. This gives the same bound for $parallel phi parallel_(upright("col"))$. Consequently we fix the absolute constant

#[#set math.equation(numbering: n => "(5)")
 $ c_(upright("row")) = 4 sqrt(2) \, $ <eq:row-constant>]

which bounds both norms whenever $parallel phi parallel lt.eq 2$.

Let $A$ be a unital $C^(*)$-algebra. A #emph[rectangular derivation] for $*$-representations $sigma : A arrow.r cal(B) \( K \)$ and $lambda : A arrow.r cal(B) \( F \)$ is a linear map $Delta : A arrow.r cal(B) \( K \, F \)$ satisfying

#[#set math.equation(numbering: n => "(6)")
 $ Delta \( a b \) = Delta \( a \) sigma \( b \) + lambda \( a \) Delta \( b \) #h(2em) \( a \, b in A \) . $ <eq:rectangular-derivation>]

The derivation identity and unitality imply $Delta \( 1 \) = 0$.

#thm([Lemma 2.1.])[
  (Row and column bounds).  #emph[Every bounded rectangular derivation satisfies 
#[#set math.equation(numbering: n => "(7)")
 $ max { parallel Delta parallel_(upright("row")) \, parallel Delta parallel_(upright("col")) } lt.eq c_(upright("row")) parallel Delta parallel . $ <eq:rectangular-row-column>]

]
] <lem:row-column>

#proof[
  The assertion is immediate when $Delta = 0$. Otherwise put $d = parallel Delta parallel > 0$, and consider the upper triangular map
  #[#set math.equation(numbering: n => "(8)")
   $ Phi \( a \) = mat(delim: "(", lambda \( a \), d^(- 1) Delta \( a \); 0, sigma \( a \)) in cal(B) \( F xor K \) . $ <eq:triangular-homomorphism>]
  It is unital and multiplicative by (6). Its diagonal map is contractive, and its off-diagonal map has norm one; hence $parallel Phi parallel lt.eq 2$. The off-diagonal rectangular compression of $Phi_(p \, q)$, from $K^q$ to $F^p$, is $d^(- 1) Delta_(p \, q)$. The row and column estimates for $Phi$ give (7). ◻
]

=== 2.2 Completely bounded implementation <completely-bounded-implementation>

We use the quantitative completely bounded similarity theorem of Paulsen: if a unital homomorphism $phi : A arrow.r cal(B) \( H \)$ is completely bounded, there is an invertible $S in cal(B) \( H \)$ such that $S phi \( dot.op \) S^(- 1)$ is completely contractive and $parallel S parallel parallel S^(- 1) parallel lt.eq parallel phi parallel_(upright("cb"))$ #cite(label("Paulsen1984")) p. 226. For a unital $C^(*)$-algebra the resulting homomorphism is a $*$-homomorphism: a unitary and its inverse are sent to contractions, so the image is a unitary; unitaries linearly span the algebra. For the later cyclic-domain estimate, set

#[#set math.equation(numbering: n => "(9)")
 $ c_0 = \( 1 + 4 c_(upright("row")) \)^2 . $ <eq:cyclic-constant>]

#thm([Lemma 2.2.])[
  (Completely bounded rectangular derivations).  #emph[Let $sigma \, lambda \, Delta$ satisfy (6). If $Delta$ is completely bounded, then some $V in cal(B) \( K \, F \)$ satisfies 
#[#set math.equation(numbering: n => "(10)")
 $ Delta \( a \) = V sigma \( a \) - lambda \( a \) V #h(2em) \( a in A \) . $ <eq:rectangular-implementation>]

 If $d = parallel Delta parallel > 0$, one may choose 
$ parallel V parallel lt.eq d #scale(x: 120%, y: 120%)[\(] 1 + parallel Delta parallel_(upright("cb")) \/ d #scale(x: 120%, y: 120%)[\)]^2 . $

]
] <lem:cb-implementation>

#proof[
  We use the triangular-metric argument recalled in #cite(label("Ozawa2006"), form: "prose") Lemma 1.2, allowing different domain and codomain representations and keeping track of the implementer norm. For $Delta = 0$, take $V = 0$. Otherwise the map $Phi$ in (8) is completely bounded, with
  $ parallel Phi parallel_(upright("cb")) lt.eq 1 + parallel Delta parallel_(upright("cb")) \/ d = : G . $
  Choose the similarity $S$ supplied by Paulsen’s theorem, and put $D = S^(*) S$. The fact that $S Phi \( dot.op \) S^(- 1)$ preserves adjoints is equivalent to
  #[#set math.equation(numbering: n => "(11)")
   $ D Phi \( a \) = Phi \( a^(*) \)^(*) D #h(2em) \( a in A \) . $ <eq:intertwining-metric>]
  Write $D = \( D_(i j) \)_(i \, j = 1)^2$ relative to $F xor K$. Its first row in (11) gives
  #[#set math.equation(numbering: n => "(12)")
   $ D_11 lambda \( a \) & = lambda \( a \) D_11 \,\
d^(- 1) D_11 Delta \( a \) + D_12 sigma \( a \) & = lambda \( a \) D_12 . $ <eq:metric-blocks>]
  Since $D gt.eq parallel D^(- 1) parallel^(- 1) I$, its compression $D_11$ is positive invertible on $F$, with $parallel D_11^(- 1) parallel lt.eq parallel D^(- 1) parallel$. Its inverse also commutes with $lambda \( A \)$. Hence
  $ V = - d D_11^(- 1) D_12 $
  satisfies (10), by (12), and
  $ parallel V parallel lt.eq d thin parallel D^(- 1) parallel parallel D parallel = d thin #scale(x: 120%, y: 120%)[\(] parallel S^(- 1) parallel parallel S parallel #scale(x: 120%, y: 120%)[\)]^2 lt.eq d G^2 . $
  If either Hilbert space is zero, $Delta = 0$, so it has already been covered. ◻
]

=== 2.3 Cyclic domains <cyclic-domains>

The cyclic hypothesis needed below concerns only the domain $*$-representation. The output representation may have arbitrary multiplicity.

#thm([Lemma 2.3.])[
  (Column factorization in a cyclic representation).  #emph[Let $P subset cal(B) \( K \)$ be a unital von Neumann algebra with a cyclic vector. For every integer $h gt.eq 1$ and every unit vector $xi = \( xi_1 \, dots.h \, xi_h \) in K^h$, there are a unit vector $zeta in K$ and a contraction $v = \( v_i \) in M_(h \, 1) \( P \)$ such that $xi_i = v_i zeta$ for every $i$.]
] <lem:cyclic-factorization>

#proof[
  Put $N = P'$, and choose a cyclic vector $Omega$ for $P$. It separates $N$: if $x in N$ and $x Omega = 0$, then $x a Omega = a x Omega = 0$ for every $a in P$, whence $x = 0$. Let $L = overline(N Omega) subset K$. This subspace reduces $N$, and restriction $r : N arrow.r cal(B) \( L \)$ is faithful and normal. Indeed, an element in its kernel annihilates $Omega$; normality follows from compression to a reducing subspace. Thus it is a normal $*$-isomorphism onto the von Neumann algebra $r \( N \)$, and its inverse is normal. The vector $Omega$ is cyclic and separating for $r \( N \)$.
  The standard-form theorem for a representation with a cyclic separating vector realizes every normal positive functional on $r \( N \)$ as a vector functional, with its vector in the natural cone #cite(label("Haagerup1975")) Lemma 2.10(1), pp. 278–279. Apply it, through the normal isomorphism $r$, to
  $ omega \( x \) = sum_(i = 1)^h chevron.l x xi_i \, xi_i chevron.r \, #h(2em) x in N . $
  We obtain $zeta in L subset K$ such that $chevron.l x zeta \, zeta chevron.r = omega \( x \)$ for every $x in N$. In particular $parallel zeta parallel^2 = omega \( 1 \) = 1$. The assignment
  $ x zeta mapsto \( x xi_1 \, dots.h \, x xi_h \) \, #h(2em) x in N \, $
  is isometric, since both squared norms equal $omega \( x^(*) x \)$. It extends to an isometry from $overline(N zeta)$ into $K^h$. Extend it by zero on $overline(N zeta)^perp$, obtaining a contraction $v : K arrow.r K^h$. The subspace $overline(N zeta)$ reduces $N$, and the isometry intertwines the $N$-actions. Therefore $v x = x^(\( h \)) v$ for every $x in N$. Each coordinate $v_i$ lies in $N' = P$, and $v zeta = xi$, as required. All these constructions, including the standard-form assertion, are valid on nonseparable Hilbert spaces. ◻
]

#thm([Lemma 2.4.])[
  (Implementation on a cyclic domain).  #emph[Let $A$ be a unital $C^(*)$-algebra, let $sigma : A arrow.r cal(B) \( K \)$ and $lambda : A arrow.r cal(B) \( F \)$ be $*$-representations, and suppose that $sigma$ has a cyclic vector. Every bounded rectangular derivation $Delta : A arrow.r cal(B) \( K \, F \)$ is completely bounded, with 
#[#set math.equation(numbering: n => "(13)")
 $ parallel Delta parallel_(upright("cb")) lt.eq 4 c_(upright("row")) parallel Delta parallel . $ <eq:cyclic-cb>]

 Moreover there is $V in cal(B) \( K \, F \)$ such that 
#[#set math.equation(numbering: n => "(14)")
 $ Delta \( a \) = V sigma \( a \) - lambda \( a \) V quad \( a in A \) \, #h(2em) parallel V parallel lt.eq c_0 parallel Delta parallel . $ <eq:cyclic-implementation>]

]
] <lem:cyclic-implementation>

#proof[
  Zero spaces and the zero derivation are immediate, so assume they do not occur. Put $P = sigma \( A \)''$. Fix $h gt.eq 1$, $X in M_h \( A \)_1$, and a unit vector $xi in K^h$. Lemma 6 gives a unit vector $zeta in K$ and a contraction $v in M_(h \, 1) \( P \)$ with $v zeta = xi$.
  Matrix Kaplansky density gives a net of column contractions $z_alpha in M_(h \, 1) \( sigma \( A \) \)$ converging strongly to $v$. To see the rectangular assertion directly, regard $v$ as the first column of a matrix in $M_h \( P \)$, with all other columns zero. Approximate that matrix strongly by contractions in $M_h \( sigma \( A \) \)$, and compress to its first input coordinate. The $*$-image $sigma \( A \)$ is the $C^(*)$-quotient $A \/ ker sigma$, and the same quotient identification holds at each square matrix level. Consequently each $z_alpha$ lifts to $w_alpha in M_(h \, 1) \( A \)$ with
  #[#set math.equation(numbering: n => "(15)")
   $ parallel w_alpha parallel lt.eq 2 \, #h(2em) sigma_(h \, 1) \( w_alpha \) = z_alpha \, #h(2em) sigma_(h \, 1) \( w_alpha \) zeta arrow.r xi . $ <eq:cyclic-column-lifts>]
  For example, first lift the square matrix whose first column is $z_alpha$ and whose other columns vanish to a matrix of norm less than $2$, then compress its first column. Only fixed slack in the quotient norm is being used.
  Entrywise application of (6) gives
  $ Delta_h \( X \) sigma_(h \, 1) \( w_alpha \) = Delta_(h \, 1) \( X w_alpha \) - lambda_h \( X \) Delta_(h \, 1) \( w_alpha \) . $
  Since $lambda$ is completely contractive, Lemma 4 and (15) imply
  $ parallel Delta_h \( X \) sigma_(h \, 1) \( w_alpha \) zeta #scale(x: 120%, y: 120%)[parallel] lt.eq c_(upright("row")) parallel Delta parallel #scale(x: 120%, y: 120%)[\(] parallel X w_alpha parallel + parallel lambda_h \( X \) parallel parallel w_alpha parallel #scale(x: 120%, y: 120%)[\)] lt.eq 4 c_(upright("row")) parallel Delta parallel . $
  At the fixed finite level $h$, $Delta_h \( X \)$ is already a bounded operator. We may therefore take the limit in (15), obtaining the same bound on $parallel Delta_h \( X \) xi parallel$. Taking the supremum over $xi \, X \, h$ proves (13). The quotient argument did not require $Delta$ to vanish on $ker sigma$; its identity was applied to the chosen lifts in $A$. Lemma 5 and (9) now give (14). ◻
]

=== 2.4 The derivation criterion for similarity <the-derivation-criterion-for-similarity>

For the last step of the proof we use Kirchberg’s equivalence in its per-algebra form. We state the quantifiers because the final $*$-representation used to test derivations is independent of the bounded homomorphism in the similarity problem.

#thm([Theorem 2.5.])[
  (Kirchberg’s similarity–derivation equivalence).  #emph[For a unital $C^(*)$-algebra $A$, the following properties are equivalent.]
  + #emph[Every bounded unital homomorphism $pi : A arrow.r cal(B) \( H \)$, on any Hilbert space $H$, is similar by a bounded invertible operator to a $*$-homomorphism.]
  + #emph[For every faithful unital $*$-representation $sigma : A arrow.r cal(B) \( K \)$, on any Hilbert space $K$, every bounded linear map $Delta : A arrow.r cal(B) \( K \)$ satisfying 
$ Delta \( a b \) = Delta \( a \) sigma \( b \) + sigma \( a \) Delta \( b \) $

 has the form $Delta \( a \) = V sigma \( a \) - sigma \( a \) V$ for some $V in cal(B) \( K \)$.]
] <thm:kirchberg>

This is the theorem of #cite(label("Kirchberg1996"), form: "prose"); the exact formulation with every faithful representation is stated in #cite(label("Ozawa2006"), form: "prose") Theorem 1.1. The usual derivation property is stated without a continuity hypothesis. Ringrose’s automatic continuity theorem for derivations from $C^(*)$-algebras into Banach bimodules #cite(label("Ringrose1972")) Theorem 2, p. 434 makes it equivalent to the bounded version above. The triangular metric computation in Lemma 5 uses only Paulsen’s established completely bounded theorem; the unrestricted similarity conclusion will follow from Theorem 8 after all bounded derivations have been treated.

== 3 Free-product geometry and invariant tensors <sec:tensors>

Let $D$ be a $upright("II")_1$ factor generated as a von Neumann algebra by an increasing sequence $\( D_j \)$ of unital full matrix subalgebras whose sizes tend to infinity. Let $A_0$ be a finite von Neumann algebra with a faithful normal tracial state, and form the tracial von Neumann free product

$ cal(L) = D * A_0 . $

We use $tau$ for the free-product trace and its restrictions. Freeness here is scalar tracial freeness: the trace of an alternating product of centered letters from the two algebras is zero. Its Hilbert-space consequence is the orthogonal decomposition into reduced words, with each reduced-word space isometric to the corresponding Hilbert tensor product. This model comes from the free-product framework of #cite(label("Ching1973"), form: "prose") and #cite(label("Voiculescu1985"), form: "prose"). The corner estimate below is proved here from that word decomposition.

This section and the next two prove the following estimate. Its constant does not depend on the trace of the corner.

#thm([Theorem 3.1.])[
  (Free-product corner estimate).  #emph[Let $cal(L) = D * A_0$ be as above, let $t = 1 \/ N$ for an integer $N gt.eq 2$, and suppose that $G in cal(B) \( L^2 \( cal(L) \) \)$ commutes with $L_D$. Suppose that $epsilon.alt gt.eq 0$ and 
#[#set math.equation(numbering: n => "(16)")
 $ parallel \[ G \, L_x \] parallel lt.eq epsilon.alt parallel x parallel #h(2em) \( x in e cal(L) e \, med e in D upright(" a projection with ") tau \( e \) = t \) . $ <eq:free-corner-hypothesis>]

 If $s = s^(*) = s^(- 1) in A_0$ and $tau \( s \) = 0$, then 
#[#set math.equation(numbering: n => "(17)")
 $ ∥P_(L^2 \( A_0 \)) \[ G \, L_s \] \|_(L^2 \( A_0 \))∥ lt.eq c_1 epsilon.alt \, #h(2em) c_1 = 6 pi^2 \( 1 + 4 c_0 \) . $ <eq:free-corner-conclusion>]

]
] <thm:free-corner>

Since equal-trace projections in $D$ are unitarily conjugate, commutation with $L_D$ makes it equivalent to assume (16) for one such projection. Moreover, for $x in e cal(L) e$ the commutator in that equation is supported on $e L^2 \( cal(L) \)$. The proof of the theorem is completed after the Fourier compression calculation in Section 5.

=== 3.1 Factoriality and symmetrization <factoriality-and-symmetrization>

#thm([Lemma 3.2.])[
  #emph[One has $D' ∩ cal(L) = bb(C) 1$. In particular, $cal(L)$ is a $upright("II")_1$ factor.]
] <lem:free-factor>

#proof[
  Put $E = L^2 \( D \)$, $E^compose = E ⊖ bb(C) 1$, and $B^compose = L^2 \( A_0 \) ⊖ bb(C) 1$. Regrouping reduced words by their first and last $A_0$-letters gives the $D$–$D$ bimodule decomposition
  $ L^2 \( cal(L) \) ⊖ L^2 \( D \) tilde.equiv E ⊗ cal(V) ⊗ E \, #h(2em) cal(V) = xor.big_(n gt.eq 1) B^compose ⊗ \( E^compose ⊗ B^compose \)^(⊗ \( n - 1 \)) . $
  The endpoints in $E$ are unrestricted; expanding each as $bb(C) 1 xor E^compose$ recovers every reduced word containing an $A_0$-letter exactly once. Left and right $D$ act on the first and last factors, respectively.
  Choose a Haar unitary $v$ in a diffuse abelian subalgebra of $D$ and put $u_n = v^n$. These unitaries converge ultraweakly to zero in $D$. Indeed, the restriction of any normal functional to $W^(*) \( v \) tilde.equiv L^oo \( bb(T) \)$ has an $L^1 \( bb(T) \)$ density, whose Fourier coefficients tend to zero. Consequently $L_(u_n)$ and $R_(u_n^(*))$ converge weakly to zero on $E$: first test against bounded vectors in $D$, and then use their $L^2$ density. On elementary tensors the matrix coefficients of
  $ L_(u_n) R_(u_n^(*)) = L_(u_n) ⊗ I_(cal(V)) ⊗ R_(u_n^(*)) $
  therefore tend to zero. The same holds on the whole complement by density and uniform boundedness. A $D$-central vector in this complement is fixed by all these operators, and hence is zero.
  If $z in D' ∩ cal(L)$, its component perpendicular to $L^2 \( D \)$ is $D$-central, because the displayed decomposition is a bimodule decomposition. Thus $z = E_D \( z \) in D$, where $E_D$ is the trace-preserving conditional expectation. It follows that $z in Z \( D \) = bb(C) 1$. The center of $cal(L)$ is contained in this relative commutant. Its faithful finite trace and its diffuse subfactor $D$ then make $cal(L)$ a $upright("II")_1$ factor. ◻
]

For $u in cal(U) \( D \)$, let $theta_u$ be the trace-preserving free-product automorphism which equals $"Ad" u$ on $D$ and is the identity on $A_0$. Its Hilbert-space implementation $W_u$ acts by $theta_u$ on bounded words. In particular,

$ W_u L_x W_u^(*) = L_(theta_u \( x \)) \, #h(2em) W_u xi = xi quad \( xi in L^2 \( A_0 \) \) . $

#thm([Lemma 3.3.])[
  (Symmetrization).  #emph[In proving Theorem 9, one may suppose in addition that $G$ commutes with $W_u$ for every $u in union.big_j cal(U) \( D_j \)$. This replacement preserves the compressed commutator in (17) exactly, and preserves (16) for both $G$ and $G^(*)$.]
] <lem:free-symmetrization>

#proof[
  Average the original operator over each compact matrix unitary group:
  $ G_j = integral_(cal(U) \( D_j \)) W_u G W_u^(*) thin d mu_j \( u \) . $
  This weak operator integral is well defined. The unitary representation $u mapsto W_u$ is strongly continuous on each group, as is seen first on bounded reduced words and then by density. Every conjugate in the integral commutes with $L_D$. It also obeys (16), since $theta_u$ permutes the $D$-corners of trace $t$. Convexity and weak operator closedness of norm balls preserve these properties under integration and under a weak operator cluster limit $tilde(G)$ as $j arrow.r oo$. Such a limit exists because $parallel G_j parallel lt.eq parallel G parallel$. For fixed $u in cal(U) \( D_i \)$, all $G_j$ with $j gt.eq i$ commute with $W_u$, by Haar invariance. Thus $tilde(G)$ has every stated symmetry.
  The operators $W_u$ fix $L^2 \( A_0 \)$ pointwise and commute with $L_s$. For each conjugate, and therefore for the averages and their limit,
  $ P_(L^2 \( A_0 \)) \[ W_u G W_u^(*) \, L_s \] \|_(L^2 \( A_0 \)) = P_(L^2 \( A_0 \)) \[ G \, L_s \] \|_(L^2 \( A_0 \)) . $
  Finally, $\[ G^(*) \, L_x \] = - \[ G \, L_(x^(*)) \]^(*)$, so the hypothesis for a self-adjoint corner algebra also gives its adjoint version. The same applies to $tilde(G)$. ◻
]

For the remainder of the proof of Theorem 9, $G$ denotes the symmetrized operator. At the end we recover the original compressed commutator using Lemma 11.

=== 3.2 The word decomposition <the-word-decomposition>

Set

$ E = L^2 \( D \) \, quad E^compose = E ⊖ bb(C) 1 \, #h(2em) B = L^2 \( A_0 \) \, quad B^compose = B ⊖ bb(C) 1 \, #h(2em) J_k = \( B^compose \)^(⊗ k) ⊗ B . $

We use the following ordering of the reduced-word factors:

#[#set math.equation(numbering: n => "(18)")
 $ L^2 \( cal(L) \) = xor.big_(k gt.eq 0) cal(H)_k \, #h(2em) cal(H)_k = E ⊗ \( E^compose \)^(⊗ k) ⊗ J_k . $ <eq:word-decomposition>]

The tensor

$ d_0 ⊗ d_1 ⊗ dots.h.c ⊗ d_k ⊗ \( a_1 ⊗ dots.h.c ⊗ a_k ⊗ z \) $

represents the word $d_0 a_1 d_1 dots.h.c a_k d_k z$. Initially the letters may be taken bounded, with $d_i in D ⊖ bb(C) 1$ and $a_i in A_0 ⊖ bb(C) 1$ for $i gt.eq 1$, and unrestricted $d_0 in D$, $z in A_0$. Expanding the endpoints into scalar and centered parts produces all the usual reduced-word spaces exactly once. This proves both orthogonality and completeness in (18); the tensor notation then extends to arbitrary $L^2$-letters by the corresponding isometries. On each level, $L_D$ acts on the first factor, while $W_u$ conjugates all $k + 1$ factors coming from $D$ and fixes $J_k$.

We will show that $G$ preserves each word level $cal(H)_k$ and, on tensors with a repeated centered $D$ letter, changes only the $J_k$ factor. Scalar slices against fixed vectors in the $J_k$ and $J_l$ factors reduce these assertions to the following intertwiner calculation. Write $C_u xi = u xi u^(*)$ on $E$ and on its invariant subspace $E^compose$.

#thm([Lemma 3.4.])[
  (Invariant intertwiners).  #emph[Let $k \, l gt.eq 0$, and let 
$ Y : E ⊗ \( E^compose \)^(⊗ k) arrow.r E ⊗ \( E^compose \)^(⊗ l) $

 be bounded. Suppose that $Y$ intertwines the left $D$ actions and that 
$ Y C_u^(⊗ \( k + 1 \)) = C_u^(⊗ \( l + 1 \)) Y #h(2em) \( u in union.big_j cal(U) \( D_j \) \) . $

 Then $Y = 0$ if $k eq.not l$. If $k = l$, there are scalars $\( a_sigma \)_(sigma in S_k)$ such that 
$ Y = I_E ⊗ sum_(sigma in S_k) a_sigma U_sigma \, #h(2em) U_sigma \( x_1 ⊗ dots.h.c ⊗ x_k \) = x_(sigma^(- 1) \( 1 \)) ⊗ dots.h.c ⊗ x_(sigma^(- 1) \( k \)) . $

 For $k = 0$ the sum consists of the scalar multiple of the identity corresponding to the empty permutation.]
] <lem:invariant-intertwiners>

#proof[
  For a vector or algebra element $x in E$, put $x^compose = x - tau \( x \) 1$. On unrestricted variables $a \, x_1 \, dots.h \, x_k \, z_1 \, dots.h \, z_l in D$, define the complex multilinear form
  $ F \( a \, x \, z \) = ⟨Y \( 1 ⊗ x_1^compose ⊗ dots.h.c ⊗ x_k^compose \) \, a^(*) ⊗ \( z_1^(*) \)^compose ⊗ dots.h.c ⊗ \( z_l^(*) \)^compose⟩ . $
  It is multilinear with our convention that inner products are linear in the first argument. Fixing the tail vectors and taking their Hilbert-space slice of $Y$ gives an operator $T : E arrow.r E$ commuting with $L_D$. The tracial commutation theorem gives $T = R_b$ for a bounded $b in D$, with
  $ parallel b parallel = parallel T parallel lt.eq parallel Y parallel product_i parallel x_i^compose parallel_2 product_j parallel \( z_j^(*) \)^compose parallel_2 . $
  Since $F \( a \, x \, z \) = tau \( a b \)$, this yields the endpoint estimate
  #[#set math.equation(numbering: n => "(19)")
   $ \| F \( a \, x \, z \) \| lt.eq parallel Y parallel thin parallel a parallel_1 product_(i = 1)^k parallel x_i parallel_2 product_(j = 1)^l parallel z_j parallel_2 . $ <eq:coefficient-bound>]
  The same slice also identifies coefficients with arbitrary bounded first endpoints: replacing $1 \, a^(*)$ by $d \, c$ replaces $a$ by $c^(*) d$, because $chevron.l d b \, c chevron.r = tau \( c^(*) d b \)$.
  #emph[Finite matrix invariants and stable coefficients.] Put $p = 1 + k + l$ and restrict all variables to a stage $D_j tilde.equiv M_m \( bb(C) \)$. The intertwining assumption says that $F$ is invariant under simultaneous unitary conjugation. To see precisely the finite-dimensional consequence, label its variables $v_0 \, dots.h \, v_(p - 1)$. Every multilinear form on $M_m^p$ has a unique expression
  $ "Tr" #scale(x: 120%, y: 120%)[\(] A \( v_0 ⊗ dots.h.c ⊗ v_(p - 1) \) #scale(x: 120%, y: 120%)[\)] #h(2em) \( A in "End" \( \( bb(C)^m \)^(⊗ p) \) \) \, $
  by the nondegenerate trace pairing. Conjugation invariance is equivalent to $A$ commuting with every $u^(⊗ p)$. Finite-dimensional Schur–Weyl duality identifies this commutant with the span of the tensor permutation operators; they are linearly independent when $m gt.eq p$ #cite(label("GrinkoOzols2024")) Theorem 3.1. Taking their trace pairings gives the cycle-trace forms
  $ Phi_pi \( v_0 \, dots.h \, v_(p - 1) \) = product_(\( i_1 thin dots.h.c thin i_r \) upright(" a cycle of ") pi) tau \( v_(i_1) dots.h.c v_(i_r) \) \, #h(2em) pi in S_p . $
  Here cycles follow the successor convention of the displayed product; reversing the convention only reindexes the permutations. The normalization from $"Tr"$ to $tau$ multiplies each form by a nonzero scalar, so these forms are also independent for $m gt.eq p$. Thus
  $ F \|_(D_j^p) = sum_(pi in S_p) lambda_(pi \, j) Phi_pi . $
  This identity is on #emph[unrestricted] matrix variables: the centering occurs inside the definition of $F$. Under a unital inclusion of full matrix stages, normalized traces agree, and hence every $Phi_pi$ restricts to the identically defined form on the smaller stage. Uniqueness on any smaller stage of size at least $p$ proves that $lambda_(pi \, j)$ is independent of $j$ from that point onward. Denote it by $lambda_pi$.
  #emph[Isolating coefficients before restricting to centered tails.] The invariant-theory step has expressed every coefficient through finitely many cycle-trace forms with coefficients fixed across matrix stages. We now use the endpoint bound to remove long cycles, then Hilbert-space boundedness to remove pairs within one side. Fix $pi in S_p$. Choose distinct matrix indices for the slots and put $v_i = e_(i \, pi \( i \))$. In a nonzero product of these matrix units, the variable in slot $i$ must be followed by the variable whose initial index is $pi \( i \)$. Closing each product under its trace therefore forces exactly the cycles of $pi$. Consequently
  $ Phi_rho \( v_0 \, dots.h \, v_(p - 1) \) = cases(delim: "{", m^(- c \( pi \)) \, & rho = pi \,, 0 \, & rho eq.not pi \,) $
  where $c \( pi \)$ is the number of cycles. Every chosen matrix unit has $L^1$ norm $m^(- 1)$ and $L^2$ norm $m^(- 1 \/ 2)$, including diagonal units. Applying (19) gives
  $ \| lambda_pi \| m^(- c \( pi \)) lt.eq parallel Y parallel m^(- 1 - \( k + l \) \/ 2) . $
  The coefficient is fixed while the stage size tends to infinity. It follows that
  $ lambda_pi = 0 #h(2em) upright("if") #h(2em) c \( pi \) < 1 + frac(k + l, 2) . $
  Now restrict the $k + l$ tail variables to centered matrices. Any form with a singleton tail cycle vanishes. For a permutation with no such singleton, let $r$ be the length of the cycle containing the distinguished variable $a = v_0$. Its number of cycles is at most
  $ 1 + frac(k + l - \( r - 1 \), 2) . $
  If $r > 1$, this is below the required threshold. If $r = 1$, the threshold is attained only when every tail cycle has length two. Thus the only remaining terms have $a$ as a singleton and pair all tail slots. On centered tails,
  $ F \( a \, x \, z \) = tau \( a \) sum_(cal(P)) lambda_(cal(P)) product_({ i \, j } in cal(P)) tau \( v_i v_j \) \, $
  where $cal(P)$ ranges over pairings of the tail slots. There are no terms when the number of tail slots is odd.
  Using $a = c^(*) d$ gives the corresponding simple-tensor coefficients with first endpoints $d \, c$ in the union of the matrix stages. These formulas extend to arbitrary endpoints in $E$ and arbitrary centered $L^2$ tail letters. Indeed, that union is $L^2$ dense, the left side is continuous in its individual $L^2$ letters, and each factor on the right is continuous by $\| tau \( u v \) \| lt.eq parallel u parallel_2 parallel v parallel_2$. At this point the assertion is continuity of coefficients on simple tensors, not boundedness of each pairing on the completed tensor product.
  #emph[Excluding pairings within one side.] Choose an infinite orthonormal family $\( h_n \)$ of self-adjoint centered vectors in $E$. For example, normalized real trigonometric functions of a Haar unitary give such a family. Then $tau \( h_n h_m \) = delta_(n m)$. Fix a pairing $cal(P)$, with $r_s$ pairs entirely in the source slots and $r_t$ entirely in the test slots. Assign a disjoint infinite pool of the $h_n$ to each pair. For each source–test pair, use one fixed member of its pool in both slots. For each source–source pair, sum the source tensor over $M$ members of its pool, placing the same member in its two slots, independently for the different pairs. Form the test tensor analogously for the test–test pairs. Take both first endpoints to be $1$.
  In any term of the expanded coefficient every label occurs exactly twice, in the positions assigned by $cal(P)$, and different pairs have different labels. Hence all other pairings contribute zero. The resulting coefficient is exactly $lambda_(cal(P)) M^(r_s + r_t)$. The source summands are orthonormal, as are the test summands, so the product of the two tensor norms is $M^(\( r_s + r_t \) \/ 2)$. Boundedness of $Y$ gives
  $ \| lambda_(cal(P)) \| M^(r_s + r_t) lt.eq parallel Y parallel M^(\( r_s + r_t \) \/ 2) . $
  Letting $M arrow.r oo$ proves $lambda_(cal(P)) = 0$ whenever $r_s + r_t > 0$. The argument also applies when one side has no tail slots.
  All surviving pairs therefore join a source slot to a test slot, which requires $k = l$. If these numbers differ, all simple-tensor coefficients vanish and $Y = 0$. Otherwise these pairings are indexed by bijections $sigma in S_k$, and the coefficients are
  $ tau \( c^(*) d \) sum_(sigma in S_k) a_sigma product_(i = 1)^k tau \( x_i z_(sigma \( i \)) \) . $
  Since $tau \( x_i z_j \) = chevron.l x_i \, z_j^(*) chevron.r$, these are precisely the coefficients of $I_E ⊗ sum_sigma a_sigma U_sigma$. Equality against all elementary test tensors, and their density, proves the asserted operator identity. ◻
]

#thm([Lemma 3.5.])[
  (Word structure).  #emph[The symmetrized operator $G$ preserves every level $cal(H)_k$ in (18). There are operators $B_k in cal(B) \( J_k \)$, with $parallel B_k parallel lt.eq parallel G parallel$, such that, for all $d_0 in E$, $x in E^compose$, and $alpha in J_k$, 
#[#set math.equation(numbering: n => "(20)")
 $ G \( d_0 ⊗ x^(⊗ k) ⊗ alpha \) & = d_0 ⊗ x^(⊗ k) ⊗ B_k alpha \,\
G^(*) \( d_0 ⊗ x^(⊗ k) ⊗ alpha \) & = d_0 ⊗ x^(⊗ k) ⊗ B_k^(*) alpha . $ <eq:repeated-letter>]

 These are identities in the full space $L^2 \( cal(L) \)$. The operators $B_k$ are independent of the repeated letter $x$; in particular, $x$ may be any complex centered $L^2$ vector.]
] <lem:word-structure>

#proof[
  Let $P_k$ be the level projection. It commutes with $L_D$ and all $W_u$. For $alpha in J_k$ and $beta in J_l$, take the scalar slice in these factors of $P_l G P_k$ to obtain an operator
  $ Y_(alpha \, beta) : E ⊗ \( E^compose \)^(⊗ k) arrow.r E ⊗ \( E^compose \)^(⊗ l) \, #h(2em) parallel Y_(alpha \, beta) parallel lt.eq parallel G parallel parallel alpha parallel parallel beta parallel . $
  It satisfies the hypotheses of Lemma 12. For $k eq.not l$ every such slice vanishes, so $P_l G P_k = 0$. Thus the levels reduce $G$.
  Fix a unit vector $h in E^compose$ and let $V_k : J_k arrow.r cal(H)_k$ be the isometry $V_k alpha = 1 ⊗ h^(⊗ k) ⊗ alpha$. Define $B_k = V_k^(*) G V_k$. On an equal-level scalar slice, the lemma gives
  $ Y_(alpha \, beta) = I_E ⊗ sum_(sigma in S_k) a_sigma \( alpha \, beta \) U_sigma \, #h(2em) chevron.l B_k alpha \, beta chevron.r = sum_(sigma in S_k) a_sigma \( alpha \, beta \) . $
  Every $U_sigma$ fixes $x^(⊗ k)$ for every $x in E^compose$. Consequently the last scalar is independent of the unit letter used to define $V_k$. The same slice identity, now tested against arbitrary endpoint and tail vectors and arbitrary $beta$, gives the first equality in (20). These tests determine the whole output on level $k$, and the other levels have already been excluded. This also proves the assertion for every endpoint $d_0 in E$, with no boundedness requirement on its representative. No self-adjointness of $x$ is used: the relevant cross contraction is $tau \( x z \) = chevron.l x \, z^(*) chevron.r$.
  The same argument applies to $G^(*)$. Its induced operator on $J_k$ is $V_k^(*) G^(*) V_k = \( V_k^(*) G V_k \)^(*) = B_k^(*)$, proving the second equality. ◻
]

At level zero the lemma says $G \|_(cal(H)_0) = I_E ⊗ B_0$. Since $B = L^2 \( A_0 \)$ is the subspace $bb(C) 1 ⊗ B$ there, the quantity to be estimated in Theorem 9, after symmetrization, is exactly

$ ∥P_B \[ G \, L_s \] \|_B∥ = parallel \[ B_0 \, L_s \|_B \] parallel . $

== 4 Propagation from small corners <sec:propagation>

Continue with the notation and hypotheses of Theorem 9, and set $H = L^2 \( cal(L) \)$. After Lemma 11, we may use the symmetrized operator $G$ and the operators $B_k in cal(B) \( J_k \)$ from Lemma 13. Our goal is to compare the action of $B_k$ with that of $B_0$ along repeated letters, with an error independent of $k$. We first extract a consequence of the small-corner hypothesis that needs only the exact commutation with $L_D$.

#thm([Lemma 4.1.])[
  (Full columns from a small corner).  #emph[For every projection $r in cal(L)$ with $tau \( r \) lt.eq t$, there is $b in cal(L)$ with $b = r b$ such that 
#[#set math.equation(numbering: n => "(21)")
 $ parallel \( G - R_b \) \|_(H r) parallel lt.eq c_0 epsilon.alt . $ <eq:full-column>]

 The same assertion holds for $G^(*)$.]
] <lem:full-column>

#proof[
  The case $r = 0$ is immediate. Fix $r eq.not 0$ and a projection $e in D$ with $tau \( e \) = t$. The factoriality established in Lemma 10 and comparison of projections give $r' lt.eq e$ and a partial isometry $v in cal(L)$ such that $v^(*) v = r$ and $v v^(*) = r'$. Right multiplication by $v^(*)$ is a unitary left $e cal(L) e$-module map
  $ e H r arrow.r e H r' \, #h(2em) xi mapsto xi v^(*) . $
  Indeed its inverse is right multiplication by $v$, and
  $ parallel xi v^(*) parallel_2^2 = tau \( v xi^(*) xi v^(*) \) = tau \( xi^(*) xi r \) = parallel xi parallel_2^2 . $
  These equalities also hold for $L^2$ vectors by continuity. The vector $r'$ is cyclic for the left action of $e cal(L) e$ on $e H r'$, since $\( e cal(L) e \) r' = e cal(L) r'$ is dense in that Hilbert space. Thus $e H r$ is a cyclic domain representation of the unital algebra $e cal(L) e$.
  Since $G$ commutes with $L_e$, its restriction defines a bounded map $G_e : e H r arrow.r e H$. On these domain and codomain representations the map
  $ Delta \( a \) = G_e L_a \|_(e H r) - L_a G_e \, #h(2em) a in e cal(L) e \, $
  is a rectangular derivation of norm at most $epsilon.alt$, by (16). Lemma 7 therefore supplies an exact intertwiner $T : e H r arrow.r e H$ with
  $ T L_a \|_(e H r) = L_a T quad \( a in e cal(L) e \) \, #h(2em) parallel G_e - T parallel lt.eq c_0 epsilon.alt . $
  The value $t = 1 \/ N$ allows an extension that preserves this norm. Choose $v_1 \, dots.h \, v_N in D$ with
  $ v_i^(*) v_i = e \, #h(2em) v_i v_i^(*) perp v_j v_j^(*) med \( i eq.not j \) \, #h(2em) sum_(i = 1)^N v_i v_i^(*) = 1 . $
  The maps $\( xi_i \) mapsto sum_i v_i xi_i$ identify $\( e H r \)^N$ with $H r$ and $\( e H \)^N$ with $H$ unitarily. Define
  $ tilde(T) (sum_(i = 1)^N v_i xi_i) = sum_(i = 1)^N v_i T xi_i \, #h(2em) xi_i in e H r . $
  In these coordinates $tilde(T)$ is $T^(\( N \))$, and $G \|_(H r)$ is $G_e^(\( N \))$, because $G$ commutes with each $L_(v_i)$. Consequently
  $ parallel G \|_(H r) - tilde(T) parallel = parallel G_e - T parallel lt.eq c_0 epsilon.alt . $
  For $a in cal(L)$, its left action has matrix entries $L_(v_i^(*) a v_j)$ in both coordinate systems. Every $v_i^(*) a v_j$ lies in $e cal(L) e$, so the intertwining identity for $T$ implies $tilde(T) L_a \|_(H r) = L_a tilde(T)$.
  Extend $tilde(T)$ by zero on $H \( 1 - r \)$. Since $R_r$ commutes with all left multiplications, this extension belongs to $L \( cal(L) \)'$ and hence is $R_b$ for a bounded $b in cal(L)$, by the tracial commutation theorem. Its vanishing on $H \( 1 - r \)$ says $R_b = R_b R_r$, which, with the convention $R_b xi = xi b$, gives $b = r b$. This proves (21). Finally $G^(*)$ commutes with $L_D$ and $\[ G^(*) \, L_a \] = - \[ G \, L_(a^(*)) \]^(*)$, so all the same hypotheses and estimates hold for $G^(*)$. ◻
]

#thm([Lemma 4.2.])[
  (Propagation along repeated letters).  #emph[For every $k gt.eq 1$ and $v in B = L^2 \( A_0 \)$, 
#[#set math.equation(numbering: n => "(22)")
 $ parallel B_k \( s^(⊗ k) ⊗ v \) - s^(⊗ k) ⊗ B_0 v parallel lt.eq 2 c_0 epsilon.alt parallel v parallel_2 . $ <eq:propagation>]

 This also holds with $B_k^(*)$ and $B_0^(*)$ in place of $B_k$ and $B_0$.]
] <lem:propagation>

#proof[
  Fix $k gt.eq 1$ and first take $v in A_0$; the zero vector is harmless. Choose a nonzero projection $q in D$ with $a = tau \( q \) lt.eq t$. The left support of $q v$ is dominated by $q$. Its right support $r$ is equivalent to its left support by polar decomposition, so $tau \( r \) lt.eq a lt.eq t$. Choose $b = r b$ as in Lemma 14 for this $r$, and put
  $ y = q v b - q B_0 v . $
  The level-zero identity in (20) gives $G \( q v \) = q B_0 v$, and the tensor decomposition gives $parallel q v parallel_2 = sqrt(a) thin parallel v parallel_2$. It follows that
  #[#set math.equation(numbering: n => "(23)")
   $ q y = y \, #h(2em) parallel y parallel_2 lt.eq c_0 epsilon.alt sqrt(a) thin parallel v parallel_2 . $ <eq:propagation-error-vector>]
  The vector $B_0 v$ need only belong to $L^2 \( A_0 \)$; every expression here uses bounded left multiplication on this vector.
  Let $z$ be a Haar unitary of $q D q$ for its normalized trace, and set $x_n = a^(- 1 \/ 2) z^n$ for $n gt.eq 1$. Then
  $ tau \( x_n \) = 0 \, quad parallel x_n parallel_2 = 1 \, quad x_n^(*) x_n = x_n x_n^(*) = a^(- 1) q \, #h(2em) x_n \, x_n^(*) harpoon.rt 0 med upright("in ") L^2 \( D \) . $
  The weak convergence follows, for example, from orthonormality of the positive and negative powers. The reduced words $xi_n = \( s x_n \)^k v$ have norm $parallel v parallel_2$ and right support at most $r$, because their last $x_n$ satisfies $x_n q = x_n$. With $A_n = \( s x_n \)^(k - 1) s$, we have
  $ xi_n b - \( s x_n \)^k B_0 v = A_n x_n y . $
  Thus (21) yields
  #[#set math.equation(numbering: n => "(24)")
   $ parallel G xi_n - \( s x_n \)^k B_0 v parallel_2 lt.eq c_0 epsilon.alt parallel v parallel_2 + parallel A_n x_n y parallel_2 . $ <eq:propagation-prefix>]
  To estimate the second term, write (18) as $H = E ⊗ F$, where
  $ F = xor.big_(l gt.eq 0) \( E^compose \)^(⊗ l) ⊗ J_l \, $
  and let $P_(upright("sc"))$ be projection onto $bb(C) 1 ⊗ F$. This projection keeps every word level and selects the scalar component of its first $D$ factor. On this decomposition left multiplication by $x_n$ acts on $E$. With inner products linear in the first variable, define $ell_n \( eta \) = chevron.l eta \, x_n^(*) chevron.r$. Then
  $ P_(upright("sc")) \( x_n y \) = 1 ⊗ \( ell_n ⊗ I_F \) y \, #h(2em) parallel ell_n parallel = 1 . $
  For each elementary tensor this expression tends to zero in norm, since $x_n^(*) harpoon.rt 0$. Approximating the fixed vector $y$ by finite tensor sums, and using the common bound $parallel ell_n parallel = 1$, proves
  #[#set math.equation(numbering: n => "(25)")
   $ parallel P_(upright("sc")) \( x_n y \) parallel_2 arrow.r 0 . $ <eq:vanishing-tensor-coefficient>]
  On $\( 1 - P_(upright("sc")) \) H$, multiplication by $A_n$ prepends a reduced centered word ending in $s$ to a leading centered $D$ letter. Each prefix letter has $L^2$ norm one, so this restriction is an isometry. On $P_(upright("sc")) H$ we use the bound $parallel L_(A_n) parallel lt.eq a^(- \( k - 1 \) \/ 2)$. Also $q y = y$ gives
  $ parallel x_n y parallel_2^2 = chevron.l L_(x_n^(*) x_n) y \, y chevron.r = a^(- 1) parallel y parallel_2^2 . $
  Consequently
  $ parallel A_n x_n y parallel_2 lt.eq parallel \( 1 - P_(upright("sc")) \) x_n y parallel_2 + a^(- \( k - 1 \) \/ 2) parallel P_(upright("sc")) x_n y parallel_2 \, $
  and (25) implies
  $ limsup_n parallel A_n x_n y parallel_2 lt.eq a^(- 1 \/ 2) parallel y parallel_2 lt.eq c_0 epsilon.alt parallel v parallel_2 . $
  Here $q \, k \, v \, b \, y$ are all fixed before $n$ tends to infinity. The possibly large prefix bound therefore disappears with the vanishing coefficient; a convergence rate uniform in $a$ or $k$ is unnecessary.
  By the full-output identity (20), the left side of (24) equals
  $ parallel B_k \( s^(⊗ k) ⊗ v \) - s^(⊗ k) ⊗ B_0 v parallel $
  for every $n$: its endpoint and repeated $D$ factors all have norm one. Taking the limit superior proves (22) for bounded $v$. Density of $A_0$ in $B$ and boundedness of the operators extend it to all $v in B$. Applying the same argument to $G^(*)$, using the adjoint identities of Lemma 13, gives the final assertion. ◻
]

The propagation estimate now controls all word levels with the same error. We assemble orthogonal copies of $B$ from these levels; this will allow a single compressed commutator to test $B_0$.

Choose $e in D$ with $tau \( e \) = t$ and $p in D$ with $e lt.eq p$ and $tau \( p \) = 1 \/ 2$; this is possible since $t lt.eq 1 \/ 2$. Set

#[#set math.equation(numbering: n => "(26)")
 $ d = 2 p - 1 \, #h(2em) w = d s \, #h(2em) u = tau_p \( e \) = 2 t \, #h(2em) tau_p = 2 tau \|_(p cal(L) p) . $ <eq:dihedral-parameters>]

The elements $d$ and $s$ are free centered symmetries. For $k gt.eq 0$ define

$ U_k : B arrow.r e H \, #h(2em) U_k v = t^(- 1 \/ 2) e w^(- k) v = t^(- 1 \/ 2) e \( s d \)^k v . $

In (18), this is the tensor with endpoint $t^(- 1 \/ 2) e$, repeated $D$ letter $d$, and last factor $s^(⊗ k) ⊗ v$. Hence each $U_k$ is an isometry, its range belongs to level $k$, and these ranges are mutually orthogonal. Put

$ cal(K) = overline(xor.big_(k gt.eq 0) U_k B) subset e H . $

Via the $U_k$, identify $cal(K)$ with $ell^2 \( bb(N)_0 \) ⊗ B$, where $bb(N)_0 = { 0 \, 1 \, dots.h }$, and set $J = I ⊗ B_0$. Denote the inclusion $cal(K) arrow.r.hook H$ by $iota$.

#thm([Lemma 4.3.])[
  (Compression of the commutator).  #emph[For every $h in e cal(L) e$, 
#[#set math.equation(numbering: n => "(27)")
 $ parallel \[ J \, iota^(*) L_h iota \] parallel lt.eq \( 1 + 4 c_0 \) epsilon.alt parallel h parallel . $ <eq:compression-bound>]

]
] <lem:compressed-commutator>

#proof[
  Lemma 15 and (20) give
  $ parallel G U_k v - U_k B_0 v parallel_2 lt.eq 2 c_0 epsilon.alt parallel v parallel_2 \, $
  with zero error for $k = 0$. Each error lies in level $k$ by Lemma 13. Their squared norms therefore add on finite orthogonal sums. Passing to the closure, and repeating the argument for $G^(*)$, gives the full-codomain estimates
  #[#set math.equation(numbering: n => "(28)")
   $ parallel G iota - iota J parallel lt.eq 2 c_0 epsilon.alt \, #h(2em) parallel G^(*) iota - iota J^(*) parallel lt.eq 2 c_0 epsilon.alt . $ <eq:two-inclusion-errors>]
  Write $R = G iota - iota J$, $R' = G^(*) iota - iota J^(*)$, and $T_h = iota^(*) L_h iota$. Taking the adjoint of the second error identity gives $iota^(*) G = J iota^(*) + \( R' \)^(*)$. A direct expansion now yields
  $ iota^(*) \[ G \, L_h \] iota = \[ J \, T_h \] + \( R' \)^(*) L_h iota - iota^(*) L_h R . $
  Apply (16) to the first term and (28) to the other two. Their bounds are $epsilon.alt parallel h parallel$, $2 c_0 epsilon.alt parallel h parallel$, and $2 c_0 epsilon.alt parallel h parallel$, proving (27). ◻
]

== 5 Free compression and the Hankel test <sec:hankel>

Retain $e \, p \, d \, w \, u$, the isometries $U_k$, and the subspace $cal(K)$ from the preceding section. We construct $h in e cal(L) e$ whose norm is of order $u$ and whose compression to $cal(K)$ has a Hankel component of the same order, with a uniform lower bound after division by $u$.

=== 5.1 The dihedral corner <the-dihedral-corner>

Let $cal(C) = W^(*) \( d \, s \)$. Freeness of the centered symmetries $d \, s$ shows that their alternating reduced words, together with $1$, form an orthonormal word basis of $L^2 \( cal(C) \)$. These are precisely the group words of the infinite dihedral group. In particular,

$ w = d s upright(" is a Haar unitary") \, #h(2em) d w d = w^(- 1) \, #h(2em) p = \( 1 + d \) \/ 2 . $

Write $m$ for Haar probability measure on $bb(T)$.

#thm([Lemma 5.1.])[
  (The abelian corner and corner freeness).  #emph[The algebra $p cal(C) p$ is identified with the even functions on the circle by 
#[#set math.equation(numbering: n => "(29)")
 $ p cal(C) p = { f \( w \) p : f in L^oo \( bb(T) \, m \) \, med f \( z \) = f \( z^(- 1) \) } \,\
tau_p \( f \( w \) p \) = integral_(bb(T)) f thin d m . $ <eq:dihedral-corner>]

 The map $f mapsto f \( w \) p$ in this formula is a faithful normal unital $*$-isomorphism onto the corner. Moreover, $p D p$ and $p cal(C) p$ are free with respect to the normalized trace $tau_p$.]
] <lem:dihedral-corner>

#proof[
  Every group word has the form $w^l$ or $w^l d$, $l in bb(Z)$. Since $d p = p$ and $d w^l d = w^(- l)$,
  $ p w^l d p = p w^l p = frac(w^l + w^(- l), 2) p . $
  An even function of $w$ commutes with $d$ and hence with $p$. Thus $f mapsto f \( w \) p$ is a normal $*$-homomorphism on the even-function algebra, with unit $p$. The group trace gives
  $ tau_p \( f \( w \) p \) = 2 tau \( f \( w \) p \) = tau \( f \( w \) \) + tau \( f \( w \) d \) = integral_(bb(T)) f thin d m \, $
  initially for trigonometric polynomials and then for bounded functions by $L^2$ approximation. In particular the map is faithful, and its range is a von Neumann algebra. The compressed group-word span is strongly dense in $p cal(C) p$ and consists of even Laurent polynomials times $p$. This proves (29) and the isomorphism assertion. It also gives
  $ parallel f \( w \) p parallel = parallel f parallel_oo \, #h(2em) parallel f \( w \) p parallel_(2 \, tau_p) = parallel f parallel_(L^2 \( m \)) . $
  For freeness, let $a_1 \, dots.h \, a_j in p D p$ be centered for $tau_p$. Then $tau \( a_i \) = 0$ and $a_i d = a_i$. The centered trigonometric span in $p cal(C) p$ is generated by the elements $p w^l p$, $l gt.eq 1$. For $l_1 \, dots.h \, l_j gt.eq 1$, absorbing the corner projections and using traciality gives
  $ & tau_p \( a_1 p w^(l_1) p dots.h.c a_j p w^(l_j) p \)\
 & #h(2em) = 2 tau \( a_1 w^(l_1) dots.h.c a_j w^(l_j) \)\
 & #h(2em) = 2 tau #scale(x: 120%, y: 120%)[\(] a_1 s \( d s \)^(l_1 - 1) dots.h.c a_j s \( d s \)^(l_j - 1) #scale(x: 120%, y: 120%)[\)] = 0 . $
  All the displayed $D$ letters are centered, and $s$ is centered and free from the whole algebra $D$, by $cal(L) = D * A_0$. Thus the last word is a reduced alternating word of trace zero. Fejér means of an even bounded zero-mean function are even zero-mean trigonometric polynomials, are uniformly bounded, and converge in $L^2 \( m \)$. Approximating each corner letter in this manner extends the vanishing to all cyclic alternating products of even length. Products of odd alternating length have their endpoints in the same algebra. Move one endpoint cyclically next to the other, split their product into its centered and scalar parts, and apply the even-length case and induction on the length. The length-one case is centeredness. This proves freeness. ◻
]

=== 5.2 The expectation and the norm of a free compression <the-expectation-and-the-norm-of-a-free-compression>

#thm([Lemma 5.2.])[
  (Free compression).  #emph[For $b = b^(*) in p cal(C) p$ with $tau_p \( b \) = 0$, 
#[#set math.equation(numbering: n => "(30)")
 $ E_(cal(C)) \( e b e \) = u^2 b \, #h(2em) parallel e b e parallel lt.eq 2 sqrt(u) thin parallel b parallel_(2 \, tau_p) + u parallel b parallel \, #h(2em) u = tau_p \( e \) . $ <eq:free-compression>]

 Here $E_(cal(C))$ is the trace-preserving conditional expectation from $cal(L)$ onto $cal(C)$.]
] <lem:free-compression>

#proof[
  Put $cal(A) = p D p$, $cal(Z) = p cal(C) p$, and $a = e - u p in cal(A)$, so $tau_p \( a \) = 0$. Since $p in cal(C)$, bimodularity shows that $E_(cal(C)) \( e b e \)$ belongs to $cal(Z)$. On $p cal(L) p$, its restriction is the trace-preserving expectation onto $cal(Z)$ for $tau_p$. Expand
  $ e b e = u^2 b + u \( a b + b a \) + a b a . $
  Freeness gives zero expectation for $a b$ and $b a$. For the last term, test against any $c in cal(Z)$ and write $c = c^compose + tau_p \( c \) p$. Freeness and traciality give
  $ tau_p \( c^compose a b a \) = 0 \, #h(2em) tau_p \( a b a \) = tau_p \( b a^2 \) = tau_p \( b \) tau_p \( a^2 \) = 0 . $
  Thus $E_(cal(Z)) \( a b a \) = 0$ also. This proves the expectation formula.
  For the norm estimate work in
  $ H_c = L^2 \( W^(*) \( cal(A) \, cal(Z) \) \, tau_p \) . $
  This representation is faithful, so its operator norm is the algebra norm. The free-word decomposition, grouping a possible initial $cal(A)$ letter, takes the form
  $ H_c = L^2 \( cal(A) \, tau_p \) ⊗ F_0 \, #h(2em) F_0 = bb(C) Omega xor F_0^compose \, $
  where $F_0^compose$ is the closed span of reduced words starting in the centered $L^2$ subspace $cal(Z)^compose$. Let $Q_0$ be the projection of $F_0$ onto the complement of the vacuum, and let $Pi$ project in $H_c$ onto words starting in $cal(Z)^compose$. Then
  $ Pi = \| 1_(cal(A)) chevron.r chevron.l 1_(cal(A)) \| ⊗ Q_0 \, #h(2em) L_e = lambda_(cal(A)) \( e \) ⊗ I_(F_0) \, $
  where $1_(cal(A)) = p$ has $L^2 \( tau_p \)$ norm one. Consequently
  #[#set math.equation(numbering: n => "(31)")
   $ parallel L_e Pi parallel = parallel Pi L_e parallel lt.eq parallel e parallel_(2 \, tau_p) = sqrt(u) . $ <eq:corner-overlap>]
  The following three blocks are the standard creation, annihilation, and diagonal decomposition of a centered free-product letter; see #cite(label("RicardXu2006"), form: "prose") Section 1, Lemmas 2.1–2.3 and Corollary 2.4. We give the bounds needed here directly. Let $T = L_b$ on $H_c$. Because $b$ is centered, on the vacuum and on words starting in $cal(A)^compose$ its left action simply prepends the letter $b$. Therefore
  $ \( 1 - Pi \) T \( 1 - Pi \) = 0 \, #h(2em) parallel Pi T \( 1 - Pi \) parallel lt.eq parallel b parallel_(2 \, tau_p) . $
  Self-adjointness gives the same bound for $\( 1 - Pi \) T Pi$, and $parallel Pi T Pi parallel lt.eq parallel b parallel$. Decomposing $T$ into these three blocks, using $parallel L_e parallel lt.eq 1$, and applying (31), we obtain
  $ parallel e b e parallel = parallel L_e T L_e parallel & lt.eq parallel L_e Pi T \( 1 - Pi \) L_e parallel + parallel L_e \( 1 - Pi \) T Pi L_e parallel + parallel L_e Pi T Pi L_e parallel\
 & lt.eq sqrt(u) thin parallel b parallel_(2 \, tau_p) + sqrt(u) thin parallel b parallel_(2 \, tau_p) + u parallel b parallel . $
  This proves (30). ◻
]

=== 5.3 Fourier coefficients of the compressed operator <fourier-coefficients-of-the-compressed-operator>

The preceding lemma gives both the expectation and the upper norm bound for a corner compression. We now compute its matrix entries on $cal(K)$; their dependence on the sum of the indices will isolate the commutator with $L_s$.

Let $f in L^oo \( bb(T) \, m \)$ be real, even, and of mean zero, and set

$ b_f = f \( w \) p \, #h(2em) h = e b_f e \, #h(2em) gamma_l = integral_(bb(T)) z^l f \( z \) thin d m \( z \) quad \( l in bb(Z) \) . $

Then $b_f$ meets the hypotheses of Lemma 18. We claim that, for $j \, k gt.eq 0$,

#[#set math.equation(numbering: n => "(32)")
 $ U_j^(*) L_h U_k & = L_(t^(- 1) E_(A_0) \( w^j h w^(- k) \)) \|_B\
 & = u #scale(x: 120%, y: 120%)[\(] gamma_(j - k) I_B + gamma_(j + k + 1) L_s \|_B #scale(x: 120%, y: 120%)[\)] . $ <eq:hankel-compression>]

For the first equality, test on $v \, z in A_0$. Since $e h = h e = h$,

$ chevron.l L_h U_k v \, U_j z chevron.r & = t^(- 1) tau \( z^(*) w^j h w^(- k) v \)\
 & = ⟨t^(- 1) E_(A_0) \( w^j h w^(- k) \) v \, z⟩ . $

Density then gives the operator identity on $B$.

The reduced-word decomposition shows that on $W^(*) \( D \, s \)$ the expectation $E_(A_0)$ equals the expectation onto $W^(*) \( s \) = bb(C) 1 + bb(C) s$: every reduced word containing a centered $D$ letter is orthogonal to $L^2 \( A_0 \)$. Because $W^(*) \( s \) subset cal(C)$, this latter expectation factors through $E_(cal(C))$. By (30) and bimodularity,

$ E_(cal(C)) \( w^j h w^(- k) \) = u^2 w^j b_f w^(- k) . $

Using $d w^(- k) = w^k d$ and $d = w s$, compute

$ w^j p w^(- k) = frac(w^(j - k) + w^(j + k) d, 2) = frac(w^(j - k) + w^(j + k + 1) s, 2) . $

The group trace implies

$ E_(W^(*) \( s \)) \( f \( w \) w^l \) = gamma_l 1 \, #h(2em) E_(W^(*) \( s \)) \( f \( w \) w^l s \) = gamma_l s . $

For instance this follows on Laurent polynomials because only the identity power contributes, and then by $L^2$ approximation. Hence

$ t^(- 1) E_(A_0) \( w^j h w^(- k) \) = frac(u^2, 2 t) \( gamma_(j - k) 1 + gamma_(j + k + 1) s \) = u \( gamma_(j - k) 1 + gamma_(j + k + 1) s \) \, $

which proves (32), including its normalization and its Hankel index.

The matrices

$ T_f = \( gamma_(j - k) \)_(j \, k gt.eq 0) \, #h(2em) H_f = \( gamma_(j + k + 1) \)_(j \, k gt.eq 0) $

define bounded operators on $ell^2 \( bb(N)_0 \)$ of norm at most $parallel f parallel_oo$. To see this directly, decompose

$ L^2 \( bb(T) \, m \) = H_(-) xor H_(+) \, #h(2em) H_(-) = overline("span") { z^(- j) : j gt.eq 0 } \, quad H_(+) = overline("span") { z^(k + 1) : k gt.eq 0 } . $

In the indicated orthonormal bases, $T_f$ and $H_f$ are respectively the $H_(-) \, H_(-)$ and $H_(-) \, H_(+)$ blocks of multiplication by $f$. Equation (32), first on finite coordinate vectors and then by continuity, therefore gives

#[#set math.equation(numbering: n => "(33)")
 $ iota^(*) L_h iota = u \( T_f ⊗ I_B + H_f ⊗ L_s \|_B \) . $ <eq:toeplitz-hankel-form>]

As $J = I ⊗ B_0$, it follows that

#[#set math.equation(numbering: n => "(34)")
 $ parallel \[ J \, iota^(*) L_h iota \] parallel = u parallel H_f parallel thin parallel \[ B_0 \, L_s \|_B \] parallel . $ <eq:hankel-commutator>]

Here we used the operator norm identity $parallel A ⊗ B parallel = parallel A parallel parallel B parallel$ for Hilbert-space tensor products.

#proof[
  #emph[Completion of the proof of Theorem 9.] Put $theta = u \/ 4 = 1 \/ \( 2 N \)$, so $0 < theta lt.eq 1 \/ 4$, and use angular coordinates $z = e^(i alpha)$, $- pi < alpha lt.eq pi$, to define
  $ f \( e^(i alpha) \) = upright(bold(1))_(\[ - theta \, theta \]) \( alpha \) - theta / pi . $
  This function is real, even, and of mean zero. The trace formula in (29) gives
  $ parallel b_f parallel lt.eq 1 \, #h(2em) parallel b_f parallel_(2 \, tau_p)^2 = theta / pi (1 - theta / pi) lt.eq u . $
  Consequently (30) gives
  #[#set math.equation(numbering: n => "(35)")
   $ parallel h parallel = parallel e b_f e parallel lt.eq 3 u . $ <eq:narrow-arc-norm>]
  For every $l gt.eq 1$ the Fourier coefficient is
  $ gamma_l = frac(sin \( l theta \), pi l) . $
  If $0 lt.eq j \, k < N$, then $1 lt.eq j + k + 1 lt.eq 2 N - 1$ and $\( j + k + 1 \) theta < 1 < pi \/ 2$. The inequality $sin x gt.eq 2 x \/ pi$ on $\[ 0 \, pi \/ 2 \]$ therefore gives
  $ \( H_f \)_(j k) gt.eq frac(2 theta, pi^2) . $
  Testing the leading $N$ by $N$ block on its constant unit vector, and using $theta N = 1 \/ 2$, proves the uniform bound
  #[#set math.equation(numbering: n => "(36)")
   $ parallel H_f parallel gt.eq frac(2 theta N, pi^2) gt.eq frac(1, 2 pi^2) . $ <eq:narrow-arc-hankel>]
  Combine (34), (27), (35), and (36) to obtain
  $ frac(u, 2 pi^2) parallel \[ B_0 \, L_s \|_B \] parallel lt.eq 3 u \( 1 + 4 c_0 \) epsilon.alt . $
  Cancelling $u > 0$ yields
  $ parallel \[ B_0 \, L_s \|_B \] parallel lt.eq 6 pi^2 \( 1 + 4 c_0 \) epsilon.alt = c_1 epsilon.alt . $
  The level-zero case of (20) identifies $G \|_B$ with $B_0$, so this is exactly the required compression estimate for the symmetrized operator. Lemma 11 preserves the compression of $\[ G \, L_s \]$ between vectors of $B$. The same estimate therefore holds for the original operator in Theorem 9, completing its proof. ◻
]

== 6 Transfer to finite factors <sec:finite-factors>

We now transfer Theorem 9 to matrix commutators in finite sums of the standard representation of a separable-predual $upright("II")_1$ factor. All traces on matrix amplifications are normalized.

We first average the operator over an irreducible subfactor generated by an increasing sequence of full matrix algebras. After matrix amplification, the ultrapower of the amplified subfactor contains another subfactor generated by increasing full matrix algebras and free from the constant copy of the amplified ambient factor. Extending and compressing the averaged operator then puts it in the setting of Theorem 9. Compression to constant vectors transfers the estimate back to the matrix test, with the fixed error from the initial averaging.

The existence of an irreducible hyperfinite subfactor in a separable-predual $upright("II")_1$ factor is due to Popa #cite(label("Popa1981")); we include a direct proof of the increasing-matrix form used below.

#thm([Lemma 6.1.])[
  (An irreducible increasing-matrix subfactor).  #emph[Every separable-predual $upright("II")_1$ factor $M$ contains a unital subfactor $R$ with $R' ∩ M = bb(C) 1$, generated by an increasing sequence of unital full matrix algebras whose sizes tend to infinity.]
] <lem:irreducible-hyperfinite>

#proof[
  We first give an approximation step in an arbitrary $upright("II")_1$ factor $N$. If $y = y^(*) in N$ and $eta > 0$, there is a unital full matrix algebra $F subset N$, of size at least two, such that
  $ lr(bar.v.double E_(F' ∩ N) \( y \) - tau \( y \) 1 bar.v.double)_2 < eta . $
  Indeed, approximate $y$ in $L^2$ by a spectral step $y_0 = sum_(i = 1)^k lambda_i p_i$, where the $p_i$ partition the identity. For a large integer $b$, split off $floor.l b tau \( p_i \) floor.r$ subprojections of trace $1 \/ b$ in each $p_i$. The remaining projection has trace
  $ frac(b - sum_(i = 1)^k floor.l b tau \( p_i \) floor.r, b) < k / b . $
  Its numerator is an integer, so it too splits into projections of trace $1 \/ b$. These pieces form a partition of the identity by $b$ equivalent projections and hence extend to matrix units for a unital $F tilde.equiv M_b \( bb(C) \)$. Define $y_1 in F$ to have value $lambda_i$ on the pieces taken from $p_i$, and value zero on the remaining pieces. Then
  $ lr(bar.v.double y - y_1 bar.v.double)_2 lt.eq lr(bar.v.double y - y_0 bar.v.double)_2 + lr(bar.v.double y_0 bar.v.double) sqrt(k \/ b) . $
  The expectation of $y_1$ onto $F' ∩ N$ is $tau \( y_1 \) 1$. Contractivity of this expectation on $L^2$, and $\| tau \( y - y_1 \) \| lt.eq lr(bar.v.double y - y_1 bar.v.double)_2$, give the required estimate by choosing the spectral approximation and then $b$.
  Choose a countable $L^2$-dense subset ${ x_j : j gt.eq 1 }$ of the self-adjoint unit ball of $M$, and enumerate all requirements $\( j \, k \) in bb(N)^2$. Begin with $F_0 = bb(C) 1$. If the current stage is a unital full matrix algebra $F_n$, then $N_n = F'_n ∩ M$ is a $upright("II")_1$ factor: matrix units identify $M$ with a matrix algebra over a corner and $N_n$ with that corner. For the next requirement $\( j \, k \)$, apply the approximation step in $N_n$ to $y = E_(N_n) \( x_j \)$, with error less than $1 \/ k$, obtaining $F subset N_n$. Set $F_(n + 1) = F_n or F$. This is again a full matrix algebra, its size is at least twice that of $F_n$, and $N_(n + 1) = F' ∩ N_n$. The identity $E_(N_(n + 1)) = E_(N_(n + 1)) E_(N_n)$ gives
  $ lr(bar.v.double E_(N_(n + 1)) \( x_j \) - tau \( x_j \) 1 bar.v.double)_2 < 1 \/ k . $
  All previously obtained bounds persist because the relative commutants decrease and their trace expectations compose.
  Let $R = \( union.big_n F_n \)''$ and $N = R' ∩ M = ⋂_n N_n$. Since $E_N = E_N E_(N_n)$, every requirement remains valid with $N$ in place of $N_(n + 1)$. Thus $E_N \( x_j \) = tau \( x_j \) 1$ for every $j$. Density gives $E_N \( x \) = tau \( x \) 1$ for all $x in M$, so $N = bb(C) 1$. In particular $R$ is a factor. It is finite and contains full matrix algebras of unbounded size, hence is of type $upright("II")_1$, with the asserted increasing-matrix presentation. ◻
]

For a finite tracial von Neumann algebra $P$ and a nonprincipal ultrafilter $omega$ on $bb(N)$, write $P^omega = ell^oo \( bb(N) \, P \) \/ cal(I)_omega$, where $cal(I)_omega$ consists of the uniformly bounded sequences $\( a_i \)$ with $lim_omega parallel a_i parallel_2 = 0$. Its trace is $tau_omega \( \[ a_i \] \) = lim_omega tau \( a_i \)$, and $P$ embeds by constant sequences. The lemma below places a free subfactor in such an ultrapower while retaining its inclusion in the prescribed subalgebra $Q^omega$.

#thm([Lemma 6.2.])[
  (Free position in the full ultrapower).  #emph[Let $Q subset P$ be a unital irreducible inclusion of $upright("II")_1$ factors, with $P$ of separable predual. For any nonprincipal ultrafilter $omega$ on $bb(N)$, there is a subfactor $D subset Q^omega$, generated by increasing unital full matrix algebras of unbounded sizes, which is free from the constant copy of $P$ in the tracial ultrapower $P^omega$.]
] <lem:free-position>

#proof[
  We use the ultraproduct-of-subalgebras case of Popa’s independence theorem #cite(label("Popa2014")) Theorem 0.1(a); see also Theorem 4.3. For von Neumann subalgebras $A \, B subset M$, the notation $A prec_M B$ means Popa’s intertwining of a nonzero corner of $A$ into a finite matrix amplification of $B$. Its hypotheses are finite factors $M_i$ with $dim M_i arrow.r oo$, and unital von Neumann subalgebras $Q_i subset M_i$ satisfying $Q_i prec.not_(M_i) \( Q'_i ∩ M_i \)$. Write $upright(bold(M)) = product_omega M_i$, $upright(bold(Q)) = product_omega Q_i$, and $C = upright(bold(Q))' ∩ upright(bold(M))$. Given an $L^2$-separable subspace $X subset upright(bold(M)) ⊖ C$, the theorem supplies a diffuse abelian von Neumann algebra $A subset upright(bold(Q))$ such that
  $ E_C \( x_0 a_1 x_1 dots.h.c a_n x_n \) = 0 $
  whenever $n gt.eq 1$, $x_0 in X union { 1 }$, $x_i in X$ for $1 lt.eq i lt.eq n$, and $a_i in A ⊖ bb(C) 1$. In particular, if $C = bb(C) 1$ and $T subset upright(bold(M))$ is a separable-predual von Neumann subalgebra, take $X = T ⊖ bb(C) 1$. The moment identities, traciality, and decomposition into scalar and centered parts show that $A$ is free from $T$. Here separability is for $L^2$, as stipulated in #cite(label("Popa2014"), form: "prose") Section 1.1.
  We check these hypotheses for the constant sequences $M_i = P$ and $Q_i = Q$. The dimension condition holds because these factors are infinite-dimensional. If $Q prec_P bb(C) 1$, the intertwining data would include a nonzero normal $*$-homomorphism from a nonzero corner of $Q$ into a finite-dimensional matrix algebra. Such a homomorphism from a factor is faithful, whereas a $upright("II")_1$ factor has arbitrarily large families of nonzero orthogonal projections. This is impossible. Since $Q' ∩ P = bb(C) 1$, the non-intertwining hypothesis follows.
  We also verify the full ultrapower relative commutant:
  $ \( Q^omega \)' ∩ P^omega = bb(C) 1 . $
  For a uniformly bounded representative $\( x_i \)$ of an element of this commutant, commuting with all sequences of unitaries from $Q$ implies
  $ d_i := sup_(v in cal(U) \( Q \)) lr(bar.v.double v x_i v^(*) - x_i bar.v.double)_2 arrow.r_omega 0 . $
  Otherwise one could choose a witnessing unitary at each coordinate on an $omega$-large set. The $L^2$-closed convex hull of the $Q$-unitary orbit of $x_i$ has a unique vector of minimum norm. It is $Q$-central, has trace $tau \( x_i \)$, and belongs to $P$: the hull stays in the operator-norm ball of radius $lr(bar.v.double x_i bar.v.double)$, which is $L^2$-closed by weak-\* compactness and trace pairings. Irreducibility makes this vector $tau \( x_i \) 1$. Every point in the hull is within $d_i$ of $x_i$, so $lr(bar.v.double x_i - tau \( x_i \) 1 bar.v.double)_2 lt.eq d_i$. Bounded scalar sequences equal their scalar ultralimit in the tracial ultrapower. This proves the claim, which concerns all of $Q^omega$, rather than merely the constant copy of $Q$.
  Choose a Haar unitary $u_1$ in the diffuse abelian algebra obtained by applying Popa’s theorem to the constant $P$. Then $u_1 in Q^omega$ is free from $P$. The algebra $W^(*) \( P \, u_1 \)$ has separable $L^2$ space: countably many words in generators of $P$, in $u_1$, and in their adjoints have linear span dense in $L^2$. A second application of the same theorem therefore gives a Haar unitary $u_2 in Q^omega$ free from $W^(*) \( P \, u_1 \)$. Expanding centered reduced words shows that $P \, W^(*) \( u_1 \) \, W^(*) \( u_2 \)$ are jointly free. Thus $W^(*) \( u_1 \, u_2 \)$ is free from $P$ and, by its free Haar moments, is trace-isomorphic to $L \( bb(F)_2 \)$. This is a separable-predual $upright("II")_1$ factor: the nontrivial conjugacy classes of $bb(F)_2$ are infinite, so a central square-summable Fourier coefficient function is supported at the identity. Apply Lemma 19 inside $W^(*) \( u_1 \, u_2 \)$ to obtain $D$. Freeness passes to its subalgebra $D$, proving the lemma. The ambient tracial ultrapower throughout is $P^omega$. ◻
]

#thm([Proposition 6.3.])[
  (Finite standard multiplicities).  #emph[Let $M$ be a separable-predual $upright("II")_1$ factor, and let $M$ act on $H_r = L^2 \( M \)^r$ by common left multiplication, where $r gt.eq 1$ is finite. For every $Y in cal(B) \( H_r \)$, every finite $h gt.eq 1$, and every $X in M_h \( M \)$, 
$ lr(bar.v.double \[ Y^(\( h \)) \, X \] bar.v.double) lt.eq \( 3 c_1 + 2 \) thin g_M \( Y \) thin lr(bar.v.double X bar.v.double) . $

 Here $X$ denotes its entrywise action on $H_r^h$; the constant is independent of $M \, r \, h$.]
] <prop:finite-copies>

#proof[
  Put $delta = g_M \( Y \)$. By homogeneity it suffices to consider $lr(bar.v.double X bar.v.double) lt.eq 1$. We first arrange a symmetry test on a square array of standard copies. Choose $h_0 gt.eq h$ so that $m = 2 h_0 gt.eq r$, extend $Y$ by zero to $H_m$, and retain the notation $Y$. The copy projection reduces the common action of $M$, so this extension still has scalar commutator bound $delta$. For $X' = X xor 0 in M_(h_0) \( M \)$, define in $P = M_m \( M \)$
  $ s = mat(delim: "(", \( 1 - X' X' ""^(*) \)^(1 \/ 2), X'; X' ""^(*), - \( 1 - X' ""^(*) X' \)^(1 \/ 2)) . $
  Functional calculus gives $\( 1 - X' X' ""^(*) \)^(1 \/ 2) X' = X' \( 1 - X' ""^(*) X' \)^(1 \/ 2)$, and hence $s = s^(*) = s^(- 1)$. Traciality gives equal moments for $X' X' ""^(*)$ and $X' ""^(*) X'$, including the zeroth moment; polynomial approximation on $\[ 0 \, 1 \]$ gives equal traces for their displayed square roots. Consequently $tau_P \( s \) = 0$.
  Write vectors of $H_m^m$ as arrays $\( xi_(i j) \)$, with $i$ the outer amplification coordinate and $j$ the copy coordinate. The map $\( xi_(i j) \) mapsto sqrt(m) thin \( xi_(i j) \)$ is a unitary from $H_m^m$ to $L^2 \( P \)$, since $lr(bar.v.double \( xi_(i j) \) bar.v.double)_2^2 = m^(- 1) sum_(i \, j) lr(bar.v.double xi_(i j) bar.v.double)_2^2$ on the latter space. Under this identification, the matrix action of $P$ is left multiplication. The upper-right block of $\[ Y^(\( m \)) \, L_s \]$ is the commutator with $X'$. Restricting its row coordinates to the original $h$ and its copy coordinates to the original $r$ recovers $\[ Y^(\( h \)) \, X \]$ for the original operator. It is therefore enough to bound $\[ Y^(\( m \)) \, L_s \]$.
  Choose $R subset M$ from Lemma 19, with matrix stages $F_n$. On $H_m$, average $Y$ over the compact unitary group of each $F_n$, using common left multiplication, and take a weak operator cluster point $Y_0$ as $n$ tends to infinity. For every such unitary $v$, $lr(bar.v.double L_v Y L_v^(*) - Y bar.v.double) lt.eq delta$. The averages, and hence their cluster point, are within $delta$ of $Y$. An average over a later stage commutes with every earlier stage, so
  $ \[ Y_0 \, L_R \] = 0 \, #h(2em) lr(bar.v.double Y_0 - Y bar.v.double) lt.eq delta \, #h(2em) g_M \( Y_0 \) lt.eq 3 delta . $
  The first identity extends from the matrix stages to $R$ by strong density; the norm bounds pass to the cluster point by weak operator closedness of norm balls.
  On $L^2 \( P \) = H_m^m$, set $S = Y_0^(\( m \))$ and $Q = M_m \( R \)$. Matrix units and $R' ∩ M = bb(C) 1$ imply $Q' ∩ P = bb(C) 1$. Moreover $S$ commutes with $L_Q$, since it has the same operator $Y_0$ on every row and $Y_0$ commutes with every entry from $R$. For $e_0 = e_11 ⊗ 1$, the space $e_0 L^2 \( P \)$ is one row of $m$ standard copies, with $e_0 P e_0 tilde.equiv M$ acting by common left multiplication. Since $S$ commutes with $L_(e_0)$, it follows on the full Hilbert space that
  $ lr(bar.v.double \[ S \, L_z \] bar.v.double) lt.eq 3 delta lr(bar.v.double z bar.v.double) #h(2em) \( z in e_0 P e_0 \) . $
  If $f in Q$ is a projection with $tau_P \( f \) lt.eq 1 \/ m$, projection comparison in the factor $Q$ gives a unitary $v in Q$ with $f lt.eq v e_0 v^(*)$. Conjugating by $L_v$, which commutes with $S$, yields
  $ lr(bar.v.double \[ S \, L_z \] bar.v.double) lt.eq 3 delta lr(bar.v.double z bar.v.double) #h(2em) \( z in f P f \, med f in Q \, med tau_P \( f \) lt.eq 1 \/ m \) . $
  We have obtained the same small-corner estimate for every projection of $Q$ of trace at most $1 \/ m$. The next step transports that estimate to the ultrapower, where Lemma 20 supplies the free subfactor. Fix a nonprincipal ultrafilter $omega$ on $bb(N)$. Recall the tracial quotient and distinguish it from the Hilbert ultrapower:
  $ P^omega & = ell^oo \( bb(N) \, P \) \/ cal(I)_omega \, & cal(I)_omega & = { \( a_i \) : lim_omega lr(bar.v.double a_i bar.v.double)_2 = 0 } \,\
cal(H) & = \( L^2 \( P \) \)_(upright("Hilb"))^omega . $
  The Hilbert ultrapower uses bounded Hilbert-space sequences modulo those whose Hilbert norms tend to zero along $omega$. Sending the class of a uniformly operator-bounded sequence $\( a_i \)$ to its Hilbert-ultrapower class is a trace-preserving isometry on the dense subspace $P^omega subset L^2 \( P^omega \)$. Its extension identifies $cal(C) = L^2 \( P^omega \)$ with a closed subspace of $cal(H)$.
  For a bounded sequence $a = \( a_i \)$ in $P$, its coordinatewise left action on $cal(H)$, and the adjoint action corresponding to $\( a_i^(*) \)$, preserve the bounded-algebra-sequence subspace of $cal(C)$. Thus $cal(C)$ reduces both actions. If $a in cal(I)_omega$, then for every operator-bounded sequence $\( b_i \)$,
  $ lr(bar.v.double a_i b_i bar.v.double)_2 lt.eq lr(bar.v.double b_i bar.v.double) lr(bar.v.double a_i bar.v.double)_2 arrow.r_omega 0 . $
  It follows by density that the action on $cal(C)$ factors through the tracial quotient and is precisely left multiplication by $\[ a_i \]$. This factoring assertion is needed only on $cal(C)$, not on the whole Hilbert ultrapower.
  Let $S_(upright("Hilb"))^omega$ be the coordinatewise action of the fixed bounded operator $S$ on $cal(H)$, and set
  $ hat(S) = P_(cal(C)) S_(upright("Hilb"))^omega \|_(cal(C)) . $
  Since $S$ commutes with every left multiplier from $Q$, its Hilbert ultrapower commutes with every bounded left $Q$-sequence. Compression to the reducing subspace $cal(C)$ proves $\[ hat(S) \, L_(Q^omega) \] = 0$.
  Set $t = 1 \/ \( 2 m \)$. We claim that
  #[#set math.equation(numbering: n => "(37)")
   $ lr(bar.v.double \[ hat(S) \, L_z \] bar.v.double) lt.eq 3 delta lr(bar.v.double z bar.v.double) \,\
e in Q^omega upright(" a projection") \, #h(2em) tau \( e \) = t \, #h(2em) z in e P^omega e . $ <eq:ultrapower-corner>]
  To lift $e$, take a bounded self-adjoint representative $\( a_i \)$ in $Q$ and set $f_i = 1_(\[ 1 \/ 2 \, oo \)) \( a_i \)$. The scalar inequality $\| x - 1_(\[ 1 \/ 2 \, oo \)) \( x \) \| lt.eq 2 \| x^2 - x \|$ gives $lr(bar.v.double f_i - a_i bar.v.double)_2 arrow.r_omega 0$, so $\[ f_i \] = e$ and $tau \( f_i \) arrow.r_omega t$. The strict gap $t < 1 \/ m$ allows us to replace $f_i$ by zero off an $omega$-large set and assume $tau \( f_i \) lt.eq 1 \/ m$ for every $i$.
  Given $z in e P^omega e$ and $eta > 0$, the $C^(*)$-quotient norm gives a representative $\( b_i \)$ with $sup_i lr(bar.v.double b_i bar.v.double) lt.eq lr(bar.v.double z bar.v.double) + eta$. The sequence $z_i = f_i b_i f_i$ represents $z$, lies in the required corners, and has the same norm bound. Consequently
  $ lr(bar.v.double \[ S \, L_(z_i) \] bar.v.double) lt.eq 3 delta \( lr(bar.v.double z bar.v.double) + eta \) #h(2em) upright("for every ") i . $
  This estimate passes to the Hilbert ultrapower. Its compression to $cal(C)$ is $\[ hat(S) \, L_z \]$, since $cal(C)$ reduces the bounded left sequence action. Letting $eta$ decrease to zero proves (37).
  By Lemma 20, choose $D subset Q^omega$ free from the constant $P$, and put $cal(L) = W^(*) \( D \, P \) subset P^omega$. Faithfulness of the trace and the reduced-word inner products identify this algebra with the tracial free product $D * P$. Let $G = P_(L^2 \( cal(L) \)) hat(S) \|_(L^2 \( cal(L) \))$. The subspace $L^2 \( cal(L) \)$ reduces left multiplication by $cal(L)$. Thus $G$ commutes with $L_D$, and (37) gives the corner hypotheses of Theorem 9 with $A_0 = P$, $epsilon.alt = 3 delta$, and $t = 1 \/ \( 2 m \)$.
  Finally, every constant $L^2 \( P \)$-vector belongs to $cal(C)$, by approximation by bounded vectors from $P$, and $S_(upright("Hilb"))^omega$ sends the constant vector $xi$ to the constant vector $S xi$. Both of these vectors also belong to $L^2 \( cal(L) \)$. Therefore both compressions preserve the action of $S$ on the constant subspace. As $L_s$ preserves that subspace, for $xi \, eta in L^2 \( P \)$ we have exactly
  $ chevron.l \[ G \, L_s \] xi \, eta chevron.r = chevron.l \[ S \, L_s \] xi \, eta chevron.r . $
  Theorem 9, applied to the trace-zero symmetry $s in P$, consequently yields on the original $L^2 \( P \)$
  $ lr(bar.v.double \[ S \, L_s \] bar.v.double) lt.eq 3 c_1 delta . $
  Replacing $Y_0$ by $Y$ costs at most $2 lr(bar.v.double Y_0 - Y bar.v.double) lr(bar.v.double s bar.v.double) lt.eq 2 delta$, since Hilbert amplification preserves the difference norm. The initial block compression now gives the claimed bound $\( 3 c_1 + 2 \) delta$ for the original finite $r \, h$. ◻
]

== 7 From finite factors to arbitrary homomorphisms <sec:global>

We now remove the restrictions on the algebra and its representation, and then pass from inner commutators to arbitrary derivations. Throughout this section set

#[#set math.equation(numbering: n => "(38)")
 $ C_(upright("fac")) = max { 3 c_1 + 2 \, thin 1 + 2 c_(upright("row")) \, thin 2 } \, #h(2em) C = 3 C_(upright("fac")) + 2 . $ <eq:global-constants>]

These constants depend only on the numerical constants of the preceding sections.

=== 7.1 Representations of factors <representations-of-factors>

#thm([Proposition 7.1.])[
  #emph[Let $P subset cal(B) \( K \)$ be a unital factor acting on a separable Hilbert space. For every $Y in cal(B) \( K \)$, every $h gt.eq 1$, and every $X in M_h \( P \)$, 
$ lr(bar.v.double \[ Y^(\( h \)) \, X \] bar.v.double) lt.eq C_(upright("fac")) thin g_P \( Y \) thin lr(bar.v.double X bar.v.double) . $

]
] <prop:factor-representations>

#proof[
  We first treat a type $upright("II")_1$ factor $M$ in an arbitrary normal representation on a separable Hilbert space. Its predual is separable. Every cyclic normal representation embeds into the tracial standard representation. Indeed, if $xi$ is a cyclic vector, its normal positive functional has a trace density $a in L^1 \( M \)_(+)$ #cite(label("Hiai2020")) Corollary 5.14 and Remark 5.15. The map on cyclic orbits
  $ x xi mapsto x a^(1 \/ 2) in L^2 \( M \) $
  is isometric, because both squared norms equal the functional evaluated at $x^(*) x$. Its extension intertwines the representations and has a reducing range. Decomposing into orthogonal cyclic reducing subspaces, of which there are at most countably many, embeds the given representation into $tilde(K) = L^2 \( M \)^(xor bb(N))$. These are standard consequences of the normal representation theory of finite von Neumann algebras; see #cite(label("Takesaki1979"), form: "prose").
  Extend $Y$ by zero off the embedded reducing subspace. The scalar commutator bound is unchanged. On the countable amplification, let $p_n$ be the projection onto the first $n$ copies. Since $p_n$ commutes with the common left action,
  $ \[ p_n Y p_n \, L_x \] = p_n \[ Y \, L_x \] p_n #h(2em) \( x in M \) . $
  Proposition 21 applies to the compression of $Y$ to $p_n tilde(K)$, with constant $3 c_1 + 2$. For any fixed finite matrix test, the corresponding compressed commutators converge strongly to the full commutator as $n arrow.r oo$. A uniform operator-norm bound passes to this strong limit. Restricting back to the original reducing subspace proves the assertion for type $upright("II")_1$ factors.
  If $P$ is properly infinite, choose isometries $v_1 \, dots.h \, v_h in P$ with orthogonal ranges. The row $V = \[ v_1 med dots.h.c med v_h \]$ satisfies $V^(*) V = I_(K^h)$. Apply the row and column derivation estimates of Section 2 to $x mapsto \[ Y \, x \]$. With $delta = g_P \( Y \)$, they give
  $ lr(bar.v.double Y V - V Y^(\( h \)) bar.v.double) lt.eq c_(upright("row")) delta \, #h(2em) lr(bar.v.double Y^(\( h \)) V^(*) - V^(*) Y bar.v.double) lt.eq c_(upright("row")) delta . $
  For $X in M_h \( P \)$, the identity
  $ \[ Y \, V X V^(*) \] & = \( Y V - V Y^(\( h \)) \) X V^(*) + V \[ Y^(\( h \)) \, X \] V^(*)\
 & #h(2em)  + V X \( Y^(\( h \)) V^(*) - V^(*) Y \) $
  and $lr(bar.v.double V X V^(*) bar.v.double) = lr(bar.v.double X bar.v.double)$ imply
  $ lr(bar.v.double \[ Y^(\( h \)) \, X \] bar.v.double) lt.eq \( 1 + 2 c_(upright("row")) \) delta lr(bar.v.double X bar.v.double) . $
  Here conjugation by the isometry $V : K^h arrow.r K$ preserves the norm of the middle term, regardless of whether its range is all of $K$.
  Finally, if $P$ is a finite type I factor, average $Y$ over its compact unitary group to obtain $Y_0 in P'$ with $lr(bar.v.double Y - Y_0 bar.v.double) lt.eq delta$. Then
  $ \[ Y^(\( h \)) \, X \] = \[ \( Y - Y_0 \)^(\( h \)) \, X \] \, $
  which gives the constant $2$. These three cases exhaust the factors and prove the proposition. ◻
]

=== 7.2 Central decomposition <central-decomposition>

#thm([Proposition 7.2.])[
  #emph[Let $P subset cal(B) \( K \)$ be any unital von Neumann algebra on a separable Hilbert space. Then 
$ lr(bar.v.double \[ Y^(\( h \)) \, X \] bar.v.double) lt.eq C thin g_P \( Y \) thin lr(bar.v.double X bar.v.double) #h(2em) \( Y in cal(B) \( K \) \, med X in M_h \( P \) \, med h gt.eq 1 \) . $

]
] <prop:separable-estimate>

#proof[
  Write $delta = g_P \( Y \)$. Average $Y$ over the compact unitary groups of the finite-dimensional algebras generated by finite families of central projections. Direct these families by inclusion and take a cofinal weak operator cluster limit. The resulting operator $Y_1$ commutes with every central projection, hence with $Z \( P \)$, and satisfies
  #[#set math.equation(numbering: n => "(39)")
   $ lr(bar.v.double Y_1 - Y bar.v.double) lt.eq delta \, #h(2em) g_P \( Y_1 \) lt.eq 3 delta . $ <eq:center-average>]
  For the first inequality, each unitary being averaged belongs to $P$, so its conjugation changes $Y$ by at most $delta$. The inequality is preserved by averages and weak operator limits. The second follows from $g_P \( Y_1 \) lt.eq g_P \( Y \) + 2 lr(bar.v.double Y_1 - Y bar.v.double)$.
  Use the central direct-integral decomposition on a separable Hilbert space #cite(label("Takesaki1979")); precise section locators for the factor fibers, decomposable operators, and norm formula are #cite(label("Blackadar2006"), form: "prose") Sections III.1.6.1–4 and III.5.1.10–15:
  $ K = integral^xor K_alpha thin d mu \( alpha \) \, #h(2em) P = integral^xor P_alpha thin d mu \( alpha \) \, $
  where the $P_alpha$ are factors almost everywhere and the fibers are separable. The center acts as the scalar diagonal algebra, so its commutant consists of the decomposable operators. In particular, $Y_1$ has fibers $Y_1 \( alpha \)$. We verify carefully that
  #[#set math.equation(numbering: n => "(40)")
   $ g_(P_alpha) #scale(x: 120%, y: 120%)[\(] Y_1 \( alpha \) #scale(x: 120%, y: 120%)[\)] lt.eq 3 delta quad upright("for almost every ") alpha . $ <eq:fiber-commutator>]
  The separable direct-integral decomposition admits countably many bounded measurable sections whose values generate $P_alpha$ almost everywhere; fix such a family. Take all rational complex $*$-polynomials in these sections, including the rational scalar constants. For each such section $b in P$, form the contraction
  $ c_b = b \( 1 + b^(*) b \)^(- 1 \/ 2) in P . $
  On every fiber where the generators have the stated property, these contractions are norm dense in the contraction ball of the generated $C^(*)$-algebra. To see this, the polynomials are norm dense, the displayed transformation is norm continuous, and its range contains the open unit ball: its inverse there is
  $ c mapsto c \( 1 - c^(*) c \)^(- 1 \/ 2) . $
  The closed unit ball is the norm closure of the open one. Kaplansky density then makes these countably many fiber contractions strongly dense in the unit ball of $P_alpha$.
  For each $c_b$, the bound $lr(bar.v.double \[ Y_1 \, c_b \] bar.v.double) lt.eq 3 delta$ implies the same fiber bound outside a null set, by the essential-supremum norm formula. Removing the union of these countably many null sets leaves a single conull set on which every test holds. Strong approximation by the contraction tests passes the bound to every element of the fiber unit ball, proving (40).
  Apply Proposition 22 on that conull set. For any fixed $X in M_h \( P \)$, decomposability of its entries and the same norm formula give
  $ lr(bar.v.double \[ Y_1^(\( h \)) \, X \] bar.v.double) lt.eq 3 C_(upright("fac")) delta lr(bar.v.double X bar.v.double) . $
  Restoring $Y$ costs at most $2 delta lr(bar.v.double X bar.v.double)$ by (39), giving $C = 3 C_(upright("fac")) + 2$. ◻
]

=== 7.3 Removing separability <removing-separability>

#proof[
  Let $P subset cal(B) \( K \)$ be arbitrary, and fix $h gt.eq 1$, $X in M_h \( P \)$, and a unit vector $xi = \( xi_1 \, dots.h \, xi_h \) in K^h$. Let $A_X subset P$ be the unital $C^(*)$-algebra generated by the entries of $X$. The $C^(*)$-algebra in $cal(B) \( K \)$ generated by these entries and $Y$ is norm separable. The closed span of its orbits of the finitely many $xi_i$ is therefore a separable common reducing subspace $K_0$ for $A_X$ and $Y$. Denote restriction of $A_X$ to $K_0$ by $sigma$, put $Y_0 = Y \|_(K_0)$, and set $P_0 = sigma \( A_X \)''$.
  For $a in A_X$,
  $ lr(bar.v.double \[ Y_0 \, sigma \( a \) \] bar.v.double) lt.eq g_P \( Y \) lr(bar.v.double a bar.v.double) . $
  The $C^(*)$-quotient norm of the image gives, for every $b in sigma \( A_X \)$,
  $ lr(bar.v.double \[ Y_0 \, b \] bar.v.double) lt.eq g_P \( Y \) inf_(sigma \( a \) = b) lr(bar.v.double a bar.v.double) = g_P \( Y \) lr(bar.v.double b bar.v.double) . $
  By Kaplansky density the same scalar commutator bound holds on $P_0$. Proposition 23, applied to $P_0$ and $sigma_h \( X \)$, now yields
  $ lr(bar.v.double \[ Y_0^(\( h \)) \, sigma_h \( X \) \] bar.v.double) lt.eq C g_P \( Y \) lr(bar.v.double sigma_h \( X \) bar.v.double) lt.eq C g_P \( Y \) lr(bar.v.double X bar.v.double) . $
  Since $K_0$ reduces all the operators in this test and contains every component of $xi$, the restricted commutator on $xi$ equals the original one. Taking the supremum over unit test vectors proves (1). If $K = { 0 }$, the estimate is vacuous. ◻
]

=== 7.4 Derivations and similarity <derivations-and-similarity>

Theorem 2 now controls inner commutators in every representation. To reach Kirchberg’s criterion we must implement an arbitrary bounded derivation. Cyclic-domain implementation supplies finitely many columns at a time; the uniform commutator estimate lets us pass from these finite collections to the full derivation.

#thm([Proposition 7.3.])[
  #emph[Let $A$ be a unital $C^(*)$-algebra and $sigma : A arrow.r cal(B) \( K \)$ a unital $*$-representation. Every bounded $sigma$-derivation $Delta : A arrow.r cal(B) \( K \)$ satisfies 
$ lr(bar.v.double Delta bar.v.double)_(upright("cb")) lt.eq C lr(bar.v.double Delta bar.v.double) $

 and is implemented by a bounded operator on $K$.]
] <prop:all-derivations>

#proof[
  Decompose $K$ into cyclic reducing subspaces for $sigma$:
  $ K = xor.big_(i in I) K_i . $
  Such a decomposition is obtained by taking a maximal orthogonal family of cyclic reducing subspaces; a nonzero vector in its orthogonal complement would generate another one. The index set $I$ can have any cardinality. Let $q_i$ denote the projection onto $K_i$.
  The map $a mapsto Delta \( a \) \|_(K_i)$ is a rectangular derivation with cyclic domain representation $sigma \|_(K_i)$ and full output representation $sigma$. Lemma 7 gives a bounded map $V_i : K_i arrow.r K$ such that
  $ Delta \( a \) \|_(K_i) = V_i sigma \( a \) \|_(K_i) - sigma \( a \) V_i . $
  For a finite subset $F subset I$, put
  $ q_F = sum_(i in F) q_i \, #h(2em) V_F = sum_(i in F) V_i q_i in cal(B) \( K \) . $
  Every $V_F$ is bounded, and the reducing property gives the exact identity
  #[#set math.equation(numbering: n => "(41)")
   $ \[ V_F \, sigma \( a \) \] = Delta \( a \) q_F #h(2em) \( a in A \) . $ <eq:finite-column-identity>]
  Only the scalar commutator norm, rather than the norm of $V_F$, needs to be uniform in $F$. Indeed, taking the infimum over lifts of an element $b in sigma \( A \)$ in (41) gives
  $ lr(bar.v.double \[ V_F \, b \] bar.v.double) lt.eq lr(bar.v.double Delta bar.v.double) lr(bar.v.double b bar.v.double) . $
  This uses the $C^(*)$-quotient norm of the $*$-image and does not require $sigma$ to be faithful. Kaplansky density then implies
  $ g_(sigma \( A \)'') \( V_F \) lt.eq lr(bar.v.double Delta bar.v.double) . $
  Apply Theorem 2 to $V_F$ and $sigma \( A \)''$. For every $X in M_h \( A \)$,
  $ lr(bar.v.double Delta_h \( X \) q_F^(\( h \)) bar.v.double) & = lr(bar.v.double \[ V_F^(\( h \)) \, sigma_h \( X \) \] bar.v.double)\
 & lt.eq C lr(bar.v.double Delta bar.v.double) lr(bar.v.double sigma_h \( X \) bar.v.double) lt.eq C lr(bar.v.double Delta bar.v.double) lr(bar.v.double X bar.v.double) . $
  The projections $q_F$ converge strongly to the identity as a net indexed by finite subsets of $I$. Hence the displayed bound passes to $Delta_h \( X \)$ for every fixed $h$ and $X$. This proves the claimed complete boundedness. Lemma 5 then supplies a bounded implementing operator. ◻
]

#proof[
  For every faithful unital $*$-representation of $A$, each bounded derivation into the ambient bounded operators is inner by Proposition 24. Thus condition (2) of Theorem 8 holds for $A$. Its equivalent similarity property gives, for every bounded unital homomorphism $pi : A arrow.r cal(B) \( H \)$, a bounded invertible $S$ with bounded inverse such that $S pi \( dot.op \) S^(- 1)$ is a $*$-homomorphism. The identity isomorphism treats the zero Hilbert space as well. ◻
]

=== 7.5 Hyperreflexivity <sec:hyperreflexivity>

The uniform commutator estimate also controls distance to any von Neumann algebra. We apply it to the commutant, whose projections describe the algebra’s invariant subspaces.

#proof[
  Put $P = M'$. Since $M$ is self-adjoint, its invariant subspaces are reducing and their orthogonal projections are exactly the projections in $P$. Hence $alpha_M$ is the usual off-diagonal distance seminorm. For every projection $e in P$, the two off-diagonal blocks give
  $ parallel \[ T \, e \] parallel = max { parallel \( 1 - e \) T e parallel \, parallel e T \( 1 - e \) parallel } lt.eq alpha_M \( T \) \, $
  where the last inequality also uses the projection $1 - e$. Spectral step approximations of a self-adjoint contraction $a in P$ express it, modulo a scalar, as a norm limit of linear combinations of projections in $P$ whose coefficients have total absolute value at most two. Thus $parallel \[ T \, a \] parallel lt.eq 2 alpha_M \( T \)$. The real and imaginary parts of any contraction in $P$ are self-adjoint contractions, so $g_P \( T \) lt.eq 4 alpha_M \( T \)$.
  Arveson’s commutant-distance formula, in the form recalled in #cite(label("ChristensenSinclairSmithWhite2010"), form: "prose") Equation (2.1), gives
  $ 2 "dist" \( T \, M \) = parallel "ad"_T \|_P parallel_(upright("cb")) \, #h(2em) "ad"_T \( a \) = \[ T \, a \] \, $
  since $P' = M$. Taking the supremum over finite matrix sizes in Theorem 2 therefore yields
  $ 2 "dist" \( T \, M \) lt.eq C g_P \( T \) lt.eq 4 C alpha_M \( T \) \, $
  which proves Equation (2). ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
