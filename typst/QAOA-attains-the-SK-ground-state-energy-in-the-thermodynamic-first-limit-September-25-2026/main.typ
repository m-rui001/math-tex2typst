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

#align(center)[#text(size: 16pt, weight: "bold")[QAOA attains the SK ground-state energy \
in the thermodynamic-first limit]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction and statement of the result <sec:introduction>

The Sherrington–Kirkpatrick (SK) model was introduced by Sherrington and Kirkpatrick [22] as a mean-field Ising
  spin glass with independent Gaussian pair interactions. Parisi’s replica-symmetry-breaking description uses a
  hierarchy of order parameters [20]. Guerra’s interpolation established the Parisi upper bound for the
  pressure [12], and Talagrand proved equality [23].

Farhi, Goldstone, and Gutmann introduced the quantum approximate optimization algorithm (QAOA) as alternating
  evolution under an objective Hamiltonian and a transverse-field mixer,
  starting from the uniform superposition [10]. For this model, Farhi, Goldstone, Gutmann,
  and Zhou developed an exact description of its performance at every fixed depth in the infinite-size limit and
  proved concentration at fixed parameters [11]. Basso, Farhi, Marwaha, Villalonga,
  and Zhou related that limit to QAOA on large-degree trees and conjectured that increasing depth eventually
  attains the Parisi optimum [4] Section 7, Equation (7.2).
  Boulebnane et al. [5] proved a fixed-depth spin–boson representation and used it to obtain numerical evidence
  for convergence towards the Parisi value. Their representation provides a useful Hilbert-space language for the
  limit. The construction here must also realize bounded classical computations and eliminate longitudinal seed
  controls before selecting one ordinary word.

Sels and Morone [21] studied QAOA on the SK model using a semiclassical truncated-Wigner approximation and
  compared its performance with quantum data. Their numerical results and heuristic analysis give further evidence
  for convergence to the Parisi value and suggest a depth scaling.

The order of limits distinguishes this question from the fixed-instance optimality proved by Farhi, Goldstone,
  and Gutmann [10] Section VI, Equation (10): for each fixed instance,
  increasing the depth approaches its optimum. That result does not provide a finite depth that works as the
  number of spins tends to infinity. We instead choose a complete finite word for each desired accuracy and then
  let the number of spins tend to infinity. The quantum construction simulates a finite classical calculation,
  using temporary Gaussian seed controls and then removing them.

There are two ways to supply the classical calculation. Auffinger, Chen,
  and Zeng proved that the zero-temperature Parisi order parameter has infinitely many support points [3]
  Theorem 1; Chen proved full support on $\[ 0 \, 1 \)$ and a smooth density [6] Theorem 1.3.
  Our primary route uses the companion #emph[Full support of the zero-temperature Sherrington–Kirkpatrick order
  parameter] [19]. Its scalar diffusion yields a finite function of independent Gaussian variables and a
  coefficient formula for its value. We realize that function directly in the rooted Hilbert space and identify
  the coefficient formula with its energy. The imported scalar facts are full support of the zero-temperature
  order parameter, the diffusion’s consistency and value identities, and a finite Gaussian coefficient identity.
  Section 3 states these inputs before constructing their rooted realization.

We also give an independent positive-temperature route. It follows the Parisi-diffusion approach of
  Montanari [18], whose optimization theorem assumes interval support of the positive-temperature Parisi measure,
  and the broader framework of El Alaoui, Montanari, and Sellke [8].
  Lopatto’s full-support theorem [16] supplies that positive-temperature support property.
  The finite-iteration Gaussian and edge-energy analysis of El Alaoui, Montanari,
  and Sellke [9] then gives a near-optimal descendant formula.
  This second route has its own quantitative and finite-degree statements and does not use the zero-temperature
  companion.

=== 1.1 Model and quantifiers <model-and-quantifiers>

Let $\( J_(i j) \)_(1 lt.eq i < j lt.eq n)$ be independent standard real Gaussian random variables.
  For $sigma in { - 1 \, 1 }^n$, set

#[#set math.equation(numbering: n => "(1.1)")
 $ h_(n \, J) \( sigma \) = 1 / sqrt(n) sum_(i < j) J_(i j) sigma_i sigma_j \, wide C_(n \, J) = 1 /
   sqrt(n) sum_(i < j) J_(i j) Z_i Z_j \, wide B_n = sum_(i = 1)^n X_i . $ <eq:sk-model>]

Here $X \, Y \, Z$ are the Pauli matrices. The positive SK optimum is

#[#set math.equation(numbering: n => "(1.2)")
 $ P_(*) = lim_(n arrow.r oo) 1 / n bb(E) max_sigma h_(n \, J) \( sigma \) . $ <eq:parisi-constant>]

The ground-state Parisi formula and its attainment are due to Auffinger and Chen [2].
  We use the covariance convention $xi \( t \) = t^2 \/ 2$;
  its exact relation to the unordered-pair model is stated with the scalar input in Section 3.
  Appendix 8 also obtains this limit from the positive-temperature formula and a log-sum comparison.

For $p gt.eq 1$ and $gamma \, beta in bb(R)^p$, define

#[#set math.equation(numbering: n => "(1.3)")
 $ \| psi_(n \, p \, J) \( gamma \, beta \) chevron.r = e^(- upright(i) beta_p B_n)
   e^(- upright(i) gamma_p C_(n \, J)) dots.h.c e^(- upright(i) beta_1 B_n)
   e^(- upright(i) gamma_1 C_(n \, J)) \| + chevron.r^(⊗ n) . $ <eq:qaoa-state>]

All parameters are deterministic. Write

#[#set math.equation(numbering: n => "(1.4)")
 $ v_p \( gamma \, beta \) = lim_(n arrow.r oo) 1 / n bb(E) chevron.l psi_(n \, p \, J) \( gamma \, beta \) \|
   C_(n \, J) \| psi_(n \, p \, J) \( gamma \, beta \) chevron.r \, wide Q_p =
   sup_(gamma \, beta in bb(R)^p) v_p \( gamma \, beta \) . $ <eq:qaoa-value>]

The fixed-parameter limit exists [11,4].

#thm([Theorem 1.1.])[
  #emph[For the zero-field SK model (1.1),
#[#set math.equation(numbering: n => "(1.5)")
 $ lim_(p arrow.r oo) Q_p = P_(*) . $ <eq:main-result>]

 Equivalently, for every $epsilon > 0$ there exist a finite integer $p$ and deterministic real vectors $gamma \,
   beta in bb(R)^p$, independent of $n$ and $J$, such that $v_p \( gamma \, beta \) gt.eq P_(*) - epsilon$.]
] <thm:main>

This proves the conjectured eventual Parisi optimality in the fixed-parameter thermodynamic formulation of [4].
  Measurement in the computational basis immediately gives $Q_p lt.eq P_(*)$.
  Appending a zero-angle layer gives $Q_(p + 1) gt.eq Q_p$.
  Thus the theorem reduces to constructing a finite word at every prescribed accuracy.
  The final word may contain inverse gates, zero angles, and very large angles, all of which are allowed in (1.3).
  A finite word in costs and mixers can always be written in that alternating form by merging consecutive gates of
  the same kind and inserting identity gates.

The theorem is stated in expected energy. The argument gives no quantitative finite-size estimate, depth bound,
  or efficient procedure for choosing the angles.

=== 1.2 How the construction works <how-the-construction-works>

The proof separates a classical choice of target from its quantum implementation.
  The intermediate setting is the large-degree regular tree:
  each vertex carries an independent Gaussian label, and a finite rooted calculation only reads labels within a
  fixed radius. Normalized sums of centered child calculations become jointly Gaussian coordinates.
  Section 2 gives a Hilbert-space realization of these coordinates and a continuous quadratic expression for the
  limiting energy.

The scalar companion provides a bounded odd function of finitely many independent Gaussians whose value approaches
  $P_(*)$. In Section 3, each new Gaussian is the normalized aggregate of a suitable calculation one level below.
  An orthogonality induction makes the joint Gaussian law exact.
  The one-particle part of the resulting function gives its rooted energy,
  so the scalar value formula passes to this realization without a separate finite-degree edge expansion.

We next approximate all transmitted functions by bounded smooth ones.
  A finite label assigns a #emph[type] to each vertex. Splitting the label space into sufficiently small types
  lets every aggregation omit the receiver’s type, the types of all its path ancestors,
  and a small reserved set of helper types, at arbitrarily small energy cost.
  These exclusions prevent a compiled operation from feeding back into its own parameters.
  They do not assert independence of calculations using the same descendant subtree.
  Proposition 21 gives the resulting bounded finite formula,
  with its output written as $sin \( 2 theta \)$ for a bounded angle calculation $theta$.

Theorem 22 implements these angles using cost and mixer gates together with a longitudinal field formed from the
  Gaussian labels. To implement a neighbor sum, commutators combine interactions along a
  receiver–sender–helper–sender walk. When the walk returns to the same sender, the helper spin,
  held in its initial state, supplies the desired term. We subdivide the sender type and retain only walks whose
  two sender visits lie in the same part. This keeps every returning walk,
  while the different-sender contribution vanishes as the parts become small.
  The proof also controls the effects inside the lower calculations,
  which are called repeatedly within a fixed surrounding circuit.
  Helpers have arbitrarily small total probability; discarding their output is included in the energy estimate.

Theorem 26 then removes the longitudinal field from the already selected finite circuit.
  An imperfect cost echo creates a small component with a large coherent displacement.
  Selective spin rotations change that component while canceling their leading action on the rest of the state;
  a long cost echo magnifies the change into a finite longitudinal field.
  Separating its direction from the circuit’s existing Gaussian coordinates gives a seed that can be reused at
  every requested seed gate. A separate one-particle calculation shows that this Gaussian identification also
  preserves the rooted energy. The elementary ensemble-control ideas are related to those of Li and Khaneja [15];
  Section 5 proves the estimates for one fixed circuit, including its changing insertion directions and the
  singular echo.

After all these choices there is one finite ordinary cost–mixer word.
  Only at this point do we invoke the fixed-word tree-to-SK identity of Basso et al. [4].
  The exact error allocation and the order of choices are given in Section 6,
  after the three constructions have been established.

=== 1.3 A regular MaxCut consequence <sec:regular-maxcut>

For a finite simple graph $G = \( V \, E \)$ with $E eq.not diameter$, put

$ H_(upright("MC")) \( G \) = 1 / 2 sum_({ u \, v } in E) \( I - Z_u Z_v \) \, wide B_G = sum_(v in V) X_v . $

For $a \, b in bb(R)^p$, let $chevron.l dot.op chevron.r_(p \, a \, b)^G$ denote expectation with the gate order
  and signs of (1.3), using cost $H_(upright("MC")) \( G \)$, mixer $B_G$, angles $a \, b$,
  and initial state $\| + chevron.r^(⊗ \| V \|)$. The expected fraction of edges cut by a computational-basis
  measurement is

$ q_(p \, G) \( a \, b \) = frac(chevron.l H_(upright("MC")) \( G \) chevron.r_(p \, a \, b)^G, \| E \|) . $

Write $"OPT" \( G \) = "MaxCut" \( G \) \/ \| E \|$ for the maximum cut fraction.

#thm([Corollary 1.2.])[
  (Regular MaxCut in successive limits).  #emph[For every $eta > 0$ there are an integer $p gt.eq 1$,
    deterministic normalized angles $gamma \, beta in bb(R)^p$, and an integer $D_0 gt.eq 2$ such that,
    for every integer $D gt.eq D_0$ and every finite simple unweighted $\( D + 1 \)$-regular graph $G$ of girth
    greater than $2 p + 1$,
#[#set math.equation(numbering: n => "(1.6)")
 $ q_(p \, G) \( 2 gamma \/ sqrt(D) \, beta \) gt.eq 1 / 2 + frac(P_(*) - eta, sqrt(D)) . $ <eq:high-girth-maxcut>]

 The word $p \, gamma \, beta$ is independent of $D$, the graph size, and $G$;
   the displayed usual MaxCut cost angles, unlike the normalized angles $gamma$, are scaled with the degree.]
  #emph[Let $G_(n \, d)$ be uniform among simple labelled $d$-regular graphs on $n$ vertices,
    along admissible $n$ with $n d$ even. For the same word, put
$ Delta_D \( G \) = "OPT" \( G \) - q_(p \, G) \( 2 gamma \/ sqrt(D) \, beta \) . $

 The word may be chosen so that
#[#set math.equation(numbering: n => "(1.7)")
 $ lim_(D arrow.r oo) limsup_(n arrow.r oo\
n \( D + 1 \) med upright("even")) Pr_G #h(-0.16667em) [sqrt(D) thin Delta_D \( G_(n \, D + 1) \) > eta] =
  0 . $ <eq:random-regular-maxcut>]

 Here the inner limit keeps $D \, p \, gamma \, beta$ fixed, and $Pr_G$ is only over the graph:
   $q_(p \, G)$ already averages quantum measurement.]
] <cor:regular-maxcut>

The complete proof is given in Section 7, after the fixed-word tree interface and the SK construction.

The optimality comparison concerns random regular graphs in these successive limits,
  not all high-girth graphs or fixed-degree optima. No joint size–degree limit is asserted.
  Here $p$ counts QAOA rounds, not a degree-uniform two-qubit gate depth;
  the cut fraction above averages quantum measurement.

=== 1.4 Reading paths and conventions <reading-paths-and-conventions>

Section 2 develops the fixed-word rooted calculus. Section 3 imports the scalar theorems and constructs the
  bounded excluded formula. Sections 4 and 5 implement it and remove the seeds.
  Section 6 assembles the ordinary word and proves Theorem 1.
  Section 7 then proves the regular-MaxCut consequence from this theorem and the fixed-word tree interface.

For the positive-temperature reading path, Appendix 8 replaces the scalar input and its rooted realization.
  It derives the same classical conclusion independently, using the shared bounded approximation and exclusion
  lemmas of Section 3. The quantum constructions and final assembly are the same for both paths.

Physical system size is $n$, tree degree is $D + 1$, and ordinary circuit depth is $p$.
  The scalar mesh count in Section 3 is $N$; top-generation occupation operators appearing in the operator
  estimates are identified by their operator context. Mixer angles are denoted by $beta$,
  inverse temperature by $beta_0$, and the scalar Parisi coefficient $gamma \( t \)$ is distinct from the vector
  of cost angles. Inner products are antilinear in the first argument.

All constants may depend on a fixed finite formula or word.
  Uniformity in any approximation parameter is stated when required.
  Degree limits are taken with all words and their angles fixed;
  further approximation limits concern the resulting tree values.

== 2 The fixed-word tree calculus <sec:foundations>

This section constructs the common space in which we compare ordinary QAOA words and classical formulas.
  It has three tasks: identify the fixed-word SK value with a tree limit,
  express that limit as a bounded quadratic form, and justify the controlled operations used in synthesis.
  The same space will carry the finite Gaussian construction in Section 3.

We first isolate the transfer from an ordinary word to the tree.
  A word always means a finite word with fixed real coefficients;
  none of the statements below makes a uniform assertion in its length or its coefficients.
  The initial vector $bold(Omega)$ below is the plus product state on the finite light cone used to define the
  edge expectation.

#thm([Proposition 2.1.])[
  (Fixed-word transfer).  #emph[Let $W$ be an ordinary QAOA word,
    and apply the same word to the $\( D + 1 \)$-regular tree with cost $C_D =
    D^(- 1 \/ 2) sum_({ i \, j } in E) Z_i Z_j$, with each unordered edge counted once.
    Its expectation at an edge is defined by restricting to the finite light cone of that edge. Then
#[#set math.equation(numbering: n => "(2.1)")
 $ v_W = lim_(D arrow.r oo) sqrt(D) / 2 chevron.l W_D bold(Omega) \| Z_i Z_j \| W_D bold(Omega) chevron.r .
   $ <eq:tree-transfer>]

 Here $v_W$ is the disorder-averaged thermodynamic SK energy per vertex,
   with the normalization in the introduction. Both limits exist for every fixed word and every fixed choice of
   its angles.]
] <prop:tree-transfer>

#proof[
  This is Theorem 1 of [4], together with its normalizations in Equations (2.3), (2.6), and (6.1)–(6.2).
    Its Equation (3.11) gives the fixed-depth tree value, and Equation (6.3) identifies that value with the SK
    limit. That paper uses the negative of our tree cost. Conjugation by $X$ on one bipartition of the tree
    changes the sign of every $Z_i Z_j$, preserves every mixer, and fixes the initial vector.
    It therefore changes the sign of the edge correlation as well, giving precisely (2.1).
    The SK convention already agrees with the positive Gaussian Hamiltonian in its Equation (6.1).
    Consecutive gates of the same kind and inverses are included by inserting zero-angle gates. ◻
]

We first construct the rooted space and identify its energy functional.
  This also gives the Gaussian coordinates used by the classical construction.
  We then prove the weighted convergence estimates that realize ordinary words in this space and justify
  controlled gates inside a fixed surrounding circuit.

=== 2.1 Pointed spaces and occupation embeddings <sec:pointed-spaces>

The number of children will tend to infinity while the number of circuit layers remains fixed.
  We therefore organize a symmetric collection of child states by how many differ from the initial state.
  The limiting space is a symmetric Fock space: its $m$-particle sector records $m$ such child excitations,
  not $m$ physical spins. The bosonic representation is related to the fixed-depth spin–boson description of
  Boulebnane et al. [5]; the occupation, insertion, and surrounding-circuit estimates used below are proved here.

Let $\( S \, mu \, iota \)$ be a probability space with a measure-preserving involution.
  The cases needed below are a one-point space and a standard Gaussian, with $iota \( s \) = - s$.
  Extra independent marks may be included in $S$. Set

$ sans(k) = bb(C)^2 ⊗ L^2 \( S \, mu \) \, wide omega = \| + chevron.r ⊗ upright(bold(1)) . $

For any pointed space below, write $chevron.l T chevron.r_0 =
  chevron.l bold(Omega) \| T \| bold(Omega) chevron.r$ for the vacuum mean and $Q =
  1 - \| bold(Omega) chevron.r chevron.l bold(Omega) \|$ for its centered projection.
  All seed variables act by multiplication. In particular, a circuit never changes their values.
  The local symmetry is $X ⊗ \( f mapsto f compose iota \)$.

For a pointed Hilbert space $\( H \, bold(Omega) \)$ write $H^compose =
  H ⊖ bb(C) bold(Omega)$ and $Gamma_s \( H^compose \) = xor.big_(m gt.eq 0) \( H^compose \)^(⊗_s m)$.
  At finite height define

#[#set math.equation(numbering: n => "(2.2)")
 $ cal(H)_0 = sans(k) \, wide cal(H)_(h + 1) = sans(k) ⊗ Gamma_s \( cal(H)_h^compose \) \, wide
   bold(Omega)_(h + 1) = omega ⊗ Omega . $ <eq:recursive-spaces>]

The embedding from height $h$ to height $h + 1$ appends empty descendants:
  it is $xi mapsto xi ⊗ Omega$ at height zero, and thereafter is obtained by applying the symmetric Fock functor
  to the preceding embedding. These embeddings preserve the vacuum.
  We identify the spaces with their images and use the completion of their union when convenient.
  Every construction in the proof takes place at some finite height before this completion is used.

Write $R_iota f = f compose iota$. The joint spin/seed parity on these spaces is the vacuum-preserving involution

$ cal(P)_0 = X ⊗ R_iota \, wide cal(P)_(h + 1) = \( X ⊗ R_iota \) ⊗ Gamma_s \( cal(P)_h \|_(cal(H)_h^compose) \) . $

These involutions respect the height embeddings and fix the vacuum, so every odd observable has zero vacuum mean.
  We suppress the height in $cal(P)$ when the space is understood.

The analogous invariant space on a rooted $D$-ary tree is

$ cal(H)_(D \, 0) = sans(k) \, wide cal(H)_(D \, h + 1) = sans(k) ⊗ "Sym"^D \( cal(H)_(D \, h) \) . $

The symmetry here permutes children together with their entire subtrees and seed coordinates.
  It does not discard the seeds. For any pointed space $H$,
  the orthogonal decomposition by the number of nonvacuum tensor factors gives an isometry

#[#set math.equation(numbering: n => "(2.3)")
 $ cal(I)_D : "Sym"^D \( H \) arrow.r xor.big_(m = 0)^D \( H^compose \)^(⊗_s m) . $ <eq:occupation-embedding>]

On a symmetric $m$-particle tensor, the inverse distributes its $m$ nonvacuum factors over the $D$ slots with
  coefficient $binom(D, m)^(- 1 \/ 2)$. Applying this isometry recursively gives isometries $cal(I)_(D \, h) :
  cal(H)_(D \, h) arrow.r cal(H)_h$. Their range projections tend strongly to the identity at each fixed height.
  Indeed, a finite-particle vector involving finitely many child vectors is approximated inductively by vectors in
  these ranges. The finite-tree parity is the tensor product of the local involutions over its vertices;
  the occupation embeddings intertwine it with $cal(P)_h$.

Creation is linear in its argument, annihilation is antilinear, and

$ q \( d \) = a^(*) \( d \) + a \( d \) \, wide \[ q \( d \) \, q \( e \) \] = 2 upright(i) "Im" chevron.l d \,
  e chevron.r . $

Conjugation by the recursive parity sends the child field $q \( d \)$ to $q \( cal(P)_h d \)$;
  an odd child direction therefore gives an odd field at the next height.
  The fields are first defined on finite-particle vectors and then closed.
  Each $q \( d \)$ is essentially self-adjoint there, as follows either from the one-mode Schrödinger
  representation or from the convergence of its exponential series on finite-particle vectors.
  We use $cal(W) \( d \) = e^(upright(i) q \( d \))$. In particular,

#[#set math.equation(numbering: n => "(2.4)")
 $ cal(W) \( d \)^(*) q \( v \) cal(W) \( d \) = q \( v \) - 2 "Im" chevron.l v \, d chevron.r . $ <eq:weyl-shift>]

=== 2.2 Root insertions and edge energy <sec:root-energy>

At finite degree, a rooted vector records the response of a root observable to a circuit.
  Let $U$ be a circuit on a finite subtree and $U_j$ its restriction to child subtree $j$.
  Factoring the child operations defines the root interaction-picture unitary $u$ by

$ U = (⨂_(j upright(" child")) U_j) u . $

For a root Pauli observable $P$, its insertion vector is

$ f_P = U^(*) P U bold(Omega) = u^(*) P u bold(Omega) \, $

because the child operations commute with $P$. For a word evaluated on a neighborhood containing both endpoint
  light cones, the pairing of its two $Z$ insertions gives the expectation of $Z_i Z_j$.
  We will prove convergence of ordinary insertion vectors after establishing the weighted estimates below.
  First we identify the energy of any convergent family of rooted vectors with bounded expected occupation;
  this geometric step needs no circuit estimates.

The insertion vector lives at one root, whereas an edge joins two rooted neighborhoods.
  The following operator moves one centered vector down to a single child while placing the new root in its
  initial state. It will turn the edge pairing into a quadratic form on one common space.

Define the centered root shift by

#[#set math.equation(numbering: n => "(2.5)")
 $ sans(L) : cal(H)^compose arrow.r cal(H)^compose \, wide sans(L) v = omega ⊗ a^(*) \( v \) Omega . $ <eq:root-shift>]

At height $h$ its range lies at height $h + 1$. The definitions are compatible with the height embeddings,
  so $sans(L)$ is an isometry on the centered direct limit.
  Extend it by $sans(L) bold(Omega) = 0$ when writing $sans(L)^(*)$;
  this extension is a partial isometry on the whole pointed space.
  In particular $sans(L)^(*)$ extracts the root-vacuum one-particle component, with a constant root seed.

#thm([Proposition 2.2.])[
  (Energy as a root shift).  #emph[Let $f_D$ be centered, root-invariant,
    finite-radius vectors on the $\( D + 1 \)$-regular tree. Root invariance means that the vector itself is fixed
    by every rooted permutation of complete child subtrees, including their seed coordinates,
    at every vertex of its finite neighborhood. Suppose their occupation embeddings converge strongly to $v$ at a
    fixed finite height and their expected top-generation occupations are bounded uniformly in $D$.
    Place the same rooted vector at the endpoints of an edge,
    calling the resulting vectors $f_(D \, i)$ and $f_(D \, j)$. Then
#[#set math.equation(numbering: n => "(2.6)")
 $ lim_(D arrow.r oo) sqrt(D) / 2 chevron.l f_(D \, i) \, f_(D \, j) chevron.r = cal(E) \( v \) :=
   "Re" chevron.l v \, sans(L) v chevron.r . $ <eq:energy-shift>]

 For any centered $v \, w$,
#[#set math.equation(numbering: n => "(2.7)")
 $ \| cal(E) \( v \) - cal(E) \( w \) \| lt.eq \( parallel v parallel + parallel w parallel \) parallel v -
   w parallel . $ <eq:energy-continuity>]

]
] <prop:energy>

#proof[
  We give the exact finite-degree decomposition. Put $M = D + 1$, let $E$ be the pointed child space,
    and write $N_M$ for the number of nonvacuum children in $sans(k) ⊗ "Sym"^M \( E \)$.
    Let $R_M$ contract a distinguished child against its vacuum, and let
  $ J_M xi = omega ⊗ 1 / sqrt(M) sum_(j = 1)^M bold(Omega)^(⊗ \( j - 1 \)) ⊗ xi ⊗ bold(Omega)^(⊗ \( M - j \)) . $
  The latter is an isometry from $E^compose$. Under occupation embeddings, $J_M^(*) = sans(L)^(*)$ and
  #[#set math.equation(numbering: n => "(2.8)")
   $ R_M = sqrt(1 - N \/ M) \, wide parallel R_M f - f parallel^2 lt.eq
     M^(- 1) chevron.l \| f N_M \| chevron.r f . $ <eq:vacuum-deletion>]
  Indeed, in the $m$-particle sector the fraction of placements surviving deletion is $binom(M - 1, m) \/
    binom(M, m) = 1 - m \/ M$.
  Delete the distinguished edge and let $P_A \, P_B$ denote the vacuum projections on its two half-trees.
    Decompose $f_(D \, i)$ with $P_B + \( 1 - P_B \)$ and $f_(D \, j)$ with $P_A + \( 1 - P_A \)$.
    The term with both vacuum projections is zero: the surviving half-tree vectors are centered.
    If just one side is excited, the other side being vacuum forces the root and all the other branches of the
    first vector to be vacuum. With $s_D = J_M^(*) f_D$ and $r_D = R_M f_D$,
    the two such terms are $chevron.l s_D \, r_D chevron.r \/ sqrt(M)$ and its conjugate.
    Heights in this pairing are matched by adding empty descendants.
    Each remaining excited-side vector has squared norm $chevron.l f_D \| N_M \| f_D chevron.r \/ M$,
    by symmetry among branches. Thus
  #[#set math.equation(numbering: n => "(2.9)")
   $ chevron.l f_(D \, i) \, f_(D \, j) chevron.r = 2 / sqrt(M) "Re" chevron.l s_D \, r_D chevron.r + epsilon_D \,
     wide \| epsilon_D \| lt.eq frac(chevron.l f_D \| N_M \| f_D chevron.r, M) . $ <eq:exact-edge-decomposition>]
  After multiplication by $sqrt(D) \/ 2$ the error tends to zero.
    Equation (2.8) and strong convergence show that the first term tends to $"Re" chevron.l sans(L)^(*) v \,
    v chevron.r = "Re" chevron.l v \, sans(L) v chevron.r$. This proves (2.6).
  Finally, (2.7) follows by adding and subtracting $chevron.l w \,
    sans(L) v chevron.r$ and using $parallel sans(L) parallel = 1$. ◻
]

The occupation hypothesis in Proposition 4 is a sufficient hypothesis for the displayed proof;
  strong convergence alone does not bound the remainder in (2.9).
  Lemma 11 and Theorem 14 will supply that hypothesis for the quantum gates used here.

#prodef([Remark 2.3.])[
  (Classical rotations).  The classical sector consists of vectors whose spin is $\| +
    chevron.r$ at every vertex and whose coefficients depend only on seeds.
    If a $Y$ rotation whose angle depends only on seeds produces an insertion $v = \| + chevron.r m + \| -
    chevron.r n$ with seed-only coefficients in all descendants, then $cal(E) \( v \) =
    cal(E) \( \| + chevron.r m \)$. Indeed every $sans(L) v$ has root spin $\| + chevron.r$,
    while $sans(L) \( \| - chevron.r n \)$ has a child spin excitation and is orthogonal to the classical sector.
    Seed-only here permits dependence on descendant seeds; it does not mean dependence only on the root seed.
] <rem:classical-rotation-energy>

=== 2.3 Classical Gaussian positions and descendant formulas <subsec:classical-gaussian-sector>

The root-shift functional also applies to classical vectors, before they are compiled into quantum gates.
  We now give a common Gaussian realization for both classical constructions in this paper.
  This is a definition on the limiting pointed space; a finite-degree energy limit still requires the hypotheses
  of Proposition 4.

Keep every quantum spin in $\| + chevron.r$ and use real coefficients in the seed and symmetric Fock factors.
  This gives the real classical subspace. For a real centered classical child vector $f$, let $sans(G) \( f \) =
  q \( f \)$ be the position operator on the root’s child Fock factor.
  For any finite list $f_1 \, dots.h \, f_k$, these positions strongly commute and have joint centered Gaussian
  vacuum law with covariance $chevron.l f_i \, f_j chevron.r$.
  Indeed, choose a real orthonormal basis of their finite-dimensional span.
  The position operators of these orthogonal modes act on separate Fock factors, and

$ ⟨e^(upright(i) sum_(j = 1)^k t_j sans(G) \( f_j \))⟩_0 = exp (- 1 / 2 ∥sum_(j = 1)^k t_j f_j∥^2) . $

In particular, orthonormal directions give independent standard normal positions:
  the variance convention is $parallel f parallel^2$, with no additional factor of two.
  The positions act trivially on the local seed factor. Their joint vacuum law is therefore independent of the
  receiving root’s seed, even when a child direction itself depends on the seed at its own root.

We identify a scalar function of these commuting variables with the vector obtained by applying that function to
  the vacuum. Under this identification,

#[#set math.equation(numbering: n => "(2.10)")
 $
   lr(bar.v.double #scale(x: 120%, y: 120%)[\(] sans(G) \( f \) - sans(G) \( g \) #scale(x: 120%, y: 120%)[\)]
   bold(Omega) bar.v.double) = lr(bar.v.double f - g bar.v.double) . $ <eq:classical-gaussian-isometry>]

All fields are realized on the same pointed space, so this equality also specifies their coupling.
  The empty-descendant embeddings in (2.2) preserve inner products,
  commute with passing to the corresponding Fock fields, and keep the local seed factor fixed.
  Thus directions constructed at different finite heights can first be embedded in one common height without
  changing their joint Gaussian law.

#prodef([Definition 2.4.])[
  (Finite descendant formula).  A finite descendant formula is a finite expression built recursively from a local
    seed and finitely many Gaussian positions of centered formulas one level below,
    using pointwise scalar functions. The functions are required to be measurable and to produce square-integrable
    vectors whenever the formula is used as a vector. Additional empty levels identify formulas of different
    radii. Its finite-degree version replaces every Gaussian position by the normalized sum of the corresponding
    independent child variables.
] <def:finite-descendant-formula>

The definition by itself is a limiting-space construction, not a finite-degree convergence theorem.
  Later approximation arguments impose boundedness or polynomial-growth conditions on the pointwise maps as
  needed. Because $sans(L)$ places a constant seed at the new root,
  $sans(L)^(*)$ extracts precisely the first Gaussian chaos with constant receiving-root seed.
  If $e_1 \, dots.h \, e_k$ are orthonormal real centered child vectors and $F$ is a square-integrable function of
  $sans(G) \( e_1 \) \, dots.h \, sans(G) \( e_k \)$ alone, this gives

#[#set math.equation(numbering: n => "(2.11)")
 $ sans(L)^(*) F = sum_(j = 1)^k bb(E) #scale(x: 120%, y: 120%)[\[] F thin sans(G) \( e_j \)
   #scale(x: 120%, y: 120%)[\]] e_j . $ <eq:classical-first-chaos>]

Here $F$ may have a nonzero constant component, which $sans(L)^(*)$ annihilates.
  The identity follows by the orthogonal projection onto the first chaos in these Gaussian coordinates;
  the remaining orthogonal child modes and all higher chaoses have zero projection.
  This is the normalization used in the primary classical construction.

The rooted space, Gaussian positions, and energy functional now give the setting for the classical construction in
  Section 3. The rest of this section establishes convergence and continuity of the quantum operations that will
  implement it.

=== 2.4 Weights and the topology of convergence <sec:smooth-topology>

The fields just defined are unbounded. To pass their products and parameter derivatives through limits,
  we need a common domain and bounds that control both seed moments and excitations at every level.
  These recursive weights serve that purpose; they are distinct from the top-generation number weight used in the
  seed-removal argument. If all local-seed coefficients under consideration are uniformly bounded, take $W_0 =
  1$ on $sans(k)$. For coefficients of polynomial growth in a Gaussian seed,
  start with multiplication by $1 + \| s \|$ and make it block diagonal at $omega$:

$ W_0 = P_0 + Q_0 \( 1 + \| s \| \) Q_0 \, wide P_0 = \| omega chevron.r chevron.l omega \| \, quad Q_0 = 1 - P_0 . $

Compression is understood on its natural closed domain. This is a positive self-adjoint operator bounded below by
  one. It differs from multiplication by $1 + \| s \|$ by a bounded finite-rank operator whose range consists of
  vectors with all seed moments. Consequently their positive-integer power domains coincide,
  with equivalent graph norms. For completeness, this last assertion follows by induction from $A^m - B^m =
  sum_(j = 0)^(m - 1) A^j \( A - B \) B^(m - 1 - j)$ on the common core; every occurrence of $A -
  B$ has smooth finite-dimensional range, and the resulting estimates close in both directions.

Since $W_0 omega = omega$, we can recursively set

#[#set math.equation(numbering: n => "(2.12)")
 $ Lambda_h = W_h \|_(cal(H)_h^compose) \, wide W_(h + 1) = W_0 ⊗ 1 +
   1 ⊗ upright(d) Gamma \( Lambda_h \) . $ <eq:recursive-weights>]

Thus $W_h bold(Omega)_h = bold(Omega)_h$ and $W_h gt.eq 1$.
  On a finite tree use $W_(D \, h + 1) = W_0 + sum_(j = 1)^D Q_j W_(D \, h)^(\( j \)) Q_j$.
  The occupation embeddings intertwine these weights exactly.
  This also shows that their range projections commute with every power of $W_h$.

Write

$ cal(S)_h = ⋂_(m gt.eq 0) "Dom" \( W_h^m \) \, wide parallel xi parallel_m = parallel W_h^m xi parallel . $

Finite-particle tensors of smooth child vectors and local vectors with all seed moments are dense in every one of
  these graph norms. One proof first cuts off the spectral variables of $W_0$ and each $Lambda_h$,
  then cuts off particle number, and finally approximates in the resulting bounded spectral subspaces by algebraic
  tensors. The finite-degree projections give simultaneous approximants in all fixed graph norms.

When comparing unitary maps on the varying embedded spaces,
  extend each embedded unitary by the identity on the orthogonal complement of its range projection.
  These are genuine unitaries on the common Hilbert space. The projections commute with the weights and converge
  strongly to one in every fixed graph norm on smooth vectors,
  so this convention preserves all the bounds and limits. Parameter derivatives of the extensions vanish on that
  complement.

