#set page(paper: "us-letter", margin: (x: 82.2pt, y: 82.2pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Integral Donovan Finiteness over Witt Vectors]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

#strong[Article identifier:] #raw("Integral-Donovan-Finiteness-over-Witt-Vectors-September-25-2026")

== 1 Introduction <sec:introduction>

Fix a prime $p$, put $k = overline(bb(F))_p$, and let $cal(O) = W \( k \)$ be its ring of Witt vectors.
  A block of a finite group $G$ over $cal(O)$ is an algebra $cal(O) G b$,
  where $b$ is a primitive central idempotent. Its reduction $k G macron(b)$ has a defect group,
  well defined up to conjugacy, and we use the same defect group for the integral block.
  All Morita equivalences in this paper are equivalences of categories of finitely generated modules which are
  linear over the specified coefficient ring.

Fixing the defect group is expected to leave only finitely many Morita types of blocks.
  This is Donovan’s finiteness problem. Over $cal(O)$ it concerns integral module categories,
  including their lattice structure, and hence is stronger than the corresponding assertion over the residue
  field. Our main theorem is the integral assertion for the Witt ring $W \( k \)$.

#thm([Theorem 1.1.])[
  #emph[Let $p$ be a prime, let $cal(O) = W \( overline(bb(F))_p \)$, and let $M gt.eq 1$ be an integer.
    As $G$ ranges over all finite groups and $b$ ranges over all blocks of $cal(O)
    G$ whose defect groups have order at most $M$, the algebras $cal(O) G
    b$ belong to only finitely many $cal(O)$-linear Morita equivalence classes.]
] <thm:main>

The theorem includes every prime, including $2$, and every block, including nonprincipal blocks.
  The defect groups may be nonabelian; the ambient finite groups have no order bound.
  There are finitely many groups of order at most $M$, so fixing one defect group or bounding its order gives
  equivalent finiteness assertions. In terms of basic orders,
  Theorem 1 says that a finite list of $cal(O)$-algebras represents all the indicated Morita classes.

The finiteness conclusion also passes to a fixed complete coefficient ring with algebraically closed residue field.

#thm([Corollary 1.2.])[
  (Fixed complete coefficient rings).  #emph[Let $p$ be a prime,
    let $cal(R)$ be a fixed complete discrete valuation ring of characteristic zero whose residue field $ell$ is
    algebraically closed of characteristic $p$, and let $M gt.eq 1$ be an integer.
    As $G$ ranges over all finite groups and $b$ ranges over primitive central idempotents of $cal(R)
    G$ for which the residue block $ell G macron(b)$ has a defect group of order at most $M$,
    the algebras $cal(R) G b$ belong to only finitely many $cal(R)$-linear Morita equivalence classes.]
] <cor:complete-dvr>

Here $cal(R)$ is fixed before $G$ and $b$ vary. It may be ramified,
  and no splitting hypothesis on its fraction field is required.
  The proof at the end of Section 7 uses compatible block idempotent lifts and scalar extension of the integral
  Morita equivalences from Theorem 1.

=== 1.1 Finiteness criteria and extension methods <finiteness-criteria-and-extension-methods>

The local representation-theoretic questions surrounding Donovan’s conjecture were articulated in Alperin’s
  account of local representation theory #cite(label("Alperin1980")).
  Two different sorts of control enter finiteness: bounds on the size of a basic algebra,
  and bounds on its field of definition. Hiss made the field-of-definition requirement explicit:
  bounded defect and Cartan invariants yield Morita finiteness when the blocks have split forms over a common
  finite field #cite(label("HissBrauer2000")) Proposition 5.1.
  Kessar separated these issues using Morita–Frobenius numbers #cite(label("KessarRemark2004")).
  For an integral order $B$, its Morita–Frobenius number $"mf"_(cal(O)) \( B \)$ is the least positive
  coefficient-Frobenius power giving a Morita-equivalent order.
  The integral size and rationality bounds are combined in the finiteness theorem of Eaton–Eisele–Livesey
  #cite(label("EEL2020")) Theorem 3.10: bounded defect, bounded Cartan sum,
  and bounded integral Morita–Frobenius number imply integral Morita finiteness.
  The theorem itself allows arbitrary defect groups; the Cartan-only quasisimple reduction in that paper has the
  additional hypothesis of abelian defect. Their results establish integral Donovan finiteness for all abelian
  $2$-groups #cite(label("EEL2020")) Corollary 4.6. For nonabelian defect groups,
  Eaton–Eisele–Kessar–Linckelmann–Schaeffer Fry prove integral Donovan finiteness for quaternion defect groups
  #cite(label("EEKLS2026")) Theorem 1.1.

Crossed products encode the passage from normal subgroups to their extensions.
  Külshammer developed this approach in Clifford theory and in his reduction of Donovan’s conjecture
  #cite(label("KulshammerClifford1990")) #cite(label("Kulshammer1995")).
  Eisele established integral versions and studied the relevant Picard groups #cite(label("EiseleReduction2021"))
  #cite(label("EiseleGeometry2022")). His geometry of rigid lattices supplies the methodological setting for
  integral Picard finiteness #cite(label("EiseleGeometry2022")) Theorems A and B.
  We use the preliminary Fong and nilpotent-block reduction in An–Eaton #cite(label("AnEaton2025"))
  Proposition 6.1; that proposition applies to arbitrary defect groups over $cal(O)$,
  independently of the extraspecial hypotheses used in their subsequent results.

For quasisimple groups, Farrell–Kessar give the uniform bound $"mf"_(cal(O)) \( B \) lt.eq
  4$ #cite(label("FarrellKessar2019")) Theorem 1.1. Their theorem does not itself compare the multiplication
  factors in an arbitrary group extension. This distinction matters:
  controlling the Morita class of an identity component or its outer automorphisms does not determine a crossed
  product. Eisele–Livesey’s constructions of arbitrarily large Morita–Frobenius numbers,
  in families with growing defect, give further reason to retain the rationality data explicitly
  #cite(label("EiseleLivesey2022")).

The companion article #emph[Donovan’s Conjecture over Algebraically Closed Fields]
  #cite(label("OpenAIFieldDonovan2026")) establishes bounded-defect finiteness over $k$ for all finite groups.
  It supplies two inputs here: a uniform Cartan bound, through its field theorem,
  and the integral extension and comparison constructions of its Sections 8 and 9.
  The latter retain the actual multiplication factors in the normal-subgroup extensions.
  Their advertised equivariance is exact after reduction. We will refine the specified integral operators to
  obtain exact equivariance over $cal(O)$ itself.

=== 1.2 What must be retained over the Witt ring <what-must-be-retained-over-the-witt-ring>

The distinction between the two coefficient rings is substantial.
  A coefficient-Frobenius-fixed point over $cal(O)$ has coordinates in $W \( bb(F)_q \)$, which is infinite.
  Thus the finite-field point count used in a descent argument over $k$ gives no integral finiteness assertion.
  Also, a scalar obstruction over $cal(O)$ may contain principal units,
  whose cohomology on a $p$-group need not vanish. We address these two issues separately:
  the first requires rigidity of integral orders, and the second requires control of the particular scalar errors
  produced by the comparison.

The normal-subgroup reductions make every relevant block Morita equivalent to a block summand of a crossed order
  with identity component an integral block $B_0$ and grading group $Q$.
  The integral basic orders of $B_0$ belong to a finite list, while $\[ Q : O_(p') \( Q \) \]$ is bounded.
  A crossed order retains both the automorphisms of $B_0$ and the units that occur when homogeneous generators are
  multiplied. Its restriction to a subgroup is the sum of the homogeneous components labelled by the elements of
  that subgroup.

Three successive assertions carry the integral proof. The first is #emph[exact comparison].
  The geometric overlap operators have discrepancies given by prime-to-$p$ character values,
  so these discrepancies lie in the Teichmüller subgroup $cal(T) = \[ k^times \] subset.eq cal(O)^times$.
  We check this membership through component products, central quotients and the prescribed inner factors.
  Only then do we use the vanishing of positive cohomology of a finite $p$-group with coefficients in $cal(T)$.
  The resulting integral comparison extends to every Sylow restriction,
  giving a Morita equivalence with a bounded coefficient-Frobenius twist.

The second assertion is #emph[based finiteness]. Each pure Sylow restriction is an actual finite-group block of
  bounded defect; we construct its group from the given automorphisms and factor elements.
  The field companion bounds its Cartan sum, so the integral criterion of Eaton–Eisele–Livesey gives finitely many
  integral Morita classes for these total restriction orders.
  To preserve their labelled homogeneous components and the chosen identity component,
  we prove an integral orbit lemma. Applied to the scheme of gradings of a fixed order with vanishing first
  Hochschild cohomology, it gives finitely many group-labelled gradings,
  even when $p$ divides the grading-group order. The word “fixed” refers to the #emph[total] order;
  this is different from counting all crossed products of a fixed identity order.
  We retain the chosen identification of the identity component;
  isomorphisms preserving that identification are called #emph[based].

The third assertion removes the possibly unbounded normal $p'$-kernel of $Q$ while retaining those based
  restrictions. Its twisted group algebra splits into matrix algebras over $cal(O)$ of degree prime to $p$.
  Determinant-one choices of the matrices implementing a Sylow action force the new scalar discrepancy to be
  Teichmüller-valued. Thus the Sylow restrictions remain in their controlled based list.
  Restriction and corestriction control the principal-unit contribution on the remaining bounded quotient,
  and its Teichmüller cohomology is finite. A finite-fibre argument for the central factor systems then gives the
  integral Morita list.

=== 1.3 Organization and dependencies <organization-and-dependencies>

Section 2 fixes the crossed-product conventions and states the imported block constructions.
  The integral rigidity results in Section 3 are independent of the comparison construction.
  Section 4 proves the exact integral comparison. These two arguments meet in Section 5:
  the comparison gives finite total Morita types of actual extension blocks,
  and rigidity recovers their labelled components and markings.
  Section 6 removes the large normal $p'$-kernel, and Section 7 proves Theorem 1.

The field theorem is used before the integral theorem, in the Cartan input and the specified companion
  constructions. The reduction corollary records that the resulting finite integral list also represents all field
  basic algebras; it is not a premise of the argument. The fixed-coefficient-ring corollary is then proved by
  scalar extension.

== 2 Integral orders and the imported block constructions <sec:inputs>

The proof requires numerical bounds for actual blocks and a precise description of the crossed orders produced by
  reduction. We state these inputs separately. The distinction will matter when the numerical criterion is
  applied: first we identify a restriction as a group block, and then we use its Cartan and Frobenius bounds.

=== 2.1 Orders, Frobenius and the numerical criterion <orders-frobenius-and-the-numerical-criterion>

An $cal(O)$-order means a unital $cal(O)$-algebra free of finite rank as an $cal(O)$-module.
  For a general order, a block summand means its direct factor at a primitive central idempotent.
  Put $K_0 = "Frac" \( cal(O) \)$ and let $sigma$ be Witt Frobenius.
  For an order $A$, the coefficient twist $sigma^m A$ is the order obtained by applying $sigma^m$ to its structure
  constants; equivalently it is scalar transport along $sigma^m$.
  For a group block we identify it with $cal(O) G sigma^m \( b \)$.
  We write $"mf"_(cal(O)) \( A \)$ for the least positive $m$ for which $A$ and $sigma^m
  A$ are $cal(O)$-linearly Morita equivalent, whenever such an $m$ exists.
  Only upper bounds for this number will be used.

Every finite $cal(O)$-algebra is semiperfect. A basic idempotent of a block order is a sum of one primitive
  idempotent for every isomorphism type of indecomposable projective.
  It is full, and its corner is the basic order. Basic orders are unique up to isomorphism within a Morita class.
  If the Cartan matrix of a block is $\( c_(i j) \)$, its basic order has $cal(O)$-rank $sum_(i \, j) c_(i j)$:
  reduction is a split basic $k$-algebra, whose dimension is that sum.

#thm([Proposition 2.1.])[
  (Cartan and integral finiteness inputs).  #emph[The following assertions will be used.]
  + #emph[For every $p$ and $M$, the Cartan sums of all finite-group blocks over $cal(O)$ with defect order at
    most $M$ are bounded by a constant $c \( p \, M \)$.]
  + #emph[For fixed positive bounds on the defect order, Cartan sum, and integral Morita–Frobenius number,
    finite-group blocks over $cal(O)$ have only finitely many $cal(O)$-linear Morita equivalence classes.]
] <prop:criteria>

