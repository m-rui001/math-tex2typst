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

#align(center)[#text(size: 16pt, weight: "bold")[The $ell^1$-Bass Conjecture for Discrete Groups]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

Let $G$ be a discrete group. Its complex Banach group algebra $ell^1 \( G \)$ consists of functions $a : G arrow.r bb(C)$ with $parallel a parallel_1 = sum_(g in G) \| a \( g \) \| < oo$, equipped with convolution

$ \( a * b \) \( g \) = sum_(h in G) a \( h \) b \( h^(- 1) g \) . $

Write $cal(C) \( G \)$ for the set of conjugacy classes, and $cal(C)_(upright("fin")) \( G \)$ for those consisting of finite-order elements. The subscript refers to element order, not to the size of a conjugacy class.

For an idempotent matrix $e = \( e_(i j) \) in M_q \( ell^1 \( G \) \)$, its Hattori–Stallings trace #cite(label("Hattori1965")) #cite(label("Stallings1965")) has coefficients

#[#set math.equation(numbering: n => "(1.1)")
 $ tau_C \( e \) = sum_(g in C) sum_(i = 1)^q e_(i i) \( g \) \, #h(2em) C in cal(C) \( G \) . $ <intro:trace>]

These sums converge absolutely, and $sum_C \| tau_C \( e \) \| lt.eq sum_i parallel e_(i i) parallel_1$. The trace is additive under direct sums and depends only on the isomorphism class of the projective module $e ell^1 \( G \)^q$. It therefore defines

$ "HS"^1 : K_0 \( ell^1 \( G \) \) arrow.r ell^1 \( cal(C) \( G \) \) \, $

where $K_0$ is the Grothendieck group of finitely generated projective right modules. The $ell^1$-Bass conjecture #cite(label("BCM2004")) Conjecture 2.2 asserts that this map takes values in the algebraic direct sum over $cal(C)_(upright("fin")) \( G \)$. We prove this assertion for all discrete groups.

#thm([Theorem 1.1.])[
  #emph[Let $G$ be a discrete group, let $q gt.eq 1$, and let $e in M_q \( ell^1 \( G \) \)$ be idempotent. There is a finite set $F subset cal(C)_(upright("fin")) \( G \)$ such that $tau_C \( e \) = 0$ for every $C in.not F$. Equivalently, 
$ "HS"^1 #scale(x: 120%, y: 120%)[\(] K_0 \( ell^1 \( G \) \) #scale(x: 120%, y: 120%)[\)] subset.eq xor.big_(C in cal(C)_(upright("fin")) \( G \)) bb(C) \[ C \] . $

]
] <thm:main>

The finite-support assertion is part of the conclusion, in addition to vanishing on infinite-order classes. It is not an automatic consequence of absolute summability. In particular, the proof must make its geometric cutoff independent of the conjugacy class under consideration.

=== 1.1 History and relation to earlier methods <history-and-relation-to-earlier-methods>

The Hattori–Stallings trace refines the rank of a projective module by taking values in the quotient of its ring by additive commutators #cite(label("Hattori1965")) #cite(label("Stallings1965")). For the algebraic group rings $bb(Z) G$ and $bb(C) G$, this quotient is indexed by conjugacy classes. Bass’s conjecture for the integral group ring asks that this trace be supported at the identity #cite(label("Bass1976")); the complex-group-ring formulation permits finite-order classes. These support questions connect the algebraic structure of projective modules with the conjugacy structure of a group.

Cyclic homology gives one route to these questions. Burghelea’s computation separates group-ring cyclic homology into contributions from finite- and infinite-order conjugacy classes #cite(label("Burghelea1985")). Eckmann used this description and the Chern character to prove Bass-type vanishing for several classes of groups #cite(label("Eckmann1986")). Emmanouil extended this method through nilpotence properties of the cyclic periodicity operator #cite(label("Emmanouil1998")). Our argument retains cyclic symmetry but works directly with weighted configurations and differential forms.

Berrick, Chatterji, and Mislin formulated the $ell^1$-Bass conjecture in the finite-support form used here. They proved it for countable groups whose Bost assembly map is rationally surjective in degree zero #cite(label("BCM2004")) Theorem 1.4. Together with Lafforgue’s Banach-algebra $K$-theory #cite(label("Lafforgue2002")), this includes amenable groups; the passage from countable subgroups to arbitrary groups is explained in #cite(label("BCM2004")) Lemma 1.5. Theorem 1 removes the assembly hypothesis while retaining the algebraic finite-support conclusion.

Ji, Ogle, and Ramsey developed related Bass conjectures for rapid-decay completions and higher Chern characters #cite(label("JOR2010")) #cite(label("JOR2014")). Their work highlights the growth estimates needed when passing from group rings to analytic completions. Here the summability needed in the proof comes from a similarity reduction to an exponentially decaying idempotent. The subsequent estimates use a spatial scale uniform over all classes to be excluded.

The weighted cyclic configurations and Pfaffian detection strategy build on the complex-group-ring argument in #cite(label("OpenAIBass2026")) Sections 7–8. In the group-ring setting, nonzero products of coefficients involve group elements from a fixed finite set. For an $ell^1$ idempotent these elements may have arbitrarily large word length, even after reduction to exponential decay. The estimates must retain summable length factors without losing control as the number of factors increases. We obtain them from smooth spatial summaries whose derivative bounds are independent of the size of the input support, multiscale time averaging with a positive translation component, and a final ordered-kernel bound uniform in the closing group element. A single spatial radius then excludes all but finitely many finite-order classes. All ingredients used here are proved below; the complex-group-ring theorem is not an input. Standard concentration and transgression arguments are credited at their points of use.

=== 1.2 Proof strategy <proof-strategy>

The argument uses Banach algebra power series, differential forms on finite-dimensional simplices, and elementary estimates for integral operators. We give the needed estimates in full.

First, a finite-support approximation followed by an analytic idempotent correction replaces $e$ by a similar idempotent $p$ with an exponential moment in a finitely generated subgroup (Section 2). This step preserves every trace coefficient. It does not assert that $p$ has finite support.

For a fixed $g in G$, consider cyclic lists of group elements whose closing edge is twisted by multiplication by $g$. Products of the coefficients of $p$ assign complex weights to these lists. Their total weight is $tau_(\[ g \]) \( p \)$, and idempotency makes the weights compatible with deleting vertices. The ordered times of a list form a simplex. On these simplices, a one-form invariant under simultaneous time translation and equal to one on the translation vector will be called a connection form. A cyclic Stokes argument shows that the weighted average of its curvature Pfaffian equals the trace coefficient, up to sign (Section 3).

The task is then to construct compatible connection forms with small averaged curvature. Interpret a timed list as a step function with values in $G$, and average its Dirac masses on a sequence of time scales. The resulting probability distributions are summarized by smooth subprobability distributions on auxiliary labels. These summaries record spatial concentration while controlling derivatives caused by moving one boundary of the step function (Section 4). Pairing their differentials with bounded odd time kernels gives one-forms. Their contractions with time translation telescope across the averaging scales. A final equality kernel detects the twist and leaves a strictly positive contraction, which allows normalization to a connection (Section 5).

The curvature estimates use three different features of this construction. At the initial scale, a curvature entry vanishes unless its two times are close; an occupancy estimate controls the resulting sparse Pfaffians on average. At intermediate scales, the short support of the time kernel gives a Hilbert–Schmidt bound. At the last scale, the equality kernel reduces to weighted order kernels, whose singular values satisfy $s_nu lt.eq C \/ nu$. Expanding the Pfaffian across these stages gives exponential decay in the simplex dimension (Section 6). A single spatial radius works for every infinite-order class and every finite-order class avoiding a fixed finite word ball. This uniformity proves the finite-support conclusion in Section 7.

== 2 Reduction to exponential decay <sec:reduction>

The first step replaces a general $ell^1$ idempotent by an idempotent whose coefficients have exponential decay in a finitely generated subgroup. The replacement preserves every trace coefficient exactly. This permits the polynomially weighted sums that arise from differential forms in arbitrarily large, but fixed, dimensions.

For a complex matrix $A = \( A_(i j) \)$, write $\| A \|_1 = sum_(i \, j) \| A_(i j) \|$. On $M_q \( ell^1 \( G \) \)$ we use

$ parallel a parallel_1 = sum_(h in G) \| a \( h \) \|_1 . $

This norm is submultiplicative. The identity matrix has norm $q$; none of the power-series arguments below requires its norm to be one.

#thm([Lemma 2.1.])[
  (Traciality).  #emph[For every conjugacy class $C$ of a discrete group $G$, the functional 
$ T_C \( a \) = sum_(h in C) "tr" a \( h \) \, #h(2em) a in M_q \( ell^1 \( G \) \) \, $

 is continuous and satisfies $T_C \( a b \) = T_C \( b a \)$. It is therefore invariant under similarity by invertible matrices over $ell^1 \( G \)$.]
] <red:trace>

#proof[
  The bound $\| T_C \( a \) \| lt.eq parallel a parallel_1$ gives continuity. Expand $T_C \( a b \)$ as the absolutely convergent sum
  $ sum_(x \, y in G\
x y in C) "tr" #scale(x: 120%, y: 120%)[\(] a \( x \) b \( y \) #scale(x: 120%, y: 120%)[\)] . $
  The conditions $x y in C$ and $y x in C$ are equivalent, and the scalar matrix trace is cyclic. Interchanging $x$ and $y$ proves the identity. If $u$ is invertible, apply it to $u a$ and $u^(- 1)$. ◻
]

The same rearrangement applies to rectangular matrices: if $a in M_(q \, r) \( ell^1 \( G \) \)$ and $b in M_(r \, q) \( ell^1 \( G \) \)$, then $T_C \( a b \) = T_C \( b a \)$, with the trace in the appropriate size on each side. An isomorphism between two finitely generated projective modules, together with its inverse, can be extended by their defining idempotents to such matrices $a \, b$ with products equal to the two idempotents. This proves the module invariance used in the definition of $"HS"^1$.

#thm([Proposition 2.2.])[
  (Exponentially decaying representative).  #emph[Let $e in M_q \( ell^1 \( G \) \)$ satisfy $e^2 = e$. There are a finitely generated subgroup $Gamma lt.eq G$, a word length $\| dot.op \|$ on $Gamma$, a number $c > 0$, and an idempotent $p in M_q \( ell^1 \( Gamma \) \)$ such that 
#[#set math.equation(numbering: n => "(2.1)")
 $ sum_(h in Gamma) \| p \( h \) \|_1 e^(c \| h \|) < oo \, $ <red:exponential>]

 and $p$ is similar to $e$ in $M_q \( ell^1 \( G \) \)$. If the trace of every such $p$ has finite support on finite-order conjugacy classes of $Gamma$, the same conclusion holds for every $e$ over every discrete group.]
] <red:reduction>

#proof[
  Choose a finite-support matrix $a$ close to $e$ and put $b = 4 \( a - a^2 \)$. We may require $parallel b parallel_1 < 1$. Let
  $ Q = \( 1 - b \)^(- 1 \/ 2) = sum_(j = 0)^oo binom(2 j, j) / 4^j b^j \, #h(2em) p = 1 / 2 I + (a - 1 / 2 I) Q . $
  The series converges absolutely in the matrix Banach algebra. All its factors commute with $a$, and the scalar power-series identity gives $Q^2 \( 1 - b \) = I$. Since $\( a - I \/ 2 \)^2 = \( I - b \) \/ 4$, we obtain $\( p - I \/ 2 \)^2 = I \/ 4$, hence $p^2 = p$. Moreover $p arrow.r e$ as $a arrow.r e$.
  Let $Gamma$ be generated by the finite union of the supports of the entries of $a$. Fix a finite symmetric generating set and its word length. The norm
  $ parallel v parallel_c = sum_(h in Gamma) \| v \( h \) \|_1 e^(c \| h \|) $
  is submultiplicative by $\| x y \| lt.eq \| x \| + \| y \|$. The element $b$ has finite support, so $parallel b parallel_c arrow.r parallel b parallel_1$ as $c arrow.b 0$. Choose $c > 0$ with $parallel b parallel_c < 1$. The same series defining $Q$ then converges in this weighted algebra, proving (2.1).
  Finally, set
  $ u = p e + \( 1 - p \) \( 1 - e \) . $
  Direct multiplication gives $u e = p u$ and $u - I = \( p - e \) \( 2 e - I \)$. For $a$ sufficiently close to $e$, the latter has norm less than one, so $u$ is invertible and $p = u e u^(- 1)$. Lemma 2 preserves all the trace coefficients.
  For a conjugacy class $C$ of $G$, its intersection with $Gamma$ is a union of conjugacy classes of $Gamma$. Absolute convergence gives
  $ T_C \( p \) = sum_(D in cal(C) \( Gamma \)\
D subset C) T_D \( p \) . $
  Thus passing from $Gamma$ to $G$ merges classes and cannot enlarge a finite set of surviving classes. The order of an element does not change under subgroup inclusion. This proves the final assertion. ◻
]

Henceforth $G$ is finitely generated, $d \( x \, y \) = \| x^(- 1) y \|$ is a fixed left-invariant word metric, and $p$ satisfies (2.1). We fix a constant $kappa_G$ such that

#[#set math.equation(numbering: n => "(2.2)")
 $ \| B \( x \, s \) \| lt.eq e^(kappa_G s) #h(2em) \( x in G \, med s gt.eq 1 \) . $ <red:balls>]

Such a bound follows by counting words in the generators. It imposes no additional growth hypothesis on $G$. Constants without a subscript may depend on this metric and on fixed construction choices. A constant denoted $C_R$ may also depend on the radius parameter $R$ introduced later, but will not depend on a tuple, its twist $g$, or the dimension $n$.

== 3 Cyclic simplex formulas for the trace <sec:cyclic>

We now express a conjugacy-class trace coefficient as a weighted average of curvature Pfaffians. Idempotency provides compatibility of the weights under deletion of a vertex; cyclicity supplies the cancellation that makes the average independent of the connection form. The tuple weights have the same algebraic origin as the weighted paths in #cite(label("OpenAIBass2026")) Section 7; we give the identities needed here directly.

=== 3.1 Tuples and their weights <tuples-and-their-weights>

Fix $g in G$ and write $H = C_G \( g \)$ for its centralizer. For $k gt.eq 0$ let

$ cal(T)_k \( g \) = H without G^(k + 1) \, $

where $H$ acts by simultaneous left multiplication. For a tuple $h = \( h_0 \, dots.h \, h_k \)$ extend its indices to all integers by $h_(i + k + 1) = g h_i$ and define

#[#set math.equation(numbering: n => "(3.1)")
 $ v_(k + 1) \( h \) = "tr" (product_(i = 0)^k p \( h_i^(- 1) h_(i + 1) \)) \, #h(2em) l_i = 1 + d \( h_(i - 1) \, h_i \) . $ <cy:weights>]

The product is in the displayed order. Both expressions descend to $cal(T)_k \( g \)$, and $l_i$ is periodic with period $k + 1$.

#thm([Lemma 3.1.])[
  (Weight identities).  #emph[The following properties hold.]
  + #emph[The weights have total sum $tau_(\[ g \]) \( p \)$, in every dimension.]
  + #emph[Twisted rotation $\( h_0 \, dots.h \, h_k \) mapsto \( h_1 \, dots.h \, h_k \, g h_0 \)$ preserves the weights.]
  + #emph[For $k gt.eq 1$, summing the weights over all insertions of one entry into a fixed shortened tuple gives its weight in $cal(T)_(k - 1) \( g \)$.]
  #emph[All these sums converge absolutely, even after multiplication by any fixed polynomial in the edge lengths. In particular, with $M_p = sum_(w in G) \| p \( w \) \|_1 \( 1 + \| w \| \)$, 
#[#set math.equation(numbering: n => "(3.2)")
 $ sum_(h in cal(T)_k \( g \)) \| v_(k + 1) \( h \) \| product_(i = 0)^k l_i lt.eq M_p^(k + 1) . $ <cy:moment>]

]
] <cy:weights-lemma>