We will repeatedly use the following precise convention. An operator family $F_D \( x \)$ has #emph[uniform smooth
  bounds] if, for every nonnegative integer $m$ and multi-index $alpha$, there are $r \, k \, C$,
  independent of $D$ and $x$, such that

#[#set math.equation(numbering: n => "(2.13)")
 $ parallel W_D^m partial_x^alpha F_D \( x \) xi parallel lt.eq
   C \( 1 + \| x \| \)^k parallel W_D^r xi parallel \, wide xi in cal(S)_D . $ <eq:smooth-family-bound>]

The same condition is required of the adjoint family. Constants may depend on the fixed expression,
  its finite list of channels, the height, $m$, and $alpha$.
  Dependence on a further limiting parameter is explicitly stated when relevant.
  Smooth convergence of operator families means strong convergence on smooth inputs of both the families and their
  adjoints, including all specified parameter jets, with these uniform bounds.
  The limits of the adjoint jets must be the adjoints of the corresponding limiting jets on the common domain;
  bounded adjoint jets alone do not imply their convergence.
  For vector families only the vector convergence is required.
  This definition also permits triangular arrays of one-copy spaces under the embeddings above.

Two elementary consequences will be useful. Products of a fixed number of such families have the same bounds,
  with a possibly larger loss of input powers. Also, strong convergence together with bounded higher graph norms
  gives convergence in every fixed lower graph norm. The latter follows from the spectral inequality

#[#set math.equation(numbering: n => "(2.14)")
 $ parallel W^m xi parallel lt.eq R^m parallel xi parallel +
   R^(m - M) parallel W^M xi parallel wide \( M > m \, R gt.eq 1 \) \, $ <eq:weight-interpolation>]

by taking the strong limit first and $R arrow.r oo$ second.
  Consequently it is enough to prove convergence on the dense domain just described,
  and then use the uniform estimates. This is the meaning of convergence between different finite-degree spaces.

#thm([Lemma 2.5.])[
  (Weyl estimates).  #emph[Let $N$ be the particle number on $Gamma_s \( H^compose \)$.
    For every integer $m gt.eq 0$ there is $C_m$ such that
#[#set math.equation(numbering: n => "(2.15)")
 $ parallel \( 1 + N \)^m cal(W) \( d \) xi parallel & lt.eq
   C_m \( 1 + parallel d parallel \)^(2 m) parallel \( 1 + N \)^m xi parallel \,\
parallel \( cal(W) \( d \) - 1 \) xi parallel & lt.eq 2 parallel d parallel parallel \( N + 1 \)^(1 \/ 2) xi
  parallel . $ <eq:weyl-number-bound>]

 For the weight $W = W_0 + upright(d) Gamma \( Lambda \)$,
   the same conclusion holds with a polynomial in finitely many $parallel Lambda^j d
   parallel$ in place of $\( 1 + parallel d parallel \)^(2 m)$ and with a finite loss of input powers.
   All statements hold for spin-controlled displacements as well.]
] <lem:weyl-bounds>

#proof[
  On finite-particle vectors, $parallel a \( d \) xi parallel lt.eq
    parallel d parallel parallel N^(1 \/ 2) xi parallel$ and $parallel a^(*) \( d \) xi parallel lt.eq
    parallel d parallel parallel \( N + 1 \)^(1 \/ 2) xi parallel$.
    The fundamental theorem of calculus applied to $e^(upright(i) t q \( d \)) xi$ proves (2.15). Conjugation gives
  $ cal(W) \( d \)^(*) N cal(W) \( d \) = N + q \( upright(i) d \) + parallel d parallel^2 . $
  Commuting $N$ through a field changes that field to another field with the same norm of its argument.
    Expanding the $m$th power and applying the creation and annihilation bounds therefore proves (2.15).
    For the weighted version use
  $ cal(W) \( d \)^(*) upright(d) Gamma \( Lambda \) cal(W) \( d \) = upright(d) Gamma \( Lambda \) +
    q \( upright(i) Lambda d \) + chevron.l d \, Lambda d chevron.r \, $
  and $\[ upright(d) Gamma \( Lambda \) \, a^(*) \( d \) \] = a^(*) \( Lambda d \)$.
    Every expansion uses only finitely many weighted norms of $d$.
    Approximation in graph norms proves the identities and estimates on the stated domains.
    A spin-controlled displacement is the sum of two ordinary displacements on orthogonal spin subspaces. ◻
]

=== 2.5 Normalized sums and a unitary central limit <sec:unitary-clt>

A normalized sum creates or removes one child excitation in the limit.
  A product of small unitaries has the corresponding field exponential as its limit,
  but may also retain a scalar second-order term. We prove both statements with the weighted bounds needed for
  later substitution into a fixed circuit.

#thm([Lemma 2.6.])[
  (Sums).  #emph[Let $T_D$ and $T_D^(*)$ have uniform smooth bounds on one-copy spaces,
    and suppose their smooth limits exist. If $chevron.l bold(Omega) \, T_D bold(Omega) chevron.r = 0$,
    then under the occupation embeddings
#[#set math.equation(numbering: n => "(2.16)")
 $ D^(- 1 \/ 2) sum_(j = 1)^D T_D^(\( j \)) arrow.r a^(*) \( T bold(Omega) \) +
   a \( T^(*) bold(Omega) \) $ <eq:centered-sum-limit>]

 smoothly. Without centering, $D^(- 1) sum_j T_D^(\( j \)) arrow.r chevron.l bold(Omega) \,
   T bold(Omega) chevron.r thin 1$. Both families have uniform smooth bounds.]
] <lem:centered-sums>

#proof[
  Put $g = Q T_D bold(Omega)$, $h = Q T_D^(*) bold(Omega)$, and $A = Q T_D Q$.
    For centered $T_D$ its normalized sum has the exact occupation representation
  #[#set math.equation(numbering: n => "(2.17)")
   $ a^(*) \( g \) sqrt(1 - N \/ D) + sqrt(1 - N \/ D) thin a \( h \) + D^(- 1 \/ 2) upright(d) Gamma \( A \) \,
     $ <eq:sum-decomposition>]
  where factors beyond the truncation are zero. On the $m$-particle sector the two square roots express,
    respectively, the numbers $D - m$ of vacant and $D - m + 1$ of potentially filled slots.
    The formula first holds on algebraic tensors and then on smooth vectors.
    Creation and annihilation have uniform weighted bounds by the proof of Lemma 7.
    For the remaining term, a one-copy bound between powers of $Lambda$ implies a bound for its sum between powers
    of $1 + sum Lambda_j$: apply the one-copy bound to each occupied slot, use $Lambda_j lt.eq sum Lambda_j$,
    and pay at most one additional power for the number of occupied slots.
    This argument works at any desired output power. It proves the required bounds for (2.17).
    On a fixed-particle smooth tensor the last term tends to zero and the square roots tend to one;
    density and (2.14) finish the proof. For an average the same decomposition has off-diagonal factor
    $D^(- 1 \/ 2)$ and complementary-block factor $D^(- 1)$, while its vacuum block tends to the stated scalar. ◻
]

The sum lemma determines first-order fields. Controlled gates also require products of $D$ factors whose arguments
  are of size $D^(- 1 \/ 2)$. The next lemma keeps their second-order vacuum contribution;
  it cannot in general be recovered from the first-order field alone.

#thm([Lemma 2.7.])[
  (Products of small unitaries).  #emph[Let $K_D \( x \)$, $x in bb(R)^b$, be unitary, satisfy $K_D \( 0 \) = 1$,
    and have uniform smooth bounds for all jets and adjoint jets.
    Suppose these jets converge smoothly and $chevron.l bold(Omega) \,
    partial_alpha K_D \( 0 \) bold(Omega) chevron.r = 0$ for every first derivative. Write
$ K_alpha = partial_alpha K \( 0 \) = upright(i) T_alpha \, wide K_(alpha lambda) =
  partial_alpha partial_lambda K \( 0 \) . $

 The $T_alpha$ are symmetric on the smooth domain. For every fixed $a in bb(R)^b$,
#[#set math.equation(numbering: n => "(2.18)")
 $ K_D \( a \/ sqrt(D) \)^(⊗ D) arrow.r exp {upright(i) sum_alpha a_alpha q \( T_alpha bold(Omega) \) + 1 /
   2 sum_(alpha \, lambda) a_alpha a_lambda ⟨K_(alpha lambda) + 1 / 2 { T_alpha \,
   T_lambda }⟩_0} . $ <eq:unitary-product-limit>]

 The scalar in this exponent is imaginary. The convergence holds smoothly with all $a$-derivatives,
   locally uniformly in $a$, and the product has polynomial smooth bounds in $a$, uniform in $D$.
   The assertion also holds with an additional finite list of unscaled parameters $theta$:
   use $K_D \( a \/ sqrt(D) \; theta \)^(⊗ D)$, assume $K_D \( 0 \; theta \) =
   1$ and first-derivative centering for every $theta$, and assume the hypotheses jointly for all parameter jets,
   uniformly on compact $theta$-sets. The conclusion then includes all $theta$-jets and the same compact uniformity.]
] <lem:unitary-clt>

#proof[
  We first identify the candidate limit from exponential vectors;
    then we prove the bounds needed for smooth convergence. If $x \, z perp bold(Omega)$ are smooth,
    the vectors $\( bold(Omega) + x \/ sqrt(D) \)^(⊗ D)$ converge to $epsilon \( x \) =
    xor.big_(m gt.eq 0) x^(⊗ m) \/ sqrt(m !)$, and similarly for $z$.
    The coefficient of $D^(- 1)$ in the one-copy matrix element is
  $ c =  & chevron.l z \, x chevron.r + sum_alpha a_alpha #scale(x: 120%, y: 120%)[\(] chevron.l z \,
    K_alpha bold(Omega) chevron.r + chevron.l bold(Omega) \, K_alpha x chevron.r #scale(x: 120%, y: 120%)[\)] +
    1 / 2 sum_(alpha \, lambda) a_alpha a_lambda chevron.l K_(alpha lambda) chevron.r_0 . $
  Taylor’s formula makes the remaining error $o \( D^(- 1) \)$,
    also for converging triangular arrays of smooth $x \, z$. The full pairing consequently tends to $e^c$.
    For $t = sum_alpha a_alpha T_alpha bold(Omega)$, the exponential-vector pairing of $e^(upright(i) q \( t \))$
    has an additional term $- parallel t parallel^2 \/ 2$. Since $parallel t parallel^2 =
    sum_(alpha \, lambda) a_alpha a_lambda chevron.l { T_alpha \, T_lambda } \/ 2 chevron.r_0$,
    the correction in (2.18) is exactly the required one. Twice differentiating $K \( x \)^(*) K \( x \) =
    1$ at zero shows that its real part is zero. The displayed limit is thus unitary.
  We next prove uniform bounds for the product $U_D \( a \) = K_D \( a \/ sqrt(D) \)^(⊗ D)$.
    For one child let $A = Q Lambda Q$ and $B_D \( a \) = K_D \( a \/ sqrt(D) \)^(*) A K_D \( a \/ sqrt(D) \)$.
    Taylor’s formula at zero, with the assumed bounds, gives
  $ \| chevron.l B_D \( a \) chevron.r_0 \| & lt.eq D^(- 1) P \( a \) \,\
parallel Lambda^m Q B_D \( a \) bold(Omega) parallel + parallel Lambda^m Q B_D \( a \)^(*) bold(Omega) parallel &
  lt.eq D^(- 1 \/ 2) P_m \( a \) \, $
  and the complementary block has polynomial smooth bounds.
    Here and below $P_m$ denotes some fixed nonnegative polynomial in $1 + \| a \|$,
    whose degree is allowed to depend on $m$. The same vacuum-row decomposition as in (2.17),
    now applied to the unnormalized sum of the $B_D \( a \)$, shows that
  $ U_D \( a \)^(*) W U_D \( a \) = W_0 + sum_j B_D \( a \)^(\( j \)) $
  has polynomial bounds from any sufficiently high input weight to any prescribed output weight, uniformly in $D$.
    Composing this estimate a fixed number of times bounds its powers.
    Since $W^m U_D = U_D \( U_D^(*) W U_D \)^m$, this proves the assertion for $U_D$ itself;
    the adjoint is treated identically. All identities may first be made on smooth tensors,
    which the product preserves, and then closed using these very estimates.
  For derivatives,
  $ U_D \( a \)^(*) partial_alpha U_D \( a \) = D^(- 1 \/ 2) sum_j #scale(x: 120%, y: 120%)[\(] K_D^(*)
    partial_alpha K_D #scale(x: 120%, y: 120%)[\)] \( a \/ sqrt(D) \)^(\( j \)) . $
  The one-copy vacuum mean is $O \( D^(- 1 \/ 2) P \( a \) \)$, since it vanishes at zero.
    Lemma 8, with this scalar part retained, gives a uniform bound.
    Further differentiation produces products of finitely many such sums.
    A sum carrying $k gt.eq 2$ derivative-scaling factors is bounded by the average estimate times $D^(1 - k \/ 2)
    lt.eq 1$. Induction proves all jet bounds.
  Weak convergence on the total set of exponential vectors, together with equality of the limiting norms,
    proves strong convergence. Higher-weight convergence follows from (2.14);
    derivative convergence follows from finite differences and the uniform bounds on one further derivative.
    This also gives local uniformity in $a$. Since the strong limit is unitary,
    the adjoints converge strongly as well: for unitaries $U_D \, U$,
    one has $parallel \( U_D^(*) - U^(*) \) xi parallel = parallel xi - U_D U^(*) xi parallel$.
    The adjoint jet bounds already proved, followed by the same finite-difference argument,
    give convergence of adjoint jets.
  To verify the unscaled-parameter assertion, the only additional estimate concerns a logarithmic derivative
    $A_nu \( x \; theta \) = K \( x \; theta \)^(*) partial_(theta_nu) K \( x \; theta \)$.
    It satisfies $A_nu \( 0 \; theta \) = 0$. Moreover
  $ ⟨partial_(x_alpha) A_nu \( 0 \; theta \)⟩_0 = partial_(theta_nu) ⟨partial_(x_alpha) K \( 0 \; theta \)⟩_0 = 0 . $
  Its vacuum entry at $a \/ sqrt(D)$ is therefore $O \( D^(- 1) P \( a \) \)$,
    its vacuum row and column are $O \( D^(- 1 \/ 2) P \( a \) \)$,
    and its complementary block is $O \( D^(- 1 \/ 2) P \( a \) \)$ with smooth bounds.
    The unnormalized sum of its $D$ copies consequently has uniform smooth bounds by the decomposition used above.
    Every further $theta$-derivative has the same two vanishings,
    and mixed $a$-derivatives are treated by the normalized-sum or average estimates.
    This proves all joint jet bounds. Pointwise convergence for fixed $theta$, finite differences,
    and the adjoint argument just given prove the parametric conclusion. ◻
]

#prodef([Remark 2.8.])[
  The anticommutator in (2.18) is a quadratic form on smooth vectors;
    its vacuum expectation is unambiguous because all jets preserve that domain.
    Essential self-adjointness of the one-copy derivative $T_alpha$ is not needed:
    only the vector $T_alpha bold(Omega)$ enters the self-adjoint Fock field.
    This avoids an unnecessary domain hypothesis.
] <rem:unitary-clt-domains>

=== 2.6 Smooth limits for ordinary root maps <sec:ordinary-root-calculus>

We now prove that the ordinary root maps introduced in Section 2.2 have smooth limits,
  and hence that their limiting insertions have the root-shift energy computed there.
  At height $h$, write $u_h$ for the limiting root map and put $v_(P \, h) =
  u_h^(*) P u_h bold(Omega)_h$ for a root Pauli observable $P$.
  The following induction constructs these maps from the identity.
  In the limiting cost update below, the field direction at height $h$ is the preceding word’s insertion on a
  child subtree at height $h - 1$:

$ v_(Z \, h - 1) = u_(h - 1)^(*) Z u_(h - 1) bold(Omega)_(h - 1) \, wide
  u_h mapsto e^(- upright(i) t Z q \( v_(Z \, h - 1) \)) u_h . $

Here $q \( v_(Z \, h - 1) \)$ acts on the child Fock factor of $cal(H)_h$.
  Once the heights include the fixed word’s light cone, adding empty descendants identifies these updates under
  the compatible embeddings. We henceforth suppress the height indices, writing $v_P = u^(*) P u bold(Omega)$;
  a direction inside $q$ always comes from the child level.

#thm([Lemma 2.9.])[
  (Ordinary root updates).  #emph[Ordinary finite words have smooth root limits and smooth adjoint limits at every
    sufficient finite height. Starting at $u = 1$, the limiting left updates for a mixer of angle $beta$ and a
    cost of angle $t$ are, respectively,
#[#set math.equation(numbering: n => "(2.19)")
 $ u mapsto e^(- upright(i) beta X) u \, wide u mapsto e^(- upright(i) t Z q \( v_Z \)) u .
   $ <eq:ordinary-root-updates>]

 The cost update leaves $v_Z$ unchanged. For a cost conjugated by a global mixer,
   replace $Z$ by the same rotated Pauli $P$ both at the root and in $v_P$.
   A Gaussian seed gate has the additional update $u mapsto e^(- upright(i) t Z s) u$.]
  #emph[All these assertions are unchanged when the top root has $D +
    1$ children and the descendants have $D$ children, still using the coefficient $D^(- 1 \/ 2)$.
    For an ordinary word $W$, its limiting insertion $v_Z$ therefore satisfies $v_W = cal(E) \( v_Z \)$,
    with $cal(E)$ defined in Proposition 4.]
] <lem:ordinary-updates>

#proof[
  At finite $D$, factoring out the new child costs gives the exact left update
  $ exp (- upright(i) t Z D^(- 1 \/ 2) sum_(j = 1)^D U_j^(*) Z_j U_j) . $
  The one-copy observable is centered, because $Z$ is odd under the joint spin/seed symmetry and the preceding
    word preserves that symmetry. Its vacuum column is $v_Z$.
    On each root $Z$-eigenspace, the update is a product of small one-child unitaries.
    Lemma 9 gives precisely the cost in (2.19); the scalar correction is zero for an exponential of a fixed
    observable. The smooth estimates follow inductively from the same lemma and Lemma 7.
    Mixers are local, and a seed gate is multiplication by a two-by-two unitary;
    its input derivatives have polynomial seed bounds. Both therefore preserve the smooth domain.
    The update commutes with the root $Z$, proving the assertion about $v_Z$;
    conjugation proves the rotated-axis statement.
  For the full-root assertion use $M = D + 1$ in the occupation decomposition while retaining $a \/
    sqrt(D)$ in each one-copy factor. In the proof of Lemma 9,
    every limiting coefficient is multiplied by $M \/ D arrow.r 1$, and every bound is unchanged up to a constant.
    Induction on the fixed word proves that full-root and cavity-root maps have the same limit.
    Padding the subtree by the finite light-cone radius justifies all factorizations before limits are taken.
  The finite-degree ordinary insertion vectors meet the hypotheses of Proposition 4:
    parity makes them centered, the construction preserves rooted symmetry, and the smooth weight dominates $1 +
    N$. Their edge pairing is the expectation of $Z_i Z_j$. The root-shift formula and Proposition 3 therefore
    give $v_W = cal(E) \( v_Z \)$. ◻
]

=== 2.7 Substitution of commuting controls <sec:commuting-controls>

The ordinary cost update uses a scalar time multiplying one field.
  A controlled operation instead inserts a commuting list of signal operators into the parameters of a local
  matrix. The following lemma makes that substitution legitimate, including its derivatives and adjoints;
  no choice of independent Gaussian coordinates is needed.

#thm([Lemma 2.10.])[
  (Smooth commuting substitution).  #emph[Let $S_D = \( S_(D \, 1) \, dots.h \, S_(D \, b) \)$ be a fixed finite
    list of strongly commuting self-adjoint operators. Suppose their polynomials converge smoothly and their joint
    exponentials satisfy, for each $m$, bounds
#[#set math.equation(numbering: n => "(2.20)")
 $ parallel W_D^m e^(upright(i) t dot.op S_D) xi parallel lt.eq
   C_m \( 1 + \| t \| \)^(k_m) parallel W_D^(r_m) xi parallel \, $ <eq:joint-exponential-bound>]

 uniformly in $D \, t$, and converge strongly on smooth inputs.
   Let $F_D \( x \)$ and $F_D \( x \)^(*)$ have uniform smooth bounds and converge with all their jets on compact
   $x$-sets, and suppose $F_D \( x \)$ commutes with the spectral projections of every $S_(D \, j)$.
   Then the substitution $F_D \( S_D \)$ has uniform smooth bounds and converges smoothly.
   The assertion includes extra scalar parameters and their jets.
   If $F_D \( x \)$ is unitary for real $x$, so is $F_D \( S_D \)$.
   The limiting list $S$ consists of the strongly commuting self-adjoint generators of the limiting joint unitary
   group. Their actions and polynomials on the smooth domain agree with the assumed polynomial limits.]
  #emph[For a real smooth function $f \( s \, x \)$ whose derivatives have polynomial growth in $x$,
    uniformly in $s$, the operators $e^(upright(i) t f \( s \, S_D \))$ have polynomial smooth bounds in $t$.
    Polynomial growth in a Gaussian $s$ is also permitted with the seed-moment weight.
    In every seed-dependent assertion, the local seed multiplication algebra is required to strongly commute with
    every $S_(D \, j)$ and with the operator coefficient families;
    thus $f \( s \, S_D \)$ is a joint commuting substitution.
    No nondegeneracy assumption on the joint covariance of the $S_(D \, j)$ is needed.]
] <lem:commuting-substitution>

#proof[
  First identify the limiting signal operators. Write $U \( t \) =
    lim_D e^(upright(i) t dot.op S_D)$ for the strong operator limit.
    Strong limits of products of uniformly bounded operators preserve the group law, and the limits at $t$ and $-
    t$ preserve inverses; thus each $U \( t \)$ is unitary. For smooth $xi$,
  $ parallel \( e^(upright(i) t dot.op S_D) - 1 \) xi parallel lt.eq
    sum_(alpha = 1)^b \| t_alpha \| parallel S_(D \, alpha) xi parallel . $
  The uniform polynomial bounds give strong continuity on this dense domain, hence on the full space.
    The strongly continuous joint unitary group therefore determines strongly commuting self-adjoint generators
    $S_1 \, dots.h \, S_b$. Passing to the limit in the integrated one-parameter group identities identifies each
    generator on smooth vectors with the corresponding polynomial limit.
    The smooth bounds make this domain invariant, so iteration identifies all polynomial limits.
    This is the realization used in $F \( S \)$.
  We give the estimates, which also specify the substitution on the smooth domain when $F_D$ is unbounded.
    For such coefficients, commutation with the spectral measures is understood in the closed-operator (or
    decomposable-operator) sense. On the invariant smooth domain we use the equivalent identities with the joint
    unitary group. Sharp spectral projections are not required to preserve the smooth domain.
    These identities pass to the limit because the moving inputs $e^(upright(i) t dot.op S_D)
    xi$ converge in every required graph norm, as do the coefficients acting on them.
    Thus the limiting coefficients retain the commutation needed for the Fourier products below. Suppress $D$.
    Fix an output weight $m$, and take $r_m \, k_m$ from (2.20). Choose an integer $q > k_m + b$.
    For a sufficiently large integer $N$, the family
  $ G \( x \) = \( 1 + \| x \|^2 \)^(- N) F \( x \) $
  and its first $q$ derivatives are integrable in $x$ as operators from some fixed input graph norm to the $r_m$th
    output graph norm. Such an $N$ exists because only finitely many polynomial growth exponents are involved.
    With $hat(G) \( t \) = \( 2 pi \)^(- b) integral e^(- upright(i) t dot.op x) G \( x \) thin upright(d) x$,
    integration by parts gives
  $ parallel W^(r_m) hat(G) \( t \) eta parallel lt.eq C \( 1 + \| t \| \)^(- q) parallel W^r eta parallel . $
  Therefore
  #[#set math.equation(numbering: n => "(2.21)")
   $ F \( S \) xi = integral_(bb(R)^b) e^(upright(i) t dot.op S) hat(G) \( t \) \( 1 + \| S \|^2 \)^N xi thin
     upright(d) t $ <eq:operator-fourier-substitution>]
  converges absolutely in the $m$th graph norm and has a bound of the form (2.13).
    The polynomial on the right acts first; its bound can be absorbed by increasing the input weight last.
    This order of choices avoids any circular dependence of exponents.
  Integration by parts in $t$, with the same integrable graph-norm bounds,
    shows that the result does not depend on $N$: multiplying a symbol by $1 + \|
    x \|^2$ corresponds to applying $1 - Delta_t$ to its Fourier transform and hence to multiplication by $1 + \|
    S \|^2$ after integration. The common smooth domain is preserved by all factors.
    Fubini’s theorem and the convolution formula show on that domain that
  $ F \( S \) G \( S \) = \( F G \) \( S \) . $
  In this identity the order of $F$ and $G$ is retained; one only commutes the Fourier factors and polynomials in
    $S$ past the operator coefficients, as permitted by the hypothesis.
    It can first be checked for rapidly decreasing smooth symbols and then for the divided symbols above,
    moving their polynomial factors to the input. Taking adjoints in pairings of smooth vectors likewise gives
    $F \( S \)^(*) = F^(*) \( S \)$ on the common domain. For scalar symbols this construction is the usual joint
    spectral functional calculus by Fourier inversion. In particular the constant symbol $1$ substitutes to the
    identity. Thus a pointwise unitary symbol and its adjoint substitute to mutually inverse isometries on a dense
    invariant domain. Their extensions are unitary on the full Hilbert space.
    These facts also identify the construction with the finite-tree substitution where the controls already have a
    simultaneous multiplication representation.
  For convergence, first restrict $x$ to a compact set. Convergence of the integrands on smooth inputs and the
    integrable bound just proved give convergence of the Fourier integrals.
    The polynomial decay supplied by $\( 1 + \| x \|^2 \)^(- N)$ controls the discarded tails uniformly.
    The same proof applies to every scalar-parameter derivative and to adjoints.
    Uniform higher output bounds then give smooth convergence by (2.14).
    For coefficients merely measurable in $s$, use dominated convergence in $s$;
    for polynomial seed bounds increase the seed-moment input weight.
  Finally, every $x$-derivative of $e^(upright(i) t f \( s \, x \))$ is bounded by a polynomial in $\|
    t \|$ times a fixed polynomial in $\| x \|$ (and $\| s \|$ in the moment-weight case).
    Applying the same argument proves the last assertion. The proof used a joint spectral representation and
    Fourier inversion, without choosing independent field coordinates. ◻
]

An important supply of lists satisfying the hypotheses is the following.
  If $M_1 \, dots.h \, M_b$ are commuting centered one-copy signals and the one-copy joint exponentials have
  polynomial smooth bounds, apply Lemma 9 to $K \( x \) = exp \( upright(i) sum x_alpha M_alpha \)$.
  Its scalar correction vanishes, and hence

#[#set math.equation(numbering: n => "(2.22)")
 $ (D^(- 1 \/ 2) sum_j M_alpha^(\( j \)))_(alpha = 1)^b arrow.r
   #scale(x: 120%, y: 120%)[\(] q \( M_alpha bold(Omega) \) #scale(x: 120%, y: 120%)[\)]_(alpha = 1)^b .
   $ <eq:commuting-signal-limit>]

The limiting fields commute: the imaginary part of their Gram matrix is the vacuum expectation of a commutator of
  the original signals, divided by $2 upright(i)$, and is zero. Their polynomials converge by Lemma 8.
  The last assertion of Lemma 12 bootstraps polynomial exponential bounds for smooth functions of such a list.
  Starting with local seed functions and a single commuting spin axis,
  this proves the same statements for every fixed finite feedforward calculation of commuting signals.

=== 2.8 Exclusion calculations and controlled gates <sec:exclusion-calculus>

We now prove the stronger calculus needed for synthesis. Its objects are temporary operations,
  not additional gates in the final QAOA word. The purpose of the calculus is to justify replacing such operations
  by finite products inside an already chosen surrounding circuit.

An even #emph[mask] is a measurable subset of $S$ invariant under $iota$. For masks $I \, J$ write

#[#set math.equation(numbering: n => "(2.23)")
 $ \( A_(I J) f \)_i = upright(bold(1))_I \( s_i \) D^(- 1 \/ 2) sum_(j tilde.op i) upright(bold(1))_J \( s_j \)
   f_j . $ <eq:masked-adjacency>]

Masks and the coefficients attached to them are part of a fixed finite expression.
  They are not optimized after sampling a tree or its seeds.

#prodef([Definition 2.11.])[
  (Exclusion calculation and gate).  A finite exclusion calculation uses local seeds,
    one prescribed commuting spin axis at each control site, smooth pointwise functions of finite lists of
    messages, and normalized sums (2.23). An axis may depend on the site’s mask.
    A formula is split into finitely many named roles when different occurrences need different masks.
    The following conditions are imposed.
  + Every transmitted field is odd under simultaneous seed reflection and spin flip.
    Every pointwise function is smooth in its aggregate inputs, with polynomial bounds for every derivative.
    Its local-seed coefficients are measurable and uniformly bounded, unless the seed-moment variant is specified.
  + In every normalized sum, the receiving mask is disjoint from every role mask occurring below that sum.
    Thus all ancestor receiving types are excluded from the descendant calculation.
    In particular a message sent across a cut does not use the site on the other side of that cut.
  + A gate chooses a target mask and applies a two-by-two unitary $V$ at each target,
    with parameters computed by such calculations. The matrix $V$ itself must be smooth in the aggregate inputs,
    with polynomial bounds for every matrix derivative, uniformly in the local seed (or with the stated polynomial
    seed bound). If external parameters are present, the bounds include all their mixed jets,
    locally uniformly in those parameters. The target mask is disjoint from all control masks used across an edge
    in those parameters. At the target itself only its seed, not its spin, is used as a parameter.
  + All parameter operators of this one gate belong to the same commuting control algebra.
    The gate, including its two-by-two matrix, preserves the joint symmetry.
  The global gate is the product of these controlled matrices. Its factors commute:
    their targets are distinct and none is a control for another factor of the same gate.
    A finite-range local observable is therefore affected by only finitely many of them at finite $D$.
] <def:exclusion-gate>

The exclusions make the information across a removed edge depend on finitely many boundary inputs.
  We next show that the resulting finite recursion respects the weighted limits already proved.
  The replacement assertion is formulated inside an existing circuit,
  which is the form required by the synthesis argument.

#thm([Theorem 2.12.])[
  (Smooth gate calculus).  #emph[Fix a finite sequence of exclusion gates, ordinary mixers and costs,
    and local seed gates. Its root interaction-picture maps, their adjoints,
    and their root insertion vectors have smooth limits under the occupation embeddings.
    They have uniform smooth bounds at every sufficient finite height.
    The same limit is obtained at a full root with $D + 1$ children.
    Hence their centered insertion energies are given by Proposition 4.]
  #emph[An exclusion gate may be replaced inside any such fixed sequence by a sequence of pointwise unitary
    matrices with the same parameter calculations, provided every fixed number of aggregate-input derivatives
    converges on compact sets and has uniform polynomial bounds.
    Convergence almost everywhere in the local seed, or convergence in seed measure followed by a subsequence,
    is sufficient for bounded measurable local-seed coefficients.
    The resulting root maps, adjoints, and insertion vectors converge smoothly, and their energies converge.]
  #emph[If local-seed coefficients are uniformly bounded, these bounds hold conditionally on the root seed,
    with constants independent of its value, using $W_0 = 1$. Root maps commute with root-seed multiplication.
    Consequently, if a root column $c$ has conditional $m$th graph norm at most $C_m$, then
#[#set math.equation(numbering: n => "(2.24)")
 $ parallel W^m upright(bold(1))_J c parallel lt.eq C_m sqrt(mu \( J \)) . $ <eq:masked-column-bound>]

 The same statements hold for any further scalar boundary-input jets of a fixed exclusion calculation.
   They also hold, including adjoint jets, for a finite list of external unscaled parameters,
   locally uniformly in those parameters, when the matrix and signal hypotheses hold jointly for their mixed jets.]
] <thm:gate-calculus>

#proof[
  We give both the finite-tree recursion and the analytic induction.
    This is necessary because a global operator-norm error proportional to the number of vertices would not imply
    the assertion.
  ===== 2.8.1 Boundary inputs. <boundary-inputs.>
  Unroll the fixed expression and index its normalized-sum occurrences by their named roles,
    retaining repeated occurrences separately. These indices form the finite boundary-channel list $alpha = 1 \,
    dots.h \, b$. Cut an edge immediately above a branch root.
    For an occurrence $A_(I_alpha J_alpha) f_alpha$, replace the parent’s contribution to the normalized sum by a
    formal real coordinate $y_alpha$, retaining the receiving mask $I_alpha$.
    Write $y = \( y_1 \, dots.h \, y_b \)$; these are substitution variables, not additional random seeds.
    A sender supplies the coordinate $m_alpha \( y \) = upright(bold(1))_(J_alpha) \( s \) f_alpha \( y \)$,
    evaluated at that sender. The receiving child uses $m_alpha \( y \) \/
    sqrt(D)$ on its role mask and ignores the coordinate when that role is inactive.
    All outgoing messages that are requested by the parent are unchanged by the cut:
    their formulas exclude the parent’s receiving type. The parameters of the gate are computed from the finite
    list of zero-boundary child signals and these added inputs.
    At the branch root this gives a target matrix $V \( y \)$, equal to identity on nontargets,
    and the outgoing message list $m \( y \)$. The same list is used for each child with its receiving masks
    imposed there. Indeed, a component sent to a child excludes that child’s type from its own computation,
    so it contains no contribution from that child. The mask exclusions are needed for exactly this assertion.
  We first derive the factorization in the physical coordinates, before conjugating by the preceding circuit.
    Retain the target operations at distance at most $d$ from the branch root,
    but compute all their parameter formulas on the padded tree.
    Let $G^(\[ d \]) \( y \)$ be this truncated operation, and temporarily write $V_(upright("phys")) \( y \)$ and
    $m_(upright("phys")) \( y \)$ for the root matrix and outgoing messages just defined.
    For $d = 0$ the operation is only $V_(upright("phys")) \( y \)$.
    For $d gt.eq 1$, partitioning the targets among the root and its children gives
  $ G^(\[ d \]) \( y \) = V_(upright("phys")) \( y \) product_(j med upright("child"))
    G_j^(\[ d - 1 \]) \( D^(- 1 \/ 2) m_(upright("phys")) \( y \) \) . $
  The same formula list is evaluated in each child with its receiving masks imposed there.
    The exclusion rule ensures that the input sent to a child does not feed back through that child’s receiving type.
  The zero-boundary child operation is the baseline to factor out. Put
  $ B^(\[ d \]) = product_j G_j^(\[ d - 1 \]) \( 0 \) \, wide P = ⨂_j U_j \, wide U = P u \, $
  where $U$ is the preceding subtree circuit and $U_j$ its child circuits. For $d = 0$ take $B^(\[ 0 \]) = 1$.
    The residual operation in a child, expressed in its preceding frame, is
  $ K_j^(\[ d - 1 \]) \( a \) = U_j^(*) G_j^(\[ d - 1 \]) \( 0 \)^(*) G_j^(\[ d - 1 \]) \( a \) U_j . $
  At the current branch use the same definition,
  $ K^(\[ d \]) \( y \) = U^(*) G^(\[ d \]) \( 0 \)^(*) G^(\[ d \]) \( y \) U . $
  Thus $K^(\[ d \]) \( 0 \) = 1$. This compares two operations on the same branch;
    it does not discard the zero-input operation.
  Conjugate the physical signals by $P$, writing $V \( y \) =
    P^(*) V_(upright("phys")) \( y \) P$ and $m \( y \) = P^(*) m_(upright("phys")) \( y \) P$.
    Equivalently, conjugate each zero-boundary child signal by its $U_j$,
    while leaving the root spin in its present frame. Define $E^(\[ d \]) \( y \) =
    P^(*) \( B^(\[ d \]) \)^(*) G^(\[ d \]) \( y \) P$. Factoring the baseline from the physical identity gives
    the exact finite-degree recursion
  #[#set math.equation(numbering: n => "(2.25)")
   $ E^(\[ d \]) \( y \) & = V \( y \) product_(j med upright("child"))
     K_j^(\[ d - 1 \]) \( D^(- 1 \/ 2) m \( y \) \) \,\