#proof[
  By #cite(label("OpenAIFieldDonovan2026")) Theorem 1.1, the reductions of the blocks in (i) have finitely many
    $k$-Morita classes. Their Cartan matrices, up to simultaneous permutation, consequently form a finite list.
    Integral blocks and their reductions have the same Cartan matrix, which proves (i).
  Assertion (ii) is #cite(label("EEL2020")) Theorem 3.10, applied to the finitely many possible defect exponents.
    The coefficient conventions of that theorem include the absolutely unramified complete discrete valuation ring
    $W \( k \)$ and its coefficient Frobenius, which fixes the uniformizer $p$.
    Its defect-zero case can also be separated: a defect-zero block over $W \( k \)$ is a matrix algebra over
    $W \( k \)$ and has basic order $cal(O)$. Indeed, its reduction is a full matrix algebra over $k$;
    lift its matrix units over the complete ring $cal(O)$, whose resulting primitive corner has rank one. ◻
]

=== 2.2 Multiplication factors and identity markings <multiplication-factors-and-identity-markings>

#prodef([Definition 2.2.])[
  (Crossed orders and based isomorphisms).  Let $R$ be an $cal(O)$-order and $Q$ a finite group.
    A normalized crossed system consists of $alpha_q in "Aut"_(cal(O)) \( R \)$ and $a_(q \, t) in R^times$ such that
  #[#set math.equation(numbering: n => "(1)")
   $ alpha_q alpha_t & = "ad" \( a_(q \, t) \) alpha_(q t) \,\
a_(q \, t) a_(q t \, v) & = alpha_q \( a_(t \, v) \) a_(q \, t v) \, $ <eq:action-law>]
  with $alpha_1 = upright("id")$ and $a_(1 \, q) = a_(q \, 1) = 1$.
    Its crossed order is $A = xor.big_(q in Q) R u_q$, with
  $ u_q r = alpha_q \( r \) u_q \, wide u_q u_t = a_(q \, t) u_(q t) \, wide u_1 = 1 . $
  A $Q$-labelled graded isomorphism preserves each homogeneous component with its label.
    When the identity component is identified with a fixed $R$,
    such an isomorphism is #emph[based] if it is the identity on $R$.
]

Changing each $u_q$ to $t_q u_q$, with $t_q in R^times$ and $t_1 = 1$,
  gives exactly the based changes of crossed systems. The induced homomorphism $Q arrow.r
  "Out"_(cal(O)) \( R \)$ is the outer action. It remembers the actions only modulo inner automorphisms.
  Both the units implementing their products in Equation (1) and the compatibility in Equation (1) are needed to
  recover the order. For $S lt.eq Q$ the #emph[restriction to $S$] is the crossed suborder $A_S =
  xor.big_(s in S) R u_s$, with the same identity marking and the restricted factors.

=== 2.3 Reduction and dual recovery <reduction-and-dual-recovery>

We call a pair $\( H \, B \)$ reduced if $B$ is a block of $cal(O)
  H$ such that every block of a normal subgroup covered by $B$ is $H$-stable, and

#[#set math.equation(numbering: n => "(2)")
 $ B upright(" covers a nilpotent block of ") H_0 lt.closed.eq H quad arrow.r.double quad H_0 lt.eq
   Z \( H \) O_p \( H \) . $ <eq:reduced>]

An–Eaton’s preliminary reduction #cite(label("AnEaton2025")) Proposition 6.1 replaces an arbitrary block by a
  reduced pair through an $cal(O)$-linear basic Morita equivalence, preserving the defect group.
  Their coefficient conventions include $cal(O) = W \( k \)$. We apply this integral reduction directly.

The next proposition collects the group structure, actual factor elements and integral full corners supplied by
  the field companion. Constants in it depend only on $p \, M$.

#thm([Proposition 2.3.])[
  (Controlled integral extensions).  #emph[Let $\( H \, B \)$ be a reduced pair with defect order at most $M$.
    Put $N = F^(*) \( H \)$, $X = H \/ N$, and let $b$ be the block of $cal(O) N$ covered by $B$.
    Then the following constructions and bounds hold.]
  + #emph[The group $N$ is a central product
$ N = P Z K_1 dots.h.c K_j \, wide P = O_p \( H \) \, quad Z = O_(p') \( H \) lt.eq Z \( H \) \, $

 where the $K_i$ are quasisimple components, $\| P \|$ and $j$ are bounded,
   and $\[ X : O_(p') \( X \) \]$ is bounded. The latter index is bounded also for every subgroup of every
   extension of $X$ by a $p'$-group.]
  + #emph[There is an extension $N lt.closed.eq macron(N)$ with abelian $p'$-quotient $A_0 = macron(N) \/ N$.
    For representatives $h_x$ of $x in X$, normalized by $h_1 = 1$, write $h_x h_y =
    n_(x \, y) h_(x y)$ with $n_(x \, y) in N$. Conjugation extends to automorphisms $alpha_x$ of $macron(N)$
    satisfying the actual identities
#[#set math.equation(numbering: n => "(3)")
 $ alpha_x alpha_y & = "ad" \( n_(x \, y) \) alpha_(x y) \,\
n_(x \, y) n_(x y \, z) & = alpha_x \( n_(y \, z) \) n_(x \, y z) . $ <eq:actual-actions>]

 Every block $macron(b)$ of $cal(O) macron(N)$ covering $b$ has bounded defect.]
  + #emph[Put $Xi = "Hom" \( A_0 \, k^times \)$, using Teichmüller lifts of the characters over $cal(O)$, and $Y =
    Xi times.r X$. There is a $Y$-crossed order with identity component $cal(O) macron(N)$ in which $cal(O)
    H$ is a full idempotent corner. After taking an appropriate central summand and a further full corner,
    this is a crossed order with identity component
$ B_0 = cal(O) macron(N) macron(b) $

 and grading group $Q = "Stab"_Y \( macron(b) \)$. In the pure $X$-degrees the actions and factors are those in
   (ii). The index $\[ Q : O_(p') \( Q \) \]$ is bounded.]
  + #emph[The basic orders of all these identity blocks $B_0$ belong to a finite list of integral orders $R_1 \,
    dots.h \, R_t$. Their integral Picard groups, and in particular their outer automorphism groups, are finite.]
] <prop:structure>

#proof[
  #emph[Source of the assertions.] For a reduced pair, the structural conclusions follow from
    #cite(label("OpenAIFieldDonovan2026")) Lemma 8.1. Its opening Morita reduction is stated over $k$;
    we use only its conclusions about the already reduced pair, obtained here by the integral An–Eaton reduction.
    The compatible partial extension and its actual factors are #cite(label("OpenAIFieldDonovan2026")) Lemma 8.2.
    The integral dual recovery construction and full corners are #cite(label("OpenAIFieldDonovan2026")) Lemma 8.3.
  For clarity, the dual-recovery idempotent is $\| Xi \|^(- 1) sum_(chi in Xi) u_chi$.
    The characters are trivial on every $n_(x \, y) in N$, so the pure $X$-units preserve this idempotent and
    retain exactly these factors. This explains why the construction is integral and why it retains the
    multiplication data needed later. Finally (iv) is the integral assertion of
    #cite(label("OpenAIFieldDonovan2026")) Lemma 8.5, using the trivial-subgroup case of its Proposition 9.1.
    The finite Picard assertion is also #cite(label("EiseleGeometry2022")) Theorem B and Corollary 1.2. ◻
]

