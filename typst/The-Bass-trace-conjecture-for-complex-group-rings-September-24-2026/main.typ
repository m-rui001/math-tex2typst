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

#align(center)[#text(size: 16pt, weight: "bold")[The Bass trace conjecture and the characteristic-zero Kaplansky idempotent conjecture]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

The rank of a projective module over a group ring contains information about individual conjugacy classes. This refinement of ordinary rank is a basic ingredient of group-ring Euler characteristics: alternating sums of projective-module ranks retain information that a numerical Euler characteristic forgets #cite(label("Bass1976")) #cite(label("Bass1979")). The Bass trace conjecture asks how much of that information can occur at elements of infinite order. We first specify the complex version of this question.

For a unital complex algebra $A$, let $K_0 \( A \)$ be the Grothendieck group of finitely generated projective right $A$-modules, and set

$ "HH"_0 \( A \) = A \/ \[ A \, A \] \, $

where $\[ A \, A \]$ is the complex linear span of commutators. An idempotent $e = \( e_(i j) \) in M_q \( A \)$ represents the projective right module $e A^q$, with matrices acting on columns by left multiplication. Its Hattori–Stallings trace is

$ "HS"_A \( \[ e A^q \] \) = [sum_(i = 1)^q e_(i i)] in "HH"_0 \( A \) \, $

extended additively to virtual projective classes.

Let $G$ be a discrete group and write $"con" \( G \)$ for its set of conjugacy classes. The quotient $"HH"_0 \( bb(C) G \)$ identifies with $xor.big_(C in "con" \( G \)) bb(C) C$ by

#[#set math.equation(numbering: n => "(1.1)")
 $ [sum_(h in G) a_h h] mapsto sum_(C in "con" \( G \)) (sum_(h in C) a_h) C . $ <eq:class-trace>]

Indeed, a commutator has zero sum on each conjugacy class, and the differences of conjugate group elements span the kernel of the displayed map. Such differences are commutators: $t s t^(- 1) - s = \[ t \, s t^(- 1) \]$. All sums arising from an element of $bb(C) G$ have finite support. We write $"HS"_G \( x \) \( C \)$ for the coefficient at $C$.

The complex group-ring Bass conjecture asks whether these coefficients vanish on every infinite-order conjugacy class, for every group and every class in $K_0 \( bb(C) G \)$; see #cite(label("BCM2004")) Conjecture 2.1 and #cite(label("CM2011")) Conjecture 2.

#thm([Theorem 1.1.])[
  #emph[Let $G$ be any discrete group. For every $x in K_0 \( bb(C) G \)$ and every infinite-order element $g in G$, 
$ "HS"_G \( x \) \( \[ g \]_G \) = 0 . $

 Equivalently, if $"con"_(upright("fin")) \( G \)$ denotes the conjugacy classes of finite-order elements, then 
$ "HS"_G #scale(x: 120%, y: 120%)[\(] K_0 \( bb(C) G \) #scale(x: 120%, y: 120%)[\)] subset.eq xor.big_(C in "con"_(upright("fin")) \( G \)) bb(C) C . $

]
] <thm:bass>

This resolves the complex group-ring formulation positively. Finite-order coefficients need not vanish away from the identity: for a finite group $F$, the idempotent $\| F \|^(- 1) sum_(h in F) h$ has coefficient $\| C \| \/ \| F \|$ at every conjugacy class $C$. The conclusion therefore differs from the identity-only support assertion for integral group rings. That integral assertion follows in Section 9 by combining Theorem 1 with the known restriction on its finite-order coefficients.

=== 1.1 Trace rank and the idempotent conjecture <trace-rank-and-the-idempotent-conjecture>

For a torsion-free group the identity is the only finite-order element, so Theorem 1 also has numerical and ring-theoretic consequences. Define the canonical trace and the augmentation by

$ tau_G #h(-0.16667em) (sum_(g in G) a_g g) = a_1 \, #h(2em) epsilon.alt_G #h(-0.16667em) (sum_(g in G) a_g g) = sum_(g in G) a_g . $

For a matrix $b = \( b_(i j) \) in M_q \( bb(C) G \)$, put $tau_(G \, q) \( b \) = sum_(i = 1)^q tau_G \( b_(i i) \)$, and let $epsilon.alt_(G \, q) \( b \) in M_q \( bb(C) \)$ be the entrywise augmentation. The coefficient at $\[ 1 \]_G$ of the Hattori–Stallings trace defines

$ tau_(G \, *) : K_0 \( bb(C) G \) arrow.r bb(C) \, #h(2em) tau_(G \, *) \( \[ e \( bb(C) G \)^q \] \) = tau_(G \, q) \( e \) . $

The augmentation also defines the integer-valued augmentation rank

$ "rk"_epsilon.alt : K_0 \( bb(C) G \) arrow.r^(\( epsilon.alt_G \)_(*)) K_0 \( bb(C) \) arrow.r^(dim_(bb(C))) bb(Z) . $

The idempotent conjecture commonly attributed to Kaplansky asks whether, for every torsion-free group $G$ and every field $k$, an element $e in k G$ satisfying $e^2 = e$ must be $0$ or $1$; see #cite(label("OW2023")) Problem 3. It concerns elements of the group ring itself, not arbitrary idempotent matrices over that ring.

#thm([Corollary 1.2.])[
  #emph[Let $G$ be any torsion-free discrete group.]
  + #emph[For every $q gt.eq 1$ and every idempotent $e in M_q \( bb(C) G \)$, 
$ tau_(G \, q) \( e \) = "rank"_(bb(C)) #scale(x: 120%, y: 120%)[\(] epsilon.alt_(G \, q) \( e \) #scale(x: 120%, y: 120%)[\)] . $

 Consequently $tau_(G \, *) = "rk"_epsilon.alt$, with $bb(Z)$ viewed as a subgroup of $bb(C)$, and 
$ tau_(G \, *) #scale(x: 120%, y: 120%)[\(] K_0 \( bb(C) G \) #scale(x: 120%, y: 120%)[\)] = bb(Z) . $

]
  + #emph[For every commutative unital domain $R$ of characteristic zero, every $e in R G$ satisfying $e^2 = e$ is either $0$ or $1$.]
] <cor:torsion-free>

Part (ii) resolves the characteristic-zero Kaplansky idempotent conjecture positively, and includes coefficient domains as well as fields. Section 10 derives both parts from the trace theorem. The integer range in part (i) concerns algebraic $K_0 \( bb(C) G \)$; its relation to the reduced $C^(*)$-completion is made explicit there.

The integral trace consequence also links the theorem to fixed-point theory. A map $f$ is a #emph[homotopy idempotent] if $f compose f tilde.eq f$. Berrick, Chatterji and Mislin’s equivalences #cite(label("BCM2006")) Theorems 1–2 then imply that every homotopy idempotent on a connected closed smooth oriented manifold of dimension greater than two is freely homotopic to a map with exactly one fixed point. They also identify ordinary and $L^2$-Lefschetz numbers for pointed homotopy idempotents of connected closed smooth oriented manifolds that induce the identity on the fundamental group. Corollary 21 states these consequences precisely; Section 9 explains their connection to projective Euler characteristics.

=== 1.2 The two parts of the proof <the-two-parts-of-the-proof>

We first describe the algebraic construction to explain the geometric statement it needs. The body of the paper begins with that geometric statement, formulated independently of group rings, and completes its proof before constructing the cycles and cocycles to which it applies.

For a finitely generated group $G$, the algebraic construction starts with an idempotent $e in M_q \( bb(C) G \)$ and one infinite-order element $g in G$. The finitely many nonzero group coefficients of $e$ determine a finite set of steps. Products of matrix coefficients along paths from $h$ to $g h$, followed by the ordinary matrix trace, give complex weights on finite lists of group elements. Idempotency says that summing over any intermediate vertex removes that vertex. Cyclicity of matrix trace gives a second identity, a cyclic shift whose last vertex is multiplied by $g$.

Project the vertices to the coset set $Y = chevron.l g chevron.r without G$. The group $H = C_G \( g \) \/ chevron.l g chevron.r$, where $C_G \( g \)$ is the centralizer of $g$, acts freely on $Y$. For every positive even dimension $2 m$, the weighted lists define a simplicial cycle modulo this action. Its simplices use connected sets of vertices in one graph of bounded degree, fixed as $m$ increases. A Pfaffian cocycle evaluates on this cycle as $2^(- m) "HS"_G \( \[ e \( bb(C) G \)^q \] \) \( \[ g \]_G \)$. Here a cocycle means an alternating function on vertex lists that vanishes on simplicial boundaries. The explicit construction and the evaluation occupy Sections 7 and 8.

The geometric part, proved first in Sections 2–6, shows that every invariant cocycle evaluates to zero on cycles of this kind in sufficiently high dimension. We cut the supporting simplicial complex successively into pieces of bounded diameter, choosing the separating sets nearly to minimize their areas. A volume estimate and repeated slicing make the expected number of points in the final zero-dimensional set arbitrarily small. A subdivision construction turns this point count into a bound for cocycle evaluations. Equivariant chain homotopy keeps the evaluation unchanged throughout the construction.

The fixed graph degree makes increasing the dimension useful. Through each vertex there are only exponentially many connected vertex sets of a given size. On an $n$-simplex, Euclidean structures chosen from spanning trees of its vertex set give volume $1 \/ n !$; repeated slicing produces the same factorial in the comparison with a point of the final separating set. After these factors cancel, radii chosen in terms of the fixed degree bound make the remaining volume ratio tend to zero with $n$. The local replacement argument turns this strict volume margin into the small expected point count. No homological-dimension bound on $H$ is assumed.

Two features permit this argument for arbitrary groups. A compact probability space with a free action separates overlapping translates of local modifications, without any amenability assumption. Also, each top simplex has its own averaged Euclidean area functional. The areas need not match along common faces; the successive cuts keep the relevant dimensional measures away from those faces. The cocycles need not be globally bounded: near each original simplex, the construction uses only a fixed finite set of possible vertices. Bounding the cocycle on those lists suffices for the evaluation estimate.

The final assembly in Section 9 chooses a large even dimension, forcing the individual trace coefficient to vanish. Passing from finitely generated groups to arbitrary groups uses the exact sum over subgroup conjugacy classes contained in an ambient conjugacy class. Section 10 then extracts the augmentation rank from the identity coefficient. In the scalar case this rank is $0$ or $1$, and the standard faithful-trace argument forces the idempotent itself to be $0$ or $1$. A finite-coefficient reduction extends that conclusion from complex coefficients to every commutative characteristic-zero domain.

=== 1.3 Relation to previous work <relation-to-previous-work>

The rank construction comes from Hattori and Stallings #cite(label("Hattori1965")) #cite(label("Stallings1965")); Bass developed its relation to Euler characteristics and formulated the integral conjecture in #cite(label("Bass1976")); see also #cite(label("Bass1979")) Conjecture (4.5). Bass proved complex trace vanishing at infinite-order elements for linear groups #cite(label("Bass1979")) Theorem (6.1)(f). For the integral trace, Linnell established a restriction on the possible nonzero coefficients #cite(label("Linnell1983")) Lemma 4.1, later recovered through topological Hochschild homology by Berrick and Hesselholt #cite(label("BH2015")) Theorem A. Its finite-order consequence is the input used in Section 9.

The scalar idempotent problem also has a long history of trace methods. Formanek proved the characteristic-zero conclusion for torsion-free groups satisfying the ascending chain condition on subgroups #cite(label("Formanek1973")) Theorem 1. Burger and Valette revisit the theorems of Kaplansky and Zalesskii: the canonical trace of a complex scalar idempotent lies in $\[ 0 \, 1 \]$, its endpoints force the idempotent to be trivial, and its value is rational #cite(label("BV1998")) Theorems 1.3 and 2.1. They also obtain $tau_(G \, *) \( K_0 \( bb(C) G \) \) subset.eq bb(Q)$ #cite(label("BV1998")) Corollary 1.2. Rationality still permits nonintegral values strictly between zero and one. For torsion-free groups, Theorem 1 identifies the trace with augmentation rank, which excludes those values. The subsequent faithful-trace argument is classical and is included in Section 10.

Broader group classes have been treated by algebraic and analytic methods. Farrell and Linnell proved the complex Bass statement for elementary amenable groups as part of a result over integral domains #cite(label("FarrellLinnell2003")) Theorem 1.6. Berrick, Chatterji and Mislin obtained it for amenable groups through rational surjectivity of the degree-zero Bost assembly map for countable groups #cite(label("BCM2004")) Theorems 1.3–1.4 and Lemma 1.5. Their result concerns the stronger trace assertion on $ell^1 \( G \)$, with finite support on finite-order classes. An algebraic route uses induction from finite subgroups: the Farrell–Jones conjecture with complex coefficients implies the complex Bass statement #cite(label("BartelsLuckReich2008")) Theorems 1.5 and 1.9. The present proof uses the finite support of group-ring idempotents throughout; it requires neither an assembly hypothesis nor a statement about a completed group algebra.

For some groups, analytic methods give a stronger idempotent conclusion in the reduced group $C^(*)$-algebra $C_r^(*) \( G \)$, the operator-norm closure of $bb(C) G$ acting on $ell^2 \( G \)$. Using Lafforgue’s Banach $K K$-theory, Mineyev and Yu proved this for torsion-free subgroups of hyperbolic groups #cite(label("MineyevYu2002")) Theorems 19–21. Puschnigg independently obtained the torsion-free hyperbolic case through local cyclic homology #cite(label("Puschnigg2002")); see also #cite(label("MineyevYu2002")) Section 6. Our conclusion for arbitrary torsion-free groups concerns the group ring and the trace on its algebraic $K_0$, as distinguished in Section 10.