K^(\[ d \]) \( y \) & = u^(*) E^(\[ d \]) \( 0 \)^(*) E^(\[ d \]) \( y \) u . $ <eq:exclusion-E-recursion>]
  For $d = 0$ the first line is $E^(\[ 0 \]) \( y \) = V \( y \)$.
    For $d = 1$ it multiplies the root matrix by the ratios of the child target matrices.
    Notice that $m \( 0 \)$ need not vanish: removing the parent input leaves the root’s own signals.
    Hence $E^(\[ d \]) \( 0 \)$ is generally nontrivial, although every ratio $K^(\[ d \])$ equals one at zero.
  The second line follows by canceling $B^(\[ d \]) \( B^(\[ d \]) \)^(*)$ between the two factors.
    At zero external input the same factorization gives
  $ G^(\[ d \]) \( 0 \) U = B^(\[ d \]) P E^(\[ d \]) \( 0 \) u . $
  The new child circuits are $G_j^(\[ d - 1 \]) \( 0 \) U_j$, so the new root map is
  #[#set math.equation(numbering: n => "(2.26)")
   $ u_(upright("new")) = E^(\[ d \]) \( 0 \) u . $ <eq:exclusion-root-update>]
  Only targets within the finite influence distance can respond to a cut input.
    Taking $d$ above that distance gives the actual root update;
    all more distant zero-input operations are already factored into the child circuits.
  The factors and their parameter arguments commute before the preceding circuit is applied:
    targets are disjoint from controls, and each site supplies only its prescribed axis.
    More explicitly, let $cal(A)_j$ be the abelian von Neumann algebra generated by all seeds and prescribed
    control axes in child branch $j$, excluding target spin axes.
    For every scalar $a$, each truncated gate $G_j^(\[ d \]) \( a \)$ commutes with $cal(A)_j$,
    since it changes only target spins and has coefficients in that algebra. Consequently
  $ K_j^(\[ d \]) \( a \) in #scale(x: 120%, y: 120%)[\(] U_j^(*) cal(A)_j U_j #scale(x: 120%, y: 120%)[\)]' . $
  Before the final root conjugation by $u$, every component of $m \( y \)$ and every zero-boundary parameter sum
    is affiliated with the abelian algebra generated by the root controls and the child algebras $U_j^(*) cal(A)_j
    U_j$. Thus $K_j^(\[ d \]) \( a \)$ commutes with every spectral projection of every such component,
    even when that component uses signals from branch $j$ itself.
    The unused components of a common message list cause no exception.
    This proves the exact commutation required for substituting the operator $m \( y \)$ into the scalar family.
    All these algebras also commute with root-seed multiplication, as do the preceding root maps,
    so the seed-dependent version of commuting substitution has its additional commutation hypothesis.
    This also proves that any two descriptions giving the same finite-tree operation, including its cut versions,
    have the same root map.
  ===== 2.8.2 Zero-boundary signals. <zero-boundary-signals.>
  Assume by induction that the preceding maps $u \, u^(*)$ have the asserted smooth bounds and limits.
    Compute a signal in its physical control algebra from the bottom roles up.
    At a sum, its zero-boundary child columns have already been computed;
    after conjugation by the preceding child maps, they still commute, are still centered by odd symmetry,
    and have the required smooth bounds. A signal at the new root is calculated pointwise in the resulting child
    sums and the root’s chosen axis, and is then conjugated by the preceding $u$ when its one-copy Heisenberg
    version is needed.
  Here is the induction that also controls exponentials. Local commuting seed/axis variables plainly have joint
    exponentials with polynomial smooth bounds. Suppose this is true for the child signal list.
    Lemma 9 gives (2.22), including the polynomial frequency bounds on joint exponentials,
    and Lemma 8 gives polynomial convergence. Lemma 12 then computes each smooth pointwise function and gives
    polynomial bounds for the joint exponentials of every new finite signal list.
    Conjugating by $u$ and $u^(*)$ preserves those bounds and convergence.
    This proves the signal assertions in order of calculation depth,
    without any assumption on an unknown outgoing exponential.
  ===== 2.8.3 Propagation of a gate across a cut. <propagation-of-a-gate-across-a-cut.>
  Proceed next in $d$ in (2.25)–(2.25). For $d = 0$, $V \( y \)$ is a smooth two-by-two matrix function of the
    signal lists just treated; commuting substitution gives all assertions.
    Suppose they hold for the child family $K^(\[ d - 1 \]) \( a \)$, including all input jets and adjoints.
    It equals identity at $a = 0$. Treating the inputs as odd under the symmetry gives $cal(P)
    K^(\[ d - 1 \]) \( a \) cal(P) = K^(\[ d - 1 \]) \( - a \)$, where $cal(P) bold(Omega) = bold(Omega)$.
    Therefore each first derivative has vacuum mean zero.
  For scalar $a$, apply Lemma 9 to the child product. With $partial_alpha K^(\[ d - 1 \]) \( 0 \) =
    upright(i) T_alpha$, its limiting value is
  #[#set math.equation(numbering: n => "(2.27)")
   $ exp {upright(i) sum_alpha a_alpha q \( T_alpha bold(Omega) \) + 1 /
     2 sum_(alpha \, lambda) a_alpha a_lambda ⟨K_(alpha lambda) + 1 / 2 { T_alpha \,
     T_lambda }⟩_0} . $ <eq:exclusion-product-limit>]
  The second term is scalar for scalar $a$. After substitution it can be an operator in the commuting control
    algebra; it must therefore be retained. The product lemma supplies polynomial bounds for every scalar $a$-jet.
    The components of $m \( y \)$ are smooth functions of a finite list of commuting normalized signals and a root
    control axis. The finite-tree commutations already established imply the hypotheses of Lemma 12,
    which substitutes $a = m \( y \)$. Use the spectral projections of the fixed root axis if needed.
    Multiplication by $V \( y \)$ completes the induction for $E^(\[ d \]) \( y \)$,
    and conjugation in (2.25) completes it for $K^(\[ d \]) \( y \)$.
    The argument includes all boundary-input derivatives by the ordinary chain rule.
  This proves (2.26) with smooth bounds and limits. It adds one gate to the preceding sequence.
    Ordinary cost and mixer updates may be inserted between these gates by Lemma 11;
    its proof requires only smooth bounds on the preceding maps and preservation of symmetry.
    Local seed gates are handled as in that lemma. Induction on the finite sequence proves the first assertion.
    The same proof with $D + 1$ top factors instead of $D$ gives the same limit, since $\( D + 1 \) \/ D arrow.r
    1$. Smoothness supplies the bounded occupation required for Proposition 4.
  External parameters can be carried through this induction without being scaled.
    At the child-product step use the unscaled-parameter assertion of Lemma 9;
    at the substitution step use the mixed-jet version of Lemma 12.
    Each unitary strong limit is unitary, so adjoint convergence follows from the identity in the proof of
    Lemma 9; its jet version follows by finite differences with the adjoint jet bounds.
    For real commuting signals the adjoint is the same signal,
    and compositions use the reversed products of the already convergent adjoint families.
    Thus adjoint convergence is established at each induction step, rather than inferred from bounds alone.
  ===== 2.8.4 Continuity inside a sequence. <continuity-inside-a-sequence.>
  Repeat these two inductions with a further approximation index.
    Compact convergence of a fixed number of matrix derivatives and uniform polynomial bounds are precisely the
    hypotheses of commuting substitution. The normalized sum and product lemmas allow the child maps themselves to
    vary with this index. Hence every new root map and its adjoint converge on smooth vectors with uniform smooth
    bounds. A fixed finite surrounding sequence is handled by induction and the product rule.
    The assertion does not make a bound uniform in the length of that sequence.
    For a pointwise product formula on a single target and a common commuting control algebra,
    the entire product is first regarded as one matrix-valued function;
    the theorem then applies to its smooth matrix limit. This is how arbitrarily long local commutator or sum
    formulas can be used without an estimate proportional to graph size.
    For measurable seed limits, dominated convergence in the root seed and then the same child induction give the
    stated extension. Norm continuity (2.7) proves energy convergence.
  ===== 2.8.5 Conditional bounds and masks. <conditional-bounds-and-masks.>
  Take $W_0 = 1$. Every root map commutes with root-seed multiplication,
    by inspection of the finite-tree gates and their factorizations.
    Disintegrate the root Hilbert space over that seed. All preceding estimates remain valid in each fiber with
    the same constants: coefficients are uniformly bounded there,
    and the normalized child columns are averaged over independent child seeds.
    Moreover the weight commutes with root-seed multiplication.
    Integrating the squared conditional estimate over $J$ proves (2.24).
    With polynomial seed coefficients use instead the seed-moment weight and integrate the polynomial majorants.
    This completes the proof. ◻
]

The gate theorem controls a whole unitary. In the helper contractions we also need its first variation with
  respect to time: this is a Hamiltonian response to boundary inputs.
  The next corollary derives that response from the same unitary limit,
  so that the scalar second-order term and lower-level responses are retained.

#thm([Corollary 2.13.])[
  (Additive cut responses).  #emph[Fix a preceding finite sequence as in Theorem 14.
    Suppose a temporary Hamiltonian is diagonal in a common collection of site axes,
    with coefficients given by an exclusion calculation. Require its local Hamiltonian matrices and every
    aggregate-input derivative to have polynomial bounds as in Definition 13.
    In a cut branch let $H_D \( a \)$ denote the sum of the Hamiltonian terms affected by scalar boundary input
    $a$, truncated beyond its finite influence distance and conjugated by the preceding subtree circuit.
    Assume explicitly that
#[#set math.equation(numbering: n => "(2.28)")
 $ H_D \( - a \) = cal(P) H_D \( a \) cal(P) \, wide cal(P) bold(Omega) = bold(Omega) \,
   $ <eq:additive-response-parity>]

 where $cal(P)$ is the joint spin/seed symmetry. The first two boundary derivatives have smooth limits $H_alpha =
   lim_D partial_alpha H_D \( 0 \)$ and $H_(alpha lambda) = lim_D partial_alpha partial_lambda H_D \( 0 \)$,
   and $H_alpha$ is centered. These limits concern the response derivatives;
   no limit for the extensive $H_D \( 0 \)$ is required. The change in its $D$ child branches when zero boundary
   input is replaced by $a \/ sqrt(D)$ is
$ sum_(j = 1)^D #scale(x: 120%, y: 120%)[\[] H_D \( a \/ sqrt(D) \) -
  H_D \( 0 \) #scale(x: 120%, y: 120%)[\]]^(\( j \)) . $

 Its smooth limit is
#[#set math.equation(numbering: n => "(2.29)")
 $ sum_alpha a_alpha q \( H_alpha bold(Omega) \) + 1 / 2 sum_(alpha \, lambda) a_alpha a_lambda chevron.l
   H_(alpha lambda) chevron.r_0 . $ <eq:additive-cut-response>]

 The correction is realized as the self-adjoint generator of the limiting time group of the child cut ratios;
   the display specifies its action on the smooth domain. We use the same realization after commuting substitution
   and for the correction generators below. The same formula applies recursively to lower cut responses and to
   their input jets. It is continuous with the smooth bounds of Theorem 14, for a fixed finite list of channels.
   Commuting parameter operators may replace $a$ under the same exclusions.]
  #emph[In particular, if a sequence of such correction generators $R_j$ satisfies $parallel R_j xi parallel lt.eq
    delta_j parallel W^r xi parallel$ with $delta_j arrow.r 0$, then
#[#set math.equation(numbering: n => "(2.30)")
 $ parallel \( e^(upright(i) t R_j) - 1 \) xi parallel lt.eq \| t \| delta_j parallel W^r xi parallel .
   $ <eq:small-generator-error>]

 If their exponentials and adjoints also have uniform smooth bounds,
   these errors tend to zero in every fixed lower graph norm and may be inserted in a fixed surrounding sequence.]
] <cor:additive-response>

#proof[
  Differentiating (2.28) at zero gives $cal(P) H_alpha cal(P) = - H_alpha$, proving centering.
    To justify all Hamiltonian-jet bounds without an estimate on an extensive Hamiltonian,
    introduce an unscaled real time $t$ and use the unitary cut ratio
  $ K_D \( a \; t \) = exp #scale(x: 120%, y: 120%)[\(] upright(i) t \[ H_D \( a \) - H_D \( 0 \) \]
    #scale(x: 120%, y: 120%)[\)] . $
  All current Hamiltonian terms commute before conjugation, and simultaneous conjugation preserves this property.
    In particular $H_D \( a \)$ and $H_D \( 0 \)$ commute. Thus the display is exactly the prior-frame ratio of
    the zero- boundary gate and the gate with boundary input $a$.
    A local matrix $e^(upright(i) t h \( x \))$ and all its mixed $t \,
    x$ derivatives have polynomial bounds from the assumed bounds on $h$ (use Duhamel’s formula for matrix
    derivatives). The external-parameter version of Theorem 14,
    which also applies to its truncated cut recursions, therefore gives uniform smooth bounds and convergence of
    $K_D \( a \; t \)$ with all time and boundary-input jets. In particular
  $ H_D \( a \) - H_D \( 0 \) = 1 / upright(i) partial_t K_D \( a \; 0 \) \, wide partial_a^alpha H_D \( a \) =
    1 / upright(i) partial_a^alpha partial_t K_D \( a \; 0 \) quad \( \| alpha \| gt.eq 1 \) . $
  These are the required bounds for the response jets; no bound for the possibly extensive $H_D \( 0 \)$ is
    asserted or used.
  For the child-product limit compute the first two boundary jets at zero:
  $ K_alpha \( t \) = upright(i) t H_alpha \, wide K_(alpha lambda) \( t \) = upright(i) t H_(alpha lambda) -
    t^2 / 2 { H_alpha \, H_lambda } . $
  In Lemma 9 one has $T_alpha = t H_alpha$; the two anticommutator terms cancel exactly.
    The product of the $D$ child ratios therefore tends, with all time jets,
    to the exponential of $upright(i) t$ times (2.29). Differentiating at $t =
    0$ establishes the asserted smooth Hamiltonian limit itself.
    The finite-degree child products are unitary groups in $t$.
    Their strong limits at positive and negative times retain the group law and inverses,
    while convergence of time jets gives strong continuity. Their self-adjoint generators consequently act on
    smooth vectors by (2.29); no separate choice of closure of the displayed expression is used.
    The exclusions and Lemma 12 allow operator inputs and preserve the group law and this generator
    identification. Repeating this argument at the finitely many affected levels proves the recursive assertion.
  For $R_j$ with this self-adjoint realization, the spectral inequality $\| e^(upright(i) t x) -
    1 \| lt.eq \| t x \|$ proves (2.30). Uniform smooth bounds and (2.14) then give higher-norm convergence;
    applying the same reasoning to the adjoints and using finite composition proves the final statement. ◻
]

#prodef([Remark 2.14.])[
  (Scope of uniformity).  The constants in the calculus are uniform in degree and in the stated pointwise
    approximation limits, for a fixed finite calculation and fixed surrounding sequence.
    They are not automatically uniform when the number of roles or channels tends to infinity.
    In a refinement argument, such as the helper contraction below,
    that additional uniformity must be proved from estimates on the combined columns or kernels.
    Once it is proved, the same smooth-domain and continuity arguments apply.
    Scalar phases depending only on the root seed commute with root observables and do not change insertion
    vectors or the child conjugations in the cut recursion.
] <rem:calculus-uniformity>

== 3 A near-optimal bounded classical formula <sec:classical-optimization>

We now construct a bounded classical output whose rooted energy is arbitrarily close to $P_(*)$.
  The construction has two parts. A scalar Parisi diffusion first gives a finite function of independent Gaussians
  with an explicitly computable value. We realize those Gaussians as positions in the recursive space of
  Section 2.3. Bounded approximation and type exclusions then put the formula in the class required for quantum
  synthesis. These last two operations will also serve the independent positive-temperature construction in Appendix 8.

=== 3.1 The scalar input <the-scalar-input>

We use the following results from the complete companion #emph[Full support of the zero-temperature
  Sherrington–Kirkpatrick order parameter] [19]. We state the normalization and the finite formula explicitly
  because the rooted realization below depends on their exact form.

Let $cal(U)$ consist of the nonnegative, nondecreasing, right-continuous functions $gamma : \[ 0 \, 1 \)
  arrow.r \[ 0 \, oo \)$ with $integral_0^1 gamma \( t \) thin upright(d) t < oo$.
  Define the Parisi value function by the controlled heat equation

$ Phi_t = - 1 / 2 \( Phi_(x x) + gamma \( t \) Phi_x^2 \) \, wide Phi \( 1 \, x \) = \| x \| \, $

in its integrable-coefficient control interpretation, and put

$ cal(P) \( gamma \) = Phi_gamma \( 0 \, 0 \) - 1 / 2 integral_0^1 t gamma \( t \) thin upright(d) t . $

The ground-state formula and attainment of Auffinger and Chen [2] Theorem 1 and the proof of Lemma 3 identify
  $min_(gamma in cal(U)) cal(P) \( gamma \)$ with the constant $P_(*)$ in (1.2). Fix any such minimizer.
  Throughout this section $gamma \( t \)$ is this scalar coefficient, not a vector of cost angles.

For clarity, the covariance of the unordered-pair Hamiltonian is $bb(E) h_(n \, J) \( sigma^1 \)
  h_(n \, J) \( sigma^2 \) = n R_12^2 \/ 2 - 1 \/ 2$, where $R_12 = n^(- 1) sum_i sigma_i^1 sigma_i^2$.
  Adding a centered Gaussian of variance $1 \/ 2$, constant across configurations,
  gives covariance $n xi \( R_12 \)$ without changing the expected maximum.
  This is the normalization of the cited formula.

Write $u = Phi_(gamma \, x)$, $a = Phi_(gamma \, x x)$ and let

$ upright(d) X_t = gamma \( t \) u \( t \, X_t \) thin upright(d) t + upright(d) B_t \, wide X_0 = 0 . $

The companion proves full relative Stieltjes support on $\[ 0 \, 1 \)$,
  with the convention $mu_gamma \( \[ 0 \, t \] \) = gamma \( t \)$, and gives

#[#set math.equation(numbering: n => "(3.1)")
 $ bb(E) u \( t \, X_t \)^2 = t \, wide bb(E) a \( t \, X_t \)^2 = 1 \, wide P_(*) =
   integral_0^1 bb(E) a \( t \, X_t \) thin upright(d) t . $ <eq:scalar-consistency-value>]

Here $u$ is odd, $a$ is even and nonnegative, and $\| u \| lt.eq 1$.
  All their spatial derivatives are bounded on every fixed strip ending before one.
  These are Theorem 1.1, Lemmas 2.1–2.2 and Corollary 7.1 of [19];
  their complete analytic proofs belong to that companion, not to the rooted-space argument below.
  In particular, Cauchy–Schwarz gives

#[#set math.equation(numbering: n => "(3.2)")
 $ 0 lt.eq P_(*) - integral_0^T bb(E) a \( t \, X_t \) thin upright(d) t lt.eq 1 - T \, wide
   0 < T < 1 . $ <eq:scalar-terminal-loss>]

No smooth density of $mu_gamma$ or bound uniform as $T arrow.t 1$ is used here.

The use of the Parisi gradient and a normalized Euler martingale follows the classical constructions of
  Montanari [18] Section 3.1 and El Alaoui, Montanari, and Sellke [8] Proposition 5.3.
  The precise shifted-coefficient identity needed here is the scalar companion input stated below.

For fixed $0 < T < 1$ and an integer $N gt.eq 1$, set $Delta = T \/ N$ and $t_j = j Delta$.
  On independent standard normal variables $Z_1 \, dots.h \, Z_(N + 1)$, define

#[#set math.equation(numbering: n => "(3.3)")
 $ Y_0 & = 0 \, wide Y_j = Y_(j - 1) + sqrt(Delta) thin Z_j +
   Delta gamma \( t_(j - 1) \) u \( t_(j - 1) \, Y_(j - 1) \) \,\
c_j & = #scale(x: 120%, y: 120%)[\(] bb(E) a \( t_(j - 1) \, Y_(j - 1) \)^2
  #scale(x: 120%, y: 120%)[\)]^(- 1 \/ 2) \, wide g_j = c_j a \( t_(j - 1) \, Y_(j - 1) \) Z_j \, wide 1 lt.eq
  j lt.eq N . $ <eq:scalar-euler>]

For all sufficiently large $N$, each $c_j$ is finite and positive.
  With $Phi_(upright(G))$ the standard normal distribution function, put

#[#set math.equation(numbering: n => "(3.4)")
 $ H_N & = u \( T \, Y_N \) + 2 Phi_(upright(G)) \( Z_(N + 1) \) - 1 \, & F_N & = "sgn" \( H_N \) \,\
A_j & = bb(E) \[ F_N g_j \] quad \( 1 lt.eq j lt.eq N \) \, & B_i & =
  bb(E) \[ F_N Z_i \] quad \( 1 lt.eq i lt.eq N + 1 \) \, wide A_0 = 0 . $ <eq:scalar-rounding>]

Conditional on $Z_1 \, dots.h \, Z_N$, the added variable $2 Phi_(upright(G)) \( Z_(N + 1) \) -
  1$ is uniform on $\( - 1 \, 1 \)$. Since $\| u \| lt.eq 1$,

$ bb(E) \[ F_N divides Z_1 \, dots.h \, Z_N \] = u \( T \, Y_N \) . $

Thus sign rounding preserves the terminal gradient as its conditional mean.
  The same uniformity makes the value of the sign at zero immaterial. Proposition 7.2 of [19] states that

#[#set math.equation(numbering: n => "(3.5)")
 $ lim_(N arrow.r oo) sum_(j = 0)^N A_j B_(j + 1) = integral_0^T bb(E) a \( t \, X_t \) thin upright(d) t .
   $ <eq:scalar-coefficient-limit>]

The mesh limit in this assertion is taken at fixed $T$; only afterwards is $T$ allowed to approach one.
  This finite scalar identity, rather than a finite-degree message-passing theorem,
  is the input to the next construction.

=== 3.2 Exact realization in the rooted Gaussian space <exact-realization-in-the-rooted-gaussian-space>

Recall that a real centered child vector $f$ defines a Gaussian position $sans(G) \( f \) =
  q \( f \)$ at its parent, with covariance $bb(E) \[ sans(G) \( f \) sans(G) \( g \) \] = chevron.l f \,
  g chevron.r$. The parent seed is independent of these child-Fock coordinates.
  These two facts allow the scalar variables above to be constructed successively at finite height.

#thm([Lemma 3.1.])[
  (A finite Gaussian formula and its rooted energy).  #emph[Fix $T \, N$ and the scalar data in (3.3)–(3.4),
    with all $c_j$ finite and positive. There is a real odd finite descendant formula $F_N$ of height at most $N +
    1$ in the classical rooted space whose Gaussian coordinates have exactly the stated joint law and whose energy
    satisfies
#[#set math.equation(numbering: n => "(3.6)")
 $ cal(E) \( F_N \) = sum_(j = 0)^N A_j B_(j + 1) . $ <eq:scalar-rooted-energy>]

 The formula is bounded by one, although its transmitted columns need not be bounded.]
] <lem:gaussian-rooted-realization>

#proof[
  Let $S$ be a standard Gaussian in the local root-seed factor and start with $g_0 = S$. Recursively set
  $ Z_(j + 1) = sans(G) \( g_j \) \, wide 0 lt.eq j lt.eq N \, $
  and use (3.3)–(3.3) to form $Y_j \, g_j$ as soon as $Z_j$ is available.
    The constants $c_j$ here are those defined under the independent Gaussian law above.
    We will verify that the recursively constructed variables have precisely that law.
  At each step identify all earlier vectors by the compatible empty-descendant embeddings of Section 2.
    These embeddings preserve the earlier Gaussian positions:
    lifting an embedded child vector gives the embedded copy of its previous lift.
    Thus the recursion uses the same earlier variables at the next height.
    Inductively $g_j$ has height at most $j$ and $Z_(j + 1)$ has height at most $j + 1$.
    All vectors can be compared in the same finite-height space whenever an inner product is taken.
  We show inductively that $g_0 \, dots.h \, g_j$ are real centered orthonormal vectors.
    The claim holds for $g_0$. If it holds through $g_(j - 1)$, the positions $Z_1 \, dots.h \,
    Z_j$ are jointly centered Gaussian with identity covariance, hence independent standard normals.
    For $j gt.eq 1$, the coefficient $c_j a \( t_(j - 1) \, Y_(j - 1) \)$ is measurable in $Z_1 \, dots.h \,
    Z_(j - 1)$. Conditional mean zero of $Z_j$ proves that $g_j$ is centered and orthogonal to all earlier $g_i$
    with $i gt.eq 1$. The normalization in (3.3) gives $lr(bar.v.double g_j bar.v.double) = 1$.
    The receiving-root seed $S$ belongs to a different tensor factor from every child-Fock position,
    so it is independent of all these positions. In particular $chevron.l g_0 \, g_j chevron.r = 0$.
    The child directions themselves may contain seeds at their own roots;
    this does not change the independence at the receiving root.
    This closes the induction and also proves that $Z_1 \, dots.h \, Z_(N + 1)$ have the required joint law.
    The coefficients are bounded at the fixed grid times, so every constructed column has moments of every finite order.
  The map $u \( t \, dot.op \)$ is odd and $a \( t \, dot.op \)$ is even.
    Consequently each $Y_j$ and $g_j$ is odd under simultaneous seed reversal.
    Since $Phi_(upright(G)) \( - z \) = 1 - Phi_(upright(G)) \( z \)$,
    the same is true of $F_N$ outside its null zero set. Hence $F_N$ is centered.
  It remains to compute its energy, not just its distribution.
    The vector $F_N$ is constant in the root-seed factor and depends only on the finite orthonormal family of
    Gaussian modes $sans(G) \( g_0 \) \, dots.h \, sans(G) \( g_N \)$.
    The adjoint root shift extracts precisely its constant-root-seed one-particle component.
    Since $q \( g \) = a^(*) \( g \) + a \( g \)$ has variance $lr(bar.v.double  bar.v.double) g^2$, this component is
  $ sans(L)^(*) F_N = sum_(j = 0)^N bb(E) \[ F_N Z_(j + 1) \] thin g_j = sum_(j = 0)^N B_(j + 1) g_j . $
  There are no other first-chaos coefficients: $F_N$ is independent of Gaussian modes orthogonal to the displayed
    family. Moreover $F_N$ is independent of the receiving-root seed, so $chevron.l F_N \, g_0 chevron.r = 0 =
    A_0$. Inner products with the other $g_j$ are exactly the scalar coefficients $A_j$.
    All vectors are real, and therefore
  $ cal(E) \( F_N \) = "Re" chevron.l F_N \, sans(L) F_N chevron.r = "Re" chevron.l sans(L)^(*) F_N \,
    F_N chevron.r = sum_(j = 0)^N A_j B_(j + 1) . $
  This proves the claimed identity, with the Gaussian variance and root-shift normalizations used throughout the
    paper. ◻
]

Combining (3.2), (3.5) and (3.6) produces a bounded near-optimal rooted vector by first choosing $T$ and then a
  finite $N$. We next make its output smooth. At these fixed parameters set $F_(N \, k) = tanh \( k H_N \)$.
  The null-set observation after (3.4) and dominated convergence give $F_(N \, k) arrow.r F_N$ in $L^2$.
  The root-shift continuity estimate is

#[#set math.equation(numbering: n => "(3.7)")
 $ \| cal(E) \( f \) -
   cal(E) \( g \) \| lt.eq \( lr(bar.v.double  bar.v.double) f + lr(bar.v.double  bar.v.double) g \)
   lr(bar.v.double f - g bar.v.double) . $ <eq:energy-l2-continuity>]

Both outputs have norm at most one. Thus for every $epsilon > 0$ we may choose finite $T \, N \, k$ so that

#[#set math.equation(numbering: n => "(3.8)")
 $ z = F_(N \, k) \, wide \| z \| lt.eq 1 \, wide cal(E) \( z \) gt.eq P_(*) -
   epsilon . $ <eq:scalar-near-optimal-smooth>]

For the already fixed $T \, N \, k$, every transmitted-column map and the final output map is jointly odd and
  smooth, with all derivatives of polynomial growth in its finite list of odd inputs.
  Indeed the Euler maps use finitely many fixed-time bounded spatial derivatives of $u \, a$,
  followed in a column by multiplication by one Gaussian coordinate.
  Local intermediate operations may be composed into those maps.
  The final sign smoothing has bounded derivatives of every order at fixed $k$.

Two further operations are still necessary: bounding every transmitted column and imposing type exclusions.
  We perform them directly in the limiting Hilbert space. No finite-degree edge-energy convergence is asserted for
  the discontinuous raw $F_N$.

=== 3.3 Bounded trigonometric approximation <bounded-trigonometric-approximation>

For use with either classical construction, let $pi \( x \) = max \( - 1 \, min \( x \, 1 \) \)$.
  The next lemma applies to any finite descendant formula in its stated class.
  In the present application $pi \( z \) = z$ by (3.8).

#thm([Lemma 3.2.])[
  (Bounded trigonometric approximation).  #emph[Let $m^(*) = pi \( z \)$,
    where $z$ is a finite descendant formula with Gaussian leaf seeds.
    Assume that every transmitted child column is odd, and that each local map producing such a column or the
    output is a jointly odd smooth function of its local seed and finite list of odd aggregate inputs,
    with polynomial-growth derivatives. Purely local intermediate operations may be composed into these maps
    before the lemma is applied. For every $eta > 0$, there is an odd bounded angle formula $theta$ such that
#[#set math.equation(numbering: n => "(3.9)")
 $ lr(bar.v.double sin \( 2 theta \) - m^(*) bar.v.double) < eta . $ <eq:angle-density>]

 Every sent column in the formula for $theta$ can be chosen bounded and odd.
   Its pointwise maps can be chosen to be finite real trigonometric sums in their finite lists of odd inputs,
   with odd joint parity for odd outputs. Its local seed inputs can be chosen bounded and odd.
   All these functions have bounded derivatives of every order in their continuous arguments.]
] <lem:classical-trigonometric-density>

#proof[
  Replace a Gaussian local seed $s$ by a smooth bounded odd truncation $s_R$ satisfying $\| s_R \| lt.eq \|
    s \|$ and $s_R arrow.r s$ pointwise. It converges in every finite moment.
    At a fixed finite depth this changes the original formula by an amount tending to zero in every required
    finite moment: use (2.10) at each aggregation, Gaussian moment bounds for its finite list of fields,
    and the polynomial bounds for the derivatives of the pointwise maps.
  Fix $0 < kappa < 1$. The desired final angle
  $ theta_kappa = 1 / 2 arcsin \( \( 1 - kappa \) m^(*) \) $
  is bounded and odd, and is a Lipschitz function of the clipped output.
    It satisfies $sin \( 2 theta_kappa \) = \( 1 - kappa \) m^(*)$.
    We approximate this angle and all its subformulas beginning at the output and working toward the leaves.
    For the finite-dimensional ideal input law at a pointwise operation,
    a continuous polynomial-growth function has an arbitrarily accurate $L^p$ approximation,
    for any fixed finite $p$, by a bounded smooth function with bounded derivatives.
    This follows by a smooth cutoff outside a large box and mollification;
    the uniform moments control the cutoff error. Symmetrizing by $F \( x \)
    mapsto \( F \( x \) - F \( - x \) \) \/ 2$ preserves oddness and does not increase its error under the
    symmetric input law.
  Once an outer map has been replaced by a fixed bounded Lipschitz map,
    perturbations of its inputs propagate continuously in $L^2$.
    For its aggregate inputs this is exactly (2.10), jointly for the finite list of child columns.
    We can therefore choose the approximations at the next lower level sufficiently accurately to preserve the
    already chosen output accuracy. There are finitely many operations,
    so induction supplies a formula in which every transmitted scalar function is bounded, smooth, and odd.
    No uniform bound on Lipschitz constants over the sequence of approximation choices is needed;
    each outer choice is fixed before its inputs are approximated.
  Finally a bounded smooth cutoff supported strictly inside a box can be extended periodically to a larger box.
    Fourier approximation of this smooth periodic function gives finite trigonometric sums converging uniformly,
    with any prescribed finite number of derivatives, on that box.
    To control the complement, first fix the box so that its probability is small and choose the Fourier
    approximation uniformly on the entire period; both the cutoff and its approximant then have a common finite
    sup norm. The same output-to-leaf continuity argument applies.
    Odd symmetrization leaves only sine terms $sin \( lambda dot.op x \)$ for an odd scalar output.
    This constructs the asserted trigonometric formula. Choose its angle error smaller than $eta \/
    4$ and $kappa < eta \/ 2$. Since $x mapsto sin \( 2 x \)$ is $2$-Lipschitz, the resulting output satisfies (3.9). ◻
]

=== 3.4 The synthesis interface <the-synthesis-interface>

A #emph[mask] is an event in the local seed space invariant under seed sign reversal.
  Masks at different vertices are evaluated on their respective seeds.
  We use a finite partition into masks and write $p_R$ for the probability of a mask $R$.
  Probabilities used as denominators are positive. For disjoint masks $R \, S$, let

$ \( A_(R S) f \)_i = upright(bold(1))_R \( i \) D^(- 1 \/ 2) sum_(j tilde.op i) upright(bold(1))_S \( j \) f_j . $

This notation first denotes a finite-tree operation. Its rooted limit is provided by Theorem 14.

The scalar formulas considered here have finite expression trees.
  Their leaves are bounded measurable functions of the local seed.
  An internal operation is either a pointwise function of finitely many already constructed quantities or an
  aggregation $A_(R S)$. Pointwise functions are smooth in their aggregate arguments,
  with polynomial bounds on every derivative, uniformly in the local seed.
  Local seed dependence itself need not be smooth. All quantities sent across edges are odd under simultaneous
  reversal of seeds and odd spin axes. In the classical formulas there are no spin arguments,
  so this is simply joint seed parity. Sent nonlinear functions, and the output angles, are bounded.
  The aggregate fields need not be bounded.

#prodef([Definition 3.3.])[
  (Exclusion formulas).  An aggregation from $S$ to $R$ is #emph[excluded] if the formula sent from $S$ uses no
    vertex in $R$ anywhere below that aggregation. The formulas used in this section satisfy this requirement at
    every aggregation and retain all ancestor exclusions: the masks along any branch of an expression tree are
    distinct. Different occurrences of a formula with different exclusion lists are regarded as different
    formulas. A gate target is excluded from all cross-edge dependencies of its parameters.
] <def:exclusion-formulas>

The distinction between an expression tree and the underlying regular tree is useful.
  A formula may reuse a mask in different expression branches.
  The exclusion rule forbids its reuse along a single active branch.
  It therefore forbids an immediate return across a cut, without requiring independent values for two formulas
  that happen to use the same descendant subtree.