Every $p$-subgroup $S$ of $Y$ can be conjugated by an element of $Xi$ into the pure subgroup $X$.
  Indeed, its image in $X$ is a $p$-group, and Schur–Zassenhaus conjugates the two complements to $Xi$ in the
  inverse image of that group. In the crossed order this conjugation is implemented by an integral homogeneous
  unit; it also transports $macron(b)$. We may therefore work with pure $p$-subgroups,
  provided we keep the transported identity block in the same family.
  In particular, the orders of the relevant $p$-subgroups of $Q$ are bounded:
  their intersection with $O_(p') \( Q \)$ is trivial, so they inject into the quotient whose order was bounded in
  (iii).

There is no bound here on the orders of the central kernels in the universal-cover presentations,
  or on the extra central $p$-factors used in the partial regular extensions.
  The comparison in Section 4 descends through those kernels before any bounded-defect integral criterion is applied.

=== 2.4 The companion’s comparison data <the-companions-comparison-data>

The comparison convention in #cite(label("OpenAIFieldDonovan2026")) Definition 8.4 and Proposition 9.1 uses an
  integral Morita bimodule but asserts exact covariance and factor identities on its reduction.
  We use the particular integral operators constructed there. Their ingredients have four distinct roles.
  Lemmas 9.2–9.4 realize the genuine field, graph and inner relations, construct an invariant torus and character,
  and choose a common parabolic–Levi pair with the specified inner overlap.
  Lemma 9.5 gives an integral Levi Morita bimodule with strict geometric actions and matching central actions.
  Lemma 9.6 gives a uniformly bounded coefficient-Frobenius return and its prime-to-$p$ character twist.
  Finally, Lemma 9.7 computes the integral scalar overlap of the chosen operators.

Section 4 recalls these constructions with their exact hypotheses and shows that their scalar errors stay in
  $cal(T)$. The subsequent normalization over $cal(O)$ is proved here.
  Thus the imported comparison supplies operators and overlap identities,
  while Proposition 12 supplies the exact integral factor law required by the later extension argument.

== 3 Integral orbits and gradings of a fixed order <sec:rigidity>

An ungraded Morita list does not specify the components of a crossed order.
  This section gives the additional rigidity needed to recover both their group labels and the identity marking.
  There are three steps: an orbit lemma over $cal(O)$, a tangent calculation for gradings of a fixed total order,
  and a rank argument which passes from Morita classes to such fixed orders.
  The orbit method is related to the geometry of rigid lattices and Picard groups in
  #cite(label("EiseleGeometry2022")); the grading argument below works for every finite grading group.

=== 3.1 Integral orbit finiteness <integral-orbit-finiteness>

#thm([Lemma 3.1.])[
  (Integral orbit finiteness).  #emph[Let $J$ be a smooth affine group scheme of finite type over $cal(O)$,
    acting on an affine scheme $V$ of finite type over $cal(O)$.
    For $x in V \( cal(O) \)$ let $T_x V$ denote the integral tangent module along the section $x$.
    The points for which the orbit derivative
$ "Lie" \( J \) arrow.r T_x V $

 is surjective belong to only finitely many $J \( cal(O) \)$-orbits.]
] <lem:orbit>

#proof[
  We bound the special-fibre orbits and then cut each one by a fixed integral slice.
    The latter has only finitely many possible generic points arising from the sections under consideration.
  #emph[The integral tangent and horizontal components.] Embed $V$ as a closed subscheme of $bb(A)_(cal(O))^r$,
    with finitely many defining equations. The module $T_x V$ is the kernel of their Jacobian map on $cal(O)^r$.
    It is therefore saturated in $cal(O)^r$. Write $u = "rank"_(cal(O)) T_x V$.
    Surjectivity of the orbit derivative and saturation imply that its coordinate matrix has a unit minor of size
    $u$. This follows, for example, from Smith normal form over the discrete valuation ring $cal(O)$.
  After extension to $K_0$, this derivative has rank $u$, which is also $dim_(K_0) T_(x_(K_0)) V_(K_0)$.
    Every irreducible component of $V_(K_0)$ through $x_(K_0)$ consequently has dimension at most $u$.
    Let $V_u$ be the reduced closure in $V$ of the union of the generic-fibre irreducible components of dimension
    at most $u$. There are finitely many such components. Each of their horizontal closures has special fibre of
    dimension at most its generic-fibre dimension. This is the dimension theorem for an irreducible finite-type
    scheme over a valuation ring #cite(label("StacksProject")) Lemma 33.19.2, Tag 0B2J. Thus
  #[#set math.equation(numbering: n => "(4)")
   $ dim \( V_u \)_k lt.eq u . $ <eq:fibre-dimension>]
  The section $x$ factors through $V_u$, because its generic point does and $cal(O) arrow.r.hook K_0$ is injective.
  #emph[The special-fibre orbits.] Let $x_0$ be the reduction of $x$.
    The unit minor remains nonzero modulo $p$, so the special-fibre orbit of $x_0$ has dimension at least $u$.
    This orbit lies in $\( V_u \)_k$. One way to verify that last assertion is to lift every element of
    $J \( k \)$ to $J \( cal(O) \)$, using smoothness and completeness, and then apply it to the section $x$.
    The transformed generic point still lies on components of dimension at most $u$.
    Equation (4) now shows that the orbit has dimension exactly $u$.
  A locally closed orbit of dimension $u$ in a scheme of dimension at most $u$ contains an open subset of an
    irreducible component of dimension $u$. Two distinct orbits cannot both contain dense open subsets of the same
    component. There are therefore finitely many possible special-fibre orbits for this $u$.
  #emph[A fixed Hensel slice.] Fix one such orbit and a representative $x_0$.
    By lifting elements of $J \( k \)$, move all integral points under consideration so that their reduction
    equals $x_0$. Choose $u$ coordinate functions whose orbit derivative has a nonzero $u$-minor at $x_0$,
    and fix integral lifts $a_1 \, dots.h \, a_u$ of their values there. For each such integral point $x$, the map
  $ J arrow.r bb(A)_(cal(O))^u \, wide g mapsto upright("the selected coordinates of ") g x $
  is smooth near the identity: $J$ is smooth and its relative differential there is surjective.
    Hensel lifting supplies $g equiv 1 med \( mod med p \)$ for which the selected coordinates of $g
    x$ are exactly the $a_i$. Thus every integral orbit has a representative in the fixed affine slice
  $ W = V ∩ { upright("selected coordinates ") = a_1 \, dots.h \, a_u } . $
  For any resulting point $y$, the selected-coordinate differential is an isomorphism on $T_(y_(K_0)) V_(K_0)$:
    that space has dimension $u$, and the same minor is a unit since $y$ reduces to $x_0$.
    It follows that $T_(y_(K_0)) W_(K_0) = 0$. Such a point is isolated in the finite-type $K_0$-scheme $W_(K_0)$.
    A noetherian scheme has only finitely many isolated points.
    Each generic point gives at most one integral section, again by the injection $cal(O) arrow.r.hook K_0$.
    Hence there are finitely many representatives in this slice.
    Taking the finite union over the special-fibre orbits and the possible ranks $0 lt.eq u lt.eq r$ proves the lemma. ◻
]

The integral tangent module in this proof need not reduce to the whole tangent space at $x_0$.
  Saturation and the unit minor are what the proof uses. In particular, no smoothness assumption on $V$,
  nor on an automorphism scheme occurring as $V$, is needed.
  The rank-zero case is included by using no slice coordinates.
  The argument uses smoothness of $J$ for lifting and for its differential; it does not require $J$ to be connected.

=== 3.2 Block rigidity and labelled gradings <block-rigidity-and-labelled-gradings>

#thm([Lemma 3.2.])[
  (Hochschild rigidity and outer automorphisms).  #emph[Let $A$ be an $cal(O)$-order Morita equivalent to a finite
    direct sum of finite-group block orders. Then $"HH"_(cal(O))^1 \( A \) = 0$,
    and $"Out"_(cal(O)) \( A \)$ is finite.]
] <lem:HH>

#proof[
  For a finite group $G$, the conjugation permutation lattice and Shapiro’s lemma give
  $ "HH"_(cal(O))^1 \( cal(O) G \) tilde.equiv H^1 \( G \, cal(O) G_(upright("conj")) \) tilde.equiv
    xor.big_(\[ g \]) H^1 \( C_G \( g \) \, cal(O) \) = 0 . $
  The action on the last coefficient module is trivial, and $"Hom" \( C_G \( g \) \, cal(O)_(upright("add")) \) =
    0$ because $C_G \( g \)$ is finite and $cal(O)$ is torsion-free.
    Hochschild cohomology splits over finite direct products and is Morita invariant, proving the first assertion.
    Thus every $cal(O)$-linear derivation of $A$ is inner.
  The unit group scheme $A^times$ is an open subscheme of the affine space underlying $A$,
    defined by invertibility of the regular-representation determinant. It is smooth.
    The automorphisms of $A$ form an affine scheme of finite type:
    impose the multiplicative and unital equations on an invertible linear map.
    Let $A^times$ act by postcomposition with inner automorphisms.
    At an automorphism, compose with its inverse to identify the tangent module with the derivations of $A$.
    The orbit derivative then consists of the inner derivations, so it is surjective.
    Lemma 6 says exactly that there are finitely many cosets modulo inner automorphisms. ◻
]

#thm([Theorem 3.3.])[
  (Gradings of a fixed integral order).  #emph[Let $A$ be an $cal(O)$-order with $"HH"_(cal(O))^1 \( A \) = 0$,
    and let $H$ be any fixed finite group. There are only finitely many $H$-labelled gradings of $A$ up to
    $cal(O)$-algebra automorphism. In fact there are only finitely many orbits under inner automorphisms.]
] <thm:gradings>

#proof[
  We apply Lemma 6 to the space of decompositions compatible with multiplication.
    The key point is that the tangent calculation uses cancellation in $H$, without averaging over $H$.
  A grading $A = xor.big_(h in H) A_h$ is specified by its orthogonal projections $e_h in "End"_(cal(O)) \( A \)$.
    These satisfy
  $ e_h e_j & = delta_(h \, j) e_h \, & sum_(h in H) e_h & = 1 \,\