#proof[
  Put $w_i = h_i^(- 1) h_(i + 1)$. Their product is $h_0^(- 1) g h_0$. Conversely, any list $\( w_0 \, dots.h \, w_k \)$ whose product lies in $\[ g \]$ determines a tuple: choose $h_0$ realizing this conjugate and successively put $h_(i + 1) = h_i w_i$. Two choices of $h_0$ differ by left multiplication by an element of $H$, and this is the only ambiguity. We therefore have a bijection between $cal(T)_k \( g \)$ and such increment lists.
  The inequality $\| "tr" \( A_0 dots.h.c A_k \) \| lt.eq product_i \| A_i \|_1$ gives (3.2) upon dropping the restriction on the product of the increments. The exponential moment gives the same conclusion for any fixed polynomial in their lengths. The unrestricted convolution sum with product in $\[ g \]$ is the trace coefficient of $p^(k + 1) = p$, proving (i). Rotation is cyclic permutation of the matrix factors, so (ii) follows from their trace.
  To delete an interior entry, sum the two adjacent factors over that entry. Their convolution is $p^2 = p$. The other deletions follow by rotation. One may fix a representative of the shortened tuple because its simultaneous left $H$-action has trivial stabilizer. Thus no multiplicity enters the insertion sum, and (iii) follows. ◻
]

=== 3.2 Compatible forms <compatible-forms>

For each tuple use the ordered time domain

$ tilde(Delta)_k = { \( t_0 \, dots.h \, t_k \) : t_0 lt.eq t_1 lt.eq dots.h.c lt.eq t_k lt.eq t_0 + 1 } . $

Extend times by $t_(i + k + 1) = t_i + 1$, and set $x_i = t_(i + 1) - t_i$ for $0 lt.eq i lt.eq k$. Thus $x_i gt.eq 0$ and $sum_i x_i = 1$. Simultaneous time translation is generated by $V = sum_(i = 0)^k partial_(t_i)$. Its quotient is the simplex

$ Delta_k = { 0 lt.eq t_1 lt.eq dots.h.c lt.eq t_k lt.eq 1 } \, $

using the section $t_0 = 0$, oriented by $d t_1 and dots.h.c and d t_k$. We regard $\[ t_i \, t_(i + 1) \)$ as carrying the label $h_i$. The face $x_i = 0$ corresponds to deleting $\( h_i \, t_i \)$: the interval carrying the label $h_i$ has length zero. At the closing face use the periodic lifts to make this same convention.

#prodef([Definition 3.2.])[
  A compatible connection family through dimension $n$ assigns a real one-form $alpha_h$ to each $h in cal(T)_k \( g \)$, $0 lt.eq k lt.eq n$, on $tilde(Delta)_k$, with the following properties:
  + It is invariant under time translation, and $alpha_h \( V \) = 1$.
  + It is invariant under simultaneous left multiplication by $H$ and under twisted rotation of both labels and times.
  + Its tangential restriction to $x_i = 0$ agrees with the form of the shortened tuple obtained by deleting $\( h_i \, t_i \)$.
  + The form is smooth up to every face, by restriction of a smooth extension, and the coefficients of $alpha_h$ and $d alpha_h$ are bounded by polynomials in the edge lengths, for each fixed dimension and fixed construction parameters.
] <cy:connection>

Translation invariance and $alpha \( V \) = 1$ imply $iota_V d alpha = 0$. Thus $d alpha$ is a form on $Delta_k$ independent of the choice of translation section. A translation-invariant form whose contraction with $V$ is zero will be called #emph[basic].

For a real skew-symmetric $2 m times 2 m$ matrix $A$, our convention is

$ omega = sum_(i < j) A_(i j) thin d t_i and d t_j quad arrow.r.double quad omega^m = m ! "Pf" \( A \) thin d t_1 and dots.h.c and d t_(2 m) . $

In particular $"Pf" \( A \)^2 = det A$. This identity follows by reducing a skew form to two-dimensional blocks, with both sides transforming by the square of the determinant of a change of basis.

#thm([Proposition 3.3.])[
  (Trace as a curvature average).  #emph[Let $n = 2 m > 0$ and let $alpha$ be a compatible connection family through dimension $n$. Write $A_h$ for the matrix of $d alpha_h$ on the section $t_0 = 0$. If $bb(E)_(Delta_n)$ denotes uniform probability on $Delta_n$, then 
#[#set math.equation(numbering: n => "(3.3)")
 $ sum_(h in cal(T)_n \( g \)) v_(n + 1) \( h \) thin bb(E)_(Delta_n) "Pf" \( A_h \) = \( - 1 \)^m tau_(\[ g \]) \( p \) . $ <cy:trace-formula>]

 The series converges absolutely.]
] <cy:trace-identity>

#proof[
  First compare two compatible families $alpha$ and $alpha'$. Their difference is basic. The following transgression form is the elementary abelian instance of the connection-invariance mechanism in Chern–Weil theory #cite(label("ChernSimons1974")) Sections 2–3:
  $ eta = \( alpha - alpha' \) and sum_(j = 0)^(m - 1) \( d alpha \)^j and \( d alpha' \)^(m - 1 - j) $
  is basic, has degree $n - 1$, and satisfies $d eta = \( d alpha \)^m - \( d alpha' \)^m$. It respects all the face and rotation identifications. Stokes’ theorem and Lemma 4(iii) express the weighted sum of $integral_(Delta_n) d eta$ as a signed sum of copies of
  $ I = sum_(h in cal(T)_(n - 1) \( g \)) v_n \( h \) integral_(Delta_(n - 1)) eta_h . $
  Each face identification has a fixed orientation sign, independent of the labels. The polynomial bounds and the exponential moment justify Stokes term by term and all the rearrangements.
  On the simplex of dimension $n - 1$, rotation cyclically permutes its $n$ gap coordinates. It has orientation sign $\( - 1 \)^(n - 1) = - 1$. It preserves the weights and the forms. Basicness ensures that returning to the section $t_0 = 0$ has no additional effect on the integral. Consequently $I = - I$, so $I = 0$. The weighted integral of $\( d alpha \)^m$ is therefore independent of the compatible family.
  Use now the particular connection
  $ alpha^(upright("can")) = sum_(i = 0)^k x_i thin d t_i . $
  Its contraction with $V$ is one, and all other conditions are immediate from the gap coordinates: on a zero gap the corresponding summand vanishes and adjacent time differentials agree tangentially. On $tilde(Delta)_k$ its curvature is
  $ d alpha^(upright("can")) = sum_(i = 0)^k d t_(i + 1) and d t_i . $
  For $k = n$ in the section $t_0 = 0$, the terms at either end vanish, leaving the path of adjacent pairs. Its Pfaffian is $\( - 1 \)^m$: the only complete pairing uses $\( 1 \, 2 \) \, \( 3 \, 4 \) \, dots.h \, \( n - 1 \, n \)$, each with coefficient $- 1$.
  Finally, $Delta_n$ has Euclidean coordinate volume $1 \/ n !$, so
  #[#set math.equation(numbering: n => "(3.4)")
   $ frac(n !, m !) integral_(Delta_n) \( d alpha_h \)^m = bb(E)_(Delta_n) "Pf" \( A_h \) . $ <cy:factorials>]
  Evaluation at $alpha^(upright("can"))$ and the total-weight identity give (3.3). ◻
]

The proposition reduces trace vanishing to a quantitative construction. We shall choose connections, in arbitrarily large even dimensions, for which the average of the absolute Pfaffian is at most a small exponential factor times $product_(i = 1)^n l_i$. Equation (3.2) then permits summation against the tuple weights. The next section constructs the spatial summaries used to obtain these connections.

== 4 Smooth summaries at a spatial scale <sec:channels>

The connection forms will be built from smooth summaries of probability distributions on the group. A summary must retain information about spatial concentration while changing in a controlled way when mass moves between two group elements. We construct two versions. The first allows the spatial radius to increase by a factor of six and has a derivative bound independent of that radius. The second retains the radius and has a polynomial dependence on it. Their different bounds will be used at different stages of the averaging construction.

Throughout this section, $G$ is a finitely generated group with a fixed left invariant word metric $d$. Write $B \( y \, s \) = { h : d \( h \, y \) lt.eq s }$. Counting words in a finite symmetric generating set gives a constant $c_d$ such that

#[#set math.equation(numbering: n => "(4.1)")
 $ \| B \( y \, s \) \| lt.eq exp \( c_d s \) #h(2em) \( s gt.eq 1 \) . $ <ch:ball-growth>]

Indeed, if the generating set has $m$ elements, the ball is covered by words of length at most $floor.l s floor.r$, and their number is at most $\( m + 1 \)^(floor.l s floor.r + 1)$. Increasing $c_d$ also covers the trivial group. Constants denoted by $C$ may depend on this word metric but not on a radius, an accuracy parameter, or the size of an input support.

Let $cal(P)_f \( G \)$ be the set of finitely supported probability distributions on $G$. For $r gt.eq 1$ set

#[#set math.equation(numbering: n => "(4.2)")
 $ chi_r \( s \) & = min { 1 \, max { 0 \, 2 - s \/ r } } \, #h(2em) s gt.eq 0 \,\
E_r \( P \, y \) & = sum_(h in G) P_h chi_r \( d \( h \, y \) \) \,\
q_r \( P \) & = max_(y in G) E_r \( P \, y \) \, #h(2em) phi.alt_r \( P \) = \( q_r \( P \) - a_(*) \)_(+) \, #h(2em) a_(*) = 0.80 . $ <ch:concentration>]

The maximum exists: the score vanishes outside the finite $2 r$ neighborhood of $"supp" P$. It lies in $\[ 0 \, 1 \]$, so $0 lt.eq phi.alt_r lt.eq 0.20$. The functions $q_r$ and $phi.alt_r$ need not be smooth; they will only be used in inequalities.

#prodef([Definition 4.1.])[
  A #emph[channel] with label set $Lambda$, on which $G$ acts, assigns to each $P in cal(P)_f \( G \)$ a finitely supported subprobability $Y \( P \) = \( Y \( P \)_omega \)_(omega in Lambda)$. Thus $Y \( P \)_omega gt.eq 0$ and $sum_omega Y \( P \)_omega lt.eq 1$. Translation of weights means $\( s P \)_h = P_(s^(- 1) h)$ and $\( s Y \)_omega = Y_(s^(- 1) omega)$. We require left equivariance, $Y \( s P \) = s Y \( P \)$ for $s in G$, and the following smoothness property. For each finite $S subset G$, the restriction to probabilities supported in $S$ has its labels in a fixed finite subset of $Lambda$, and its coordinate functions extend smoothly to a neighborhood of that probability simplex in $bb(R)^S$.
] <ch:channel-definition>

In a transfer direction $dot(P) = delta_h - delta_(h')$, derivatives are computed after enlarging $S$ to contain $h \, h'$. The channels we construct will have compatible formulas on these enlarged spaces, and their derivatives will vanish at zero output coordinates. For such a channel define its Fisher seminorm in this direction by

#[#set math.equation(numbering: n => "(4.3)")
 $ cal(F)_Y \( P \; h \, h' \) = (sum_(omega : Y \( P \)_omega > 0) frac(\| dot(Y) \( P \)_omega \|^2, Y \( P \)_omega))^(1 \/ 2) . $ <ch:fisher-definition>]

The zero-coordinate assertion is part of the construction, and will be proved; it is not a convention for discarding a nonzero derivative.

If $A$ has label set $G$ and $L$ has label set $Lambda$, a #emph[cross kernel] is a function $kappa : G times Lambda arrow.r \[ 0 \, 1 \]$ satisfying $kappa \( s y \, s omega \) = kappa \( y \, omega \)$. It is fixed independently of $P$. It gives the predictions

#[#set math.equation(numbering: n => "(4.4)")
 $ "pred" \( P \, y \) = sum_(omega in Lambda) kappa \( y \, omega \) L \( P \)_omega . $ <ch:prediction-definition>]

Exact predictions alone would be easy: $L \( P \) = P$ and $kappa \( y \, h \) = chi_r \( d \( h \, y \) \)$ give $"pred" \( P \, y \) = E_r \( P \, y \)$. When $G$ has at least two elements, this choice has no uniform Fisher bound: a transfer between distinct elements, adding mass to an entry of size $t > 0$, contributes $1 \/ t$ to the squared seminorm, which diverges as $t arrow.b 0$. The approximation allowed in the next proposition permits uniform derivative control, including at probability faces.

#thm([Proposition 4.2.])[
  (Spatial summary channels).  #emph[Fix $r gt.eq 1$ and $0 < epsilon.alt lt.eq 10^(- 3)$. There are channels $A \, L$ and a cross kernel $kappa$ with either of the following two choices of radius: the early version has $r' = 6 r$, and the later version has $r' = r$. In both versions $A$ is labelled by $G$, and for every $P in cal(P)_f \( G \)$ and $y in G$, 
#[#set math.equation(numbering: n => "(4.5)")
 $ sum_(z in G) A \( P \)_z #scale(x: 120%, y: 120%)[\(] E_r \( P \, z \) - a_(*) #scale(x: 120%, y: 120%)[\)] & gt.eq phi.alt_r \( P \) - 10 epsilon.alt \,\
"pred" \( P \, y \) & lt.eq E_(r') \( P \, y \) + 10 epsilon.alt \,\
"pred" \( P \, y \) & gt.eq E_r \( P \, y \) - 10 epsilon.alt #h(2em) upright("if ") A \( P \)_y > 0 . $ <ch:selection-bound>]

 For $Y = A$ or $Y = L$, derivatives in every transfer direction vanish at zero coordinates and satisfy 
#[#set math.equation(numbering: n => "(4.6)")
 $ cal(F)_Y \( P \; h \, h' \) lt.eq C \( 1 + d \( h \, h' \) \) cases(delim: "{", epsilon.alt^(- 10) \, & upright("early version") \,, r^10 epsilon.alt^(- 10) \, & upright("later version") .) $ <ch:summary-fisher>]

 Here $C$ depends only on the fixed word metric. The numerical error constant $10$ in (4.5)–(4.5) is independent of the group and of the parameters.]
] <ch:summary>

To see why these guarantees are suited to averaging, assume them for the moment. Take a finite family $P^(\( nu \))$ of input probabilities and weights $theta_nu gt.eq 0$ with $sum_nu theta_nu = 1$, and write

$ overline(P) = sum_nu theta_nu P^(\( nu \)) \, #h(2em) overline(A)_y = sum_nu theta_nu A \( P^(\( nu \)) \)_y \, #h(2em) overline("pred")_y = sum_nu theta_nu "pred" \( P^(\( nu \)) \, y \) . $

The selection and lower prediction bounds give $sum_y A \( P \)_y \( "pred" \( P \, y \) - a_(*) \) gt.eq phi.alt_r \( P \) - 20 epsilon.alt$. On the other hand, the upper prediction bound and linearity of $E_(r')$ give $overline("pred")_y lt.eq E_(r') \( overline(P) \, y \) + 10 epsilon.alt$. Since $overline(A)$ is a subprobability, its pairing with $E_(r') \( overline(P) \, dot.op \) - a_(*)$ is at most $phi.alt_(r') \( overline(P) \)$; if the maximal centered score is negative, that pairing is nonpositive. Finally, $sum_nu theta_nu sum_y A \( P^(\( nu \)) \)_y = sum_y overline(A)_y$, so the terms containing $a_(*)$ cancel and

#[#set math.equation(numbering: n => "(4.7)")
 $ & sum_nu theta_nu sum_y A \( P^(\( nu \)) \)_y "pred" \( P^(\( nu \)) \, y \) - sum_y overline(A)_y overline("pred")_y\
 & #h(2em)  gt.eq sum_nu theta_nu phi.alt_r \( P^(\( nu \)) \) - phi.alt_(r') \( overline(P) \) - 30 epsilon.alt . $ <ch:averaging-drop>]

Thus loss of concentration under averaging gives a lower bound for the difference of the two pairings. The same calculation applies to time averages of fields with a common finite support, which is how these estimates will enter the connection construction.

We first construct $A$ and a second distribution $D$ on possible centers. The channel $A$ concentrates near a maximizing center when the maximal score exceeds $a_(*)$. The thresholds for $D$ are lower, so that $D$ already has almost full mass whenever $A$ is nonzero. The two versions of $L$ will then use this same $D$ to predict scores at the selected centers.