=== 3.5 Colors, exclusions, and helpers <colors-exclusions-and-helpers>

A descendant formula omits the parent #emph[vertex] in its finite-tree interpretation.
  We now impose the stronger type exclusions needed for synthesis.
  We estimate their cost in the limiting classical space, where (2.10) makes the cost of deleting
  small-probability types explicit.

Let $s_(upright("raw"))$ denote the single standard Gaussian available as the local control seed.
  Its sign is an independent fair sign, and the distribution function of its absolute value is uniform on
  $\( 0 \, 1 \)$. Splitting the binary digits of that uniform variable into disjoint subsequences produces
  independent uniform variables, apart from a null set of dyadic ambiguities.
  Use one for a finite color variable $C$, and another, together with the original sign,
  to generate a fresh standard Gaussian $S$. This defines a measurable map

#[#set math.equation(numbering: n => "(3.10)")
 $ s_(upright("raw")) mapsto #scale(x: 120%, y: 120%)[\(] C \( s_(upright("raw")) \) \,
   S \( s_(upright("raw")) \) #scale(x: 120%, y: 120%)[\)] \,\
C \( - s_(upright("raw")) \) = C \( s_(upright("raw")) \) \, wide S \( - s_(upright("raw")) \) = -
  S \( s_(upright("raw")) \) \, $ <eq:raw-seed-reencoding>]

whose image has the product law of the chosen color and a standard Gaussian.
  Every colored formula below is evaluated at this pair at each vertex:
  its Gaussian input is $S \( s_(upright("raw")) \)$. The necessary color masks are bounded measurable even
  functions of the original local seed. Smoothness below refers to the continuous message arguments conditional on
  a color; no smoothness of a mask as a function of the original seed is asserted or required.

One may first adjoin an independent color to the color-free seed space and then pull back by (3.10).
  The local pullback $f \( C \, S \) mapsto f \( C \( s_(upright("raw")) \) \, S \( s_(upright("raw")) \) \)$
  preserves the product law, inner products, and the constant seed vector.
  Tensoring it at the root and applying the symmetric Fock functor to its centered child restriction extends it to
  every recursive height. These isometries respect the empty-descendant embeddings, preserve parity,
  and intertwine $sans(L)$, which inserts a constant seed at the new root.
  Thus both adjoining colors and pulling the entire formula back to the raw seeds preserve its rooted energy.
  Partition the colors into nonhelper types $1 \, dots.h \, M$ and helper types. Write

$ max_(1 lt.eq c lt.eq M) Pr \( C = c \) lt.eq alpha \, wide Pr \( C upright(" is a helper") \) = p_H . $

Every helper type may have a prescribed positive probability, subject to the total being sufficiently small.
  The number of helper types needed later is finite, at most one per nested propagation depth.

#thm([Lemma 3.4.])[
  (Type exclusion at small cost).  #emph[Fix a descendant formula in which every transmitted column and the output
    are given by jointly odd bounded smooth functions of the local odd seed and the odd aggregate inputs,
    with bounded first derivatives. Let its propagation depth be $h$.
    It has a finite realization by colored formulas such that every aggregation excludes the current color,
    all colors of the path ancestors, and all helper colors. If $f$ is its original output and
    $f^(upright("col"))$ its colored output, set to zero on helper roots, then
#[#set math.equation(numbering: n => "(3.11)")
 $ lr(bar.v.double f^(upright("col")) - f bar.v.double)^2 lt.eq C \( alpha + p_H \) \, $ <eq:color-exclusion-bound>]

 where $C$ depends only on the fixed color-free formula, not on the number or individual probabilities of its
   nonhelper colors. Conditional bounds for the unchanged nonlinear pointwise functions and their derivatives in
   the original grouped aggregate coordinates are uniform over these colors.
   No bound independent of $M$ is asserted for the Euclidean derivative norm after flattening all source-color
   fields into separate coordinates.]
] <lem:classical-color-exclusion>

#proof[
  Unroll the fixed expression into a finite expression tree.
    For each occurrence, each possible current nonhelper color $c$, and each possible set $A$ of ancestor colors,
    make a copy of the lower formula. Its aggregates retain only children whose colors avoid $A union {
    c }$ and all helpers. At a retained child of color $d$, the recursive copy uses ancestor set $A union {
    c }$ and current color $d$. Thus its own aggregates exclude $A union { c \, d }$.
    All sets encountered have size at most $h + 1$. There are finitely many copies because the original depth and
    the color partition are finite. The aggregation at color $c$ is the sum of its source-color aggregations.
    Linearity of $sans(G)$ identifies this finite sum with the lift of the corresponding masked child column.
  These copies also define an orientation-free all-neighbor rule.
    When a recursive call crosses from a vertex $i$ of color $c$ to a vertex $j$ of color $d$,
    the ancestor list at $j$ contains $c$. Every aggregate at $j$ therefore gives the neighbor $i$ a zero mask.
    Its sum over all neighbors equals its sum over neighbors other than $i$,
    with the same normalization $D^(- 1 \/ 2)$. Induction over the expression depth identifies the all-neighbor
    calculation with the descendant calculation on each active branch.
    The outer root has no parent and uses all its neighbors. In particular the finite rule uses the aggregations
    $A_(R S)$ of the synthesis interface without requiring a parent orientation.
    A full root has $D + 1$ neighbors; its limiting formula agrees with the $D$-child convention by the full-root
    assertion of Theorem 14.
  Here is a uniform error estimate. Give the original formula the extra independent colors but ignore them in its
    computation. At one aggregate, let $g$ be its ideal bounded child column, with $\| g \| lt.eq K$,
    and let $g^(A \, d)$ be the recursively modified column on a retained color $d$.
    Couple the two fields using (2.10). The modified aggregate has child column
  $ tilde(g) = sum_(d in.not A union { c } \, med d med upright("nonhelper")) upright(bold(1))_({ C = d })
    g^(A union { c } \, d) . $
  The color masks are orthogonal, and $g$ is independent of the colors at its root. Hence
  $ lr(bar.v.double tilde(g) - g bar.v.double)^2 & lt.eq K^2 #scale(x: 120%, y: 120%)[\(] p_H + \( \| A \| + 1 \)
    alpha #scale(x: 120%, y: 120%)[\)]\
 & quad + max_(d in.not A union { c }) bb(E) #scale(x: 120%, y: 120%)[\[] \| g^(A union { c } \, d) -
   g \|^2 divides C = d #scale(x: 120%, y: 120%)[\]] . $
  Every masked column is centered: color masks are even and the conditional formula is odd in the Gaussian seeds.
    Thus the Gaussian-isometry identity applies without a mean correction.
    For a list of $k$ aggregates the squared Euclidean input error is the sum of their squared errors.
    A pointwise map with Lipschitz constant $K'$ multiplies that sum by at most $\( K' \)^2$.
    Inducting over the finite expression depth, with the unchanged bounded local seed as the base case,
    proves a conditional squared error bounded by $C \( alpha + p_H \)$ uniformly over current and ancestor
    colors. Setting the helper-root output to zero adds at most $lr(bar.v.double  bar.v.double) f_oo^2 p_H$.
  This estimate has the fan-in of the original formula, not the number of color copies:
    disjoint child masks were combined by squared norms before applying a Lipschitz bound.
    Each nonlinear pointwise map still receives the original finite list of grouped fields:
    if it originally had $k$ field arguments, its colored version is
    $F \( S \, Y_1^(upright("col")) \, dots.h \, Y_k^(upright("col")) \)$, where
  $ Y_r^(upright("col")) = sum_d sans(G) \( upright(bold(1))_({ C = d }) g_(r \, d) \) =
    sans(G) (sum_d upright(bold(1))_({ C = d }) g_(r \, d)) . $
  The conditional derivative bounds in these $k$ arguments are unchanged.
    The finite sums defining grouped fields are additional linear operations and can be unbounded;
    boundedness is required of the transmitted columns and final angles, not of Gaussian fields.
    For a trigonometric formula, substitute each grouped linear sum into the next pointwise map.
    A trigonometric term in linear combinations of the source fields is still a trigonometric term,
    so this substitution preserves the finite trigonometric form without retaining separate linear pointwise maps.
    For the synthesis interface, a rotation by a grouped field is exactly the product of the source-field
    rotations on the same axis, since these classical fields commute.
    If a compilation instead regards all the source fields as separate coordinates,
    its derivative constants may depend on the fixed number $M$. This is harmless:
    $M$ and all these finite lists are fixed before any helper refinement or quantum approximation is taken.
    Only the classical error constant in (3.11) and the bounds in the original grouped coordinates are asserted to
    be independent of $M$. ◻
]

#thm([Proposition 3.5.])[
  (Classical near-optimality in synthesis form).  #emph[For every $epsilon > 0$ and every $eta_H > 0$,
    there are a finite color partition with helper probability $0 < p_H < eta_H$, a finite number of helper types,
    and finite bounded odd angle formulas $theta_c$ on the nonhelper colors such that the following hold.
    Each transmitted column is bounded and odd, every pointwise map may be chosen as a finite trigonometric sum in
    its odd inputs, and every aggregation excludes its current color, all path-ancestor colors, and all helpers.
    Conditional on the finite labels, all continuous derivatives of the pointwise maps are bounded. The output
#[#set math.equation(numbering: n => "(3.12)")
 $ m^(upright("col")) = sum_(c = 1)^M upright(bold(1))_({ C = c }) sin \( 2 theta_c \) $ <eq:final-classical-formula>]

 is centered, satisfies $\| m^(upright("col")) \| lt.eq 1$, vanishes on helper roots, and obeys
#[#set math.equation(numbering: n => "(3.13)")
 $ cal(E) \( m^(upright("col")) \) gt.eq P_(*) - epsilon . $ <eq:final-classical-value>]

 After the uncolored finite formula has been fixed, the total helper probability may be taken arbitrarily small,
   with all individual helper probabilities positive. All depths, coefficients, label laws,
   and functions in the conclusion are fixed independently of degree, system size, and disorder.]
] <prop:classical-near-optimum>

#proof[
  Use (3.8) with error $epsilon \/ 3$ and write $m^(*) = z$.
    Apply Lemma 18 to obtain an angle $theta$ whose output $m =
    sin \( 2 theta \)$ has $lr(bar.v.double m - m^(*) bar.v.double) < epsilon \/ 12$.
    Both outputs are bounded by one, so (3.7) loses less than $epsilon \/ 6$.
    Fix this entire bounded trigonometric formula, including its finite depth and Lipschitz constants.
  Reserve a distinct helper type for each propagation depth.
    Choose their positive probabilities with total $p_H < eta_H$ sufficiently small,
    and partition the remaining probability into finitely many colors of maximum probability $alpha$ sufficiently
    small. Apply Lemma 20 to the angle calculation and use the $2$-Lipschitz property of sine.
    Taking $alpha \, p_H$ smaller if necessary gives $lr(bar.v.double m^(upright("col")) - m bar.v.double) <
    epsilon \/ 6$. Another application of (3.7) loses less than $epsilon \/ 3$.
    The total loss is less than $epsilon$. Oddness gives centering,
    and the remaining claims follow directly from the construction.
    Every choice has been made for a fixed finite calculation in the limiting rooted space;
    no uniform rate in the number of colors, circuit depth, or helper probabilities has been used. ◻
]

== 4 Compiling classical formulas with seeded controls <sec:classical-synthesis>

The preceding section supplies a bounded classical formula whose rooted energy is close to the SK optimum.
  We now implement any formula in that class by quantum controls with independent Gaussian longitudinal seeds.
  A #emph[seeded circuit] is a finite word in the cost, the uniform mixer, and the gates

$ exp #h(-0.16667em) (- upright(i) t sum_i s_i Z_i) \, wide t in bb(R) \, $

where the same independent standard Gaussian family $\( s_i \)$ is used throughout the word and averaged in its
  value. Here $s_i = s_(upright("raw") \, i)$ is the raw seed of (3.10):
  every colored target formula is evaluated at $C \( s_i \) \, S \( s_i \)$.
  Both the color and the scalar Gaussian input are therefore functions of the seed driving this single
  longitudinal control. All angles are deterministic. Section 5 will remove this extra control after the present
  construction has selected one finite word.

We use the masks, aggregations $A_(R S)$, and seed-only exclusion formulas of Definition 19.
  In particular, every transmitted nonlinear function and every output angle is bounded,
  although aggregate fields need not be bounded. A mask may recur in different branches of an expression tree,
  but not along a single active branch. We retain this distinction throughout the proof:
  formulas that share descendants are not assumed independent.

All approximations in this section take place in the infinite-degree rooted representation,
  inside a fixed surrounding circuit. We first construct elementary masked controls,
  then use unused helper spins to implement one aggregation,
  and finally compile a finite expression tree from its outermost operations inward.
  The helper contraction is the main step. Its proof controls both the visible aggregation and the changes it
  induces inside every lower formula.

=== 4.1 The synthesis statement <the-synthesis-statement>

Fix a finite collection of such formulas $theta_R$, odd and seed-only, one for each output mask $R$.
  Their ideal operation is

#[#set math.equation(numbering: n => "(4.1)")
 $ U_(upright("cl")) = product_i exp \( upright(i) theta_i Y_i \) \, wide m_i =
   sin \( 2 theta_i \) . $ <eq:ideal-classical-rotations>]

The product is locally defined: an output at a vertex uses only a fixed-radius neighborhood.
  The factors commute because the angles are seed-only. Reserve disjoint helper masks,
  absent from all these formulas, and set the output angle to zero on them.
  One helper mask per aggregation depth is sufficient. Let $H$ denote their union and let $p_H$ be its probability.

#thm([Theorem 4.1.])[
  (Classical synthesis).  #emph[For every finite collection of bounded smooth odd seed-only exclusion formulas of
    Definition 19, with disjoint positive-probability helper masks, one for each positive aggregation depth,
    absent from all their dependencies and with output angle zero on their union $H$, and every $eta > 0$,
    there is a finite seeded circuit whose insertion vector $v$ satisfies
#[#set math.equation(numbering: n => "(4.2)")
 $ lr(bar.v.double upright(bold(1))_(H^c) \( v - v_(upright("cl")) \) bar.v.double) < eta \, $ <eq:synthesis-insertion>]

 where $v_(upright("cl"))$ is the insertion vector of (4.1). In particular its value obeys
#[#set math.equation(numbering: n => "(4.3)")
 $ \| cal(E) \( v \) - cal(E) \( m \) \| lt.eq 2 eta + 2 sqrt(p_H) . $ <eq:synthesis-energy>]

 The circuit and all its angles are chosen independently of the degree, system size, and disorder.
   Helper probabilities can be arbitrarily small but are fixed and positive when the construction is performed.]
] <thm:classical-synthesis>

The proof will establish convergence in a fixed surrounding circuit,
  not only convergence on a freshly initialized input. This is needed because a formula is called repeatedly
  inside commutator products.

We use the smooth spaces of Section 2. At the root let

$ W = 1 + upright(d) Gamma \( Lambda \) \, wide lr(bar.v.double T bar.v.double)_(a arrow.l b) =
  lr(bar.v.double W^a T W^(- b) bar.v.double) \, wide lr(bar.v.double d bar.v.double)_a =
  lr(bar.v.double Lambda^a d bar.v.double) . $

The bounded-seed version of the weights is used until the last compilation step.
  Thus the weights do not differentiate or multiply the root seed.
  In particular they commute with root masks on the odd subspace.
  A family of operators is #emph[uniformly smooth] if for each $a$ there are $b \, C$,
  independent of the member of the family, with $lr(bar.v.double T bar.v.double)_(a arrow.l b) lt.eq C$;
  the same convention applies to adjoints and to parameter derivatives.
  For a parameter $y$, a polynomial factor in $1 + \| y \|$ is allowed.
  A statement $T = O_(upright("sm")) \( epsilon \)$ means that these bounds hold with $C
  epsilon$ for every fixed output power and every fixed jet.
  Conditional versions mean the essential supremum in the root seed.
  The constants may depend on the fixed formulas, time intervals, and positive helper probabilities.

The conditional bounds in Theorem 14 imply the following useful rule.
  If $T bold(Omega)$ has bounded conditional smooth norms and $R$ is a root mask, then

#[#set math.equation(numbering: n => "(4.4)")
 $ lr(bar.v.double W^a upright(bold(1))_R T bold(Omega) bar.v.double) lt.eq
   C_a sqrt(p_R) . $ <eq:synthesis-masked-column-bound>]

For odd columns, the removal of the vacuum in the definition of $Lambda$ does not change this estimate or the
  orthogonality of columns supported on disjoint root masks.

=== 4.2 Elementary masked controls and matrix products <sec:elementary-masked-controls>

We first identify the elementary gates from which the helper operation will be built.
  These gates need only the original Gaussian longitudinal control, parity-preserving local rotations, and the cost.

We first treat the following gates as exact:

+ local $X$ rotations with bounded even seed coefficients,
  and local $Y$ or $Z$ rotations with bounded odd seed coefficients;
+ interactions between two disjoint masks in any pair of odd axes in the $Y Z$ plane.

We justify at the end of this subsection that they lie in the closure of finite seeded circuits.
  Working with exact elementary masked gates in the interim keeps unused helpers exactly pinned.

We will repeatedly use pointwise matrix sums and commutators. Here is the topology of that use.
  If $F \( x \) \, G \( x \)$ are Hermitian two-by-two matrices with smooth polynomially bounded derivatives,
  the usual product and group-commutator formulas converge on compact sets with every fixed number of derivatives.
  Their derivative bounds are polynomial in $x$, uniformly in the subdivision.
  To verify the last, write the group-commutator loop as

$ V_h \( x \) = e^(upright(i) h F \( x \)) e^(upright(i) h G \( x \)) e^(- upright(i) h F \( x \))
  e^(- upright(i) h G \( x \)) . $

Twice integrating its mixed derivative in the two loop times shows

$ lr(bar.v.double partial_x^alpha \( V_h - 1 \) bar.v.double) lt.eq C_alpha h^2 \( 1 + \| x \| \)^(r_alpha) \,
  wide \| h \| lt.eq 1 . $

For a differentiated product of $N$ such loops, each differentiated factor contributes $O \( h^2 \)$;
  at a fixed derivative order the sum is a fixed polynomial in $N h^2$. Undifferentiated factors are unitary.
  Thus $h = N^(- 1 \/ 2)$ gives the claimed uniform bounds.
  The Taylor error of a loop is $O \( h^3 \)$, with all fixed jets on a compact set,
  so telescoping $N$ factors proves convergence there. The sum formula is identical with $N h$ in place of $N
  h^2$. Theorem 14 therefore permits these limits inside any fixed surrounding circuit.

When such a matrix formula is used simultaneously at many vertices,
  the coefficient algebra must be common and commuting, and exclude the pivot mask.
  Under that condition the entire finite-tree gate is a product of exactly those two-by-two formulas.
  Its reinterpretation at a new pivot is permitted only after an exact finite-tree identity has been established.
  These identities are also valid on every cut tree, so the rooted maps agree.

To obtain the local elementary controls from the raw seeded controls, write $s =
  s_(upright("raw"))$ and conjugate $X$ by $e^(upright(i) t s Z)$.
  Every local coefficient in the colored formulas, including every mask,
  is a measurable function of this same $s$ by (3.10). Taking sums and differences gives $cos \( 2 t s \)
  X$ and $sin \( 2 t s \) Y$; a constant $X$ rotation changes $Y$ to $Z$.
  Finite even and odd trigonometric sums are thus available, together with their exponentials.
  Bounded measurable even or odd seed functions are limits in Gaussian measure of uniformly bounded continuous
  functions with the same parity. After taking a subsequence, convergence is almost everywhere.
  A box cutoff, periodic extension, and Fejer approximation give trigonometric approximants with the same uniform
  bound and parity. Local seed derivatives are not part of the smooth topology,
  so bounded dominated convergence and Theorem 14 apply in a fixed surrounding circuit.
  If intermediate expressions use the raw linear seed, its polynomial moments are controlled by the seed-weighted
  version of that theorem.

We isolate interactions by sign averaging, a standard refocusing device for Ising couplings;
  see Jones and Knill [14] Section II. Refine the masks to a finite partition $R_1 \, dots.h \, R_M$.
  For a sign vector $epsilon.alt in { - 1 \, 1 }^M$, masked $X$ flips conjugate the ordinary cost to

$ C_epsilon.alt = D^(- 1 \/ 2) sum_({ i \, j }) epsilon.alt_(R \( i \)) epsilon.alt_(R \( j \)) Z_i Z_j . $

For distinct $a \, b$, sign orthogonality gives the finite-tree identity

$ C_(R_a R_b) = 2^(- M) sum_epsilon.alt epsilon.alt_a epsilon.alt_b C_epsilon.alt . $

All the terms on the right commute, so their exponential implements the desired subcost exactly when the masked
  flips are treated as exact. Separate masked $X$ rotations put its two endpoints in any specified axes in the $Y
  Z$ plane. This proves the claimed elementary compilation without introducing interactions within a mask.

=== 4.3 A contraction through unused spins <a-contraction-through-unused-spins>

The elementary local rotations constructed so far depend only on the seed at the rotated vertex.
  The next construction extends them to a neighbor sum of a fixed lower formula.
  It uses a disjoint set of spins kept in their $X = 1$ state,
  and its error tends to zero when the sender mask is divided into sufficiently small parts.

Let $I \, J \, K$ be disjoint masks, with $K$ an unused helper of probability $p_K > 0$.
  Let $f_j$, on $J$, be a bounded odd seed-only exclusion formula whose cross-edge dependencies avoid $I \, J \,
  K$. Other reserved helpers are avoided as well. Temporarily allow exact rotations by $f$ on $J$,
  including their restrictions to further local seed masks.
  These ideal calls will remain in the finite approximants constructed here.
  At the end of the section we will remove them by compiling the full formula from its outermost operations
  inward. We shall obtain

#[#set math.equation(numbering: n => "(4.5)")
 $ H_(I \, J \, f) = sum_(i in I) P_i \( A_(I J) f \)_i \, wide P in { Y \, Z } . $ <eq:desired-propagation>]

Partition $J$ into finitely many even seed masks $J_l$, with probabilities $p_l$.
  The formula $f$ is kept fixed when this partition is refined. The commutators below sum paths of the form

#[#set math.equation(numbering: n => "(4.6)")
 $ i in I & - & j in J_l & - & k in K & - & j' in J_l\
 &  &  &  &  &  & arrow.b\
 &  &  &  &  &  & f_(j')\
j' eq.not j : med upright("simple path") \, wide j' = j : med i - j - k - j med
  upright("(backtrack)") . $ <eq:helper-path-schematic>]

The downward arrow denotes the lower calculation of $f$, whose cross-edge dependencies avoid all three displayed
  masks. In the backtrack, $f$ is attached at $j' = j$; the two sender spin factors cancel and the pinned helper
  supplies its polarization. The simple paths contribute an error that disappears from nonhelper insertions as the
  partition is refined. We must check their effects at every root cut, including cuts inside the lower formula $f$.

Write $A_(i j) = D^(- 1 \/ 2) upright(bold(1))_(i tilde.op j)$ and $b_j = sum_(i in I) A_(j i) P_i$.
  Pointwise commutators on $J_l$ give

#[#set math.equation(numbering: n => "(4.7)")
 $ H_l & = sum_(i in I \, j in J_l \, k in K) A_(i j) A_(j k) P_i X_j Z_k \,\
G_l & = sum_(j in J_l \, k in K) A_(j k) X_j f_j Y_k . $ <eq:two-helper-generators>]

For example, $\( 2 upright(i) \)^(- 1) \[ sum A_(i j) P_i Y_j \, sum A_(j k) Z_j Z_k \] = H_l$,
  and $\( 2 upright(i) \)^(- 1) \[ sum f_j Y_j \, sum A_(j k) Z_j Y_k \] = G_l$. These are exact identities:
  the only noncommuting factors meet on $J_l$, and the seed-only coefficients commute with every spin.

At the next pivot, $K$, the two coefficients are

$ B_(k \, l) = sum_(j in J_l) A_(k j) X_j b_j \, wide F_(k \, l) = sum_(j in J_l) A_(k j) X_j f_j . $

They commute with each other and with all spins on $K$. Their calculation paths avoid $K$,
  as required by the gate calculus. Consequently $- \( 2 upright(i) \)^(- 1) \[ H_l \, G_l \] =
  sum_(k in K) X_k B_(k \, l) F_(k \, l)$. Summing and rescaling gives

#[#set math.equation(numbering: n => "(4.8)")
 $ tilde(H)_(cal(P)) = 1 / p_K sum_l sum_(i in I \, thin j \, j' in J_l \, thin k in K) P_i A_(i j) X_j A_(j k)
   X_k A_(k j') X_(j') f_(j') . $ <eq:helper-contraction-generator>]

All its summands commute. At every fixed partition $cal(P)$,
  its exponential is therefore in the closure of finite products of elementary masked gates and calls to $f$.
  This statement holds on the full spin space and in every fixed surrounding circuit;
  it has not yet used helper pinning.

We now specify the space on which pinning is used. On a finite light cone with vertex set $V$,
  define the orthogonal projection

#[#set math.equation(numbering: n => "(4.9)")
 $ Pi_(K \, V) = product_(v in V) [1 - upright(bold(1))_K \( s_v \) frac(1 - X_v, 2)] .
   $ <eq:helper-pinning-projection>]

Its range fixes every helper-labeled spin in $\| chevron.r +$, at the root and throughout its descendants,
  while retaining all seed coordinates. For the degree limit, let

$ sans(k)_K = "Ran" #h(-0.16667em) (1 - upright(bold(1))_K \( s \) frac(1 - X, 2)) \,\
cal(H)_(K \, 0) = sans(k)_K \, wide cal(H)_(K \, h + 1) = sans(k)_K ⊗ Gamma_s \( cal(H)_(K \, h)^compose \) \, $

where the centered subspace is taken relative to the same vacuum $bold(Omega)_h$ as before.
  These spaces are subspaces of $cal(H)_h$. The occupation and empty-descendant embeddings restrict to them,
  as do the bounded-seed weights, so their smooth norms are inherited from the original recursion.
  We call this the #emph[compressed space]. Helper-labeled descendant spaces remain present;
  only their helper spins are pinned, and the seed law is unchanged.

The ideal propagations, the exact generators (4.8), and surrounding gates avoiding $K$ preserve this range.
  The observable $upright(bold(1))_(K^c) \( s_o \) Z_o$ at the root $o$ also preserves it.
  Thus nonhelper insertions may be computed in the compressed space.
  This restriction is different from multiplication of an insertion vector by $upright(bold(1))_(K^c)$,
  which selects only the root label and imposes no condition on descendant spins.
  The individual commutator factors need not preserve pinning;
  their finite products will be chosen after the exact contraction.

#thm([Proposition 4.2.])[
  (Simultaneous helper contraction).  #emph[Consider a fixed finite sequence in the parity-preserving,
    root-seed-commuting gate-calculus class, containing finitely many propagations (4.5),
    possibly with different $I \, J \, f \, P$, and otherwise fixed gates.
    All its gates and classical parameters avoid a common helper $K$. Start with its spins pinned at $X = 1$.
    Replace every indicated propagation by (4.8), and refine their sender partitions so that their largest part
    probability tends to zero. Then all insertion vectors off $K$ converge to those of the original sequence.
    The root maps and their adjoints have uniform conditional smooth bounds on the compressed space,
    and converge strongly there up to scalar phases depending only on the root label.
    The same estimates hold on cut subtrees. Responses through the fixed lower formulas for $f$ have the uniform
    jet estimates proved below; no convergence of arbitrary boundary jets in the growing list of
    partition-dependent top channels is asserted.]
] <prop:helper-contraction>

The contraction must control every root cut, including cuts inside $f$,
  uniformly as the sender partition is refined. The next two estimates provide the analytic bounds for its proof.
  Most cuts use a fixed number of fields. At a $K$-root, however,
  each part $J_l$ supplies a pair of incoming fields, and the proof will subtract their same-neighbor covariance.
  The second estimate controls this growing sum by the orthogonality of the masks.

=== 4.4 Estimates and proof of the contraction <estimates-and-proof-of-the-contraction>

#thm([Lemma 4.3.])[
  (A fixed number of commuting fields).  #emph[Let $Q_j = q \( d_j \)$, $1 lt.eq j lt.eq k$, commute,
    where $k$ is fixed and $lr(bar.v.double d_j bar.v.double)_a lt.eq C_a$ for every $a$.
    Let $F_s : bb(R)^k arrow.r bb(R)$ have polynomial bounds on every derivative, uniformly in the local seed $s$.
    For bounded $t$, the operators $exp \( upright(i) t F_s \( Q \) \)$, their adjoints,
    and their time derivatives are uniformly smooth. Auxiliary parameter jets obey the same conclusion when the
    weighted column jets and the joint derivatives of $F$ have the corresponding uniform polynomial bounds.
    The constants require no lower bound on the Gram matrix of the $d_j$’s.
    The same assertion holds with a fixed root control axis, by conditioning on its two eigenvalues.]
] <lem:fixed-field-exponentials>

#proof[
  The Weyl estimates in Lemma 7, applied to $sum_j xi_j d_j$, give, for every $a$,
  $ lr(bar.v.double W^a e^(upright(i) xi dot.op Q) zeta bar.v.double) lt.eq
    C_a \( 1 + \| xi \| \)^(r_a) lr(bar.v.double W^(b_a) zeta bar.v.double) . $
  Only upper bounds for weighted column norms enter this inequality.
    For an integer $N$, put $g_(s \, t) \( x \) = e^(upright(i) t F_s \( x \)) \( 1 + \| x \|^2 \)^(- N)$.
    Fix the desired output power. First choose enough derivatives that integration by parts gives an integrable
    Fourier bound with weight $\( 1 + \| xi \| \)^(r_a)$, and then choose $N$ large enough that those derivatives
    are integrable, uniformly in $s \, t$. The polynomial derivative assumptions permit this order of choices.
    Functional calculus gives, on smooth vectors,
  $ e^(upright(i) t F_s \( Q \)) = integral_(bb(R)^k) hat(g)_(s \, t) \( xi \) e^(upright(i) xi dot.op Q) thin
    upright(d) xi thin \( 1 + \| Q \|^2 \)^N \, $
  with the chosen Fourier normalization absorbed in $hat(g)$.
    The polynomial on the right has a fixed smooth power bound by the creation and annihilation estimates.
    Fourier integration therefore proves the assertion. Differentiating in any additional parameters also
    differentiates the fields and the polynomial factor. If $v \( y \) = sum_j xi_j d_j \( y \)$,
    the central commutator relation gives
  #[#set math.equation(numbering: n => "(4.10)")
   $ partial_y e^(upright(i) q \( v \( y \) \)) = e^(upright(i) q \( v \( y \) \))
     (upright(i) q \( partial_y v \) + upright(i) "Im" chevron.l v \, partial_y v chevron.r) .
     $ <eq:moving-column-weyl-derivative>]
  Repeated derivatives are the same Weyl operator times finite ordered products of derivative fields and scalar
    Gram pairings. Each field insertion has a smooth bound polynomial in $\| xi \|$,
    and every scalar pairing is quadratic in $xi$, by the weighted column-jet hypotheses.
    The Leibniz rule gives the same finite-power bounds for derivatives of $\( 1 + \| Q \|^2 \)^N$;
    its differentiated fields need not commute with the original list.
    Increasing the Fourier decay and input weight powers just chosen proves the jet assertions.
    No change of field coordinates, and hence no inverse Gram matrix, occurs. ◻
]

#thm([Lemma 4.4.])[
  (Quadratics with many orthogonal columns).  #emph[Let $R_l$ be finitely many pairwise disjoint root masks,
    with $p_l = Pr \( R_l \)$. Suppose $d_l \, e_l$ are supported on $R_l$ and are real-commuting,
    meaning that all fields $q \( d_l \) \, q \( e_l \)$ commute pairwise. Suppose also that for every $a$
$ lr(bar.v.double d_l bar.v.double)_a + lr(bar.v.double e_l bar.v.double)_a lt.eq C_a sqrt(p_l) . $

 Set
$ Q = sum_l (q \( d_l \) q \( e_l \) - chevron.l d_l \, e_l chevron.r) \, wide rho = (sum_l p_l^2)^(1 \/ 2) . $

 Then $Q = O_(upright("sm")) \( rho \)$. Its exponentials and adjoints are uniformly smooth for bounded times,
   independently of the number of columns. They converge to the identity strongly on smooth vectors as $rho
   arrow.r 0$, and in every fixed lower smooth norm on families with all higher smooth norms bounded.]
] <lem:orthogonal-quadratics>

#proof[
  Normal ordering gives a pair-creation kernel, its adjoint, and a one-particle kernel:
  $ Q = a^(*) \( sum_l d_l ⊗ e_l \) + a \( sum_l e_l ⊗ d_l \) +
    upright(d) Gamma #h(-0.16667em) (sum_l \| d_l chevron.r chevron.l e_l \| + \| e_l chevron.r chevron.l d_l \|) \, $
  where the first kernel is understood symmetrically. Orthogonality of different masks gives
  $ ∥sum_l Lambda^a d_l ⊗ Lambda^b e_l∥_(upright("HS")) + ∥sum_l \| Lambda^a d_l chevron.r chevron.l Lambda^b
    e_l \|∥_(upright("HS")) lt.eq C_(a \, b) rho . $
  The same inequalities hold with $d \, e$ interchanged. Pair creation by a Hilbert–Schmidt kernel has norm at
    most $sqrt(\( n + 1 \) \( n + 2 \))$ times its kernel norm on the $n$-particle sector;
    the corresponding estimates for annihilation and a one-particle kernel are bounded by a constant times $n +
    1$. Commuting powers of $W$ through these operators inserts powers of $Lambda$ on their kernel indices.
    This proves the asserted smooth smallness.
  For completeness, this smallness of the generator alone is not used to assert an exponential power bound.
    Every iterated commutator $"ad"_W^j \( Q \)$ is another quadratic with uniformly bounded Hilbert–Schmidt
    kernels of the displayed form. Consequently
  $ lr(bar.v.double "ad"_W^j \( Q \) zeta bar.v.double) lt.eq C_j lr(bar.v.double W zeta bar.v.double) . $
  Writing $\[ W^a \, Q \]$ with these commutators on the left yields
    $lr(bar.v.double \[ W^a \, Q \] zeta bar.v.double) lt.eq C_a
    lr(bar.v.double W^a zeta bar.v.double)$ for positive integer $a$.
    On smooth vectors, differentiation of $lr(bar.v.double W^a e^(upright(i) t Q) zeta bar.v.double)^2$ and
    Gronwall’s inequality now give a bound independent of the column count.
    At a fixed finite column count these differentiations are justified by Lemma 24;
    its constants are not used in Gronwall’s bound. Equivalently one may first truncate the weights and pass to
    the limit using these same inequalities.
  Finally, spectral calculus gives
  $ lr(bar.v.double \( e^(upright(i) t Q) - 1 \) zeta bar.v.double) lt.eq \| t \|
    lr(bar.v.double Q zeta bar.v.double) lt.eq C \| t \| rho lr(bar.v.double W^b zeta bar.v.double) . $
  The uniform higher-power bounds and interpolation prove the last assertion.
    The same conclusions hold for $U^(*) Q U$ when $U$ is unitary and both $U$ and $U^(*)$ have uniform smooth
    bounds. They are uniform for families of unitaries with common such bounds:
    indeed, $e^(upright(i) t U^(*) Q U) = U^(*) e^(upright(i) t Q) U$, and the smooth power losses compose. ◻
]