e_h \( 1_A \) & = delta_(h \, 1) 1_A \, & e_l \( e_g \( x \) e_h \( y \) \) & = 0 quad \( l eq.not g h \) . $
  The last equations need only be imposed on a fixed finite basis of $A$.
    They define an affine finite-type grading scheme, on which $A^times$ acts by conjugation.
  We compute its integral tangent module at a grading. A first-order deformation of the direct-sum decomposition
    is uniquely represented by an off-diagonal $cal(O)$-linear map $delta : A arrow.r A$, where
  $ e_h delta e_h = 0 quad \( h in H \) . $
  The deformed summands are $\( 1 + epsilon delta \) A_h$ over $cal(O) \[ epsilon \] \/ \( epsilon^2 \)$.
    This description follows by differentiating the equations for orthogonal idempotent projections,
    or by writing the summands as graphs over the original summands. It uses no division by $\| H \|$.
  For $x in A_g$ and $y in A_h$, the linearized multiplicative equations say that
  #[#set math.equation(numbering: n => "(5)")
   $ delta \( x y \) - delta \( x \) y - x delta \( y \) $ <eq:grading-derivative>]
  has zero component in every degree other than $g h$. It also has zero $g h$-component.
    The first term is off degree $g h$ by definition. A summand of $delta \( x \) y$ can have degree $g
    h$ only if its first factor has degree $g$, by cancellation in $H$; that component of $delta \( x \)$ is zero.
    The same reasoning applies to $x delta \( y \)$. Hence Equation (5) vanishes, and $delta$ is a derivation.
  The hypothesis gives $delta = \[ a \, - \]$ for some $a in A$.
    Conjugation by $1 + epsilon a$ produces the specified tangent to the grading.
    Thus the orbit derivative from the smooth group $A^times$ is surjective onto every integral tangent module.
    Lemma 6 proves the assertion. ◻
]

#prodef([Remark 3.4.])[
  The total order is fixed in Theorem 8. Finiteness of all crossed orders on a fixed identity order is a different
    assertion. For example, for odd $p$ the based $C_p$-crossed orders
  $ cal(O) \[ t \] \/ \( t^p - a \) \, wide a in cal(O)^times \, $
  have classes parametrized by $cal(O)^times \/ \( cal(O)^times \)^p$. The principal-unit quotient is infinite:
    the $p$-adic logarithm identifies $\( 1 + p cal(O) \) \/ \( 1 + p cal(O) \)^p$ with $p cal(O) \/ p^2 cal(O)
    tilde.equiv k$. Their total orders vary. The crossed-product finiteness theorem in the published
    #cite(label("EiseleReduction2021")) Corollary 4.9 assumes a $p'$-grading group.
    Theorem 8 uses a different hypothesis and has just been proved also for groups divisible by $p$.
] <rem:fixed-total>

=== 3.3 From Morita classes to based graded types <from-morita-classes-to-based-graded-types>

For a crossed order on a fixed identity order, fixing the grading group also fixes the total rank.
  This converts a finite Morita list into a finite isomorphism list, to which the grading theorem applies.

#thm([Proposition 3.5.])[
  (Retaining the identity marking).  #emph[Fix a basic block order $R$ and a finite group $H$.
    Let $cal(A)$ be a collection of $H$-crossed orders on $R$, each Morita equivalent to a finite-group block.
    If the total orders in $cal(A)$ have finitely many $cal(O)$-Morita classes,
    then $cal(A)$ has finitely many based graded isomorphism classes.]
] <prop:marked>

#proof[
  #emph[The total order.] Every order in the collection has rank $\| H \| "rank"_(cal(O)) R$.
    Choose a basic representative in each of its finitely many Morita classes.
    Any order in that class is an endomorphism order of a projective generator $xor.big_i P_i^(m_i)$,
    with positive integer multiplicities $m_i$ and the $P_i$ ranging over the finitely many indecomposable
    projectives. Its endomorphism order contains $M_(m_i) \( "End" \( P_i \) \)$ as a direct $cal(O)$-module
    summand, so its rank bounds $m_i^2$. There are consequently only finitely many ungraded isomorphism types in
    the collection.
  #emph[The grading and the marking.] Lemma 7 and Theorem 8 give finitely many labelled $H$-gradings on every such
    total order. Fix one graded representative with identity component isomorphic to $R$.
    Two identifications of that component with $R$ differ by an element of $"Aut"_(cal(O)) \( R \)$.
    Inner changes extend to graded automorphisms of the total order by conjugation with a unit in degree one.
    Since $"Out"_(cal(O)) \( R \)$ is finite by Lemma 7, there are finitely many remaining markings.
    These are precisely the based graded types in the assertion. ◻
]

== 4 Teichmüller overlaps and integral Sylow comparison <sec:comparison>

The rationality bound for a Sylow restriction must compare its multiplication factors as well as its identity
  block. We obtain it from the explicit operators in Section 9 of #cite(label("OpenAIFieldDonovan2026")).
  Proposition 9.1 there asserts exact equivariance after reduction;
  here we prove exact equivariance over $cal(O)$ by following the scalar errors through the entire integral
  construction. Their membership in the Teichmüller group is the point that permits the final normalization.

=== 4.1 The scalar coefficient group <the-scalar-coefficient-group>

Write

$ cal(T) = \[ k^times \] subset.eq cal(O)^times $

for the Teichmüller subgroup. Since $k$ is the algebraic closure of a finite field,
  $cal(T)$ consists precisely of the roots of unity in $cal(O)$ of order prime to $p$.
  It is preserved by Witt Frobenius, which acts on it by $p$th powering.

#thm([Lemma 4.1.])[
  #emph[If $S$ is a finite $p$-group acting trivially on $cal(T)$, then $H^i \( S \, cal(T) \) = 0$ for every $i > 0$.]
] <lem:teich-cohomology>

#proof[
  Positive-degree cohomology of a finite group is killed by its order.
    Raising to $\| S \|$ is an automorphism of $cal(T)$, since $cal(T)$ has no $p$-torsion and has unique
    $p$-power roots. This map also induces an automorphism on cohomology.
    It is simultaneously the zero map there, so the cohomology vanishes. ◻
]

=== 4.2 Exact covariance with the prescribed factors <exact-covariance-with-the-prescribed-factors>

#thm([Proposition 4.2.])[
  (Exact integral comparison).  #emph[Fix $p \, M$ and the data of Proposition 5.
    Let $S lt.eq Q$ be a $p$-subgroup contained in the pure subgroup $X lt.eq Y$, so that $S$ stabilizes $B_0 =
    cal(O) macron(N) macron(b)$. Put $a_(s \, t) = n_(s \, t) macron(b)$.
    There is a positive integer $m$, bounded in terms of $p \, M$,
    and a $\( sigma^m B_0 \, B_0 \)$-Morita bimodule $cal(M)$ with invertible $cal(O)$-linear maps $J_s :
    cal(M) arrow.r cal(M)$, normalized by $J_1 = upright("id")$, such that
#[#set math.equation(numbering: n => "(6)")
 $ J_s \( a v b \) & = alpha'_s \( a \) J_s \( v \) alpha_s \( b \) \,\
J_s J_t \( v \) & = a'_(s \, t) J_(s t) \( v \) a_(s \, t)^(- 1) . $ <eq:comparison-covariance>]

 Here $a in sigma^m B_0$, $b in B_0$, $alpha'_s = sigma^m \( alpha_s \)$, and $a'_(s \, t) =
   sigma^m \( a_(s \, t) \)$. The assertion includes $S = 1$.]
] <prop:comparison>

=== 4.3 The imported component operators <the-imported-component-operators>

We first specify the integral operators that will prove Proposition 12. Fix its data and pure subgroup $S$.
  The companion’s construction temporarily replaces the identity group $macron(N)$ by a central cover.
  More precisely, #cite(label("OpenAIFieldDonovan2026")) Lemma 8.2 supplies

$ macron(N) = #scale(x: 120%, y: 120%)[\(] P times Z times product_i V_i #scale(x: 120%, y: 120%)[\)] \/ D_0 \,
  wide J_i = V_i times C_i . $

Here $D_0$ is the original central kernel, each $V_i$ enlarges the universal cover of a component,
  and $C_i$ is an added direct central $p$-group. On the cross-characteristic Lie components outside the finite
  exceptional list, $J_i$ is the full fixed-point group of a connected reductive group with simply connected
  derived subgroup; on the remaining components put $C_i = 1$. There is no bound on $\| D_0 \|$ or $\| C_i \|$.
  The operators below are constructed on these auxiliary groups;
  their descent will return us to the bounded-defect block $B_0$.

Consider one $S$-orbit of these Lie components. By #cite(label("OpenAIFieldDonovan2026")) Lemmas 9.2–9.4,
  the product of its groups $J_i$ has a realization $J = upright(bold(J))^F$ with simply connected algebraic
  derived subgroup and Steinberg endomorphism $F$. The chosen representatives $h_s$,
  together with actual inner operations, generate an operation group $I$,
  represented by algebraic automorphisms commuting with $F$.
  The source chooses a rational Levi $L = upright(bold(L))^F$, a parabolic with Levi $upright(bold(L))$,
  and a subgroup $A_1$ of $I$ preserving this pair, such that

#[#set math.equation(numbering: n => "(7)")
 $ I = "Inn" \( J \) A_1 \, wide "Inn" \( J \) ∩ A_1 = "Inn" \( L \) \, $ <eq:I-decomposition>]

where $A_1$ is the particular subgroup of the cited construction.
  The Levi is $F$-stable; its parabolic need not be. The field operations are represented by algebraic
  permutations with their actual relations, including the diagram twist at the cyclic wrap in the ordinary twisted
  realization. The exceptional graph-isogeny realization is the separate construction of that source.
  In particular, the representatives of $S$ still have the specified inner factors $n_(s \, t)$,
  lifted to the central-product cover.