=== 4.1 Smooth selection of centers <smooth-selection-of-centers>

The number of centers that can carry substantial score has a bound independent of $\| "supp" P \|$.

#thm([Lemma 4.3.])[
  #emph[For $P in cal(P)_f \( G \)$, the set ${ y : E_r \( P \, y \) > 1 \/ 2 }$ has diameter at most $4 r$ and cardinality at most $exp \( gamma r \)$, where $gamma$ depends only on the word metric.]
] <ch:center-geometry>

#proof[
  The inequality $E_r \( P \, y \) > 1 \/ 2$ implies $P \( { h : d \( h \, y \) < 2 r } \) > 1 \/ 2$. Any two such sets intersect, since their masses add to more than one. Their centers consequently have distance less than $4 r$. If the set of centers is nonempty, choose one of them. All the others lie in its $4 r$ ball, and (4.1) gives the claimed bound, for example with $gamma = 4 c_d$. The empty case is immediate. ◻
]

Choose smooth functions $psi_A \, psi_D : bb(R) arrow.r \[ 0 \, 1 \]$ such that

#[#set math.equation(numbering: n => "(4.8)")
 $ & upright("identically zero on") & upright("identically one on")\
psi_A & \( - oo \, 0.70 \] & \[ 0.75 \, oo \)\
psi_D & \( - oo \, 0.58 \] & \[ 0.62 \, oo \) . $ <ch:cutoffs>]

For completeness, a smooth increasing cutoff from zero to one on $\[ 0 \, 1 \]$ is $eta \( t \) \/ \( eta \( t \) + eta \( 1 - t \) \)$, where $eta \( t \) = e^(- 1 \/ t)$ for $t > 0$ and $eta \( t \) = 0$ for $t lt.eq 0$. Every right derivative of $eta$ at zero vanishes: away from zero it is $e^(- 1 \/ t)$ times a polynomial in $1 \/ t$, which tends to zero as $t arrow.b 0$. The denominator in the displayed quotient is everywhere positive, and affine changes of variable give (4.8). Their first derivatives are bounded by a fixed numerical constant, since they vanish outside fixed compact transition intervals.

Take $N = M_0 r epsilon.alt^(- 2)$ and define

#[#set math.equation(numbering: n => "(4.9)")
 $ w_y^A & = psi_A \( E_r \( P \, y \) \)^2 e^(N \( E_r \( P \, y \) - 0.80 \)) \,\
w_y^D & = psi_D \( E_r \( P \, y \) \)^2 e^(N \( E_r \( P \, y \) - 0.66 \)) \,\
A \( P \)_y & = frac(w_y^A, 1 + sum_z w_z^A) \, #h(2em) D \( P \)_y = frac(w_y^D, 1 + sum_z w_z^D) . $ <ch:selector-formulas>]

Here $M_0$ is fixed in terms of the metric, large enough that for all allowed $r \, epsilon.alt$,

#[#set math.equation(numbering: n => "(4.10)")
 $ \( 1 + e^(gamma r) \) e^(- N epsilon.alt) lt.eq epsilon.alt \, #h(2em) e^(gamma r - 0.04 N) lt.eq 1 . $ <ch:exponential-choices>]

For example, any $M_0 gt.eq 25 gamma + 4$ suffices. Indeed, $log \( 1 + e^(gamma r) \) + log \( 1 \/ epsilon.alt \) lt.eq gamma r + log 2 + 1 \/ epsilon.alt lt.eq \( gamma + 2 \) r \/ epsilon.alt$, and $N gt.eq 25 gamma r$.

The additional $1$ in each denominator may be regarded as the weight of an unused null label. It allows the channel to have small total mass when no center reaches the exponential threshold. Each displayed sum is finite by Lemma 9.

#thm([Lemma 4.4.])[
  (Selector estimates).  #emph[The formulas (4.9) define smooth equivariant channels. They satisfy 
#[#set math.equation(numbering: n => "(4.11)")
 $ sum_y A \( P \)_y \( E_r \( P \, y \) - a_(*) \) gt.eq phi.alt_r \( P \) - 3 epsilon.alt . $ <ch:selector-concentration>]

 Whenever $q_r \( P \) > 0.70$, 
#[#set math.equation(numbering: n => "(4.12)")
 $ sum_z D \( P \)_z gt.eq 1 - epsilon.alt \, #h(2em) sum_z D \( P \)_z E_r \( P \, z \) gt.eq q_r \( P \) - 2 epsilon.alt . $ <ch:D-concentration>]

 Both channels have zero derivatives at zero coordinates, and 
#[#set math.equation(numbering: n => "(4.13)")
 $ cal(F)_A \( P \; h \, h' \) + cal(F)_D \( P \; h \, h' \) lt.eq C epsilon.alt^(- 2) d \( h \, h' \) . $ <ch:selector-fisher>]

]
] <ch:selector-estimates>

#proof[
  Fix $P$ and abbreviate $E_r \( P \, y \)$ to $E_y$ and $q_r \( P \)$ to $q$. Suppose first that $q > a_(*) + epsilon.alt$. At a maximizing center the cutoff $psi_A$ is one, and its weight is $e^(N \( q - a_(*) \))$. The normalized mass of centers with $E_y < q - epsilon.alt$, together with the null mass, is at most $\( 1 + e^(gamma r) \) e^(- N epsilon.alt) lt.eq epsilon.alt$. On the remaining centers $E_y - a_(*) gt.eq q - a_(*) - epsilon.alt$; on all centers $E_y - a_(*) gt.eq - 1$. Their weighted sum is therefore at least $q - a_(*) - 3 epsilon.alt$. If $q lt.eq a_(*) + epsilon.alt$, the total mass at centers with $E_y < a_(*) - epsilon.alt$ is at most $e^(gamma r) e^(- N epsilon.alt) lt.eq epsilon.alt$, using the $1$ in the denominator. All other negative contributions are bounded below by $- epsilon.alt$ times their mass. The sum is at least $- 2 epsilon.alt$, whereas $phi.alt_r \( P \) lt.eq epsilon.alt$. This proves (4.11) in both cases.
  Now assume $q > 0.70$. The cutoff $psi_D$ is one at a maximizing center. The same comparison, with threshold $0.66$, shows that the total mass of the null label and the centers with $E_z < q - epsilon.alt$ is at most $epsilon.alt$. Indeed the null-weight ratio is $e^(- N \( q - 0.66 \)) lt.eq e^(- N epsilon.alt)$. Thus the nonnull mass is at least $1 - epsilon.alt$, and the score average is at least $\( 1 - epsilon.alt \) \( q - epsilon.alt \) gt.eq q - 2 epsilon.alt$. This proves (4.12).
  We next prove the derivative estimate. Put $d_0 = d \( h \, h' \)$. The function $chi_r$ is $1 \/ r$-Lipschitz, so
  #[#set math.equation(numbering: n => "(4.14)")
   $ \| dot(E)_y \| = \| chi_r \( d \( h \, y \) \) - chi_r \( d \( h' \, y \) \) \| lt.eq d_0 \/ r . $ <ch:score-derivative>]
  The following calculation applies to either cutoff, with its corresponding threshold $theta in { 0.80 \, 0.66 }$. Set
  $ f_y = psi \( E_y \) e^(N \( E_y - theta \) \/ 2) \, #h(2em) F = \( 1 \, \( f_y \)_y \) \, #h(2em) Z = parallel F parallel^2 = 1 + sum_y f_y^2 . $
  The nonnull coordinates of $F \/ parallel F parallel$ are the smooth nonnegative square roots of the normalized weights. Differentiating a normalized Euclidean vector gives
  #[#set math.equation(numbering: n => "(4.15)")
   $ ∥frac(d, d t) frac(F, parallel F parallel)∥^2 lt.eq frac(parallel dot(F) parallel^2, Z) . $ <ch:normalization-derivative>]
  To see this, the derivative is $parallel F parallel^(- 1)$ times the orthogonal projection of $dot(F)$ onto $F^perp$.
  Differentiating $f_y$ and using $\( u + v \)^2 lt.eq 2 u^2 + 2 v^2$ gives
  #[#set math.equation(numbering: n => "(4.16)")
   $ frac(parallel dot(F) parallel^2, Z) lt.eq C d_0^2 / r^2 (frac(sum_y \| psi' \( E_y \) \|^2 e^(N \( E_y - theta \)), Z) + N^2 frac(sum_y f_y^2, Z)) . $ <ch:cutoff-derivative-estimate>]
  The second fraction is at most one. A nonzero cutoff derivative requires $E_y lt.eq 0.75$ for $A$ or $E_y lt.eq 0.62$ for $D$. In either case $E_y - theta lt.eq - 0.04$. Lemma 9 bounds the number of these terms by $e^(gamma r)$. The first fraction is consequently at most $C e^(gamma r - 0.04 N) lt.eq C$. Equations (4.15) and (4.16) now bound the squared norm of the square-root derivative by $C \( 1 + N^2 \) d_0^2 \/ r^2$. At a positive normalized weight $Y_y$, $\| dot(Y)_y \|^2 \/ Y_y = 4 \| frac(d, d t) sqrt(Y_y) \|^2$. Substituting $N = M_0 r epsilon.alt^(- 2)$ proves (4.13).
  These computations also justify regularity at zero coordinates. A smooth nonnegative function has zero derivative wherever it vanishes. Thus $psi \( E_y \) = 0$ implies $dot(f)_y = 0$, even in a transfer direction that leaves a probability face. Hence the normalized weight and its square root both have zero derivative there.
  Finally, on distributions supported in a fixed finite $S$, only centers within its $2 r$ neighborhood can have a nonzero score. The formulas in (4.9) are therefore finite smooth formulas on $bb(R)^S$, with positive denominators. Enlarging $S$ adds the same formulas for the additional coordinates. This proves the stated smoothness and compatibility at faces. Left equivariance follows from the left invariance of $d$. ◻
]

The final averaging stage will only need $D$, together with its concentration on a bounded set of labels. We record that consequence separately.

#thm([Lemma 4.5.])[
  (Terminal channel).  #emph[For each $r gt.eq 1$ and $0 < epsilon.alt lt.eq 10^(- 3)$, the channel $D$ in (4.9) is smooth, left equivariant, and has total mass at most one. Its nonempty support has diameter at most $4 r$ and cardinality at most $e^(gamma r)$, with $gamma$ depending only on the word metric. If $q_r \( P \) > 0.70$, its mass is at least $1 - epsilon.alt gt.eq 1 \/ 2$. Its transfer derivatives vanish at zero coordinates and satisfy 
$ cal(F)_D \( P \; h \, h' \) lt.eq C epsilon.alt^(- 2) d \( h \, h' \) lt.eq C epsilon.alt^(- 10) \( 1 + d \( h \, h' \) \) . $

 In particular, if $phi.alt_r \( P \) > 0$, then 
#[#set math.equation(numbering: n => "(4.17)")
 $ sum_z D \( P \)_z^2 gt.eq 1 / 4 e^(- gamma r) . $ <ch:terminal-square-mass>]

]
] <ch:terminal>

#proof[
  Every center in the support of $D$ has score greater than $0.58 > 1 \/ 2$. Apply Lemma 9 and Lemma 10. If $phi.alt_r \( P \) > 0$, then $q_r \( P \) > 0.80$, so $sum_z D_z gt.eq 1 \/ 2$. The Cauchy–Schwarz inequality on the finite support gives $sum_z D_z^2 gt.eq \( sum_z D_z \)^2 \/ \| "supp" D \|$, proving (4.17). ◻
]

=== 4.2 Predictions with an enlarged radius <predictions-with-an-enlarged-radius>

The early channel can use the average score of the centers chosen by $D$. All these centers lie near any center selected by $A$. Enlarging the radius allows us to bound each score contributing at $y$ by $E_(6 r) \( P \, y \)$. Define

#[#set math.equation(numbering: n => "(4.18)")
 $ Lambda = G \, #h(2em) L \( P \)_z = D \( P \)_z E_r \( P \, z \) \, #h(2em) kappa \( y \, z \) = upright(bold(1))_({ d \( y \, z \) lt.eq 4 r }) . $ <ch:early-channel>]

This is a subprobability channel, since $0 lt.eq E_r \( P \, z \) lt.eq 1$. When $d \( y \, z \) lt.eq 4 r$, every $h$ with $chi_r \( d \( h \, z \) \) > 0$ has $d \( h \, y \) < 6 r$. On this set $chi_(6 r) \( d \( h \, y \) \) = 1$, and therefore

#[#set math.equation(numbering: n => "(4.19)")
 $ E_r \( P \, z \) lt.eq E_(6 r) \( P \, y \) . $ <ch:radius-domination>]

After summing against $D$, this proves $"pred" \( P \, y \) lt.eq E_(6 r) \( P \, y \)$.

If $A \( P \)_y > 0$, then $E_r \( P \, y \) > 0.70$ and $q_r \( P \) > 0.70$. For every $z$ with $D \( P \)_z > 0$, Lemma 9 gives $d \( y \, z \) lt.eq 4 r$. Hence every such $z$ contributes to the prediction, and (4.12) gives

$ "pred" \( P \, y \) = sum_z D \( P \)_z E_r \( P \, z \) gt.eq q_r \( P \) - 2 epsilon.alt gt.eq E_r \( P \, y \) - 2 epsilon.alt . $

To estimate derivatives, write $E_z = E_r \( P \, z \)$ again. Where $D_z > 0$, $E_z > 0.58$. Differentiating $L_z = D_z E_z$ yields