The higher-dimensional algebraic construction has antecedents in the cyclic-homological approach to the conjecture. Connes constructed a pairing of even cyclic cocycles with projective classes #cite(label("Connes1985")) Part II, §2, Proposition 14. Burghelea’s decomposition of cyclic homology by conjugacy classes identifies the infinite-order components through the reduced centralizers $C_G \( g \) \/ chevron.l g chevron.r$ #cite(label("Burghelea1985")) Proposition 1.8 and Theorem I. Eckmann used higher-degree vanishing to obtain trace vanishing over rational group rings for specified classes of groups of finite rational homological dimension #cite(label("Eckmann1986")) §3, Theorems 3.1 and 3.3. Sections 7–8 give direct finite-chain constructions in this tradition, including the normalization of the Pfaffian detector; no cyclic-homology theorem is needed as an input. The sparse-chain theorem replaces a homological-dimension hypothesis with connected-support control on the particular cycles.

The geometric proof develops the separating-set method of Papasoglu #cite(label("Papasoglu2020")) §2, especially Lemma 2.5, the separating filtrations and simplex-counting argument of Alpert #cite(label("Alpert2025")) Lemmas 4, 6–7, and the Cantor-parameter approach of Braun and Sauer #cite(label("BraunSauer2021")) §§2, 4–5. Alpert’s equivariant formulations #cite(label("Alpert2025")) §4, especially Lemmas 11–12 provide the closest model for the local comparisons. Alpert’s filtration results concern manifold geometry and compatible metrics. We give the full piecewise-linear argument needed for simplex-dependent areas and arbitrary cycles in the coinvariant chain complex. The separate Pfaffian calculation converts this geometric vanishing into a statement about each conjugacy-class coefficient.

== 2 A vanishing theorem for sparse simplicial cycles <sec:framework>

We formulate the geometric statement independently of group rings. Its input is a graph with a free group action and a simplicial complex whose top-dimensional vertex sets are connected in that graph. Its output is the vanishing of every invariant cocycle evaluation in sufficiently high dimension.

For a set $Y$, let $bb(C)^(\( Y \))$ be the vector space with basis ${ delta_y : y in Y }$, consisting of finite linear combinations. The augmented chains of the full simplex on $Y$ are

$ E_j = and.big^(j + 1) bb(C)^(\( Y \)) quad \( j gt.eq 0 \) \, #h(2em) E_(- 1) = bb(C) . $

The differential is contraction with the functional $alpha \( sum_y c_y delta_y \) = sum_y c_y$:

#[#set math.equation(numbering: n => "(2.1)")
 $ partial \( delta_(y_0) and dots.h.c and delta_(y_j) \) = sum_(i = 0)^j \( - 1 \)^i delta_(y_0) and dots.h.c and hat(delta_(y_i)) and dots.h.c and delta_(y_j) . $ <eq:boundary>]

In degree zero this is the augmentation to $bb(C)$; the empty wedge is $1$. For a simplicial subcomplex $K$, its augmented oriented chains $C_(*) \( K \)$ form a subcomplex of $E_(*)$.

If a group $H$ acts on $Y$, it acts on both chain complexes by permuting vertices, with the signs prescribed by the exterior product. For an $H$-module $V$, its coinvariants are

$ V_H = V \/ "span"_(bb(C)) { h v - v : h in H \, med v in V } . $

The differentials induce differentials on coinvariants. A cycle in $C_n \( K \)_H$ is a class whose boundary is zero there; an arbitrary finite chain representing it need not have zero boundary before passage to coinvariants. An $H$-invariant linear functional $psi : E_n arrow.r bb(C)$ descends to $\( E_n \)_H$. We call it a cocycle when $psi partial = 0$ on $E_(n + 1)$.

#thm([Theorem 2.1.])[
  (Sparse-chain vanishing).  #emph[For each integer $D gt.eq 2$ there is an integer $n_0 \( D \)$ with the following property. Let $Y$ be the vertex set of a countable connected simple graph of degree at most $D$, and let a countable group $H$ act by graph automorphisms, freely on vertices. Suppose $n gt.eq n_0 \( D \)$ and $K$ is an $H$-invariant subcomplex of the full simplex on $Y$ such that:]
  + #emph[$K$ is generated by its $n$-simplices and has finitely many $H$-orbits of simplices;]
  + #emph[the vertices of each $n$-simplex span a connected subgraph of $Y$.]
  #emph[Then every $H$-invariant cocycle $psi : E_n arrow.r bb(C)$ evaluates to zero on the image in $\( E_n \)_H$ of every cycle in $C_n \( K \)_H$.]
] <thm:sparse>

The bound $n_0 \( D \)$ depends only on the graph degree, not on $H$, $K$ or $psi$. There is no boundedness hypothesis on $psi$. We will bound it only on a finite set of basis wedges associated with each fixed original simplex. This distinction is necessary in the application.

For the proof assume $K eq.not diameter$; the empty case has no positive degree chains. Its realization $\| K \|$ consists of finitely supported probability vectors $p : Y arrow.r \[ 0 \, 1 \]$ whose supports are simplices of $K$. A simplex will also denote its closed affine realization; $sigma^compose$ denotes its relative interior. We call simplices of $K$ #emph[original] to distinguish them from the later subdivisions, and call its $n$-simplices #emph[top simplices].

The proof has three steps. First, we choose a metric and simplexwise areas for which balls have small volume in high dimension. Second, we construct separating filtrations with very few points in their final stratum, on average over a free probability parameter. Third, we use their subdivisions to construct equivariant chain maps homotopic to inclusion whose cocycle evaluations approach zero. Each approximation uses a finite filtration; no limiting filtration is needed.

== 3 A metric and volume bound for connected supports <sec:metric>

We work with the graph $Y$, group $H$, and nonempty $n$-dimensional complex $K$ of Theorem 3, where $n gt.eq 1$. We need two kinds of geometric control: a metric with finite neighborhoods in which to make cuts, and Euclidean area functionals for which those cuts satisfy a slicing inequality. We will use a scaled transportation metric on $\| K \|$ and, separately inside each top simplex, Euclidean structures determined by its spanning trees. Each top simplex will have volume $1 \/ n !$, while every affine branch of a distance function will have gradient norm at most one in each of these structures. Counting the possible connected vertex supports will then give the ball-volume estimate used in the separating argument.

=== 3.1 The metric and its finite local geometry <the-metric-and-its-finite-local-geometry>

Represent a point of $\| K \|$ by a probability vector $p$ on $Y$ whose support lies in a simplex of $K$. Let $d_Y$ denote graph distance and define

#[#set math.equation(numbering: n => "(3.1)")
 $ rho \( p \, q \) = 1 / sqrt(n) sup_("Lip"_(d_Y) \( ell \) lt.eq 1) sum_(v in Y) ell \( v \) #scale(x: 120%, y: 120%)[\(] p \( v \) - q \( v \) #scale(x: 120%, y: 120%)[\)] . $ <eq:transport-metric>]

This is the scaled Kantorovich–Rubinstein metric on finitely supported probability measures, in its Lipschitz-potential form #cite(label("Kantorovich2006")) pp. 1381–1382. We establish its needed properties directly. Only finitely many terms occur in the pairing. To see that the supremum is finite and describe the distance function on each simplex, let $V subset Y$ be a nonempty finite set and put

$ cal(P)_V = {ell in bb(R)^V : sum_(v in V) ell \( v \) = 0 \, quad \| ell \( v \) - ell \( w \) \| lt.eq d_Y \( v \, w \) quad \( v \, w in V \)} . $

This is a nonempty compact polytope. Indeed, its difference constraints and zero mean bound every coordinate by $max_(v \, w in V) d_Y \( v \, w \)$. Each $ell in cal(P)_V$ extends to a $1$-Lipschitz function on $Y$ by

$ tilde(ell) \( y \) = min_(v in V) #scale(x: 120%, y: 120%)[\(] ell \( v \) + d_Y \( v \, y \) #scale(x: 120%, y: 120%)[\)] . $

The difference constraints show that this extension agrees with $ell$ on $V$, and the triangle inequality proves that it is $1$-Lipschitz. Conversely, a global $1$-Lipschitz function restricts, after subtraction of its mean, to an element of $cal(P)_V$. Constants pair to zero with $p - q$. Consequently, when $V$ contains both supports, the supremum in (3.1) is the maximum over $cal(P)_V$.

Symmetry follows by replacing $ell$ with $- ell$, and the triangle inequality follows by applying each potential to $p - q = \( p - u \) + \( u - q \)$. The indicator of a single vertex is $1$-Lipschitz for $d_Y$, so

#[#set math.equation(numbering: n => "(3.2)")
 $ \| p \( v \) - q \( v \) \| lt.eq sqrt(n) thin rho \( p \, q \) #h(2em) \( v in Y \) . $ <eq:coordinate-control>]

Thus $rho$ separates points and is a metric. It is $H$-invariant because graph automorphisms permute the admissible potentials. On probability vectors supported in a fixed finite set, it is the restriction of a norm on the finite-dimensional space of vectors with coordinate sum zero. It therefore gives the usual topology on every finite subcomplex.

For $c in \| K \|$, write

$ f_c \( p \) & = rho \( c \, p \) \, & U_s \( c \) & = { p : f_c \( p \) < s } \,\
L_s \( c \) & = { p : f_c \( p \) lt.eq s } \, & S_s \( c \) & = { p : f_c \( p \) = s } . $

On a fixed closed simplex $sigma$, the function $f_c$ is a maximum of finitely many affine functions: use the extreme points of $cal(P)_(V \( sigma \) union "supp" c)$. Here $V \( sigma \)$ denotes the vertex set of $sigma$. Taking all these extreme points makes the collection of affine branches equivariant under $H$.

#thm([Lemma 3.1.])[
  #emph[Every closed $rho$-ball meets only finitely many simplices of $K$. The complex $K$ is locally finite, and $rho$ gives its usual realization topology and is proper. For each $c in \| K \|$, $s gt.eq 0$, and simplex $kappa$, the set 
$ { h in H : L_s \( h c \) ∩ kappa eq.not diameter } $

 is finite. The setwise stabilizer $H_kappa$ of a nonempty simplex is finite as well.]
] <lem:proper>

#proof[
  Let $A = "supp" c$. The function $d_Y \( thin dot.op thin \, A \)$ is $1$-Lipschitz and vanishes on $A$. Using its negative in (3.1) gives
  #[#set math.equation(numbering: n => "(3.3)")
   $ min_(a in "supp" c\
v in "supp" p) d_Y \( a \, v \) lt.eq sum_v p \( v \) d_Y \( v \, A \) lt.eq sqrt(n) thin rho \( c \, p \) . $ <eq:support-distance>]
  If a top simplex $sigma$ meets $L_s \( c \)$ at $p$, it therefore contains a vertex within distance $floor.l s sqrt(n) floor.r$ of $A$. The graph on its $n + 1$ vertices is connected, so every vertex of $sigma$ is within another $n$ steps of that vertex. Thus all such simplices use vertices in the finite graph neighborhood
  $ B_(floor.l s sqrt(n) floor.r + n)^Y \( A \) := { v in Y : d_Y \( v \, A \) lt.eq floor.l s sqrt(n) floor.r + n } . $
  There are only finitely many possibilities for $sigma$ and its faces. Likewise, every top simplex containing a specified vertex $v$ uses vertices in $B_n^Y \( { v } \)$; hence each vertex has a finite star.
  For completeness, the finite-subcomplex topology statement implies the corresponding statement on all of $\| K \|$. Given $p$, let $eta = min { p \( v \) : v in "supp" p } > 0$. By (3.2), the ball of radius $eta \/ \( 2 sqrt(n) \)$ about $p$ lies in the finite star of $"supp" p$. Within this star the metric and realization topologies agree. The open star of $"supp" p$ is also a neighborhood of $p$ in the locally finite realization, so the agreement is local in both topologies. A closed metric ball is a closed subset of the finite union of closed simplices it meets, and is therefore compact.
  If $L_s \( h c \)$ meets $kappa$, (3.3) supplies $a in A$ and $b in V \( kappa \)$ with $d_Y \( h a \, b \) lt.eq s sqrt(n)$. For each $a$, the map $h mapsto h a$ is injective because $H$ acts freely on vertices. The finitely many pairs $a \, b$ and finite graph balls therefore allow only finitely many $h$. Finally, for $v in V \( kappa \)$, the same injection maps $H_kappa$ into $V \( kappa \)$. In particular, $\| H_kappa \| lt.eq \| V \( kappa \) \|$. ◻
]

We will also use the following consequence. For fixed $c$ and $s$, only finitely many $h in H$ satisfy

#[#set math.equation(numbering: n => "(3.4)")
 $ L_s \( h c \) ∩ L_s \( c \) eq.not diameter . $ <eq:finite-ball-overlaps>]

Indeed, an intersection gives $rho \( h c \, c \) lt.eq 2 s$, and then (3.3) puts some vertex of $h "supp" c$ within distance $2 s sqrt(n)$ of $"supp" c$. The same injectivity argument applies.

=== 3.2 Simplex areas and distance gradients <simplex-areas-and-distance-gradients>

The metric now provides finite neighborhoods in which we can make cuts. For area comparisons, we use Euclidean structures separately inside the top simplices. They need not agree on shared faces.

Fix a top simplex $sigma$. For each spanning tree $T$ of the connected graph on $V \( sigma \)$, equip its affine span with the Euclidean structure in which the tree-edge vectors $delta_v - delta_w$, with either orientation for each edge, form an orthonormal basis of the translation space. For $0 lt.eq j lt.eq n$, let $a_j^sigma$ be the average, over these finitely many trees, of Euclidean $j$-area on polyhedral subsets of $sigma^compose$ of dimension at most $j$. We allow relatively open faces in these sets; pieces of dimension less than $j$ have zero $j$-area, and $a_0^sigma$ is counting measure. These area functionals are covariant under $H$, since the action permutes the spanning trees.

#thm([Lemma 3.2.])[
  #emph[In every tree Euclidean structure on a top simplex $sigma$, its $n$-volume is $1 \/ n !$. Every affine branch of $f_c \|_sigma$ has gradient of norm at most one, for every $c in \| K \|$. The same gradient bound holds after restriction to any affine subspace of the span of $sigma$.]
] <lem:tree>