Let $b_J$ be the lifted block and $b_L$ its Levi correspondent. Set $A_J = cal(O) J b_J$ and $B_L = cal(O) L b_L$.
  The integral Bonnafé–Rouquier $\( A_J \, B_L \)$-Morita bimodule $U$ has a strict $A_1$-action:
  its operators satisfy the group law exactly, and the operator for $"ad" \( ell \)$ is $u mapsto ell u
  ell^(- 1)$ for $ell in L$. Every central element of $J$ acts equally from the two sides of $U$
  #cite(label("OpenAIFieldDonovan2026")) Lemma 9.5. Existence of the equivalence uses the full-dual-centralizer
  hypothesis in #cite(label("BR2003")) Section 11.4, Theorem B$'$.
  Geometric comparison and extension methods are developed further in #cite(label("BDR2017")) Sections 6–7.
  The strict action used here is the companion’s action by actual automorphisms of the fixed common parabolic–Levi
  pair; it is not a choice of comparison maps between different parabolics.

By #cite(label("OpenAIFieldDonovan2026")) Lemmas 9.3 and 9.6,
  a bounded positive exponent $m$ and an $A_1$-invariant linear character $lambda_m$ of $L$ of $p'$-order satisfy

$ sigma^m \( b_L \) = lambda_m b_L . $

The bound is uniform in classical rank and field size, including type A where the diagonal index need not be
  bounded. The exponent likewise does not depend on the orders of the added central tori or the original covering
  kernels. Use primes for coefficient-Frobenius images. The corresponding isomorphism is

$ f : B_L arrow.r B'_L \, wide g b_L mapsto lambda_m \( g \)^(- 1) g sigma^m \( b_L \) . $

Let $T_lambda$ be the invertible $\( B'_L \, B_L \)$-bimodule with underlying left module $B'_L$ and right action
  through $f$. Writing $U^or$ for a $\( B_L \, A_J \)$-Morita inverse of $U$, the component comparison bimodule is

#[#set math.equation(numbering: n => "(8)")
 $ cal(M)_J = sigma^m \( U \) ⊗_(B'_L) T_lambda ⊗_(B_L) U^or . $ <eq:comparison-bimodule>]

All three factors have strict $A_1$-actions: geometric action and its dual on the outside,
  and the action on the group basis on the middle factor. Denote their tensor action by $D_a$.

For $g in J$ let $E_g \( v \) = g v g^(- 1)$ be the actual inner operator on $cal(M)_J$. The construction gives

#[#set math.equation(numbering: n => "(9)")
 $ E_g E_h & = E_(g h) \, & D_a E_g D_a^(- 1) & = E_(a \( g \)) \,\
D_("ad" \( ell \)) & = lambda_m \( ell \)^(- 1) E_ell &  & \( ell in L \) . $ <eq:strict-operators>]

The last equality is the explicit overlap calculation in the proof of #cite(label("OpenAIFieldDonovan2026"))
  Lemma 9.7: on the middle factor, right multiplication uses $f \( ell^(- 1) \) = lambda_m \( ell \) ell^(- 1)$.
  It is an equality of integral operators, not merely of their reductions.

=== 4.4 Proof of the exact comparison <proof-of-the-exact-comparison>

#proof[
  The imported operators retain the actual inner factors. We show first that all their presentation ambiguities
    lie in $cal(T)$, then assemble and descend the component comparisons.
    Only after this descent will we remove the resulting scalar cocycle.
  #emph[Teichmüller-valued presentation ambiguities.] Every scalar in Equation (9) belongs to $cal(T)$,
    because $lambda_m$ has $p'$-order. To represent an operation $i in I$, choose $i =
    "ad" \( g \) a$ using Equation (7) and take $E_g D_a$. Changing this presentation is a change through
    $"Inn" \( L \)$, and hence introduces only a value of $lambda_m$,
    apart from the ambiguity of a central element in the choice of $g$.
  That central ambiguity is also Teichmüller-valued. If $c in Z \( J \)$ is a $p$-element,
    then $c in L$ and Equation (9) applied to it says $E_c = 1$:
    the inner operation is the identity and $lambda_m \( c \) = 1$.
    If $c$ has $p'$-order, it acts on each block side by the value of its central character.
    The operator $E_c$ is the ratio of these two $p'$-roots of unity, and lies in $cal(T)$.
    An arbitrary central element is a product of its $p$- and $p'$-parts.
    Thus any two presentations give operators differing by $cal(T)$, rather than by an arbitrary unit of $cal(O)$.
  Multiplication of chosen operators uses only Equation (9) and a change of presentation.
    Its scalar discrepancy is consequently in $cal(T)$. Applying this to the relation $alpha_s alpha_t =
    "ad" \( n_(s \, t) \) alpha_(s t)$ shows, with the #emph[actual] inner factor retained,
    that the resulting transport has the form
  $ D_s D_t \( v \) = c_J \( s \, t \) n'_(s \, t) D_(s t) \( v \) n_(s \, t)^(- 1) \, wide
    c_J \( s \, t \) in cal(T) . $
  #emph[Products, component permutations and the remaining factors.] We now use the remaining constructions in the
    proof of #cite(label("OpenAIFieldDonovan2026")) Proposition 9.1. There are boundedly many component orbits.
    Taking a common bounded multiple of their exponents is legitimate by tensoring successive Frobenius twists of
    the comparison bimodules. Frobenius preserves $cal(T)$, and tensor products multiply the scalar discrepancies.
    This operation therefore preserves their membership in $cal(T)$.
  For the finite list of exceptional, sporadic, and relevant defining-characteristic components,
    a common Frobenius period allows the identity bimodule with strict group transports.
    The unbounded alternating-cover family also has a uniformly bounded coefficient period,
    as proved in that proposition, and uses the same strict transports.
    The bounded $p$-group factor $P$ uses its identity bimodule.
    The central $p'$-factor $Z$ has a rank-one character algebra,
    so its left/right discrepancy is a ratio of $p'$-character values and belongs to $cal(T)$.
    Permutation of factors uses the ordinary flips of bimodules and satisfies its group relations strictly.
    These are tensors of ordinary Morita bimodules, so no graded symmetry sign enters this step, including when $p = 2$.
  #emph[Descent through the original central kernels.] It remains to pass from $P times Z times
    product_i J_i$ to $macron(N)$: quotient by the added factors $C_i$ and the original kernel $D_0$.
    The established construction identifies the left and right actions of every central $p$-element on the
    comparison. Quotienting by $c - 1$ on the two sides therefore gives a Morita bimodule over the corresponding
    quotient blocks: tensor the inverse equivalence as well and use equality of the central actions in the two
    inverse identities. The transport maps preserve these ideals and descend.
    The $p'$-part of the quotient kernel acts trivially on both sides in the chosen averaging sector.
    Thus this descent introduces no new scalar factor. Differences between lifts of the prescribed $n_(s \, t)$
    vanish in the quotient. In particular, the Morita equivalence and its transport maps now live on the original
    identity blocks, where the defect bound of Proposition 5(ii) applies.
  We have obtained an integral $\( sigma^m B_0 \, B_0 \)$-Morita bimodule $cal(M)$ with $cal(O)$-linear covariance
    maps $D_s$ satisfying
  #[#set math.equation(numbering: n => "(10)")
   $ D_s D_t \( v \) = c \( s \, t \) a'_(s \, t) D_(s t) \( v \) a_(s \, t)^(- 1) \, wide
     c \( s \, t \) in cal(T) . $ <eq:projective-comparison>]
  The exponent remains bounded in terms of $p \, M$; the orders of the central kernels have not been bounded or
    used in a finiteness criterion.
  #emph[Removal of the scalar error.] Normalize $D_1 = upright("id")$.
    Compare $\( D_s D_t \) D_v$ and $D_s \( D_t D_v \)$. Covariance and Equation (3) on the two block sides cancel
    all the non-scalar terms and leave
  $ c \( s \, t \) c \( s t \, v \) = c \( t \, v \) c \( s \, t v \) . $
  Because the maps are $cal(O)$-linear, the scalar action is trivial.
    Thus $c$ is a normalized $2$-cocycle in $Z^2 \( S \, cal(T) \)$. Lemma 11 makes it a coboundary.
    Rescaling each $D_s$ by a normalized $cal(T)$-valued $1$-cochain gives $J_s$ and Equation (6),
    without changing the covariance equation or the exponent $m$. ◻
]

The construction proves the scalar restriction before it uses cohomology.
  General $cal(O)^times$-valued projective transports would not suffice,
  since their principal-unit errors need not vanish on $S$.
  Here Equation (8), its overlap characters and its central descent give the more precise coefficient group
  $cal(T)$ at every stage.

== 5 Finite based lists on $p$-subgroups <sec:sylow>

Exact comparison and fixed-total-order rigidity now meet.
  We first extend the comparison to a Morita equivalence of crossed orders.
  We then realize the relevant orders as actual blocks and apply the numerical finiteness criterion.
  Finally we recover the labelled components and the identity markings using Proposition 10.

=== 5.1 Extending an exact comparison <extending-an-exact-comparison>

The following is the one-term crossed-order version of the diagonal extension argument of Marcus
  #cite(label("Marcus1996")) Theorem 3.4, also recorded in #cite(label("Rouquier1998")) Lemma 10.2.8.
  We give its algebraic proof to retain the specified multiplication factors.

#thm([Lemma 5.1.])[
  (Extension of a comparison bimodule).  #emph[Let $B \, B'$ be $cal(O)$-orders with normalized crossed systems
    $\( alpha_s \, a_(s \, t) \)$ and $\( alpha'_s \, a'_(s \, t) \)$ for a finite group $S$, and let $A \,
    A'$ be their crossed orders. Suppose an $\( B' \, B \)$-Morita bimodule $cal(M)$ has invertible
    $cal(O)$-linear maps $J_s$ satisfying Equations (6) and (6).
    Then $A$ and $A'$ are $cal(O)$-linearly Morita equivalent.]
] <lem:induced>