#proof[
  We prove a single replacement with arbitrary preceding root maps from the gate calculus:
    they preserve the joint parity, commute with root seed multiplication,
    and have uniform conditional smooth bounds. These hypotheses are preserved by all the gates used here.
    For the sender partition put
  $ rho = (sum_l p_l^2)^(1 \/ 2) \, wide epsilon = max_l sqrt(p_l) . $
  We will estimate the Hamiltonian correction at each root cut, prove uniform smooth bounds for its exponential,
    and then iterate the replacement. At helper roots a scalar phase remains;
    we will check that it cancels from the child signals before the next replacement.
    The partition changes only the terminal coefficients of the lower calculation:
    the formula $f$ and its finite channel list stay fixed.
  On the range of (4.9), and hence in its recursive occupation realization, we may set $X_k =
    1$ at every $k in K$. The preservation facts just established apply to the exact replacement and all its
    surrounding gates.
  ===== 4.4.1 The relative root operation. <the-relative-root-operation.>
  Fix the partition and introduce an unscaled real time $t$, keeping the preceding circuit fixed as $t$ varies.
    Write $H_D$ for the desired Hamiltonian and $tilde(H)_D$ for the complete contraction Hamiltonian.
    On a padded rooted tree $T$, retain target terms through a depth $d$ larger than the influence distance.
    On each child component $T_a$, use the same formula with zero parent input and target depth $d - 1$.
    All parameter formulas are computed on the padded tree. For either Hamiltonian $F_D$, put
  $ L_(F \, D) = F_D \( T \) - sum_a F_D \( T_a \) . $
  All terms in the two Hamiltonians and their branch baselines commute:
    they are diagonal in the same physical site axes. Factor the preceding circuit as $U_D = cal(U)_D u_D$,
    where $cal(U)_D = ⨂_a U_(a \, D)$. The new child circuits are $e^(upright(i) t F_D \( T_a \)) U_(a \, D)$.
    Factoring their product from $e^(upright(i) t F_D \( T \)) U_D$, as in (2.26), gives exactly
  $ u_(F \, D) \( t \) = cal(U)_D^(*) e^(upright(i) t L_(F \, D)) cal(U)_D u_D . $
  Consequently the relative root maps satisfy
  #[#set math.equation(numbering: n => "(4.11)")
   $ cal(T)_(cal(P) \, D) \( t \) := u_(H \, D) \( t \)^(*) u_(tilde(H) \, D) \( t \) =
     U_D^(*) e^(upright(i) t \( L_(tilde(H) \, D) - L_(H \, D) \)) U_D . $ <eq:helper-relative-root-group>]
  This is a unitary group in $t$, whose exponent is a root cut difference.
    The zero-input branch Hamiltonians have been subtracted; no limit of the extensive Hamiltonian difference is
    being asserted. The identity holds on the compressed space as well.
  At this fixed partition, Theorem 14 applies to both complete operations with $t$ as an external parameter.
    The complete contraction is the gate at the $K$ pivot, with coefficient $p_K^(- 1) sum_l B_(k \, l)
    F_(k \, l)$. Their local matrices have polynomial bounds for all mixed time and input derivatives,
    locally uniformly in $t$. The root maps, their adjoints, and their time derivatives therefore have smooth
    degree limits. Passing to the limit in (4.11) gives a unitary group $cal(T)_(cal(P)) \( t \)$:
    its group law and inverses follow from the finite-degree identities,
    and time-derivative convergence gives strong continuity. Its self-adjoint generator $A_(cal(P))$ is defined by
    this group. Differentiation at zero shows that every smooth vector is in its domain and that,
    under the occupation identifications,
  #[#set math.equation(numbering: n => "(4.12)")
   $ A_(cal(P)) zeta = lim_(D arrow.r oo) U_D^(*) \( L_(tilde(H) \, D) - L_(H \, D) \) U_D zeta .
     $ <eq:helper-total-generator-action>]
  We now compute this derivative by separating diagonal paths, simple paths, and lower-formula responses.
    This is an algebraic decomposition of the finite-degree cut difference,
    not an application of the gate calculus to each separated Hamiltonian.
    All contributions to (4.12) use the preceding full frame.
    Thus top-path expressions first computed in the child frame receive one final conjugation by $u$;
    the lower-response formulas already display it. The smooth bounds are preserved by this conjugation.
    The diagonal average and its helper-root scalar are included before any phase is removed.
  ===== 4.4.2 The diagonal paths. <the-diagonal-paths.>
  The terms $j = j'$ in (4.8) equal
  #[#set math.equation(numbering: n => "(4.13)")
   $ sum_(i in I \, j in J) A_(i j) P_i f_j frac(\# { k tilde.op j : k in K }, D p_K) . $ <eq:diagonal-helper-paths>]
  Away from the incidence lost at a $K$-root cut, the last factor tends to one,
    with all smooth bounds required in the gate calculus: it is a normalized average of bounded local seed masks.
    This remains true after conjugation by preceding maps with uniform smooth bounds.
    One can see the rate on the symmetric embedding by decomposing that average into its vacuum scalar,
    vacuum row and column, and occupied block. The centered row and column are $O \( D^(- 1 \/ 2) \)$,
    and the occupied block is $O \( D^(- 1) \)$ with a loss of one number power.
  If the removed root lies in $K$, the lost incidence contributes $\( D p_K \)^(- 1) sum_(j tilde.op o)
    upright(bold(1))_J \( j \) b_j f_j$. The average has a scalar vacuum limit.
    Thus it contributes only a phase conditional on the root’s membership in $K$.
    Below we also recover this scalar as the same-neighbor contraction of the full $K$-root expression.
    No estimate discards an uncentered normalized sum.
  ===== 4.4.3 The nonbacktracking paths at top masks. <the-nonbacktracking-paths-at-top-masks.>
  Remove the terms $j = j'$. A remaining path $i \, j \, k \, j'$ is simple on a tree.
    At a terminal $j' in J_l$, looking away from its parent, its extra coefficient is
  #[#set math.equation(numbering: n => "(4.14)")
   $ R_(j' \, l) = 1 / p_K sum_(k tilde.op j' \, thin k in K) A_(j' k)
     sum_(j tilde.op k \, thin j in J_l \, thin j eq.not j') A_(k j) X_j b_j . $ <eq:extra-terminal-coefficient>]
  Here all inner fields are computed in descendant trees. Let $d_l$ be the child vacuum column of
    $upright(bold(1))_(J_l) X b$, in its preceding Heisenberg frame.
    It is centered, since it is odd, and (4.4) gives $lr(bar.v.double d_l bar.v.double)_a lt.eq C_a sqrt(p_l)$.
    The first normalized lift is $q \( d_l \)$. Masking its next root on $K$, conjugating by the preceding map,
    and lifting again gives
  #[#set math.equation(numbering: n => "(4.15)")
   $ R_(j' \, l) = O_(upright("sm")) \( sqrt(p_l) \) quad upright("conditionally at ") j' in J_l .
     $ <eq:terminal-smallness>]
  The constants include $p_K^(- 1)$, which is fixed. The reversed coefficient, with $f$ in place of $b$,
    has the same bound. This reasoning uses centered lifts at both steps;
    the parity of the transmitted fields supplies their centering.
  At a root in $I$, the final incoming column is the combination over $J_l$ of the small coefficients just
    estimated. Its squared weighted norm is bounded by $C sum_l p_l^2$,
    since conditioning on $J_l$ contributes one factor $p_l$ and (4.15) contributes another.
    The extra root Hamiltonian is its normalized lift times the root axis $P$, and is $O_(upright("sm")) \( rho \)$.
  At a root in $J_l$, the two possible occurrences of that root, as $j$ or $j'$,
    give a bounded smooth factor $f$ or the field $b$ times one of the small coefficients in (4.15).
    The two factors use distinct first-step masks. Thus there is no further same-neighbor term to subtract.
    The root correction is $O_(upright("sm")) \( sqrt(p_l) \)$,
    uniformly conditionally on the root seed in this part. It is a smooth function of a fixed number of commuting
    fields with uniformly bounded weighted columns.
  At a root in $K$, let $d_l \, e_l$ be the incoming child columns of $upright(bold(1))_(J_l) X
    b$ and $upright(bold(1))_(J_l) X f$. All their fields commute.
    The root contribution of the full top-path sum is $p_K^(- 1) sum_l q \( d_l \) q \( e_l \)$.
    The terms using the same neighbor are the limit of the average
  $ frac(1, D p_K) sum_(j tilde.op o) upright(bold(1))_J \( j \) b_j f_j arrow.r kappa = 1 /
    p_K sum_l chevron.l d_l \, e_l chevron.r . $
  In particular, this is an average on one branch, not the product of two independent lifts.
    After subtracting it, the correction is
  #[#set math.equation(numbering: n => "(4.16)")
   $ Q_K = 1 / p_K sum_l (q \( d_l \) q \( e_l \) - chevron.l d_l \, e_l chevron.r) . $ <eq:helper-root-quadratic>]
  The weighted columns belonging to different parts are orthogonal.
    Lemma 25 gives $Q_K = O_(upright("sm")) \( rho \)$ and uniform exponential bounds independent of the number of
    parts. The scalar $kappa$ is the harmless local phase identified from the diagonal paths.
  This list accounts for all top-path cuts. If the root belongs to $I \, J \, K$,
    a top path not containing it cannot change after the cut: the dependencies of $f$ exclude all three masks.
    At a $J$ root, its own $f$ uses only descendants. A root outside both the top masks and the lower calculation
    has no correction. It remains to check cuts inside the lower computation of $f$.
  ===== 4.4.4 Responses through the lower formula. <responses-through-the-lower-formula.>
  We have accounted for cuts through the four-vertex helper paths.
    A cut can also change the value of $f$ at their terminal vertices.
    The following recursion keeps those changes, including mixed responses between channels, in the estimate.
  First work in the physical frame. Write $H_(upright("off")) \( T \) =
    sum_(l \, j' in J_l) omega_(j' \, l) f_(j')^T$, where $omega_(j' \, l) =
    X_(j') R_(j' \, l)$ initially denotes its full top-path coefficient.
    If a cut root $v$ has a lower mask, it cannot lie on any of the top paths.
    Each coefficient is consequently unchanged and lies wholly in one cut component.
    For the child components $T_a$, the exact finite-tree identity is
  #[#set math.equation(numbering: n => "(4.17)")
   $ H_(upright("off")) \( T \) - sum_a H_(upright("off")) \( T_a \) =
     sum_(a \, l \, j' in T_a ∩ J_l) omega_(j' \, l) #scale(x: 120%, y: 120%)[\(] f_(j')^T -
     f_(j')^(T_a) #scale(x: 120%, y: 120%)[\)] . $ <eq:physical-lower-cut-identity>]
  Only terminals within the fixed influence radius contribute.
    At an active terminal $j' in J_l$, a boundary input into its lower computation therefore changes the Hamiltonian by
  #[#set math.equation(numbering: n => "(4.18)")
   $ X_(j') R_(j' \, l) #scale(x: 120%, y: 120%)[\(] f_(j') \( y \) -
     f_(j') \( 0 \) #scale(x: 120%, y: 120%)[\)] . $ <eq:terminal-response>]
  Whenever this difference is active, its parent lies in a lower mask, outside $I \, J \, K$.
    Consequently every first step of $R_(j' \, l)$ goes into a descendant branch.
    That coefficient has no boundary response of its own on this active path.
    If the parent is in a top mask, the boundary input into $f$ is absent, and (4.18) is zero.
    This observation ensures that using the downward expression (4.14) loses no term.
  Here is the precise difference recursion. At a root $v$ of the lower calculation let $m \( y \)$ be its fixed
    finite list of outgoing channel values. Let $cal(H)_v^(\[ d \]) \( y \)$ be the sum of the weighted terminal
    terms with terminal distance at most $d$, evaluated with boundary input $y$,
    and put $Delta_v^(\[ d \]) \( y \) = cal(H)_v^(\[ d \]) \( y \) - cal(H)_v^(\[ d \]) \( 0 \)$.
    The coefficients are computed downward, as just justified;
    the terminal formulas themselves use all required sites. In the physical frame the recursion is a local term
    (4.18), when the root is terminal, plus
  #[#set math.equation(numbering: n => "(4.19)")
   $ sum_(a upright(" child"))
     [Delta_a^(\[ d - 1 \]) \( D^(- 1 \/ 2) m \( y \) \) - Delta_a^(\[ d - 1 \]) \( D^(- 1 \/ 2) m \( 0 \) \)] .
     $ <eq:additive-response-recursion>]
  Only channels of the fixed $f$-calculation are included. At the actual output root,
    where there is no parent input, the root Hamiltonian correction is obtained from the local term and the child
    sum evaluated at $D^(- 1 \/ 2) m \( 0 \)$, without this subtraction.
    The definition counts distance to the terminal vertex; the top coefficient beyond that vertex has already been
    computed downward. Taking $d$ beyond the finite influence range gives exactly the Hamiltonian difference
    across the cut. Indeed the identical recursion with $cal(H)_a$ first holds by partitioning terminals among
    children, and replacing $cal(H)_a \( z \) = Delta_a \( z \) + cal(H)_a \( 0 \)$ cancels the constant terms.
    This also explains the argument $m \( 0 \)$ in the second summand.
  Now factor the preceding circuit as $U_v = \( ⨂_a U_a \) u_v$.
    These preceding maps are fixed in the boundary variable of the new Hamiltonian.
    Simultaneous conjugation of the physical identity gives
  #[#set math.equation(numbering: n => "(4.20)")
   $ hat(Delta)_v \( y \) =
     u_v^(*)
     [T_v \( y \) + sum_a {hat(Delta)_a \( D^(- 1 \/ 2) m \( y \) \) - hat(Delta)_a \( D^(- 1 \/ 2) m \( 0 \) \)}]
     u_v \, $ <eq:conjugated-lower-cut-identity>]
  where $hat(Delta)_a = U_a^(*) Delta_a U_a$, and $T_v \( y \)$ is the local terminal term (4.18),
    zero at a nonterminal root. The direct term and messages are interpreted in the same child frames.
    There is no derivative of $U_a$ or $u_v$. Although a preceding Heisenberg image of the top coefficient may
    appear to have larger support, its boundary independence follows from the physical identity before this fixed
    conjugation. Repeated lower masks in different expression branches cause no additional terms:
    these are identities for the whole nonlinear function of all incoming channels,
    so their mixed responses are retained.
  The required parity covariance is explicit: if $Pi$ is the joint parity, then $Pi omega Pi = -
    omega$ and $Pi f \( y \) Pi = - f \( - y \)$. Thus $Pi { omega \[ f \( y \) - f \( 0 \) \] } Pi =
    omega \[ f \( - y \) - f \( 0 \) \]$, and the recursion preserves this covariance.
    We pass the algebraic recursion (4.19) to the limit by the centered normalized-sum calculation used in the
    proof of Corollary 15. At a fixed partition, the terminal coefficients and their jets are finite products and
    smooth compositions of centered odd normalized sums, together with the separately estimated bounded-mask
    averages normalized by $D^(- 1)$. The normalized-sum bounds and the conditional bounds for preceding maps give
    uniform degree bounds in every required higher smooth norm; these constants may depend on the fixed partition.
    They propagate through the fixed-depth difference recursion.
    Taylor expansion in the boundary inputs therefore retains the centered first response and the scalar second
    response, while its third-order remainder carries $D dot.op D^(- 3 \/ 2)$.
    Commuting substitution handles the outgoing message arguments.
    These are termwise limits in the derivative of the complete relative family,
    not a unitary calculus for the separated Hamiltonians. If $D_alpha \,
    D_(alpha beta)$ are the first two input derivatives of a child response at zero, set
  $ r_alpha = D_alpha bold(Omega) \, wide c_(alpha beta) = chevron.l bold(Omega) \| D_(alpha beta) \| bold(Omega)
    chevron.r . $
  Its contribution is
  #[#set math.equation(numbering: n => "(4.21)")
   $ & sum_alpha #scale(x: 120%, y: 120%)[\(] m_alpha \( y \) -
     m_alpha \( 0 \) #scale(x: 120%, y: 120%)[\)] q \( r_alpha \)\
 & quad + 1 / 2 sum_(alpha \, beta) #scale(x: 120%, y: 120%)[\(] m_alpha \( y \) m_beta \( y \) -
   m_alpha \( 0 \) m_beta \( 0 \) #scale(x: 120%, y: 120%)[\)] c_(alpha beta) \, $ <eq:limiting-additive-response>]
  followed by the preceding root conjugation. At a nonterminal lower root with no parent input,
    the Hamiltonian correction instead uses the unsubtracted child contribution
  $ u_v^(*)
    [sum_alpha m_alpha \( 0 \) q \( r_alpha \) + 1 / 2 sum_(alpha \, beta) m_alpha \( 0 \) m_beta \( 0 \) c_(alpha
    beta)] u_v . $
  This is the root correction specified after (4.19), rather than the value at $y = 0$ of the boundary difference,
    which is zero. Both expressions use the same response columns and scalar second responses.
    First derivatives are odd and hence centered. The same calculation applies to every fixed input jet.
    The partition estimates below are made after this degree limit.
  At depth zero, (4.15) and the derivative bounds of $f$ make every fixed response jet
    $O_(upright("sm")) \( epsilon \)$, conditionally in the local seed.
    More explicitly, the sum of terminal jets over $l$ is a direct integral on the disjoint events $J_l$,
    so its conditional bound is the maximum of their $C sqrt(p_l)$ bounds, not their sum.
    Suppose the induction holds at depth $d - 1$. All weighted norms of $r_alpha$ and all $\|
    c_(alpha beta) \|$ are then bounded by $C epsilon$. The functions $m$ and their derivatives have fixed
    polynomial bounds. Multiplication, differentiation, and the preceding root conjugation in (4.21) therefore
    give the same smallness at depth $d$, with a possible finite loss of powers.
    This induction has fixed finite depth and a fixed number of channels,
    both independent of the number of parts $J_l$. It requires no independence between different lower channels.
    In particular it applies when two expression branches reuse some lower masks.
    At a nonterminal lower root, if there are $k$ outgoing channels and $s$ ordinary Gaussian inputs used to
    compute $m$, the root correction uses at most $s + k$ field directions.
    Each $r_alpha$ is a single child vector containing the whole lower calculation;
    its Hilbert-space support need not be finite dimensional. The scalar second responses contribute no new directions.
  The diagonal degree-factor errors have the same response recursion with terminal coefficient
  $ b_(j') (frac(\# { k tilde.op j' : k in K }, D p_K) - 1) $
  in place of $X_(j') R_(j' \, l)$. On an active lower response path the parent is not in $K$ or $I$,
    so this is again a downward coefficient. Its limiting smooth bounds vanish by the average estimate already
    proved. Thus all its lower responses vanish as well.
  ===== 4.4.5 Uniform topology and iteration. <uniform-topology-and-iteration.>
  After the degree limit, the diagonal degree-factor errors vanish.
    The preceding computations identify the total action in (4.12).
    At a helper root its scalar part is $sigma_(cal(P)) \( s \) = kappa upright(bold(1))_K \( s \)$, with
  $ \| kappa \| lt.eq p_K^(- 1) sum_l parallel d_l parallel thin parallel e_l parallel lt.eq C p_J \/ p_K . $
  This bounded root-seed multiplication commutes with every root map. Hence
  $ cal(S)_(cal(P)) \( t \) = e^(- upright(i) t sigma_(cal(P))) cal(T)_(cal(P)) \( t \) $
  is a strongly continuous unitary group. Its self-adjoint generator $R_(cal(P))$ acts on smooth vectors by the
    total remaining correction. The four cut cases, in the common preceding frame, give
  $ upright("cut-root mask") & upright("remaining correction")\
I & O_(upright("sm")) \( rho \) quad upright("(combined column)")\
J_l & O_(upright("sm")) \( sqrt(p_l) \) quad upright("(conditional on ") J_l upright(")")\
K & u^(*) Q_K u = O_(upright("sm")) \( rho \) quad upright("(after its scalar phase)")\
upright("lower mask") & O_(upright("sm")) \( epsilon \) quad upright("(fixed lower channels)") $
  Since the parts partition the fixed sender mask,
  $ rho^2 = sum_l p_l^2 lt.eq p_J max_l p_l \, wide epsilon^2 = max_l p_l . $
  Both quantities tend to zero under the refinement hypothesis, with $f$ and $p_K > 0$ fixed.
  To obtain uniform smooth bounds for this actual group, consider the full field expression for the remaining
    correction at each root. At an $I$-root it uses a bounded number of combined columns.
    At a $J_l$-root include the fields for both possible sender occurrences.
    At a lower root use all ordinary channel fields and response columns in the unsubtracted root formula.
    These current-generator fields commute: before preceding conjugation they belong to the same physical seed and
    fixed-axis algebra. Thus the total expression is a smooth function of a fixed number of commuting fields and,
    when present, the fixed root axis, with the uniform polynomial derivative bounds already proved.
    At a $K$-root it is the complete centered quadratic $Q_K$.
    Define $V_(cal(P)) \( t \)$ by the joint spectral calculus of these expressions,
    as a direct integral over the root seed, with the final conjugation by $u$ wherever it is not already
    displayed. Lemma 24 gives its uniform conditional smooth bounds in the fixed-field cases;
    Lemma 25 gives the count-uniform bound at $K$. These bounds concern the total expression at each root.
  We verify that $V_(cal(P))$ is the actual relative group $cal(S)_(cal(P))$.
    At fixed partition the field-calculus group preserves the smooth domain and has smooth time derivatives there,
    with $partial_t V_(cal(P)) \( t \) zeta = upright(i) R_(cal(P)) V_(cal(P)) \( t \)
    zeta$ by the action identified in (4.12). For a smooth vector $zeta$, therefore,
    $V_(cal(P)) \( s \) zeta$ remains in the domain of $R_(cal(P))$,
    and its image under that generator varies continuously by the smooth bounds. Differentiating gives
  $ frac(d, d s) [cal(S)_(cal(P)) \( t - s \) V_(cal(P)) \( s \) zeta] = 0 . $
  Evaluation at $s = 0 \, t$ proves $cal(S)_(cal(P)) \( t \) zeta = V_(cal(P)) \( t \) zeta$,
    and density extends the identity to the Hilbert space. Thus the uniform smooth bounds just proved apply to the
    relative root group itself; no separate closure of the formal sum of corrections is chosen.
  Spectral calculus for its generator now yields
  $ parallel \[ cal(S)_(cal(P)) \( t \) - 1 \] zeta parallel lt.eq \| t \| parallel R_(cal(P)) zeta parallel
    arrow.r 0 . $
  Uniform higher smooth bounds upgrade this to convergence in every fixed lower graph norm;
    the same holds for adjoints. The relative factor multiplies the desired root map on the right, so
  $ u_(tilde(H) \, cal(P)) \( t \) = u_H \( t \) cal(T)_(cal(P)) \( t \) =
    e^(upright(i) t sigma_(cal(P))) u_H \( t \) cal(S)_(cal(P)) \( t \) . $
  This proves convergence of the actual root maps up to their root-seed phase,
    with uniform conditional smooth bounds. The same argument applies on cut subtrees,
    and the fixed lower response jets retain the estimates proved above.
  A root-seed phase cancels in each descendant Heisenberg conjugation before its vacuum column is lifted;
    helper-labeled descendant spaces need not be removed. Starting from the fixed initial preceding maps,
    apply this single-replacement argument successively through the fixed finite sequence.
    The continuity part of Theorem 14 applies at each step with the conditional smooth bounds just established.
    It gives insertion convergence off $K$ and proves the simultaneous contraction statement. ◻
]

=== 4.5 Pointwise functions and the order of compilation <pointwise-functions-and-the-order-of-compilation>

Proposition 23 implements an aggregation whenever its lower formula is still available as an ideal call.
  To remove all ideal calls without losing unused helper spins,
  we combine it with pointwise synthesis and process the formula from its outermost aggregations inward.

Propagation and elementary local controls generate the required pointwise nonlinearities.
  Suppose rotations by odd fields $h_1 \, dots.h \, h_k$ are available on the same target mask.
  Same-axis rotations give their real linear combinations. A constant local $X$ rotation interchanges the two odd
  axes. For an even local coefficient $a \( s \)$, conjugating $a \( s \) X$ by a rotation with odd angle $h$,
  and taking the difference at opposite angles, gives $a \( s \) sin \( 2 h \) Y$, up to a sign convention.
  For an odd local coefficient $c \( s \)$, conjugating $c \( s \)
  Y$ by the same $Z$ rotation and taking the sum gives $c \( s \) cos \( 2 h \) Y$.
  Thus every finite trigonometric expression

#[#set math.equation(numbering: n => "(4.22)")
 $ sum_nu a_nu \( s \) sin \( xi_nu dot.op h \) + c_nu \( s \) cos \( xi_nu dot.op h \) \, wide
   a_nu upright(" even") \, quad c_nu upright(" odd") \, $ <eq:parity-trigonometric-synthesis>]

can be implemented as an odd-axis Hamiltonian by pointwise matrix sums.
  This covers joint parity in the local seed and aggregate arguments;
  it does not require multiplying arbitrary even fields.

The same construction applies to bounded smooth odd functions of a finite list of odd aggregate inputs.
  To see the required closure precisely, cut off on larger symmetric boxes, periodically extend,
  and approximate the smooth extension by its Fourier polynomials.
  The cutoff can be chosen even, and parity projection gives exactly the coefficient parities in (4.22).
  Uniform bounds for derivatives in the aggregate variables are preserved on each fixed compact set.
  Choose successive Fourier truncations accurate for increasing derivative orders.
  The cutoffs and periodic extensions can be chosen with polynomial derivative bounds independent of the box:
  inside the box these follow from the original bounds, and outside its fundamental cell the absolute value of the
  reduced coordinate is no larger than that of the original coordinate.
  Fourier errors in the finitely many required derivative norms may be made at most one.
  A diagonal choice gives the polynomial domination and local all-jet convergence used by Theorem 14.
  Alternatively, if only the terminal insertion is needed, first truncate the finitely many input laws and use
  their smooth moment bounds. Local seed coefficients remain bounded measurable functions throughout.

We finish by specifying the nesting of all limits. This is also where helper pinning is used. Define expression rank by

$ "rank" \( g \( s \) \) = 0 \, wide "rank" \( F \( h_1 \, dots.h \, h_k \) \) = max_j "rank" \( h_j \) \, wide
  "rank" \( A_(R S) f \) = 1 + "rank" \( f \) . $

Local masking does not change rank. Reserve a distinct helper $K_r$ for each positive rank.
  Every original formula avoids every helper. Before processing rank $r$,
  all unresolved calls are classical formulas with this property;
  every already produced elementary gate acts only on original masks and previously used helpers $K_q$, $q > r$.
  Thus the current surrounding word has no target, spin control, or nonzero emitted seed channel on $K_r$.
  Its spins are exactly pinned, even if rotations on original output masks have already occurred.
  The estimates above allow arbitrary preceding states in the gate-calculus class on those original masks.

+ At the largest remaining rank, replace each pointwise nonlinearity by the pointwise synthesis just described.
  Take these limits successively in the fixed surrounding circuit.
  After fixing their finite products to any desired accuracy,
  the remaining calls at rank $r$ are rotations by explicit propagated odd inputs $A_(I J) f$,
  where $"rank" \( f \) lt.eq r - 1$.
+ Apply Proposition 23 to all those propagations simultaneously, using the reserved helper $K_r$.
  It is unused by every other exact gate at this stage and is therefore pinned.
  Choose finite sender subdivisions sufficiently fine for the desired accuracy.
  Sender subdivisions change only the local calling mask; they do not refine the lower formulas or their channel lists.
+ With that subdivision fixed, implement all the commutators and sums defining (4.8) by finite pointwise products.
  Their convergence holds on the full space, so these finite products may temporarily rotate the helper away from
  $X = 1$. Pinning was used in the preceding contraction limit, not during this inner approximation.
+ The resulting finite word contains only lower-rank formula calls and elementary masked gates.
  Repeat the same procedure at the next rank, using its new helper.
  The previously produced finite word may act on higher helpers, but it avoids this new one exactly.
  Thus the pinning hypothesis holds anew. Source formulas retain all ancestor exclusions,
  including those introduced by their particular calling masks.
  A sender subdivision only restricts the local calling mask:
  exclusion of the original sender mask implies exclusion of each submask.
  The commutators create further occurrences of the same lower formula,
  without adding a cross-edge dependency or introducing a control on any still-unused helper.

This induction terminates because the formula rank is finite.
  At each stage there are only finitely many occurrences in the already fixed surrounding word.
  Accuracies can therefore be chosen successively from the outside inward.
  No uniform estimate in the number of commutator factors, the number of formula occurrences created by an earlier
  stage, or inverse helper density is asserted or needed. The only uniformity in a growing sender subdivision is
  the one explicitly proved in Proposition 23.

At termination, replace the elementary masked gates by their finite seeded-circuit approximations from
  Section 4.2. All mask-controlled operations are compiled at this final stage.
  Theorem 14 permits the successive replacements inside the fixed finite remaining word,
  including the raw Gaussian seed control with its moment weight.
  Exact helper pinning is no longer required after the contraction limits have been fixed.
  This constructs a finite seeded word with arbitrarily small insertion error off the helpers.

#proof[
  The finite nested construction proves (4.2). To identify the target value, the ideal seed-only rotations give
  $ v_(upright("cl")) = m \| + chevron.r + cos \( 2 theta \) \| - chevron.r \, $
  where both coefficients are classical functions of seeds;
    all descendant spins remain in their pointed spin vectors.
    In $chevron.l v_(upright("cl")) \, sans(L) v_(upright("cl")) chevron.r$,
    the second summand on the left is orthogonal to the range of $sans(L)$.
    Its shifted version on the right has a child spin excitation and is orthogonal to the first,
    purely classical summand on the left. Consequently $cal(E) \( v_(upright("cl")) \) = cal(E) \( m \)$.
    The same identity holds after omitting helper insertions, because $m = 0$ there.
  For any circuit preserving root seed labels, $lr(bar.v.double upright(bold(1))_H v bar.v.double) = sqrt(p_H)$:
    the mask commutes with the circuit and with $Z$, and $Z$ is unitary.
    Since $sans(L)$ is an isometry, Proposition 4 gives
  $ \| cal(E) \( v \) - cal(E) \( upright(bold(1))_(H^c) v \) \| lt.eq 2 sqrt(p_H) . $
  Both projected insertion vectors have norm at most one, so (4.2) changes their energy by at most $2 eta$.
    This proves (4.3). All approximation limits above compare already-defined fixed-word tree values.
    After choosing finite approximants, the resulting seeded word and all its parameters are independent of the
    degree, system size, and disorder. ◻
]

== 5 Removing the longitudinal seed controls <sec:seed-simulation>

Theorem 22 produces a finite word that uses a Gaussian longitudinal field in addition to the cost and mixer.
  We now remove that extra control while preserving its limiting tree energy. This is the last compilation step:
  the fixed-word transfer then applies to the resulting ordinary QAOA word.

A #emph[seeded word] is a finite word in the cost, the mixer, and $exp \( - upright(i) sigma sum_i Z_i s_i \)$,
  where the $s_i$ are independent standard real Gaussians. The same Gaussian family is used at every seed gate.
  The Gaussian variables are averaged in evaluating the word; equivalently,
  they are multiplication operators on independent pointed Gaussian spaces.
  All the angles, including $sigma$, are deterministic. We fix this entire seeded word before choosing any of its
  approximants. Its limiting tree energy is $cal(E) \( v_Z \)$, where $v_Z$ is its root insertion vector.
  The seeded root update in Lemma 11 gives this vector and the uniform occupation bound,
  so Proposition 4 identifies its edge-energy limit with $cal(E) \( v_Z \)$.
  This uses the seeded tree calculus, not an extension of the ordinary-word SK transfer.

#thm([Theorem 5.1.])[
  (Removal of seed controls).  #emph[For every finite seeded word and every $epsilon.alt > 0$,
    there is a finite ordinary cost–mixer word whose limiting tree energy differs from that of the seeded word by
    less than $epsilon.alt$. Its angles are independent of the degree, the system size, and the disorder.
    In particular, the approximation uses the thermodynamic limit at a fixed word.]
] <thm:seed-simulation>

The proof uses two parameters, chosen in order. We first choose a small fixed $b > 0$.
  With $b$ fixed, $r arrow.b 0$ creates a component of amplitude $r$ with a Weyl displacement of order $r^(- 1)$.
  Short cost pulses can selectively rotate this displaced component while their first-order action cancels on the
  component of order-one amplitude. A cost echo of duration $r^(- 1)$ converts the change of the small component
  into a finite longitudinal field. All approximation statements below are statements in the already established
  fixed-word tree limit.

We first establish estimates for displaced Fock vectors and prepare an exact two-component state.
  Finite selective spin rotations then let us propagate its small displaced component through the requested word.
  The echo calculation produces the seed field; a separate root-shift calculation identifies its energy.
  Finally, a finite generic perturbation supplies all the nonzero projections required to choose the selective
  rotations.

=== 5.1 Uniform estimates for packets <uniform-estimates-for-packets>

The large displacements will not have bounded occupation moments.
  We therefore keep each displacement separate from a tail vector whose moments are controlled.
  Write $N$ for the number operator in the #emph[top] child Fock space and put

$ cal(S) = ⋂_(k gt.eq 0) "Dom" \( 1 + N \)^k \, wide lr(bar.v.double eta bar.v.double)_k =
  lr(bar.v.double \( 1 + N \)^k eta bar.v.double) . $

The spin factor is included in this notation. No weight is imposed inside a child-mode direction.
  A bounded family of inputs means a family $eta_r in cal(S)$ such that $sup_r
  lr(bar.v.double eta_r bar.v.double)_k < oo$ for every $k$.
  Uniform errors below are uniform on every such family. More explicitly,
  every estimate used below depends on finitely many of these seminorms;
  its constants may depend on the fixed finite pulse list and on $b$, but not on $r$ or on the input.

Let

$ W \( d \) = e^(upright(i) q \( d \)) \, wide W_P \( d \) = e^(upright(i) P q \( d \)) \, wide P^2 =
  upright(bold(1)) \, $

where $P$ is a root Pauli matrix. The Weyl identities are

#[#set math.equation(numbering: n => "(5.1)")
 $ W \( d \) W \( e \) = e^(- upright(i) "Im" chevron.l \, chevron.r d e) W \( d + e \) \, wide
   W \( d \/ r \)^(*) q \( v \) W \( d \/ r \) = q \( v \) - 2 / r "Im" chevron.l \, chevron.r v d . $ <eq:seed-weyl>]

A packet with scaled center $d_r$ is $W \( d_r \/ r \) eta_r$, with $eta_r$ a bounded family.
  A finite sum of packets is allowed, as are bounded root spin matrices in their tails.
  Scalar phases of modulus one may depend on $r$ and need not converge.

#thm([Lemma 5.2.])[
  (Packet estimates).  #emph[The following estimates are uniform for bounded families of tails.]
  + #emph[Displacements with bounded directions preserve all the seminorms
    $lr(bar.v.double dot.op bar.v.double)_k$, with bounds depending only on the direction norm and $k$.
    For $lr(bar.v.double  bar.v.double) d lt.eq C$,
$ W \( r d \) eta = eta + upright(i) r q \( d \) eta + O \( r^2 \) lr(bar.v.double eta bar.v.double)_1 quad
  upright("in norm") . $

 If $d_r - e_r arrow.r 0$ in norm and both directions are bounded,
   then $\( W \( d_r \) - W \( e_r \) \) eta_r arrow.r 0$ in norm. These assertions also hold for $W_P$.]
  + #emph[If $lr(bar.v.double d_r - e_r bar.v.double) gt.eq kappa > 0$, then for every integer $M$,