#proof[
  Root the tree at $v_0$, orient its edges away from the root, and order the remaining vertices so that each parent precedes its children. Put
  $ t_i = delta_(v_i) - delta_("parent" \( v_i \)) \, #h(2em) b_i = delta_(v_i) - delta_(v_0) quad \( 1 lt.eq i lt.eq n \) . $
  Each $b_i$ is the sum of the $t_j$ along its root path. Thus the change-of-basis matrix is triangular with diagonal entries one. The $t_i$ are an orthonormal basis in the chosen metric, so the parallelepiped spanned by the $b_i$ has volume one. The simplex has volume $1 \/ n !$.
  An affine branch has derivative along $t_i$ equal, up to sign, to
  $ frac(ell \( v_i \) - ell \( "parent" \( v_i \) \), sqrt(n)) $
  for a $1$-Lipschitz potential $ell$. Since the two vertices are adjacent, this derivative has absolute value at most $1 \/ sqrt(n)$. The squared gradient norm is the sum of the squares of these $n$ derivatives and is at most one. Restriction to an affine subspace replaces the gradient by its orthogonal projection, which cannot increase its norm. ◻
]

=== 3.3 The volume margin in high dimension <the-volume-margin-in-high-dimension>

We next bound the total top-dimensional area of a metric ball by counting its possible connected vertex supports. Fix

$ R = 4 D^2 \, #h(2em) r = R \/ 2 . $

For a specified vertex $v$, there are at most $D^(2 n)$ connected sets of $n + 1$ vertices containing $v$. To prove this, choose a spanning tree of each such set rooted at $v$. A traversal using each tree edge once in each direction is a walk of length $2 n$, starting at $v$, whose visited set is exactly the prescribed set. Choosing one such walk per set gives an injection into the length-$2 n$ walks from $v$, of which there are at most $D^(2 n)$.

Set $k = floor.l R sqrt(n) floor.r$. A graph ball of radius $k$ has at most

$ sum_(j = 0)^k D^j lt.eq D^(k + 1) $

vertices, since $D gt.eq 2$. As $\| "supp" c \| lt.eq n + 1$, there are at most $\( n + 1 \) D^(k + 1)$ vertices within distance $k$ of $"supp" c$. By (3.3), each top simplex meeting $L_R \( c \)$ contains one of them. The connected-set count and Lemma 5 therefore give, for every $c in \| K \|$,

#[#set math.equation(numbering: n => "(3.5)")
 $ sum_(sigma med upright("top")) a_n^sigma #scale(x: 120%, y: 120%)[\(] L_R \( c \) ∩ sigma^compose #scale(x: 120%, y: 120%)[\)] lt.eq V_R := frac(\( n + 1 \) D^(floor.l R sqrt(n) floor.r + 1) D^(2 n), n !) . $ <eq:volume-bound>]

Counting a simplex more than once only enlarges this upper bound.

With $D$ fixed, the ratio of this estimate to $\( R - r \)^n \/ n !$ is

$ frac(V_R, \( R - r \)^n \/ n !) = frac(\( n + 1 \) D^(floor.l 4 D^2 sqrt(n) floor.r + 1), 2^n) arrow.r 0 . $

Indeed, its logarithm is $- n log 2 + 4 D^2 \( log D \) sqrt(n) + O_D \( log n \)$. We may therefore choose $n_0 \( D \) gt.eq 1$ so that, for every $n gt.eq n_0 \( D \)$,

#[#set math.equation(numbering: n => "(3.6)")
 $ V_R < frac(\( R - r \)^n, n !) . $ <eq:strict-volume>]

For the remainder of the geometric proof, fix such an $n$. The graph degree bound $D$, and hence $R$ and $r$, remain fixed as dimensions increase. The strict margin (3.6) will convert successive area comparisons into a bound on the number of points at the bottom of a separating filtration.

== 4 Equivariant separating filtrations <sec:filtrations>

We retain the complex $K$, the metric $rho$, and the radii $r < R$ from Section 3. We will repeatedly cut $K$ into pieces of diameter at most $2 R$, lowering the dimension of the separating set at each step. The cuts vary over a compact probability space on which $H$ acts freely. This allows local modifications to be separated after taking account of the parameter, even when their translates overlap in $\| K \|$.

=== 4.1 A free probability parameter <a-free-probability-parameter>

The following construction is a finite-color variant of the coinduction argument in Braun and Sauer #cite(label("BraunSauer2021")) Theorem 2.1, who credit the existence theorem to Hjorth and Molberg #cite(label("HjorthMolberg2006")) Theorem 0.1. We include the construction, including its torsion case, so that no free-action theorem is an input.

#thm([Lemma 4.1.])[
  #emph[Every countable group $H$ admits a continuous free action on a compact metrizable zero-dimensional space $X$, preserving a Borel probability measure $mu$.]
] <lem:free-parameter>

#proof[
  For $a in H \\ { 1 }$, put $k_a = "ord" \( a \)$ if $a$ has finite order, and $k_a = 2$ otherwise. Let
  $ X_a = { xi : H arrow.r bb(Z) \/ k_a bb(Z) : xi \( t a \) = xi \( t \) + 1 upright(" for every ") t in H } . $
  This is a closed subspace of the product of finite discrete spaces $\( bb(Z) \/ k_a bb(Z) \)^H$. Choose a representative $t_C$ for each left coset $C = t_C chevron.l a chevron.r$. A coloring in $X_a$ is specified uniquely by offsets $omega_C in bb(Z) \/ k_a bb(Z)$, through $xi \( t_C a^j \) = omega_C + j$. This is well defined also when $a$ has finite order, because the modulus is then its order. Thus $X_a$ is nonempty, compact and zero-dimensional.
  Give the offsets independent uniform distributions. The left action
  $ \( h xi \) \( t \) = xi \( h^(- 1) t \) $
  preserves $X_a$ and its probability measure: it permutes the cosets and adds a fixed element of $bb(Z) \/ k_a bb(Z)$ to each offset. These operations preserve every finite cylinder probability. Take the product over $a eq.not 1$ to obtain $X$ and $mu$. Countability gives metrizability, and the coordinatewise action is continuous and measure preserving. For any $a eq.not 1$ and any point of $X$, its $a$-coordinate satisfies
  $ \( a xi_a \) \( 1 \) = xi_a \( a^(- 1) \) = xi_a \( 1 \) - 1 eq.not xi_a \( 1 \) . $
  Hence no nonidentity element fixes a point. If $H$ is trivial, take a one-point probability space. ◻
]

Fix such $\( X \, mu \)$ for the rest of the geometric argument. In particular, no amenability assumption on $H$ is needed.

=== 4.2 The allowed filtrations <the-allowed-filtrations>

A triangulation refining $K$ means a finite affine simplicial subdivision of each closed original simplex, with agreement on shared faces. A family $T \( x \)$ of such triangulations, together with specified subcomplexes, is #emph[locally constant] if, on each original simplex, all its exact affine simplices and subcomplex markings are constant on the pieces of a finite clopen partition of $X$. The partition may depend on the original simplex. We require equivariance: $T \( h x \) = h T \( x \)$, and likewise for every specified subcomplex. Refinement of triangulations always preserves their earlier subcomplexes.

Begin with $T_n \( x \) = K$ and $Z_n \( x \) = \| K \|$. At stage $d$, where $n gt.eq d gt.eq 1$, suppose that $P \( x \) = Z_d \( x \)$ is a subcomplex of $T_d \( x \)$. An #emph[admissible] next choice consists of a locally constant equivariant refinement $T_(d - 1) \( x \)$ and its subcomplex $Z_(d - 1) \( x \)$ such that

+ $Z_(d - 1) \( x \) subset.eq P \( x \)$;
+ for every simplex $F$ of $T_d \( x \)$ contained in $P \( x \)$,
  $ dim #scale(x: 120%, y: 120%)[\(] F ∩ Z_(d - 1) \( x \) #scale(x: 120%, y: 120%)[\)] lt.eq dim F - 1 \; $
+ every connected component of $P \( x \) \\ Z_(d - 1) \( x \)$ has $rho$-diameter at most $2 R$.

A negative dimension bound means that the intersection is empty. Thus the new separator avoids the vertices of $T_d$ and meets each higher-dimensional face in lower dimension; its own vertices belong to the finer triangulation $T_(d - 1)$. Connected components use the subspace topology given by $rho$. We call a filtration satisfying these conditions admissible. In particular, these conditions imply $dim Z_i \( x \) lt.eq i$.

The local operation behind the construction is easiest to describe at a fixed parameter. For a separator $Z subset.eq P$, a center $c in \| K \|$, and $t in \( r \, R \)$, remove the part of $Z$ inside the ball and insert the corresponding slice of $P$:

$ Z' = \( Z \\ U_t \( c \) \) union \( P ∩ S_t \( c \) \) . $

The inserted slice prevents a component of $P \\ Z'$ from passing between the ball and its exterior. Inside the ball its diameter is at most $2 t$; outside, the old separator remains. The next lemma makes this operation compatible with triangulations, group translates, and clopen parameter choices. It also constructs the level cuts used to start a filtration. Only the affine descriptions of distance levels enter the construction; no Euclidean metrics need to agree across faces.

#thm([Lemma 4.2.])[
  (Compatible cuts).  #emph[Fix locally constant equivariant triangulation families $T$ and $S$, where $S$ refines $T$, and subcomplex families $P subset.eq T$ and $Z subset.eq S$ with $Z subset.eq P$. Let ${ \( c_alpha \, B_alpha \) }_(alpha in A)$ be a countable equivariant family of centers $c_alpha in \| K \|$ and clopen sets $B_alpha subset.eq X$. Assume that only finitely many of the balls $L_R \( c_alpha \)$ meet any given original simplex. Set 
$ cal(U)_t \( x \) = union.big_(alpha : thin x in B_alpha) U_t \( c_alpha \) \, #h(2em) cal(S)_t \( x \) = union.big_(alpha : thin x in B_alpha) S_t \( c_alpha \) . $

 Outside a countable set of radii $t in \( r \, R \)$, there is a locally constant equivariant triangulation refining $S$ in which both 
#[#set math.equation(numbering: n => "(4.1)")
 $ P \( x \) ∩ cal(S)_t \( x \) \,\
#scale(x: 120%, y: 120%)[\(] Z \( x \) \\ cal(U)_t \( x \) #scale(x: 120%, y: 120%)[\)] union #scale(x: 120%, y: 120%)[\(] P \( x \) ∩ cal(S)_t \( x \) #scale(x: 120%, y: 120%)[\)] $ <eq:cut-replacement>]

 are subcomplexes. Each inserted level meets every face $F$ of $T$ or $S$ in dimension at most $dim F - 1$. Consequently, if $Z$ satisfies the dimension-drop condition relative to $T$, both displayed sets do also. If every component of $P \\ Z$ has diameter at most $2 R$, the second displayed set preserves that property.]
] <lem:refinement>

#proof[
  On a fixed original simplex the function $f_c \( p \) = rho \( c \, p \)$ is a maximum of finitely many affine functions. For a fixed face $F$, a level ${ f_c = t }$ can have full dimension in $F$ only if one of these affine functions is identically $t$ on the affine span of $F$. Otherwise the level is contained in a finite union of proper affine hyperplanes. Thus only finitely many levels are exceptional for this face and center. There are countably many original simplices and centers, and only finitely many exact triangulation types on each original simplex. Excluding the resulting countable union of exceptional levels gives the stated dimension drop simultaneously for all faces of $T$ and $S$.
  We give the compatible refinement explicitly. On each original simplex $sigma$, cut the simplices of $S$ by all hyperplanes $b = t$, where $b$ is an affine branch for one of the finitely many relevant centers. Use the canonical branch collection from the finite potential polytope in Section 3. On each piece of the finite clopen partition recording the old data and active conditions, this gives a finite polytopal complex $cal(P)_sigma$. It represents the old subcomplexes and the closed conditions defining the two sets in (4.1).
  These polytopal complexes may initially disagree on original faces. For each original simplex $tau$, let $cal(Q)_tau$ be the common polytopal refinement of
  $ cal(P)_sigma \|_tau quad upright("over all original cofaces ") sigma supset.eq tau \, quad upright("including ") sigma = tau . $
  There are finitely many cofaces by Lemma 4. The common refinement consists of the nonempty intersections of cells and their faces. If $tau$ is a face of $sigma$, then $cal(Q)_tau$ refines $cal(Q)_sigma \|_tau$, since every coface of $sigma$ is also a coface of $tau$.
  Triangulate the original simplices in increasing dimension. When handling $sigma$, its boundary has already been triangulated by a refinement of the boundary restrictions of $cal(Q)_sigma$. Extend this triangulation over the cells of $cal(Q)_sigma$ in increasing cell dimension. Keep cells in the original boundary as already triangulated. For every other positive-dimensional cell, cone its triangulated boundary to the arithmetic mean of its vertices, which lies in its relative interior. Zero-dimensional cells need no operation. The cones agree on common faces and give the desired finite affine subdivision, preserving the prescribed boundary triangulation.
  Every operation commutes with the affine maps induced by $H$: restriction, common refinement, and the mean of the full vertex set of a polytope are all canonical. This proves equivariance even for nontrivial simplex stabilizers. On each original simplex the procedure uses only finitely many data: those on its faces and their original cofaces, together with finitely many relevant cuts. A common finite clopen partition makes all these data constant. Thus the output has the required local constancy. No manifold condition on $K$ is involved.
  The first set in (4.1) has the dimension bound already proved for the levels. The second is contained in the union of those levels with $Z$, so it has the same bound whenever $Z$ does. For its separation property, let $C$ be a component of its complement in $P \( x \)$. If $C$ meets an active $U_t \( c_alpha \)$, continuity of $f_(c_alpha)$ and connectedness of $C$ imply that $C$ stays in that ball, since it avoids the inserted level. Its diameter is then at most $2 t < 2 R$. Otherwise $C$ lies outside all active open balls, where the old set $Z$ was retained. It is therefore contained in an old component of $P \( x \) \\ Z \( x \)$ and has diameter at most $2 R$. ◻
]

The genericity against $S$ is useful when $S$ already contains the old separator $Z$: intersections of an inserted level with its faces have one less dimension. The later area comparison will use precisely this conclusion. The lemma itself does not require disjoint active balls; disjointness will be imposed when their areas are counted.

#thm([Lemma 4.3.])[
  #emph[For any allowed choices through stage $d$, an allowed choice of $\( T_(d - 1) \, Z_(d - 1) \)$ exists. Hence a filtration can be continued to $Z_0$.]
] <lem:filtration-exists>