#proof[
  The induced right module carries the required left crossed action precisely because the comparison has the exact
    factor identity. Put $P = cal(M) ⊗_B A$, a right $A$-module.
    The left $B'$-action is the original action on $cal(M)$. Define right $A$-linear operators
  $ L_s \( v ⊗ a \) = J_s \( v \) ⊗ u_s a . $
  They are well defined on the balanced tensor product: covariance and $u_s b =
    alpha_s \( b \) u_s$ identify the images of $v b ⊗ a$ and $v ⊗ b a$.
    They are invertible, and covariance gives $L_s b' = alpha'_s \( b' \) L_s$. The exact factor identity gives
  $ L_s L_t \( v ⊗ a \) & = a'_(s \, t) J_(s t) \( v \) a_(s \, t)^(- 1) ⊗ a_(s \, t) u_(s t) a\
 & = a'_(s \, t) L_(s t) \( v ⊗ a \) . $
  Thus these operators define a left $A'$-action.
  The right $B$-module $cal(M)$ is a finitely generated projective generator.
    Inducing its projective summand and generator identities to $A$ shows that $P$ is a projective generator as a
    right $A$-module. It remains to identify its endomorphism order with $A'$.
  As a right $B$-module, $P$ is the direct sum of the components $cal(M) ⊗_B B u_s$.
    Induction–restriction adjunction gives the following isomorphisms of $cal(O)$-modules:
  $ "End"_A \( P \) tilde.equiv "Hom"_B \( cal(M) \, P \) tilde.equiv xor.big_(s in S)
    "Hom"_B \( cal(M) \, cal(M) ⊗_B B u_s \) . $
  Explicitly, a $B$-linear map $f$ extends uniquely to the $A$-endomorphism $v ⊗ a mapsto f \( v \) a$.
    For a map in the degree-$s$ summand, composing its extension with $L_s^(- 1)$ gives a degree-one endomorphism,
    hence an element of $"End"_B \( cal(M) \) = B'$. Therefore
  $ "End"_A \( P \) = xor.big_(s in S) B' L_s . $
  The relations already checked identify this order with $A'$.
    The projective-generator characterization of Morita equivalence now proves the lemma. ◻
]

=== 5.2 The actual extension blocks <the-actual-extension-blocks>

#thm([Proposition 5.2.])[
  (Sylow restrictions are block orders).  #emph[For the data of Proposition 5, let $S lt.eq
    Q ∩ X$ be a pure $p$-subgroup. The restriction of the crossed order to $S$, with identity component $B_0$,
    is a block of a finite group. Its defect order is bounded in terms of $p \, M$,
    and its integral Morita–Frobenius number is bounded in the same parameters.
    All these restriction blocks have finitely many integral Morita classes.]
] <prop:sylow-block>

#proof[
  #emph[Constructing the group and its block.] Use the actual automorphisms $alpha_s$ of $macron(N)$ and actual
    elements $n_(s \, t) in N$ supplied by Proposition 5(ii). On the finite set $macron(N) times S$ define
  #[#set math.equation(numbering: n => "(11)")
   $ \( g \, s \) \( h \, t \) = #scale(x: 120%, y: 120%)[\(] g alpha_s \( h \) n_(s \, t) \,
     s t #scale(x: 120%, y: 120%)[\)] . $ <eq:extension-group>]
  Equations (3) and (3) give associativity, and their normalizations give the identity and inverses.
    Hence this is a finite group $Gamma_S$ with normal subgroup $macron(N)$ and quotient $S$.
    Sending the crossed generator $u_s$ to $\( 1 \, s \)$ identifies the restriction of the unprojected crossed
    order with $cal(O) Gamma_S$.
  The block $macron(b)$ is $S$-stable. A stable block has a unique covering block in an extension of $p$-power
    index. Its idempotent is $macron(b)$, so our restriction is exactly
  $ A_S = cal(O) Gamma_S macron(b) . $
  #emph[Bounding its defect and coefficient period.] If $D$ is a defect group of this block,
    normal block theory gives a defect group $D ∩ macron(N)$ of $macron(b)$, after conjugacy.
    Moreover $D$ maps into $S$, and in this stable $p$-extension it maps onto $S$. In particular,
  $ \| D \| lt.eq \| S \| thin \| D ∩ macron(N) \| . $
  Both quantities on the right are bounded by Proposition 5.
    Notice that the bound is applied to the group after the central descent in Section 4.
  Proposition 12, applied to these same actual factors, and Lemma 13 give a Morita equivalence between $A_S$ and
    $sigma^m A_S$, with $m$ uniformly bounded. Thus $"mf"_(cal(O)) \( A_S \) lt.eq m$.
    We now have an actual block with both required local bounds.
    Write $M_1 \( p \, M \)$ for the defect-order bound just obtained.
    Proposition 3(i), applied with $M_1 \( p \, M \)$, bounds its Cartan sum.
    Part (ii) of that proposition gives the claimed finite integral Morita list.
    There are only finitely many abstract groups $S$ of the possible bounded orders. ◻
]

=== 5.3 Full basic corners and arbitrary markings <full-basic-corners-and-arbitrary-markings>

Passing to a basic identity component is the integral crossed-product corner construction of
  #cite(label("EiseleReduction2021")) Proposition 4.15 and Corollary 4.16.
  We recall it below to retain the homogeneous units and their labels.

#thm([Theorem 5.3.])[
  (Based finiteness on $p$-subgroups).  #emph[Compress the crossed orders of Proposition 5 by a basic idempotent
    in the identity block, and identify the resulting identity order with a representative $R_i$ of its finite
    list. For every possible abstract $p$-group $S$, their restrictions to $S$ have finitely many based graded
    isomorphism classes. The identity-order identifications may be chosen arbitrarily over $cal(O)$.]
] <thm:based-sylow>

#proof[
  #emph[Pure subgroups and a fixed identity order.] First suppose $S$ is pure.
    Let $e$ be a basic idempotent of $B_0$. For every homogeneous automorphism,
    its translate of $e$ is conjugate to $e$ by a unit of $B_0$:
    both idempotents represent a projective module containing one copy of every indecomposable projective type.
    Correcting each homogeneous unit by such a unit of $B_0$ makes it commute with $e$. Consequently
  $ C_S = e A_S e $
  is a crossed order on $R = e B_0 e$, and
  #[#set math.equation(numbering: n => "(12)")
   $ "rank"_(cal(O)) C_S = \| S \| "rank"_(cal(O)) R . $ <eq:corner-rank>]
  The idempotent $e$ is full in $A_S$, since it is already full in $B_0$.
  Proposition 14 gives finitely many Morita classes for these total orders.
    For fixed $R$ and $S$, Proposition 10 now gives finitely many based graded types.
    The proof of that proposition applies here because each $C_S$ is Morita equivalent to the actual block $A_S$.
    In particular, its first Hochschild cohomology vanishes. Equation (12) also displays explicitly the rank bound
    used to pass from Morita classes to isomorphism classes of total orders.
  #emph[Transport from arbitrary subgroups.] For an arbitrary $p$-subgroup of $Q$,
    conjugate by a character in $Xi$ to make it pure, as explained after Proposition 5.
    Conjugation is implemented by an integral homogeneous unit and transports the identity block and its full
    basic corner. The transported identity order is still in the same finite list.
    Arbitrary integral markings are already included in Proposition 10;
    inner differences are absorbed by conjugation in degree one, and outer differences form a finite set.
    Transporting back proves the assertion for the original subgroup and all its markings. ◻
]

The information retained by this theorem is stronger than a Morita list:
  an isomorphism fixes the specified copy of $R$ and every group label.
  This is exactly what the kernel argument will need when it compares central factor systems after correcting the
  matrix actions. The integral finiteness came from actual block orders and rigidity,
  without a point count over $W \( bb(F)_q \)$.

== 6 Removing an unbounded prime-to-$p$ kernel <sec:kernel>

We now turn the finite based lists on $p$-subgroups into a finite Morita list for block summands of the whole
  crossed order. Its grading group may have unbounded order.
  The bounded quantity is its index over its largest normal $p'$-subgroup.

The proof refines the field argument of #cite(label("OpenAIFieldDonovan2026")) Lemma 8.7 through the
  Clifford-theoretic matrix corners of #cite(label("KulshammerClifford1990")) #cite(label("Kulshammer1995")).
  Over $cal(O)$, the principal-unit argument uses unique prime-to-$p$ divisibility.
  Removing a matrix factor creates a second scalar error; determinant normalization places it in $cal(T)$,
  so the original based Sylow restriction is recovered exactly.
  After these two steps, the remaining crossed systems have bounded grading groups and finite fibres under restriction.

=== 6.1 Central units and the restriction kernel <central-units-and-the-restriction-kernel>

The principal-unit argument follows #cite(label("EiseleReduction2021")) Lemma 4.4.
  Sylow restriction will control the part for which the grading group may have $p$-torsion.

#thm([Lemma 6.1.])[
  (Units of the centre).  #emph[Let $R$ be an indecomposable $cal(O)$-order and put $Z_R = Z \( R \)$.
    Then $Z_R$ is local with residue field $k$, and
#[#set math.equation(numbering: n => "(13)")
 $ Z_R^times = cal(T) times U_R \, wide U_R = 1 + "rad" Z_R . $ <eq:center-units>]

 This decomposition is invariant under every $cal(O)$-algebra automorphism of $R$.
   If $n$ is prime to $p$, the map $u mapsto u^n$ is an automorphism of $U_R$.]
] <lem:center-units>

#proof[
  The finite commutative $cal(O)$-algebra $Z_R$ is a product of complete local algebras,
    by henselianity of $cal(O)$. More than one factor would give a nontrivial central idempotent of $R$.
    It is therefore local. Its residue field is a finite extension of the algebraically closed field $k$,
    hence is $k$. The residue map on units is split by the scalar Teichmüller units, and its kernel is $U_R$,
    proving Equation (13). Both factors are canonical and are preserved by the stated automorphisms;
    these act trivially on $cal(T)$.
  For $u in U_R$, the polynomial $X^n - u$ has the root $1$ modulo the maximal ideal, with derivative $n$ a unit.
    Hensel’s lemma gives a unique root in $U_R$. This proves the last assertion. ◻
]