#[#set math.equation(numbering: n => "(5.2)")
 $ \| chevron.l W \( d_r \/ r \) eta_r \, W \( e_r \/ r \) xi_r chevron.r \| =
   O \( r^M \) . $ <eq:seed-packet-separation>]

 The conclusion is unchanged by inserting a bounded root spin matrix.]
  + #emph[For bounded $d_r \, v_r$ and fixed $tau$, conjugating the short probe
    $e^(- upright(i) r tau P q \( v_r \))$ through a packet gives
#[#set math.equation(numbering: n => "(5.3)")
 $ W \( d_r \/ r \)^(*) e^(- upright(i) r tau P q \( v_r \)) W \( d_r \/ r \) =
   e^(- upright(i) tau a_r P) e^(- upright(i) r tau P q \( v_r \)) \, wide a_r = - 2 "Im" chevron.l v_r \,
   d_r chevron.r . $ <eq:seed-packet-probe>]

 Consequently a fixed finite list of short probes preserves its scaled centers and bounded centered-tail moments,
   without any smallness assumption on $a_r$.]
] <lem:seed-packet-estimates>

#proof[
  The first assertion follows from the creation–annihilation estimates in Lemma 7,
    or by differentiating a Weyl displacement on $cal(S)$. In the Taylor remainder one uses
    $lr(bar.v.double q \( d \)^2 eta bar.v.double) lt.eq C lr(bar.v.double  bar.v.double) d^2
    lr(bar.v.double eta bar.v.double)_1$. The Weyl product identity then gives the assertion for two nearby
    directions. Resolving $P$ into its two spectral projections proves the spin-controlled statements.
  For the second assertion, the Weyl product reduces the question to a matrix coefficient of $W \( f_r \/ r \)$,
    where $lr(bar.v.double f_r bar.v.double) gt.eq kappa$. Choose the unit quadrature $Q_r =
    q \( upright(i) f_r \/ lr(bar.v.double f_r bar.v.double) \)$.
    Equation (5.1) translates $Q_r$ by $2 lr(bar.v.double f_r bar.v.double) \/ r$.
    Split each vector using the spectral projection of $Q_r$ onto
    $\[ - lr(bar.v.double f_r bar.v.double) \/ \( 2 r \) \, lr(bar.v.double f_r bar.v.double) \/ \( 2 r \) \]$.
    The two translated central intervals are disjoint. The complementary pieces have norm bounded by $C_M r^M
    lr(bar.v.double eta bar.v.double)_(k_M)$, by the spectral theorem and the uniform estimate
    $lr(bar.v.double Q_r^M eta bar.v.double) lt.eq C_M lr(bar.v.double eta bar.v.double)_(k_M)$.
    This proves (5.2). Root spin matrices commute with these projections.
    Finally, (5.3) is exactly the second Weyl identity; its right-hand side is a spin rotation followed by a
    displacement of size $O \( r \)$. Both preserve the required tail bounds.
    Notice that this last argument precedes, and does not use,
    any claim that the probe acts almost trivially on an ordinary packet. ◻
]

We use exact local unitaries and exact insertion directions throughout.
  At a given stage, if the local unitary is $u_r$, put

$ v_(P \, r) = u_r^(*) P u_r bold(Omega) . $

All the $v_(P \, r)$ have norm one. A toggled cost probe about an axis $P$ in the $Z
  Y$-plane is $e^(- upright(i) r tau P q \( v_(P \, r) \))$. It is an ordinary word:
  conjugate a cost pulse by two opposite mixer pulses. The direction is the insertion at the start of that probe;
  it is constant during the probe itself.

=== 5.2 Initialization and the exact two-component decomposition <initialization-and-the-exact-two-component-decomposition>

We next prepare the two components that the selective probes will distinguish.
  Their decomposition is exact, even though they need not be orthogonal.
  This exactness will keep the special component’s amplitude equal to $r$ through all later unitary updates.

Fix once and for all $beta_star.op = pi \/ 4$, and put $R_star.op = e^(- upright(i) beta_star.op X)$.
  This choice makes the two eventual external Gaussian directions orthogonal. For $0 < r < 1$, set

$ delta_r = arcsin r \, wide gamma_r = b \/ r \, wide e = Z bold(Omega) \, wide ell_r =
  Y e^(- 2 upright(i) gamma_r Z q \( e \)) bold(Omega) . $

Apply, in order, cost $gamma_r$, mixer $delta_r$, cost $- gamma_r$, and mixer $beta_star.op$.
  Immediately before the negative cost the insertion is

$ v_(2 \, r) = cos \( 2 delta_r \) e + sin \( 2 delta_r \) ell_r . $

Define $d_(0 \, r) = gamma_r \( v_(2 \, r) - e \)$. The resulting local unitary has the #emph[exact] decomposition

#[#set math.equation(numbering: n => "(5.4)")
 $ u_r = a_(0 \, r) U_(O \, r) + a_(1 \, r) U_(S \, r) \, wide U_(O \, r) = R_star.op W_Z \( d_(0 \, r) \) \, wide
   U_(S \, r) = R_star.op X W_Z \( - 2 gamma_r e - d_(0 \, r) \) \, $ <eq:seed-initial-split>]

where

$ a_(0 \, r) = cos delta_r thin e^(upright(i) theta.alt_r) \, quad a_(1 \, r) = -
  upright(i) r e^(- upright(i) theta.alt_r) \, quad theta.alt_r = gamma_r^2 "Im" chevron.l v_(2 \, r) \, e chevron.r . $

Indeed, this is obtained by expanding $e^(- upright(i) delta_r X)$ and applying the Weyl product identity. Since

$ chevron.l \, chevron.r e ell_r = - upright(i) e^(- 2 gamma_r^2) \, wide d_(0 \, r) = - 2 b r thin e +
  2 b sqrt(1 - r^2) thin ell_r \, $

we have $theta.alt_r arrow.r 0$ faster than every power of $r$,
  and $lr(bar.v.double d_(0 \, r) - 2 b ell_r bar.v.double) arrow.r 0$.

At every later stage retain the exact decomposition obtained by applying all subsequent local updates to the two
  operators in (5.4). Denote its actions on an input $eta$ by $Psi_(O \, r) \( eta \)$ and
  $Psi_(S \, r) \( eta \)$. In particular,

#[#set math.equation(numbering: n => "(5.5)")
 $ u_r eta = Psi_(O \, r) \( eta \) + Psi_(S \, r) \( eta \) \, wide
   lr(bar.v.double Psi_(S \, r) \( eta \) bar.v.double) = r lr(bar.v.double eta bar.v.double) .
   $ <eq:seed-exact-special-norm>]

No orthogonality is asserted or needed in this exact split.
  The echo will depend on the change in the root $Z$-insertion when the special component is flipped.
  We therefore record the insertion carried by that component, divided by its exact amplitude $r$.
  Let $psi_(S \, r) = Psi_(S \, r) \( bold(Omega) \)$, and define at initialization

#[#set math.equation(numbering: n => "(5.6)")
 $ w_r = u_r^(*) Z psi_(S \, r) \/ r . $ <eq:seed-address-direction>]

Thus $lr(bar.v.double w_r bar.v.double) = 1$ exactly. The next lemma separates this direction and the
  initialization direction $ell_r$ from all bounded families of top-number-smooth vectors.

#thm([Lemma 5.3.])[
  (The initial high directions).  #emph[The vectors $ell_r \, w_r$ are centered, have norm one, and satisfy
$ chevron.l ell_r \, w_r chevron.r arrow.r 0 \, wide
  lr(bar.v.double upright(bold(1))_(N lt.eq M) ell_r bar.v.double) +
  lr(bar.v.double upright(bold(1))_(N lt.eq M) w_r bar.v.double) arrow.r 0 quad upright("for every fixed ") M . $

 They consequently have vanishing inner products with every bounded family of top-number-smooth vectors.]
] <lem:seed-high-directions>

#proof[
  Centering follows from the global spin-flip symmetry; every initialization gate is even and the inserted $Y$ or
    $Z$ is odd. The norm statements follow from unitarity. Because $R_star.op^(*) Z R_star.op = Y$ and $Y X = -
    upright(i) Z$, expansion of (5.6) gives
  $ w_r = - Z W_Z \( - 2 gamma_r e - 2 d_(0 \, r) \) bold(Omega) + o \( 1 \) \, $
  where the omitted special–special term has norm $r$, and the remaining scalar phase tends to one.
    The directions $d_(0 \, r)$ are bounded. Resolving the root spin shows that both displayed high vectors are
    sums of coherent packets whose displacements have norm tending to infinity.
    Their projections onto a fixed number sector therefore vanish, directly from the coherent-state expansion.
    At a fixed output $Z$-spin the centers in $ell_r$ and in the displayed expression for $w_r$ differ by $4
    gamma_r e + O \( 1 \)$; their overlap tends to zero by Lemma 27 (or the vacuum Weyl formula).
    Finally, split a bounded family at $N lt.eq M$. Its complementary norm is uniformly $O \( M^(- k) \)$,
    while its fixed-sector pairing tends to zero. First take $r arrow.b 0$ and then $M arrow.r oo$. ◻
]

The special part of (5.4), on #emph[any] bounded input family, has four packets.
  Index them by the spin $z = plus.minus 1$ before $X$ and by the spin $y = plus.minus 1$ after $R_star.op$.
  Their scaled centers are $- 2 b z e$, and their output spins are $y$.
  The bounded displacement $- z d_(0 \, r)$ is part of the tail.
  In particular, the center list is independent of the input; only the tails depend on it.

=== 5.3 A finite ensemble of spin rotations <a-finite-ensemble-of-spin-rotations>

On the vacuum, the exact split has an ordinary component with bounded top-number moments and a special component
  of norm $r$ carried by four displaced packets. A short cost pulse acts on each displaced vector mainly as a spin
  rotation. We need a finite list of such pulses that gives the same rotation at every special center,
  while its first-order action on an undisplaced vector cancels.
  The two zero sums in the next lemma impose that cancellation separately for the two available spin axes.

The selective-rotation argument uses the Lie-bracket and polynomial- approximation approach to ensemble control of
  Li and Khaneja [15] Section II, Examples 1–2. The finite-family and exact zero-clock requirements needed here
  are proved below.

#thm([Lemma 5.4.])[
  (Selective rotations with zero clocks).  #emph[Let $h_1 \, dots.h \,
    h_m$ be a finite list of nonzero vectors in $bb(R)^2$. There are two perpendicular axes $P_1 \,
    P_2$ in the $Z Y$-plane with the following property. Set $c_(j \, a) = h_j dot.op P_a$,
    using the coordinates $\( Z \, Y \)$. Given any $theta in bb(R)$, there is a finite list $\( a_k \, tau_k \)$,
    with $a_k in { 1 \, 2 }$, such that
#[#set math.equation(numbering: n => "(5.7)")
 $ sum_(k : a_k = a) tau_k = 0 quad \( a = 1 \, 2 \) \, wide
   product_k e^(- upright(i) tau_k c_(j \, a_k) P_(a_k)) = e^(- upright(i) theta X) quad \( 1 lt.eq j lt.eq m \) .
   $ <eq:seed-zero-clocks>]

 The product is in chronological order, with later factors on the left.
   The assertion is exact, not merely an assertion about closure.]
] <lem:seed-ensemble-control>

#proof[
  Choose the axes so that every $c_(j \, a) eq.not 0$, and so that the pairs $\( c_(j \, 1)^2 \, c_(j \, 2)^2 \)$
    are distinct unless the original vectors are equal or opposite. Such axes exist:
    each prohibited equality or zero is a nontrivial trigonometric equation in the axis angle,
    apart from the stated equal-or-opposite exception. Delete duplicate square pairs;
    on each deleted pair the product $c_(j \, 1) c_(j \, 2)$ is the same.
  In $G = S U \( 2 \)^m times bb(R)^2$, take the two generators having spin components $-
    upright(i) c_(j \, a) P_a$ and clock component the $a$-th coordinate vector. Their brackets have zero clocks.
    A first bracket has $upright(i) X$-coefficient equal, up to a common nonzero real constant,
    to $c_(j \, 1) c_(j \, 2)$. Repeated double brackets with the first or second generator multiply this
    coefficient by $c_(j \, 1)^2$ or $c_(j \, 2)^2$, again up to nonzero common constants.
    Thus the generated Lie algebra contains the clock-zero vector with coefficients
  $ c_(j \, 1) c_(j \, 2) F \( c_(j \, 1)^2 \, c_(j \, 2)^2 \) thin upright(i) X $
  for every real polynomial $F$. Polynomial interpolation on the finite set of square pairs makes all these
    coefficients equal to one.
  For completeness, exponentials of this Lie-algebra vector are reachable by finite products of the two original
    one-parameter groups. Let $cal(R)$ denote the subgroup of such finite products,
    and let $frak(g)_0$ be the Lie algebra generated by the two generators.
    The span of their conjugates by elements of $cal(R)$ is invariant under each of the two adjoint one-parameter
    groups. Differentiation shows that it contains all iterated brackets and hence equals $frak(g)_0$.
    Choose finitely many of these conjugates forming a basis.
    The product map of their one-parameter groups has surjective differential at zero,
    so its image contains a neighborhood of the identity in the connected analytic subgroup with Lie algebra
    $frak(g)_0$. Each factor is itself a reachable conjugate.
    Subdivide any one-parameter path into finitely many pieces in this neighborhood.
    The whole exponential is therefore in $cal(R)$. Applying this to the common $X$-generator with zero clocks
    gives (5.7). ◻
]

The preceding lemma treats fixed real coefficients. In the circuit,
  the coefficients come from actual insertion vectors and change during the probes.
  The next estimate controls that change without replacing the insertion vectors by approximants before a singular
  rescaling.

#thm([Lemma 5.5.])[
  (Accuracy of selective probes).  #emph[Consider a stage whose vacuum state $u_r
    bold(Omega)$ has a finite packet expansion, with norm-$o \( r \)$ remainders and uniformly bounded scaled
    centers. Suppose the ordinary component has order-one amplitude and the special component has amplitude
    $O \( r \)$. All designated tails have bounded top-number moments.
    Suppose also that one of the following ordinary geometries holds.]
  + #emph[At a standard stage all ordinary centers are zero.]
  + #emph[At a huge-cost stage the ordinary part is $psi_(+) + psi_(-)$, with $Z psi_y = y psi_y$ and centers $-
    t y v_r$, where $t eq.not 0$ and $v_r = u_r^(*) Z u_r bold(Omega)$.
    Every special center $d_(j \, r)$ obeys $lim "Im" chevron.l v_r \, d_(j \, r) chevron.r eq.not 0$.]
  #emph[Assume the limiting special projection pairs
$ h_j = lim_(r arrow.b 0) - 2 #scale(x: 120%, y: 120%)[\(] "Im" chevron.l v_(Z \, r) \, d_(j \, r) chevron.r \,
  "Im" chevron.l v_(Y \, r) \, d_(j \, r) chevron.r #scale(x: 120%, y: 120%)[\)] $

 exist and are nonzero. Use the axes and finite pulse list of Lemma 29 for these pairs,
   replacing its spin generators by actual toggled probes of angles $r tau_k$.
   Then the net probe action is the identity up to $o \( r \)$ on every ordinary packet,
   and is the prescribed $X$-rotation up to $o \( 1 \)$ on every normalized special packet.
   The ordinary assertion holds also after any root spin matrix has been inserted in its tail.
   These statements hold uniformly for bounded families of tails sharing the stated center list,
   with the probes chosen solely from the vacuum data.]
] <lem:seed-selective-accuracy>

#proof[
  Let $V_j$ be a prefix of the short probes, and write $v_(P \, r)^(\( j \)) = \( V_j u_r \)^(*) P \( V_j u_r \)
    bold(Omega)$. Center preservation and all centered-tail bounds follow first from Lemma 27,
    without estimating the spin phases. At a standard stage every ordinary probe has zero center phase.
  At a huge-cost stage there is the exact identity
  #[#set math.equation(numbering: n => "(5.8)")
   $ chevron.l v_(P \, r)^(\( j \)) \, v_r chevron.r = chevron.l P V_j psi \, V_j Z psi chevron.r \, wide psi =
     u_r bold(Omega) . $ <eq:seed-hermitian-diagonal>]
  Group the ordinary packets by their original sign $y$. The diagonal term of sign $y$ on the right-hand side is
    $y chevron.l P V_j psi_y \, V_j psi_y chevron.r$, which is real.
    This remains true although the probes may rotate the spin within that group.
    The two ordinary centers are separated by $2 \| t \|$, since $lr(bar.v.double v_r bar.v.double) = 1$.
    An ordinary center and a special center are also separated:
    their imaginary projections against $v_r$ differ by a quantity bounded away from zero.
    Lemma 27 makes all these cross terms smaller than any fixed power of $r$.
    Terms containing only special packets are $O \( r^2 \)$, and the remainder terms are $o \( r \)$.
    Consequently, at #emph[every] intermediate probe prefix,
  #[#set math.equation(numbering: n => "(5.9)")
   $ "Im" chevron.l v_(P \, r)^(\( j \)) \, v_r chevron.r = o \( r \) . $ <eq:seed-huge-imaginary>]
  More quantitatively, let $epsilon_r = o \( r \)$ bound the norm of the discarded vacuum remainder at the start
    of the probe sequence. For every fixed $M$, the preceding argument gives
  #[#set math.equation(numbering: n => "(5.10)")
   $ max_j \| "Im" chevron.l v_(P \, r)^(\( j \)) \, v_r chevron.r \| lt.eq C_M #scale(x: 120%, y: 120%)[\(] r^2 +
     epsilon_r + r^M #scale(x: 120%, y: 120%)[\)] . $ <eq:seed-huge-imaginary-modulus>]
  The constant depends on the finite pulse list, a positive lower bound on center separations,
    and finitely many designated vacuum-tail seminorms. The exact probe prefixes preserve the norm of the
    discarded remainder; no number-operator estimate is imposed on it.
    This derivation used only center preservation, so there is no circular small-phase assumption.
  By (5.3), an ordinary center $- t y v_r$ therefore has spin phase $o \( r \)$ in every probe.
    In either geometry a probe acts as identity plus $O \( r \)$ on the ordinary part and on that part with any
    spin matrix inserted. On the special part the norm is $O \( r \)$, so unitarity suffices. Using
  $ v_(P \, r)^(\( j + 1 \)) - v_(P \, r)^(\( j \)) = \( V_j u_r \)^(*) #scale(x: 120%, y: 120%)[\(] V^(*) P V -
    P #scale(x: 120%, y: 120%)[\)] \( V_j u_r \) bold(Omega) $
  for the next probe $V$, or equivalently estimating $\( P V - V P \) \( V_j u_r \) bold(Omega)$, gives
  #[#set math.equation(numbering: n => "(5.11)")
   $ lr(bar.v.double v_(P \, r)^(\( j \)) - v_(P \, r)^(\( 0 \)) bar.v.double) =
     O \( r \) $ <eq:seed-probe-direction-change>]
  for the fixed finite list.
  After removing an ordinary center, expand the displacement in each probe to first order.
    Equation (5.9) supplies only an $o \( r \)$ additional phase in the huge-cost geometry.
    Replacing $v_(P \, r)^(\( j \))$ by its starting value in the first-order displacement costs $O \( r^2 \)$,
    by (5.11). The first-order sum is therefore
  $ - upright(i) r sum_(a = 1)^2 (sum_(k : a_k = a) tau_k) P_a q \( v_(P_a \, r)^(\( 0 \)) \) = 0 . $
  Here is a uniform remainder bound for this cancellation. For a fixed ordinary center $d_r$,
    let $cal(B)_r \( d_r \)$ be the net probe action conjugated by $W \( d_r \/ r \)$, and put
  $ Delta_r = max_j lr(bar.v.double v_(P_j \, r)^(\( j \)) - v_(P_j \, r)^(\( 0 \)) bar.v.double) \, wide
    alpha_r \( d_r \) = max_j 2 \| tau_j "Im" chevron.l v_(P_j \, r)^(\( j \)) \, d_r chevron.r \| . $
  Then for every designated centered tail $eta$,
  #[#set math.equation(numbering: n => "(5.12)")
   $ lr(bar.v.double \( cal(B)_r \( d_r \) - upright(bold(1)) \) eta bar.v.double) lt.eq
     C_K
     [\( r^2 + r Delta_r \) lr(bar.v.double eta bar.v.double)_1 + alpha_r \( d_r \) lr(bar.v.double eta
     bar.v.double)] . $ <eq:seed-uniform-probe-bound>]
  Indeed, remove each spin phase by its operator-norm bound and replace each displacement direction by its
    starting value. The latter replacement costs at most $C r Delta_r
    lr(bar.v.double eta bar.v.double)_1$ through the finite product.
    In the product with starting directions, hold those directions fixed at their given $r$-values and introduce
    an auxiliary pulse strength $lambda$. Its first derivative at $lambda = 0$ is zero, by the clocks.
    Its second derivative is a finite sum controlled by $lr(bar.v.double q \( v \) q \( w \) eta bar.v.double)
    lt.eq C lr(bar.v.double  bar.v.double) v lr(bar.v.double  bar.v.double) w
    lr(bar.v.double eta bar.v.double)_1$; the intervening displacements preserve this seminorm uniformly.
    Evaluating the Taylor remainder at $lambda = r$ gives $C_K r^2 lr(bar.v.double eta bar.v.double)_1$;
    no differentiability of the directions in $r$ is assumed.
    The constant $C_K$ depends only on the fixed pulse list; all actual insertion directions have norm one.
    At a standard center $alpha_r = 0$. At a huge-cost center (5.10) gives $alpha_r lt.eq
    C \( r^2 + epsilon_r + r^M \) = o \( r \)$. Together with $Delta_r = O \( r \)$,
    this proves the claimed uniform $o \( r \)$ estimate using the single tail seminorm
    $lr(bar.v.double eta bar.v.double)_1$. It applies unchanged to a root-spin-inserted tail.
    If the input also contains a discarded norm remainder $rho_r$,
    its contribution to the net identity error is at most $2 lr(bar.v.double rho_r bar.v.double)$, by unitarity.
    No field operator is applied to such a remainder in this argument.
  On a special packet the change of its phase coefficient during the sequence is $O \( r \)$,
    by (5.11) and the boundedness of its scaled center. The small displacements contribute $O \( r \)$ on its
    tail, and its starting phase coefficients converge to the prescribed $c_(j \, a)$.
    The resulting finite spin product thus converges to (5.7).
    Multiplication by the packet’s amplitude $O \( r \)$ makes its error $o \( r \)$.
    All quantities defining the probes came from the vacuum. The estimates after removing a center, however,
    use only the tail seminorms. They therefore apply to every bounded input family with the same center list. ◻
]

=== 5.4 The packet invariant and the singular echo <the-packet-invariant-and-the-singular-echo>

We now apply the selective estimates to the exact initialized decomposition and propagate it through costs,
  mixers, and simulated seed gates. The required statements include moving input vectors:
  later insertion estimates must be allowed to use the approximating circuit itself as an input.

We call the times between simulated gates #emph[standard stages].
  A second kind of stage occurs immediately after the forward cost in a seed echo.
  The induction will maintain the following assertions, with the same center list for every bounded input family.

+ At a standard stage there is a unitary $A_r$, a finite product of root spin rotations and spin-controlled Weyl
  displacements with uniformly bounded directions, and a scalar $zeta_r$ of modulus one, such that
  #[#set math.equation(numbering: n => "(5.13)")
   $ Psi_(O \, r) \( eta_r \) = zeta_r A_r eta_r + o \( r \) . $ <eq:seed-low-ordinary>]
  The operators $A_r \, A_r^(*)$ preserve all top-number seminorms uniformly.
+ The special part has a finite packet expansion up to $o \( r \)$, with amplitude $r$, bounded tails, scaled centers
  #[#set math.equation(numbering: n => "(5.14)")
   $ d_(z y \, r) = - 2 b z e + y D_r \, wide z \, y in { - 1 \, 1 } \, $ <eq:seed-special-centers>]
  and output spin $y$. Coincident centers cause no problem.
    The vector $D_r$ is a finite sum of actual earlier insertion directions with fixed bounded coefficients.
    Each such direction is within $O \( r \)$ of a bounded family in $cal(S)$.
+ At a standard stage the special insertion is transported:
  #[#set math.equation(numbering: n => "(5.15)")
   $ u_r^(*) Z psi_(S \, r) \/ r = w_r + o \( 1 \) \, $ <eq:seed-transport>]
  where $w_r$ is the initial vector (5.6). Between a special flip and its undoing the right-hand side instead has
    a minus sign.

Here and below the norm remainders need not have bounded number moments.
  They are kept as separate remainder vectors and carried through later unitaries by their norm bounds.
  Only the designated tails require moment estimates.

The initialization satisfies this invariant with $A_r = U_(O \, r)$, $D_r = 0$, and $zeta_r =
  e^(upright(i) theta.alt_r)$: its ordinary amplitude differs from one by $O \( r^2 \)$.
  Equation (5.15) is initially exact. The following observation will be used repeatedly.

#thm([Lemma 5.6.])[
  (Insertion approximation from forward action).  #emph[If (5.5) and (5.13) hold uniformly on bounded input
    families, then
#[#set math.equation(numbering: n => "(5.16)")
 $ lr(bar.v.double u_r^(*) P u_r bold(Omega) - A_r^(*) P A_r bold(Omega) bar.v.double) =
   O \( r \) wide \( P = Y \, Z \) . $ <eq:seed-insertion-O-r>]

 In particular the actual insertion directions have bounded smooth approximants.
   No approximation to $u_r^(*)$ on a high packet is needed.]
] <lem:seed-low-insertions>

#proof[
  Put $hat(v)_(P \, r) = A_r^(*) P A_r bold(Omega)$. This is a bounded smooth family.
    Unitarity and $A_r hat(v)_(P \, r) = P A_r bold(Omega)$ give
  $ lr(bar.v.double u_r^(*) P u_r bold(Omega) - hat(v)_(P \, r) bar.v.double) =
    lr(bar.v.double P u_r bold(Omega) - u_r hat(v)_(P \, r) bar.v.double) lt.eq
    lr(bar.v.double P \( u_r - zeta_r A_r \) bold(Omega) bar.v.double) +
    lr(bar.v.double \( u_r - zeta_r A_r \) hat(v)_(P \, r) bar.v.double) . $
  Each term is $O \( r \)$ by the exact special norm and the ordinary approximation.
    The possibly nonconvergent scalar phase cancels. ◻
]

For this induction, assume that the nonzero projection hypotheses of Lemma 30 hold at every required probe start.
  We call these the #emph[visibility conditions]. The final subsection proves that one perturbation of the finite
  target word ensures all of them and then constructs the probes in order.

An unscaled cost uses the actual insertion $v_(Z \, r)$ and simply left-multiplies $A_r$ by
  $e^(- upright(i) c Z q \( v_(Z \, r) \))$. On a special packet with spin $y$,
  it adds a bounded displacement to the tail and a scalar phase, leaving its scaled center and spin unchanged.
  It commutes with $Z$, so it preserves the transport identity exactly.

To implement a bulk mixer $R_theta = e^(- upright(i) theta X)$,
  first use selective probes to apply $R_theta^(- 1)$ on the special packets,
  then apply the global mixer $R_theta$. On ordinary packets the first step is identity to $o \( r \)$,
  so the low update is $R_theta$. On special packets the two spin actions cancel to $o \( 1 \)$.
  The same is true on their $Z$-inserted tails. Thus the special center and spin return to their initial values,
  and transport is preserved to $o \( 1 \)$ after division by the special amplitude $r$.

For a longitudinal seed gate use a fixed $t eq.not 0$ and the four operations

#[#set math.equation(numbering: n => "(5.17)")
 $ upright("cost ") t \/ r \, wide upright("selective ") \( - upright(i) X \) \, wide upright("cost ") - t \/ r \,
   wide upright("selective ") \( upright(i) X \) . $ <eq:seed-echo-list>]

The next lemma verifies both the singular cancellation and its error scale.

#thm([Lemma 5.7.])[
  (One echo).  #emph[Under the invariant and the visibility conditions, the echo (5.17) preserves the invariant.
    Up to a scalar of modulus one its low update is
#[#set math.equation(numbering: n => "(5.18)")
 $ A_r mapsto W_Z \( g_r \) A_r \, wide g_r = t / r \( v'_r - v_r \) = - 2 t w_r + o \( 1 \) \, $ <eq:seed-echo-low>]

 where $v_r$ is the actual $Z$-insertion before the forward cost and $v'_r$ is the actual insertion immediately
   after the selective flip. The special-center update can be taken to be exactly
#[#set math.equation(numbering: n => "(5.19)")
 $ D_r mapsto D_r - t \( v_r + v'_r \) . $ <eq:seed-D-update>]

 All ordinary errors are $o \( r \)$ before and after the large costs.]
] <lem:seed-one-echo>

#proof[
  Write $u_(upright("in") \, r)$ for the exact prefix before the echo, and $V_r$ for its selective flip.
    The next two prefixes are
  $ u_(upright("cost") \, r) = e^(- upright(i) t Z q \( v_r \) \/ r) u_(upright("in") \, r) \, wide
    u_(upright("flip") \, r) = V_r u_(upright("cost") \, r) . $
  Their actual $Z$-insertions satisfy
  $ u_(upright("in") \, r)^(*) Z u_(upright("in") \, r) bold(Omega) & =
    u_(upright("cost") \, r)^(*) Z u_(upright("cost") \, r) bold(Omega) = v_r \,\
u_(upright("flip") \, r)^(*) Z u_(upright("flip") \, r) bold(Omega) & = v'_r . $
  The first equality holds because the forward cost commutes with the root $Z$.
    It splits the ordinary part into spins $y$ with centers $- t y v_r$,
    and changes each special center to $d_(z y \, r) - t y v_r$. Centered tails remain bounded.
    The standard-stage imaginary projection against $v_r$ is unchanged by adding $- t y v_r$.
    Thus the assumed special visibility separates special and ordinary centers at this huge-cost stage.
  Denote the exact ordinary and special components after that forward cost by $Psi_(O \, r)^(upright("cost"))$ and
    $psi_(S \, r)^(upright("cost"))$, respectively. Lemma 30 gives net identity to $o \( r \)$ on the ordinary
    part, including its $Z$-inserted version. On the special part it gives $- upright(i) X$ to error $o \( r \)$,
    again including the $Z$-inserted version. Since $X Z X = - Z$, it follows that
  #[#set math.equation(numbering: n => "(5.20)")
   $ v'_r - v_r & =
     u_(upright("cost") \, r)^(*) \( V_r^(*) Z V_r - Z \) \( Psi_(O \, r)^(upright("cost")) \( bold(Omega) \) +
     psi_(S \, r)^(upright("cost")) \)\
 & = - 2 u_(upright("cost") \, r)^(*) Z psi_(S \, r)^(upright("cost")) + o \( r \) = - 2 r w_r +
   o \( r \) . $ <eq:seed-flip-change>]
  The last equality uses transport, which the forward cost preserves.
    The same calculation shows that transport changes sign at this flip.
  On an ordinary input the reverse cost combines with the forward cost as
  #[#set math.equation(numbering: n => "(5.21)")
   $ e^(upright(i) t Z q \( v'_r \) \/ r) e^(- upright(i) t Z q \( v_r \) \/ r) =
     xi_r W_Z #h(-0.16667em) (t / r \( v'_r - v_r \)) \, wide \| xi_r \| = 1 . $ <eq:seed-exact-echo-cancellation>]
  The Weyl phase $xi_r$ is independent of the root spin because the two spin factors multiply to $Z^2 =
    upright(bold(1))$. It may fail to converge. Equation (5.20) makes the residual direction bounded and
    proves (5.18). The ordinary $o \( r \)$ probe error is carried through the reverse cost by unitarity.
    No insertion approximation has been divided by $r$: the cancellation in (5.21) used the two actual directions,
    and only then was (5.20) invoked.
  A special packet has spin $- y$ between the flips. Its two cost displacements therefore add as $- t y v_r -
    t y v'_r$, giving (5.19). Here $y$ remains its label from the standard stage before the echo;
    it is not relabeled when the spin flips. Its scalar phases are harmless.
    The second selective flip is applied at a standard ordinary geometry,
    since (5.21) has already removed the huge ordinary centers.
    It acts trivially to $o \( r \)$ on ordinary tails, restores special spin $y$,
    and restores the plus sign in transport. At this second-flip probe start the exact special norm is still $r$,
    and the ordinary low action already has the updated unitary $W_Z \( g_r \) A_r$.
    Lemma 31 consequently approximates the actual insertion to $O \( r \)$ by this updated low insertion,
    irrespective of the temporarily negative transport sign.
  The special insertion remains transported because each cost commutes with $Z$,
    while each selective flip anticommutes with $Z$ on the special component to error $o \( r \)$.
    In particular, this proof needs only forward estimates on that component.
    Boundedness of the residual direction implies uniform moment bounds for the new $A_r \, A_r^(*)$.
    Lemma 31 supplies bounded approximants to the next actual insertion.
    Finally, $v'_r - v_r = O \( r \)$, so the updated $D_r$ retains the asserted bounded-approximant property. ◻
]

This induction also proves its claimed uniformity on input families.
  The exact decomposition (5.5) is linear in the input. At initialization every input has the same four special
  centers. Unscaled costs and compensated mixers preserve that center list,
  and (5.19) updates it independently of the tail. The probe parameters are determined on the vacuum,
  but Lemma 30 acts uniformly on the whole family of tails having these centers.
  Every discarded vector has norm $o \( r \)$ and is propagated by exact unitaries.
  Since the total gate and probe lists are fixed and finite before $r arrow.b 0$, their errors add to $o \( r \)$.
  This establishes the invariant with no assertion about number moments of the discarded remainders.

=== 5.5 The external-mode limit and the energy pairing <the-external-mode-limit-and-the-energy-pairing>

The echo has now produced the bounded direction $- 2 t w_r + o \( 1 \)$.
  It remains to show that this direction acts as an independent Gaussian seed,
  and that the resulting identification preserves root-shift energy.
  Ordinary Gram convergence alone does not give the latter conclusion, so we compute the root-shift pairing explicitly.

We now identify the limiting low circuit and at the same time establish the limits of the projections used to
  select the probes. Introduce at each vertex a two-dimensional real external mode space with orthonormal vectors
  $ell \, w$, and let $E_(upright("ext")) = "span"_(bb(C)) { ell \, w }$.
  Its Gaussian position operators commute and are independent standard Gaussians in the vacuum.
  To specify the recursion by height, put

$ cal(H)_(upright("seed") \, 0) = bb(C)^2 ⊗ Gamma_s \( E_(upright("ext")) \) \, wide
  cal(H)_(upright("seed") \, h + 1) = bb(C)^2 ⊗ Gamma_s #h(-0.16667em)
  (cal(H)_(upright("seed") \, h)^compose xor E_(upright("ext"))) . $

The vacuum is $\| chevron.r + ⊗ Omega$, and empty descendants give the same compatible height embeddings as in the
  foundations. In the mode space at height $h + 1$, the first summand contains the whole centered child rooted
  space, including that child’s seeds. The second summand contains the two new seeds at the current root.
  Equivalently, the root Hilbert space is the spin times the pointed Gaussian space of these two seeds times the
  symmetric Fock space over centered children.

The formal low circuit starts with

#[#set math.equation(numbering: n => "(5.22)")
 $ A^(upright("form")) = R_star.op e^(2 upright(i) b Z q \( ell \)) . $ <eq:seed-formal-initialization>]