#[#set math.equation(numbering: n => "(4.20)")
 $ sum_(z : L_z > 0) frac(\| dot(L)_z \|^2, L_z) lt.eq 2 sum_(z : D_z > 0) E_z frac(\| dot(D)_z \|^2, D_z) + 2 sum_(z : D_z > 0) D_z frac(\| dot(E)_z \|^2, E_z) lt.eq C epsilon.alt^(- 4) d \( h \, h' \)^2 . $ <ch:early-fisher>]

In the second sum only $D_z > 0$ is relevant; its denominators are thus bounded below by $0.58$. We used (4.14), (4.13), and $r gt.eq 1$. At a zero coordinate $D_z = 0$ and $dot(D)_z = 0$, so $dot(L)_z = 0$. The same finite formulas prove smoothness at faces. This establishes all the early-version claims of Proposition 8.

=== 4.3 Accurate finite sample strings <accurate-finite-sample-strings>

To keep the radius equal to $r$, an average of center scores is insufficient: we must predict the score separately at each $y$. A finite string of sample points approximates all scores in a bounded region simultaneously. Random sampling will prove the existence of an accurate string. We will then put smooth positive weights on #emph[all] strings in a fixed finite alphabet. This distinction is useful at probability faces: the defining weights will not be products of possibly vanishing input probabilities.

Fix a center $z in G$. Introduce a null symbol $partial$, fixed by the group action, and the alphabet

$ cal(A)_z = B \( z \, 20 r \) union { partial } . $

Define a probability $Q^z$ on this alphabet by

#[#set math.equation(numbering: n => "(4.21)")
 $ P_h^z = P_h chi_(10 r) \( d \( h \, z \) \) \, #h(2em) Q_h^z = P_h^z med \( h eq.not partial \) \, #h(2em) Q_partial^z = 1 - sum_h P_h^z . $ <ch:truncated-probability>]

The notation $E_r \( P^z \, y \)$ has the same linear meaning as in (4.2), although $P^z$ can have mass less than one. This truncation provides a fixed finite alphabet while preserving every score needed for the lower prediction bound. Indeed, if $A \( P \)_y D \( P \)_z > 0$, Lemma 9 gives $d \( y \, z \) lt.eq 4 r$. Every $h$ contributing to $E_r \( P \, y \)$ then has $d \( h \, z \) < 6 r$, where the factor $chi_(10 r) \( d \( h \, z \) \)$ is one. Consequently

#[#set math.equation(numbering: n => "(4.22)")
 $ E_r \( P^z \, y \) = E_r \( P \, y \) #h(2em) upright("if ") A \( P \)_y D \( P \)_z > 0 . $ <ch:truncation-exactness>]

For arbitrary $y$, we still have $E_r \( P^z \, y \) lt.eq E_r \( P \, y \)$, which is the direction needed for the upper bound. Thus accurate predictions for $P^z$ will suffice. The Lipschitz taper in (4.21) will also keep their transfer derivatives proportional to $d \( h \, h' \) \/ r$.

For a positive integer $b$ and a string $w = \( w_1 \, dots.h \, w_b \) in cal(A)_z^b$ let

#[#set math.equation(numbering: n => "(4.23)")
 $ H_y \( w \) = 1 / b sum_(i : w_i eq.not partial) chi_r \( d \( w_i \, y \) \) \, #h(2em) Delta \( P \; z \, w \) = max_(y in B \( z \, 22 r \)) \| H_y \( w \) - E_r \( P^z \, y \) \| . $ <ch:string-discrepancy>]

Both scores vanish when $d \( y \, z \) > 22 r$, by the triangle inequality. Thus $Delta$ also controls the discrepancy at every $y in G$. Always $0 lt.eq Delta lt.eq 1$.

#thm([Lemma 4.6.])[
  #emph[There is a constant $C$, depending only on the word metric, and an integer $b$ depending only on $r \, epsilon.alt$, with $1 lt.eq b lt.eq C r epsilon.alt^(- 4)$, such that for every $P$ and $z$ some $w in cal(A)_z^b$ satisfies $Delta \( P \; z \, w \) lt.eq epsilon.alt$.]
] <ch:accurate-string>

#proof[
  Take $b$ independent samples with distribution $Q^z$. For a fixed test center $y$, each summand in $H_y$ lies in $\[ 0 \, 1 \]$ and has mean $E_r \( P^z \, y \)$. The bounded-variable concentration estimate of Hoeffding #cite(label("Hoeffding1963")) gives the needed probability bound. We include a direct exponential-moment proof, with sufficient constants. If a real random variable $X$ has mean zero and $\| X \| lt.eq 1$, then, for $\| t \| lt.eq 1$,
  $ upright(bold(E)) e^(t X) lt.eq 1 + sum_(k gt.eq 2) frac(\| t \|^k, k !) lt.eq 1 + t^2 lt.eq e^(t^2) . $
  For independent copies $X_1 \, dots.h \, X_b$, Markov’s inequality and independence, with $t = epsilon.alt \/ 2$, imply
  $ upright(bold(P)) #h(-0.16667em) (1 / b sum_i X_i > epsilon.alt) lt.eq e^(- t b epsilon.alt) product_i upright(bold(E)) e^(t X_i) lt.eq e^(- b epsilon.alt^2 \/ 4) . $
  Applying the same argument to $- X_i$ gives the bound $2 e^(- b epsilon.alt^2 \/ 4)$ for absolute error exceeding $epsilon.alt$.
  By (4.1), there is a fixed $c_1$ such that the number of test centers is at most $e^(c_1 r)$. A union bound therefore gives
  $ upright(bold(P)) #scale(x: 120%, y: 120%)[\(] Delta \( P \; z \, w \) > epsilon.alt #scale(x: 120%, y: 120%)[\)] lt.eq 2 e^(c_1 r - b epsilon.alt^2 \/ 4) . $
  Choose $b = ceil.l M_1 r epsilon.alt^(- 4) ceil.r$ with a sufficiently large fixed $M_1$. The right side is strictly less than one for all permitted $r \, epsilon.alt$. At least one string is accurate. Since $r epsilon.alt^(- 4) gt.eq 1$, rounding preserves the asserted upper bound on $b$. ◻
]

=== 4.4 Smooth weights on strings <smooth-weights-on-strings>

Fix the integer $b$ supplied by Lemma 12. To assign smooth weights, replace the maximum of the signed errors by the logarithm of a sum of exponentials. Put

#[#set math.equation(numbering: n => "(4.24)")
 $ S \( P \; z \, w \) = 1 / lambda log (sum_(y in B \( z \, 22 r \)) sum_(sigma in { - 1 \, 1 }) exp #scale(x: 120%, y: 120%)[\(] lambda sigma \( H_y \( w \) - E_r \( P^z \, y \) \) #scale(x: 120%, y: 120%)[\)]) . $ <ch:smooth-discrepancy>]

Choose $lambda > 0$, depending only on $r \, epsilon.alt$, so large that the logarithm of the number of signed tests is at most $lambda epsilon.alt$. The number of tests is independent of $z$, since left translation identifies the balls. The elementary inequalities $e^(lambda max x_i) lt.eq sum_i e^(lambda x_i) lt.eq M e^(lambda max x_i)$ give

#[#set math.equation(numbering: n => "(4.25)")
 $ Delta \( P \; z \, w \) lt.eq S \( P \; z \, w \) lt.eq Delta \( P \; z \, w \) + epsilon.alt . $ <ch:smoothing-error>]

The first derivative of this smoothed maximum has a particularly simple bound. The test function $h mapsto chi_(10 r) \( d \( h \, z \) \) chi_r \( d \( h \, y \) \)$ is $11 \/ \( 10 r \)$-Lipschitz: both factors have absolute value at most one, and their Lipschitz constants add. Thus every signed error in (4.24) has transfer derivative of absolute value at most $11 d \( h \, h' \) \/ \( 10 r \)$. Differentiation of the logarithm gives a convex combination of these derivatives; the factor $lambda$ cancels. Consequently

#[#set math.equation(numbering: n => "(4.26)")
 $ \| dot(S) \( P \; z \, w \) \| lt.eq frac(11, 10 r) d \( h \, h' \) . $ <ch:smooth-discrepancy-derivative>]

In particular this estimate does not grow with the number of tests or the smoothing parameter.

Now define a probability distribution on the entire fixed set of strings by

#[#set math.equation(numbering: n => "(4.27)")
 $ pi_z \( P \)_w = frac(e^(- N_1 S \( P \; z \, w \)), sum_(v in cal(A)_z^b) e^(- N_1 S \( P \; z \, v \))) \, #h(2em) N_1 = M_2 r b epsilon.alt^(- 2) . $ <ch:gibbs-strings>]

Every coordinate is strictly positive. The constant $M_2$ will be fixed in terms of the metric.

#thm([Lemma 4.7.])[
  #emph[For $M_2$ sufficiently large, uniformly in $P \, z \, y$, 
#[#set math.equation(numbering: n => "(4.28)")
 $ sum_w pi_z \( P \)_w Delta \( P \; z \, w \) & lt.eq 5 epsilon.alt \,\
lr(|sum_w pi_z \( P \)_w H_y \( w \) - E_r \( P^z \, y \)|) & lt.eq 5 epsilon.alt . $ <ch:mean-discrepancy>]

 The transfer derivatives satisfy 
#[#set math.equation(numbering: n => "(4.29)")
 $ (sum_w frac(\| dot(pi)_z \( P \)_w \|^2, pi_z \( P \)_w))^(1 \/ 2) lt.eq C N_1 frac(d \( h \, h' \), r) . $ <ch:string-fisher>]

]
] <ch:string-estimates>

#proof[
  There are at most $e^(c_2 r b)$ strings, for a constant $c_2$ fixed by the metric. By Lemma 12 and (4.25), at least one string has $S lt.eq 2 epsilon.alt$. Every string with $Delta > 4 epsilon.alt$ has $S > 4 epsilon.alt$, and hence a weight at most $e^(- 2 N_1 epsilon.alt)$ times the weight of that particular string. Therefore
  $ sum_(w : Delta \( P \; z \, w \) > 4 epsilon.alt) pi_z \( P \)_w lt.eq e^(c_2 r b - 2 N_1 epsilon.alt) lt.eq epsilon.alt $
  once $M_2$ is sufficiently large. One fixed choice works for all $r gt.eq 1$, $b gt.eq 1$, and $epsilon.alt lt.eq 10^(- 3)$, as is seen by taking logarithms and using $log \( 1 \/ epsilon.alt \) lt.eq 1 \/ epsilon.alt$. Since $Delta lt.eq 1$, splitting the expectation at $4 epsilon.alt$ proves (4.28). The discrepancy controls each test center, and both scores vanish outside the test ball, proving (4.28) for every $y$.
  Differentiating the normalized exponential in (4.27) gives
  $ frac(dot(pi)_z \( P \)_w, pi_z \( P \)_w) = - N_1 (dot(S) \( P \; z \, w \) - sum_v pi_z \( P \)_v dot(S) \( P \; z \, v \)) . $
  Equation (4.26) bounds its absolute value by $C N_1 d \( h \, h' \) \/ r$. Squaring and summing against the probability $pi_z \( P \)$ proves (4.29). ◻
]

=== 4.5 Predictions at the original radius <predictions-at-the-original-radius>

We can now finish the later channel. Its label set consists of pairs $\( z \, w \)$, with $z in G$ and $w in cal(A)_z^b$. Translation acts on the center and on every nonnull entry of the string. Define

#[#set math.equation(numbering: n => "(4.30)")
 $ L \( P \)_(z \, w) = D \( P \)_z pi_z \( P \)_w \, #h(2em) kappa \( y \, \( z \, w \) \) = H_y \( w \) . $ <ch:later-channel>]

The total mass of $L$ is $sum_z D \( P \)_z lt.eq 1$, and the kernel takes values in $\[ 0 \, 1 \]$. All formulas commute with left translation.

By (4.28), and since $P_h^z lt.eq P_h$,

$ "pred" \( P \, y \) lt.eq sum_z D \( P \)_z #scale(x: 120%, y: 120%)[\(] E_r \( P^z \, y \) + 5 epsilon.alt #scale(x: 120%, y: 120%)[\)] lt.eq E_r \( P \, y \) + 5 epsilon.alt . $

Suppose next that $A \( P \)_y > 0$. For every $z$ with $D \( P \)_z > 0$, (4.22) identifies the predicted truncated score with $E_r \( P \, y \)$. Moreover $q_r \( P \) > 0.70$, and (4.12) gives $sum_z D \( P \)_z gt.eq 1 - epsilon.alt$. It follows that

$ "pred" \( P \, y \) gt.eq E_r \( P \, y \) sum_z D \( P \)_z - 5 epsilon.alt sum_z D \( P \)_z gt.eq E_r \( P \, y \) - 6 epsilon.alt . $

These are the required prediction bounds with $r' = r$.

For the derivative bound it is useful to retain the product structure $L_(z \, w) = D_z pi_z \( w \)$. Since $sum_w pi_z \( w \) = 1$ and $sum_w dot(pi)_z \( w \) = 0$, expansion of the square gives the exact identity

#[#set math.equation(numbering: n => "(4.31)")
 $ sum_(z \, w : L_(z \, w) > 0) frac(\| dot(L)_(z \, w) \|^2, L_(z \, w)) = sum_(z : D_z > 0) frac(\| dot(D)_z \|^2, D_z) + sum_z D_z sum_w frac(\| dot(pi)_z \( w \) \|^2, pi_z \( w \)) . $ <ch:product-fisher>]

All weights and derivatives here are real; the mixed term vanishes by the displayed zero-sum identity. Using (4.13), (4.29), and $b lt.eq C r epsilon.alt^(- 4)$ yields

#[#set math.equation(numbering: n => "(4.32)")
 $ cal(F)_L \( P \; h \, h' \) lt.eq C #scale(x: 120%, y: 120%)[\(] epsilon.alt^(- 2) + N_1 \/ r #scale(x: 120%, y: 120%)[\)] d \( h \, h' \) lt.eq C r epsilon.alt^(- 6) d \( h \, h' \) . $ <ch:later-fisher>]

It remains to check the regularity promised in the channel definition. For a fixed finite input support $S$, only finitely many centers $z$ can have $D_z eq.not 0$, all in the $2 r$ neighborhood of $S$. For each such center, the alphabet and string set are finite and independent of $P$. The functions $S \( P \; z \, w \)$ and $pi_z \( P \)_w$ are smooth functions of the coordinates of $P$: the scores are linear, and each exponential sum has a strictly positive denominator. Thus (4.30) is a fixed finite smooth formula on each enlarged support space. If $L_(z \, w) = 0$, strict positivity of $pi_z \( w \)$ implies $D_z = 0$; also $dot(D)_z = 0$ by Lemma 10. Consequently $dot(L)_(z \, w) = 0$. This proves smoothness at faces and the required behavior at zero entries.

#proof[
  #emph[Completion of the proof of Proposition 8.] Use the same selector $A$ in both versions. Inequality (4.11) gives (4.5). The early construction (4.18) gives the two prediction inequalities with errors $0$ and $2 epsilon.alt$; the later construction (4.30) gives errors $5 epsilon.alt$ and $6 epsilon.alt$. All are bounded by $10 epsilon.alt$. The Fisher estimates (4.13), (4.20), and (4.32) imply (4.6), since $r gt.eq 1$ and $epsilon.alt lt.eq 1$. The preceding constructions also verify the channel and cross-kernel requirements, including the assertions at zero coordinates. ◻
]

For use with differential forms, regard the labels of $A$ and $L$ as disjoint even when their underlying sets happen to coincide. On their disjoint union define the symmetric kernel $K$ by

#[#set math.equation(numbering: n => "(4.33)")
 $ K \( y \, omega \) = K \( omega \, y \) & = 1 / 2 kappa \( y \, omega \) quad \( y in G \, med omega in Lambda \) \,\
K & = 0 quad upright("within either channel") . $ <ch:symmetric-kernel>]

For vectors on this union, write $K \( U \, V \) = sum_(xi \, eta) K \( xi \, eta \) U_xi V_eta$. The combined field $Y = A xor L$ has mass at most two, and

#[#set math.equation(numbering: n => "(4.34)")
 $ K \( Y \( P \) \, Y \( P \) \) = sum_y A \( P \)_y "pred" \( P \, y \) . $ <ch:kernel-diagonal>]

The kernel is bounded and invariant under simultaneous left translation. The expression in (4.3) also makes sense for this field of mass at most two, and its square is $cal(F)_A \( P \; h \, h' \)^2 + cal(F)_L \( P \; h \, h' \)^2$. Thus Proposition 8 controls its derivatives as well. These facts permit both channels to enter a single bilinear pairing in the averaging construction.

== 5 A connection from successive time averages <sec:connection>

Proposition 6 allows us to compute the trace with any connection satisfying Definition 5. We now construct a connection whose curvature can be estimated at several time scales. The construction first gives a one-form $B$ with uniformly positive contraction $B \( V \)$; division by this contraction will produce the connection. The summary channels of Proposition 8 make the contributions of successive scales telescope. The final contribution uses the twist by $g$.

Throughout this section $G$ is finitely generated, $d$ is its fixed left invariant word metric, and $g in G$. Constants denoted by $C$ may depend on the word metric and on the fixed smooth functions used below. After the parameter choice at the end of the construction, a subscript $R$ will permit dependence on the radius $R$, but never on the tuple, its dimension, or the element $g$.

=== 5.1 Time averages and spatial summaries <time-averages-and-spatial-summaries>

Begin with a finite number $b_(*) gt.eq 2$ of averaging stages, an even ambient dimension $n$, and positive time scales $delta_1 < dots.h.c < delta_(b_(*))$ satisfying

#[#set math.equation(numbering: n => "(5.1)")
 $ sum_(i = 1)^j delta_i lt.eq 2 delta_j \, #h(2em) 10 delta_(b_(*)) < 1 . $ <co:scale-support>]

The construction through positivity uses only these conditions on the time scales. Their precise dependence on $R$ and $n$ will be selected afterwards, when preparing the quantitative estimates. #emph[The same scales are kept fixed in every dimension $0 lt.eq k lt.eq n$.] Thus passing to a face never changes the averaging operation.

Choose a nonnegative, even $C^oo$ function $mu$, supported in $\[ - 1 \, 1 \]$, with integral one, and put $mu_j \( s \) = delta_j^(- 1) mu \( s \/ delta_j \)$. On a tuple of dimension $k$, write its step function and its averages as

#[#set math.equation(numbering: n => "(5.2)")
 $ f \( u \) & = h_i quad \( t_i lt.eq u < t_(i + 1) \) \, #h(2em) f \( u + 1 \) = g f \( u \) \,\