#proof[
  Each original simplex is compact in $rho$. Cover representatives of the finitely many original simplex orbits by finitely many open balls $U_r \( c \)$, and take all their $H$-translates. These balls cover $\| K \|$. By Lemma 4, only finitely many translated radius-$R$ balls meet a given original simplex. Apply Lemma 7 with every activation set equal to $X$, with $T = S = T_d$, and with $Z = diameter$. For a common allowed radius $t in \( r \, R \)$, take
  $ Z_(d - 1) \( x \) = Z_d \( x \) ∩ union.big_c S_t \( c \) . $
  This is a subcomplex of the resulting refinement and has the required dimension drop. If $C$ is a component of $Z_d \( x \) \\ Z_(d - 1) \( x \)$, choose $p in C$ and a covering ball $U_r \( c \)$ containing it. The connected set $f_c \( C \)$ avoids $t$ and contains a value below $t$, so $C subset.eq U_t \( c \)$. Its diameter is at most $2 t < 2 R$. The assertion is vacuous for an empty component space. ◻
]

=== 4.3 Dimension drop along the entire filtration <dimension-drop-along-the-entire-filtration>

We record the consequence that will control chains in Section 6. For any simplex $F$ of $T_i \( x \)$ contained in $Z_i \( x \)$ and any $0 lt.eq j lt.eq i$,

#[#set math.equation(numbering: n => "(4.2)")
 $ dim #scale(x: 120%, y: 120%)[\(] F ∩ Z_j \( x \) #scale(x: 120%, y: 120%)[\)] lt.eq dim F - \( i - j \) . $ <eq:iterated-drop>]

Indeed, the first step is the defining condition. Its intersection is a subcomplex in the next refinement. Applying the next dimension drop to each simplex of that subcomplex decreases its maximal dimension by one. Induction gives (4.2). Applied with $i = n$, this also shows that a proper original face meets $Z_j \( x \)$ in dimension strictly less than $j$.

#thm([Lemma 4.4.])[
  (Carriers of the zero-dimensional stratum).  #emph[Let $\( T_i \, Z_i \)_(i = 0)^n$ be an allowed filtration and let $z in Z_0 \( x \)$. For every $i$, there is a unique $i$-simplex of $T_i \( x \)$ contained in $Z_i \( x \)$ and containing $z$. The point $z$ lies in its relative interior. In particular, every point of $Z_0 \( x \)$ lies in the interior of an original top simplex.]
] <lem:carrier>

#proof[
  Let $F$ be the unique simplex of $T_i \( x \)$ whose relative interior contains $z$. Since $Z_i \( x \)$ is a subcomplex containing $z$, it contains $F$, and $dim F lt.eq i$. If $dim F < i$, then (4.2) with $j = 0$ would make $F ∩ Z_0 \( x \)$ empty. Thus $dim F = i$. Every other simplex containing $z$ has $F$ as a face, so no other $i$-simplex contains it. Taking $i = n$ proves the last assertion. ◻
]

We have obtained a nonempty class of equivariant separating filtrations, together with a local cutting operation that stays within that class. The next section chooses separators with area close to the infimum and compares them with these cuts.

== 5 Local replacement and the number of zero strata <sec:surgery>

We now choose the separating filtration so that its zero-dimensional set has small expected cardinality in each original simplex. Throughout this section the graph, complex, parameter space, dimension, and radii are fixed as in Sections 3 and 4. In particular, the strict inequality (3.6) holds. Only the filtration will depend on a positive number $epsilon.alt$.

#thm([Proposition 5.1.])[
  #emph[For every $epsilon.alt > 0$ there is an admissible equivariant locally constant filtration $\( Z_j \, T_j \)_(j = 0)^n$ such that, for every original top simplex $sigma$ of $K$, 
#[#set math.equation(numbering: n => "(5.1)")
 $ integral_X \# #scale(x: 120%, y: 120%)[\(] Z_0 \( x \) ∩ sigma #scale(x: 120%, y: 120%)[\)] thin d mu \( x \) lt.eq C_sigma epsilon.alt . $ <eq:zero-strata>]

 Here $C_sigma$ depends on the fixed geometric data but is independent of $epsilon.alt$ and of the complexity of the chosen triangulations.]
] <prop:zero-strata>

=== 5.1 Successive near minimizers <successive-near-minimizers>

The comparison with a cut through a ball follows the separating-set method of Papasoglu #cite(label("Papasoglu2020")) Section 2, especially Lemma 2.5 and its iterated and equivariant forms in Alpert #cite(label("Alpert2025")) Lemmas 6–7 and 11–12. We prove the comparisons for our simplex-dependent areas, retaining the error from each near minimizer.

#proof[
  For an equivariant family $Z$ of dimension at most $j$, define
  #[#set math.equation(numbering: n => "(5.2)")
   $ cal(I)_j \( Z \) = sum_(sigma med upright("top") med mod med H) frac(1, \| H_sigma \|) integral_X a_j^sigma #scale(x: 120%, y: 120%)[\(] Z \( x \) ∩ sigma^compose #scale(x: 120%, y: 120%)[\)] thin d mu \( x \) . $ <eq:normalized-area>]
  The sum runs over representatives of the original top simplices, and $H_sigma$ is the finite setwise stabilizer of $sigma$. This quantity is finite for an admissible family. There are finitely many representatives, and, on each, local constancy and compactness of $X$ give finitely many finite polyhedral configurations, each of finite area.
  Start with $\( Z_n \, T_n \) = \( \| K \| \, K \)$. At step $d = n \, dots.h \, 1$, keep all previously chosen data fixed and choose the admissible pair $\( Z_(d - 1) \, T_(d - 1) \)$ so that $cal(I)_(d - 1) \( Z_(d - 1) \)$ is within $epsilon.alt$ of the infimum over the admissible choices at this step. Lemma 8 ensures that this class is nonempty. Its infimum is a finite nonnegative number, so such a choice exists. Consequently, for every admissible replacement $Z'$ at this step,
  #[#set math.equation(numbering: n => "(5.3)")
   $ cal(I)_(d - 1) \( Z_(d - 1) \) lt.eq cal(I)_(d - 1) \( Z' \) + epsilon.alt . $ <eq:near-minimality>]
  Neither an attained minimum nor a limit of filtrations is used.
  === 5.2 Disjoint replacements in the parameter and spatial variables <disjoint-replacements-in-the-parameter-and-spatial-variables>
  Fix a center $c in \| K \|$. The set
  $ cal(F)_c = { h in H \\ { 1 } : L_R \( h c \) ∩ L_R \( c \) eq.not diameter } $
  is finite. Indeed such an intersection implies $rho \( h c \, c \) lt.eq 2 R$; the support-distance bound, the finite graph balls and freeness on vertices then leave only finitely many possibilities for $h$.
  There is a finite clopen partition of $X$ into sets $A$ satisfying $A ∩ h A = diameter$ for every $h in cal(F)_c$. To construct one, use the free action and the zero-dimensional Hausdorff topology to choose, around each $x in X$, a clopen neighborhood disjoint from its translates by this finite set. A finite subcover exists by compactness; the atoms of its common refinement have the required property. Thus
  #[#set math.equation(numbering: n => "(5.4)")
   $ { h A times L_R \( h c \) : h in H } quad upright("is a pairwise disjoint family.") $ <eq:product-disjointness>]
  This partition is fixed independently of $epsilon.alt$. The assertion concerns the product of parameter and spatial variables; the sets $h A$ alone need not be disjoint.
  Fix one atom $A$ and any clopen subset $B subset.eq A$. For $r lt.eq s lt.eq R$ put
  #[#set math.equation(numbering: n => "(5.5)")
   $ M_j \( s \) = integral_B sum_(sigma med upright("top")) a_j^sigma #scale(x: 120%, y: 120%)[\(] Z_j \( x \) ∩ sigma^compose ∩ L_s \( c \) #scale(x: 120%, y: 120%)[\)] thin d mu \( x \) \, #h(2em) 0 lt.eq j lt.eq n . $ <eq:local-areas>]
  For a generic $t in \( r \, R \)$, also put
  $ N_(d - 1) \( t \) = integral_B sum_(sigma med upright("top")) a_(d - 1)^sigma #scale(x: 120%, y: 120%)[\(] Z_d \( x \) ∩ sigma^compose ∩ S_t \( c \) #scale(x: 120%, y: 120%)[\)] thin d mu \( x \) . $
  These sums involve only finitely many original simplices. Unlike (5.2), they run over all such simplices and carry no stabilizer weights.
  At stage $d$, write $P = Z_d$ and $Z = Z_(d - 1)$. For each $x$, make the simultaneous replacement
  #[#set math.equation(numbering: n => "(5.6)")
   $ Z' \( x \) = (Z \( x \) \\ union.big_(h : x in h B) U_t \( h c \)) union (P \( x \) ∩ union.big_(h : x in h B) S_t \( h c \)) . $ <eq:local-replacement>]
  The active closed balls are pairwise disjoint by (5.4). The families of balls and levels are locally finite, and their use is conditioned on clopen sets, so the construction is equivariant and locally constant on every original simplex. Apply Lemma 7 with $T = T_d$, $S = T_(d - 1)$, $P = Z_d$, $Z = Z_(d - 1)$, and the centers and activation sets $\( h c \, h B \)$. Outside a countable set of levels, it represents $Z'$ by an admissible common refinement: the inserted levels have the required dimension drop on faces of $T_d$ and of the old finer triangulation $T_(d - 1)$, and the lemma preserves the diameter bound on components of $P \( x \) \\ Z' \( x \)$.
  We next compute the change in (5.2). Genericity against the faces of $T_(d - 1)$ implies that the old set $Z$ meets any inserted level in dimension at most $d - 2$. When $d = 1$, that intersection is empty. Hence the removed $\( d - 1 \)$-area is unchanged if the open ball is replaced by its closure, and the inserted cut has zero $\( d - 1 \)$-area overlap with the retained old set.
  The normalization in (5.2) makes the removed area exactly $M_(d - 1) \( t \)$ and the inserted area exactly $N_(d - 1) \( t \)$. Here is the orbit-counting identity behind this assertion. Let $Q$ denote the relevant equivariant set, and let $W \( c \)$ denote either the ball or the level. Covariance of area and invariance of $mu$ give
  $ & sum_(sigma med upright("top") med mod med H) frac(1, \| H_sigma \|) sum_(h in H) integral_(h B) a_j^sigma #scale(x: 120%, y: 120%)[\(] Q \( x \) ∩ sigma^compose ∩ W \( h c \) #scale(x: 120%, y: 120%)[\)] thin d mu \( x \)\
 & quad = sum_(sigma med upright("top") med mod med H) frac(1, \| H_sigma \|) sum_(h in H) integral_B a_j^(h^(- 1) sigma) #scale(x: 120%, y: 120%)[\(] Q \( x \) ∩ \( h^(- 1) sigma \)^compose ∩ W \( c \) #scale(x: 120%, y: 120%)[\)] thin d mu \( x \)\
 & quad = integral_B sum_(tau med upright("top")) a_j^tau #scale(x: 120%, y: 120%)[\(] Q \( x \) ∩ tau^compose ∩ W \( c \) #scale(x: 120%, y: 120%)[\)] thin d mu \( x \) . $
  The map $h mapsto h^(- 1) sigma$ takes each value in the simplex orbit exactly $\| H_sigma \|$ times. All local contributions are nonnegative, and only finitely many translates meet any fixed representative simplex. The disjointness and zero-overlap statements above therefore yield
  $ cal(I)_(d - 1) \( Z' \) - cal(I)_(d - 1) \( Z \) = N_(d - 1) \( t \) - M_(d - 1) \( t \) . $
  Combining this identity with (5.3) gives
  #[#set math.equation(numbering: n => "(5.7)")
   $ M_(d - 1) \( t \) lt.eq N_(d - 1) \( t \) + epsilon.alt quad upright("for almost every ") t in \( r \, R \) . $ <eq:local-comparison>]
  === 5.3 Slicing and the strict volume margin <slicing-and-the-strict-volume-margin>
  We have compared the area of a separating set inside a ball with that of a cut through the preceding set. Slicing now connects these comparisons across the successive dimensions.
  Work first in one original top simplex $sigma$ and one of its tree metrics. Decompose $Z_d \( x \) ∩ sigma^compose$ into affine polyhedral pieces on which $f_c = rho \( c \, dot.op \)$ is affine. On a $d$-dimensional piece $Q$, its tangential gradient has norm $alpha lt.eq 1$ by Lemma 5. Euclidean slicing perpendicular to that gradient gives
  $ integral_r^b "vol"_(d - 1) \( Q ∩ { f_c = t } \) thin d t = alpha "vol"_d \( Q ∩ { r < f_c < b } \) lt.eq "vol"_d \( Q ∩ L_b \( c \) \) . $
  A constant branch contributes at only one level. Pieces of dimension less than $d$, including interfaces of this decomposition, have zero $\( d - 1 \)$-slice area outside finitely many exceptional levels. Averaging over the tree metrics, summing over original top interiors, and integrating over $B$ yields
  #[#set math.equation(numbering: n => "(5.8)")
   $ integral_r^b N_(d - 1) \( t \) thin d t lt.eq M_d \( b \) \, #h(2em) r lt.eq b lt.eq R . $ <eq:coarea>]
  These operations are legitimate by local finiteness and local constancy; on the fixed ball only finitely many configurations are involved. Every comparison has taken place in a single simplex metric before averaging, so no compatibility of metrics across original faces is needed. Indeed (4.2) bounds $Z_d$ on a proper original face by dimension $d - 1$, and its generic level slice by dimension $d - 2$. Such faces contribute no area to the preceding comparison. The same dimension estimate says that $Z_0$ misses every proper original face.
  From (5.7) and (5.8),
  $ M_d \( b \) gt.eq integral_r^b M_(d - 1) \( t \) thin d t - epsilon.alt \( b - r \) . $
  Induction, beginning with the monotonicity of $M_0$, gives
  $ M_d \( b \) gt.eq frac(\( b - r \)^d, d !) M_0 \( r \) - epsilon.alt sum_(i = 1)^d frac(\( b - r \)^i, i !) . $
  Set
  $ L = R - r \, #h(2em) A_n = frac(L^n, n !) \, #h(2em) cal(E)_n = sum_(i = 1)^n frac(L^i, i !) . $
  Since $Z_n = \| K \|$, the volume bound (3.5) implies
  #[#set math.equation(numbering: n => "(5.9)")
   $ A_n M_0 \( r \) lt.eq V_R mu \( B \) + epsilon.alt cal(E)_n . $ <eq:iterated-volume>]
  We may now choose
  $ B = A ∩ { x in X : Z_0 \( x \) ∩ L_r \( c \) eq.not diameter } . $
  This set is clopen: finitely many original simplices meet the ball, and their exact filtration data are constant on a common finite clopen partition. Although $B$ uses the completed filtration, its use in an earlier comparison is legitimate. Inequality (5.3) holds for every admissible competitor with the data down to stage $d$ fixed; it imposes no condition on the later stages. The same $B$ can therefore be used in every comparison leading to (5.9).
  Each $x in B$ contributes at least one zero stratum, and each such point lies in a unique original top interior. Thus $mu \( B \) lt.eq M_0 \( r \)$. Moreover $M_0 \( r \)$ is the integral of the point count over all of $A$, because that count is zero on $A \\ B$. The strict inequality $V_R < A_n$ now gives the direct expected-count bound
  #[#set math.equation(numbering: n => "(5.10)")
   $ integral_A \# #scale(x: 120%, y: 120%)[\(] Z_0 \( x \) ∩ L_r \( c \) #scale(x: 120%, y: 120%)[\)] thin d mu \( x \) = M_0 \( r \) lt.eq frac(cal(E)_n, A_n - V_R) thin epsilon.alt . $ <eq:ball-zero-strata>]
  To pass from the ball estimate to (5.1), cover a fixed original top simplex $sigma$ by finitely many open $r$-balls with fixed centers $c_1 \, dots.h \, c_q$. Such a cover exists by compactness of the simplex. For each center, use the fixed clopen partition constructed above, and write $p_i$ for its number of atoms. Sum (5.10) over these atoms and then over the balls. Since the corresponding closed balls also cover $sigma$, this proves (5.1) with
  $ C_sigma = frac(cal(E)_n, A_n - V_R) sum_(i = 1)^q p_i . $
  All quantities in this constant were fixed independently of $epsilon.alt$. In particular, no bound on the number of subdivision simplices or on the cardinality of an individual zero-dimensional fiber is needed. ◻
]