A bulk mixer and an unscaled cost have their usual seeded rules.
  An echo with parameter $t$ has the formal update $e^(- 2 upright(i) t Z q \( w \))$.
  At each vertex, $q \( w \)$ is the Gaussian seed of the requested word:
  the same coordinate is reused at every seed gate, while different vertices have independent copies.
  The coordinate $q \( ell \)$ is independent of those seeds and enters through initialization;
  its effect is removed by taking $b$ small in the final proof.
  Thus an echo with $t = sigma \/ 2$ has the seed law of the requested gate of angle $sigma$,
  not a newly sampled seed at each pulse. The root-shift calculation below identifies the energy,
  which is not determined by this marginal law alone.

At a standard stage write $v_P^(upright("form")) = \( A^(upright("form")) \)^(*) P A^(upright("form"))
  bold(Omega)$, with the appropriate accumulated word in $A^(upright("form"))$.
  Treat these insertions and $e = Z bold(Omega)$ as endogenous child directions.
  In particular their inner products with the external directions $ell \, w$ are zero.

#thm([Lemma 5.8.])[
  (Finite Gram induction).  #emph[Suppose the required selective probe lists have been constructed through a given
    standard stage. The joint Gram matrix of $e$, all actual standard-stage insertion vectors used so far,
    and $ell_r \, w_r$, converges to that of the corresponding formal endogenous directions and the two orthogonal
    external directions. The limiting energy of the actual insertion converges to the energy of the formal seeded
    insertion. The same assertions hold at the standard ordinary geometry just before the second flip in an echo,
    with the temporary transport sign retained.]
] <lem:seed-gram-induction>

#proof[
  Every $A_r$ in the invariant is a finite sum of root spin matrices times Weyl displacements.
    Its directions are finite linear combinations of earlier actual insertion directions, $d_(0 \, r)$,
    and the bounded echo directions $g_r$. Its adjoint and its insertion vectors have the same finite-Weyl-sum
    form. The number of summands is finite for the fixed circuit; no bound uniform in circuit length is required.
  For such sums all vacuum inner products reduce to
  #[#set math.equation(numbering: n => "(5.23)")
   $ chevron.l W \( f \) Omega \, W \( g \) Omega chevron.r =
     exp #h(-0.16667em)
     (- 1 / 2 lr(bar.v.double g - f bar.v.double)^2 + upright(i) "Im" chevron.l \, chevron.r f g) .
     $ <eq:seed-vacuum-weyl-gram>]
  Thus only finitely many direction inner products are needed at a step.
    The initial directions satisfy $d_(0 \, r) = 2 b ell_r + o \( 1 \)$, and the echo directions satisfy $g_r = -
    2 t w_r + o \( 1 \)$. Norm-small errors in these bounded directions may be removed using Lemma 27.
    Every actual standard insertion differs by $O \( r \)$ from its bounded smooth low insertion, by Lemma 31.
    Thus, when computing a new Gram entry, an earlier actual insertion may first be replaced by its low insertion
    at error $O \( r \)$. Lemma 28 therefore makes its pairing with $ell_r \, w_r$ vanish.
    Together with $chevron.l ell_r \, w_r chevron.r arrow.r 0$,
    this is exactly the orthogonal-sum rule for external and endogenous directions.
    Formula (5.23) now proves the Gram assertion inductively.
  Here is the additional calculation for the root-shift energy,
    so that ordinary Gram convergence is not silently substituted for convergence of a different operator.
    A low $Y$- or $Z$-insertion is centered: the circuit preserves the joint spin-flip parity and these matrices
    are odd. Write such an insertion as
  $ h = sum_(j = 1)^J s_j ⊗ W \( f_j \) Omega \, wide s_j in bb(C)^2 . $
  In the unseeded representation, $sans(L) h = \| chevron.r + ⊗ a^(*) \( h \) Omega$.
    The one-particle coefficient of $W \( f \) Omega$ is $upright(i) e^(- lr(bar.v.double  bar.v.double) f^2 \/ 2)
    f$. Consequently
  #[#set math.equation(numbering: n => "(5.24)")
   $ chevron.l \, chevron.r h sans(L) h = - upright(i) sum_(j = 1)^J chevron.l s_j \, +
     chevron.r thin e^(- lr(bar.v.double f_j bar.v.double)^2 \/ 2) chevron.l f_j \,
     h chevron.r . $ <eq:seed-energy-weyl-sum>]
  Each pairing $chevron.l f_j \, h chevron.r$ is one of the same finite linear combinations of insertion and
    external-direction Grams. In the formal seeded representation the same formula holds,
    with $h$ inserted in the endogenous summand; the external components of $f_j$ then pair to zero.
    More explicitly, the external two-mode Fock factor represents the Gaussian variables at the root,
    while the child Fock factor is built over endogenous directions.
    The root shift puts the root-seed factor in its pointed vacuum and creates $h$ only in that child factor.
    The two-factor decomposition is identified with Fock space over their orthogonal direct sum.
    The high-direction argument gives exactly this zero pairing in the actual limit.
    Finally, the actual insertion differs in norm from $h$ by $O \( r \)$. Since $sans(L)$ is an isometry,
  $ \| cal(E) \( v \) -
    cal(E) \( h \) \| lt.eq \( lr(bar.v.double  bar.v.double) v + lr(bar.v.double  bar.v.double) h \)
    lr(bar.v.double v - h bar.v.double) \, $
  which proves energy convergence. A finite scalar bulk phase cancels from every insertion.
    The same argument applies just before an echo’s second flip,
    because its ordinary centers have already canceled and its low update has already been made. ◻
]

The standard-stage Gram limits determine the projections needed for ordinary probe starts.
  For a probe immediately after a cost of size $t \/ r$, we also need the following transverse projection estimate.

#thm([Lemma 5.9.])[
  (The huge-stage transverse projection).  #emph[Immediately after a forward cost with fixed $t eq.not 0$,
    the actual $Y$-insertion has vanishing pairing with every bounded family in $cal(S)$.
    In particular, its pairing with every special scaled center tends to zero.]
] <lem:seed-huge-transverse>

#proof[
  For a bounded input $eta_r$, use the standard-stage uniform forward approximation on both $bold(Omega)$ and
    $eta_r$. After the huge cost their ordinary pieces have centers $- t y v_r$ and root spins $y$.
    In the pairing defining $chevron.l u_r^(*) Y u_r bold(Omega) \, eta_r chevron.r$,
    the inserted $Y$ reverses the spin. Nonzero spin pairings therefore require the two opposite ordinary centers.
    Their distance is $2 \| t \|$, so their contribution vanishes by (5.2).
    Every contribution with a special component is $O \( r \)$; the ordinary remainders are $o \( r \)$.
    This proves the first assertion. Before the huge cost, the invariant approximates every special center by a
    bounded smooth vector to $O \( r \)$. In particular the intermediate directions $v'_r$ in (5.19) differ by
    $O \( r \)$ from the corresponding earlier standard insertions, by (5.20).
    Adding the forward displacement $- t y v_r$ preserves this property.
    The first assertion and Cauchy–Schwarz prove the second. ◻
]

=== 5.6 Visibility and the order of construction <visibility-and-the-order-of-construction>

The preceding arguments are conditional only on the visibility conditions.
  We now choose the target angles and all finite probe lists so that those conditions hold.
  The order is important: first use the formal low circuit to perturb the target angles,
  then construct the probe lists successively from limits established at earlier stages,
  and only afterwards choose $r$. Fix a finite seeded word,
  regard all its angles as independent real variables $lambda$,
  and replace each seed gate of angle $sigma$ formally by an echo parameter $t = sigma \/ 2$.
  Include in a finite list all standard-stage probe starts: compensated mixers and the second flips of echoes.
  Also include the standard stage preceding each forward huge cost.
  At a second-flip probe start the current echo’s reverse cost has already occurred:
  count that echo in the center accumulator and include its seed displacement in the formal ordinary state.
  Its packet label $y$ is still the label before the echo, although its current spin is $- y$.
  Define, at each probe start,

$ D^(upright("form")) = - 2 sum_(j : thin upright("reverse cost already applied")) t_j v_(Z \, j)^(upright("form")) \, $

where the insertion is taken immediately before that echo. At each listed stage and for each $z \, y$, impose

#[#set math.equation(numbering: n => "(5.25)")
 $ a_(z y)^(upright("form")) \( lambda \) = - 2 "Im" chevron.l v_Z^(upright("form")) \, - 2 b z e +
   y D^(upright("form")) chevron.r eq.not 0 . $ <eq:seed-formal-visibility>]

Each function in (5.25) is real analytic in the finitely many angles.
  One may verify this without an unbounded-operator analyticity theorem:
  expand the finite word into Weyl sums and use (5.23) recursively.
  These expressions use finitely many sums, products, and exponentials of previous finite Gram expressions.

None of these analytic functions is identically zero. To see this,
  set #emph[all] angles of the target word to zero, while keeping the initialization fixed.
  Every listed formal standard stage is then (5.22), and $D^(upright("form")) = 0$.
  A direct one-Gaussian calculation gives

$ chevron.l v_Z^(upright("form")) \, e chevron.r = upright(i) e^(- 8 b^2) \, wide a_(z y)^(upright("form")) =
  4 b z e^(- 8 b^2) eq.not 0 . $

The temporary minus sign in special transport before a second flip does not change this formal ordinary insertion
  or its center formula. Thus the same test point works for every listed stage.

The complement of the finite union of these analytic zero sets, and of the hyperplanes $t_j = 0$, is dense.
  Perturb the target angles arbitrarily little into that complement.
  Energy changes arbitrarily little because it is continuous by the same finite-Weyl-sum formulas.

We can now construct the actual pulses successively. At a standard probe start,
  Lemma 33 supplies the limits of both special projection coordinates,
  and (5.25) makes their first coordinate nonzero. Choose the finite ensemble-control list from these limiting
  pairs. Lemma 30 implements it with the required errors. At a huge-stage first flip,
  the first coordinate is unchanged by the forward displacement,
  while the second coordinate tends to zero by Lemma 34. Its limiting pairs are therefore
  $\( a_(z y)^(upright("form")) \, 0 \)$, again nonzero. They too admit the ensemble-control construction.
  Continue the packet and Gram inductions to the next stage.
  The argument at the second flip uses the already updated formal low circuit,
  with the sign of transport still negative until that flip is undone.
  In particular no pulse list is chosen using a limit that presupposes its own implementation.

#proof[
  Start with the requested finite seeded word and a tolerance.
    For a small fixed $b > 0$, prepend $R_star.op e^(2 upright(i) b Z q \( ell \))$ in the formal seeded calculus,
    with $ell$ an additional independent Gaussian coordinate at every site.
    As $b arrow.b 0$, its energy tends to that of the original seeded word.
    Indeed, finite bounded-direction Weyl words are strongly continuous in this initial displacement,
    as are their insertion and energy Grams. At $b = 0$ the initial global mixer acts on the original $\|
    chevron.r +$ product state by a scalar, so it changes no expectation; the extra Gaussian coordinate is then unused.
  Choose $b$ sufficiently small for this error, and perturb the target angles sufficiently little that all the
    visibility conditions hold, with another arbitrarily small energy error.
    Fix the resulting finite probe lists by the successive construction above.
    With these lists fixed, take $r > 0$ sufficiently small. The packet induction and Lemma 33 show that the
    ordinary word consisting of the initialization, unscaled costs, compensated mixers,
    and seed echoes has energy arbitrarily close to that of the perturbed formal seeded word.
    Summing the three errors proves the assertion.
  Every gate used is a cost or mixer pulse, possibly with negative angle.
    Toggled probes and all compensations are finite such words;
    consecutive gates of the same kind can be combined, or zero-angle gates inserted to obtain the stipulated
    alternating QAOA format. After $b$, the perturbation, the finite probe lists, and $r$ have been chosen,
    the entire word and its angles are fixed. Proposition 3 therefore applies before any approximation parameter
    is changed. This proves the claimed order of limits and parameter independence. ◻
]

== 6 The ordinary word and the SK limit <sec:conclusion>

The preceding constructions are now fixed in their order of use.
  The following error allocation leaves every circuit finite before applying the tree-to-SK identity.

#proof[
  Fix $epsilon > 0$. Apply Proposition 21 with error $epsilon \/
    4$ and helper bound $eta_H = \( epsilon \/ 8 \)^2$. It gives a finite bounded smooth classical calculation
    with output $m$ and helper probability $p_H$ satisfying
  $ cal(E) \( m \) gt.eq P_(*) - epsilon \/ 4 \, wide 2 sqrt(p_H) < epsilon \/ 4 . $
  Apply Theorem 22 with $eta = epsilon \/ 8$. The resulting finite seeded circuit has insertion $v$ with
  $ cal(E) \( v \) gt.eq cal(E) \( m \) - 2 eta - 2 sqrt(p_H) > P_(*) - 3 epsilon \/ 4 . $
  By Theorem 26, a finite ordinary word approximates this seeded value to error less than $epsilon \/ 4$.
    Its value is therefore greater than $P_(*) - epsilon$.
  All choices just made concern limiting tree calculations and deterministic approximation parameters.
    After these choices there is a single finite word with real angles independent of $D$, $n$, and $J$.
    By Proposition 3, its tree value equals its fixed-parameter SK value.
    Write the word in the form (1.3); it gives $v_p \( gamma \, beta \) gt.eq P_(*) -
    epsilon$ for some finite $p$. The upper bound and monotonicity established above finish the proof. ◻
]

#prodef([Remark 6.1.])[
  (Order of choices).  For the primary route the logical order is:
    accuracy; a fixed zero-temperature minimizer and stopping time $T < 1$;
    a sufficiently fine finite scalar mesh at that $T$; finite sign smoothing;
    bounded column and trigonometric approximation; type exclusions;
    helper contractions and finite commutator approximations; elementary seed compilation;
    small initialization parameter $b$; generic angle perturbation; finite selective-probe lists;
    sufficiently small positive $r$; one fixed ordinary word; thermodynamic limit.
    Within any nested construction an outer accuracy is fixed before a finite approximation of its inner
    operations is chosen. No uniform depth estimate and no exchange of these limits is used.
    For the independent positive-temperature route, the initial scalar choices are instead a sufficiently large
    fixed finite $beta_0$, a cutoff $T < q_(beta_0)$, and a sufficiently fine finite message-passing
    discretization. Its degree limit is taken with those parameters fixed.
    The subsequent approximation and circuit choices are the same.
] <rem:order-of-choices>

== 7 Proof of the regular MaxCut consequence <sec:regular-maxcut-proof>

We now prove Corollary 2. Theorem 1 provides one fixed word with SK value close to $P_(*)$,
  and Proposition 3 identifies that value with the large-degree positive-cost tree correlation.
  The proof first transfers this correlation to every graph satisfying the stated girth condition.
  It then uses local tree structure and the random-regular optimum asymptotics to obtain the separate
  successive-limit comparison.

#proof[
  The normalized negative cost used by Basso et al. [4] is
  $ C_D^(-) = - 1 / sqrt(D) sum_({ u \, v } in E) Z_u Z_v = 2 / sqrt(D) H_(upright("MC")) \( G \) -
    frac(\| E \|, sqrt(D)) I . $
  Thus its cost gate with angle $gamma_j$ is, up to a scalar phase,
    the usual MaxCut cost gate with angle $2 gamma_j \/ sqrt(D)$, with the same sign and unchanged mixer angle.
    Let $r_p^(+) \( D \, gamma \, beta \)$ be the distinguished-edge correlation for the positive tree cost in
    Proposition 3, and put
  $ nu_p \( D \, gamma \, beta \) = sqrt(D) / 2 r_p^(+) \( D \, gamma \, beta \) . $
  That proposition gives $nu_p \( D \, gamma \, beta \) arrow.r v_p \( gamma \, beta \)$ for each fixed word.
  For the observable at an edge, backward cancellation of commuting cost gates leaves only cost edges having an
    endpoint at distance at most $p - 1$ from the distinguished edge’s endpoint set.
    An extra edge in this relevant cone would close a cycle of length at most $2 p + 1$.
    Under the stated girth condition the cone is therefore the regular tree cone.
    Conjugating #emph[only this cone] by $X$ on one bipartition class reverses the cost sign and the distinguished
    $Z_u Z_v$, while preserving the mixers and the initial plus state. No bipartition of $G$ is used.
    Every edge therefore has negative-cost correlation $- r_p^(+) \( D \, gamma \, beta \)$, and
  #[#set math.equation(numbering: n => "(7.1)")
   $ q_(p \, G) \( 2 gamma \/ sqrt(D) \, beta \) = 1 / 2 + frac(nu_p \( D \, gamma \, beta \), sqrt(D)) .
     $ <eq:regular-tree-cut>]
  This is the finite-degree edge formula in the full version of [4] Equations (2.3)–(2.6) and (3.1),
    in the convention of Proposition 3. Choose the word by Theorem 1 with $v_p \( gamma \, beta \) gt.eq P_(*) -
    eta \/ 4$. For all sufficiently large $D$, fixed-word convergence gives $nu_p \( D \, gamma \, beta \) gt.eq
    P_(*) - eta \/ 2$, proving (1.6).
  For fixed $D \, p$, let $b_(p \, D) \( G \)$ be the fraction of edges whose relevant cone is not a regular tree
    cone. A conservative radius-$\( p + 1 \)$ neighborhood test bounds the number of such edges by a constant
    depending on $D \, p$ times the number of cycles of length at most $2 p + 3$.
    Those fixed-length cycle counts are tight in the uniform simple regular model by McKay, Wormald,
    and Wysocka [17] Theorem 1. Consequently $b_(p \, D) \( G_(n \, D + 1) \) arrow.r
    0$ in graph probability and in mean as $n arrow.r oo$. Since each edge contributes a cut probability in
    $\[ 0 \, 1 \]$, the exact value on the other edges gives
  $ lr(|q_(p \, G) \( 2 gamma \/ sqrt(D) \, beta \) - 1 / 2 - frac(nu_p \( D \, gamma \, beta \), sqrt(D))|) lt.eq
    b_(p \, D) \( G \) . $
  This proves convergence of the conditional quantum expectation to the tree value at fixed $D \, p$;
    the whole random graph need not have large girth.
  Dembo, Montanari, and Sen [7] Theorem 1.6(b), with the convention after Equation (1.7) identify the optimal
    leading correction for the same simple regular model. After dividing their cut size by $n d \/
    2$ and putting $d = D + 1$, their theorem says that $sqrt(D) \( "OPT" \( G_(n \, D + 1) \) - 1 \/ 2 \)$
    converges to $P_(*)$ in the same successive graph-probability sense; here $sqrt(D \/ \( D + 1 \)) arrow.r 1$.
    Their $P_(*)$ is ours: pairing their ordered off-diagonal Gaussians and using sign symmetry gives (1.1) in
    law, while the diagonal is a mean-zero configuration-independent shift.
    For large $D$ the deterministic quantity $P_(*) - nu_p \( D \, gamma \, beta \)$ is at most $eta \/ 2$.
    If $sqrt(D) thin Delta_D > eta$, the absolute centered-optimum error or the absolute conditional-expectation
    error multiplied by $sqrt(D)$ must therefore exceed $eta \/ 4$.
    The first probability vanishes in the stated successive limit by the cited optimum theorem,
    and the second vanishes in the inner $n$ limit by the preceding bound. This proves (1.7). ◻
]

== 8 The independent positive-temperature construction <sec:positive-temperature-alternative>

This appendix constructs near-optimal bounded classical formulas without using the zero-temperature scalar
  companion. Its input is the positive-temperature Parisi measure at a fixed finite inverse temperature.
  The Parisi diffusion first gives an almost optimal martingale output.
  A finite-step tree calculation and a strong symmetric-power limit then place that output in the rooted Hilbert
  space. Finally, the bounded approximation and color-exclusion lemmas of Section 3 put it in the form required by
  Theorem 22.

Besides providing an independent route to the same synthesis input,
  the appendix retains the finite-degree message calculation and the quantitative fixed-temperature mesh bounds.
  Temperature is chosen first and held fixed in those estimates.
  No passage from the log-cosh terminal datum here to the terminal datum $\| x \|$ is used.

=== 8.1 The positive-temperature variational input <the-positive-temperature-variational-input>

The use of a Parisi diffusion and its gradient martingale to choose incremental message-passing coefficients
  follows the classical construction of Montanari [18] Section 3.1, Lemmas 3.2–3.3,
  with the more general framework of El Alaoui, Montanari, and Sellke [8] Assumption 1 and Theorem 2.
  We use the finite-tree calculation of El Alaoui, Montanari,
  and Sellke [9] and convert its output to the synthesis formulas below.

We record explicitly the spin-glass results that enter the argument.
  For an inverse temperature $beta_0 > 0$, let $mu_(beta_0)$ be the finite-temperature Parisi measure and put

$ gamma \( t \) = beta_0 mu_(beta_0) \( \[ 0 \, t \] \) . $

In field coordinates appropriate to the normalization of this paper, the Parisi PDE and free energy are

#[#set math.equation(numbering: n => "(8.1)")
 $ phi.alt_t \( t \, x \) & = - 1 / 2 #scale(x: 120%, y: 120%)[\(] phi.alt_(x x) \( t \, x \) +
   gamma \( t \) phi.alt_x \( t \, x \)^2 #scale(x: 120%, y: 120%)[\)] \,\
phi.alt \( 1 \, x \) & = 1 / beta_0 log #scale(x: 120%, y: 120%)[\(] 2 cosh \( beta_0 x \)
  #scale(x: 120%, y: 120%)[\)] . $ <eq:positive-parisi-pde>]

#[#set math.equation(numbering: n => "(8.2)")
 $ F_(beta_0) = phi.alt \( 0 \, 0 \) - 1 / 2 integral_0^1 t gamma \( t \) thin upright(d) t =
   lim_(n arrow.r oo) frac(1, n beta_0) bb(E) log sum_sigma exp #scale(x: 120%, y: 120%)[\(] beta_0
   h_(n \, J) \( sigma \) #scale(x: 120%, y: 120%)[\)] . $ <eq:positive-parisi-value>]

Equation (8.2) is the positive-temperature Parisi formula [23] Theorem 1.1,
  written in the field coordinates of (8.1). The covariance of $h_(n \, J)$ divided by $n$ is
  $\( R_12^2 - 1 \/ n \) \/ 2$, where $R_12 = n^(- 1) sum_i sigma_i^1 sigma_i^2$.
  The $O \( 1 \/ n \)$ term is allowed by that theorem, so its limiting covariance is $t^2 \/ 2$.
  The partition function here is the unnormalized sum over configurations.

This route does not need the zero-temperature variational formula,
  even for existence of the limit defining $P_(*)$. Put $A_n =
  n^(- 1) bb(E) max_sigma h_(n \, J) \( sigma \)$ and let $F_(n \, beta_0)$ denote the finite-$n$ expression on
  the right of (8.2). The elementary log-sum bounds give

$ F_(n \, beta_0) - frac(log 2, beta_0) lt.eq A_n lt.eq F_(n \, beta_0) . $

For every fixed finite $beta_0$, the Parisi formula gives convergence of $F_(n \, beta_0)$.
  Hence $limsup_n A_n - liminf_n A_n lt.eq \( log 2 \) \/ beta_0$.
  Letting $beta_0$ tend to infinity proves convergence of $A_n$ and yields

#[#set math.equation(numbering: n => "(8.3)")
 $ P_(*) lt.eq F_(beta_0) lt.eq P_(*) + frac(log 2, beta_0) . $ <eq:positive-free-energy-bounds>]

A direct zero-temperature variational formula is also known [2] Theorem 1;
  the argument here needs only the positive-temperature formula and the preceding squeeze.
  We use the following precise finite-temperature facts. In the conventions of [16], they are Theorem 1.1,
  Lemma 2.2, Proposition 2.4, and Lemma 2.5, respectively:

+ If $beta_0 > 1$, there is $q = q_(beta_0) in \( 0 \, 1 \)$ such that $"supp" mu_(beta_0) = \[ 0 \, q \]$.
  The restriction below $q$ has a density in $C^oo \( \[ 0 \, q \) \)$; the point $q$ is an atom.
+ If $X$ solves the stochastic differential equation driven by a standard Brownian motion $W$,
  #[#set math.equation(numbering: n => "(8.4)")
   $ upright(d) X_t = gamma \( t \) phi.alt_x \( t \, X_t \) thin upright(d) t + upright(d) W_t \, wide X_0 = 0 \,
     $ <eq:positive-parisi-diffusion>]
  then $bb(E) phi.alt_x \( t \, X_t \)^2 = t$ for every $t in "supp" mu_(beta_0)$.
+ All positive-order spatial derivatives of $phi.alt$ are bounded and jointly continuous on $\[ 0 \, 1 \] times
  bb(R)$. The function $phi.alt$ is even in $x$, $\| phi.alt_x \| lt.eq 1$, and $phi.alt_(x x) > 0$.
  These regularity statements also follow from [1] Propositions 1–2 and Appendix Proposition 5,
  (66) after the same change of variables.
+ Differentiating the PDE along (8.4) gives $upright(d) phi.alt_x \( t \, X_t \) =
  phi.alt_(x x) \( t \, X_t \) thin upright(d) W_t$.

The self-consistency identity $bb(E) phi.alt_x \( t \, X_t \)^2 = t$ at points $t in "supp" mu_(beta_0)$,
  including $t = 0$, also follows from the variational argument of Jagannath and Tobasco [13] Proposition 1.1 and
  Corollary 3.10. To check the conventions, if $u$ denotes the PDE solution with terminal condition $log cosh
  x$ and diffusion coefficient $beta_0^2$ in [16], then $phi.alt \( t \, x \) =
  beta_0^(- 1) #scale(x: 120%, y: 120%)[\(] u \( t \, beta_0 x \) + log 2 #scale(x: 120%, y: 120%)[\)]$.
  In particular, the full-support input used here concerns positive temperature;
  no support property of a limiting zero-temperature minimizer is assumed.
  The version of [16] used here is version 3: its Hamiltonian is written with independent Gaussian terms over all
  ordered pairs. Combining the two terms for each unordered pair gives the normalization (1.1);
  the diagonal terms form a centered, configuration-independent Gaussian.
  They have zero contribution to expected pressure and do not change the Parisi minimizer.

Write

#[#set math.equation(numbering: n => "(8.5)")
 $ m \( t \, x \) = phi.alt_x \( t \, x \) \, wide a \( t \, x \) = phi.alt_(x x) \( t \, x \) \, wide
   b \( t \, x \) = gamma \( t \) m \( t \, x \) . $ <eq:classical-coefficients>]

On every $\[ 0 \, T \]$ with $T < q$, these functions have bounded spatial derivatives of every order.
  They are also Lipschitz in time there: the density statement makes $gamma$ smooth on $\[ 0 \, T \]$,
  and the PDE expresses the time derivatives of $m$ and $a$ in terms of bounded spatial derivatives.
  In particular, $a$ and $b$ are bounded and globally Lipschitz in $x$, uniformly on $\[ 0 \, T \]$.
  The function $a$ is even in $x$ and $b$ is odd.

#thm([Lemma 8.1.])[
  (A positive-temperature value bound).  #emph[For every $beta_0 > 1$ and $0 < T < q$,
#[#set math.equation(numbering: n => "(8.6)")
 $ integral_0^T bb(E) a \( t \, X_t \) thin upright(d) t gt.eq P_(*) -
   frac(1 \/ 4 + log 2, beta_0) - \( q - T \) . $ <eq:positive-temperature-bound>]

 Moreover,
#[#set math.equation(numbering: n => "(8.7)")
 $ bb(E) a \( t \, X_t \)^2 = 1 quad \( 0 lt.eq t lt.eq q \) \, wide 1 - q lt.eq
   beta_0^(- 1) . $ <eq:parisi-normalization-and-endpoint>]

]
] <lem:positive-temperature-bound>

#proof[
  Symmetry gives $m \( 0 \, 0 \) = 0$. The martingale identity and Itô isometry therefore give
  $ bb(E) m \( t \, X_t \)^2 = integral_0^t bb(E) a \( s \, X_s \)^2 thin upright(d) s . $
  The left-hand side equals $t$ on $\[ 0 \, q \]$. Continuity and boundedness of $a$,
    together with continuity of $X$, prove the first assertion of (8.7), including both endpoints.
  Since $gamma = beta_0$ on $\[ q \, 1 \]$, the Cole–Hopf formula gives
  #[#set math.equation(numbering: n => "(8.8)")
   $ phi.alt \( q \, x \) = 1 / beta_0 log #scale(x: 120%, y: 120%)[\(] 2 cosh \( beta_0 x \)
     #scale(x: 120%, y: 120%)[\)] + frac(beta_0 \( 1 - q \), 2) \, quad m \( q \, x \) = tanh \( beta_0 x \) \,
     quad a \( q \, x \) = beta_0 "sech"^2 \( beta_0 x \) . $ <eq:parisi-endpoint-formula>]
  Thus, by Cauchy–Schwarz and the identity just proved,
  $ 1 - q = bb(E) "sech"^2 \( beta_0 X_q \) lt.eq #scale(x: 120%, y: 120%)[\(] bb(E) "sech"^4 \( beta_0 X_q \)
    #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) = beta_0^(- 1) . $
  Itô’s formula applied to $X_t m \( t \, X_t \)$ and $phi.alt \( t \, X_t \)$ yields
  $ integral_0^q bb(E) a \( t \, X_t \) thin upright(d) t & = bb(E) X_q m \( q \, X_q \) -
    integral_0^q t gamma \( t \) thin upright(d) t \,\
bb(E) phi.alt \( q \, X_q \) & = phi.alt \( 0 \, 0 \) + 1 / 2 integral_0^q t gamma \( t \) thin upright(d) t . $
  The stochastic integrals have mean zero because $a \, m \, b$ are bounded and $X$ has finite moments.
    The elementary inequality
  $ x tanh \( beta_0 x \) gt.eq 1 / beta_0 log #scale(x: 120%, y: 120%)[\(] 2 cosh \( beta_0 x \)
    #scale(x: 120%, y: 120%)[\)] - frac(log 2, beta_0) $
  follows, for example, by differentiating the difference for $x gt.eq 0$ and using evenness.
    Substitution of (8.8) consequently gives
  $ integral_0^q bb(E) a \( t \, X_t \) thin upright(d) t & gt.eq phi.alt \( 0 \, 0 \) - 1 /
    2 integral_0^q t gamma \( t \) thin upright(d) t - frac(beta_0 \( 1 - q \), 2) - frac(log 2, beta_0)\
 & = F_(beta_0) - frac(beta_0 \( 1 - q \)^2, 4) - frac(log 2, beta_0)\
 & gt.eq P_(*) - frac(1 \/ 4 + log 2, beta_0) . $
  Finally $0 lt.eq bb(E) a \( t \, X_t \) lt.eq \( bb(E) a \( t \, X_t \)^2 \)^(1 \/ 2) = 1$ on $\[ 0 \, q \]$,
    so removing $\[ T \, q \]$ costs at most $q - T$. ◻
]

=== 8.2 The finite-iteration tree calculation <the-finite-iteration-tree-calculation>

Here we state the finite-step input from El Alaoui, Montanari,
  and Sellke with the indices and normalizations needed below.
  It is the general calculation in [9] Sections 2–4.1, not that paper’s zero-temperature near-optimality theorem.

Fix $beta_0 > 1$ and $0 < T < q$. Choose $delta > 0$ and an integer $L gt.eq 1$ with $L delta lt.eq T$.
  Put $t_r = r delta$. On the $\( D + 1 \)$-regular tree, initialize independent standard Gaussian labels $g_i$
  and set $u_(i arrow.r j)^0 = u_i^0 = g_i$, $A_(i arrow.r j)^(- 1) = 1$.
  Each outgoing column multiplies a message by a coefficient from the preceding step.
  This lag will make its newest Gaussian layer conditionally centered, as verified below.
  For $0 lt.eq r < L$ use the recursions

#[#set math.equation(numbering: n => "(8.9)")
 $ u_(i arrow.r j)^(r + 1) & = 1 / sqrt(D) sum_(v in partial i \\ { j }) A_(v arrow.r i)^(r - 1)
   u_(v arrow.r i)^r \, & u_i^(r + 1) & = 1 / sqrt(D + 1) sum_(v in partial i) A_(v arrow.r i)^(r - 1)
   u_(v arrow.r i)^r \,\
x_(i arrow.r j)^(r + 1) & = x_(i arrow.r j)^r + delta b \( t_r \, x_(i arrow.r j)^r \) +
  sqrt(delta) thin u_(i arrow.r j)^(r + 1) \, & x_(i arrow.r j)^0 & = sqrt(delta) thin g_i \,\
x_i^(r + 1) & = x_i^r + delta b \( t_r \, x_i^r \) + sqrt(delta) thin u_i^(r + 1) \, & x_i^0 & =
  sqrt(delta) thin g_i . $ <eq:eams-message-recursion>]

The coefficients, for $0 lt.eq r lt.eq L$, are

#[#set math.equation(numbering: n => "(8.10)")
 $ c_(D \, r) & = #scale(x: 120%, y: 120%)[\(] bb(E) a \( t_r \, x_(i arrow.r j)^r \)^2
   #scale(x: 120%, y: 120%)[\)]^(- 1 \/ 2) \, & A_(i arrow.r j)^r & =
   c_(D \, r) a \( t_r \, x_(i arrow.r j)^r \) \, & B_i^r & = c_(D \, r) a \( t_r \, x_i^r \) \,\
z_i^L & = sqrt(delta) sum_(r = 1)^L B_i^(r - 1) u_i^r . $ <eq:eams-finite-normalization>]

The same constant, computed from the directed-edge law, occurs in $A^r$ and $B^r$. Its definition is recursive:
  $x_(i arrow.r j)^r$ has already been constructed when $c_(D \, r)$ is chosen.
  Strict positivity of $a$ ensures every denominator is positive.

The one-step lag in $A^(r - 1) u^r$ is important. Let $cal(G)_(i arrow.r j)^r$ be the sigma-field of Gaussian
  labels at distance at most $r$ from $i$ in the component left after deleting ${ i \, j }$,
  including the label at $i$. The variables $x_(i arrow.r j)^(r - 1)$ and $A_(i arrow.r j)^(r - 1)$ are
  $cal(G)_(i arrow.r j)^(r - 1)$-measurable. The next message is linear in the Gaussian labels on the new outer
  layer. More precisely, [9] Lemma 3.2 gives, for $r gt.eq 1$,

#[#set math.equation(numbering: n => "(8.11)")
 $ u_(i arrow.r j)^r divides cal(G)_(i arrow.r j)^(r - 1) & tilde.op N #scale(x: 120%, y: 120%)[\(]
   0 \, \( tau_(i arrow.r j)^r \)^2 #scale(x: 120%, y: 120%)[\)] \,\
\( tau_(i arrow.r j)^(r + 1) \)^2 & = 1 /
  D sum_(v in partial i \\ { j }) \( A_(v arrow.r i)^(r - 1) \)^2 \( tau_(v arrow.r i)^r \)^2 \, wide tau^0 =
  1 . $ <eq:eams-conditional-innovation>]

The variance recursion also holds at $r = 0$. Thus $A^(r - 1)
  u^r$ has conditional mean zero given this earlier cavity history.
  Its variance may depend on that history; finite-degree independence of successive messages is not being
  asserted. For $r = 0$ the sent column is simply $g_i$.

Let $U_0 \, U_1 \, dots.h$ be independent standard Gaussians and define