P_0 \( u \) & = delta_(f \( u \)) \, #h(2em) P_j \( u \) = integral_(bb(R)) mu_j \( s \) P_(j - 1) \( u - s \) thin d s . $ <co:averages>]

Zero-length intervals are omitted. These are finitely supported probability distributions at each time, and $P_j \( u + 1 \) = g P_j \( u \)$. If $eta_j = mu_j * dots.h.c * mu_1$, then

#[#set math.equation(numbering: n => "(5.3)")
 $ P_j = eta_j * P_0 \, #h(2em) "supp" eta_j subset \[ - 2 delta_j \, 2 delta_j \] \, #h(2em) parallel eta_j parallel_oo lt.eq C \/ delta_j . $ <co:smearing>]

The support bound follows from (5.1), and the supremum bound follows by convolving $mu_j$ with probability densities.

To summarize these averages spatially, choose $R gt.eq 1$ and an integer $2 lt.eq J_(*) lt.eq b_(*)$. Put

#[#set math.equation(numbering: n => "(5.4)")
 $ r_j = 6^(min \( j \, J_(*) \) - 1) R \, #h(2em) r = 6^(J_(*) - 1) R . $ <co:spatial-radii>]

The radius increases by a factor of six during the first $J_(*) - 1$ steps and is then fixed at $r$. Use accuracies

#[#set math.equation(numbering: n => "(5.5)")
 $ epsilon.alt_j = epsilon.alt_(*) \( 1 + j \)^(- 2) quad \( j gt.eq 1 \) \, #h(2em) 30 sum_(j gt.eq 1) epsilon.alt_j lt.eq 1 / 10 \, $ <co:error-budget>]

where $0 < epsilon.alt_(*) lt.eq 10^(- 3)$ is fixed sufficiently small. The summable errors will leave a positive quantity after telescoping.

For $1 lt.eq j < b_(*)$, apply Proposition 8 to $P_j \( u \)$ at parameters $\( r_j \, epsilon.alt_j \)$. Use its early version when $j < J_(*)$ and its later version when $j gt.eq J_(*)$. Denote the resulting channels by $A_j \, L_j$ and their prediction kernel by $kappa_j$. On the disjoint union of the two label sets put

#[#set math.equation(numbering: n => "(5.6)")
 $ Y_j \( u \) = A_j \( P_j \( u \) \) xor L_j \( P_j \( u \) \) . $ <co:channel-fields>]

Define a symmetric bilinear kernel $K_j$ to be zero between labels in the same channel and to have value $kappa_j \( y \, omega \) \/ 2$ between the two channels. Thus

#[#set math.equation(numbering: n => "(5.7)")
 $ K_j \( Y_j \( u \) \, Y_j \( u \) \) = sum_y A_j \( P_j \( u \) \)_y "pred"_j \( P_j \( u \) \, y \) . $ <co:channel-pairing>]

The total mass of $Y_j \( u \)$ is at most two, and $\| K_j \| lt.eq 1$.

At the first and last stages use

#[#set math.equation(numbering: n => "(5.8)")
 $ Y_0 = P_0 \, & K_0 \( h \, h' \) = chi_R \( d \( h \, h' \) \) \,\
Y_(b_(*)) \( u \) = D \( P_(b_(*)) \( u \) \) \, & K_(b_(*)) \( h \, h' \) = upright(bold(1))_(h = h') \, $ <co:end-fields>]

where $D$ is the channel of Lemma 11 at parameters $\( r \, epsilon.alt_(b_(*)) \)$. These two fields have mass at most one. All the fields obey $Y_j \( u + 1 \) = g Y_j \( u \)$, and every kernel is invariant under simultaneous left translation of its labels.

The last channel needs a multiplier to compensate for its possible spread over many labels. Lemma 11 gives $sum_z D \( P \)_z^2 gt.eq 1 / 4 e^(- C_D r)$ when $phi.alt_r \( P \) > 0$, for a fixed constant $C_D$. Choose a fixed $C_(*) gt.eq C_D$ and set

#[#set math.equation(numbering: n => "(5.9)")
 $ W = exp \( C_(*) r \) . $ <co:accuracy>]

Since $0 lt.eq phi.alt_r lt.eq 1 - a_(*) = 1 \/ 5$, this gives, for every accuracy parameter in (5.5),

#[#set math.equation(numbering: n => "(5.10)")
 $ W sum_z D \( P \)_z^2 gt.eq phi.alt_r \( P \) . $ <co:terminal-multiplier>]

We shall construct the connection under either of the assumptions

#[#set math.equation(numbering: n => "(5.11)")
 $ upright("(i)") & g upright(" has infinite order") \,\
upright("(ii)") & g upright(" has finite order and ") min_(h in G) d \( h \, g h \) > 4 r . $ <co:twist-assumption>]

Only the final time-lag kernel and its contraction distinguish these two cases.

=== 5.2 Lag pairings and their compatibility <lag-pairings-and-their-compatibility>

We next turn the fields into one-forms. For $0 lt.eq j < b_(*)$ let $rho_j = mu_(j + 1) * mu_(j + 1)$ and define the odd function

#[#set math.equation(numbering: n => "(5.12)")
 $ U_j \( s \) = "sign" \( s \) - 2 integral_0^s rho_j \( a \) thin d a . $ <co:lag-kernels>]

It is bounded in absolute value by one and vanishes outside $\[ - 2 delta_(j + 1) \, 2 delta_(j + 1) \]$. In the sense of distributions,

#[#set math.equation(numbering: n => "(5.13)")
 $ U'_j = 2 \( delta_0 - rho_j \) . $ <co:lag-derivative>]

Here $delta_0$ denotes the Dirac measure at zero, rather than a time scale. At the final stage set

#[#set math.equation(numbering: n => "(5.14)")
 $ U_(b_(*)) \( s \) = "sign" \( s \) \, & rho_(b_(*)) = 0 \, & upright("in case (i)") \,\
U_(b_(*)) \( s \) = "sign" \( s \) upright(bold(1))_(\| s \| < 1) \, & rho_(b_(*)) = 1 / 2 \( delta_(- 1) + delta_1 \) \, & upright("in case (ii)") . $ <co:last-kernel>]

Formula (5.13) holds at this stage as well. Values at the jump points have no effect on any integral below.

The differential $d Y_j \( u \)$ in the following definition acts on the tuple times $t_0 \, dots.h \, t_k$, with $u$ fixed. Write $integral_(upright("per"))$ for integration over one period, using a half-open interval when integrating the raw impulse measure, and put

#[#set math.equation(numbering: n => "(5.15)")
 $ B_j & = - 1 / 2 integral_(upright("per")) d u integral_(bb(R)) d v thin U_j \( v - u \) K_j \( d Y_j \( u \) \, Y_j \( v \) \) \,\
B & = sum_(j = 0)^(b_(*) - 1) B_j + W B_(b_(*)) . $ <co:forms>]

For $j = 0$ the differential of the step field is a measure in $u$. Specifically, set

#[#set math.equation(numbering: n => "(5.16)")
 $ J_i = delta_(h_(i - 1)) - delta_(h_i) \, #h(2em) d P_0 \( u \) = sum_(i = 0)^k sum_(a in bb(Z)) g^a J_i thin delta_(t_i + a) \( u \) thin d t_i . $ <co:impulses>]

The periodic convention gives $h_(- 1) = g^(- 1) h_k$. Thus the coefficient of $d t_i$ in the raw form is

#[#set math.equation(numbering: n => "(5.17)")
 $ \( B_0 \)_i = - 1 / 2 integral_(bb(R)) U_0 \( v - t_i \) K_0 \( J_i \, P_0 \( v \) \) thin d v . $ <co:raw-coefficient>]

The expression in (5.16) is a distributional identity in the interior of the ordered time domain. Formula (5.17) will also specify its smooth extension to the faces.

#thm([Lemma 5.1.])[
  #emph[The forms in (5.15) are well defined, independent of the period cut, and smooth up to every simplex face by one-sided extension. They are invariant under simultaneous translation of all times, under the centralizer action, and under twisted rotation. Their tangential restrictions to faces equal the forms for the shortened tuples, using the same parameters and the same fixed integer $n$.]
] <co:regularity>

#proof[
  We first treat $j > 0$. On a fixed tuple the smoothed probabilities have the explicit expression
  #[#set math.equation(numbering: n => "(5.18)")
   $ P_j \( u \) = sum_(a in bb(Z)) sum_(i = 0)^k (integral_(t_i + a)^(t_(i + 1) + a) eta_j \( u - v \) thin d v) delta_(g^a h_i) . $ <co:smooth-intervals>]
  For $u$ in a bounded interval and times in a neighborhood of any point of the closed ordered domain, only a fixed finite set of summands occurs. Each coefficient is smooth in $u$ and the times, including when the endpoints coincide. The channel maps are smooth on the finite probability simplices, with smooth extensions at their faces, so $Y_j$ has the same regularity. Its possible labels on one period lie in a fixed finite set locally in the time variables.
  When $U_j$ has compact support, the two integrals in (5.15) can therefore be differentiated under fixed integration domains. The final full-sign kernel in case (i) requires an additional observation. Write $v = w + a$ with $w$ in one period. If $y \, z$ are possible labels in that period, then
  $ K_(b_(*)) \( y \, g^a z \) eq.not 0 quad arrow.l.r.double quad y = g^a z . $
  Since $g$ has infinite order, this equation has at most one solution $a in bb(Z)$ for each pair $\( y \, z \)$. There are only finitely many such pairs locally. The full-sign integral is therefore locally a finite sum of smooth integrals over bounded domains, even though the possible matching integers need not be uniformly bounded as the tuple varies.
  To check the period cut, regard
  $ F_j \( u \) = integral_(bb(R)) U_j \( v - u \) K_j \( d Y_j \( u \) \, Y_j \( v \) \) thin d v $
  as a one-form in the time parameters. The identities $Y_j \( u + 1 \) = g Y_j \( u \)$ and $d Y_j \( u + 1 \) = g thin d Y_j \( u \)$, followed by the change of variable $v mapsto v + 1$, give $F_j \( u + 1 \) = F_j \( u \)$. Hence its integral over one period is independent of the cut. This also shows why a moving cut does not introduce an extra exterior-derivative term: if the cut is $c = c \( t \)$, the endpoint contribution is
  #[#set math.equation(numbering: n => "(5.19)")
   $ d c and #scale(x: 120%, y: 120%)[\(] F_j \( c + 1 \) - F_j \( c \) #scale(x: 120%, y: 120%)[\)] = 0 . $ <co:cut-cancellation>]
  For the raw stage, work first away from the faces and choose a fixed period cut away from its finitely many jumps. Evaluating the impulse measure gives (5.17); moving an impulse to another period leaves this coefficient unchanged, by equivariance and a change of variable. To prove one-sided smoothness explicitly, let
  $ Q \( s \) = integral_0^s U_0 \( w \) thin d w = \| s \| - 2 integral_0^s integral_0^w rho_0 \( a \) thin d a thin d w . $
  Then $\( B_0 \)_i$ is a locally finite sum of terms
  #[#set math.equation(numbering: n => "(5.20)")
   $ - 1 / 2 K_0 \( J_i \, delta_(g^a h_q) \) #scale(x: 120%, y: 120%)[\(] Q \( t_(q + 1) + a - t_i \) - Q \( t_q + a - t_i \) #scale(x: 120%, y: 120%)[\)] \, quad 0 lt.eq q lt.eq k . $ <co:raw-primitive>]
  Although $Q$ is constant rather than zero outside the lag support, each displayed endpoint difference vanishes when its interval misses that support. Since all boundaries lie in one period and $2 delta_1 < 1$, only the shifts $a = - 1 \, 0 \, 1$ can contribute, with the same finite choice valid in a sufficiently small neighborhood of any point of the closed domain. On the entire closed ordered domain, each affine expression $t_q + a - t_i$ has a fixed weak sign: the order of the boundaries and all their period translates is prescribed. The same is true for $t_(q + 1) + a - t_i$. Thus every absolute value in (5.20) equals a fixed signed affine function on that domain. The remaining part of $Q$ is smooth on the whole line. Consequently the coefficient has a smooth extension from the prescribed side at each face, including intersections of faces. Compact support of $U_0$ allows the finite set of summands to be fixed in a neighborhood.
  It remains to identify the restrictions. On the face $t_i = t_(i + 1)$, where $0 lt.eq i < k$, the interval labelled $h_i$ disappears and the adjoining impulses combine tangentially as
  $ J_i thin d t_i + J_(i + 1) thin d t_(i + 1) = #scale(x: 120%, y: 120%)[\(] delta_(h_(i - 1)) - delta_(h_(i + 1)) #scale(x: 120%, y: 120%)[\)] d t_i . $
  This is precisely the impulse for the shortened tuple. On the closing face $t_k = t_0 + 1$, combine the impulses at that common lift:
  $ J_k + g J_0 = delta_(h_(k - 1)) - delta_(g h_0) . $
  Their time differentials agree tangentially, and the displayed sum is the closing impulse after deleting $h_k$. These identities also handle corners by successive merging. In the smoothed stages, the underlying step function itself is unchanged by deleting a zero-length interval; (5.18) then gives equality of the fields and their tangential differentials. Hence every $B_j$ respects the faces.
  Finally, translating all times by $s$ replaces $Y_j \( u \)$ by $Y_j \( u - s \)$. Changing both integration variables by $s$ and using cut independence proves translation invariance. The centralizer action preserves the twist and all pairings. Twisted rotation describes the very same step function with a different first boundary, so it too preserves the forms. These arguments also establish cut independence of the raw form on the faces, by continuity. ◻
]

=== 5.3 Contraction and the positive normalizer <contraction-and-the-positive-normalizer>

The forms are now compatible on all tuple simplices. To normalize them to a connection, we must show that their sum has positive contraction with the translation vector $V$. The choice of the lag derivative in (5.13) converts this contraction into a difference between a pairing at one time and its average at the next scale.

#thm([Lemma 5.2.])[
  #emph[For every stage $0 lt.eq j lt.eq b_(*)$, 
#[#set math.equation(numbering: n => "(5.21)")
 $ C_j := B_j \( V \) = integral_(upright("per")) (K_j \( Y_j \( u \) \, Y_j \( u \) \) - integral_(bb(R)) K_j \( Y_j \( u \) \, Y_j \( u + s \) \) thin d rho_j \( s \)) d u . $ <co:contraction>]

 For $j < b_(*)$, the second integrated pairing is also 
#[#set math.equation(numbering: n => "(5.22)")
 $ integral_(upright("per")) K_j #scale(x: 120%, y: 120%)[\(] \( mu_(j + 1) * Y_j \) \( u \) \, \( mu_(j + 1) * Y_j \) \( u \) #scale(x: 120%, y: 120%)[\)] thin d u . $ <co:averaged-pairing>]

]
] <co:contraction-lemma>

#proof[
  Translation of the times translates the field in the opposite direction, so $d Y_j \( V \) = - partial_u Y_j$. Define the scalar function
  $ H_j \( u \) = integral_(bb(R)) U_j \( v - u \) K_j \( Y_j \( u \) \, Y_j \( v \) \) thin d v . $
  As in the proof of Lemma 14, it is periodic. For a smooth stage its distributional derivative is
  $ H'_j \( u \) = - integral U'_j \( v - u \) K_j \( Y_j \( u \) \, Y_j \( v \) \) thin d v + integral U_j \( v - u \) K_j \( partial_u Y_j \( u \) \, Y_j \( v \) \) thin d v . $
  Its derivative integrates to zero over a period. Substitution into (5.15), followed by (5.13), gives (5.21), with the factor $1 \/ 2$ cancelling the factor two in $U'_j$.
  The same computation is valid for $Y_0$ with its jumps. Indeed, for each label $y$, the function
  $ u mapsto integral U_0 \( v - u \) K_0 \( delta_y \, P_0 \( v \) \) thin d v $
  is continuous and has bounded weak derivative obtained by replacing $U_0$ by $- U'_0$. Integration by parts against the jump measure is therefore valid. A cut away from the jumps makes the boundary cancellation ordinary periodicity; the result extends to the faces by Lemma 14.
  For (5.22), expand both convolutions. If their lags are $a \, b$, simultaneous translation in the period integral changes $K_j \( Y_j \( u - a \) \, Y_j \( u - b \) \)$ into $K_j \( Y_j \( u \) \, Y_j \( u + a - b \) \)$. This is legitimate because the scalar pairing is invariant under simultaneous integer shifts of its two time arguments. The distribution of $a - b$ is $mu_(j + 1) * mu_(j + 1) = rho_j$, since $mu_(j + 1)$ is even. This gives the asserted identity. ◻
]