== 6 From separating filtrations to finite chains <sec:chains>

Fix the dimension $n$ and radii chosen in Section 3. For each $epsilon.alt > 0$, use the filtration supplied by Proposition 10. We will turn it into an $H$-equivariant chain map

$ F^epsilon.alt : C_(*) \( K \) arrow.r E_(*) $

that is equivariantly chain homotopic to inclusion. Its evaluation by a fixed invariant cocycle will tend to zero. These two properties prove Theorem 3. Throughout this section $n$ remains fixed while $epsilon.alt$ tends to zero.

=== 6.1 Component averages and their finite support <component-averages-and-their-finite-support>

For a fixed parameter $x$, take the barycentric subdivision of the final triangulation $T_0 \( x \)$. Its vertices are the barycenters $b_F$ of nonempty simplices $F$ of $T_0 \( x \)$. Define

$ ell \( F \) = min { i : b_F in Z_i \( x \) } \, #h(2em) Z_(- 1) \( x \) = diameter . $

All $Z_i \( x \)$ are subcomplexes of $T_0 \( x \)$, so $b_F in Z_i \( x \)$ is equivalent to $F subset.eq Z_i \( x \)$. Let $U_F$ be the connected component of $Z_(ell \( F \)) \( x \) \\ Z_(ell \( F \) - 1) \( x \)$ containing $b_F$. For any such component $U$, set

#[#set math.equation(numbering: n => "(6.1)")
 $ J_U = union.big_(p in U) "supp" p \, #h(2em) u_U = frac(1, \| J_U \|) sum_(v in J_U) delta_v . $ <eq:component-average>]

The next lemma proves that $J_U$ is finite and controls these labels as $x$ varies. The intended image of an oriented barycentric simplex is

#[#set math.equation(numbering: n => "(6.2)")
 $ \[ b_(F_0) \, dots.h \, b_(F_j) \] mapsto u_(U_(F_0)) and dots.h.c and u_(U_(F_j)) in E_j . $ <eq:exterior-replacement>]

This choice uses the separating filtration in a specific way. If nested faces $F subset F'$ have the same level $i$, the segment joining their barycenters lies in $Z_i \\ Z_(i - 1)$. Except at its endpoint $b_F$, it lies in the relative interior of $F'$, which the subcomplex $Z_(i - 1)$ misses; the endpoint also avoids $Z_(i - 1)$ by its level. The two barycenters therefore receive the same component vector, making any exterior term containing both zero. Along a complete flag $F_0 subset dots.h.c subset F_n$, with $dim F_i = i$, the levels are nondecreasing: if $F subset F' subset.eq Z_i$, then $F subset.eq Z_i$. A nonzero image must consequently use all levels $0 \, 1 \, dots.h \, n$, beginning at a point of $Z_0$. We will bound the number of these flags after establishing that the labels define finite chains.

#thm([Lemma 6.1.])[
  #emph[For every original simplex $kappa$ of $K$, there is a finite set $W_kappa subset.eq Y$, independent of $epsilon.alt$ and $x$, such that $J_(U_F) subset.eq W_kappa$ whenever $b_F in kappa$. The triangulation over $kappa$, together with all its assigned vectors $u_(U_F)$, is locally constant in $x$. These assignments are equivariant.]
] <lem:finite-component-labels>

#proof[
  Each component of $Z_i \( x \) \\ Z_(i - 1) \( x \)$ has $rho$-diameter at most $2 R$. For $i = 0$ the components are singletons, since $Z_0 \( x \)$ is a locally finite zero-dimensional subcomplex. If $b_F in kappa$ and $p in U_F$, the support-distance bound from Lemma 4 gives
  $ min d_Y \( "supp" b_F \, "supp" p \) lt.eq sqrt(n) thin rho \( b_F \, p \) lt.eq 2 R sqrt(n) . $
  Choose an original top simplex containing $p$. Its $n + 1$ vertices span a connected graph, so every vertex in $"supp" p$ is within graph distance $n$ of the vertex furnished by this inequality. Consequently we may take
  $ W_kappa = {v in Y : d_Y #scale(x: 120%, y: 120%)[\(] v \, V \( kappa \) #scale(x: 120%, y: 120%)[\)] lt.eq ⌈2 R sqrt(n) + n⌉} . $
  The bounded degree of $Y$ makes this set finite. Notice that the support of $p$ need not itself span a connected graph; we used the containing top simplex.
  Let $K \[ W_kappa \]$ be the finite subcomplex consisting of the simplices whose vertices belong to $W_kappa$. The whole component $U_F$ lies in its realization. It follows that $U_F$ is exactly the component containing $b_F$ in
  $ #scale(x: 120%, y: 120%)[\(] Z_(ell \( F \)) \( x \) \\ Z_(ell \( F \) - 1) \( x \) #scale(x: 120%, y: 120%)[\)] ∩ \| K \[ W_kappa \] \| . $
  Indeed $U_F$ is a connected subset of this restriction, and every connected subset of the restriction containing $b_F$ also lies in the original component. Thus restricting to this finite subcomplex does not cut off a part of the component needed to compute $J_(U_F)$.
  There are finitely many original simplices in $K \[ W_kappa \]$. A common refinement of their finite clopen parameter partitions makes all their triangulation and filtration data constant. On each resulting piece the components and their sets of support vertices are constant as well. This proves local constancy of the assignments over $kappa$. Finally, $J_(h U) = h J_U$, and hence $u_(h U) = h u_U$, proving equivariance. ◻
]

Subdivide each oriented original simplex into its fundamental subdivision chain and apply the exterior assignment (6.2) to every term. This defines a map $f_x : C_(*) \( K \) arrow.r E_(*)$. Both operations commute with the augmented boundary. For subdivision, interior facets cancel in pairs and the boundary facets give the compatible subdivision on each original face. For the second operation, each assigned vector has coefficient sum one, so contraction with the coefficient-sum functional gives

$ partial \( u_0 and dots.h.c and u_j \) = sum_(i = 0)^j \( - 1 \)^i u_0 and dots.h.c and hat(u_i) and dots.h.c and u_j . $

Thus $f_x$ is an augmented chain map.

By Lemma 11, its value on any original simplex is constant on a finite clopen partition and is supported in a fixed finite exterior space. We may therefore define

#[#set math.equation(numbering: n => "(6.3)")
 $ F^epsilon.alt \( c \) = integral_X f_x \( c \) thin d mu \( x \) . $ <eq:averaged-chain-map>]

This integral is an actual finite chain: for every $c$ it is a finite linear combination of finitely many chain values. It commutes with the augmented boundary. Moreover, $f_(h x) \( h c \) = h f_x \( c \)$, so invariance of $mu$ shows that $F^epsilon.alt$ is $H$-equivariant.

=== 6.2 Counting the surviving flags <counting-the-surviving-flags>

We now bound the evaluation of $f_x$ on a top simplex. The number of subdivision simplices may depend on $epsilon.alt$; the following bound depends instead on the number of zero-stratum points. The component-labeling and flag-counting method is modeled on Alpert #cite(label("Alpert2025")) Lemmas 4 and 10; the carrier argument below supplies the bound without a manifold hypothesis.

#thm([Lemma 6.2.])[
  #emph[For every original top simplex $sigma$ and every $x$, at most 
$ 2^n \# #scale(x: 120%, y: 120%)[\(] Z_0 \( x \) ∩ sigma #scale(x: 120%, y: 120%)[\)] $

 terms in its fundamental barycentric subdivision chain have nonzero images under the exterior replacement map.]
] <lem:surviving-flags>

#proof[
  Suppress $x$. Such a term corresponds to a complete flag
  $ F_0 subset F_1 subset dots.h.c subset F_n \, #h(2em) dim F_i = i \, $
  in the restriction of $T_0$ to $sigma$. As shown when defining (6.2), a nonzero term has levels exactly $0 \, 1 \, dots.h \, n$. In particular $F_0 = { z }$ for a point $z in Z_0 ∩ sigma$ and $F_i subset.eq Z_i$ for every $i$.
  By Lemma 9, $z$ lies in the relative interior of a unique $i$-simplex $S_i$ of $T_i$ contained in $Z_i$. To see why this carrier controls the final refinement, let $F_i$ occur in a surviving flag through $z$. The $T_i$-carrier of a relative-interior point of $F_i$ contains $F_i$ by refinement and belongs to $Z_i$, because $Z_i$ is a subcomplex. That carrier has dimension at least $i$, since it contains $F_i$, and at most $i$, since $dim Z_i lt.eq i$. It contains $z$, so it equals $S_i$. Hence $F_i subset.eq S_i$.
  For a fixed preceding face $F_(i - 1)$, the possible $F_i$ are thus full-dimensional simplices in a triangulation of the single affine $i$-simplex $S_i$, having $F_(i - 1)$ as a facet. There is at most one on either side of the affine hyperplane spanned by that facet. Otherwise two simplices on the same side would have intersecting relative interiors near an interior point of the facet. There are therefore at most two choices at each stage and at most $2^n$ surviving flags through $z$. Summing over $z$ proves the assertion. This argument concerns one carrier simplex at a time and uses no manifold assumption on $K$ or on the strata. ◻
]

Figure 1 illustrates the two choices at each of the two stages when $n = 2$.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((-1.4, 1.05), (0, 1.05), (0, 3.15), close: true, fill: rgb("#e8e8ff"), stroke: none)
  line((0, 1.05), (1.4, 1.05), (0, 3.15), close: true, fill: rgb("#d1d1ff"), stroke: none)
  line((-1.4, 1.05), (0, 1.05), (-2.1, 0), close: true, fill: rgb("#ffeede"), stroke: none)
  line((0, 1.05), (1.4, 1.05), (-2.1, 0), close: true, fill: rgb("#ffe1c2"), stroke: none)
  line((0, 1.05), (-2.1, 0), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  line((-2.1, 0), (-2.1, 0), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  line((-2.1, 0), (1.4, 1.05), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  line((1.4, 1.05), (0, 1.05), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  line((0, 1.05), (0, 3.15), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  line((-2.1, 0), (2.1, 0), (0, 3.15), close: true, stroke: (thickness: 0.8pt, miter-limit: 10))
  line((-1.4, 1.05), (1.4, 1.05), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  circle((0, 1.05), radius: 0.07056, fill: black, stroke: none)
  content((0.04989, 1), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[$z$]])], anchor: "north-west")
  content((-0.462, 1.764), [$F_2$])
  content((0.462, 1.764), [$F_2$])
  content((-1.134, 0.651), [$F_2$])
  content((-0.2625, 0.7035), [$F_2$])
  content((-0.693, 1.121), [$F_1$], anchor: "south", padding: 0.1176cm)
  content((0.693, 1.121), [$F_1$], anchor: "south", padding: 0.1176cm)
})],
  caption: [Figure 1: The flag count in dimension two. The point $z in Z_0$ has two possible incident edges $F_1$ along its one-dimensional carrier. Each edge has at most two incident triangles $F_2$ inside the original two-dimensional carrier. The four shaded triangles give the four possible flags through $z$ in this example. The unshaded triangle has no one-dimensional-stratum edge through $z$. ],
) <fig:flags>

Let $psi : E_n arrow.r bb(C)$ be the invariant cocycle in Theorem 3. For an original top simplex $sigma$, put

$ M_sigma = max_(v_0 \, dots.h \, v_n in W_sigma) lr(|psi \( delta_(v_0) and dots.h.c and delta_(v_n) \)|) . $

This is finite, even though $psi$ need not be bounded on all basis simplices of the infinite vertex set. Every vector in (6.1) is a nonnegative convex combination of vertices in $W_sigma$. Multilinearity therefore bounds the evaluation of each surviving term by $M_sigma$. The preceding lemma and Proposition 10 give