#thm([Lemma 6.2.])[
  (Finite kernel of Sylow restriction).  #emph[Let a finite group $Q$ act by $cal(O)$-algebra automorphisms on
    $Z_R$, and let $S$ be a Sylow $p$-subgroup of $Q$. Then
$ "res" : H^2 \( Q \, Z_R^times \) arrow.r H^2 \( S \, Z_R^times \) $

 has finite kernel.]
] <lem:restriction>

#proof[
  The two factors in Equation (13) play different roles: restriction is injective on the principal-unit part,
    while the entire Teichmüller cohomology group is finite. On $U_R$ the composite $"cor" compose
    "res"$ is multiplication by $\[ Q : S \]$. This is an automorphism on $U_R$, by Lemma 16,
    and therefore on its cohomology. Restriction is consequently injective on $H^2 \( Q \, U_R \)$.
  On $cal(T)$, the action is trivial and $H^2 \( Q \, cal(T) \)$ is finite. Indeed, let $d = \| Q \|$.
    The $d$th-power map on $cal(T)$ is onto and has the finite kernel $mu_d \( cal(O) \) ∩ cal(T)$.
    The exact sequence in cohomology and the annihilation of positive cohomology by $d$ show that
    $H^2 \( Q \, cal(T) \)$ is a quotient of
  $ H^2 \( Q \, mu_d \( cal(O) \) ∩ cal(T) \) \, $
  which is finite because both the group and the coefficient module are finite.
    Combining the two factors proves the lemma. ◻
]

=== 6.2 The integral extension theorem <the-integral-extension-theorem>

#thm([Theorem 6.3.])[
  (Integral kernel removal).  #emph[Fix an indecomposable basic $cal(O)$-order $R$ Morita equivalent to a
    finite-group block, and a finite subgroup $cal(F) lt.eq "Out"_(cal(O)) \( R \)$.
    Consider crossed orders on $R$ by finite groups $Q$ with the following properties:]
  + #emph[the indices $\[ Q : O_(p') \( Q \) \]$ are bounded;]
  + #emph[every outer action has image in $cal(F)$;]
  + #emph[for each possible abstract $p$-group, the restrictions to subgroups of that type have finitely many
    based graded isomorphism classes.]
  #emph[Then the block summands of these crossed orders have only finitely many $cal(O)$-linear Morita equivalence
    classes.]
] <thm:kernel>

#proof[
  Write $A = xor.big_(q in Q) R u_q$ for one crossed order and set
  #[#set math.equation(numbering: n => "(14)")
   $ K = O_(p') \( Q \) ∩ ker \( Q arrow.r cal(F) \) . $ <eq:large-kernel>]
  It is a normal $p'$-subgroup, and $\[ Q : K \] lt.eq \[ Q : O_(p') \( Q \) \] \| cal(F) \|$ is bounded.
    We isolate its twisted group algebra, pass to matrix corners, verify their Sylow restrictions,
    and finally count central factor systems on the bounded quotient.
  #emph[Scalar factors on $K$.] Since $K$ acts trivially modulo inner automorphisms,
    change the $K$-degree units so that they centralize $R$. Their factors belong to $Z_R^times$ and form an
    ordinary $2$-cocycle for the trivial $K$-action. Multiplication by $\| K \|$ is invertible on $U_R$,
    so $H^i \( K \, U_R \) = 0$ for $i > 0$. Removing the $U_R$-component by a central change of units gives units
    $v_k$ with
  $ v_k v_l = beta \( k \, l \) v_(k l) \, wide beta \( k \, l \) in cal(T) . $
  Their $cal(O)$-span is a twisted group algebra $E = cal(O)_beta K$, and the restriction to $K$ is $R ⊗_(cal(O)) E$.
  Every homogeneous unit of $A$ normalizes $E$. To verify this, write
  $ u_q v_k u_q^(- 1) = z_k v_(q k q^(- 1)) \, wide z_k in Z_R^times . $
  The coefficient is central because both sides centralize $R$.
    Comparing the products for $k \, l in K$ shows that their $U_R$-components define a homomorphism $K arrow.r
    U_R$: the original factors, their conjugates, and the factors in the new $K$-degrees all lie in $cal(T)$.
    Such a homomorphism is trivial, since multiplication by $\| K \|$ is invertible on $U_R$.
    Hence every $z_k$ belongs to $cal(T)$, proving normalization of $E$.
  #emph[The matrix factors of $E$.] The finitely many values of $beta$ generate a finite $p'$-subgroup of
    $cal(T)$. The usual central extension defined by $beta$ is therefore a finite $p'$-group,
    and $E$ is its character summand over $cal(O)$. A finite $p'$-group algebra over $cal(O)$ is a product of full
    matrix algebras: its reduction is split semisimple, and the matrix units lift over the complete ring $cal(O)$.
    Each lifted primitive corner has rank one and is $cal(O)$. We obtain
  #[#set math.equation(numbering: n => "(15)")
   $ E tilde.equiv product_j M_(n_j) \( cal(O) \) . $ <eq:matrix-E>]
  Every $n_j$ is prime to $p$. Indeed these are ordinary irreducible character degrees in the indicated character
    sector of a finite $p'$-group; each such degree divides the group order.
  Let $e_j$ denote the identity of one matrix factor. The $Q$-orbits on these idempotents give central summands of
    $A$. In each orbit summand a single $e_j$ is full, because its homogeneous conjugates sum to that orbit
    idempotent. Let $Q_j^(upright("pre"))$ be its stabilizer.
    It contains $K$, and the $e_j$-corner, with its grading coarsened by $K$, is crossed over
  $ R ⊗_(cal(O)) M_n \( cal(O) \) \, wide n = n_j \, $
  by the group $Q_j = Q_j^(upright("pre")) \/ K$. The order of $Q_j$ is bounded by $\[ Q : K \]$.
  In each $Q_j$-degree choose a unit $e_j u_q$ inherited from an original $Q$-degree.
    Its conjugation preserves both $R$ and $M_n \( cal(O) \)$, by the normalization of $E$ proved above.
    Every $cal(O)$-algebra automorphism of $M_n \( cal(O) \)$ is inner.
    For example, its images of the standard matrix idempotents split $cal(O)^n$ into free rank-one summands;
    choosing compatible basis vectors for the matrix units constructs an implementing matrix.
    Correct the homogeneous units by these matrices so that they centralize the matrix factor.
    Their multiplication factors then lie in its centralizer inside $R ⊗_(cal(O)) M_n \( cal(O) \)$, namely $R$.
    The orbit corner is consequently
  $ M_n \( cal(O) \) ⊗_(cal(O)) C_j \, $
  where $C_j$ is a $Q_j$-crossed order on $R$ with the same outer action on $R$.
    Equivalently, $C_j$ is the centralizer of the matrix factor in the orbit corner.
  This passage replaces the unbounded group $Q$ by the bounded group $Q_j$. It has not yet supplied a finite list:
    the matrix corrections may change the multiplication factors of a restriction. We next recover those factors.
    The matrix size need not be bounded; its prime-to-$p$ property is what the recovery uses.
  #emph[Preservation of the based Sylow restriction.] Let $S$ be a Sylow $p$-subgroup of $Q_j$.
    Schur–Zassenhaus in its inverse image gives a $p$-subgroup $tilde(S) lt.eq
    Q_j^(upright("pre"))$ mapping isomorphically onto $S$. Use the original units $u_s$ in these degrees,
    with original factors $a_(s \, t) in R^times$. Their conjugations on $E_j =
    M_n \( cal(O) \)$ form an honest group action, since $a_(s \, t)$ centralizes $E_j$.
  Choose implementing matrices $c_s in upright("GL")_n \( cal(O) \)$, with $c_1 = 1$. We may take $det c_s = 1$.
    In fact, since $p divides.not n$, every unit of $cal(O)$ has an $n$th root:
    take a Teichmüller root of its residue and then use Hensel’s lemma on the principal-unit part.
    Multiplication by a scalar thus normalizes the determinant without changing the implemented automorphism.
  Because the automorphisms form a group action, there is a scalar $gamma \( s \, t \) in cal(O)^times$ such that
  $ c_s c_t c_(s t)^(- 1) = gamma \( s \, t \) I_n . $
  Taking determinants gives $gamma \( s \, t \)^n = 1$. Thus $gamma \( s \, t \) in cal(T)$,
    since $n$ is prime to $p$. Associativity shows that $gamma$ is a normalized $cal(T)$-valued $2$-cocycle on $S$.
  For the corrected units $w_s = c_s^(- 1) e_j u_s$, their actions on $R$ are unchanged.
    The formula for their products is
  #[#set math.equation(numbering: n => "(16)")
   $ w_s w_t = gamma \( s \, t \)^(- 1) a_(s \, t) w_(s t) . $ <eq:corrected-matrix-factors>]
  For example, this follows by using $u_s c_t u_s^(- 1) = c_s c_t c_s^(- 1)$ in the product on the left.
    Lemma 11 removes $gamma$ by scalar rescaling. Therefore the restriction of $C_j$ to $S$ is based-isomorphic to
    the original restriction to $tilde(S)$. The corrected units generate the corresponding homogeneous
    $R$-components of the centralizer $C_j$. For a fixed original unit,
    any two implementing matrices differ by a scalar unit; the subsequent scalar rescaling also changes only the
    generator of its component. Thus these choices change the presentation, not the based graded order.
    Hypothesis (iii) supplies a finite list for the restrictions now obtained.
  #emph[Crossed systems on a bounded quotient.] There are finitely many possible abstract groups $Q_j$ and outer
    homomorphisms $Q_j arrow.r cal(F)$. Fix one of each and choose representatives $alpha_q in
    "Aut"_(cal(O)) \( R \)$ of its outer classes. Changing homogeneous units makes every crossed system with this
    outer action use these same automorphisms. If any factors satisfying the crossed identities exist,
    their classes under central changes of units form a torsor under
  #[#set math.equation(numbering: n => "(17)")
   $ H^2 \( Q_j \, Z_R^times \) . $ <eq:factor-torsor>]
  Indeed, the ratio of two factor systems with these fixed actions is central by Equation (1).
    Equation (1) says that the ratio is a $2$-cocycle. A homogeneous-unit change preserving every $alpha_q$ must
    itself be central, and changes the ratio by a coboundary.
    The action on the centre is a genuine group action because inner automorphisms act trivially there.
  On a Sylow $p$-subgroup, the based finiteness just proved gives finitely many restricted torsor classes.
    To see that the fixed representatives cause no extra ambiguity,
    observe that a based isomorphism between systems with the same automorphisms must change their units
    centrally. Lemma 17 gives finite fibres for the restriction map from Equation (17):
    a nonempty fibre is a coset of its finite kernel. Thus there are finitely many based crossed orders $C_j$.
  Each $C_j$ has only finitely many block summands. The orbit corners above are matrix algebras over them,
    and the selected $e_j$ was full in the corresponding orbit summand of $A$.
    Hence every block summand of $A$ is Morita equivalent to one of this finite list of block summands of the
    $C_j$. Neither the number of matrix factors in Equation (15) nor their sizes had to be bounded.
    This proves the theorem. ◻
]