Write

$ Phi_j = integral_(upright("per")) phi.alt_(r_j) \( P_j \( u \) \) thin d u #h(2em) \( 1 lt.eq j lt.eq b_(*) \) . $

These are the concentration quantities that will telescope.

#thm([Lemma 5.3.])[
  #emph[Under (5.11), the scalar function 
#[#set math.equation(numbering: n => "(5.23)")
 $ C_(upright("nor")) := B \( V \) = sum_(j = 0)^(b_(*) - 1) C_j + W C_(b_(*)) $ <co:normalizer>]

 satisfies $C_(upright("nor")) gt.eq c_0$, where $c_0 = 1 \/ 10$ is independent of all tuples, $n$, $R$, and $g$.]
] <co:positivity>

#proof[
  Consider first $1 lt.eq j < b_(*)$. The concentration-loss calculation (4.7) takes the following form for our time averages. In this paragraph abbreviate $A_j \( P_j \( u \) \)$ to $A \( u \)$ and the prediction $"pred"_j \( P_j \( u \) \, y \)$ to $p \( u \, y \)$. Put $overline(A) = mu_(j + 1) * A$ and $overline(p) \( dot.op \, y \) = mu_(j + 1) * p \( dot.op \, y \)$. Equations (5.7) and (5.22) give
  $ C_j = integral_(upright("per")) sum_y A \( u \)_y p \( u \, y \) thin d u - integral_(upright("per")) sum_y overline(A) \( u \)_y overline(p) \( u \, y \) thin d u . $
  The total mass of $A \( u \)$ is a periodic scalar function. Averaging preserves its integral, so we may subtract $a_(*)$ from both predictions:
  #[#set math.equation(numbering: n => "(5.24)")
   $ C_j = integral_(upright("per")) sum_y A \( u \)_y \( p \( u \, y \) - a_(*) \) thin d u - integral_(upright("per")) sum_y overline(A) \( u \)_y \( overline(p) \( u \, y \) - a_(*) \) thin d u . $ <co:subtract-threshold>]
  This cancellation uses the integrated mass; it does not require either channel to have mass one at each time.
  The first and third inequalities of Proposition 8 imply
  $ sum_y A \( u \)_y \( p \( u \, y \) - a_(*) \) gt.eq phi.alt_(r_j) \( P_j \( u \) \) - 20 epsilon.alt_j . $
  For the other term, the prediction upper bound, linearity of $E_(r_(j + 1))$ in its probability argument, and $P_(j + 1) = mu_(j + 1) * P_j$ imply
  $ overline(p) \( u \, y \) - a_(*) lt.eq E_(r_(j + 1)) \( P_(j + 1) \( u \) \, y \) - a_(*) + 10 epsilon.alt_j . $
  Here the radius is $r_(j + 1) = 6 r_j$ for the early version and $r_(j + 1) = r_j$ for the later version, exactly as required by the two channel bounds. Since $overline(A) \( u \)$ is a subprobability distribution, pairing this inequality with it yields an upper bound $phi.alt_(r_(j + 1)) \( P_(j + 1) \( u \) \) + 10 epsilon.alt_j$. Consequently
  #[#set math.equation(numbering: n => "(5.25)")
   $ C_j gt.eq Phi_j - Phi_(j + 1) - 30 epsilon.alt_j #h(2em) \( 1 lt.eq j < b_(*) \) . $ <co:telescope>]
  The raw stage supplies the initial positive quantity. Its same-time pairing is one, while (5.22) gives $K_0 \( P_1 \( u \) \, P_1 \( u \) \)$ for the averaged pairing. For every probability distribution $P$,
  $ K_0 \( P \, P \) = sum_y P_y E_R \( P \, y \) lt.eq q_R \( P \) lt.eq a_(*) + phi.alt_R \( P \) . $
  Therefore
  #[#set math.equation(numbering: n => "(5.26)")
   $ C_0 gt.eq 1 - a_(*) - Phi_1 = 1 / 5 - Phi_1 . $ <co:initial-contraction>]
  At the final stage the negative term in (5.21) vanishes. This is immediate from $rho_(b_(*)) = 0$ in case (i). In case (ii), let $S = "supp" D \( P_(b_(*)) \( u \) \)$. Lemma 11 gives $"diam" S lt.eq 4 r$. If $z = g w$ with $z \, w in S$, then $d \( w \, g w \) lt.eq 4 r$, contrary to (5.11). Thus $S ∩ g S = S ∩ g^(- 1) S = diameter$, and twist equivariance makes both lag pairings at $s = plus.minus 1$ zero. In either case,
  $ C_(b_(*)) = integral_(upright("per")) sum_z D \( P_(b_(*)) \( u \) \)_z^2 thin d u \, #h(2em) W C_(b_(*)) gt.eq Phi_(b_(*)) $
  by (5.10). Adding this inequality to (5.25) and (5.26) leaves
  $ C_(upright("nor")) gt.eq 1 / 5 - 30 sum_(j = 1)^(b_(*) - 1) epsilon.alt_j gt.eq 1 / 10 \, $
  as claimed. ◻
]

=== 5.4 Differential bounds and the resulting connection <differential-bounds-and-the-resulting-connection>

Positivity now allows the normalization. Before applying the trace identity, we also need growth bounds that justify summation over all tuples. More precise bounds on the individual channel differentials will provide the input for the curvature estimates of the next section.

We now specialize the parameters of the preceding construction. At the shortest time scales we use the early channels, whose derivative bound is independent of the spatial radius. The later channels keep that radius fixed; this also fixes the terminal multiplier $W$ while the time scales continue to increase. Their longer time scales will absorb the polynomial factor $r^10$ in the later derivative bound.

Choose once and for all an integer $J_(*)$ with $\( 3 \/ 2 \)^(J_(*) - 1) > 200$. For sufficiently large $R$ retain the spatial radii, accuracies, and multiplier from (5.4), (5.5), and (5.9), and set

#[#set math.equation(numbering: n => "(5.27)")
 $ beta_1 = R \, #h(2em) beta_(j + 1) = beta_j^(3 \/ 2) . $ <co:ladder>]

Choose $b_(*)$ to be the smallest integer such that

#[#set math.equation(numbering: n => "(5.28)")
 $ b_(*) gt.eq J_(*) \, #h(2em) beta_(b_(*)) gt.eq W^2 R^100 . $ <co:last-scale>]

For each even integer $n > 10 beta_(b_(*))$, use

#[#set math.equation(numbering: n => "(5.29)")
 $ delta_j = beta_j \/ n #h(2em) \( 1 lt.eq j lt.eq b_(*) \) . $ <co:time-scales>]

The ratio $beta_(j + 1) \/ beta_j$ is at least two when $R$ is sufficiently large, so these scales satisfy (5.1). Thus the construction and positivity proved above apply. For each such $n$, the same actual scales $beta_j \/ n$ are used in every dimension $k lt.eq n$; face restriction never changes the denominator to $k$.

The stage count, spatial radii, accuracies, multiplier, and numbers $beta_j$ now depend only on $R$ and the fixed choices. Since $log beta_j = \( 3 \/ 2 \)^(j - 1) log R$ and $log \( W^2 R^100 \) = 2 C_(*) r + 100 log R$, with $r$ a fixed multiple of $R$,

#[#set math.equation(numbering: n => "(5.30)")
 $ b_(*) = O \( 1 + log R \) . $ <co:stage-count>]

The particular exponents in (5.27) and (5.28) will enter the curvature bounds. They leave room for the polynomial losses in the channel derivatives.

Choose a sufficiently large fixed constant $C$ and set

#[#set math.equation(numbering: n => "(5.31)")
 $ a_j = C epsilon.alt_j^(- 10) cases(delim: "{", 1 \, & 1 lt.eq j < J_(*) \,, r^10 \, & J_(*) lt.eq j lt.eq b_(*) .) $ <co:derivative-constants>]

As before, $l_i = 1 + d \( h_(i - 1) \, h_i \)$, with periodic indexing, and $partial_i = partial \/ partial t_i$.

#thm([Proposition 5.4.])[
  #emph[Let $R$ be sufficiently large, choose the parameters in (5.27) and (5.28), and let $n > 10 beta_(b_(*))$ be even, with time scales (5.29). Suppose that $g$ satisfies (5.11). The forms $B_j$ and $B$ in (5.15), constructed in all dimensions $0 lt.eq k lt.eq n$ with the same parameters, have the following properties. For every smooth stage $1 lt.eq j lt.eq b_(*)$ and every coordinate $t_i$, 
#[#set math.equation(numbering: n => "(5.32)")
 $ (integral_(upright("per")) sum_omega frac(\| partial_i Y_j \( u \)_omega \|^2, Y_j \( u \)_omega) thin d u)^(1 \/ 2) lt.eq frac(a_j l_i, sqrt(delta_j)) . $ <co:fisher>]

 Terms with zero denominator are defined to be zero. Moreover, 
#[#set math.equation(numbering: n => "(5.33)")
 $ \| B \( partial_i \) \| + \| partial_i C_(upright("nor")) \| lt.eq C_R l_i . $ <co:coefficients>]

 The scalar $C_(upright("nor"))$ is at least $c_0 = 1 \/ 10$, and 
#[#set math.equation(numbering: n => "(5.34)")
 $ alpha = B / C_(upright("nor")) $ <co:normalized>]

 is a compatible connection family in the sense of Definition 5. Its coefficients and those of its exterior derivative are bounded by polynomials in the lengths, uniformly over the tuples. In particular, the family may be used in Proposition 6.]
] <co:connection>

#proof[
  Differentiating (5.18) at a boundary gives the smeared impulse formula
  #[#set math.equation(numbering: n => "(5.35)")
   $ partial_i P_j \( u \) = sum_(a in bb(Z)) eta_j \( u - t_i - a \) g^a J_i . $ <co:smeared-impulse>]
  For each $u$, at most one summand can be nonzero, because $4 delta_j < 1$. The derivative is supported within $2 delta_j$ of $t_i$ modulo periods. The distance between the two labels in $g^a J_i$ is $d \( h_(i - 1) \, h_i \)$, independently of $a$. The derivative estimate of Proposition 8, or Lemma 11 at the last stage, therefore bounds the square root of the pointwise sum in (5.32) by $C epsilon.alt_j^(- 10) l_i eta_j \( u - t_i - a \)$ for $j < J_(*)$, with an additional factor $r^10$ for $j gt.eq J_(*)$, where $a$ is the contributing integer. Since
  $ integral_(upright("per")) sum_a eta_j \( u - t_i - a \)^2 thin d u = integral_(bb(R)) eta_j \( s \)^2 thin d s lt.eq parallel eta_j parallel_oo lt.eq C \/ delta_j \, $
  we obtain (5.32) after fixing the constant in (5.31). The two disjoint channels only alter this constant. At a zero channel weight the first derivative is zero, as stated in Proposition 8, so the convention in (5.32) is consistent.
  The support information is useful as well as the square-integral bound. The support of $partial_i Y_j$ has measure at most $4 delta_j$ in a period, and the field has mass at most two. Cauchy–Schwarz in time and labels consequently gives
  #[#set math.equation(numbering: n => "(5.36)")
   $ integral_(upright("per")) sum_omega \| partial_i Y_j \( u \)_omega \| thin d u lt.eq C a_j l_i . $ <co:integrated-derivative>]
  For example, the square of the factor paired with (5.32) is at most $integral_("supp" partial_i Y_j) sum_omega Y_j \( u \)_omega thin d u lt.eq 8 delta_j$. This explains why the integrated derivative loses no power of the time scale.
  We now bound the coefficients of $B$. For a compact lag kernel, the inner integral in (5.15) has length at most two, its kernel is bounded, and the field has bounded mass at every time. Thus (5.36) gives $\| B_j \( partial_i \) \| lt.eq C a_j l_i$. At the full-sign stage there is no bound on the length of the integration interval, but equality of labels gives a stronger estimate. For each fixed group label $y$,
  #[#set math.equation(numbering: n => "(5.37)")
   $ integral_(bb(R)) Y_(b_(*)) \( v \)_y thin d v = integral_0^1 sum_(a in bb(Z)) Y_(b_(*)) \( v \)_(g^(- a) y) thin d v lt.eq 1 . $ <co:orbit-mass>]
  The labels $g^(- a) y$ are distinct because $g$ has infinite order, and the total mass at every time is at most one. Combining (5.37) with (5.36) proves the same coefficient bound. In particular, the estimate does not depend on how far apart the finitely many matching periods are.
  Differentiating (5.21) gives $\| partial_i C_j \| lt.eq C a_j l_i$ for $j > 0$. Indeed, each differentiation puts a derivative on one of the two factors. The other factor has bounded total mass, the measure $rho_j$ has mass at most one, and (5.36) is unchanged by a time shift. The last observation follows because the sum of absolute derivatives is a periodic scalar function.
  For the raw stage, (5.17) bounds $\| \( B_0 \)_i \| lt.eq C$, since $parallel J_i parallel_1 lt.eq 2$ and the lag support has length at most $4 delta_1 < 1$. Its contraction satisfies the exact identity
  $ C_0 = 1 - integral_(upright("per")) K_0 \( P_1 \( u \) \, P_1 \( u \) \) thin d u . $
  Formula (5.35) for $P_1$, before passing through any channel map, gives $integral_(upright("per")) parallel partial_i P_1 \( u \) parallel_1 thin d u lt.eq 2$. Hence $\| partial_i C_0 \| lt.eq 4$. Summing these estimates with the coefficients $1 \, dots.h \, 1 \, W$ proves (5.33), because
  $ 1 + sum_(j = 1)^(b_(*) - 1) a_j + W a_(b_(*)) $
  depends only on $R$ and the fixed choices.
  For completeness, polynomial control of exterior derivatives can be obtained here without using the finer estimates of the next section. For a smooth stage, differentiation at a fixed period cut gives
  #[#set math.equation(numbering: n => "(5.38)")
   $ d B_j = 1 / 2 integral_(upright("per")) d u integral_(bb(R)) d v thin U_j \( v - u \) K_j \( d Y_j \( u \) and d Y_j \( v \) \) . $ <co:exterior-pairing>]
  There is no term from the cut by (5.19). For a compact lag kernel, reduction of both time variables to one period introduces at most three relevant period shifts. Boundedness of the kernel and (5.36) therefore imply
  $ \| d B_j \( partial_i \, partial_(i') \) \| lt.eq C a_j^2 l_i l_(i') . $
  For the full-sign equality kernel, at most one shift contributes for each pair of labels, and the same estimate follows. In the raw stage, differentiate (5.17) with respect to a distinct boundary. The resulting terms have factors $U_0 \( t_(i') + a - t_i \) K_0 \( J_i \, g^a J_(i') \)$; boundedness of $U_0 \, K_0$ and the jump masses gives a uniform bound. Differentiation of a coefficient in its own time variable contributes no exterior two-form. These calculations hold in the interior and extend to the closed simplex by Lemma 14. Summation over stages gives
  #[#set math.equation(numbering: n => "(5.39)")
   $ \| d B \( partial_i \, partial_(i') \) \| lt.eq C_R l_i l_(i') . $ <co:coarse-curvature>]
  Finally Lemma 16 permits division by $C_(upright("nor"))$. The scalar normalizer inherits all symmetries and face restrictions of $B$, so (5.34) does also, and $alpha \( V \) = 1$. Equations (5.33), (5.39), and
  $ d alpha = C_(upright("nor"))^(- 1) d B - C_(upright("nor"))^(- 2) d C_(upright("nor")) and B $
  give the required polynomial coefficient bounds. The resulting family is therefore a compatible connection family. Its curvature is basic, as also follows directly from translation invariance and $alpha \( V \) = 1$. ◻
]