#[#set math.equation(numbering: n => "(6.4)")
 $ lr(|psi #scale(x: 120%, y: 120%)[\(] F^epsilon.alt \( sigma \) #scale(x: 120%, y: 120%)[\)]|) & lt.eq 2^n M_sigma integral_X \# #scale(x: 120%, y: 120%)[\(] Z_0 \( x \) ∩ sigma #scale(x: 120%, y: 120%)[\)] thin d mu \( x \)\
 & lt.eq 2^n M_sigma C_sigma epsilon.alt arrow.r 0 . $ <eq:small-chain-evaluation>]

All constants here are independent of $epsilon.alt$. Since chains have finite support, the same convergence holds on every fixed $c in C_n \( K \)$.

=== 6.3 Equivariant comparison and passage to coinvariants <equivariant-comparison-and-passage-to-coinvariants>

It remains to show that the small evaluations just obtained equal the original cocycle evaluation on every coinvariant cycle. We do this by constructing a homotopy before taking coinvariants.

#thm([Lemma 6.3.])[
  #emph[Let $K$ be a simplicial complex with an $H$-action and finite setwise simplex stabilizers. Let $E_(*)$ be the augmented exterior chain complex on a nonempty $H$-set. Any two $H$-equivariant augmented chain maps $A \, B : C_(*) \( K \) arrow.r E_(*)$ that agree in degree $- 1$ are $H$-equivariantly chain homotopic.]
] <lem:equivariant-homotopy>

#proof[
  The target is acyclic as an augmented complex. Indeed, for any fixed vertex $v$, the operator $a mapsto delta_v and a$ satisfies
  $ partial \( delta_v and a \) + delta_v and partial a = a . $
  This contraction need not be equivariant. We use it only to choose finite fillers and then impose equivariance by finite averaging.
  Set $h_(- 1) = 0$. Suppose the homotopy has been constructed below degree $j$. For an oriented $j$-simplex $e$, the residual
  $ r \( e \) = A \( e \) - B \( e \) - h_(j - 1) \( partial e \) $
  is a cycle, by the chain-map identities and the previously constructed homotopy. Choose a finite chain $t$ with $partial t = r \( e \)$. Let $S$ be the setwise stabilizer of $e$ and let $chi : S arrow.r { 1 \, - 1 }$ be its orientation character, so that $s e = chi \( s \) e$. The residual is equivariant, and hence $s r \( e \) = chi \( s \) r \( e \)$. Define
  $ overline(t) = frac(1, \| S \|) sum_(s in S) chi \( s \) thin s t . $
  Then $partial overline(t) = r \( e \)$ and $s overline(t) = chi \( s \) overline(t)$. Choose such a filler for one oriented representative of every simplex orbit, put $h_j \( e \) = overline(t)$, and extend equivariantly and linearly. The orientation-character identity makes the extension well-defined, including when the stabilizer reverses orientation. This gives $A - B = partial h + h partial$ in degree $j$ and completes the induction. ◻
]

#proof[
  The geometric construction applies for every sufficiently large $n$ depending only on $D$, as fixed by (3.6). For nonempty $K$, construct $F^epsilon.alt$ as above. The stabilizers are finite by Lemma 4, and $F^epsilon.alt$ and inclusion $iota$ both induce the identity in augmented degree $- 1$. Lemma 13 supplies an equivariant homotopy
  $ iota - F^epsilon.alt = partial h + h partial . $
  Let $overline(c)$ be a cycle of $C_n \( K \)_H$ and choose a finite chain lift $c in C_n \( K \)$. We do not assume that $c$ is a cycle before taking coinvariants. Its boundary is a finite sum of differences $h a - a$. Equivariance of the homotopy makes $h_(n - 1) \( partial c \)$ another such sum, which the invariant functional $psi$ annihilates. The cocycle identity annihilates $partial h_n \( c \)$. Thus, for every $epsilon.alt > 0$,
  $ psi #scale(x: 120%, y: 120%)[\(] iota \( c \) #scale(x: 120%, y: 120%)[\)] = psi #scale(x: 120%, y: 120%)[\(] F^epsilon.alt \( c \) #scale(x: 120%, y: 120%)[\)] . $
  The right-hand side tends to zero by (6.4), whereas the left-hand side does not depend on $epsilon.alt$. Hence it is zero. The evaluation depends only on the coinvariant class because $psi$ is invariant. For empty $K$ there is no nonzero top chain to consider. ◻
]

== 7 Cycles from an idempotent <sec:idempotents>

We now return to group rings. For an idempotent and one infinite-order conjugacy class, we will construct cycles in every positive even degree. Their vertices follow steps in one fixed graph of bounded degree. In sufficiently high dimension, the supporting complexes will therefore satisfy the hypotheses of Theorem 3. We first record why it suffices to perform this construction for finitely generated groups.

The use of cyclic idempotent expressions and reduced centralizers has its conceptual background in Connes’s pairing with projective classes #cite(label("Connes1985")) Part II, Section 2, Proposition 14 and Burghelea’s conjugacy-class decomposition #cite(label("Burghelea1985")) Theorem I. Our finite path identities and the detector’s normalization are proved directly; no cyclic-homology identification is assumed.

#thm([Lemma 7.1.])[
  (Subgroup locality).  #emph[Let $i : L arrow.r.hook G$ be an inclusion of discrete groups. Extension of scalars defines $i_(*) : K_0 \( bb(C) L \) arrow.r K_0 \( bb(C) G \)$, and for every $y in K_0 \( bb(C) L \)$ and $C in "con" \( G \)$, 
#[#set math.equation(numbering: n => "(7.1)")
 $ "HS"_G \( i_(*) y \) \( C \) = sum_(B in "con" \( L \)\
B subset.eq L ∩ C) "HS"_L \( y \) \( B \) . $ <eq:class-aggregation>]

 Only finitely many terms are nonzero. Moreover, every $x in K_0 \( bb(C) G \)$ is induced from a finitely generated subgroup, which may be required to contain any prescribed finite subset of $G$. Consequently, the finite-order-support assertion of Theorem 1 for all finitely generated groups implies that assertion for all discrete groups.]
] <lem:locality>

#proof[
  We regard free right modules as columns: an idempotent $e in M_r \( bb(C) L \)$ acts on the left, with image $e \( bb(C) L \)^r$. Tensoring the split decomposition defined by $e$ with $bb(C) G$ identifies the extended image with $e \( bb(C) G \)^r$. The coefficient sum in an ambient class $C$ is the sum of its coefficient sums over all $L$-classes contained in $L ∩ C$. This proves (7.1) for the image of an idempotent and then, by subtraction, for every virtual class. Finiteness follows from the finite coefficient support of the matrices representing that class.
  Write an arbitrary $x in K_0 \( bb(C) G \)$ as the difference of the classes of two finite idempotent matrices. The group generated by their coefficient supports and the prescribed finite subset is finitely generated. The same matrices are idempotent over its group ring, since that ring embeds in $bb(C) G$, and their difference induces $x$. Finally, if an ambient class consists of infinite-order elements, so does every subgroup class occurring in (7.1): subgroup inclusion preserves the order of an element. Vanishing of each subgroup coefficient therefore gives vanishing of the ambient coefficient. This uses all the subgroup classes in the sum, since an ambient conjugacy class can split into several of them. ◻
]

=== 7.1 A fixed graph and finite path sums <a-fixed-graph-and-finite-path-sums>

For the rest of this section, fix a finitely generated group $G$, an idempotent $e in M_r \( bb(C) G \)$, and an infinite-order element $g in G$. Write

$ e = sum_(s in G) A_s s \, #h(2em) A_s in M_r \( bb(C) \) \, #h(2em) S_0 = { s in G : A_s eq.not 0 } . $

The set $S_0$ is finite. Idempotence says that $sum_(u v = t) A_u A_v = A_t$ for every $t in G$. Thus the matrix-valued kernel

$ a \( h \, h' \) = A_(h^(- 1) h') $

is invariant under simultaneous left translation and satisfies

#[#set math.equation(numbering: n => "(7.2)")
 $ sum_(k in G) a \( h \, k \) a \( k \, h' \) = sum_(u v = h^(- 1) h') A_u A_v = a \( h \, h' \) . $ <eq:kernel-idempotence>]

All these sums are finite. In particular, the order of the matrix factors agrees with the column convention for right modules.

Put

$ J = C_G \( g \) \, #h(2em) H = J \/ chevron.l g chevron.r \, #h(2em) Y = chevron.l g chevron.r without G \, #h(2em) macron(h) = chevron.l g chevron.r h . $

Choose a finite symmetric generating set $S subset G \\ { 1 }$ containing $S_0 \\ { 1 }$ and its inverses. Give $Y$ the simple undirected graph whose edges join $macron(h)$ to $overline(h s)$ for $s in S$; loops are omitted and repeated edges identified. The graph is connected and has degree at most the fixed integer

$ D = max { 2 \, \| S \| } . $

The group $H$ acts by left multiplication. This is well-defined because $J$ centralizes $g$, and it preserves right-step edges. It is free on vertices: $overline(c h) = macron(h)$ with $c in J$ implies $c h = g^q h$ for an integer $q$, and hence $c = g^q$. Both $H$ and $Y$ are countable. We keep this graph and this value of $D$ throughout all subsequent choices of dimension.

For $k gt.eq 1$, let $Q_k = J without G^k$, with simultaneous left translation on tuples. Define the weight of a tuple by

#[#set math.equation(numbering: n => "(7.3)")
 $ w_k \( h_0 \, dots.h \, h_(k - 1) \) = "tr" #scale(x: 120%, y: 120%)[\(] a \( h_0 \, h_1 \) dots.h.c a \( h_(k - 2) \, h_(k - 1) \) a \( h_(k - 1) \, g h_0 \) #scale(x: 120%, y: 120%)[\)] \, $ <eq:path-weight>]

where $w_1 \( h_0 \) = "tr" \( a \( h_0 \, g h_0 \) \)$. These weights are $J$-invariant. They define a finite complex linear combination $v_k$ of elements of $Q_k$. Indeed, a nonzero weight has increments

$ s_i = h_i^(- 1) h_(i + 1) quad \( 0 lt.eq i < k - 1 \) \, #h(2em) s_(k - 1) = h_(k - 1)^(- 1) g h_0 $

in $S_0$, with

$ s_0 dots.h.c s_(k - 1) = h_0^(- 1) g h_0 . $

An increment list determines the tuple from $h_0$. Any two choices of $h_0$ with this conjugate differ by left multiplication in $J$, so the list determines at most one element of $Q_k$. Hence $v_k$ has at most $\| S_0 \|^k$ nonzero coefficients. For a $J$-invariant function $p$ on $G^k$, write $v_k \( p \)$ for the finite weighted sum of its values. These weights need not be real or positive.

#thm([Lemma 7.2.])[
  (Path identities).  #emph[For the path sums associated to $e$ and $g$, the twisted cyclic shift 
$ T \( h_0 \, dots.h \, h_(k - 1) \) = \( h_1 \, dots.h \, h_(k - 1) \, g h_0 \) $

 preserves $v_k$. For $k gt.eq 2$, deletion of any entry induces a map $d_i : Q_k arrow.r Q_(k - 1)$ satisfying 
$ \( d_i \)_(*) v_k = v_(k - 1) #h(2em) \( 0 lt.eq i < k \) . $

 Every $v_k$ has the same total weight 
#[#set math.equation(numbering: n => "(7.4)")
 $ lambda := v_k \( 1 \) = sum_(s in \[ g \]_G) "tr" \( A_s \) = "HS"_G #scale(x: 120%, y: 120%)[\(] \[ e \( bb(C) G \)^r \] #scale(x: 120%, y: 120%)[\)] \( \[ g \]_G \) . $ <eq:trace-coefficient>]

]
] <lem:path-identities>

#proof[
  The shift $T$ is a $J$-equivariant bijection, with inverse
  $ \( h_0 \, dots.h \, h_(k - 1) \) mapsto \( g^(- 1) h_(k - 1) \, h_0 \, dots.h \, h_(k - 2) \) . $
  For $k = 1$, the shift is the identity on $Q_1$, since $g in J$. For $k gt.eq 2$, the shifted weight has the factors of (7.3) in cyclic order, since $a \( g h_0 \, g h_1 \) = a \( h_0 \, h_1 \)$. Cyclicity of the matrix trace proves $T_(*) v_k = v_k$.
  For deletion, fix a representative of the shorter tuple. Each orbit in its fibre has a unique representative with exactly those retained entries, because simultaneous left translation acts freely on any nonempty tuple. Thus the fibre sum is over the missing entry in $G$, without a stabilizer factor. Internal deletions follow from (7.2), as does deletion of the last entry using
  $ sum_u a \( h_(k - 2) \, u \) a \( u \, g h_0 \) = a \( h_(k - 2) \, g h_0 \) . $
  For the first deletion, fix $\( h_1 \, dots.h \, h_(k - 1) \)$ and put $B = a \( h_1 \, h_2 \) dots.h.c a \( h_(k - 2) \, h_(k - 1) \)$, with $B = I_r$ when $k = 2$. Then
  $ & sum_(h_0) "tr" #scale(x: 120%, y: 120%)[\(] a \( h_0 \, h_1 \) B a \( h_(k - 1) \, g h_0 \) #scale(x: 120%, y: 120%)[\)]\
 & #h(2em) = sum_(h_0) "tr" #scale(x: 120%, y: 120%)[\(] B a \( h_(k - 1) \, g h_0 \) a \( g h_0 \, g h_1 \) #scale(x: 120%, y: 120%)[\)]\
 & #h(2em) = "tr" #scale(x: 120%, y: 120%)[\(] B a \( h_(k - 1) \, g h_1 \) #scale(x: 120%, y: 120%)[\)] . $
  Here the first equality uses trace cyclicity and left invariance; the second uses (7.2) with the substitution $u = g h_0$. This also proves the assertion for $k = 2$. The kernel has finite row and column support, so every fibre sum used in these computations is finite.
  The deletion identities show that all total weights equal $v_1 \( 1 \)$. Finally,
  $ J without G arrow.r \[ g \]_G \, #h(2em) J h mapsto h^(- 1) g h $
  is a bijection: equality of the conjugates is equivalent to $h' h^(- 1) in J$. Therefore $v_1 \( 1 \) = sum_(s in \[ g \]_G) "tr" \( A_s \)$, which is precisely the indicated Hattori–Stallings coefficient. ◻
]