The two scalar normalizations in this proof have different reasons.
  On $K$, its prime-to-$p$ order makes principal-unit cohomology vanish.
  On the lifted Sylow subgroup, the determinant first forces the error into $cal(T)$,
  and only its $cal(T)$-cohomology is used. Neither step asserts vanishing of principal-unit cohomology on a $p$-group.

== 7 Proof of integral Donovan finiteness <sec:assembly>

Fix $p$ and $M$. The previous sections supply three inputs for the last step:
  finitely many integral basic identity orders, finite based restrictions on their $p$-subgroups,
  and the integral kernel-removal theorem. We check these inputs for an arbitrary finite-group block.

#proof[
  Let $B$ be a block of $cal(O) G$ with defect order at most $M$.
    #emph[Reduction and the identity order.] The integral An–Eaton reduction gives a reduced pair $\( H \, B_H \)$
    with $B_H$ $cal(O)$-Morita equivalent to $B$ and with the same defect group. Apply Proposition 5.
    Its integral dual recovery realizes $B_H$, up to full corners,
    as a block summand of a crossed order on an identity block $B_0$,
    with grading group $Q$ satisfying a uniform bound on $\[ Q : O_(p') \( Q \) \]$.
  Compress by a basic idempotent of $B_0$. As in the proof of Theorem 15,
    correction of the homogeneous units makes the resulting full corner a crossed order on one of the finite list
    $R_1 \, dots.h \, R_t$. Its outer action lies in the finite group $"Out"_(cal(O)) \( R_i \)$,
    by Lemma 7 or Proposition 5(iv).
  #emph[The restrictions and the kernel.] Theorem 15 supplies finitely many based restrictions on every possible
    $p$-subgroup. Its proof used the exact integral comparison on the actual extension blocks,
    followed by fixed-total-order rigidity; hence these are the based restrictions required in the kernel theorem.
  All three hypotheses of Theorem 18 now hold for this family over $R_i$:
    bounded $\[ Q : O_(p') \( Q \) \]$, finite outer-action image, and finite based $p$-subgroup restrictions.
    Their block summands therefore have finitely many integral Morita classes.
  #emph[The finite union.] Taking the finite union over $i$ gives a list independent of $G$ and $b$.
    The full-corner equivalences and the preliminary integral reduction place the original $B$ in that list.
    This proves the theorem. ◻
]

#thm([Corollary 7.1.])[
  #emph[For every $p \, M$, there is a finite list of integral basic orders $R'_1 \, dots.h \,
    R'_v$ such that the basic algebra of every block of $k G$ of defect order at most $M$ is isomorphic to
    $k ⊗_(cal(O)) R'_i$ for some $i$. In particular the blocks over $k$ of bounded defect have finitely many
    $k$-linear Morita classes.]
] <cor:reduction>

#proof[
  Every block idempotent over $k$ has its unique central idempotent lift to $cal(O) G$.
    Lift a basic idempotent in that block. Its corner is an integral basic order,
    and reduction gives the original basic algebra. Theorem 1 makes the integral basic orders a finite list,
    proving both assertions. ◻
]

The residue-field finiteness in Corollary 19 was already established by the field companion and supplied the
  Cartan input in Proposition 3. The corollary now identifies a finite list of integral basic orders whose
  reductions represent those field algebras. The proof of that stronger conclusion has used the explicit integral
  constructions throughout; it has not required lifting an arbitrary field Morita equivalence.

=== 7.1 Scalar extension to a fixed complete coefficient ring <scalar-extension-to-a-fixed-complete-coefficient-ring>

#proof[
  Keep $k = overline(bb(F))_p$ and $cal(O) = W \( k \)$, and fix $cal(R)$ and its residue field $ell$ as in the
    corollary. Choose an embedding $iota : k arrow.r.hook ell$.
    Since $ell$ is perfect, $W \( ell \)$ is a Cohen ring. The coefficient-ring theorem
    #cite(label("StacksCohen")) Theorem 10.160.8, Tag 032A gives a local map $W \( ell \) arrow.r
    cal(R)$ inducing the identity on $ell$. It is injective: any nonzero ideal of the DVR $W \( ell \)$ contains a
    power of $p$, whereas $cal(R)$ has characteristic zero. Composing with the Witt-vector map $W \( iota \)$,
    which is injective on Witt coordinates, gives a fixed local embedding
  $ cal(O) = W \( k \) arrow.r^(W \( iota \)) W \( ell \) arrow.r.hook cal(R) $
  whose residue map is $iota$. Only this coefficient embedding is used;
    no finiteness of $cal(R)$ over $cal(O)$ is needed.
  We recall the residue-field argument of #cite(label("OpenAIAlperinWeight2026")) Section 2.1.
    For every finite group $G$, scalar extension identifies $Z \( ell G \) = ell ⊗_k Z \( k G \)$.
    Each local factor of the finite commutative algebra $Z \( k G \)$ has nilpotent radical and residue field $k$.
    After extending to $ell$, the extended radical is a nilpotent ideal with quotient $ell$,
    so the factor remains local. Consequently every primitive central idempotent $macron(b)$ of $ell
    G$ is uniquely of the form $1 ⊗ macron(b)_0$ for a primitive central idempotent $macron(b)_0$ of $k G$.
    For every $p$-subgroup $Q lt.eq G$, restriction of coefficients to $C_G \( Q \)$ gives
  $ "Br"_Q^ell \( macron(b) \) = 1 ⊗ "Br"_Q^k \( macron(b)_0 \) . $
  Faithfulness of field extension shows that these Brauer images are nonzero for the same $Q$.
    The characterization of defect groups as the maximal $p$-subgroups with nonzero Brauer image therefore gives
    the same defect groups for the two residue blocks.
  For either coefficient pair $\( Lambda \, F \) = \( cal(O) \, k \)$ or $\( cal(R) \, ell \)$,
    the class sums give a $Lambda$-basis of $Z \( Lambda G \)$ whose reductions give an $F$-basis of
    $Z \( F G \)$. Thus $Z \( Lambda G \)$ is a finite free complete commutative $Lambda$-algebra with residue
    algebra exactly $Z \( F G \)$. Idempotents in this residue algebra lift uniquely:
    the derivative $2 x - 1$ of $x^2 - x$ is a unit at an idempotent modulo the maximal ideal of $Lambda$,
    so the complete-ring Hensel argument applies, including when $p = 2$.
    Primitivity is preserved, since central decompositions lift and an idempotent reducing to zero is zero.
  Now let $b$ be a block idempotent of $cal(R) G$, and let $b_0$ be the unique central idempotent of $cal(O)
    G$ lifting the corresponding $macron(b)_0$. The image of $b_0$ in $cal(R)
    G$ is a central idempotent reducing to $macron(b)$, so uniqueness of the central lift makes it equal to $b$.
    In particular
  #[#set math.equation(numbering: n => "(18)")
   $ cal(R) G b tilde.equiv cal(R) ⊗_(cal(O)) \( cal(O) G b_0 \) $ <eq:complete-dvr-block-base-change>]
  as $cal(R)$-algebras, and $b_0$ has the same defect group as $b$.
  Finally, scalar extension preserves the specified linear Morita equivalences.
    Indeed, for finite $cal(O)$-algebras $A \, B$, a $cal(O)$-linear Morita equivalence is represented by inverse
    $cal(O)$-central Morita bimodules $zws_B P_A$ and $zws_A Q_B$ with
  $ P ⊗_A Q tilde.equiv B \, wide Q ⊗_B P tilde.equiv A . $
  Write $A_(cal(R)) = cal(R) ⊗_(cal(O)) A$ and similarly for $B \, P \, Q$.
    Base change of the bimodules and their context maps gives
  $ P_(cal(R)) ⊗_(A_(cal(R))) Q_(cal(R)) & tilde.equiv cal(R) ⊗_(cal(O)) \( P ⊗_A Q \) tilde.equiv B_(cal(R)) \,\
Q_(cal(R)) ⊗_(B_(cal(R))) P_(cal(R)) & tilde.equiv cal(R) ⊗_(cal(O)) \( Q ⊗_B P \) tilde.equiv A_(cal(R)) . $
  The Morita-context identities are preserved, as are finite projectivity and the generator property.
    These bimodules therefore give an $cal(R)$-linear Morita equivalence on finitely generated modules.
  Choose the finite list of $cal(O)$-block representatives of defect order at most $M$ from Theorem 1.
    The block $cal(O) G b_0$ in (18) has that defect bound, so it is $cal(O)$-linearly Morita equivalent to one
    representative. The base-changed context puts $cal(R) G b$ in the Morita class of its scalar extension.
    These scalar extensions form a finite list over the fixed ring $cal(R)$, proving the corollary. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