The construction separates two estimates that the trace argument will use differently. The bounds in Proposition 17 justify the weighted simplex identities, while the scale-dependent bound (5.32) retains the information needed to make high-dimensional curvature Pfaffians small. We turn to those sharper estimates next.

== 6 Curvature estimates and the Pfaffian bound <sec:curvature>

We estimate the curvature of the connection constructed in Proposition 17. The smooth stages are controlled by operators on weighted Hilbert spaces. The raw stage is instead controlled by the number of nearby simplex coordinates. These two estimates will be combined only after averaging over the coordinate subsets in the Pfaffian expansion.

Throughout this section, the word metric and the fixed construction constants are understood. The constant $C$ may depend on these data but not on $R \, n \, g$, or the tuple. A constant $C_R$ may additionally depend on $R$. All parameters $r \, W \, b_(*) \, beta_j \, delta_j$, and $a_j$ retain their definitions from Section 5. In particular, $delta_j = beta_j \/ n$ and $10 delta_(b_(*)) < 1$.

We work in the section $t_0 = 0$, on the simplex

$ Delta_n = { 0 lt.eq t_1 lt.eq dots.h.c lt.eq t_n lt.eq 1 } \, #h(2em) n = 2 m . $

Expectation with respect to uniform simplex probability will be denoted by $bb(E)_(Delta_n)$; its density in these coordinates is $n !$. If $Q$ is a two-form, its matrix is defined by $Q = sum_(i < i') Q_(i i') thin d t_i and d t_(i')$. Our convention is

#[#set math.equation(numbering: n => "(6.1)")
 $ frac(Q^m, m !) = "Pf" \( Q \) thin d t_1 and dots.h.c and d t_n . $ <pf:normalization>]

Equation (3.4) identifies the expectation below with the normalized integral in Proposition 6. For a subset $I subset { 1 \, dots.h \, n }$ of even cardinality, $"Pf"_I \( Q \)$ means the Pfaffian of the principal matrix on $I$, listed in increasing order. We set $"Pf"_diameter \( Q \) = 1$.

#thm([Theorem 6.1.])[
  (Averaged curvature bound).  #emph[Fix a sufficiently large $R$, and set $S = b_(*) + 2$. Let $n$ be an even integer with $n > 10 beta_(b_(*))$. Suppose either that $g$ has infinite order, or that $g$ has finite order and 
$ min_(h in G) d \( h \, g h \) > 4 r . $

 For every tuple $\( h_0 \, dots.h \, h_n \)$, the connection $alpha = B \/ C_(upright("nor"))$ of Proposition 17 satisfies 
#[#set math.equation(numbering: n => "(6.2)")
 $ bb(E)_(Delta_n) \| "Pf" \( d alpha \) \| lt.eq C_R #scale(x: 120%, y: 120%)[\(] C S^(3 \/ 2) R^(- 1 \/ 10) #scale(x: 120%, y: 120%)[\)]^n product_(i = 1)^n l_i \, #h(2em) l_i = 1 + d \( h_(i - 1) \, h_i \) . $ <pf:main-estimate>]

 The constants are independent of $n \, g$, and the tuple. Moreover, $S = O \( 1 + log R \)$ as $R arrow.r oo$.]
] <pf:bound>

We prove the theorem in three steps: estimates for principal Pfaffians of the smooth stages, an averaged estimate for the raw stage, and the expansion of the normalized curvature.

=== 6.1 Smooth stages as weighted operators <smooth-stages-as-weighted-operators>

Fix a stage $j > 0$ and a point of the simplex. Let $Lambda_j$ be its label set and equip $\( 0 \, 1 \) times Lambda_j$ with the measure

$ d theta.alt_j \( u \, y \) = Y_j \( u \)_y thin d u . $

We use the real Hilbert space $cal(H)_j = L^2 \( theta.alt_j \)$. Recall that the total mass of $Y_j \( u \)$ is at most two, and is at most one at the last stage. Define the operator $T_j$ by the kernel

#[#set math.equation(numbering: n => "(6.3)")
 $ T_j \( u \, y \; v \, z \) = sum_(a in bb(Z)) U_j \( v + a - u \) K_j \( y \, g^a z \) \, $ <pf:kernel>]

where the action of $g$ on labels is the one used in the channel construction. Oddness of $U_j$, symmetry of $K_j$, and simultaneous equivariance of $K_j$ show that this kernel is skew. Indeed, exchange $\( u \, y \)$ with $\( v \, z \)$ and replace $a$ by $- a$ in the sum.

For $1 lt.eq i lt.eq n$, put

$ X_i \( u \, y \) = frac(partial_i Y_j \( u \)_y, Y_j \( u \)_y) quad upright("when ") Y_j \( u \)_y > 0 \, $

and give $X_i$ the value zero at the remaining points. The derivatives of the zero weights vanish, and (5.32) gives

#[#set math.equation(numbering: n => "(6.4)")
 $ parallel X_i parallel_(cal(H)_j) lt.eq frac(a_j l_i, sqrt(delta_j)) . $ <pf:vector-norm>]

The exterior-derivative identity (5.38) is

$ d B_j = 1 / 2 integral_(upright("per")) d u integral_(bb(R)) d v thin U_j \( v - u \) K_j #scale(x: 120%, y: 120%)[\(] d Y_j \( u \) and d Y_j \( v \) #scale(x: 120%, y: 120%)[\)] . $

The integral over a period can be taken with fixed endpoints because its integrand is periodic. Reducing $v$ to $\( 0 \, 1 \)$ gives (6.3); the two antisymmetric terms then agree. Consequently,

#[#set math.equation(numbering: n => "(6.5)")
 $ \( d B_j \)_(i i') = chevron.l X_i \, T_j X_(i') chevron.r_(cal(H)_j) . $ <pf:curvature-pairing>]

Here is the finite-dimensional estimate we shall apply to this pairing. Let $I$ have even size $k > 0$, let $E$ be the span of the vectors $X_i$, $i in I$, and let $s_1 gt.eq s_2 gt.eq dots.h.c$ be the singular values of the compression $P_E T_j \|_E$, completed by zeros. Then

#[#set math.equation(numbering: n => "(6.6)")
 $ \| "Pf"_I \( d B_j \) \| lt.eq product_(i in I) parallel X_i parallel (product_(nu = 1)^k s_nu)^(1 \/ 2) . $ <pf:compression>]

To see this, the matrix in (6.5) has rank less than $k$ if $dim E < k$, so its Pfaffian is zero. Otherwise write the $X_i$ as columns of a square matrix $V$ in an orthonormal basis of $E$. The curvature matrix is $V^(sans(T)) T_E V$. Taking determinants and using $"Pf" \( A \)^2 = det A$ for a skew matrix gives the right side of (6.6), after Hadamard’s inequality $\| det V \| lt.eq product_i parallel X_i parallel$.

For $1 lt.eq j < b_(*)$, the support of $U_j$ is contained in $\[ - 2 delta_(j + 1) \, 2 delta_(j + 1) \]$. At most one integer $a$ in (6.3) contributes for a fixed pair $\( u \, v \)$, because $4 delta_(j + 1) < 1$. Thus the kernel is bounded by a fixed constant and vanishes unless the circular distance between $u$ and $v$ is at most $2 delta_(j + 1)$. The mass bound on the channels implies

$ parallel T_j parallel_(upright("HS"))^2 = integral #h(-0.16667em) integral \| T_j \( u \, y \; v \, z \) \|^2 thin d theta.alt_j \( u \, y \) d theta.alt_j \( v \, z \) lt.eq C delta_(j + 1) . $

Bessel’s inequality gives the same upper bound for the squared Hilbert–Schmidt norm of every compression. Applying the arithmetic mean inequality to $s_1^2 \, dots.h \, s_k^2$ gives

$ (product_(nu = 1)^k s_nu)^(1 \/ 2) lt.eq C^k delta_(j + 1)^(k \/ 4) k^(- k \/ 4) . $

Combining this with (6.4) and (6.6), and using $beta_(j + 1) = beta_j^(3 \/ 2)$, proves

#[#set math.equation(numbering: n => "(6.7)")
 $ \| "Pf"_I \( d B_j \) \| lt.eq #scale(x: 120%, y: 120%)[\(] C a_j beta_j^(- 1 \/ 8) #scale(x: 120%, y: 120%)[\)]^k \( n \/ k \)^(k \/ 4) product_(i in I) l_i \, #h(2em) 1 lt.eq j < b_(*) . $ <pf:intermediate>]

In fact, the powers of the time scales simplify as

$ delta_j^(- k \/ 2) delta_(j + 1)^(k \/ 4) k^(- k \/ 4) = beta_j^(- k \/ 8) \( n \/ k \)^(k \/ 4) . $

=== 6.2 The terminal sign kernel <the-terminal-sign-kernel>

The last lag kernel is not supported at a small time scale. Its useful property is instead that an order comparison is constant between two disjoint ordered intervals. The following elementary approximation works even when the source and target measures differ.

#thm([Lemma 6.2.])[
  (Approximation of order kernels).  #emph[Let $mu \, nu$ be finite nonatomic positive measures on $bb(R)$, and set $M = mu \( bb(R) \) + nu \( bb(R) \)$. Let $A : L^2 \( nu \) arrow.r L^2 \( mu \)$ have any one of the kernels 
$ "sign" \( s - t \) \, #h(2em) upright(bold(1))_(s < t) \, #h(2em) upright(bold(1))_(s > t) \, $

 where $t$ is the output variable and $s$ the input variable. For each integer $N gt.eq 1$, there is an operator $A_N$ of rank at most $N$ such that 
$ parallel A - A_N parallel lt.eq frac(M, 2 N) . $

 Also $parallel A parallel lt.eq sqrt(mu \( bb(R) \) nu \( bb(R) \)) lt.eq M \/ 2$.]
] <pf:order-kernel>

#proof[
  If $M = 0$, the assertion is immediate. Otherwise partition $bb(R)$ into $N$ successive intervals $I_1 \, dots.h \, I_N$, each having $\( mu + nu \)$-measure $M \/ N$. Such a partition exists because the measure is nonatomic. Endpoint conventions do not affect the operators. Let $A_N$ retain the kernel of $A$ when $t$ and $s$ lie in different intervals, and set the kernel to zero when they lie in the same interval. On $I_a times I_b$ with $a eq.not b$, the order of $t$ and $s$ is fixed. The range of $A_N$ is therefore contained in the span of the $N$ functions $upright(bold(1))_(I_a)$ in $L^2 \( mu \)$.
  The remainder $A - A_N$ maps $L^2 \( nu \|_(I_a) \)$ to $L^2 \( mu \|_(I_a) \)$ for each $a$, without mixing different intervals. On that block its kernel is bounded by one, so Cauchy–Schwarz gives the operator norm bound
  $ sqrt(mu \( I_a \) nu \( I_a \)) lt.eq frac(mu \( I_a \) + nu \( I_a \), 2) = frac(M, 2 N) . $
  Both the source blocks and the target blocks are orthogonal. Hence the norm of their direct sum is the maximum of their norms, proving the approximation claim. Applying the same Cauchy–Schwarz estimate on the whole line gives the asserted bound on $parallel A parallel$. ◻
]

#thm([Lemma 6.3.])[
  (Singular values at the last stage).  #emph[For the operator $T_(b_(*))$, every finite-dimensional orthogonal compression has singular values satisfying 
#[#set math.equation(numbering: n => "(6.8)")
 $ s_nu lt.eq C / nu \, #h(2em) nu gt.eq 1 . $ <pf:singular-decay>]

 The constant is independent of $n \, R \, g$, and the tuple, in either of the two cases of Theorem 18.]
] <pf:terminal-singular>

#proof[
  We will approximate $T_(b_(*))$, for every $x > 0$, by an operator of rank at most $C \/ x$ and norm error at most $x$.
  First suppose that $g$ has infinite order. The final label set is $G$ and the label kernel is equality. It follows that $cal(H)_(b_(*))$ splits orthogonally according to the left $g$-orbits in $G$. In one orbit, choose a representative $y_0$ and write a label as $g^a y_0$, $a in bb(Z)$. Associate to the pair $\( u \, g^a y_0 \)$ the real coordinate $u - a$. If the second label is $g^b y_0$, the equality kernel in (6.3) selects precisely the shift $a - b$. The resulting kernel is
  $ "sign" \( v + a - b - u \) = "sign" #scale(x: 120%, y: 120%)[\(] \( v - b \) - \( u - a \) #scale(x: 120%, y: 120%)[\)] . $
  Thus this orbit gives a sign operator on a nonatomic measure on the line. Let $b$ be the mass of that measure. The orbit masses sum to at most one, because the final channel is a subprobability channel. Lemma 19, with the same measure in source and target, gives norm at most $b$ and a rank-$N$ approximation with error at most $b \/ N$.
  Discard each orbit block with $b lt.eq x$. On every other block choose $N = ceil.l b \/ x ceil.r$. The error of the resulting direct-sum approximation is at most $x$. Moreover,
  $ sum_(b > x) ceil.l b \/ x ceil.r lt.eq 1 / x sum_(b > x) b + \# { b > x } lt.eq 2 / x . $
  This proves the desired rank bound in the infinite-order case.
  Now suppose that $g$ has finite order. Put $d mu_y \( u \) = Y_(b_(*)) \( u \)_y thin d u$ on $\( 0 \, 1 \)$, extend this measure by zero to $bb(R)$, and write $cal(H)_y = L^2 \( mu_y \)$. Since the final lag kernel is $"sign" \( s \) upright(bold(1))_(\| s \| < 1)$, the only possible shifts for $0 < u \, v < 1$ are $0 \, 1 \, - 1$. The operator is the sum of the three kernels
  #[#set math.equation(numbering: n => "(6.9)")
   $ & "sign" \( v - u \) upright(bold(1))_(y = z) \,\
 & upright(bold(1))_(v < u) upright(bold(1))_(y = g z) \,\
 & - upright(bold(1))_(v > u) upright(bold(1))_(y = g^(- 1) z) . $ <pf:three-shifts>]
  The shifted contributions are direct sums of maps $cal(H)_z arrow.r cal(H)_(g z)$ and $cal(H)_z arrow.r cal(H)_(g^(- 1) z)$, respectively. After reindexing the target summands, each is an orthogonal direct sum: its source blocks are mutually orthogonal and its target blocks are mutually orthogonal. The identity contribution has the same property. This remains true even though the measures in a paired block need not coincide; the shifted summands need not be invariant subspaces.
  For a paired block, let $b = mu_y \( bb(R) \) + mu_z \( bb(R) \)$. By Lemma 19, its norm is at most $b$, and it has a rank-$N$ approximation with error at most $b \/ N$. The sums of these $b$’s over a single contribution are at most two: every label mass appears once as a source mass and once as a target mass. Discarding blocks of mass at most $epsilon$ and taking $N = ceil.l b \/ epsilon ceil.r$ on the others therefore gives error at most $epsilon$ and total rank at most $4 \/ epsilon$. Use $epsilon = x \/ 3$ for each contribution in (6.9) and add the three approximations. Their total error is at most $x$ and their total rank is at most $C \/ x$. If $g$ has order two, the two shift permutations coincide; the separate estimates still apply and are added in exactly the same way.
  Finally, orthogonal compression cannot increase either the rank or the error of an approximation. Singular values beyond the dimension of the compressed space are zero, so consider an index $nu$ no larger than that dimension. If the compressed matrix has an approximation of rank less than $nu$ with error $x$, its $nu$th singular value is at most $x$. Indeed, the span of its first $nu$ right singular vectors contains a unit vector annihilated by the approximating matrix, and the original matrix has norm at least $s_nu$ on that vector. If the rank bound above is $C_0 \/ x$, take $x = 2 C_0 \/ nu$. The approximating rank is then at most $nu \/ 2 < nu$, which proves (6.8). ◻
]

For an even principal set $I$ of size $k > 0$, insert (6.8) in (6.6). Multiplication of the two-form by $W$ multiplies its size-$k$ Pfaffian by $W^(k \/ 2)$. We obtain