=== 7.2 Even-dimensional cycles <even-dimensional-cycles>

The path identities now turn the finite sums into cycles. We use the exterior complex $E_(*)$ on the graph $Y$. For $k gt.eq 1$, define

$ pi_k : bb(C)^(\( Q_k \)) arrow.r \( E_(k - 1) \)_H \, #h(2em) \[ h_0 \, dots.h \, h_(k - 1) \] mapsto \[ delta_(macron(h)_0) and dots.h.c and delta_(macron(h)_(k - 1)) \] . $

The map is well-defined because changing a tuple by an element of $J$ changes its projected vertices by a simultaneous $H$-translation. Set $b_k = pi_k \( v_k \)$, and, for $n = 2 m gt.eq 2$, set

$ z_n = b_(n + 1) in \( E_n \)_H . $

#thm([Proposition 7.3.])[
  #emph[For every positive even integer $n$, the chain $z_n$ is a cycle. Moreover, either its defining sum has no nonzero distinct-vertex terms, so $z_n = 0$, or it is the image of a cycle in $C_n \( K \)_H$ for an $H$-invariant simplicial complex $K$ generated by $n$-simplices, with finitely many simplex orbits, whose top vertex sets span connected subgraphs of $Y$. The graph and its degree bound $D$ are independent of $n$.]
] <prop:path-cycle>

#proof[
  Since $overline(g h_0) = macron(h)_0$, the twisted shift projects to the cyclic permutation of the $k$ wedge factors. Hence
  $ pi_k T = \( - 1 \)^(k - 1) pi_k . $
  Together with $T_(*) v_k = v_k$, this shows that $b_k = 0$ whenever $k$ is even. The deletion identities give
  $ partial b_k = sum_(i = 0)^(k - 1) \( - 1 \)^i b_(k - 1) #h(2em) \( k gt.eq 2 \) . $
  For even $n$, it follows that $partial z_n = b_n = 0$.
  A tuple with repeated projected vertices contributes zero to the wedge. For every remaining tuple with nonzero weight, consecutive projected vertices are joined by edges from the fixed step set $S$. Their path visits all its $n + 1$ vertices, so the subgraph spanned by those vertices is connected. Let $K$ be generated by these vertex sets and their $H$-translates. Finite support of $v_(n + 1)$ gives finitely many orbits of top simplices and of their faces.
  The same finite expression for $z_n$ defines a chain in $C_n \( K \)_H$. To see that its boundary is zero there, decompose $E_j$ in every degree as the direct sum of the span of the oriented simplices belonging to $K$ and the span of all other oriented simplices. Both summands are $H$-invariant, including their orientation signs. Thus
  $ E_j = C_j \( K \) xor W_j \, #h(2em) \( E_j \)_H = C_j \( K \)_H xor \( W_j \)_H . $
  In particular the inclusion remains injective after taking coinvariants. The boundary of the chain in $C_n \( K \)_H$ maps to $partial z_n = 0$, so it is zero already in $C_(n - 1) \( K \)_H$. ◻
]

We have obtained the required sparse cycles in arbitrarily large even degrees. The underlying path sums all have total weight $lambda$, the trace coefficient in (7.4). The next section constructs a cocycle whose value on $z_(2 m)$ recovers a nonzero scalar multiple of that coefficient.

== 8 A Pfaffian cocycle detecting the trace coefficient <sec:detector>

Retain the finitely generated group $G$, idempotent, infinite-order element $g$, and notation $J \, H \, Y \, v_k \, lambda \, z_(2 m)$ of Section 7. We construct an $H$-invariant cocycle whose value on $z_(2 m)$ is $2^(- m) lambda$. The construction first records the relative powers of $g$ between two lifts of vertices of $Y$. An alternating Pfaffian expression will then remove the dependence on those lifts.

=== 8.1 Relative exponents between lifts <relative-exponents-between-lifts>

#thm([Lemma 8.1.])[
  #emph[There is a $J$-invariant function $beta : G times G arrow.r bb(R)$ such that 
#[#set math.equation(numbering: n => "(8.1)")
 $ beta \( h' \, h \) = - beta \( h \, h' \) \, #h(2em) beta \( g^r h \, g^s h' \) = beta \( h \, h' \) + s - r quad \( r \, s in bb(Z) \) . $ <eq:beta-properties>]

]
] <lem:beta>

#proof[
  The diagonal $H$-action on the set of ordered pairs $Y times Y$ is free, because its action on the first coordinate is free. This also applies to diagonal pairs $\( y \, y \)$. For each orbit choose a representative $\( y_o \, y'_o \)$ and lifts $\( l_o \, l'_o \) in G^2$. For $\( h \, h' \) in G^2$, there is a unique $macron(c) in H$ carrying the appropriate representative to the projected pair. Choose a lift $c in J$ and write
  $ h = g^r c l_o \, #h(2em) h' = g^s c l'_o . $
  For fixed $c$, the integers $r \, s$ are unique because $g$ has infinite order. Replacing $c$ by $g^t c$ replaces them by $r - t \, s - t$. Thus $B \( h \, h' \) = s - r$ is well defined. Commutation with $g$ shows that $B$ is $J$-invariant, and independently changing the two lifts gives
  $ B \( g^a h \, g^b h' \) = B \( h \, h' \) + b - a . $
  The antisymmetrization
  $ beta \( h \, h' \) = frac(B \( h \, h' \) - B \( h' \, h \), 2) $
  has all the required properties. ◻
]

The function $beta$ itself need not descend to $Y times Y$. In fact, (8.1) gives $beta \( h \, g^k h \) = k$ even though these two lifts project to the same vertex. Nor is there a difficulty if an element $macron(c) in H$ exchanges two distinct projected vertices. If a lift $c in J$ satisfies $c h_0 = g^a h_1$ and $c h_1 = g^b h_0$, its invariance merely requires

$ 2 beta \( h_0 \, h_1 \) = b - a \, $

which is precisely what antisymmetrization gives. Real values are useful here: for $G = chevron.l t chevron.r$ and $g = t^2$, the value $beta \( 1 \, t \) = 1 \/ 2$ is forced.

=== 8.2 The cyclic Pfaffian identity <the-cyclic-pfaffian-identity>

In degree two, a lift-independent expression is

$ c \( y_0 \, y_1 \, y_2 \) = beta \( h_1 \, h_2 \) - beta \( h_0 \, h_2 \) + beta \( h_0 \, h_1 \) \, #h(2em) macron(h)_i = y_i . $

Changing $h_i$ to $g^(r_i) h_i$ adds $\( r_2 - r_1 \) - \( r_2 - r_0 \) + \( r_1 - r_0 \) = 0$, so $c$ depends only on the projected vertices. In higher even degrees we replace $beta$ by a Pfaffian and take the same alternating deletion sum. The Pfaffian still depends on the lifts; its deletion sum will define the cocycle. We first compute the weighted Pfaffian sum, then prove the descent and cocycle properties of its deletion sum.

For a list $upright(bold(h)) = \( h_0 \, dots.h \, h_(2 m - 1) \)$ with $m gt.eq 1$, let

$ p_m \( upright(bold(h)) \) = "Pf" #scale(x: 120%, y: 120%)[\(] beta \( h_i \, h_j \) #scale(x: 120%, y: 120%)[\)]_(0 lt.eq i \, j < 2 m) \, #h(2em) p_0 = 1 . $

We use the convention that $p_m \( upright(bold(h)) \)$ is the coefficient of $epsilon_0 and dots.h.c and epsilon_(2 m - 1)$ in $b^m \/ m !$, where $epsilon_i$ are the coordinate one-forms on the space of list positions and

$ b = sum_(i < j) beta \( h_i \, h_j \) thin epsilon_i and epsilon_j . $

In particular, $p_1 \( h_0 \, h_1 \) = beta \( h_0 \, h_1 \)$, and $p_m$ is alternating in its entries and $J$-invariant. The finite weighted sums

$ q_m = v_(2 m) \( p_m \) quad \( m gt.eq 1 \) \, #h(2em) q_0 = lambda $

are therefore defined. No boundedness of $p_m$ on all lists is needed.

#thm([Lemma 8.2.])[
  #emph[For every $m gt.eq 1$, one has $q_m = 1 / 2 q_(m - 1)$ and hence $q_m = 2^(- m) lambda$.]
] <lem:pfaffian-recurrence>

#proof[
  An ordinary cyclic rotation of a list of length $2 m$ changes its Pfaffian by the sign $\( - 1 \)^(2 m - 1) = - 1$. In the twisted rotation
  $ T upright(bold(h)) = \( h_1 \, dots.h \, h_(2 m - 1) \, g h_0 \) \, $
  replacing the last entry $h_0$ by $g h_0$ adds $1$ to every matrix entry in the last column above the diagonal. Expansion along that column gives
  #[#set math.equation(numbering: n => "(8.2)")
   $ p_m \( T upright(bold(h)) \) =  & - p_m \( upright(bold(h)) \)\
 & + sum_(i = 1)^(2 m - 1) \( - 1 \)^(i + 1) p_(m - 1) \( h_1 \, dots.h \, hat(h_i) \, dots.h \, h_(2 m - 1) \) . $ <eq:pfaffian-rotation>]
  Indeed the last-column cofactor in position $i$, with positions numbered $1 \, dots.h \, 2 m$, has sign $\( - 1 \)^(i + 1)$; each Pfaffian matching uses exactly one entry from that column.
  For $m gt.eq 2$, each minor on the second line omits $h_0$ and $h_i$ from the original list. Applying the deletion identity in Lemma 15 twice shows that its weighted sum under $v_(2 m)$ is $q_(m - 1)$. For $m = 1$, the minor is $p_0 = 1$, whose weighted sum is the total weight $v_2 \( 1 \) = lambda = q_0$. Thus this endpoint uses no vector $v_0$. The invariance of $v_(2 m)$ under $T$ and $sum_(i = 1)^(2 m - 1) \( - 1 \)^(i + 1) = 1$ now turn (8.2) into
  $ q_m = - q_m + q_(m - 1) . $
  The claimed formulas follow. ◻
]

=== 8.3 Descent to an exterior cocycle <descent-to-an-exterior-cocycle>

The preceding calculation detects the coefficient on lists of lifts. We next descend it to the exterior complex on $Y$, where the sparse-chain theorem applies.

#thm([Proposition 8.3.])[
  #emph[For every integer $m gt.eq 1$, the formula 
#[#set math.equation(numbering: n => "(8.3)")
 $ psi_m \( y_0 \, dots.h \, y_(2 m) \) = sum_(i = 0)^(2 m) \( - 1 \)^i p_m \( h_0 \, dots.h \, hat(h_i) \, dots.h \, h_(2 m) \) \, $ <eq:detector-formula>]

 where $h_i in G$ is any lift of $y_i in Y$, defines an $H$-invariant linear functional $psi_m : E_(2 m) arrow.r bb(C)$ satisfying 
$ psi_m partial = 0 \, #h(2em) psi_m \( z_(2 m) \) = 2^(- m) lambda . $

 Here evaluation on the coinvariant chain $z_(2 m)$ is defined by $H$-invariance.]
] <prop:detector>

#proof[
  On the $2 m + 1$ list positions put
  $ u = sum_(i = 0)^(2 m) epsilon_i \, #h(2em) b = sum_(0 lt.eq i < j lt.eq 2 m) beta \( h_i \, h_j \) thin epsilon_i and epsilon_j . $
  The right side of (8.3) is the coefficient of the ordered top form in $u and b^m \/ m !$. Moving the factor $epsilon_i$ past its $i$ preceding positions gives exactly the sign $\( - 1 \)^i$ in that formula.
  Changing the lifts to $g^(r_i) h_i$ replaces $beta \( h_i \, h_j \)$ by $beta \( h_i \, h_j \) + r_j - r_i$. Thus it replaces $b$ by $b + u and v$, with $v = sum_i r_i epsilon_i$. Every correction term in $u and \( b + u and v \)^m$ contains two factors $u$ and vanishes. This proves independence of the lifts.
  The expression is alternating in the lifted list. After lift independence has been established, it is therefore alternating in the projected vertices as well. In particular, if two projected vertices coincide, choose equal lifts for them to see that the expression vanishes. It consequently defines a linear functional on $E_(2 m) = and.big^(2 m + 1) bb(C)^(\( Y \))$. For $macron(c) in H$, choose $c in J$ and use $c h_i$ as the lifts of the translated vertices. The $J$-invariance of $beta$ proves the $H$-invariance of $psi_m$.
  To check the cocycle identity, choose lifts simultaneously for a list of $2 m + 2$ vertices. On every face, (8.3) is the alternating deletion coboundary of $p_m$ on these same lifts. A second deletion cancels each twice-omitted list in its two possible orders. Hence $psi_m partial = 0$.
  Finally, $z_(2 m)$ is the exterior projection of $v_(2 m + 1)$. Each one-deletion term in (8.3) has weighted sum $v_(2 m) \( p_m \) = q_m$, by Lemma 15. Since $sum_(i = 0)^(2 m) \( - 1 \)^i = 1$, their signed sum gives
  $ psi_m \( z_(2 m) \) = q_m = 2^(- m) lambda \, $
  using Lemma 18. Repeated projected vertices already have zero exterior image and zero value under $psi_m$, so they require no separate restriction in this evaluation. ◻
]

== 9 Completion of the trace theorem <sec:completion>

We now combine the geometric vanishing with the detector. The order of the choices matters: the graph is fixed by the idempotent before its cycle dimension is chosen.