#[#set math.equation(numbering: n => "(8.12)")
 $ X_0^delta & = sqrt(delta) thin U_0 \, & X_(r + 1)^delta & = X_r^delta + delta b \( t_r \, X_r^delta \) +
   sqrt(delta) thin U_(r + 1) \,\
c_(delta \, r) & = #scale(x: 120%, y: 120%)[\(] bb(E) a \( t_r \, X_r^delta \)^2
  #scale(x: 120%, y: 120%)[\)]^(- 1 \/ 2) \, & Z_L^delta & =
  sqrt(delta) sum_(r = 1)^L c_(delta \, r - 1) a \( t_(r - 1) \, X_(r - 1)^delta \) U_r . $ <eq:eams-limit-euler>]

At fixed $beta_0 \, T \, delta \, L$, the update functions and constants $c_(delta \, r)$ are deterministic.
  The variables $X_r^delta$ and $Z_L^delta$ are random functions of the displayed Gaussian family.

#thm([Lemma 8.2.])[
  (Finite-step limit).  #emph[For the preceding construction, as $D arrow.r oo$ at fixed $delta \, L$,
#[#set math.equation(numbering: n => "(8.13)")
 $ c_(D \, r) & arrow.r c_(delta \, r) \, wide 0 lt.eq r lt.eq L \,\
\( u_i^0 \, dots.h \, u_i^L \) & arrow.r.double \( U_0 \, dots.h \, U_L \) \, wide z_i^L arrow.r.double Z_L^delta \,\
lim_(D arrow.r oo) frac(D + 1, 2 sqrt(D)) bb(E) z_o^L z_v^L & =
  delta sum_(r = 1)^(L - 1) c_(delta \, r) bb(E) a \( t_r \, X_r^delta \) \, wide
  o tilde.op v . $ <eq:eams-normalizer-limit>]

 The sum in (8.13) is empty when $L = 1$. The distributional statements include convergence of every fixed moment.
   The analogous joint Gaussian limit holds for a directed edge. Moreover $bb(E) \( Z_L^delta \)^2 = L delta$.]
] <lem:eams-finite-step>

#proof[
  We use the bounded-coefficient CLT and edge calculation in [9] Assumptions 2–3, Theorem 3.1, Proposition 2.1,
    and Lemmas 4.2–4.3. The verification below has two parts:
    first the degree-dependent normalizers and moment bounds, then the edge value with its finite-step index.
    The functions $a \( t_r \, dot.op \)$ are bounded and Lipschitz, the drift is Lipschitz,
    and only finitely many $r$ occur. Initially $c_(D \, 0) = c_(delta \, 0)$,
    and $x^r$ uses normalizers only through index $r - 2$, so the normalization induction is not circular.
    Inductively, the Gaussian limit of the preceding messages and bounded continuity of $a^2$ give
  $ bb(E) a \( t_r \, x_(i arrow.r j)^r \)^2 arrow.r bb(E) a \( t_r \, X_r^delta \)^2 > 0 . $
  Thus $c_(D \, r)$ converges, and the normalized coefficients and their Lipschitz constants are bounded uniformly
    for all sufficiently large $D$. This verifies the boundedness and normalization hypotheses used in the
    finite-step CLT, including when its coefficients depend on $D$.
    One may equivalently run its induction with this triangular sequence:
    convergent deterministic coefficients do not affect any induction step.
    All fixed moments are uniformly bounded. Indeed, an update sums the columns $A_(v arrow.r i)^(r - 1)
    u_(v arrow.r i)^r$ from disjoint child cavity trees. They are independent across children and centered by
    (8.11); the bounded multiplier is measurable before the innovation it multiplies.
    In this application their marginal centering also follows from seed parity, since $a$ is even and $b$ is odd.
    The moment inequality for sums of independent centered variables gives, for each integer $k gt.eq 2$,
  $ bb(E) lr(|D^(- 1 \/ 2) sum_(j = 1)^D Y_j|)^k lt.eq
    C_k (\( bb(E) Y_1^2 \)^(k \/ 2) + D^(1 - k \/ 2) bb(E) \| Y_1 \|^k) . $
  Induction over the finite number of updates proves uniform bounds of every order.
    They imply uniform integrability and hence the asserted moment convergence.
    The $x$ and $z$ conclusions follow from their continuous, polynomial-growth expressions in the messages.
  For the energy, put
  $ R_(D \, ell) =
    bb(E)
    [B_o^(ell - 1) B_v^(ell - 1) A_(o arrow.r v)^(ell - 2) A_(v arrow.r o)^(ell - 2) u_(o arrow.r v)^(ell - 1)
    u_(v arrow.r o)^(ell - 1)] . $
  Proposition 2.1 of [9], with its degree $k = D + 1$, is the exact identity
  #[#set math.equation(numbering: n => "(8.14)")
   $ frac(D + 1, 2 sqrt(D)) bb(E) z_o^L z_v^L & = delta sum_(ell = 2)^L bb(E)
     [A_(v arrow.r o)^(ell - 2) \( u_(v arrow.r o)^(ell - 1) \)^2 B_o^(ell - 1) B_v^(ell - 2)]\
 & quad + frac(delta, 2 sqrt(D)) sum_(ell = 1)^L R_(D \, ell) . $ <eq:eams-exact-edge-expansion>]
  The second line is $O \( D^(- 1 \/ 2) \)$ by the fixed moment bounds.
    To compare node and cavity terms, split off the missing neighbor:
  $ u_i^r = sqrt(frac(D, D + 1)) thin u_(i arrow.r j)^r +
    frac(A_(j arrow.r i)^(r - 2) u_(j arrow.r i)^(r - 1), sqrt(D + 1)) wide \( 1 lt.eq r lt.eq L \) . $
  Its squared difference from $u_(i arrow.r j)^r$ is $O \( D^(- 1) \)$.
    The two Euler recursions and the spatial Lipschitz bounds therefore give,
    by induction over this fixed finite number of steps,
  #[#set math.equation(numbering: n => "(8.15)")
   $ bb(E) \| x_i^r - x_(i arrow.r j)^r \|^2 + bb(E) \| B_i^r - A_(i arrow.r j)^r \|^2 lt.eq C /
     D . $ <eq:eams-node-cavity-bound>]
  These are the comparisons in Lemma 4.2 of [9]; in particular,
    the use of the spatial Lipschitz bound for $a$ is explicit.
  Here is the reduction in Lemma 4.3 of that paper in our indices.
    Set $s = ell - 1$ and $H = A_(v arrow.r o)^(s - 1) B_v^(s - 1) B_o^s$.
    This product depends only on the depth-$\( s - 1 \)$ cavity labels on the $v$ side and the depth-$s$ cavity
    labels on the $o$ side. Conditioning on these labels in (8.11) therefore gives
  $ bb(E) #scale(x: 120%, y: 120%)[\[] H \( \( u_(v arrow.r o)^s \)^2 - 1 \) #scale(x: 120%, y: 120%)[\]] =
    bb(E) #scale(x: 120%, y: 120%)[\[] H \( \( tau_(v arrow.r o)^s \)^2 - 1 \) #scale(x: 120%, y: 120%)[\]] . $
  The variance estimate in [9] Lemmas 3.2–3.4 is uniform for the present normalizers.
    Indeed, if $K gt.eq 1$ bounds the coefficients at the fixed horizon and $Delta_r =
    bb(E) \[ \( \( tau_(i arrow.r j)^r \)^2 - 1 \)^2 \]$, its proof uses only the variance recursion,
    independence of child cavities, and the exact normalization $bb(E) \( A_(i arrow.r j)^r \)^2 = 1$ to give
  $ Delta_(r + 1) lt.eq 2 K^4 Delta_r + frac(2 \( K^4 + 1 \), D) \, wide Delta_0 = 0 . $
  Thus $Delta_s = O \( D^(- 1) \)$, and the preceding conditional expectation is $O \( D^(- 1 \/ 2) \)$ by
    Cauchy–Schwarz. Replacing the two node coefficients by their cavity counterparts using (8.15) now yields
  $ bb(E) #scale(x: 120%, y: 120%)[\[] H \( u_(v arrow.r o)^s \)^2 #scale(x: 120%, y: 120%)[\]] & =
    bb(E) #scale(x: 120%, y: 120%)[\[] A_(o arrow.r v)^s \( A_(v arrow.r o)^(s - 1) \)^2
    #scale(x: 120%, y: 120%)[\]] + O \( D^(- 1 \/ 2) \)\
 & = bb(E) A_(o arrow.r v)^s thin bb(E) #scale(x: 120%, y: 120%)[\[] \( A_(v arrow.r o)^(s - 1) \)^2
   #scale(x: 120%, y: 120%)[\]] + O \( D^(- 1 \/ 2) \)\
 & = bb(E) B_o^s + O \( D^(- 1 \/ 2) \) . $
  The middle equality uses the exact independence of the two cavity trees,
    and the last uses their coefficient normalization and one more node-to-cavity comparison.
    This proves the quantitative replacement without a convergence rate for $c_(D \, r)$.
    All constants here may depend on $delta \, L \, beta_0 \, T$, which are fixed.
    Taking the degree limit and setting $r = ell - 1$ proves (8.13).#footnote[Our index convention is fixed by
    (8.10). The finite sums printed in [9] (4.5), (4.18) use the shifted endpoints $2 \, dots.h \, L$;
    the preceding exact identity and Lemma 4.3 give $1 \, dots.h \, L - 1$.
    The endpoint difference vanishes in the continuum limit below.
    The exact identity we use is Proposition 2.1; the same-time display in its Lemma 2.8 lacks the factor $1 \/
    k$ present in that proposition and in the lemma’s proof.] Finally,
    the coefficients multiplying $U_r$ in (8.12) are measurable with respect to $U_0 \, dots.h \, U_(r - 1)$.
    Orthogonality of martingale increments and the definition of $c_(delta \, r - 1)$ give
    $bb(E) \( Z_L^delta \)^2 = delta sum_(r = 1)^L 1 = L delta$. ◻
]

The degree limit has identified the scalar law $Z_L^delta$ and the finite-tree edge limit in (8.13).
  We next compare these two quantities with the Parisi diffusion at the fixed temperature.
  The symmetric-power argument in the following subsection will then realize the same finite formula as a rooted
  vector, so that its energy can be used in the clipping and synthesis steps.
  The normalized Euler and martingale comparison below is related to [8] Proposition 5.3.
  We give the estimates for the present fixed-temperature tree construction.

#thm([Lemma 8.3.])[
  (The continuum limit at fixed temperature).  #emph[Fix $beta_0 > 1$ and $0 < T < q$, and let $L =
    floor.l T \/ delta floor.r$. There is a coupling with the diffusion (8.4) and a constant $C =
    C \( beta_0 \, T \)$ such that, for all sufficiently small $delta$,
#[#set math.equation(numbering: n => "(8.16)")
 $ max_(r delta lt.eq T) bb(E) \| X_r^delta - X_(r delta) \|^2 & lt.eq
   C delta \, & max_(r delta lt.eq T) \| c_(delta \, r) - 1 \| & lt.eq C sqrt(delta) \,\
bb(E) \| Z_L^delta - m \( T \, X_T \) \|^2 & lt.eq C delta \,\
lr(|delta sum_(r = 1)^(L - 1) c_(delta \, r) bb(E) a \( t_r \, X_r^delta \) - integral_0^T bb(E) a \( t \, X_t \)
  thin upright(d) t|) & lt.eq C sqrt(delta) . $ <eq:euler-normalization-bound>]

]
] <lem:eams-positive-continuum>

#proof[
  Take $U_0$ independent of $W$ and $sqrt(delta) thin U_r = W_(r delta) - W_(\( r - 1 \) delta)$ for $r gt.eq 1$.
    Let $tau_delta \( t \) = delta floor.l t \/ delta floor.r$ and use the continuous Euler interpolation
  $ overline(X)_t^delta = sqrt(delta) thin U_0 + integral_0^t
    b \( tau_delta \( s \) \, X_(floor.l s \/ delta floor.r)^delta \) thin upright(d) s + W_t . $
  The drift is bounded and Lipschitz in space and time on $\[ 0 \, T \]$.
    Hence $bb(E) \| overline(X)_s^delta - X_(floor.l s \/ delta floor.r)^delta \|^2 lt.eq C delta$.
    Subtracting the integral equations for $X$ and $overline(X)^delta$, using Cauchy–Schwarz, and then Gronwall gives
  $ bb(E) sup_(s lt.eq T) \| overline(X)_s^delta - X_s \|^2 lt.eq C delta . $
  The initial contribution is $bb(E) \| sqrt(delta) U_0 \|^2 = delta$. This proves the first bound of (8.16).
  Because $a$ is bounded and spatially Lipschitz, and $bb(E) a \( t_r \, X_(t_r) \)^2 = 1$,
  $ max_(r delta lt.eq T) lr(|bb(E) a \( t_r \, X_r^delta \)^2 - 1|) lt.eq C sqrt(delta) . $
  For small $delta$ all these expectations lie in $\[ 1 \/ 2 \, 3 \/ 2 \]$.
    The map $x mapsto x^(- 1 \/ 2)$ is Lipschitz on that interval, proving the second bound of (8.16).
  Equation (8.12) is the stochastic integral
  $ Z_L^delta = integral_0^(L delta) c_(delta \, floor.l t \/ delta floor.r)
    a \( tau_delta \( t \) \, X_(floor.l t \/ delta floor.r)^delta \) thin upright(d) W_t . $
  The integrand differs from $a \( t \, X_t \)$ in squared mean by at most $C delta$, uniformly in $t lt.eq
    L delta$. This follows from (8.16), the spatial and temporal Lipschitz bounds for $a$, and $bb(E) \| X_t -
    X_(tau_delta \( t \)) \|^2 lt.eq C delta$. Itô isometry, including the last interval of length at most
    $delta$, gives (8.16), since $m \( T \, X_T \) = integral_0^T a \( t \, X_t \) thin upright(d) W_t$.
    The same estimates in first mean compare the sum in (8.16) with its Riemann integral.
    The omitted first and last intervals have total length at most $3 delta$ and bounded integrands.
    This proves the final estimate. ◻
]

=== 8.3 Strong convergence of classical descendant formulas <strong-convergence-of-classical-descendant-formulas>

We next place this classical construction in the Hilbert space used by Proposition 4.
  This step requires norm convergence, not only a CLT in distribution.

We use the Gaussian lift $sans(G)$ of Section 2.3 and the finite descendant formulas of Definition 6.
  In the directed EAMS calculation the sent columns are $A^(r - 1) u^r$, with $u^0 = g$ for the first propagation.
  The node output uses these same columns. Replacing $D + 1$ root children by $D$,
  or the final normalization $sqrt(D + 1)$ by $sqrt(D)$, does not change the limiting formula.

#thm([Lemma 8.4.])[
  (The symmetric-power realization).  #emph[Consider a fixed finite descendant formula whose pointwise functions
    are smooth with all derivatives of polynomial growth. Assume its leaf seeds have moments of every order and
    every aggregated child column has mean zero under its finite-degree child law for each $D$.
    Its finite-degree root vector converges in norm, under the symmetric occupation embeddings,
    to the formula obtained by replacing every normalized sum by $sans(G)$.
    The same conclusion holds for a convergent finite collection of deterministic coefficients in the formula.
    The finite-degree root vectors have a uniformly bounded first child-occupation moment.
    Consequently, for centered equivariant outputs $f_D$ and their limit $f$,
#[#set math.equation(numbering: n => "(8.17)")
 $ lim_(D arrow.r oo) frac(D + 1, 2 sqrt(D)) bb(E) f_D \( o \) f_D \( v \) = cal(E) \( f \) \, wide
   o tilde.op v . $ <eq:classical-energy-transfer>]

]
] <lem:classical-strong-limit>

#proof[
  The proof first treats characteristic vectors, then arbitrary pointwise maps,
    and finally the occupation bound needed for energy. We use induction on formula depth.
    All intermediate moments are uniformly bounded: normalized centered sums satisfy the moment bound used in
    Lemma 37, and polynomial-growth functions preserve the existence of sufficiently high uniform moments.
  Suppose the real centered child columns $f_(D \, 1) \, dots.h \, f_(D \, k)$ already converge in norm to $f_1 \,
    dots.h \, f_k$ in the common child Hilbert space. Fix $t in bb(R)^k$ and put $F_D = sum_j t_j f_(D \, j)$,
    $F = sum_j t_j f_j$. The limits are centered because the embeddings preserve the vacuum and the convergence is
    in norm. A joint characteristic vector for the parent sums is the symmetric tensor power of
  $ h_D = exp \( upright(i) F_D \/ sqrt(D) \) bold(Omega) = alpha_D bold(Omega) + zeta_D \, wide
    zeta_D perp bold(Omega) . $
  Taylor expansion in $L^2$, justified by the uniform fourth moment, and centering give
  $ alpha_D = 1 - frac(lr(bar.v.double F_D bar.v.double)^2, 2 D) + O \( D^(- 3 \/ 2) \) \, wide
    sqrt(D) thin zeta_D arrow.r upright(i) F . $
  The $j$-particle component of the embedded tensor power is
  $ binom(D, j)^(1 \/ 2) alpha_D^(D - j) zeta_D^(⊗ j) arrow.r
    e^(- lr(bar.v.double  bar.v.double) F^2 \/ 2) frac(\( upright(i) F \)^(⊗ j), sqrt(j !)) . $
  These are the components of $e^(upright(i) q \( F \)) bold(Omega)$.
    The expected occupation of the left-hand vector is $D lr(bar.v.double zeta_D bar.v.double)^2 = O \( 1 \)$,
    so its occupation tails are uniformly small. Thus convergence of each fixed grade implies norm convergence of
    the complete vector. A root with $M = D + 1$ children has the same proof:
    use $M$ factors and the normalization $M^(- 1 \/ 2)$, with the same convergent child columns.
    Alternatively, retaining $D^(- 1 \/ 2)$ at that root gives the same limit because $M \/ D arrow.r 1$.
    The occupation bound in either convention is $M lr(bar.v.double zeta_D bar.v.double)^2 = O \( 1 \)$.
  Finite linear combinations of these exponentials, multiplied by bounded measurable functions of the independent
    root seed, are dense in the limiting $L^2$ space. Indeed the root seed and aggregate fields have a product
    law. Products of dense families in the two factors are dense, and exponentials are dense in the field factor:
    an orthogonal $L^2$ vector would give a finite signed measure with zero Fourier transform and would therefore
    vanish. There is a useful precision concerning measurable seed factors.
    Let $S$ denote the root seed, $Y_D$ the finite list of aggregate fields, and $Y$ its limit.
    The law of $S$ is unchanged with $D$ and is independent of $Y_D$ and $Y$.
    For $P \( s \, y \) = sum_j g_j \( s \) e^(upright(i) t_j dot.op y)$ with bounded measurable $g_j$,
    and a bounded target $F \( s \, y \)$ continuous in $y$ for every fixed $s$, the function $\| F \( s \, y \) -
    P \( s \, y \) \|^2$ is bounded continuous in $y$ for each fixed $s$.
    Weak convergence of $Y_D$ therefore gives convergence of its field integral pointwise in $s$.
    The bound is uniform in $s$, so dominated convergence in the unchanged root-seed law proves
  $ bb(E) \| F \( S \, Y_D \) - P \( S \, Y_D \) \|^2 arrow.r bb(E) \| F \( S \, Y \) - P \( S \, Y \) \|^2 . $
  Thus measurability of $g_j$ does not require a discontinuous test function in an appeal to joint weak
    convergence. For a polynomial-growth target, first multiply by smooth cutoffs outside large boxes in the seed
    and field variables. The cutoffs preserve continuity in the field variables,
    and uniform higher moments make the discarded squared norms uniformly small. This proves the induction step.
    It also proves continuity in deterministic coefficients, by applying the same argument to a convergent
    sequence of them.
  For completeness, the occupation bound is not a consequence of the CLT alone.
    At a parent, let $P_j$ average over the $j$th child, and write its output as
    $H_D \( s \, S_(D \, 1) \, dots.h \, S_(D \, k) \)$, where $S_(D \, l) =
    D^(- 1 \/ 2) sum_j f_(D \, l)^(\( j \))$. The occupation operator in the symmetric embedding is $N_D =
    sum_(j = 1)^D \( I - P_j \)$. With an independent replacement of child $j$,
    conditional variance and the mean-value theorem give
  $ lr(bar.v.double \( I - P_j \) H_D bar.v.double)^2 lt.eq bb(E) \| H_D - H_D^(\( j \)) \|^2 lt.eq C / D . $
  Here the derivative of $H_D$ has polynomial growth and the sums, the replaced child columns,
    and their products have the uniform moments established above;
    Hölder’s inequality therefore gives a constant independent of $j \, D$.
    Summing proves $chevron.l H_D \, N_D H_D chevron.r lt.eq C$.
    If needed, the same argument with distinct child replacements and mixed derivatives bounds the factorial
    moments of $N_D$ of every fixed order.
  The energy identity is now Proposition 4 applied to these classical vectors.
    More explicitly, with $M = D + 1$ root children, the projection onto an excitation in a distinguished child
    has norm at most $C \/ sqrt(M)$ by symmetry and the occupation estimate.
    The term with excitations across the distinguished edge on both sides is therefore $O \( M^(- 1) \)$.
    The two terms with only one crossing select a single child;
    after multiplication by $sqrt(M)$ they converge to $chevron.l f \, sans(L) f chevron.r$ and its conjugate.
    The term with neither crossing is zero by centering. The factor $M \/ \( 2 sqrt(D) \)$ in (8.17) thus gives
    $"Re" chevron.l f \, sans(L) f chevron.r$, since $M \/ D arrow.r 1$. ◻
]

Apply this lemma to the EAMS formulas at fixed $delta \, L$.
  All sent columns are odd under simultaneous reversal of the seed labels, since $a$ is even and $b$ is odd.
  They are therefore centered under each finite-degree child law, as required by the lemma.
  The smooth polynomial-growth hypotheses hold because a transmitted column is a bounded smooth coefficient times
  a message variable. Equation (8.13) and the coefficient-continuity assertion allow us to replace $c_(D \, r)$ by
  the fixed limiting constants $c_(delta \, r)$ in the limiting formula. Let its output vector be $z^delta$. We obtain

#[#set math.equation(numbering: n => "(8.18)")
 $ cal(E) \( z^delta \) = delta sum_(r = 1)^(L - 1) c_(delta \, r) bb(E) a \( t_r \, X_r^delta \) \, quad
   lr(bar.v.double z^delta bar.v.double)^2 = L delta \, quad z^delta med
   upright("has law ") Z_L^delta . $ <eq:classical-eams-vector>]

All coefficients in this vector are independent of degree.

=== 8.4 Clipping and finite bounded formulas <clipping-and-finite-bounded-formulas>

Let $pi \( x \) = max \( - 1 \, min \( x \, 1 \) \)$. Since $\| m \( T \, X_T \) \| lt.eq 1$,
  the law in (8.18) and the metric projection property give

$ lr(bar.v.double z^delta - pi \( z^delta \) bar.v.double)^2 = bb(E) \| Z_L^delta - pi \( Z_L^delta \) \|^2 lt.eq
  bb(E) \| Z_L^delta - m \( T \, X_T \) \|^2 . $

Only the marginal law of $Z_L^delta$ enters the equality.
  The diffusion coupling bounds this scalar clipping error;
  the energy of $z^delta$ has already been identified separately in the rooted space by (8.18).
  Consequently, by Lemma 38, $lr(bar.v.double z^delta - pi \( z^delta \) bar.v.double) lt.eq C sqrt(delta)$.
  We apply the shared energy-continuity estimate (3.7) with $f = z^delta$ and $g = pi \( z^delta \)$;
  both norms are at most one. Combining (8.6), (8.16), and (8.18) proves the following:
  for every $epsilon > 0$, first choosing a sufficiently large finite $beta_0$,
  then $T < q$ sufficiently close to $q$, and finally a sufficiently small positive $delta$,
  gives a centered odd classical vector

#[#set math.equation(numbering: n => "(8.19)")
 $ m^(*) = pi \( z^delta \) \, wide \| m^(*) \| lt.eq 1 \, wide cal(E) \( m^(*) \) gt.eq P_(*) -
   epsilon . $ <eq:clipped-classical-vector>]

At this point the depth $L$ and the entire descendant calculation are finite and fixed.

The next proposition completes this route using only the common bounded-approximation and exclusion lemmas.
  It gives the same conclusion as Proposition 21, with an independent proof from the clipped vector just constructed.

#thm([Proposition 8.5.])[
  (The independent positive-temperature construction).  #emph[For every $epsilon > 0$ and every $eta_H > 0$,
    there are a finite color partition with helper probability $0 < p_H < eta_H$, a finite number of helper types,
    and finite bounded odd angle formulas $theta_c$ on the nonhelper colors such that the following hold.
    Each transmitted column is bounded and odd, every pointwise map may be chosen as a finite trigonometric sum in
    its odd inputs, and every aggregation excludes its current color, all path-ancestor colors, and all helpers.
    Conditional on the finite labels, all continuous derivatives of the pointwise maps are bounded. The output
#[#set math.equation(numbering: n => "(8.20)")
 $ m^(upright("col")) = sum_(c = 1)^M upright(bold(1))_({ C = c }) sin \( 2 theta_c \)
   $ <eq:positive-final-classical-formula>]

 is centered, satisfies $\| m^(upright("col")) \| lt.eq 1$, vanishes on helper roots, and obeys
#[#set math.equation(numbering: n => "(8.21)")
 $ cal(E) \( m^(upright("col")) \) gt.eq P_(*) - epsilon . $ <eq:positive-final-classical-value>]

 After the uncolored finite formula has been fixed, the total helper probability may be taken arbitrarily small,
   with all individual helper probabilities positive. All depths, coefficients, label laws,
   and functions in the conclusion are fixed independently of degree, system size, and disorder.]
] <prop:classical-near-optimum-positive-temperature>

#proof[
  Use (8.19) with error $epsilon \/ 3$. Its underlying formula $z^delta$ has odd transmitted columns and jointly
    odd smooth local maps with polynomial-growth derivatives, as checked after Lemma 39.
    It therefore meets the hypotheses of Lemma 18. Apply that lemma and then Lemma 20 with the choices in the
    proof of Proposition 21: the first output error is less than $epsilon \/ 12$ in norm,
    the second less than $epsilon \/ 6$, and one positive-probability helper is reserved per propagation depth
    with total probability below $eta_H$. The two further energy losses are less than $epsilon \/
    6$ and $epsilon \/ 3$, respectively, by (3.7). Their sum with the initial loss is less than $epsilon$.
    Those two shared lemmas also give the boundedness, trigonometric form, exclusions, and parity asserted here.
    The entire formula and all helper probabilities are fixed after the degree limit of the finite calculation. ◻
]

#heading(level: 1)[References]
#bibitem([1])[A.~Auffinger and W.-K.~Chen, #emph[On properties of Parisi measures],
  Probability Theory and Related Fields #strong[161] (2015), 817--850.
  #link("https://doi.org/10.1007/s00440-014-0563-y")[doi:10.1007/s00440-014-0563-y]\;
  #link("https://arxiv.org/abs/1303.3573v1")[arXiv:1303.3573v1].]
#bibitem([2])[A.~Auffinger and W.-K.~Chen, #emph[Parisi formula for the ground state energy in the mixed $p$-spin
  model], Annals of Probability #strong[45] (2017), no.~6B, 4617--4631.
  #link("https://doi.org/10.1214/16-AOP1173")[doi:10.1214/16-AOP1173]\;
  #link("https://arxiv.org/abs/1606.05335v2")[arXiv:1606.05335v2].]
#bibitem([3])[A.~Auffinger, W.-K.~Chen, and Q.~Zeng, #emph[The SK Model Is Infinite Step Replica Symmetry Breaking
  at Zero Temperature], Communications on Pure and Applied Mathematics #strong[73] (2020), no.~5, 921--943.
  #link("https://doi.org/10.1002/cpa.21886")[doi:10.1002/cpa.21886]\;
  #link("https://arxiv.org/abs/1703.06872v2")[arXiv:1703.06872v2].]
#bibitem([4])[J.~Basso, E.~Farhi, K.~Marwaha, B.~Villalonga, and L.~Zhou,
  #emph[The Quantum Approximate Optimization Algorithm at High Depth for MaxCut on Large-Girth Regular Graphs and
  the Sherrington--Kirkpatrick Model], 17th Conference on the Theory of Quantum Computation,
  Communication and Cryptography, LIPIcs #strong[232] (2022), 7:1--7:21.
  #link("https://doi.org/10.4230/LIPIcs.TQC.2022.7")[doi:10.4230/LIPIcs.TQC.2022.7]\;
  full version #link("https://arxiv.org/abs/2110.14206v3")[arXiv:2110.14206v3].]
#bibitem([5])[S.~Boulebnane, A.~Khan, M.~Liu, J.~Larson, D.~Herman, R.~Shaydulin, and M.~Pistoia,
  #emph[Spin--Boson Mapping of the Quantum Approximate Optimization Algorithm],
  Physical Review Letters #strong[136] (2026), 240601.
  #link("https://doi.org/10.1103/2w94-rymn")[doi:10.1103/2w94-rymn]\;
  #link("https://arxiv.org/abs/2505.07929v2")[arXiv:2505.07929v2].]
#bibitem([6])[H.-B.~Chen, #emph[FRSB in the SK spin glass:
  convergence to full-interval support at zero temperature],
  #link("https://arxiv.org/abs/2607.18032v1")[arXiv:2607.18032v1] (2026).]
#bibitem([7])[A.~Dembo, A.~Montanari, and S.~Sen, #emph[Extremal Cuts of Sparse Random Graphs],
  Annals of Probability #strong[45] (2017), no.~2, 1190--1217.
  #link("https://doi.org/10.1214/15-AOP1084")[doi:10.1214/15-AOP1084]\;
  #link("https://arxiv.org/abs/1503.03923v2")[arXiv:1503.03923v2].]
#bibitem([8])[A.~El Alaoui, A.~Montanari, and M.~Sellke, #emph[Optimization of mean-field spin glasses],
  Annals of Probability #strong[49] (2021), no.~6, 2922--2960.
  #link("https://doi.org/10.1214/21-AOP1519")[doi:10.1214/21-AOP1519]\;
  full version #link("https://arxiv.org/abs/2001.00904v1")[arXiv:2001.00904v1] (2020).]
#bibitem([9])[A.~El Alaoui, A.~Montanari, and M.~Sellke, #emph[Local algorithms for Maximum Cut and Minimum
  Bisection on locally treelike regular graphs of large degree],
  Random Structures & Algorithms #strong[63] (2023), no.~3, 689--715.
  #link("https://doi.org/10.1002/rsa.21149")[doi:10.1002/rsa.21149]\;
  #link("https://arxiv.org/abs/2111.06813v2")[arXiv:2111.06813v2].]
#bibitem([10])[E.~Farhi, J.~Goldstone, and S.~Gutmann, #emph[A Quantum Approximate Optimization Algorithm],
  #link("https://arxiv.org/abs/1411.4028v1")[arXiv:1411.4028v1] (2014).]
#bibitem([11])[E.~Farhi, J.~Goldstone, S.~Gutmann, and L.~Zhou,
  #emph[The Quantum Approximate Optimization Algorithm and the Sherrington--Kirkpatrick Model at Infinite Size],
  Quantum #strong[6] (2022), 759.
  #link("https://doi.org/10.22331/q-2022-07-07-759")[doi:10.22331/q-2022-07-07-759]\;
  #link("https://arxiv.org/abs/1910.08187v4")[arXiv:1910.08187v4].]
#bibitem([12])[F.~Guerra, #emph[Broken Replica Symmetry Bounds in the Mean Field Spin Glass Model],
  Communications in Mathematical Physics #strong[233] (2003), no.~1, 1--12.
  #link("https://doi.org/10.1007/s00220-002-0773-5")[doi:10.1007/s00220-002-0773-5]\;
  #link("https://arxiv.org/abs/cond-mat/0205123v1")[arXiv:cond-mat/0205123v1].]
#bibitem([13])[A.~Jagannath and I.~Tobasco, #emph[Some properties of the phase diagram for mixed $p$-spin
  glasses], Probability Theory and Related Fields #strong[167] (2017), 615--672.
  #link("https://doi.org/10.1007/s00440-015-0691-z")[doi:10.1007/s00440-015-0691-z]\;
  #link("https://arxiv.org/abs/1504.02731v2")[arXiv:1504.02731v2].]
#bibitem([14])[J.~A.~Jones and E.~Knill, #emph[Efficient Refocussing of One Spin and Two Spin Interactions for NMR
  Quantum Computation], Journal of Magnetic Resonance #strong[141] (1999), 322--325.
  #link("https://doi.org/10.1006/jmre.1999.1890")[doi:10.1006/jmre.1999.1890]\;
  #link("https://arxiv.org/abs/quant-ph/9905008v1")[arXiv:quant-ph/9905008v1].]
#bibitem([15])[J.-S.~Li and N.~Khaneja, #emph[Noncommuting vector fields,
  polynomial approximations and control of inhomogeneous quantum ensembles],
  #link("https://arxiv.org/abs/quant-ph/0510012v1")[arXiv:quant-ph/0510012v1] (2005).]
#bibitem([16])[P.~Lopatto, #emph[Full replica symmetry breaking in the Sherrington--Kirkpatrick model],
  #link("https://arxiv.org/abs/2607.11756v3")[arXiv:2607.11756v3] (2026).]
#bibitem([17])[B.~D.~McKay, N.~C.~Wormald, and B.~Wysocka, #emph[Short Cycles in Random Regular Graphs],
  Electronic Journal of Combinatorics #strong[11] (2004), no.~1, R66.
  #link("https://doi.org/10.37236/1819")[doi:10.37236/1819].]
#bibitem([18])[A.~Montanari, #emph[Optimization of the Sherrington--Kirkpatrick Hamiltonian],
  SIAM Journal on Computing #strong[54] (2025), no.~4, FOCS19-1--FOCS19-38.
  #link("https://doi.org/10.1137/20M132016X")[doi:10.1137/20M132016X]\;
  full version #link("https://arxiv.org/abs/1812.10897v2")[arXiv:1812.10897v2] (2019).]
#bibitem([19])[OpenAI, #emph[Full support of the zero-temperature Sherrington--Kirkpatrick order parameter],
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/Full-support-of-the-zero-temperature-Sherrington-Kirkpatrick-order-parameter-September-27-2026/main.pdf")[OAI:Full-support-of-the-zero-temperature-Sherrington-Kirkpatrick-order-parameter-September-27-2026],
  2026.]
#bibitem([20])[G.~Parisi, #emph[Infinite Number of Order Parameters for Spin-Glasses],
  Physical Review Letters #strong[43] (1979), no.~23, 1754--1756.
  #link("https://doi.org/10.1103/PhysRevLett.43.1754")[doi:10.1103/PhysRevLett.43.1754].]
#bibitem([21])[D.~Sels and F.~Morone, #emph[Absence of quantum advantage for approximate spin glass optimization],
  #link("https://arxiv.org/abs/2607.08708v1")[arXiv:2607.08708v1] (2026).]
#bibitem([22])[D.~Sherrington and S.~Kirkpatrick, #emph[Solvable Model of a Spin-Glass],
  Physical Review Letters #strong[35] (1975), no.~26, 1792--1796.
  #link("https://doi.org/10.1103/PhysRevLett.35.1792")[doi:10.1103/PhysRevLett.35.1792].]
#bibitem([23])[M.~Talagrand, #emph[The Parisi formula], Annals of Mathematics #strong[163] (2006), no.~1,
  221--263. #link("https://doi.org/10.4007/annals.2006.163.221")[doi:10.4007/annals.2006.163.221].]