$ \| "Pf"_I \( W d B_(b_(*)) \) \| lt.eq W^(k \/ 2) (a_(b_(*)) / sqrt(delta_(b_(*))))^k C^(k \/ 2) / sqrt(k !) product_(i in I) l_i . $

For $k gt.eq 1$, integration of $log x$ gives $log \( k ! \) gt.eq integral_1^k log x thin d x gt.eq k log k - k$, and hence $k ! gt.eq \( k \/ e \)^k$. We conclude that

#[#set math.equation(numbering: n => "(6.10)")
 $ \| "Pf"_I \( W d B_(b_(*)) \) \| lt.eq #scale(x: 120%, y: 120%)[\(] C a_(b_(*)) sqrt(W) thin beta_(b_(*))^(- 1 \/ 2) #scale(x: 120%, y: 120%)[\)]^k \( n \/ k \)^(k \/ 2) product_(i in I) l_i . $ <pf:terminal>]

The estimates (6.7) and (6.10) control every smooth stage at every point of the simplex. It remains to control the raw stage in the average required for the full Pfaffian.

=== 6.3 The raw stage and nearby coordinates <the-raw-stage-and-nearby-coordinates>

Recall $J_i = delta_(h_(i - 1)) - delta_(h_i)$. The coefficient of $d t_i$ in $B_0$ is

$ - 1 / 2 integral_(bb(R)) U_0 \( v - t_i \) K_0 \( J_i \, Y_0 \( v \) \) thin d v . $

For distinct $i \, i'$ in the interior of the simplex, differentiating at the boundary $t_(i')$ and antisymmetrizing gives

$ \( d B_0 \)_(i i') = sum_(a in bb(Z)) U_0 \( t_(i') + a - t_i \) K_0 \( J_i \, g^a J_(i') \) . $

There is at most one nonzero summand. Since $K_0 \( h \, h' \) = chi_R \( d \( h \, h' \) \)$ and $chi_R$ is $1 \/ R$-Lipschitz,

$ \| K_0 \( J_i \, g^a J_(i') \) \| lt.eq frac(2 d \( h_(i - 1) \, h_i \), R) lt.eq frac(2 l_i l_(i'), R) . $

The support of $U_0$ also shows that this matrix entry is zero if the circular distance between $t_i$ and $t_(i')$ exceeds $2 R \/ n$.

For $I subset { 1 \, dots.h \, n }$ and $i in I$, let $N_i \( I \)$ be the number of indices in $I$, including $i$ itself, whose times have circular distance at most $2 R \/ n$ from $t_i$. If $k = \| I \|$ is even, divide row and column $i$ of the principal curvature matrix by $l_i$. Each resulting row has Euclidean norm at most $\( C \/ R \) sqrt(N_i \( I \))$. Hadamard’s inequality, followed by the Pfaffian–determinant identity, yields

#[#set math.equation(numbering: n => "(6.11)")
 $ \| "Pf"_I \( d B_0 \) \| lt.eq \( C \/ R \)^(k \/ 2) product_(i in I) l_i product_(i in I) N_i \( I \)^(1 \/ 4) . $ <pf:raw>]

We next average the last product. The needed assertion is an average over subsets of a fixed size; it is not a bound asserted separately for each fixed subset of the ordered coordinates.

#thm([Lemma 6.4.])[
  (Average of the neighbor counts).  #emph[Let $R gt.eq 1$, $n gt.eq 8 R$, and $0 lt.eq k lt.eq n$. Choose $\( t_1 \, dots.h \, t_n \)$ with uniform probability on $Delta_n$, and independently choose $I$ uniformly among the $k$-element subsets of ${ 1 \, dots.h \, n }$. Then 
#[#set math.equation(numbering: n => "(6.12)")
 $ bb(E)_(Delta_n \, I) product_(i in I) N_i \( I \)^(1 \/ 4) lt.eq C^k R^(k \/ 4) \, $ <pf:count-average>]

 with the empty product interpreted as one.]
] <pf:occupancy>

#proof[
  The statement is immediate for $k = 0$. Uniform simplex coordinates are the order statistics of $n$ independent uniform points in $\( 0 \, 1 \)$. Selecting a uniform set of $k$ ranks is equivalent, as an unordered set of points, to selecting a uniform set of $k$ of those independent points. The selected unordered set therefore has the law of $k$ independent uniform points on the circle. Notice that the fixed endpoint $t_0 = 0$ is not one of the selectable coordinates.
  Partition the circle into $m' = floor.l n \/ \( 2 R \) floor.r$ equal cells. Their length is at least $2 R \/ n$, and $m' gt.eq n \/ \( 4 R \)$. Let $p_a$ be the number of selected points in cell $a$, with cell indices read cyclically. A point in cell $a$ can have counted neighbors only in that cell or its two adjacent cells. Consequently
  $ product_(i in I) N_i \( I \)^(1 \/ 4) lt.eq product_(a : p_a > 0) \( p_a + p_(a - 1) + p_(a + 1) \)^(p_a \/ 4) . $
  The comparison with the product of the occupancies themselves follows from
  $ sum_(a : p_a > 0) p_a log frac(p_a + p_(a - 1) + p_(a + 1), p_a) & lt.eq sum_(a : p_a > 0) \( p_(a - 1) + p_(a + 1) \)\
 & lt.eq 2 k . $
  Thus the preceding product is at most $e^(k \/ 2) product_a p_a^(p_a \/ 4)$, with $0^0 = 1$.
  The occupancy vector has multinomial probabilities $k ! \( m' \)^(- k) product_a \( p_a ! \)^(- 1)$. The factorial lower bound implies $p^(p \/ 4) lt.eq e^(p \/ 4) \( p ! \)^(1 \/ 4)$, so
  $ bb(E) product_a p_a^(p_a \/ 4) lt.eq e^(k \/ 4) frac(k !, \( m' \)^k) sum_(sum p_a = k) (product_a frac(1, p_a !))^(3 \/ 4) . $
  There are $binom(k + m' - 1, k)$ nonnegative occupancy vectors. Applying Hölder’s inequality to the last sum, and then the multinomial theorem, gives
  $ sum_(sum p_a = k) (product_a frac(1, p_a !))^(3 \/ 4) lt.eq (frac(\( m' \)^k, k !))^(3 \/ 4) binom(k + m' - 1, k)^(1 \/ 4) . $
  After substitution, the remaining factor apart from $C^k$ is
  $ [frac(k !, \( m' \)^k) binom(k + m' - 1, k)]^(1 \/ 4) = [product_(q = 0)^(k - 1) \( 1 + q \/ m' \)]^(1 \/ 4) lt.eq \( 1 + k \/ m' \)^(k \/ 4) . $
  Finally, $k lt.eq n$ and $m' gt.eq n \/ \( 4 R \)$ give $k \/ m' lt.eq 4 R$. Since $R gt.eq 1$, all factors are bounded as in (6.12). ◻
]

Combining (6.11) with Lemma 21 gives a factor of size $\( C R^(- 1 \/ 4) \)^k$, once the length factors have been extracted and the coordinate subset has been averaged. The remaining task is to combine this subset average with the pointwise estimates for the smooth stages. We first make their scale dependence uniform.

=== 6.4 Expansion of the normalized curvature <expansion-of-the-normalized-curvature>

First record the dependence of the preceding estimates on $R$. Since $r$ is a fixed multiple of $R$, the stopping condition compares

$ log beta_j = \( 3 \/ 2 \)^(j - 1) log R \, #h(2em) log \( W^2 R^100 \) = O \( R + log R \) . $

Taking $j$ of order $1 + log R$ makes the first expression at least the second. As in (5.30), minimality therefore gives

#[#set math.equation(numbering: n => "(6.13)")
 $ b_(*) = O \( 1 + log R \) . $ <pf:stage-count>]

For $j < J_(*)$, the constants $a_j$ are bounded independently of $R$, because this is a fixed finite set of stages. Their bases in (6.7) are at most $C R^(- 1 \/ 8)$. At the later stages,

$ a_j lt.eq C R^10 \( 1 + b_(*) \)^20 \, #h(2em) beta_j gt.eq R^200 \, $

so the intermediate bases are at most $C R^(- 15) \( 1 + log R \)^20$. At the last stage, the stopping condition $beta_(b_(*)) gt.eq W^2 R^100$ gives

$ C a_(b_(*)) sqrt(W) thin beta_(b_(*))^(- 1 \/ 2) lt.eq C R^(- 40) \( 1 + log R \)^20 W^(- 1 \/ 2) . $

Together with the raw factor just obtained, all these bases are at most

#[#set math.equation(numbering: n => "(6.14)")
 $ epsilon_R = C_1 R^(- 1 \/ 10) lt.eq 1 $ <pf:small-base>]

for sufficiently large $R$, after choosing a fixed $C_1$ large enough.

The normalization of the connection gives

#[#set math.equation(numbering: n => "(6.15)")
 $ d alpha = C_(upright("nor"))^(- 1) sum_(j < b_(*)) d B_j + C_(upright("nor"))^(- 1) W thin d B_(b_(*)) + Q \, #h(2em) Q = - C_(upright("nor"))^(- 2) d C_(upright("nor")) and B . $ <pf:normalized-curvature>]

The lower bound $C_(upright("nor")) gt.eq c_0 > 0$ from Proposition 17 changes the bases in (6.14) only by a fixed factor; enlarge $C_1$ accordingly. The last term in (6.15) is decomposable, so $Q and Q = 0$. Moreover, (5.33) implies

#[#set math.equation(numbering: n => "(6.16)")
 $ \| Q_(i i') \| lt.eq C_R l_i l_(i') . $ <pf:rank-two>]

In particular, this stage can contribute to a Pfaffian partition only on zero or two indices. The constant $C_R$ in (6.16) is independent of $n$.

There are $S = b_(*) + 2$ stages in (6.15): the raw stage, the $b_(*)$ smooth stages, and $Q$. Denote their matrices by $M_0 \, dots.h \, M_(S - 1)$, with $M_(S - 1) = Q$. The Pfaffian expansion is

#[#set math.equation(numbering: n => "(6.17)")
 $ "Pf" (sum_(j = 0)^(S - 1) M_j) = sum_(I_0 union.sq dots.h.c union.sq I_(S - 1) = { 1 \, dots.h \, n }) sigma \( I_0 \, dots.h \, I_(S - 1) \) product_(j = 0)^(S - 1) "Pf"_(I_j) \( M_j \) \, $ <pf:partition-expansion>]

where all $\| I_j \|$ are even and each sign $sigma$ is $1$ or $- 1$. There is no multiplicity factor for a fixed ordered partition. To check this normalization, expand the divided exterior power $\( sum_j M_j \)^m \/ m !$ as $sum_(sum m_j = m) product_j M_j^(m_j) \/ m_j !$, and then extract the coordinate volume coefficient using (6.1) on each coordinate subset.

Take absolute values in (6.17). In each term the length factors multiply to $product_(i = 1)^n l_i$, independently of the partition. Fix now the even sizes $k_j = \| I_j \|$. For any given raw subset $I_0$ of size $k_0$, the number of completions to a partition of these sizes is

$ frac(\( n - k_0 \) !, product_(j = 1)^(S - 1) k_j !) \, $

which is independent of $I_0$. Every factor other than the raw neighbor counts has already been bounded independently of the simplex point and of the actual subset. Thus, upon summing over these partitions and integrating over the simplex, the count product in (6.11) is averaged uniformly over all raw subsets of size $k_0$. Lemma 21 applies without any assertion about an individual fixed subset.

The smooth estimates also contain factors $\( n \/ k_j \)^(k_j \/ 4)$ or $\( n \/ k_j \)^(k_j \/ 2)$. Their product is at most

#[#set math.equation(numbering: n => "(6.18)")
 $ product_(j : k_j > 0) \( n \/ k_j \)^(k_j \/ 2) lt.eq S^(n \/ 2) . $ <pf:entropy>]

For completeness, put $p_j = k_j \/ n$ on the positive sizes. Concavity of the logarithm gives

$ sum_j p_j log \( 1 \/ p_j \) lt.eq log (sum_j p_j \/ p_j) lt.eq log S \; $

exponentiating $n \/ 2$ times this inequality proves (6.18). Factors for the raw and decomposable stages may be inserted here because they are at least one.

Let $q = k_(S - 1)$. A nonzero term has $q = 0$ or $q = 2$. The small bases in the other stages give $epsilon_R^(n - q)$, while the decomposable stage costs at most $C_R$. Since $0 < epsilon_R lt.eq 1$, both possibilities are bounded by $C_R epsilon_R^n$ after absorbing the single factor $epsilon_R^(- 2)$ into $C_R$. This absorption introduces no dependence on $n$.

For fixed sizes, the number of ordered partitions is $n ! \/ product_j k_j !$. Summed over all admissible sizes this is at most $S^n$, the number of all assignments of the $n$ indices to $S$ stages. Combining this count, (6.18), and the preceding uniform subset average proves

$ bb(E)_(Delta_n) \| "Pf" \( d alpha \) \| lt.eq C_R epsilon_R^n S^(3 n \/ 2) product_(i = 1)^n l_i . $

Substitution of (6.14) proves (6.2), and (6.13) supplies the assertion about $S$. This completes the proof of Theorem 18.

== 7 Proof of the trace-support theorem <sec:conclusion>

We now sum the curvature estimate against the cyclic tuple weights. The order of the two limiting choices is essential: the spatial radius is fixed first, uniformly in the conjugacy class, and only then does the simplex dimension tend to infinity.

#proof[
  By Proposition 3, it suffices to treat a finitely generated group with a fixed word metric and an idempotent $p$ having an exponential moment. The zero idempotent is immediate, so assume $M_p > 0$, with $M_p$ as in Lemma 4.
  For the construction of Sections 5 and 6, write
  $ Q_R = C S^(3 \/ 2) R^(- 1 \/ 10) \, #h(2em) S = b_(*) + 2 . $
  The fixed constants here may depend on the word metric, but not on $g$, the tuple, or $n$. Since $S = O \( 1 + log R \)$, we have $Q_R arrow.r 0$. Choose $R$ once and for all so large that the construction applies and
  #[#set math.equation(numbering: n => "(7.1)")
   $ Q_R M_p < 1 . $ <final:radius-choice>]
  This fixes the final spatial radius $r = 6^(J_(*) - 1) R$, the scale ladder, and all constants denoted $C_R$.
  Let $g$ have infinite order, or have finite order with $min_h d \( h \, g h \) > 4 r$. Proposition 17 provides a compatible connection family through every sufficiently large even dimension $n$. Combining Proposition 6, Theorem 18, and (3.2), we obtain
  #[#set math.equation(numbering: n => "(7.2)")
   $ \| tau_(\[ g \]) \( p \) \| & lt.eq sum_(h in cal(T)_n \( g \)) \| v_(n + 1) \( h \) \| bb(E)_(Delta_n) \| "Pf" \( d alpha_h \) \|\
 & lt.eq C_R Q_R^n sum_(h in cal(T)_n \( g \)) \| v_(n + 1) \( h \) \| product_(i = 1)^n l_i\
 & lt.eq C_R M_p thin \( Q_R M_p \)^n . $ <final:decay>]
  In the last step we used $l_0 gt.eq 1$ to insert the missing closing-edge factor. The constant $C_R$ is independent of $n$ and $g$. Letting $n$ tend to infinity through even integers in (7.2) gives $tau_(\[ g \]) \( p \) = 0$.
  It remains to identify the possible surviving classes. Every infinite-order class has just been eliminated. If a finite-order class does not satisfy the displacement condition, some conjugate of its representative has word length at most $4 r$, because
  $ d \( h \, g h \) = \| h^(- 1) g h \| . $
  Thus each surviving class meets the finite ball $B \( 1 \, 4 r \)$. There are only finitely many such classes. This proves the result for $p$. Proposition 3 transfers it to the original $e$ and group. Finally, an element of $K_0 \( ell^1 \( G \) \)$ is a difference of idempotent classes; taking the union of their two finite supports proves the asserted inclusion for $"HS"^1$. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