#proof[
  First let $G$ be finitely generated, let $e in M_q \( bb(C) G \)$ be an idempotent, and fix an infinite-order $g in G$. Construct the graph on $Y = chevron.l g chevron.r without G$ and the free action of $H = C_G \( g \) \/ chevron.l g chevron.r$ as in Section 7. Let $D gt.eq 2$ be a degree bound for this fixed graph, and choose an even integer $n = 2 m gt.eq n_0 \( D \)$ with $m gt.eq 1$.
  Proposition 16 gives the cycle $z_n$, and Proposition 19 gives an $H$-invariant cocycle $psi_m : E_n arrow.r bb(C)$ with
  $ psi_m \( z_n \) = 2^(- m) lambda \, #h(2em) lambda = "HS"_G \( \[ e \( bb(C) G \)^q \] \) \( \[ g \]_G \) . $
  If no nonzero simplices occur, $z_n = 0$ and this identity already gives $lambda = 0$. Otherwise Proposition 16 realizes $z_n$ as a cycle in $C_n \( K \)_H$ for an $H$-invariant complex $K$ satisfying all hypotheses of Theorem 3. That theorem gives $psi_m \( z_n \) = 0$, with the same conclusion. Every finitely generated projective right $bb(C) G$-module is represented by an idempotent, and every element of $K_0 \( bb(C) G \)$ is a difference of two such classes. Additivity proves the assertion for all finitely generated groups.
  For an arbitrary discrete group $G$, choose idempotents representing $x in K_0 \( bb(C) G \)$ and let $G_0 lt.eq G$ be generated by $g$ and all group elements occurring in their entries. Then $G_0$ is finitely generated and $x = i_(*) x_0$ for some $x_0 in K_0 \( bb(C) G_0 \)$, where $i : G_0 arrow.r.hook G$. Lemma 14 expresses $"HS"_G \( x \) \( \[ g \]_G \)$ as the sum of the coefficients $"HS"_(G_0) \( x_0 \) \( C \)$ over those $G_0$-conjugacy classes $C subset.eq G_0 ∩ \[ g \]_G$. Only finitely many terms are nonzero, and every element in every such class has infinite order. Each term vanishes by the finitely generated case. ◻
]

=== 9.1 The integral trace <the-integral-trace>

For the integral group ring, the same idempotent formula defines

$ "HS"_(bb(Z) G) : K_0 \( bb(Z) G \) arrow.r bb(Z) G \/ \[ bb(Z) G \, bb(Z) G \] tilde.equiv xor.big_(C in "con" \( G \)) bb(Z) C \, $

where commutators are now taken with their additive span. The integral Bass trace conjecture asks for support only at the identity class.

#thm([Corollary 9.1.])[
  #emph[For every discrete group $G$, the Hattori–Stallings trace of every class in $K_0 \( bb(Z) G \)$ is supported on $\[ 1 \]_G$.]
] <cor:integral>

#proof[
  If $P$ is a finitely generated projective right $bb(Z) G$-module, the same idempotent matrix over $bb(C) G$ represents $P ⊗_(bb(Z) G) bb(C) G$. Consequently its trace coefficients are the images under $bb(Z) arrow.r.hook bb(C)$ of those of $P$. Theorem 1 and this coefficientwise injection give vanishing at all infinite-order elements. No injectivity assertion about the map between the two $K_0$ groups is required.
  For finite-order elements we use Linnell’s restriction #cite(label("Linnell1983")) Lemma 4.1, in the form stated and reproved by Berrick and Hesselholt #cite(label("BH2015")) Theorem A: if the integral trace of a finitely generated projective module is nonzero at $h$, there is an integer $a gt.eq 1$ such that $h$ is conjugate to $h^(s^a)$ for every integer $s gt.eq 1$. Their convention also uses right modules. If $h$ has finite order $t > 1$, take $s = t$. Then $h^(t^a) = 1$, so the restriction would make $h$ conjugate to $1$, a contradiction. Thus every nonidentity finite-order coefficient also vanishes. Taking differences of projective classes finishes the proof. ◻
]

=== 9.2 Homotopy idempotents and Lefschetz numbers <homotopy-idempotents-and-lefschetz-numbers>

The integral support statement also has fixed-point consequences. A self-map $f$ is a #emph[homotopy idempotent] if $f compose f tilde.eq f$. Such a map on a connected finite CW complex $X$ admits maps $u : X arrow.r Y$ and $v : Y arrow.r X$ with

$ v compose u tilde.eq f \, #h(2em) u compose v tilde.eq "id"_Y $

#cite(label("BCM2006")) Section 3. The second identity says that $Y$ is #emph[finitely dominated] by $X$. For a pointed homotopy idempotent with $f_(\#) = "id"_G$, where $G = pi_1 \( X \)$, the induced maps $u_(\#)$ and $v_(\#)$ identify $pi_1 \( Y \)$ with $G$. The universal-cover chains of $Y$ are chain homotopy equivalent to a finite complex $P_(*)$ of finitely generated projective $bb(Z) G$-modules. The sum $sum_i \( - 1 \)^i \[ P_i \] in K_0 \( bb(Z) G \)$ is its projective Euler class. The Hattori–Stallings trace of this class records the fixed-point class indices of $f$: it is the Reidemeister trace, with conjugacy classes inverted when passing from the left-module convention of #cite(label("BCM2006")) Lemma 4.1 to ours. The augmentation trace and the identity coefficient of this projective class give the ordinary and $L^2$-Lefschetz numbers, respectively #cite(label("BCM2006")) Lemmas 8.1–8.2. Berrick, Chatterji and Mislin use these relations to deduce the following consequences of the integral support statement and its numerical trace consequence.

#thm([Corollary 9.2.])[
  (Berrick–Chatterji–Mislin consequences).  #emph[Let $M$ be a connected closed smooth oriented manifold.]
  + #emph[If $dim M > 2$ and $f : M arrow.r M$ satisfies $f compose f tilde.eq f$ by free homotopy, then some self-map freely homotopic to $f$ has exactly one fixed point.]
  + #emph[Choose $x_0 in M$ and put $G = pi_1 \( M \, x_0 \)$. If $f : \( M \, x_0 \) arrow.r \( M \, x_0 \)$ satisfies $f compose f tilde.eq_(*) f$ by based homotopy and $f_(\#) = "id"_G$, then 
$ L \( f \) = L^(\( 2 \)) \( tilde(f) \) . $

 Here $tilde(f)$ is the lift to the universal cover fixing a chosen point above $x_0$; it is $G$-equivariant. The left side is the ordinary Lefschetz number, and the right side is the alternating sum of von Neumann traces on the induced $L^2$-homology maps, as in #cite(label("BCM2006")) Definition 7.1.]
] <cor:homotopy-idempotents>

#proof[
  For $x in K_0 \( bb(Z) G \)$ write $h_C \( x \) = "HS"_(bb(Z) G) \( x \) \( C \)$. The augmentation trace $epsilon.alt$ is the sum of these coefficients, while the Kaplansky trace $kappa$ is the identity coefficient. The sum is finite, and Corollary 20 gives
  $ epsilon.alt \( x \) = sum_(C in "con" \( G \)) h_C \( x \) = h_(\[ 1 \]_G) \( x \) = kappa \( x \) . $
  This is the weak Bass conjecture for every group. The cited paper uses projective left modules, whereas we use right modules. The anti-involution $g mapsto g^(- 1)$, together with transpose on idempotent matrices, transports between these conventions and relabels the coefficient at $\[ g \]_G$ by $\[ g^(- 1) \]_G$. It preserves identity support and both $epsilon.alt$ and $kappa$. Thus Corollary 20 gives the classical Bass conjecture in the cited convention, and the displayed equality gives weak Bass there. The forward implications of #cite(label("BCM2006")) Theorem 1 and #cite(label("BCM2006")) Theorem 2 now give (i) and (ii), respectively. ◻
]

== 10 Torsion-free groups: trace rank and idempotents <sec:torsion-free>

For a torsion-free group, the support theorem leaves only the identity conjugacy class. We first identify its coefficient with augmentation rank, and then use the two possible scalar ranks to determine scalar idempotents.

#proof[
  Let $e in M_q \( bb(C) G \)$ be idempotent and put $x = \[ e \( bb(C) G \)^q \] in K_0 \( bb(C) G \)$. Since $G$ is torsion-free, Theorem 1 says that $"HS"_G \( x \)$ is supported on $\[ 1 \]_G$. Therefore
  #[#set math.equation(numbering: n => "(10.1)")
   $ tau_(G \, q) \( e \) & = "HS"_G \( x \) \( \[ 1 \]_G \)\
 & = sum_(C in "con" \( G \)) "HS"_G \( x \) \( C \)\
 & = epsilon.alt_G #h(-0.16667em) (sum_(i = 1)^q e_(i i)) = "tr" #scale(x: 120%, y: 120%)[\(] epsilon.alt_(G \, q) \( e \) #scale(x: 120%, y: 120%)[\)] = "rank"_(bb(C)) #scale(x: 120%, y: 120%)[\(] epsilon.alt_(G \, q) \( e \) #scale(x: 120%, y: 120%)[\)] . $ <eq:torsion-free-rank>]
  The class sum is finite because the entries of $e$ have finite group support. The last equality holds because $epsilon.alt_(G \, q) \( e \)$ is an idempotent complex matrix: its image-kernel decomposition makes its trace equal to its rank. Taking differences of projective classes gives $tau_(G \, *) = "rk"_epsilon.alt$. This map has range exactly $bb(Z)$, since its values are integers and $\[ bb(C) G \]$ has value $1$. ◻
]

For matrices the conclusion is numerical. For example, $"diag" \( 1 \, 0 \) in M_2 \( bb(C) G \)$ is an idempotent other than zero and the identity, with augmentation rank one. The scalar case is special because its augmentation rank can only be zero or one.

#proof[
  First take $R = bb(C)$ and let $e in bb(C) G$ be idempotent. Equation (10.1) with $q = 1$ gives
  $ tau_G \( e \) = epsilon.alt_G \( e \) in { 0 \, 1 } . $
  We use the standard faithful-trace argument, as in #cite(label("BV1998")) Theorem 2.1 and Remark 2.2, spelling out a similarity to a projection. Embed $bb(C) G$ by left convolution in the group von Neumann algebra $cal(N) \( G \)$, the commutant of the right regular representation on $ell^2 \( G \)$. Its canonical normalized trace is
  $ tau_G \( T \) = chevron.l T delta_1 \, delta_1 chevron.r . $
  Its faithfulness can be seen directly: if $T gt.eq 0$ and $tau_G \( T \) = 0$, then $T^(1 \/ 2) delta_1 = 0$. Since $T^(1 \/ 2)$ commutes with right translations and their translates of $delta_1$ span a dense subspace, $T^(1 \/ 2) = 0$, hence $T = 0$.
  Set
  $ a = e^(*) e + \( 1 - e \)^(*) \( 1 - e \) . $
  For every $xi in ell^2 \( G \)$,
  $ chevron.l a xi \, xi chevron.r = parallel e xi parallel^2 + parallel \( 1 - e \) xi parallel^2 gt.eq 1 / 2 parallel xi parallel^2 . $
  Thus $a$ is positive and invertible in $cal(N) \( G \)$, and a direct multiplication gives $a e = e^(*) a$. With $s = a^(1 \/ 2)$, the element $p = s e s^(- 1)$ satisfies $p^2 = p$ and $p^(*) = s^(- 1) e^(*) s = s e s^(- 1) = p$. Hence $p$ is a projection, and traciality gives $tau_G \( p \) = tau_G \( e \)$. If this value is zero, faithfulness applied to $p = p^(*) p$ gives $p = 0$. If it is one, faithfulness applied to $1 - p$ gives $p = 1$. Similarity then gives $e = 0$ or $e = 1$.
  Now let $R$ be any commutative unital domain of characteristic zero and write an idempotent $f in R G$ as $f = sum_(g in S) r_g g$ with $S$ finite. Put
  $ R_0 = bb(Z) \[ r_g : g in S \] subset.eq R \, #h(2em) F = "Frac" \( R_0 \) . $
  The field $F$ is finitely generated over $bb(Q)$, and therefore embeds in $bb(C)$. Indeed, send a finite transcendence basis of $F \/ bb(Q)$ to an algebraically independent tuple of complex numbers; the resulting embedding of the rational function field extends across the finite algebraic extension $F$ because $bb(C)$ is algebraically closed. The coefficientwise maps $R_0 G arrow.r.hook R G$ and $R_0 G arrow.r.hook bb(C) G$ are injective. Thus $f^2 = f$ already holds in $R_0 G$, and its image in $bb(C) G$ is an idempotent. The complex case makes that image $0$ or $1$, and injectivity gives the same conclusion for $f$. Only the finitely generated coefficient field $F$ was embedded; no embedding of all of $R$ into $bb(C)$ is required. ◻
]

#prodef([Remark 10.1.])[
  (Algebraic and completed trace ranges).  Continue to assume that $G$ is torsion-free. Let $j : bb(C) G arrow.r.hook C_r^(*) \( G \)$ be the inclusion into the reduced group $C^(*)$-algebra, and let
  $ j_(*) : K_0 \( bb(C) G \) arrow.r K_0^(upright("top")) \( C_r^(*) \( G \) \) $
  be the comparison map to topological $K$-theory. Write $tau_(*)^(upright("top")) : K_0^(upright("top")) \( C_r^(*) \( G \) \) arrow.r bb(R)$ for the canonical trace pairing. It agrees with $tau_(G \, *)$ on this image: the same positive similarity used above, applied in a matrix algebra over $C_r^(*) \( G \)$, produces a projection representing the image of a matrix idempotent, and traciality preserves its trace. Consequently
  $ tau_(*)^(upright("top")) #h(-0.16667em) (j_(*) K_0 \( bb(C) G \)) = bb(Z) . $
  This is the integer range on the algebraic image, not a statement about every class of $K_0^(upright("top")) \( C_r^(*) \( G \) \)$. In particular, the argument does not presume that the algebraic augmentation extends to the reduced completion. The stronger completed idempotent question is the Kadison–Kaplansky conjecture; see #cite(label("OW2023")) Section 1.
  The coefficient reduction above uses characteristic zero. An idempotent $e in.not { 0 \, 1 }$ would give nonzero zero divisors through $e \( 1 - e \) = 0$, so the zero-divisor conjecture would imply the idempotent conjecture. The reverse implication is not established here.
]


#bibliography("refs.bib", style: "ieee", title: [References])
