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

#align(center)[#text(size: 16pt, weight: "bold")[Scale and conformal symmetry in four-dimensional \
operational quantum field theory]]
#align(center)[OpenAI]
#align(center)[September 26, 2026]

== 1 Introduction <sec:introduction>

Scale symmetry constrains correlation functions under uniform changes of length.
  Conformal symmetry also includes special conformal transformations and their local Ward identities.
  The implication from the former to the latter is therefore a statement about the local operator content of a
  theory, not only about the action of a global charge.

For a symmetric conserved stress tensor in four dimensions, a conserved dilatation current has the form

#[#set math.equation(numbering: n => "(1.1)")
 $ D_mu = x^nu T_(mu nu) - V_mu \, wide T^mu zws_mu = partial^mu V_mu . $ <eq:intro-current>]

The problem is to improve $T$ to a traceless tensor without changing its affine charges or leaving the original
  physical field algebra. A sufficient condition is a local scalar $L$ with $T^mu zws_mu = square.stroked L$,
  but the general improvement problem allows tensor potentials.
  Accordingly, a proof must derive the scalar condition if it uses one;
  it cannot impose it as part of the desired conclusion.

Stress-tensor improvements that preserve the Poincaré generators were a central feature of the work of Callan,
  Coleman and Jackiw #cite(label("CallanColemanJackiw1970")).
  The issue here is to construct the required scalar within the original physical field algebra.

=== 1.1 The result and its scope <the-result-and-its-scope>

We work in a vacuum representation of a local, unitary, positive-energy theory on $bb(R)^(1 \, 3)$.
  The vacuum is invariant under Poincaré transformations and continuous dilatations.
  The original point-field labels form an algebraic direct sum

$ cal(F) = xor.big_(Delta in Sigma) cal(F)_Delta \, $

where $cal(F)_Delta$ consists of homogeneous dilation eigenfields of dimension $Delta$.
  The real dimension spectrum $Sigma$ is discrete, with no finite accumulation, bounded below,
  and has finite multiplicities in the Lorentz-component convention of Assumption 2.
  Thus each original field is a finite linear combination of homogeneous fields:
  it has #emph[finite scaling support]. Both $T$ and the virial field $V$ in (1.1) are physical local fields,
  with the corresponding compact-flux Ward identities.

The operational data also include a fixed covariant, causally commuting net of bounded local algebras,
  with compatible affiliated realizations of the original fields and their adjoints.
  A further finite homogeneous field family belongs to this physical theory only after its localization in
  arbitrarily small regions, all finite mixed products, common invariant domain and original-net affiliation have
  been established. The required domain contains the original vacuum-word domain $cal(D)_(upright("old"))$,
  constructed in Proposition 3. Thus membership is a conclusion to be proved for the improvement scalar.
  Finite scaling support restricts field labels; arbitrary finite word lengths and joint Schwartz test kernels
  remain available.

We use #emph[physical field algebra] in this joint sense:
  polynomial insertions from the original fields and any finite family admitted together with them under
  Assumption 2. Products of separately constructed families require their mutual reconstruction.
  Proposition 61 will extend the same improvement and Ward action to each such admitted family.
  The framework requires neither Haag duality nor a split property, a phase-space estimate,
  or field-operator bounds in terms of energy.

#thm([Theorem 1.1.])[
  #emph[Suppose Assumption 2 holds, including the algebraic direct-sum decomposition with finite scaling support
    for every original field. Then the physical stress tensor admits a local symmetric conserved improvement with
    the same translation and Lorentz Ward charges and with zero trace.
    More precisely, let $T^(\( 4 \))$ and $V^(\( 3 \))$ be the Hermitian dimension-four and dimension-three
    components selected by the affine Ward identities. There is a Hermitian physical scalar field $L$ of dimension
    two such that
#[#set math.equation(numbering: n => "(1.2)")
 $ partial^mu V_mu^(\( 3 \)) = square.stroked L \, wide t_(mu nu) = T_(mu nu)^(\( 4 \)) + 1 /
   3 \( partial_mu partial_nu - eta_(mu nu) square.stroked \) L $ <eq:intro-improvement>]

 is symmetric, conserved and traceless. The replacement $T mapsto T^(\( 4 \))$ also preserves the affine charges.
   The currents $X^nu t_(mu nu)$ for conformal Killing vector fields $X$ have unbroken local Ward identities on
   the physical field algebra, extending its Poincaré and dilation actions.]
] <thm:main>

The preserved physical data are the Hilbert space, bounded local net,
  original polynomial fields on $cal(D)_(upright("old"))$, and their translation and Lorentz charges.
  The common domain is enlarged by the reconstructed vacuum words.
  This does not identify new affiliated extensions with previously chosen closed operators on every vector of
  their larger domains. The conclusion is a local conformal Ward action;
  integration to a global conformal action on the whole bounded net is a separate question.

The field-space and bounded-net hypotheses delimit the class in Theorem 1.
  In particular, weak commutation of unbounded fields alone does not supply the bounded locality used by the
  proof. In a gauge description, the construction takes place in the chosen gauge-invariant local algebras.

===== 1.1.1 The full free scalar theory. <the-full-free-scalar-theory.>

The massless real scalar in its four-dimensional vacuum Fock representation gives a concrete example.
  Use its full bounded local net and the Wick monomials in the scalar and its derivatives as original fields.
  Their scaling grades are finite-dimensional and integer-valued.
  The joint-domain and affiliation verification is given in the example of Section 2.2.

With $Q = : #h(-0.16667em) phi.alt^2 #h(-0.16667em) :$, the canonical stress tensor and virial field are

$ T_(mu nu)^(upright("can")) = : #h(-0.16667em) partial_mu phi.alt thin partial_nu phi.alt - 1 /
  2 eta_(mu nu) \( partial phi.alt \)^2 #h(-0.16667em) : \, wide V_mu = - 1 / 2 partial_mu Q . $

The free equation gives $\( T^(upright("can")) \)^mu zws_mu = - :
  #h(-0.16667em) \( partial phi.alt \)^2 #h(-0.16667em) : = partial^mu V_mu = square.stroked \( - Q \/ 2 \)$.
  The canonical commutation relations give the Poincaré and dilation Ward actions on compact Cauchy slabs.
  Here the scalar is already present, $L = - Q \/ 2$, and (1.2) is the familiar improvement $t_(mu nu) =
  T_(mu nu)^(upright("can")) + \( eta_(mu nu) square.stroked - partial_mu partial_nu \) Q \/ 6$.

The local-current hypothesis is substantive. Restricting instead to shift-invariant Wick polynomials removes $Q$
  and $V_mu = - : #h(-0.16667em) phi.alt partial_mu phi.alt #h(-0.16667em) :$;
  the available dimension-three linear fields $partial_mu partial_nu phi.alt$ contain no Lorentz vector,
  and products of differentiated fields start at dimension four.
  This is the field-algebra issue in the free-scalar and dual noncompact two-form examples discussed by
  #cite(label("DymarskyZhiboedov2015"), form: "prose") #cite(label("Nakayama2015"), form: "prose").
  A different operational theory must also specify its bounded net and intrinsic field membership:
  deleting a name from the original list alone does not exclude a field reconstructible in the same net.

=== 1.2 History and the local-field question <history-and-the-local-field-question>

The two-dimensional history runs through Zamolodchikov’s $c$-theorem and Polchinski’s enhancement result under
  suitable hypotheses #cite(label("Zamolodchikov1986")) #cite(label("Polchinski1988")).
  In four dimensions, local renormalization-group consistency conditions give a substantial perturbative result.
  The flow relevant to the trace includes flavor-current contributions,
  and positivity in the perturbative regime forces that flow to vanish at a scale-invariant theory.
  Perturbative limit cycles of ordinary beta functions can therefore describe conformal theories
  #cite(label("FortinGrinsteinStergiou2013")) #cite(label("JackOsborn2014")).
  The required positivity is not established by those consistency identities at arbitrary coupling.
  Nakayama reviews the distinctions among scale currents, improvements,
  unitarity and the hypotheses of enhancement arguments #cite(label("Nakayama2015")).

The four-dimensional $a$-theorem of Komargodski and Schwimmer uses anomaly matching and a positive dilaton
  dispersion relation for flows between conformal endpoints #cite(label("KomargodskiSchwimmer2011")).
  Luty, Polchinski and Rattazzi developed this method to establish conformal asymptotics in perturbatively
  controlled regimes and to constrain nonperturbative scale-invariant theories
  #cite(label("LutyPolchinskiRattazzi2013")). Their general argument leaves a passage from on-shell dilaton
  constraints to an off-shell local trace identity. Dymarsky, Komargodski,
  Schwimmer and Theisen sharpened the vanishing-amplitude argument,
  retaining infrared-regulation hypotheses and the need to justify the inference from trivial probe scattering to
  a removable local interaction #cite(label("DKST2015")).

That inference is sensitive to contact and semi-local terms.
  Bzowski and Skenderis showed how semi-local contributions can carry the scale anomaly even when on-shell dilaton
  amplitudes vanish #cite(label("BzowskiSkenderis2014")). Dymarsky, Farnsworth, Komargodski,
  Luty and Prilepina analyzed the generalized-free-trace possibility:
  without a suitable dimension-two scalar the anomaly rules it out; when such a scalar exists,
  either an improvement is conformal or an improved trace can be chosen that is not generalized free
  #cite(label("DFKLP2016")). The latter alternative retains an improvement problem.

Earlier arguments also aim directly at a local scalar. Yonekura proposes the inverse-wave-operator construction
  $square.stroked^(- 1) T^mu zws_mu$ and states the crossing and momentum-space analyticity assumptions used to
  establish its locality #cite(label("Yonekura2014")). Sachs gives a Weyl-gauging and consistency argument for a
  restricted class of metric-couplable Lagrangian theories with a gauge-invariant virial current
  #cite(label("Sachs2015")). Here the required limited momentum continuation is derived inside primitive causal
  tubes, and the improvement is reconstructed in the prescribed physical theory.
  No asymptotic scattering states or independently assumed crossing relation enter the argument.

Null-cut modular methods have a substantial earlier development.
  Faulkner, Leigh, Parrikar and Wang related first-order deformations of half-space modular Hamiltonians to
  horizon stress-tensor integrals #cite(label("FaulknerLeighParrikarWang2016")).
  Casini, Testé and Torroba studied null-plane modular Hamiltonians and their half-sided modular
  relations #cite(label("CasiniTesteTorroba2017")). The bounded-cut argument below establishes the flux limits,
  domains and commuting transverse measure needed under Assumption 2.

The remaining issue is an operator one. Intrinsic recovery of point fields from local algebras under polynomial
  energy bounds was studied by Fredenhagen and Hertel #cite(label("FredenhagenHertel1981"));
  those bounds are not assumed here. Dividing the trace’s vacuum polarization by invariant mass squared produces a
  scalar two-point wave. Even if that wave has the right dimension and localization,
  it is not yet a physical local operator. One must construct its mixed products at every finite length,
  establish their positivity and a compatible common domain, and prove affiliation in the original algebras.
  Section 8 is devoted to this passage.

=== 1.3 Structure of the proof <structure-of-the-proof>

+ #emph[Bounded null cuts.] Wedge modular data and half-sided modular inclusions give positive generators for null
  cuts. A bounded-profile Ward identity identifies their linear response with the physical stress tensor.
  It produces a commuting positive transverse measure and its quadratic moment.
  The spectral comparison used here is stronger than form order; its proof uses modular strip analyticity.
+ #emph[Removal of the critical scalar tail.] The available scalar comparison is sharpened by ruling out its sole
  possible obstruction, a critical tail. A causal stress/virial dispersion comparison between the two null
  horizons isolates that tail as an order-zero Hankel leakage coefficient.
  A logarithmic test leaves a positive multiple of the scalar leakage norm as the leading term,
  forcing the tail to vanish.
+ #emph[From charge forms to actual modular action.] The improved scalar comparison first gives local forms with
  one scalar insertion. Their quadratic charges are identified with positive self-adjoint null moments on a
  specified domain. Future and past cone comparisons force the residual dilation charge to vanish.
  A KMS argument then identifies the actual cone modular groups,
  and half-sided inclusions give the actual time-Möbius action on line diamonds.
+ #emph[Extraction and identification of the scalar wave.] Actual diamond modular transformations extract a
  dimension-two scalar wave $S$ from the physical virial field,
  with real localization and bounded approximants in the original net.
  The formal trace wave $l$ need not initially equal $S$. Hilbert products through length four give a conformal
  representation on pairs. Its radial positivity and normalized current fluxes force the residual $l - S$ to vanish.
+ #emph[Reconstruction and improvement.] Bounded approximants give analytic products at every finite length.
  Ambient differential identities control pure scalar products;
  a causal wave equation and characteristic Gaussian tests propagate temperedness and spectral support through
  mixed orderings with homogeneous original slots. Finite multilinearity then extends the scalar and
  Hilbert-valued boundaries to every fixed list of original fields, with the same joint test kernels.
  The resulting products give a common invariant domain, and exchange with the original bounded commutants gives
  affiliated realizations. Only after this reconstruction is the improvement in (1.2) an operator identity in the
  physical algebra.

The intermediate results separate tools that may be useful beyond the present theorem:
  a bounded-cut modular Ward formula, a two-horizon critical-tail test,
  and a reconstruction argument that distinguishes a local vacuum wave from a field of the original theory.
  Their hypotheses and domain restrictions are stated at the points of use.

Three group actions serve different purposes in this argument.
  Their relation is summarized here to distinguish the two-point comparison from the actual local operations used
  in the construction. The space $Pi$ is the closed sum of the scalar $l$, conserved-vector $J$,
  and traceless-tensor $t$ vacuum-wave channels. The pair space $cal(H)_(lt.eq 2)$ is spanned by the vacuum and
  the one- and two-insertion tube vectors for $L \, S \, J \, t$.

#[
  #set par(justify: false)
#table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Action
], table.cell(rowspan: 1, colspan: 1)[Space
], table.cell(rowspan: 1, colspan: 1)[Role
]),
  table.cell(rowspan: 1, colspan: 1)[Auxiliary conformal action
], table.cell(rowspan: 1, colspan: 1)[One-field space $Pi$
], table.cell(rowspan: 1, colspan: 1)[Fixed by the primary two-point kernels;
  supplies localization and spectral comparisons. The null moments are later shown to act this way on $Pi$ (Theorem 27).
],
  table.cell(rowspan: 1, colspan: 1)[Actual time-Möbius action
], table.cell(rowspan: 1, colspan: 1)[Original $cal(H)$, for each time direction
], table.cell(rowspan: 1, colspan: 1)[Uses cone and diamond modular groups.
  It transports bounded operations in line diamonds and extracts $S$ (Theorem 30).
],
  table.cell(rowspan: 1, colspan: 1)[Conformal action on pairs
], table.cell(rowspan: 1, colspan: 1)[$cal(H)_(lt.eq 2)$
], table.cell(rowspan: 1, colspan: 1)[Constructed from short-product Ward identities and four-point positivity.
  It supplies the radial estimates proving $l = S$ (Proposition 46).
],
)
]

Section 2 fixes the field-space conventions and modular inputs.
  Sections 3 and 4 establish the null-cut and dispersion arguments.
  Sections 5 and 6 identify actual modular symmetries and extract the scalar vacuum wave.
  Section 7 proves its equality with the trace polarization.
  Section 8 constructs the field and completes the local Ward identities.

The following notation records the successive constructions.

#[
  #set par(justify: false)
#table(
  columns: 2,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Symbol
], table.cell(rowspan: 1, colspan: 1)[Role in the proof
]),
  table.cell(rowspan: 1, colspan: 1)[$l$
], table.cell(rowspan: 1, colspan: 1)[Trace scalar vacuum wave, defined in (2.8).
],
  table.cell(rowspan: 1, colspan: 1)[$S$
], table.cell(rowspan: 1, colspan: 1)[Scalar vacuum wave extracted from the virial field,
  with physical real localization (Proposition 35) and later bounded approximants (Proposition 37).
],
  table.cell(rowspan: 1, colspan: 1)[$ell$
], table.cell(rowspan: 1, colspan: 1)[Residual wave $l - S$, written $L - S$ inside short products;
  Theorem 50 proves $ell = 0$.
],
  table.cell(rowspan: 1, colspan: 1)[$L$
], table.cell(rowspan: 1, colspan: 1)[Initially a scalar insertion symbol, then an entry in analytic products.
  Its physical field realization is obtained only after Theorem 51, the common-domain construction, and Proposition 58.
],
)
]

== 2 Operational framework, vacuum waves, and null cuts <sec:foundations>

We use the metric $eta = "diag" \( 1 \, - 1 \, - 1 \, - 1 \)$ and $U \( x \) = e^(i P dot.op x)$.
  Scalar products are antilinear in their first argument. Our dilation convention is

$ U_D \( s \) P_mu U_D \( - s \) = e^s P_mu \, wide U_D \( s \) O \( x \) U_D \( - s \) = e^(s d) O \( e^s x \) $

for a field of dimension $d$. The distinction between a field, its vacuum wave,
  and a bounded local operation will be maintained throughout.

=== 2.1 Original physical data and the vacuum-generated domain <original-physical-data-and-the-vacuum-generated-domain>

The hypotheses below specify the original fields, their bounded local net, and their Ward currents.
  We also fix the domain required when a new field is admitted to that theory.
  Proposition 3 constructs this domain from the original vacuum distributions and proves its compatibility with
  the given affiliated realizations.

#prodef([Assumption 2.1.])[
  (Operational physical theory).  The physical Hilbert space $cal(H)$ is generated from a vacuum $Omega$ by the
    original physical fields and their adjoints. The fields, in finite-component Lorentz multiplets,
    and their ordered products are operator-valued Wightman distributions on a common invariant polynomial domain,
    which we call the initial realization domain $cal(E)$. They have positive translation spectrum,
    Poincaré covariance, and locality, with the usual grading when fermions occur.
    The vacuum is invariant under Poincaré transformations and continuous dilations;
    uniqueness of the invariant vector is not assumed.
  Let $cal(D)_(upright("fact")) subset cal(E)$ be the algebraic span of $Omega$ and all finite original vacuum
    words with compactly supported factor tests. To specify the vacuum-generated domain,
    for every finite ordered list $upright(bold(A)) = \( A_1 \, dots.h \, A_n \)$ of original fields and adjoints,
    write $Psi_(upright(bold(A)))^(upright("old")) \( h \)$ for the continuous extension of its original
    factor-test vacuum map to joint kernels $h in cal(S) \( \( bb(R)^4 \)^n \)$.
    These kernels include $C_c^oo \( \( bb(R)^4 \)^n \)$ and finite sums of factorized tests. Set
  $ cal(D)_(upright("old")) = "span" { Omega \, Psi_(upright(bold(A)))^(upright("old")) \( h \) : n = 1 \, 2 \,
    dots.h \, med h in cal(S) \( \( bb(R)^4 \)^n \) } . $
  The existence of these extensions and their insertion actions is proved in Proposition 3;
    it is not an additional assumption. This is an algebraic span:
    it has no Hilbert or graph completion and no bound on word length or tensor rank.
    The domain whose containment is required below is precisely $cal(D)_(upright("old"))$,
    not an independently larger choice of $cal(E)$.
  Let $cal(F)$ be the complex vector space of original point-field labels,
    modulo equality of their operator-valued distributions on $cal(D)_(upright("fact"))$;
    Proposition 3 makes this equivalently equality on $cal(D)_(upright("old"))$. It is the algebraic direct sum
  $ cal(F) = xor.big_(Delta in Sigma) cal(F)_Delta \, wide A = sum_(Delta in S_A) A_Delta \, quad
    S_A subset Sigma med upright("finite") \, $
  where $Sigma subset bb(R)$ is a discrete set of real dimensions, bounded below and locally finite:
    $Sigma ∩ \[ a \, b \]$ is finite for every finite interval $\[ a \, b \]$.
    Each $cal(F)_Delta$ is a finite-dimensional Lorentz-stable space of finite-component fields satisfying
  $ U_D \( s \) A_Delta \( x \) U_D \( - s \) = e^(s Delta) A_Delta \( e^s x \) $
  as operator-valued distributions on $cal(D)_(upright("fact"))$,
    and hence on $cal(D)_(upright("old"))$ by that proposition.
    Multiplicity counts independent component fields after including all Lorentz component indices and imposing
    linear field identities; equivalently, each grade contains finitely many finite-component Lorentz multiplets.
    Homogeneous components are themselves original physical fields.
    Adjunction preserves each real grade, with conjugate Lorentz components,
    and covariant distributional differentiation sends $cal(F)_Delta$ into $cal(F)_(Delta + 1)$,
    with a missing grade interpreted as zero. Lorentz transformations preserve the grades and statistics;
    translations act on spacetime arguments. No completion by infinitely many scaling components is taken.
  There is a fixed isotone net $O mapsto cal(M) \( O \)$ of weakly closed algebras of physical bounded operations,
    covariant under the same physical Poincaré and dilation representations.
    Algebras at spacelike separation commute, with the fixed statistics twist in the graded case.
    Each smeared original physical field has a closed affiliated realization in its localization algebra,
    extending its realization on $cal(E)$, whose adjoint also extends the field adjoint there.
    The corresponding extensions on $cal(D)_(upright("old"))$ are derived in Proposition 3.
    For any other open region $R$,
  $ cal(M) \( R \) = or.big_(overline(O) subset R) cal(M) \( O \) \, $
  where $O$ ranges over double cones. Physical point-field membership in $cal(A)_(upright("phys"))$ is intrinsic
    to this fixed net, not to an enumeration of symbols. An operationally reconstructed finite family of
    homogeneous finite-component point fields of real scaling dimensions is admitted,
    together with its finite linear span, once its localization supports can shrink inside arbitrarily small
    double cones; all joint field distributions of the family with itself and with every fixed finite list of
    original fields and adjoints have been established at every finite length on a compatible common invariant
    domain containing $cal(D)_(upright("old"))$, with the required adjoints and the preceding covariance,
    spectrum, and locality/statistics properties; and compatible smeared realizations affiliated with the original
    localization algebras have been established, with their adjoints extending the field adjoints on that domain.
    Separately constructed fields are not combined into a common polynomial field algebra without their mutual
    joint distributions, common invariant domain with the required adjoints,
    and original-net affiliations having been established. The criterion asserts no candidate’s existence or
    analytic properties and admits no point field merely by convergence of an infinite nonhomogeneous scaling sum.
  The original physical fields include a symmetric conserved stress tensor $T_(mu nu)$ with the translation and
    orbital Lorentz Ward identities, and a local virial field $V_mu$ such that
  $ D_mu = x^nu T_(mu nu) - V_mu \, wide partial^mu D_mu = 0 \, wide T^mu zws_mu = partial^mu V_mu . $
  The Ward identities of $D$ generate the stated dilations.
    Charge Ward identities are understood through compact Cauchy slabs surrounding an insertion and extend to
    polynomial products by the derivation rule. The identities displayed above are flat-space field identities;
    the usual contact terms in time-ordered distributions are allowed.
] <ass:framework>

Finite scaling support concerns field labels. It leaves all finite product lengths and all joint Schwartz and
  compact smooth kernels available, without a finite tensor-rank requirement.
  It restricts neither Hilbert completions and generator spectra nor weak closures of bounded algebras.
  The bounded-locality and original-net affiliation clauses are separate hypotheses:
  neither weak commutation of field restrictions nor affiliation in a larger relatively local net supplies them.
  No Haag duality, split property, phase-space estimate, scattering theory, or conformal symmetry is assumed.

#thm([Proposition 2.2.])[
  (Original joint-test domain).  #emph[For every fixed finite ordered list of original fields and adjoints,
    the vacuum distribution has a unique tempered extension and its vacuum map has a continuous Hilbert-valued
    extension to all joint Schwartz kernels. The space $cal(D)_(upright("old"))$ is Hilbert-dense and invariant
    under old field insertions and continuous joint polynomial insertions, with their prescribed adjoints.
    Finite field-label identities, covariance, locality, and the compact-slab Ward identities pass to this domain
    with their stated support conditions.]
  #emph[For a compactly smeared original field $B \( f \)$,
    each retained closed affiliated realization and its Hilbert adjoint agree on $cal(D)_(upright("old"))$ with
    these insertion actions. This assertion also holds for an originally supplied Schwartz realization.
    It does not require $cal(D)_(upright("old"))$ to be a graph core for that realization.]
] <F:old-domain>

#proof[
  #emph[Tempered distributions and finite field-label expansions.] For every fixed ordered list of homogeneous
    original fields $A_i in cal(F)_(Delta_i)$, its already given vacuum distribution is tempered.
    To see this, remove the common translation coordinate. In the remaining relative coordinates $xi$,
    dilation invariance of the vacuum gives
  $ W \( lambda xi \) = lambda^(- sum_i Delta_i) W \( xi \) \, wide lambda > 0 \, $
  in the distributional pullback sense. A compact neighborhood of the origin is controlled by the local finite
    order of the given distribution. On a fixed compact annulus it is bounded by finitely many test-function
    seminorms. Dilating that annulus transfers the bound to every outer dyadic annulus with a fixed power
    determined by the dimensions and the seminorm order. Summation against a sufficiently high Schwartz seminorm
    proves temperedness. The zero- and one-point cases are immediate.
  Adjoints are homogeneous at the same real grade. For any fixed list of original fields $A_i =
    sum_(Delta in S_i) A_(i \, Delta)$, multilinearity on $cal(D)_(upright("fact"))$ first gives the component
    expansion on compact factor tests. Compact tensor-test density and continuity of the given joint distributions
    then give, for the same compact joint kernel $phi$,
  #[#set math.equation(numbering: n => "(2.1)")
   $ W \( A_1 \, dots.h \, A_n \) \[ phi \] =
     sum_(\( Delta_1 \, dots.h \, Delta_n \) in S_1 times dots.h.c times S_n)
     W \( A_(1 \, Delta_1) \, dots.h \, A_(n \, Delta_n) \) \[ phi \] . $ <F:finite-label-extension>]
  The finite sum of homogeneous tempered extensions defines the unique tempered extension of the left side,
    so the same identity holds for every joint Schwartz kernel.
    It agrees with any originally specified Schwartz distribution by its stated continuity and compact-test
    density. Its constants and seminorm orders may depend on the fixed list;
    no single total scaling dimension is assigned to a nonhomogeneous sum.
  #emph[Hilbert-valued words and insertion actions.] For a fixed old list $upright(bold(A))$,
    write $Psi_(upright(bold(A)))^0 \( u \)$ for the original vacuum vector of a finite sum $u$ of compact factor
    tests. The doubled tempered distribution gives a continuous Schwartz seminorm $p$ and a constant $C$ such that
  $ parallel Psi_(upright(bold(A)))^0 \( u \) - Psi_(upright(bold(A)))^0 \( v \) parallel^2 =
    W \( upright(bold(A))^(*) \, upright(bold(A)) \) \[ \( u - v \)^(*) ⊗ \( u - v \) \] lt.eq C p \( u - v \)^2 . $
  Here the star reverses and adjoints the field list and conjugates and reverses the kernel.
    Compact finite tensor tests are dense in the joint Schwartz space.
    The estimate therefore constructs the unique continuous Hilbert-valued extension
    $Psi_(upright(bold(A)))^(upright("old"))$ used in the definition of $cal(D)_(upright("old"))$;
    polarization passes all its Gram identities to the limit.
    Any originally specified Schwartz vacuum-word map agrees with this extension by its stated continuity and the
    same density. Consequently the original vacuum-generation assumption also makes $cal(D)_(upright("fact"))$
    Hilbert-dense. This argument concerns only original products whose existence is assumed;
    it supplies no product containing a newly constructed field.
  For a fixed old word $upright(bold(A))$ and a fixed finite old prefix $upright(bold(B))$,
    the same doubled vacuum-distribution estimate applies to the longer word.
    Consequently, if $h_j arrow.r h$ in the joint Schwartz topology, then for a fixed prefix kernel $g$,
  $ Psi_(upright(bold(A)))^(upright("old")) \( h_j \) arrow.r Psi_(upright(bold(A)))^(upright("old")) \( h \) \,
    wide Psi_(upright(bold(B)) \, upright(bold(A)))^(upright("old")) \( g ⊗ h_j \) arrow.r
    Psi_(upright(bold(B)) \, upright(bold(A)))^(upright("old")) \( g ⊗ h \) $
  in Hilbert norm. The estimates are continuous jointly in $g \, h$ on their Schwartz spaces.
    Reversed adjoint kernels obey the same bounds. Compact joint kernels can be approximated,
    after a finite partition into product patches, by finite sums of factor tests with the prescribed local
    supports; Schwartz kernels admit finite tensor approximations in the Schwartz topology.
    Concatenation, reversal, and differentiation are continuous in these test spaces.
  Left concatenation of old test words is well-defined on their vacuum vectors.
    Indeed, if a finite old test polynomial $P$ represents zero,
    positivity and Cauchy–Schwarz applied to $P$ and $Q^(*) Q P$ give $W \( P^(*) Q^(*) Q P \) =
    0$ for every finite old test polynomial $Q$. This is the squared norm of the proposed vector for $Q P$.
    Thus the null vectors form a left ideal, including cancellations between different words,
    and the same vacuum pairing places adjoint insertion inside the Hilbert adjoint.
    Concatenation therefore makes $cal(D)_(upright("old"))$ invariant under the old field and polynomial
    insertions. It is Hilbert-dense because it contains the original factorized vacuum-polynomial vectors that
    generate $cal(H)$.
  #emph[Agreement with the retained realizations.] Let $T_B \( f \)$ be a chosen closed affiliated realization of
    an original field with compact test $f$, and choose finite sums of compact tensor tests $h_j arrow.r
    h$ as above. On the vectors in $cal(D)_(upright("fact")) subset cal(E)$ the original extension clause gives
  $ T_B \( f \) Psi_(upright(bold(A)))^(upright("old")) \( h_j \) =
    Psi_(B \, upright(bold(A)))^(upright("old")) \( f ⊗ h_j \) . $
  Both sides converge in Hilbert norm by the two displayed continuity statements.
    Closedness of $T_B \( f \)$ therefore proves the same equality for $h$.
    Applying the argument to the closed Hilbert adjoint $T_B \( f \)^(*)$ gives its equality with the insertion of
    $B^dagger \( macron(f) \)$ there. Iterating this one-field statement proves the corresponding actions of every
    finite factorized prefix and its reversed adjoint on $cal(D)_(upright("old"))$.
    Joint polynomial insertions are the continuous concatenations already defined;
    this argument does not assign an affiliated closure to an arbitrary joint smear.
  If an original Schwartz smearing $B \( f \)$ and its closed affiliated realization were already supplied,
    the same conclusion holds for that realization. To identify its action on a fixed vector of
    $cal(D)_(upright("fact"))$, approximate $f$ by compact tests in Schwartz topology.
    The longer doubled correlations give Hilbert convergence of the inserted vectors,
    while the original Schwartz distributional continuity gives the same limiting matrix elements against
    $cal(D)_(upright("fact"))$. Density identifies the vectors, also for the adjoint.
    The preceding $h_j$ closed-graph argument then applies unchanged.
    This uses only an originally supplied Schwartz action and its stated continuity;
    it asserts no pre-existing realization for a smearing that was not originally supplied.
  #emph[Identities and local Ward actions.] The same paired vector and inserted-vector limits extend every finite
    field-label identity from $cal(D)_(upright("fact"))$ to $cal(D)_(upright("old"))$.
    The converse follows from $cal(D)_(upright("fact")) subset cal(D)_(upright("old"))$,
    so the two equality conventions for $cal(F)$ agree. The homogeneous dilation law and the adjoint and
    derivative grade laws extend in the same way, because the transformed, reversed,
    and differentiated kernels remain in the stated test spaces.
    Thus none of these identities on joint vectors was used to construct those vectors.
  The original covariance and flat field identities pass from the factorized vectors to joint vectors by the same
    longer-word continuity, with transformed or differentiated kernels.
    Locality and compact-slab Ward identities pass under their stated support conditions.
    For a general Schwartz spectator vector, keep the localized slab and insertion tests fixed and approximate
    only the spectator kernel in Schwartz topology. If a localized insertion polynomial itself has a compact joint
    kernel, use the support-preserving compact approximants. Thus the operational identities used below hold on
    the dense invariant vacuum-generated domain $cal(D)_(upright("old"))$, with the original vacuum correlations,
    Hilbert space, and bounded net unchanged. The factor approximations just used converge in the graph of each
    specified $T_B \( f \)$ on these joint vectors; Hilbert density alone was not used for that conclusion.
    No claim is made that $cal(D)_(upright("old"))$ is a graph core for a chosen realization,
    that the closure of its field restriction equals that realization,
    or that a newly constructed field acts on arbitrary additional vectors of $cal(E)$. ◻
]

We will use (2.1) as a finite-label permanence principle for later distributions.
  Every term uses the same joint kernel; continuity, common spectral cones,
  and linear distributional identities pass through the finite sum.
  Positivity and descent through null polynomial vectors require their full summed forms and will be checked where
  they arise.

The dimension set is countable, and each grade has a finite component basis.
  Countable dense test families for the resulting countable collection of finite words,
  together with the Hilbert-valued continuity just proved, show that $cal(H)$ is separable.
  This supplies the separability used in the direct-integral descriptions below.

The spectrum condition now gives tube analyticity, uniqueness from an open boundary patch,
  and Reeh–Schlieder for these original distributions. In particular,
  a separated-point field identity valid on a mutually spacelike open patch extends to ordered vacuum
  distributions by tube uniqueness. This assertion does not assign differentiated Ward identities to a particular
  choice of time ordering.

=== 2.2 Example: the full free scalar theory <F:free-scalar-example>

The massless real scalar in its four-dimensional vacuum Fock representation gives a concrete example.
  Take the full scalar net $cal(M) \( O \) = { e^(i overline(phi.alt \( f \))) :
  f in C_c^oo \( O \, bb(R) \) }^('')$ and, as original fields, finite linear combinations of Wick monomials $:
  #h(-0.16667em) product_(j = 1)^n partial^(alpha_j) phi.alt #h(-0.16667em) :$.
  Their dimensions are the nonnegative integers $n + sum_j \| alpha_j \|$,
  with finitely many component monomials at each grade. The Weyl relations give bounded locality,
  and Wick’s construction supplies all joint products and their invariant domain
  #cite(label("BrunettiFredenhagenKoehler1996")) Theorem 5.7 and its following remark.
  Affiliation has a concrete justification here. On the common domain invariant under Wick fields and Weyl
  operators #cite(label("BrunettiFredenhagen2000")) Section 2.2, equation (11),
  a Wick smearing commutes with exterior Weyl operators. Its closed graph retains this commutation and domain
  invariance. Double-cone duality of the free massless scalar #cite(label("HislopLongo1982")) Section 3,
  Corollary 2 identifies the generated exterior algebra with $cal(M) \( O \)'$, proving affiliation.
  The formal adjoint gives the required Hilbert-adjoint extension.
  This is a property of the example, not a duality hypothesis of the theorem.

=== 2.3 Selecting the current weights <F:weights>

We may, and henceforth do, replace $T$ and $V$ by Hermitian homogeneous fields of dimensions four and three.
  We justify both the selection and preservation of the charges.
  First take the even components of the spacetime currents.
  The prescribed unitary affine derivations preserve parity,
  so the odd-current Ward contributions vanish by parity separation on parity-homogeneous insertions;
  the flat field identities split by parity as well. For an even current $J$ with a real slab test,
  polynomial adjunction on $cal(D)_(upright("old"))$ gives

$ #scale(x: 120%, y: 120%)[\(] i \[ J \, A \] #scale(x: 120%, y: 120%)[\)]^dagger = i \[ J^dagger \, A^dagger \] . $

The prescribed unitary derivation preserves adjoints, and its Ward identity also applies to $A^dagger$ with the
  same support. Hence $J^dagger$ and $\( J + J^dagger \) \/ 2$ have the same Ward action as $J$.
  Applying this to the translation and orbital currents of $T$ and to $D = x T -
  V$ shows that the Hermitian parts preserve all required charges.
  The real metric, coordinate, and derivative coefficients also preserve the flat field identities under
  adjunction. Relabel these even Hermitian representatives as $T \, V$.
  The adjoint grade law preserves their decompositions. Write the finite sums

$ T = sum_(d in S_T) T^(\( d \)) \, wide V = sum_(e in S_V) V^(\( e \)) \, $

with every missing component interpreted as zero. Directness of the grading, Lorentz covariance,
  and the derivative grade law split symmetry, Hermiticity, conservation, and the trace identity.
  Thus, for every $d in S_T union { e + 1 : e in S_V }$,

$ T_(mu nu)^(\( d \)) = T_(nu mu)^(\( d \)) \, wide partial^mu T_(mu nu)^(\( d \)) = 0 \,
  wide \( T^(\( d \)) \)^mu zws_mu = partial^mu V_mu^(\( d - 1 \)) \, $

and the components can be taken Hermitian. In particular each geometric current

$ D_mu^(\( d \)) = x^nu T_(mu nu)^(\( d \)) - V_mu^(\( d - 1 \)) $

is conserved.

Fix a homogeneous insertion $O$ of dimension $alpha$ and homogeneous spectators.
  A compact-slab translation commutator made from $T^(\( d \))$ has weight $alpha + d - 3$:
  the slab integral removes three powers of length. An orbital Lorentz commutator from $x
  T^(\( d \))$ has weight $alpha + d - 4$, as does a dilation commutator from the pair $D^(\( d \))$.
  Conservation of these component currents permits the slabs to be rescaled while keeping the insertion inside.
  After testing the homogeneous spectators, these are identities between ordinary scalar distributions.
  The prescribed translation, Lorentz, and dilation actions have weights $alpha + 1$, $alpha$, and $alpha$,
  respectively. After testing the remaining variables, the Ward identities are finite scalar sums of real
  exponentials in the logarithmic scale. Their linear independence selects the $d =
  4$ translation and orbital contributions and the $d = 4$ dilation pair $x T^(\( 4 \)) - V^(\( 3 \))$;
  the other corresponding Ward contributions vanish. This is a statement about charges,
  not the vanishing of the nonselected fields.

Finite multilinearity now extends these identities to every fixed list of original fields and adjoints under the
  same test kernels, and the retained derivation rule extends them to every finite polynomial word.
  The selected components retain conservation, the trace identity, and all required Ward actions.
  Replacing the original stress tensor by $T^(\( 4 \))$ adds a local symmetric conserved tensor with zero
  translation and Lorentz charges. This is an admissible charge-preserving change of stress tensor;
  it does not presume a scalar improvement. The field decompositions here are identities on
  $cal(D)_(upright("old"))$; no equality between a chosen closed realization of a sum and a sum of chosen closed
  realizations is needed. Each selected component has its own affiliated realization by Assumption 2.

=== 2.4 Modular input and a spectral comparison lemma <F:modular>

For a standard real subspace $X subset cal(H)$, write

$ frak(s)_X \( x + i y \) = x - i y quad \( x \, y in X \) \, wide frak(s)_X = J_X Delta_X^(1 \/ 2) \, wide
  S_X = - frac(1, 2 pi) log Delta_X . $

Here standard means $overline(X + i X) = cal(H)$ and $X ∩ i X = { 0 }$.
  The symplectic complement is $X' = { xi : "Im" ⟨xi \, x⟩ = 0 upright(" for ") x in X }$.
  For a standard algebra $\( cal(M) \, Omega \)$ its associated real space is $X_(cal(M)) =
  overline({ A Omega : A = A^(*) in cal(M) })$. Statistics twists in complementary spaces and algebras are
  understood in all statements involving odd fields.

Every original polynomial word in this subsection has the finite component expansion described above,
  with its joint test kernel unchanged. Thus the preceding temperedness and finite-component covariance apply to
  every word used in the polynomial argument.

The Wightman Bisognano–Wichmann theorem identifies the wedge polynomial Tomita graph with $J_W e^(- pi B)$,
  where $B$ generates the wedge boost; hence $Delta_W^(i t) =
  e^(- 2 pi i t B)$ and the opposite wedge has the complementary real space #cite(label("BW1976")).
  The published theorem assumes a unique translation-invariant vacuum.
  We explain its boundary calculation and core argument in the version needed here,
  followed by the passage to bounded algebras. First, uniqueness of the vacuum is unnecessary for this graph
  identification. The reflection itself must be constructed before the core argument.
  Extend the covariance of the vacuum distributions along the connected complex Lorentz group.
  On a real Jost patch, locality reverses the order of the fields with the prescribed statistics signs;
  analytic uniqueness extends the resulting distributional equality.
  Combine it with the Hermitian-conjugation identity for vacuum distributions.
  If $F$ and $G$ are smeared polynomial words and $xi_F = F Omega$, it says

$ ⟨xi_F^natural \, xi_G^natural⟩ = ⟨xi_G \, xi_F⟩ . $

Here $xi_F^natural$ is the reflected-adjoint word: conjugate its test functions,
  reflect their arguments by $j_W \( u \, v \, y \) = \( - u \, - v \, y \)$,
  and replace the components by their adjoints with the finite-component matrices of the imaginary wedge boost at
  rapidity $i pi$ and the fixed statistics twist. Apply this operation to each factor in the #emph[original word
  order]; the order reversal above occurs in the vacuum distributions used to compute scalar products.
  This is precisely the finite-component reflection boundary calculation in the polynomial BW proof.
  It uses covariance, the spectrum condition, locality, and Hermitian conjugation,
  with no cluster limit or condition on the dimension of the invariant subspace.

The displayed identity shows that the conjugate-linear word map preserves norms and descends through all zero-norm
  polynomial relations. Reflected test functions again range over the full test space, so its range is dense.
  It therefore extends to an antiunitary $J_W$; reflection twice, with the normal-statistics phases,
  gives $J_W^2 = 1$. Now use polynomial vacuum vectors whose first point and successive gaps lie in an open
  wedge-ordered patch. Imaginary boost through rapidity $pi$ takes their ordered distributions through the
  positive-spectrum tubes, and locality at the spacelike boundary reverses the fields.
  Tube uniqueness makes their complex span Hilbert-dense. Adjoin the adjoint vectors and all real boost
  translates. The resulting span is boost-invariant and its adjunction agrees with $J_W e^(- pi B)$.
  To check that it is a graph core, let $cal(G)$ be its closed graph and smooth by $e^(- epsilon.alt B^2)$.
  This smoothing preserves $cal(G)$, and both $e^(- epsilon.alt B^2)$ and $e^(- pi B)
  e^(- epsilon.alt B^2)$ are bounded. Hilbert approximation by the indicated span consequently approximates every
  smoothed vector in graph norm. Finally $e^(- epsilon.alt B^2) xi arrow.r
  xi$ in the graph norm of $e^(- pi B)$ for $xi$ in its domain.
  This proves graph totality without a clustering argument.

Second, the polynomial and bounded-algebra graphs coincide under Assumption 2.
  Start with finite sums of factorized smeared words. If $A$ is a closed affiliated realization of such a
  polynomial with $Omega in "Dom" A ∩ "Dom" A^(*)$, its bounded polar cutoffs $A_m =
  A upright(bold(1))_(\[ 0 \, m \]) \( \| A \| \)$ satisfy

$ A_m Omega arrow.r A Omega \, wide A_m^(*) Omega arrow.r A^(*) Omega . $

For the second convergence use $A_m^(*) Omega = upright(bold(1))_(\[ 0 \, m \]) \( \| A \| \) A^(*) Omega$.
  Use natural-domain products and sums of the chosen closed affiliated single-field realizations.
  Their domains contain $cal(D)_(upright("old"))$, and their adjoints contain the corresponding adjoint
  polynomials there, so they are closable. Their natural domains and graphs are invariant under commutant
  unitaries; the closures remain affiliated. These are the extensions to which the same polar-cutoff argument
  applies. For an admitted compact joint kernel, first use a finite partition into product patches inside the
  localization region, then approximate each part by finite sums of tensor tests in its smooth test-function
  topology. The reversed adjoint kernels of these approximants converge to the reversed adjoint kernel in the same
  topology. The old Hilbert-valued joint-distribution bounds proved above pass both the vacuum and adjoint-vacuum
  vectors to the limit. Closedness of the bounded-algebra Tomita graph therefore gives the same graph inclusion
  for the joint word. This vector-level limit does not assert a closed affiliated realization for an arbitrary
  joint smear. Let $X_(upright("pol")) \( R \)$ be the closed real span of vacuum vectors of finite original
  polynomial expressions that are Hermitian on $cal(D)_(upright("old"))$ and compactly localized in $R$,
  with admitted compact joint kernels included by the graph limits just proved.
  This is an auxiliary vacuum-word graph space; it neither restricts the original test-function spaces nor
  redefines $cal(D)_(upright("old"))$. Consequently,

#[#set math.equation(numbering: n => "(2.2)")
 $ X_(upright("pol")) \( W \) subset X_(cal(M) \( W \)) subset X'_(cal(M) \( W' \)) subset
   X_(upright("pol")) \( W' \)' = X_(upright("pol")) \( W \) . $ <F:BW-sandwich>]

This proves equality and the bounded wedge modular formula.
  The inclusion in the middle is bounded locality, not a claim about commuting unbounded restrictions.
  To pass from graph equality to algebra wedge duality, use the modular-invariant-subalgebra theorem:
  a subalgebra invariant under the modular group of a faithful normal state admits a state-preserving conditional
  expectation #cite(label("Takesaki1972")); see also #cite(label("AccardiCecchini1982")) Theorems 3.5 and 5.2.
  If the subalgebra is $cal(N)$ and $E$ is this expectation, its GNS implementation is the vector identity

$ E \( x \) Omega = P_(overline(cal(N) Omega)) x Omega . $

Apply it to the local inclusion of the opposite, twist-corrected wedge algebra in $cal(M) \( W \)'$.
  The larger algebra’s modular group is the geometric opposite boost and preserves the smaller algebra.
  The latter has cyclic vacuum, so the implementing projection is the identity.
  The expectation is therefore the identity by separation, proving equality of these algebras.
  Double-cone duality is not used.

We use the following exact forms of the modular translation theorems #cite(label("Borchers1992"))
  #cite(label("ArakiZsido2005")); for the positive-translation statement we use the explicit formulation and proof
  in #cite(label("Borchers2000")) Theorem II.5.2. If $e^(i c b)$ fixes $Omega$, $b gt.eq 0$,
  and $"Ad" \( e^(i c b) \) cal(M) subset cal(M)$ for $c gt.eq 0$,
  where $Omega$ is cyclic and separating for $cal(M)$, then

#[#set math.equation(numbering: n => "(2.3)")
 $ e^(i s S_(cal(M))) b e^(- i s S_(cal(M))) = e^s b \, wide J_(cal(M)) b J_(cal(M)) = b . $ <F:Borchers>]

If $cal(N) subset cal(M)$ have the same cyclic separating vector and $"Ad" \( e^(i s S_(cal(M))) \) cal(N) subset
  cal(N)$ for $s gt.eq 0$, the half-sided modular inclusion theorem gives

#[#set math.equation(numbering: n => "(2.4)")
 $ H & = overline(S_(cal(M)) - S_(cal(N))) gt.eq 0 \, wide H Omega = 0 \, wide
   e^(i s S_(cal(M))) H e^(- i s S_(cal(M))) = e^s H \,\
J_(cal(M)) H J_(cal(M)) & = H \, wide cal(N) = "Ad" \( e^(i H) \) cal(M) \, wide e^(i s S_(cal(N))) =
  e^(i \( 1 - e^s \) H) e^(i s S_(cal(M))) . $ <F:HSMI>]

The closure in the first line is the self-adjoint closure on the common logarithm domain;
  subsequent sums of affine-group generators will have this meaning.
  The applicable inclusion result is #cite(label("ArakiZsido2005")) Theorem 2.1, specialized to a vector state.
  It requires no cyclicity for $cal(N)' ∩ cal(M)$. Since $J_(cal(M))$ is antiunitary,
  its unitary-group formula is $J_(cal(M)) e^(i t H) J_(cal(M)) = e^(- i t H)$,
  consistently with the generator formula above. These results also hold for standard real subspaces;
  one may apply the algebra result to their CCR Weyl algebras and restrict the vacuum modular objects to the
  one-particle space.

For later form comparisons, $X subset X_1$ implies $frak(s)_X subset frak(s)_(X_1)$.
  Thus the closed form of $Delta_X$ restricts that of $Delta_(X_1)$ and $Delta_X gt.eq Delta_(X_1)$ in form order.
  The resolvent integral for the operator-monotone logarithm gives $S_X lt.eq S_(X_1)$ on common operator domains.
  This statement by itself is weaker than the next lemma. Koot’s spectral characterization of inclusions of
  standard pairs uses the modular-strip and half-plane mechanism #cite(label("Koot2025")) Theorem 3.1,
  Lemma 3.4 and Theorem 3.5. We prove the contraction version between two possibly different standard spaces that
  is needed for the embedded comparison channels.

#thm([Lemma 2.3.])[
  (Strip comparison).  #emph[Let $X_i$ be standard real spaces with normalized modular generators $B_i$,
    and let $K_i gt.eq 0$ be self-adjoint with $e^(i t B_i) K_i e^(- i t B_i) = e^t K_i$.
    Suppose $j : cal(H)_1 arrow.r cal(H)_2$ is a contraction intertwining the boost groups and
$ j e^(i K_1) X_1 subset e^(i K_2) X_2 . $

 Then, for every $R gt.eq 0$,
#[#set math.equation(numbering: n => "(2.5)")
 $ upright(bold(1))_(\( R \, oo \)) \( K_2 \) j upright(bold(1))_(\[ 0 \, R \]) \( K_1 \) = 0 . $ <F:strip-bands>]

 In particular, for $s > 0$ and $xi in "Dom" K_1^s$, $j xi in "Dom" K_2^s$ and $∥K_2^s j xi∥ lt.eq ∥K_1^s xi∥$.]
] <F:strip-comparison>

#proof[
  We first prove that, for every $r > 0$,
  #[#set math.equation(numbering: n => "(2.6)")
   $ e^(r K_2) j e^(- r K_1) med upright("is everywhere defined and contractive") . $ <F:strip-exponential>]
  Its exponential growth on a high target band will then exclude that band from the image of a low source band.
  Set $A = e^(- i K_2) j e^(i K_1)$. It maps $X_1$ into $X_2$, so $frak(s)_2 A xi =
    A frak(s)_1 xi$ on $"Dom" frak(s)_1 = "Dom" Delta_1^(1 \/ 2)$. Equivalently,
  $ Delta_2^(1 \/ 2) A xi = J_2 A J_1 Delta_1^(1 \/ 2) xi wide \( xi in "Dom" Delta_1^(1 \/ 2) \) . $
  Thus $Delta_2^(1 \/ 2) A Delta_1^(- 1 \/ 2)$, initially on $"Dom" Delta_1^(- 1 \/ 2)$,
    has the contractive bounded extension $J_2 A J_1$. The operators
  $ F \( z \) = Delta_2^(i z) A Delta_1^(- i z) \, wide - 1 / 2 < "Im" z < 0 \, $
  have contractive boundary values: the real boundary multiplies $A$ on either side by a unitary,
    and the other boundary is $Delta_2^(i t) J_2 A J_1 Delta_1^(- i t)$.
    The analytic-extension theorem #cite(label("ArakiZsido2005")) Theorem 2.3, followed by three lines,
    gives the contractive analytic continuation to the strip.
    Equivalently, sandwich between bounded spectral intervals of the modular logarithms,
    apply three lines to their scalar matrix coefficients, and remove the intervals.
    The displayed Tomita relation supplies the full source domain needed at the second boundary.
    Write $tilde(F) \( zeta \) = F \( z \)$ for $zeta = e^(- 2 pi z)$,
    which maps the strip bijectively onto the upper half-plane.
    Boost covariance and the intertwining property of $j$ identify its positive real boundary value as
    $e^(- i zeta K_2) j e^(i zeta K_1)$. To justify the interior expression despite its potentially unbounded
    first factor, take $xi$ and $eta$ in bounded spectral bands of $K_1$ and $K_2$, respectively. The scalar function
  $ ⟨e^(i overline(zeta K)_2) eta \, j e^(i zeta K_1) xi⟩ $
  is entire and agrees with $⟨eta \, tilde(F) \( zeta \) xi⟩$ on a positive real interval.
    Boundary uniqueness, or reflection of their zero difference across that interval,
    identifies them throughout the upper half-plane. At $zeta = i r$, $r > 0$, contractivity therefore gives
  $ lr(|⟨e^(r K_2) eta \, j e^(- r K_1) xi⟩|) lt.eq ∥eta∥ thin ∥xi∥ . $
  Bounded spectral vectors are a core for $e^(r K_2)$. The adjoint-domain criterion implies $j e^(- r K_1) xi in
    "Dom" e^(r K_2)$ and identifies its image with $tilde(F) \( i r \) xi$.
    Finally approximate any source vector by its $K_1$ spectral truncations.
    Boundedness of $e^(- r K_1)$ and $tilde(F) \( i r \)$, followed by closedness of $e^(r K_2)$,
    proves that $e^(r K_2) j e^(- r K_1)$ is everywhere defined and contractive.
    If $xi = upright(bold(1))_(\[ 0 \, R \]) \( K_1 \) xi$, apply this extension to $e^(r K_1) xi$ to obtain
  $ ∥e^(r K_2) j xi∥ lt.eq e^(r R) ∥xi∥ . $
  Projection onto $K_2 gt.eq R + epsilon.alt$ and $r arrow.r oo$ shows that this projection annihilates $j xi$.
    Taking $epsilon.alt arrow.b 0$ proves (2.5). The resulting tail inequality is
  $ ∥upright(bold(1))_(\( a \, oo \)) \( K_2 \) j xi∥ lt.eq ∥upright(bold(1))_(\( a \, oo \)) \( K_1 \) xi∥ . $
  Integrate its square against $2 s a^(2 s - 1) upright(d) a$.
    Truncation followed by monotone convergence proves both the domain assertion and the norm bound. ◻
]

=== 2.5 Timelike vacuum channels <F:waves>

Fix future null vectors $n \, macron(n)$ with $n dot.op macron(n) = 1$ and orthonormal transverse axes $e_i$, $i =
  1 \, 2$, with $e_i dot.op e_j = - delta_(i j)$. Write

#[#set math.equation(numbering: n => "(2.7)")
 $ x = v n + u macron(n) + y \, wide p = a n + b macron(n) + k \, wide p dot.op x = a u + b v -
   bold(k) dot.op bold(y) \,\
2 a b = M^2 + \| bold(k) \|^2 . $ <F:null-coordinates>]

The variables $a \, b \, bold(k)$ also denote their commuting momentum operators.
  Coordinate subscripts on covariant tensors mean contraction with the coordinate basis vectors.
  The boost $B$ acts on spacetime by $v partial_v - u partial_u$, and null rotations $G_i$ by $u partial_i +
  y_i partial_v$.

Disintegrate the positive two-point measure of a dimension-$d$ multiplet on the open timelike cone.
  Lorentz transformations and dilations act transitively there,
  so relative to $upright(d)^4 p$ its vacuum amplitude at rest has norm proportional to $M^(d - 2)$.
  The proportionality is a positive finite-dimensional rotation-invariant matrix;
  transport to other momenta uses the finite Lorentz matrices and unitary fiber transport.
  There is no independent positive singular measure on an interior mass shell,
  since dilation moves every positive mass shell and fixes the homogeneous measure class on their union.

A possible contribution on the nonzero light cone is normalized instead by $upright(d)^4 p thin theta \( p^0 \)
  delta \( p^2 \)$. Its amplitude on a fixed null ray would grow as energy to the power $d - 1$.
  A boost along that ray has only the boost weights of the finite Lorentz multiplet;
  positivity therefore excludes the contribution if $d - 1$ exceeds their maximum.
  The maxima are one for a vector and two for a symmetric rank-two tensor, whereas $d -
  1$ is respectively two and three for $V$ and $T$. A zero-momentum atom for a positive-dimensional field is also
  impossible: its norm is invariant under unitary dilation but would be multiplied by $e^(s d)$.
  Thus both $V Omega$ and $T Omega$ have purely timelike spectrum.

Let $Theta = T^mu zws_mu$. At this stage define only vacuum waves,

#[#set math.equation(numbering: n => "(2.8)")
 $ l = - Theta \/ M^2 \, wide J_mu = V_mu - i p_mu l \, wide t_(mu nu) = T_(mu nu) - 1 /
   3 \( - eta_(mu nu) M^2 + p_mu p_nu \) l . $ <F:wave-decomposition>]

The local Ward identities imply $p^mu J_mu = 0$, $p^mu t_(mu nu) = 0$, and $eta^(mu nu) t_(mu nu) = 0$.
  At rest their rotation types are respectively spin zero, one, and two, so they are orthogonal.
  Their rest norms are constant, proportional to $M$, and proportional to $M^2$.
  In particular $l$ is a well-defined dimension-two wave; division by $M^2$ has introduced no infrared singularity
  in its two-point measure.

These channels have the two-point data of a scalar primary of dimension two,
  a conserved vector primary of dimension three, and a conserved symmetric traceless primary of dimension four.
  This follows directly from the uniqueness of a positive rotation-invariant metric on each of the three rest
  representations and homogeneous Lorentz transport. Equivalently their position-space kernels are the
  positive-energy boundary values proportional to

$ frac(1, \( x^2 \)^2) \, wide frac(I_(mu nu) \( x \), \( x^2 \)^3) \, wide
  frac(I_(mu rho) I_(nu sigma) + I_(mu sigma) I_(nu rho) - eta_(mu nu) eta_(rho sigma) \/ 2, 2 \( x^2 \)^4) \,
  quad I_(mu nu) = eta_(mu nu) - frac(2 x_mu x_nu, x^2) . $

Their overall constants include the prescribed spectral boundary normalization.
  Let $Pi subset cal(H)$ be the Hilbert sum of these wave channels, omitting zero-norm channels.
  Kernel covariance defines an auxiliary unitary conformal action on $Pi$:
  transform tube point vectors with their indicated tensor matrices and weights,
  observe preservation of their scalar products, and extend from their dense span.
  This is a comparison representation, not yet a symmetry of the physical theory.
  Its real localization spaces can equivalently be constructed as those of the corresponding positive generalized
  free fields.

The following rest axes are adapted to the fixed null direction:

#[#set math.equation(numbering: n => "(2.9)")
 $ e_z^(\( n \)) = M / b n - p / M \, wide e_i^(\( n \)) = e_i + k_i / b n . $ <F:tetrad>]

They are orthogonal to $p$, have squared norm $- 1$, and are mutually orthogonal.
  Define the constant spin labels $j_A$ and $s_(A B)$ by the components of $J \/ \( i M \)$ and $t \/
  M^2$ in this tetrad, and put $s_z = s_(z z)$. Then

#[#set math.equation(numbering: n => "(2.10)")
 $ V_v = i b c_V \, wide T_(v v) = b^2 c_T \, wide c_V = l + j_z \, wide c_T = l \/ 3 + s_z . $ <F:longitudinal-labels>]

The phases refer to real derivatives of Hermitian fields.
  Expansion of (2.9) shows that every stress component is a linear combination of constant labels with polynomial
  coefficients in $a \, b \, k \, M$, allowing only powers of $b$ in the denominators.
  Its norm is bounded by a constant times $w_alpha w_beta$, where

#[#set math.equation(numbering: n => "(2.11)")
 $ w_u = a \, wide w_i = sqrt(a b) \, wide w_v = b . $ <F:component-weights>]

For example $M \, \| k \| lt.eq sqrt(2 a b)$, and the apparent $1 \/
  b$ factors in the rest axes acquire a compensating $M$ or $k$ from the rest amplitude.

=== 2.6 Scalar comparison copies <F:scalar-comparisons>

For each label in the following table, some tangential derivative of $M^nu
  d_(*)$ is the vacuum wave of a physical differential field:

#[#set math.equation(numbering: n => "(2.12)")
 $ d_(*) & nu\
c_V \, c_T & 0\
l \, j_z \, s_z & 2\
j_i \, s_(z i) & 1\
\( s_(i j) \)_(perp upright("TF")) & 2 $ <F:comparison-table>]

Here the derivative has multiplier $b^m$ for some integer $m gt.eq 0$, up to a fixed phase.
  To see the physical content of this claim, set $q_i = b e_i + k_i n$,
  a vector whose contractions are differential combinations with polynomial coefficients. The identities

$ M^2 l = - Theta \, wide b M^2 j_z = M^2 V_v \/ i + b Theta \, wide b^2 M^2 s_z = M^2 T_(v v) + b^2 Theta \/ 3 $

prove the scalar and longitudinal entries. Since $p dot.op q_i = 0$,

$ V \( q_i \) = i b M j_i \, wide T \( n \, q_i \) = b^2 M s_(z i) \, wide
  #scale(x: 120%, y: 120%)[\(] T \( q_i \, q_j \) #scale(x: 120%, y: 120%)[\)]_(perp upright("TF")) =
  b^2 M^2 \( s_(i j) \)_(perp upright("TF")) . $

The scalar improvement in (2.8) drops from the first mixed tensor contraction and from the transverse traceless
  part. Finally $c_V \, c_T$ come directly from (2.10). All factors $M^2 \, b \,
  k_i$ in these identities are polynomial momentum multipliers;
  no inverse differential operator has been declared local.
  The scalar reality phase may be chosen as $- i$ on the $j_i \, s_(z i)$ copies and as $1$ on the other entries.
  This accounts for the factor $i$ in a real tangential derivative.

Suppose a region $R$ is invariant under positive $v$ translations, as are the cuts used below.
  Derivatives in $v$ can be removed in the real closure of its wave space.
  Choose real $rho in C_c^oo \( 0 \, 1 \)$ with integral one, and set $rho_R \( v \) = R^(- 1) rho \( v \/ R \)$.
  For a test function $f$ supported in the region, the wave of $\( 1 - rho_R *_v \)^m
  f$ has multiplier $\( 1 - hat(rho) \( R b \) \)^m$ and converges to that of $f$ by dominated convergence,
  since $b > 0$ almost everywhere. Each such test has its first $m$ $v$-moments zero.
  Its $m$-fold primitive is therefore compactly supported; choosing the primitive to vanish at $v = -
  oo$ keeps its support in the positive-$v$ hull of the original support and its positive translates.
  Thus it is the $m$th derivative of a real test in the same region.
  With the fixed derivative phase, the scalar generalized free wave space of dimension $2 +
  nu$ on each label embeds in $X \( R \)$.

For $W = { u < 0 \, v > 0 }$ this copy has precisely its own scalar wedge Tomita data.
  Indeed, its embedding intertwines boosts and the wedge reflection, including the derivative phase;
  hence its projection reduces $J_W e^(- pi B)$, and the fixed real space is the scalar one.
  This does not say that its curved-cut real space exhausts physical localization.

In light-front variables the measure is, up to one common fixed normalization,

#[#set math.equation(numbering: n => "(2.13)")
 $ upright(d)^4 p = frac(upright(d) b, b) thin upright(d)^2 k thin M upright(d) M \, wide b > 0 \,
   M > 0 . $ <F:lightfront-measure>]

For a scalar copy of dimension $2 + nu$, put $Y = i partial_k$ and define

#[#set math.equation(numbering: n => "(2.14)")
 $ H_nu = b \( \| Y \|^2 + h_nu \) \, wide h_nu = - partial_M^2 - M^(- 1) partial_M +
   nu^2 \/ M^2 . $ <F:Hankel-generator>]

The operator $h_nu$ is the regular nonnegative Hankel realization on $L^2 \( bb(R)_(+) \, M upright(d) M \)$:
  the Hankel transform with kernel $J_nu \( M r \)$ conjugates it to multiplication by $r^2$.
  In particular, the logarithmic solution at zero is excluded when $nu = 0$.

The associated null conformal map is

#[#set math.equation(numbering: n => "(2.15)")
 $ \( u \, y \, v \) mapsto \( gamma u \, gamma y \, v + c gamma \| y \|^2 \) \, wide
   gamma = \( 1 - 2 c u \)^(- 1) \, wide c > 0 . $ <F:null-conformal-map>]

It maps $W$ diffeomorphically to

$ - frac(1, 2 c) < u < 0 \, wide v > frac(\| y \|^2, 2 u + 1 \/ c) . $

Two-point conformal covariance therefore maps the scalar wedge real space onto the scalar real space of this
  region. Its unitary implementer is $e^(i c H_nu)$. For verification, apply (2.14) to $M^nu e^(i p dot.op x)$.
  The direct expression is

$ H_nu \( M^nu e^(i p dot.op x) \) = (2 u^2 a - 2 u k dot.op y + b \| y \|^2 - 2 i u \( nu + 2 \)) M^nu
  e^(i p dot.op x) . $

For complex tube coordinates, the squares in this formula are analytic bilinear squares.
  Multiplication by $i$ gives the infinitesimal coordinate action

$ 2 u^2 partial_u + 2 u y_i partial_i + \| y \|^2 partial_v + 2 u \( 2 + nu \) \, $

which integrates to (2.15) with the scalar weight. This calculation is valid on tube point vectors:
  their imaginary future displacement gives exponential damping in $b$ and Gaussian damping in $k \,
  M$ at fixed $b$; at $M = 0$ their radial behavior is $M^nu$ times an even smooth function,
  the regular Hankel boundary condition. Applying any power of $b \( \| Y \|^2 + h_nu \)$ retains an integrable
  polynomial times this damping. The factors of $b$ cancel the inverse Gaussian variances as $b arrow.b 0$.
  Consequently differentiation occurs in the operator domain.
  Uniqueness of the unitary evolution identifies this realization with the kernel-covariance implementer.

=== 2.7 The physical null-cut generators <F:cuts>

For a real transverse profile $f$, define

#[#set math.equation(numbering: n => "(2.16)")
 $ W_f = "int" {u < 0 : v + frac(\| y - z \|^2, - 2 u) gt.eq
   f \( z \) upright(" for every ") z in bb(R)^2} . $ <F:cut-definition>]

Equivalently, put

$ cal(L)_d f \( y \) = sup_z (f \( z \) - frac(\| y - z \|^2, 2 d)) \; wide W_f = { u < 0 \,
  v > cal(L)_(- u) f \( y \) }^compose . $

The allowed profiles initially are nonnegative bounded smooth functions and nonnegative circular parabolas of
  positive curvature. We subsequently allow constants of either sign,
  and sums of a bounded smooth function with a positive-curvature circular parabola.
  All bounded smooth profiles used in estimates have the stated derivatives bounded.
  Write $p_d \( y \) = \| y - d \|^2$ and $W = W_0$.

For a nonnegative profile, $W_f subset W$ has nonempty open interior and an open spacelike complement.
  Reeh–Schlieder and the test-space density above make the vacuum vectors of finite factorized polynomials from
  one small double cone dense. Their affiliated realizations have bounded polar cutoffs in the algebra,
  so $Omega$ is cyclic for $cal(M) \( W_f \)$. Locality and cyclicity in the complement make it separating.
  The boost sends $W_f$ to $W_(e^s f)$, which is contained in $W_f$ for $s gt.eq 0$.
  Every hypothesis of (2.4) is therefore met, and it defines $H_f gt.eq 0$ with

#[#set math.equation(numbering: n => "(2.17)")
 $ S \( W_f \) = B - H_f \, wide cal(M) \( W_f \) = "Ad" \( e^(i H_f) \) cal(M) \( W \) \,\
e^(i s S \( W_f \)) = e^(i \( 1 - e^s \) H_f) e^(i s B) \, wide H_(lambda f) =
  lambda H_f quad \( lambda > 0 \) . $ <F:cut-modular>]

The last assertion follows by conjugating the modular difference by a boost and applying its affine covariance.

Translations $e^(i c b)$ act inward on both $W$ and $W_f$ for $c gt.eq 0$.
  Equation (2.3) says that both modular groups scale $b$ by the same factor;
  their quotient in (2.17) consequently commutes with the whole $b$-group. Hence $H_f$ and $b$ strongly commute.
  A constant translation gives

#[#set math.equation(numbering: n => "(2.18)")
 $ H_(f + c) = H_f + c b . $ <F:constant-shifts>]

Use this identity to define signed profiles bounded below;
  it agrees with their modular difference and is independent of the positive shift chosen.
  Inclusion and modular-log order then give, for bounded $g$,

#[#set math.equation(numbering: n => "(2.19)")
 $ - ∥g∥_oo b lt.eq H_g lt.eq ∥g∥_oo b . $ <F:bounded-cut-bound>]

The inequalities can first be tested on vectors with $b$ in a compact band,
  smooth for the relevant affine-group representations. On such a band they assert a bounded self-adjoint
  extension, and exhaustion of the bands gives the displayed decomposable-operator inequality.

#thm([Proposition 2.4.])[
  (Parabolic generators).  #emph[On ${ b > 0 }$ there is a boost-independent internal Hilbert space $cal(K)$ and a
    nonnegative self-adjoint operator $h$ on it such that
#[#set math.equation(numbering: n => "(2.20)")
 $ cal(H)_(b > 0) tilde.eq L^2 \( bb(R)_(+) \, upright(d) b \/ b \) ⊗ L^2 \( bb(R)^2 \, upright(d)^2 k \) ⊗
   cal(K) \, wide H_(p_d) = b #scale(x: 120%, y: 120%)[\(] \| Y - d \|^2 + h #scale(x: 120%, y: 120%)[\)] \, quad
   Y = i partial_k . $ <F:parabolic-form>]

 Here $G = b Y$, $P_i = - k_i$, and $\( e^(i s B) psi \) \( b \, k \) = psi \( e^s b \, k \)$.
   The operators $H_(p_d)$ vanish on $ker b$. Moreover $J_W b J_W = b$, $J_W Y J_W = Y$, and $J_W h J_W = h$.]
] <F:parabolic-generator>

#proof[
  Put $H = H_(p_0)$. Completion of the square in (2.16) shows that $W_(p_0 \/ \( 2 R \))$ is the portion,
    with $u < 0$, of the future cone with tip $\( u \, v \, y \) = \( - R \, 0 \, 0 \)$.
    The null rotations about this tip have generators $G_i + R P_i$.
    They preserve the algebra and the vacuum, so commute with its modular group
    $e^(i \( 1 - e^s \) H \/ \( 2 R \)) e^(i s B)$. Set $tau = \( 1 - e^s \) \/ \( 2 R \)$.
    Boost conjugation of the rotation group then gives, at the level of Weyl elements, the transformation
  $ \( \( 1 - 2 R tau \) beta \, R beta \) mapsto \( beta \, R beta \) $
  for coefficients of $\( G \, P_perp \)$; its central coefficient $b$ is fixed.
    For a fixed sufficiently small nonzero $tau$, vary $R$ over an open positive interval.
    Two distinct values give linearly independent coefficient pairs.
    Multiplying the corresponding Weyl elements, with the same central Weyl phase on both sides, yields the full shear
  #[#set math.equation(numbering: n => "(2.21)")
   $ "Ad" \( e^(i tau H) \) G_i = G_i \, wide "Ad" \( e^(i tau H) \) P_i = P_i + 2 tau G_i . $ <F:parabolic-shear>]
  The group law extends it to every real $tau$.
  Positive energy confines the nonzero momentum spectrum on $ker b$ to one null ray.
    A small spatial rotation takes this ray to a disjoint ray;
    a vector supported there would be orthogonal to its arbitrarily small rotations,
    contradicting strong continuity. Thus $ker b$ is precisely the zero-momentum subspace.
    On it $P_i = 0$, and (2.21) forces $G_i = 0$. Repeating in all null directions makes every connected Lorentz
    generator vanish there. In particular $B = 0$, and $e^(i s B) H e^(- i s B) = e^s H$ forces $H =
    0$ on this subspace.
  For $b > 0$, the null rotations and transverse translations form the Weyl pair $G_i = b Y_i$, $P_i = - k_i$.
    Their regular representation is the Schrödinger representation with a multiplicity space;
    the boost action on $log b$ trivializes that multiplicity over $b$. This gives the representation in (2.20).
    The operator $b \| Y \|^2$ implements exactly the shear (2.21).
    Consequently $e^(- i t b \| Y \|^2) e^(i t H)$ commutes with the transverse Weyl representation and with $b$.
    It is a one-parameter unitary group on the multiplicity space, fiber by fiber.
    Boost homogeneity identifies its generator as $b h$ with $h$ independent of $b$.
    Since $H gt.eq 0$, its expression $b \( \| Y \|^2 + h \)$ implies $h gt.eq 0$:
    localize the $Y$ variable near zero and test an arbitrary spectral interval of $h$.
  Transverse translation covariance replaces $Y$ by $Y - d$, proving the formula for $p_d$.
    The modular-conjugation relation for $H$ and $b$, together with geometric conjugation of the null rotations,
    gives the three statements involving $J_W$. ◻
]

The use of a regular Weyl representation in this proof is the multiplicity form of the Stone–von Neumann theorem,
  or equivalently translation imprimitivity. No assertion that the internal space consists only of one-field waves
  is made. In the channels of $Pi$, $M$ and the spin labels are internal variables.

#thm([Proposition 2.5.])[
  (Bounded cuts commute with the parabolic data).  #emph[For bounded smooth $g$,
$ H_g = b h_g \, wide ∥h_g∥ lt.eq ∥g∥_oo \, $

 where $h_g$ is independent of $b$ and strongly commutes with $Y \, h$.]
] <F:bounded-commutation>

#proof[
  The formula (2.20) and constant shifts make all parabolic generators commute.
    Consequently $"Ad" \( e^(i t H_(p_d)) \) cal(M) \( W_q \) =
    cal(M) \( W_(q + t p_d) \)$ for every positive-curvature circular parabola $q$ and $t gt.eq 0$.
    To pass to a bounded $g$ we need an algebra-generation argument.
    For $x_0 = \( u_0 \, v_0 \, y_0 \)$, $u_0 < 0$, its null shadow is
  $ q_(x_0) \( z \) = v_0 + frac(\| z - y_0 \|^2, - 2 u_0) \, wide W_(q_(x_0)) = I^(+) \( x_0 \) ∩ { u < 0 } . $
  Given a double cone compactly contained in $W_g$, choose $x_0$ slightly timelike before its lower tip,
    still inside $W_g$. Its shadow strictly dominates $g$ and its future cone contains the double cone.
    Conversely, $q gt.eq g$ implies $W_q subset W_g$. Inner generation therefore proves
  #[#set math.equation(numbering: n => "(2.22)")
   $ cal(M) \( W_g \) = or.big_(q > g) cal(M) \( W_q \) . $ <F:parabolic-generation>]
  For $W_(g + t p_d)$ the interior-shadow construction supplies a generating subfamily of dominating parabolas of
    curvature strictly greater than $t$. Indeed lower curvature cannot dominate $g +
    t p_d$ at transverse infinity, while equality corresponds to the boundary value $u_0 = -
    1 \/ \( 2 t \)$ and cannot be the shadow of an interior point.
    Thus the join defining $cal(M) \( W_(g + t p_d) \)$ may be restricted to all dominating parabolas of curvature
    greater than $t$. Subtraction of $t p_d$ bijects this restricted family with the positive-curvature parabolas
    dominating $g$. Arbitrary dominating parabolas may have curvature exactly $t$;
    they are not needed for the generating family. Taking joins yields
  $ "Ad" \( e^(i t H_(p_d)) \) cal(M) \( W_g \) = cal(M) \( W_(g + t p_d) \) . $
  Conjugate the modular group and use $"Ad" \( e^(i t H_(p_d)) \) B = B - t H_(p_d)$.
    Applying the same identity to $lambda g$ and $lambda t$, then dividing by $lambda$ by boost homogeneity, gives
  #[#set math.equation(numbering: n => "(2.23)")
   $ H_(g + t p_d) = t H_(p_d) + e^(i lambda t H_(p_d)) H_g e^(- i lambda t H_(p_d)) quad \( lambda > 0 \) .
     $ <F:parabola-addition>]
  There is no need to differentiate an unspecified unbounded sum.
    On a band $epsilon.alt lt.eq b lt.eq L$, $H_g$ is bounded by $L ∥g∥_oo$.
    The second term in (2.23) is independent of $lambda$, and its strong limit as $lambda arrow.b 0$ is $H_g$.
    It follows that $H_g$ commutes with the full group of every $H_(p_d)$.
    Exhausting the $b$ bands proves strong commutation globally.
    In the joint calculus of the commuting parabolic family,
  $ H_(p_d) - H_(p_0) = b \( - 2 d dot.op Y + \| d \|^2 \) . $
  These differences recover $Y$ on $b > 0$, and $H_(p_0) \/ b - \| Y \|^2$ recovers $h$.
    Hence $H_g$ commutes with $Y \, h$. Finally (2.19) gives the bounded operator $h_g = H_g \/ b$,
    and boost homogeneity makes it independent of $b$. ◻
]

We next justify the reflected localization needed for lower bounds.
  The wedge conjugation reflects $\( u \, v \, y \)$ to $\( - u \, - v \, y \)$.
  Even if its action on an arbitrarily chosen bounded double-cone algebra has not been postulated,
  it produces a net compatible with the original one in spacelike separation.
  Indeed every bounded operation in a double cone belongs to all containing wedge algebras;
  their images under $J_W$ are the corresponding reflected,
  twist-corrected wedge algebras by (2.2) and Poincaré covariance.
  Two compact spacelike separated double cones admit separating complementary wedges.
  To see this, write their causal tips as $a_i \, b_i$. A future null linear functional separating $b_1$ from
  $a_2$, and a second one separating $b_2$ from $a_1$, define the two wedge boundaries;
  their strict inequalities place the cones in opposite wedges. Locality of these wedge algebras gives the claim.

In particular, the reflected region $J_W W_(- g)$ is spacelike to $W_g$.
  This also follows directly by minimizing the sum of the two quadratic penalties in (2.16); for $s \,
  t > 0$ its minimum is $\| y_(-) - y_(+) \|^2 \/ \( 2 \( s + t \) \)$. Thus

#[#set math.equation(numbering: n => "(2.24)")
 $ J_W X \( W_(- g) \) subset X \( W_g \)' \, wide H_g gt.eq - H_(- g) . $ <F:reflected-order>]

For the second implication use modular-log order, $J_W B J_W = - B$, and $J_W H_g J_W = H_g$.
  The latter follows from the positive-cut conjugation relation and the constant-shift formula.

#thm([Lemma 2.6.])[
  (Taylor comparison).  #emph[If $g$ is bounded and smooth with bounded Hessian, then
#[#set math.equation(numbering: n => "(2.25)")
 $ \| h_g - g \( Y \) \| lt.eq C h \, wide C = 1 / 2 sup_y ∥g'' \( y \)∥ . $ <F:taylor-equation>]

 In particular $∥\( h_g - g \( Y \) \) psi∥ lt.eq C ∥h psi∥$ for $psi in "Dom" h$.]
] <F:taylor-bound>

#proof[
  For every transverse center $z$,
  $ g \( y \) lt.eq g \( z \) + nabla g \( z \) dot.op \( y - z \) + C \| y - z \|^2 . $
  The right side is a signed positive-curvature parabola if $C > 0$. Inclusion, modular-log order, and (2.20) give
  $ h_g lt.eq g \( z \) + nabla g \( z \) dot.op \( Y - z \) + C \| Y - z \|^2 + C h . $
  Applying the same argument to $- g$ and then (2.24) gives the lower inequality with both occurrences of $C$
    negated. For this fixed $g$, all operators involved commute strongly by Proposition 6.
    Impose the inequalities first for a countable dense set of $z$ and then, on each joint spectral fiber,
    let $z$ tend to the value of $Y$. They become $- C h lt.eq h_g - g \( Y \) lt.eq
    C h$ in a commuting spectral calculus, which proves both assertions.
    If $C = 0$, boundedness makes $g$ constant and the result is (2.18). ◻
]

#thm([Proposition 2.7.])[
  (Scalar spectral comparison).  #emph[On any scalar copy from (2.12),
    with its embedding into the ambient internal space understood, one has
#[#set math.equation(numbering: n => "(2.26)")
 $ upright(bold(1))_(\( lambda \, oo \)) \( h \) upright(bold(1))_(\[ 0 \, lambda \]) \( h_nu \) = 0 \,
   wide ∥h^s psi∥ lt.eq ∥h_nu^s psi∥ quad \( s > 0 \) . $ <F:spectral-equation>]

 The norm assertion includes the corresponding inclusion of domains.
   It does not assert that $h$ leaves the scalar copy invariant. For bounded profiles $f lt.eq g$ one also has
#[#set math.equation(numbering: n => "(2.27)")
 $ upright(bold(1))_(\( lambda \, oo \)) \( h_f \) upright(bold(1))_(\( - oo \, lambda \]) \( h_g \) =
   0 . $ <F:bounded-spectral-order>]

]
] <F:spectral-comparison>

#proof[
  Let $j_nu$ embed the scalar comparison copy. The derivative-removal argument in Section 2.6 gives its real wave
    localization inside the physical cut space. By (2.15) and (2.17),
  $ j_nu e^(i c H_nu) X_nu \( W \) subset e^(i c H_(p_0)) X \( W \) wide \( c > 0 \) . $
  The embedding intertwines the flat wedge boosts, so Lemma 4 applies.
    It also intertwines the external variables $b \, Y$. To see the latter point independently of the internal
    operator $h$, a null rotation $N_beta$ fixes $n \, b \, M$ and sends $k$ to $k + b beta$ and $e_i$ to $e_i +
    beta_i n$. The adapted axes in (2.9) therefore satisfy $N_beta e_A^(\( n \)) \( p \) =
    e_A^(\( n \)) \( N_beta p \)$ for $A = z \, 1 \, 2$. The constant labels and their fixed derivative phases
    transform accordingly. Thus $j_nu$ intertwines the null-rotation groups generated by $G = b Y$,
    as well as $b$; disintegration on $b > 0$ gives the claimed $Y$ intertwining.
    This uses the Poincaré action on the comparison waves and does not require $h$ to preserve their individual
    channels. Both sides are decomposable in $b \, Y$, and $j_nu$ intertwines these variables.
    In the common spectral fibers their generators are $b \( \| Y \|^2 + h_nu \)$ and $b \( \| Y \|^2 + h \)$.
    Subtracting the common scalar $b \| Y \|^2$ and dividing by $b >
    0$ in the band-inclusion conclusion gives the first assertion in (2.26).
    More formally, apply the whole-generator conclusion for rational band endpoints,
    localize $\( b \, Y \)$ to shrinking measurable rectangles,
    and use monotone convergence of spectral projections. The power bound follows by integrating spectral tails as
    in Lemma 4.
  If $f lt.eq g$, the cut inclusion is $W_g subset W_f$. Apply the same lemma with source $g$, target $f$,
    and the identity embedding. If needed add the same constant to make both profiles nonnegative.
    After disintegrating $b$, removing this common constant gives (2.27).
    This is spectral order obtained from an analytic strip, rather than from ordinary quadratic-form order. ◻
]

=== 2.8 Normal displacement and the required form domain <normal-displacement-and-the-required-form-domain>

#thm([Lemma 2.8.])[
  (Normal form bound).  #emph[Let $g$ be bounded and smooth with Lipschitz constant $C_1$,
    and write $H_g \( - delta \) = e^(- i delta a) H_g e^(i delta a)$. For $delta \, lambda > 0$,
#[#set math.equation(numbering: n => "(2.28)")
 $ plus.minus #scale(x: 120%, y: 120%)[\(] H_g - H_g \( - delta \) #scale(x: 120%, y: 120%)[\)] lt.eq
   delta (a / lambda + frac(lambda C_1^2, 2) b) $ <F:normal-displacement>]

 as forms on a joint momentum-smooth core. The commutator form with $a$ extends continuously to $"Dom"
   sqrt(1 + a + b)$. If $psi in ⋂_(m gt.eq 1) "Dom" \( 1 + a + b \)^m$, then $H_g psi in "Dom" sqrt(a)$.]
] <F:lipschitz-form>

#proof[
  The quadratic sup-convolution obeys $cal(L)_(d + delta) f = cal(L)_d \( cal(L)_delta f \)$.
    Completing the square in the Lipschitz estimate gives
  $ cal(L)_delta \( lambda g \) \( y \) lt.eq lambda g \( y \) + frac(delta lambda^2 C_1^2, 2) . $
  Hence the cut with profile $lambda g + delta lambda^2 C_1^2 \/ 2$, translated by $u = - delta$,
    lies inside $W_(lambda g)$. The translated boost is $B - delta a$. Modular-log order thus gives
  $ B - delta a - lambda H_g \( - delta \) - frac(delta lambda^2 C_1^2, 2) b lt.eq B - lambda H_g . $
  This is the upper sign of (2.28). Apply $J_W$, which fixes $a \, b \,
    H_g$ and reverses the translation parameter by antiunitarity, and then translate by $- delta$;
    this gives the lower sign. One may initially use vectors smooth for translations and the boost,
    then remove the boost smoothing in the resulting form bound.
  Put $E = 1 + a + b$ and $Q_lambda = a \/ lambda + lambda C_1^2 b \/ 2$.
    Differentiating at $delta = 0$ on momentum-smooth vectors defines the Hermitian form
  $ c_g \( phi.alt \, psi \) = i #scale(x: 120%, y: 120%)[\(] ⟨a phi.alt \, H_g psi⟩ - ⟨H_g phi.alt \,
    a psi⟩ #scale(x: 120%, y: 120%)[\)] . $
  Differentiation is legitimate using $H_g = b h_g$, bounded $h_g$, and translation smoothness of both vectors;
    it does not presume that $H_g$ preserves $"Dom" a$. The two inequalities give $\| c_g \( psi \, psi \) \|
    lt.eq ⟨psi \, Q_lambda psi⟩$. Polarization, or representation of this Hermitian form after
    $Q_lambda^(1 \/ 2)$, gives
  #[#set math.equation(numbering: n => "(2.29)")
   $ \| c_g \( phi.alt \, psi \) \| lt.eq ∥Q_lambda^(1 \/ 2) phi.alt∥ thin ∥Q_lambda^(1 \/ 2) psi∥ .
     $ <F:commutator-form>]
  For fixed $lambda$ this proves continuity in the $E^(1 \/ 2)$ form norm.
  For the domain assertion set $chi = H_g psi$. The $b$ bound and strong $b$ commutation imply $chi in "Dom"
    sqrt(1 + b)$. On a joint spectral core for $a \, b$,
  $ ⟨a phi.alt \, chi⟩ = ⟨H_g phi.alt \, a psi⟩ - i c_g \( phi.alt \, psi \) \, wide \| ⟨H_g phi.alt \,
    a psi⟩ \| lt.eq ∥g∥_oo ∥sqrt(b) thin phi.alt∥ ∥sqrt(b) thin a psi∥ . $
  Both terms are continuous in $∥sqrt(E) thin phi.alt∥$. Adding $⟨\( 1 + b \) phi.alt \, chi⟩$ consequently gives
  $ \| ⟨E phi.alt \, chi⟩ \| lt.eq C_psi ∥sqrt(E) thin phi.alt∥ . $
  The spectral theorem characterizes this inequality as $chi in "Dom" sqrt(E)$:
    test with spectral truncations of $chi$ and let their endpoints tend to infinity.
    Thus $H_g psi in "Dom" sqrt(a)$, as required. ◻
]

When opposite localization of conjugated bounded operations is needed, one may therefore use the reflected,
  twist-corrected net just described. It is spacelike compatible with the original net.
  Conjugating a chosen original affiliated realization by $J_W$ gives an affiliated realization in the reflected
  algebra, with its polynomial restriction on $J_W cal(D)_(upright("old"))$.
  On generated factorized vacuum words, its vacuum and adjoint-vacuum data are the reflected-adjoint word data
  from the wedge boundary calculation; admitted compact joint word data follow by the graph limits above.
  No equality of $J_W cal(D)_(upright("old"))$ with $cal(D)_(upright("old"))$ is used.
  The construction can also be repeated with past cuts of the original net.
  Section 3 will identify their bounded-profile generators from the physical current and thereby compare the
  resulting moments.

== 3 The bounded null-cut Ward identity <sec:null-current>

The distinction between a modular generator and a stress-tensor flux is essential here.
  The preceding construction supplies the generators $H_g$ without identifying their action on physical fields.
  We now make that identification for bounded profiles. Throughout this section $g$ is real and belongs to
  $C_b^oo \( bb(R)^2 \)$, meaning that every derivative is bounded.
  All estimates involve only finitely many of these bounds.
  We write $h_(upright(bold(1))) = upright(bold(1))$ for the constant profile $1$;
  a numerical subscript $nu$ in $h_nu$ always denotes the radial Hankel operator of Section 2.

The proof has two distinct outputs. First we identify matrix elements of $H_g$ with a stress-tensor flux and
  extend that identity to physical polynomial tests. Then we use its linear dependence on $g$,
  together with the spectral order already proved, to construct a commuting transverse measure.
  Its quadratic moment is the input to Section 4. The identification concerns bounded profiles throughout;
  the unbounded parabolic generator retains its separate role as a comparison operator.

Put

#[#set math.equation(numbering: n => "(3.1)")
 $ j_alpha = v T_(alpha v) - u T_(alpha u) \, wide partial^alpha j_alpha = 0 \, wide
   cal(C)_epsilon.alt \( phi.alt \, Z \) = ⟨phi.alt \, Z⟩ - epsilon.alt ⟨Z \, phi.alt⟩ . $ <N:boost-current>]

The last expression is a real bilinear form, rather than a complex bilinear pairing.
  Complex versions below are obtained by polarization. The stress tensor is even.
  Thus only the case in which the two local tests have equal total parity contributes;
  $epsilon.alt$ is their interchange sign.

=== 3.1 Bounded local tests and differentiation <bounded-local-tests-and-differentiation>

Let $A$ and $C$ be bounded Hermitian operators, localized in compact double cones strictly inside $W$ and its
  opposite, respectively. We first smooth them by compactly supported convolution under the Poincaré group.
  A slightly larger double cone still contains each support.
  Such smoothing gives bounded commutators of every prescribed finite order with the infinitesimal Poincaré
  action, and the vacuum vectors and their products are smooth translation vectors.
  On the opposite side one may use the twist-corrected reflected net described in Section 2.

The first task is to keep both tests separated while varying them with $H_g$.
  This requires containment of the conjugated algebras for both signs of the flow parameter.
  The bound $\| H_g \| lt.eq ∥g∥_oo b$ alone supplies a domain estimate and does not supply that containment.

There are $alpha \, c > 0$ such that the support of $A$ lies strictly inside the truncated cut with profile
  $alpha \| y \|^2 + c$; the reflected assertion holds for $C$. Write $d = ∥g∥_oo$.
  For $t > 0$, the positive-profile half-sided inclusion and the constant-shift identity give

$ "Ad" \( e^(i t H_g) \) cal(M) \( W \) = cal(M) \( W_(t g) \) supset cal(M) \( W_(t d) \) =
  "Ad" \( e^(i t d b) \) cal(M) \( W \) . $

Conjugating this inclusion by $e^(- i t H_g)$, and using commutation with $b$, yields

$ "Ad" \( e^(- i t H_g) \) cal(M) \( W \) subset cal(M) \( W_(- t d) \) . $

For positive $t$ the same upper containment follows from $t g gt.eq - t d$.
  These are algebra inclusions obtained from the cuts; they do not follow merely from an operator-form bound.
  Since $H_g$ commutes with the parabolic generators and $b$,
  conjugation of $cal(M) \( W_(alpha p_0 + c) \)$ therefore lies in $cal(M) \( W_(alpha p_0 + c - \| s \| d) \)$.
  Choosing $\| s \| d < c \/ 2$ shows that

$ A_s = "Ad" \( e^(i s H_g) \) \( A \) \, wide C_s = "Ad" \( e^(i s H_g) \) \( C \) $

remain in fixed, strictly separated truncated regions. Reflection gives the assertion for $C_s$.
  No identity $H_(- g) = - H_g$ is used. Hence $A_s$ and $C_t$ graded commute for all sufficiently small $s \, t$.

Set $Z = C A Omega$. Since $\| H_g \| lt.eq ∥g∥_oo b$, these smooth vectors lie in $"Dom" H_g$.
  Differentiating vectors, rather than unbounded operator products, gives

#[#set math.equation(numbering: n => "(3.2)")
 $ Z_(C') = epsilon.alt A \( i H_g C Omega \) \, wide Z_(A') = C \( i H_g A Omega \) \, wide Z_(C') + Z_(A') =
   i H_g Z . $ <N:product-derivative>]

For example, $C_s A Omega = epsilon.alt A C_s Omega$ in a whole interval about zero,
  so the first derivative follows from strong vector differentiation.
  The product rule then follows by subtracting and adding $C_s A Omega$ in $C_s A_s Omega$.
  The normal form estimate of Lemma 9 and the bounded translation commutators give

#[#set math.equation(numbering: n => "(3.3)")
 $ Z_(A') \, Z_(C') in "Dom" \( 1 + a \)^(1 \/ 2) . $ <N:normal-domain>]

For example, Lemma 9 puts $H_g A Omega$ in $"Dom" \( 1 + a \)^(1 \/ 2)$.
  The bounded commutator of $C$ with the normal translation generator makes $C$ bounded on $"Dom" \( 1 + a \)$
  with its graph norm; interpolation with its Hilbert-space bound gives the same property on
  $"Dom" \( 1 + a \)^(1 \/ 2)$. This proves the assertion for $Z_(A')$, and the roles of $A \,
  C$ give the other one. In particular no invariance of $"Dom" a$ under $H_g$ is being used.

These are the only normal-energy domains needed for the narrow-strip term below.
  The boost calculation uses only $"Dom" B ∩ "Dom" H_g$. Indeed the affine unitary relation $e^(i t B)
  e^(i s H_g) = e^(i e^t s H_g) e^(i t B)$, differentiated in $t$ on this intersection, gives

$ B e^(i s H_g) xi = e^(i s H_g) \( B + s H_g \) xi . $

Thus the $H_g$ unitary group preserves this intersection and is continuous in its $B$ graph norm.
  Differentiating the corresponding matrix identity, and moving $B$ onto the fixed first vector in one difference
  quotient, gives

#[#set math.equation(numbering: n => "(3.4)")
 $ i #scale(x: 120%, y: 120%)[\(] ⟨B xi \, H_g eta⟩ - ⟨H_g xi \, B eta⟩ #scale(x: 120%, y: 120%)[\)] = ⟨xi \,
   H_g eta⟩ \, wide xi \, eta in "Dom" B ∩ "Dom" H_g . $ <N:affine-form>]

Our smoothed vacuum vectors belong to this domain. No domain for $B H_g eta$ is required.

Decrease $c$ and relabel it so that the fixed containing truncations for all sufficiently small $s$ have profiles
  $alpha p_0 + c$. We choose a time step whose two half-slabs remain separated from the opposite truncated
  regions. The geometry can be read directly from the cut formula. Put $R_0 = 1 \/ \( 2 alpha \)$. Then

$ W_(alpha p_0 + c) = {- R_0 < u < 0 : quad v > c + frac(\| y \|^2, 2 \( R_0 + u \))} . $

For $u = - d < 0$, the reflected-cut separation inequality says that

$ v > - c - frac(\| y \|^2, 2 \( R_0 + d \)) $

is spacelike to the reflected opposite truncation. The margin satisfies

#[#set math.equation(numbering: n => "(3.5)")
 $ d + c + frac(\| y \|^2, 2 \( R_0 + d \)) gt.eq c_0 sqrt(1 + d^2 + \| y \|^2) wide \( d gt.eq 0 \) $ <N:slab-margin>]

for some $c_0 > 0$: $d + c$ controls $R_0 + d$, and the arithmetic–geometric mean controls $\| y \|$.
  Reflection gives the corresponding inequality for $u > 0$.

Choose a positive smooth width $w \( u \, y \)$ comparable to $sqrt(1 + u^2 + \| y \|^2)$,
  with bounded first derivatives and homogeneous of degree one outside a compact set.
  If $sigma$ is a fixed smooth step, zero below $- 1$ and one above $1$, set $rho =
  sigma \( \( u + v \) \/ \( epsilon w \( u \, y \) \) \)$.
  For sufficiently small $epsilon$, its transition slab is spacelike,
  and (3.5) makes its negative and positive halves spacelike to the respective opposite truncated regions.
  Near $u = 0$ we also require separation from both fixed compact tests $A \, C$.
  Their compact normal-coordinate margins give this gap on bounded transverse sets; at large $\| y \|$,
  their quadratic spacelike separation dominates the slab width.
  Shrinking $epsilon$ supplies the required central gap. This last assertion concerns the compact tests,
  not both entire truncated regions.

Take $chi in C_c^oo \( bb(R) times bb(R)^2 \)$, real and equal to one near zero, and write

$ chi_R \( u \, y \) = chi \( u \/ R \, y \/ R \) \, wide F_R = chi_R thin upright(d) rho \, wide j_F Omega =
  integral F dot.op j \( x \) Omega thin upright(d)^4 x . $

The full flux vectors satisfy

#[#set math.equation(numbering: n => "(3.6)")
 $ sup_(R gt.eq R_0) ∥j_(F_R) Omega∥ < oo \, wide j_(F_R) Omega harpoon.rt 0 quad \( R arrow.r oo \) . $ <N:full-flux>]

Indeed conservation allows replacement of $rho$ by an entirely scaled step agreeing with it near $"supp"
  upright(d) chi_R$. The difference of the fluxes is the integral of $upright(d)
  chi_R \( rho - rho_R \)$ against $j$ and vanishes. The resulting compact flux has scale degree zero,
  so its vector is a unitary dilation of one fixed vector. Its spectral mass is driven to zero under this
  dilation. The stress-tensor vacuum channel has no zero-momentum part, proving weak convergence;
  the norm is unchanged. This argument uses neither clustering nor a norm bound on the field.

The physical Ward identities are assumed for original polynomials.
  The following two mixed functionals extend them in exactly the form needed for differentiation.
  In each, the boost acts on the fixed smoothed test.

Let $theta.alt$ be smooth, equal to one on $\( - oo \, - 2 \]$ and zero on $\[ - 1 \, oo \)$, and put

$ theta_(- \, delta) \( u \) = theta.alt \( u \/ delta \) \, wide theta_(+ \, delta) \( u \) =
  theta_(- \, delta) \( - u \) \, wide j_plus.minus = j_(theta_(plus.minus \, delta) F_R) . $

#thm([Lemma 3.1.])[
  (Mixed boost Ward identities).  #emph[For the bounded smoothed opposite tests above, for sufficiently large $R$,
    sufficiently small $delta > 0$, and $s$ in a neighborhood of zero,
#[#set math.equation(numbering: n => "(3.7)")
 $ ⟨C_s Omega \, B A Omega⟩ & = cal(C)_epsilon.alt \( j_(-) Omega \, C_s A Omega \) \,\
⟨B C Omega \, A_s Omega⟩ & = - cal(C)_epsilon.alt \( j_(+) Omega \, C A_s Omega \) . $ <N:undifferentiated-Ward>]

]
] <N:mixed-Ward>

#proof[
  Start with a Hermitian finite algebraic sum $C_0$ of factorized original words compactly localized in the
    opposite wedge. Its closed affiliated realization was constructed in Section 2.
    The boost Ward identity applies to its original polynomial restriction;
    affiliation and opposite locality allow the compact current flux around $C_0$ to pass the bounded operator $A$.
  Choose the partition for the flux around $A$ once. Its time-zero causal shadow is compactly contained in the
    positive spatial halfspace, so a small slab neighborhood of that shadow lies compactly inside $W$ and is
    spacelike to every opposite-wedge polynomial. Denote the resulting fixed compact current vacuum vector by
    $eta_A$. For each $C_0$, its own time-zero causal shadow is a compact subset of the negative halfspace.
    Thin or deform the slab only near that shadow, leaving the $A$ partition and the homogeneous shape at infinity
    unchanged. Conservation and (3.6), applied to each deformation,
    transfer the opposite flux to this same $eta_A$. The signs of the commutator give
  $ ⟨B C_0 Omega \, A Omega⟩ = ⟨C_0 Omega \, B A Omega⟩ = cal(C)_epsilon.alt \( eta_A \, C_0 A Omega \) . $
  In particular the current side obeys
  $ \| cal(C)_epsilon.alt \( eta_A \, C_0 A Omega \) \| lt.eq 2 ∥eta_A∥ ∥∥ A ∥C_0 Omega∥ \, $
  since $C_0 A Omega = epsilon.alt A C_0 Omega$. No uniform bound on the changing flux near $C_0$ is needed.
    The boost has been moved to the fixed vector $A Omega$ before taking any Hilbert limit.
  Hermitian factorized polynomial vacuum vectors are real dense in the opposite wedge standard subspace by the
    Tomita-graph argument in Section 2. The displayed bounded functional therefore extends to $C_s Omega$.
    For the fixed family of truncated localizations, the compact spatial partition can be replaced by the negative
    half-slab: $C_s$ is spacelike there, and the commutator vanishes outside the fixed causal intersection of $A$.
    This gives the first identity in (3.7). Interchanging the fixed side gives the second.
    Its minus sign comes from placing the boost on the bra; the opposite flux contributes $epsilon.alt ⟨C A_s
    Omega \, j_(+) Omega⟩ - ⟨j_(+) Omega \, C A_s Omega⟩$. The operators $A_s \,
    C_s$ need only lie in their fixed truncated algebras; compact localization of these varied operators is not
    required. ◻
]

Differentiate (3.7) in the real parameter $s$ and add. Equation (3.4) identifies the left side as

$ i #scale(x: 120%, y: 120%)[\(] ⟨B C Omega \, H_g A Omega⟩ - ⟨H_g C Omega \,
  B A Omega⟩ #scale(x: 120%, y: 120%)[\)] = ⟨C Omega \, H_g A Omega⟩ . $

The right side is $cal(C)_epsilon.alt \( j_(-) Omega \, Z_(C') \) -
  cal(C)_epsilon.alt \( j_(+) Omega \, Z_(A') \)$. Substituting (3.2) and writing the two half-slabs as the full
  slab minus its central strip gives

#[#set math.equation(numbering: n => "(3.8)")
 $ ⟨C Omega \, H_g A Omega⟩ & = cal(C)_epsilon.alt \( j_(theta_(- \, delta) F_R) Omega \, i H_g Z \) -
   cal(C)_epsilon.alt \( j_(F_R) Omega \, Z_(A') \)\
 & quad + cal(C)_epsilon.alt \( j_(\( 1 - theta_(- \, delta) - theta_(+ \, delta) \) F_R) Omega \, Z_(A') \) .
   $ <N:finite-variation>]

All current entries here are actual smeared vacuum vectors.
  This calculation extends a bounded vector functional; it does not postulate a stress-tensor operator commutator
  with an arbitrary bounded operation.

=== 3.2 The three cutoff estimates <the-three-cutoff-estimates>

There are three different error mechanisms in (3.8). The narrow strip disappears weakly after one inverse
  half-power of normal energy. The normal face is compared in norm with the multiplication operator $b g \( Y \)$,
  which yields the physical plane flux. The distant cap is controlled after dilation by a mass-dyad sum.
  Keeping these mechanisms separate specifies which vector domains are needed and which bounds must be uniform in
  the normal width.

Here and below $a = \( M^2 + \| k \|^2 \) \/ \( 2 b \)$, $b > 0$.
  Constants in the one-field norm can be suppressed, since there are only finitely many polarizations.
  The two useful versions of the measure are

#[#set math.equation(numbering: n => "(3.9)")
 $ upright(d) a thin upright(d) b thin upright(d)^2 k quad \( 2 a b gt.eq \| k \|^2 \) \, wide
   frac(upright(d) b, 2 b) thin upright(d)^2 k thin upright(d) m \, wide m = M^2 gt.eq 0 . $ <N:measure-coordinates>]

All inequalities below are componentwise inequalities in the finite rest-spin spaces, summed at the end.

We make the dependence on test functions precise. For a compact smooth function $q \( u \, y \, v \)$ put

$ p_m \( q \) = sum_(\| beta \| lt.eq m) ∥\( 1 + \| u \| + \| y \| + \| v \| \)^m partial^beta q∥_(L^1) . $

In estimates involving a step, this seminorm is applied to its $v$ derivative and to its products with the
  indicated compact functions of $\( u \, y \)$, not to the step itself.
  At a fixed $R$, all constants denoted $C_(R \, N)$ are bounded by a polynomial in the corresponding
  $p_(4 N + 20)$ seminorms, the derivatives of $chi_R$ on their compact support,
  and the derivatives of the fixed step $theta.alt$. After rescaling a cap by $R$,
  use the same seminorms of its fixed smooth shapes; the constants are then independent of $R$ and of the sharp
  normal width. Factors $u$, $v$, or a coordinate derivative appearing in the current are included in these
  seminorms. This convention allows uniformity for compact families of local tests and for all the smoothing
  operations used below.

First consider the last term in (3.8). Its normal support has width $O \( delta \)$.
  Fourier transformation gives a factor $delta$ times a rapidly decreasing function of $\( delta a \, b \, k \)$;
  the part containing $u T_(alpha u)$ has an additional $delta$.
  The polarization weights for indices $u \, i \, v$ are $a \, sqrt(a b) \, b$.
  Consequently, after applying $\( 1 + a \)^(- 1 \/ 2)$, the square norm is bounded by a constant times

#[#set math.equation(numbering: n => "(3.10)")
 $ integral_0^oo { delta^2 \( 1 + a \) + delta^4 \( 1 + a \)^3 #scale(x: 120%, y: 120%)[}] \( 1 + delta a \)^(- 6)
   thin upright(d) a lt.eq C_R . $ <N:strip-bound>]

The omitted $\( b \, k \)$ integrals are convergent rapid-decay integrals;
  extending their domain only enlarges this bound. On every compact momentum set the weighted Fourier coefficients
  tend to zero. Uniform boundedness and compact-momentum density therefore give weak convergence to zero. By (3.3),

#[#set math.equation(numbering: n => "(3.11)")
 $ lim_(delta arrow.b 0)
   cal(C)_epsilon.alt \( j_(\( 1 - theta_(- \, delta) - theta_(+ \, delta) \) F_R) Omega \, Z_(A') \) =
   0 . $ <N:strip-vanishing>]

Thus the strip estimate uses exactly the half-energy domain established before the differentiation.
  We turn to the first term, whose sharp normal boundary will survive as the Ward flux.

Next integrate the first term of (3.8) by parts. Moving $i H_g$ to the first entry means applying $- i H_g$ there.
  Before that application, conservation replaces the flux by

#[#set math.equation(numbering: n => "(3.12)")
 $ B_(R \, delta) - E_(R \, delta) = integral \( - theta'_(- \, delta) \) chi_R rho thin j_v Omega thin
   upright(d)^4 x - integral theta_(- \, delta) rho #scale(x: 120%, y: 120%)[\[] \( partial_u chi_R \)
   j_v - \( partial_i chi_R \) j_i #scale(x: 120%, y: 120%)[\]] Omega thin upright(d)^4 x . $ <N:boundary-cap>]

For this integration first introduce a smooth $v$ cutoff of length $S$.
  At fixed $R \, delta$, let $S arrow.r oo$ before making any other limit.
  At $b > 0$, the transforms of $rho$ and $v rho$ have respectively the bounds $b^(- 1)$ and $b^(- 2)$ times rapid
  large-$b$ symbols. This follows by differentiating the compact function $partial_v rho$;
  the possible distributions supported at $b = 0$ are killed by the displayed stress-tensor powers of $b$.
  The error containing the derivative of the $v$ cutoff, after multiplication by $b$, is bounded by

$ C_(R \, delta \, N) thin b \( a b S + a^2 \) \( 1 + S b + a + \| k \| \)^(- N) . $

Its square integral in (3.9) is $O \( S^(- 3) \)$ for $N$ large:
  set $B = S b$, and enlarge the cone to the full positive $\( a \, b \)$ quadrant.
  Since $∥H_g xi∥ lt.eq ∥g∥_oo ∥b xi∥$, this removes the cutoff in the required matrix element.
  The remaining terms converge after multiplication by $b$, using normal Fourier decay at fixed $delta$.

We now estimate the normal face $B_(R \, delta)$. Its decomposition requires only the scalar comparison channels
  with $nu = 0 \, 1$:

$ T_(v v) = b^2 c_T \, wide T_(i v) \/ b = M s_(z i) - k_i c_T \, $

while conservation expresses $T_(u v)$ as a linear combination of $\( a b \, \| k \|^2 \) c_T$ and $k_i M
  s_(z i)$. Before a radial derivative, the coefficient of the $v T_(v v)$ term has order one.
  That of the $u T_(u v)$ term has order $delta \( M^2 + \| k \|^2 \) \/ b$;
  the mixed term $delta \| k \| M \/ b$ is bounded by the same expression.
  Differentiating in $m = M^2$ costs $delta \/ b$, and

#[#set math.equation(numbering: n => "(3.13)")
 $ h_nu #scale(x: 120%, y: 120%)[\(] M^nu f \( m \) #scale(x: 120%, y: 120%)[\)] = -
   4 M^nu #scale(x: 120%, y: 120%)[\(] \( 1 + nu \) f' \( m \) +
   m f'' \( m \) #scale(x: 120%, y: 120%)[\)] . $ <N:radial-identity>]

For example, a mixed $nu = 1$ coefficient has the form $delta k_i M f_delta \( m \, b \, k \) \/ b$,
  up to fixed constants and finite sums. Rescaling its normal test by $u = delta s$ gives

$ \| partial_m^j f_delta \| lt.eq C_(R \, N) \( delta \/ b \)^j \( 1 + b + \| k \| + delta a \)^(- N) \, wide j =
  0 \, 1 \, 2 . $

Its radial image is

$ b h_1 (frac(delta k_i M, b) f_delta) = - 4 delta k_i M (2 partial_m f_delta + m partial_m^2 f_delta) . $

The potentially singular factor is now $delta \| k \| M \/ b lt.eq delta a$; also $delta m \/ b lt.eq 2 delta a$.
  These factors are absorbed by the rapid decay, leaving an overall factor $delta$.
  The $nu = 0$ terms follow from the same radial identity. Consequently, for every $N$,
  each coefficient of $b h_nu B_(R \, delta)$ obeys

#[#set math.equation(numbering: n => "(3.14)")
 $ lr(|b h_nu B_(R \, delta) \( b \, k \, M \)|) lt.eq C_(R \, N) delta \( 1 + b + \| k \| + delta a \)^(- N) .
   $ <N:face-symbol>]

The spectral comparison (2.26), applied to these channels, and the Taylor bound (2.25) imply

#[#set math.equation(numbering: n => "(3.15)")
 $ ∥\( H_g - b g \( Y \) \) B_(R \, delta)∥ lt.eq C_R ∥g''∥_oo sqrt(delta) . $ <N:face-error>]

In particular the estimate has no unrecorded lower cutoff in $b$.
  Indeed the square integral of the right side of (3.14) is bounded by

$ C delta^2 integral frac(upright(d) b, b) thin upright(d)^2 k integral_0^oo
  (1 + b + \| k \| + frac(delta \( m + \| k \|^2 \), 2 b))^(- 2 N) upright(d) m & lt.eq
  C_N delta integral upright(d) b thin upright(d)^2 k \( 1 + b + \| k \| \)^(1 - 2 N)\
 & lt.eq C'_N delta . $

For the principal part use $w = 1 + b + M^2 \/ b$, which commutes with $g \( Y \)$.
  For any fixed $q > 1 \/ 2$, the vectors $w^(- q) b B_(R \, delta)$ are norm bounded and converge to their plane
  limits. To see this, the coefficients after multiplication by $b$ are bounded by

$ C_(R \, N) b \( 1 + delta a \) \( 1 + b + \| k \| + delta a \)^(- N) \; $

the $m$ integral against $w^(- 2 q)$ is finite, and the remaining $b \, k$ integrals converge.
  Dominated convergence applies, and the term with $u$ tends to zero.
  Since a translation-smooth $Z$ belongs to $"Dom" w^q$ for every fixed $q$,
  this proves convergence in the pairing. Fourier inversion in $k$ inserts $g \( y \)$.
  Finally $i b$ acts as $partial_v$ on $T_(v v) Omega$; integration by parts leaves

#[#set math.equation(numbering: n => "(3.16)")
 $ integral chi_R \( 0 \, y \) g \( y \) \( rho \( 0 \, y \, v \) + v partial_v rho \( 0 \, y \, v \) \)
   cal(C)_epsilon.alt \( T_(v v) \( 0 \, y \, v \) Omega \, Z \) thin upright(d) v thin upright(d)^2 y .
   $ <N:plane-before-gap>]

The term with $partial_v rho$ vanishes by the spacelike gap.

The face comparison has now removed the internal operator $h$ from the surviving flux.
  Its error tends to zero with $delta$ at each fixed $R$, including the region $b arrow.b 0$.
  To complete the argument we need a different estimate for the distant cap:
  its bound must remain valid after the normal step has become sharp.

It remains to control the cap $E_(R \, delta)$ uniformly as the normal step becomes sharp.
  Dilate its variables by $R$. Its smooth shapes then range over a fixed bounded set of the seminorms specified
  above, and its current smearing has scale degree zero. In these coordinates the generator becomes

#[#set math.equation(numbering: n => "(3.17)")
 $ R^(- 1) b h_(g_R) \, wide g_R \( y \) = g \( R y \) . $ <N:rescaled-generator>]

Normal integration by parts gives a factor $\( 1 + a \)^(- 1)$ from a half-space step,
  and $\( 1 + a \)^(- 2)$ if its coefficient contains $u$. These bounds,
  as well as their logarithmic $a$ derivatives up to order two, are uniform in the smoothing width.
  For example, split the normal integral into $\| u \| lt.eq \( 1 + a \)^(- 1)$ and its complement.
  The first part has the claimed length, or its square with an extra $u$; on the second part integrate by parts.
  The derivative of the step has uniformly bounded total variation, and its support has $\| u \| =
  O \( delta \/ R \)$. Repeating this argument proves the stated symbol bounds.
  Tangential integrations by parts give arbitrary rapid decay in $b \, k$, with the same $b^(- 2) \,
  b^(- 1)$ factors from $v rho \, rho$.

Let $F_v \, F_i$ denote the resulting cap coefficients before multiplication by $b$.
  The polarization weights give, for any $N$,

#[#set math.equation(numbering: n => "(3.18)")
 $ \| F_v \| lt.eq C_N \( 1 + a \)^(- 1) tau_N \( b \, k \) \, wide \| F_i \| lt.eq
   C_N frac(sqrt(a \/ b), 1 + a) tau_N \( b \, k \) \, wide tau_N = \( 1 + b + \| k \| \)^(- N) . $ <N:cap-symbols>]

The same inequalities hold after up to two logarithmic $M$ derivatives, with a different $C_N$.
  This last assertion can also be checked directly in each tetrad coefficient:
  every occurrence of $a$ is $\( M^2 + \| k \|^2 \) \/ \( 2 b \)$, so $M partial_M a lt.eq 2 a$.

Use a smooth dyadic partition $eta_(upright("lo")) \( M \) + sum_(j gt.eq 0) eta_j \( M \) =
  1$ with $eta_(upright("lo"))$ supported in $M lt.eq 2$ and $eta_j$ supported in $N_j \/ 2 lt.eq M lt.eq 2 N_j$,
  $N_j = 2^j gt.eq 1$, and uniformly bounded logarithmic derivatives.
  If $F_j = eta_j F$ and $F_(upright("lo")) = eta_(upright("lo")) F$, then

#[#set math.equation(numbering: n => "(3.19)")
 $ ∥b F_(upright("lo"))∥ lt.eq C \, wide ∥b F_j∥ lt.eq C \, wide ∥b h F_j∥ lt.eq
   C N_j^(- 2) quad \( j gt.eq 0 \) . $ <N:cap-dyads>]

Here the last expression uses the high-mass pieces only. For clarity,
  the potentially worst integral in the first two bounds is

$ integral_(M asymp N) frac(upright(d) m, 2 b) thin frac(a b, \( 1 + a \)^2) = 1 /
  2 integral_(M asymp N) frac(a, \( 1 + a \)^2) thin upright(d) m lt.eq C b quad \( N gt.eq 1 \) \, $

followed by the convergent $\( b \, k \)$ integral with $tau_N^2$.
  For $M lt.eq 2$ the integrand is simply bounded and the $m$ interval has bounded length.
  Thus the factor $b^(- 1 \/ 2)$ in (3.18) is harmless. To prove the $h$ bound,
  decompose into the finite pure-label channels of (2.12). On $M asymp N_j$,
  the identity (3.13) and the logarithmic derivative bounds give a factor $N_j^(- 2)$,
  including when derivatives hit $eta_j$. Apply (2.26) to each channel and sum their norms.
  No commutation of $h$ with invariant mass is asserted or used.

Write $h_(g_R) = g_R \( Y \) + D_R$. The bounded-profile estimate and (2.25) give simultaneously

$ ∥D_R xi∥ lt.eq 2 ∥g∥_oo ∥xi∥ \, wide ∥D_R xi∥ lt.eq 1 / 2 R^2 ∥g''∥_oo ∥h xi∥ . $

The second is an operator-norm estimate on $"Dom" h$, since $D_R$ strongly commutes with $h$.
  Thus the high dyads of the remainder in (3.17) have norms at most

$ C_g / R min \( 1 \, R^2 \/ N_j^2 \) \, $

and their sum, including the low-mass part, is

#[#set math.equation(numbering: n => "(3.20)")
 $ O_g #scale(x: 120%, y: 120%)[\(] \( 1 + log R \) \/ R #scale(x: 120%, y: 120%)[\)] . $ <N:cap-remainder>]

Indeed, the dyads with $N_j lt.eq R$ contribute at most $C_g \/ R$ each,
  and there are $O \( 1 + log R \)$ of them. The remaining bound is a geometric series in $R^2 \/ N_j^2$,
  whose sum is bounded independently of $R$. This gives the stated rate without any orthogonality assumption on
  the images of the dyads.

This estimate allows $h$ to mix masses: the summation is a triangle inequality after applying $D_R$,
  not an orthogonal decomposition of its image. The principal part $R^(- 1) b g_R \( Y \)$ does preserve mass.
  Pair its $j$th dyad against the correspondingly rescaled $Z_R$.
  Translation smoothness gives, for every fixed integer $r$,

$ ∥1_(M asymp N_j) Z_R∥ lt.eq C_r \( Z \) \( 1 + N_j \/ R \)^(- r) . $

Consequently its pairing is bounded by

#[#set math.equation(numbering: n => "(3.21)")
 $ frac(C_g C_r \( Z \), R) (1 + sum_(j gt.eq 0) \( 1 + N_j \/ R \)^(- r)) lt.eq
   C_(g \, r \, Z) frac(1 + log R, R) \, wide r gt.eq 1 . $ <N:cap-principal>]

Equations (3.20)–(3.21) prove cap vanishing in precisely the order required by (3.8).

=== 3.3 The Ward formula and polynomial tests <the-ward-formula-and-polynomial-tests>

The order of limits is

#[#set math.equation(numbering: n => "(3.22)")
 $ S arrow.r oo \, wide delta arrow.b 0 upright(" at fixed ") R \, wide R arrow.r oo . $ <N:limit-order>]

The strip term vanishes by (3.11), the cap by (3.20)–(3.21), and the full-flux term by (3.6).
  The normal face gives (3.16). In particular its dependence on $g$ is linear before the last limit.
  This proves linearity of $H_g$ as a form on these local vectors for all profiles under consideration. The estimate

$ \| ⟨xi \, H_g eta⟩ \| lt.eq ∥g∥_oo ∥b^(1 \/ 2) xi∥ ∥b^(1 \/ 2) eta∥ $

extends this equality to the whole form domain. The needed graph density follows by applying a small compact
  translation convolution to Reeh–Schlieder approximants in any fixed double cone:
  convolution is bounded from Hilbert norm to the graph norm of $b^(1 \/ 2)$,
  and its approximate identity tends to the identity in that graph norm.

#thm([Proposition 3.2.])[
  (Bounded-profile Ward formula).  #emph[The map $g mapsto H_g = b h_g$ is real linear on $C_b^oo \( bb(R)^2 \)$.
    For $g$ compactly supported or Schwartz, and the bounded smooth opposite tests above,
#[#set math.equation(numbering: n => "(3.23)")
 $ ⟨C Omega \, H_g A Omega⟩ = integral_(bb(R)^2) integral_(bb(R)) g \( y \) rho \( v \)
   cal(C)_epsilon.alt \( T_(v v) \( 0 \, y \, v \) Omega \, C A Omega \) thin upright(d) v thin upright(d)^2 y .
   $ <N:bounded-Ward>]

 Here $rho$ is any smooth step whose derivative lies in the $v$ gap between the two causal intersections with the
   plane. The expression is a vacuum-vector distribution paired with the indicated smooth vector,
   not an unsmeared operator integral.]
] <N:Ward-proposition>

To replace the original plane step by this $rho \( v \)$, interpolate inside the spacelike gap and use locality.
  The half-step vacuum wave is continuous after an inverse polynomial energy weight:
  $T_(v v)$ supplies $b^2$, the step costs $b^(- 1)$, and tangential smearing supplies rapid Fourier decay.
  This is also the weighted convergence proved in the normal-face calculation.
  It justifies the plane restriction and the removal of $chi_R$ in (3.23).

#thm([Proposition 3.3.])[
  (Polynomial extension).  #emph[Equation (3.23) holds for compactly smeared physical polynomial tests,
    including their adjoints, on the common field domain $cal(D)_(upright("old"))$.
    The convergence to it is uniform when the smearing tests vary over a compact smooth parameter family.]
] <N:polynomial-extension>

The extension has three separate passages, with uniformity for fixed word labels and lengths and a compact smooth
  family of their tests. For finite sums of factorized polynomials,
  polar truncation first replaces each polynomial by a bounded operation in its original localization algebra.
  Group convolution then gives the translation derivatives needed in the Ward formula.
  The rapid truncation error absorbs the polynomial growth of the norms of the other bounded factors;
  only after that limit do we remove the convolution. Finally,
  test-space density and the original joint-distribution bounds extend the identity to admitted compact joint kernels.

#proof[
  First let $A$ be a Hermitian finite algebraic sum of factorized physical polynomial words on the invariant field
    domain $cal(D)_(upright("old"))$. Sums and products of its affiliated single-field realizations,
    followed by closure, give a closed affiliated operator $T$ such that $T \|_(cal(D)_(upright("old"))) =
    A$ and $T^(*) \|_(cal(D)_(upright("old"))) = A$. The product is closable because its adjoint contains the
    reversed adjoint product on the dense domain $cal(D)_(upright("old"))$.
    Write $T = U \| T \|$, let $E_L = 1_(\[ 0 \, L \]) \( \| T \| \)$, and set
  $ T_L = T E_L \, wide A_L = 1 / 2 \( T_L + T_L^(*) \) . $
  Then $A_L$ is bounded Hermitian in the same local algebra, with $∥A_L∥ lt.eq L$.
    For $psi in cal(D)_(upright("old"))$ and every nonnegative integer $m$, the spectral-tail bounds give
  #[#set math.equation(numbering: n => "(3.24)")
   $ ∥\( T - T_L \) psi∥ & lt.eq L^(- 2 m) ∥\| T \|^(2 m + 1) psi∥ \,\
∥\( T^(*) - T_L^(*) \) psi∥ & lt.eq L^(- 2 m) ∥\| T \|^(2 m) T^(*) psi∥ . $ <N:polar-tails>]
  Both right sides are finite polynomial-domain norms. Indeed $cal(D)_(upright("old"))$ is invariant under $T \,
    T^(*)$, and powers of $T^(*) T$ and $T T^(*)$ there agree with the corresponding iterated physical
    polynomials. Hence $A_L psi - A psi = O \( L^(- N) \)$ for every prescribed $N$.
    This proves the same assertion for any fixed finite family of polynomial states and moments needed in the
    argument. No essential self-adjointness is required.
  One must not differentiate the sharp spectral projection $E_L$.
    Instead first convolve $A_L$ under the spacetime group, with a fixed compact smooth kernel $f$.
    Group derivatives then fall on $f$. The estimate (3.24) is uniform for the transformed polynomial tests on the
    compact support of $f$, since its right sides are continuous norms of smeared polynomial vectors.
    Thus the convolved vacuum vectors converge in every fixed translation Sobolev norm.
    Apply the same construction to $C$ separately. Their localization regions remain spacelike. For example,
  $ C_L A_L Omega - C A Omega = C_L \( A_L - A \) Omega + \( C_L - C \) A Omega \, $
  whose first term is bounded by $L$ times a faster-than-any-power tail and whose second is another
    polynomial-state tail. The same argument after convolution gives convergence of products in the finite Sobolev
    norms used above. To make the product convergence explicit,
    let $alpha_r$ denote the Poincaré action and write $A_L \( r \) = alpha_r \( A_L \)$, $A \( r \) =
    alpha_r \( A \)$, with analogous notation for $C$. Uniformly for $r \, s$ in fixed compact group sets,
  $ ∥C_L \( s \) A_L \( r \) Omega - C \( s \) A \( r \) Omega∥ lt.eq L C_N L^(- N) + C'_N L^(- N) . $
  For the second term apply the polar-tail estimate to the polynomial state $A \( r \) Omega$;
    its iterated $C \( s \)$-polynomial norms are uniformly bounded on these compact sets.
    For a product of the two convolved operators, a common translation is left translation of both group
    variables. Integration by parts consequently places each prescribed translation derivative on the convolution
    kernels. The resulting finite sum of compact kernel integrals has the same tail estimate, with new constants.
    This proves the required Sobolev convergence without differentiating either polar projection.
  For these factorized polynomials, the left side of (3.23) converges by its $b^(1 \/ 2)$ form bound,
    and the right side by the inverse-energy estimates for the half-step wave.
    Finally remove the convolution on the original smooth field tests.
    All constants are finite test seminorms, so this last limit and compact-parameter uniformity follow from
    distributional continuity.
  It remains to pass to the admitted compact joint kernels.
    For an old word $A$, write $Psi_A \( phi_A \)$ for its vacuum vector smeared with a joint kernel $phi_A$.
    First partition a compact support into finitely many product patches inside the required localization region.
    On each patch, finite sums of tensor tests are dense in the smooth test-function topology.
    Choose such kernels $phi_(A \, j) arrow.r phi_A$ with their supports in those patches;
    their reversed adjoint kernels converge as well. Do the same for the kernel $phi_C$ of $C$.
    Polarization gives the factorized identity for arbitrary complex word tests,
    so it applies to these approximants. This is a test-space approximation,
    not a finite-rank requirement on the given kernels.
  For every fixed nonnegative integer $k$, the original joint-distribution bounds imply
  $ parallel \( 1 + P^0 \)^k #scale(x: 120%, y: 120%)[\(] Psi_A \( phi_(A \, j) \) -
    Psi_A \( phi_A \) #scale(x: 120%, y: 120%)[\)] #scale(x: 120%, y: 120%)[parallel] arrow.r 0 \, $
  and analogously for $C$ and for the concatenated old word with kernel $phi_(C \, j) ⊗ phi_(A \, j) arrow.r
    phi_C ⊗ phi_A$. Indeed, a collective time-translation derivative of a vacuum word is the same word with the
    corresponding derivative of its joint test. The doubled original vacuum distributions therefore bound each
    displayed graph norm by finitely many joint test seminorms.
    Positive translation spectrum makes these norms control the $b^(1 \/ 2)$ graph norm and every fixed
    translation-Sobolev norm used above. The left side of (3.23) is continuous by its $b^(1 \/ 2)$ form bound;
    the right side is continuous by the inverse-energy half-step bound applied to the concatenated old vacuum
    word. Taking this kernel limit after the polar and convolution limits proves the stated Ward identity for the
    joint kernels.
  On a compact smooth parameter family the same finitely many seminorms are uniformly bounded.
    The tensor approximations can be chosen uniformly in those seminorms,
    using a finite cover of the compact family and a smooth partition in its parameter.
    The preceding graph and flux bounds then give the asserted compact-parameter uniformity.
    This final passage does not assert a closed affiliated operator for an arbitrary joint smear. ◻
]

=== 3.4 The commuting measure and its second moment <the-commuting-measure-and-its-second-moment>

The analytic part of the argument has established the bounded Ward identity and its polynomial extension.
  We now use the resulting linearity to organize all bounded profiles simultaneously.
  Positivity will give a measure, but normalization requires a separate tightness argument,
  and its quadratic moment requires comparison with the actual parabolic cuts.

Linearity upgrades the spectral order of bounded profiles to commutativity.
  To record the argument, put $A = h_g$, $B = h_f$ and $epsilon = ∥f∥_oo \/ s$.
  The profile comparison of Section 2 gives the spectral brackets

$ A - epsilon upright(bold(1)) med lt.eq_(upright("sp")) med A + B \/ s med lt.eq_(upright("sp")) med A +
  epsilon upright(bold(1)) . $

If $r < t$ and $2 epsilon < t - r$, the low $A$ subspace $1_(\( - oo \, r \]) \( A \)
  cal(H)$ is contained in the spectral subspace of $A + B \/ s$ below $r + epsilon$,
  while the high $A$ subspace $1_(\[ t \, oo \)) \( A \) cal(H)$ is contained in its spectral subspace above $t -
  epsilon$. Thus

$ 1_(\( - oo \, r \]) \( A \) \( A + B \/ s \) 1_(\[ t \, oo \)) \( A \) = 0 . $

The same matrix of $A$ is zero, so the matrix of $B$ is zero.
  Varying $r \, t$ proves that $B$ commutes with every spectral projection of $A$.
  This argument uses the spectral-support comparison (2.27), not merely ordinary operator order.

#thm([Proposition 3.4.])[
  (Internal measure and quadratic moment).  #emph[On the $b >
    0$ representation there is a normalized positive operator-valued Borel measure $mu$ on $bb(R)^2$,
    with mutually commuting values on the internal multiplicity space, such that
#[#set math.equation(numbering: n => "(3.25)")
 $ H_g = b integral_(bb(R)^2) g \( Y + z \) thin mu \( upright(d) z \) \, wide mu \( bb(R)^2 \) =
   upright(bold(1)) . $ <N:measure-representation>]

 Its values commute with $h$ and with the external variables $b \, Y$.
   Its first moment is zero as a polarized integral on $"Dom" h^(1 \/ 2)$.
   Its trace second moment is the increasing closed-form limit of compactly truncated moments and defines a
   positive self-adjoint operator $kappa$ satisfying
#[#set math.equation(numbering: n => "(3.26)")
 $ integral z thin mu \( upright(d) z \) = 0 \, wide kappa = integral \| z \|^2 thin mu \( upright(d) z \) lt.eq
   h \, wide K_n = b \( \| Y \|^2 + kappa \) . $ <N:moment-comparison>]

 The second-moment inequality is a quadratic-form inequality and, since the operators strongly commute,
   has its usual joint spectral meaning. No assertion that $mu$ is projection-valued, or that $kappa = h$, is made.]
] <N:measure-proposition>

#proof[
  The map $g mapsto h_g$ is positive and contractive in the supremum norm, and $h_(upright(bold(1))) =
    upright(bold(1))$. It commutes strongly with $Y \, h \, b$ and is boost independent.
    In the $Y$ representation write $h_g = M_(F_g)$, where $F_g$ is an essentially bounded
    internal-operator-valued function. For $tau_t g \( z \) = g \( z + t \)$, transverse covariance gives
  $ F_(tau_t g) \( y \) = F_g \( y + t \) quad upright("almost everywhere") \, wide
    parallel F_g \( dot.op + t \) - F_g parallel_(L^oo) lt.eq parallel tau_t g - g parallel_oo . $
  The right side tends to zero. Weak-operator convolution with a smooth approximate identity therefore converges
    to $F_g$ in essential-supremum norm. The convolutions are norm continuous;
    their pairwise essential-supremum bounds are consequently actual supremum bounds.
    Their uniform limit selects a unique norm-continuous representative $tilde(F)_g$. Covariance now holds pointwise, so
  $ cal(L) \( g \) = tilde(F)_g \( 0 \) \, wide tilde(F)_g \( y \) = cal(L) \( tau_y g \) $
  defines one positive contractive internal functional. Linearity, positivity,
    and the commuting relations pass to these representatives.
    For inequalities involving the unbounded $h$, first restrict to a bounded spectral band of $h$,
    evaluate the resulting continuous inequality at zero, and then exhaust the bands.
  The Riesz representation theorem applied to scalar matrix elements of $cal(L)$ on compact tests, and polarized,
    gives a positive operator-valued measure $mu$. Commutativity of all $h_g$ and commutation with $h$ pass to its
    Borel values by bounded monotone approximation. This proves (3.25) first for compactly supported smooth profiles.
  It remains to rule out mass at infinity, which is not automatic from a representation on compact tests.
    Choose a radial $chi_0 in C_c^oo \( bb(R)^2 \)$, $0 lt.eq chi_0 lt.eq 1$,
    equal to one near zero and nonincreasing along rays. Set $chi_(0 \, R) \( z \) = chi_0 \( z \/ R \)$.
    The Taylor estimate at the $Y = 0$ fiber gives, on $"Dom" h^(1 \/ 2)$,
  #[#set math.equation(numbering: n => "(3.27)")
   $ 0 lt.eq upright(bold(1)) - mu \( chi_(0 \, R) \) lt.eq C R^(- 2) h . $ <N:tightness>]
  For $cal(E)_R = upright(bold(1)) - mu \( chi_(0 \, R) \)$, positivity gives $0 lt.eq cal(E)_R lt.eq
    upright(bold(1))$, hence $∥cal(E)_R psi∥^2 lt.eq ⟨psi \, cal(E)_R psi⟩$.
    Equation (3.27) therefore gives strong convergence to zero first on $"Dom" h^(1 \/ 2)$ and then,
    by density and the contraction bound, on the whole internal space.
    Monotone convergence and density imply $mu \( chi_(0 \, R) \) arrow.t upright(bold(1))$ strongly.
    This proves normalization and excludes escaping mass. It also extends the representation from compact tests to
    bounded smooth profiles. Indeed positivity and linearity at the $Y = 0$ fiber give
  $ \| cal(L) \( g \) - mu \( g chi_(0 \, R) \) \| lt.eq ∥g∥_oo #scale(x: 120%, y: 120%)[\(] upright(bold(1)) -
    mu \( chi_(0 \, R) \) #scale(x: 120%, y: 120%)[\)] . $
  The right side tends strongly to zero; it controls the omitted scalar matrix elements,
    and polarization completes the extension.
  For the precise second-moment constant, put $q_R \( z \) = \| z \|^2 chi_(0 \, R) \( z \)$.
    These bounded smooth profiles increase to $\| z \|^2$ and satisfy $q_R lt.eq p_0$.
    Direct cut inclusion and log order give $h_(q_R) lt.eq \| Y \|^2 + h$. At $Y = 0$ this is
  $ 0 lt.eq mu \( q_R \) lt.eq h . $
  Monotone convergence defines the densely defined closed second moment form $kappa$, dominated by $h$.
    All its bounded spectral approximants commute with $h$, so $kappa$ is affiliated with the same commutative
    algebra. This proves $kappa lt.eq h$ with coefficient one, rather than a Hessian-dependent constant.
  Finally let $e in bb(R)^2$ and $a_R \( z \) = \( e dot.op z \) chi_(0 \, R) \( z \)$.
    Then $a_R \( 0 \) = 0$ and $∥a''_R∥_oo lt.eq C \| e \| \/ R$, so
  $ \| mu \( a_R \) \| lt.eq C \| e \| R^(- 1) h . $
  The second-moment bound makes the first moment integrable on the $h$ form domain: for $psi in "Dom" h^(1 \/ 2)$,
  $ integral \| z \| thin ⟨psi \, mu \( upright(d) z \) psi⟩ lt.eq ∥psi∥ thin ∥h^(1 \/ 2) psi∥ . $
  Dominated convergence and polarization now give $integral e dot.op z thin mu \( upright(d) z \) = 0$.
    This proves (3.26). Covariance of the construction under changes of transverse axes and dilations follows from
    covariance of the original cut generators; boost independence has already removed the choice of boost coordinate. ◻
]

The measure and its moment have been constructed using one horizon.
  For the comparison between two horizons we also need them to be independent of whether the bounded tests were
  taken in the original or the reflected net. The physical Ward formula supplies precisely that identification.

#thm([Corollary 3.5.])[
  (Reflected agreement).  #emph[Repeat the construction with past cuts of the original physical net,
    or with the twist-corrected reflected net, and reflect back to the same future orientation.
    The bounded profile functionals, the measure $mu$, and the quadratic moment $K_n$ agree.]
] <N:reflected-agreement>

#proof[
  Wightman wedge reflection gives the same polynomial vacuum data and the same physical stress-tensor flux on the
    right side of (3.23). Proposition 12 therefore identifies the two bounded-profile forms on opposite polynomial
    vacuum vectors. Their $b^(1 \/ 2)$ graph density and the uniform form bound identify the operators.
    The compact-profile measure and its monotone moments are consequently identical.
    This argument identifies the bounded functionals and their quadratic moment;
    it does not identify the full parabolic modular generator with $K_n$ at this stage. ◻
]

== 4 Two horizons and the scalar spectral comparison <sec:dispersion>

The comparison needed for the trace polarization is stronger than the order-two comparison furnished by its
  physical differential field. We prove that the quadratic moment of the bounded-profile generators satisfies an
  order-zero comparison on the vacuum wave $l$. No local field with vacuum wave $l$ is used in this Section.

The argument has two parts. First, the same causal stress-tensor commutator is evaluated from two null directions.
  This relates their bounded-profile matrices after all local subtraction terms have been removed.
  Second, the difference between Hankel orders two and zero is shown to have only one possible tail.
  A logarithmically long radial test makes the two-horizon identity detect the squared norm of that tail,
  and positivity forces it to vanish.

We recall precisely the inputs from Sections 2 and 3. On the internal Hilbert space at fixed light-front
  coordinates, $h gt.eq 0$ is the parabolic operator and $h_nu = - partial_M^2 - M^(- 1) partial_M +
  nu^2 M^(- 2)$ has its regular Hankel realization in $L^2 \( bb(R)_(+) \, M thin upright(d) M \)$.
  The comparison (2.26) applies with

#[#set math.equation(numbering: n => "(4.1)")
 $ upright("constant polarization label") & nu\
c_V = l + j_z \, quad c_T = l \/ 3 + s_z & 0\
l \, med j_z \, med s_z & 2\
j_i \, med s_(z i) & 1 . $ <D:orders>]

The bounded Ward formula (3.23), including its polynomial extension, and the moment representation give

#[#set math.equation(numbering: n => "(4.2)")
 $ H_g = b integral g \( Y + z' \) thin mu \( upright(d) z' \) \, wide mu \( 1 \) = upright(bold(1)) \, wide
   mu \( z'_i \) = 0 \, wide kappa := mu \( \| z' \|^2 \) lt.eq h . $ <D:measure-input>]

Here $mu$ is a positive commutative operator-valued measure; its values commute with $h$, $Y$ and $b$.
  It need not be projection-valued. The construction is covariant under dilatations and rotations,
  independent of the boost coordinate, and agrees with the reflected construction. Consequently, on every copy in (4.1),

#[#set math.equation(numbering: n => "(4.3)")
 $ upright(bold(1))_(\( s \, oo \)) \( kappa \) upright(bold(1))_(\[ 0 \, s \]) \( h_nu \) = 0 \,
   wide ∥kappa^t psi∥ lt.eq ∥h_nu^t psi∥ quad \( t > 0 \) . $ <D:inherited-comparison>]

Indeed $kappa$ and $h$ commute, so $kappa lt.eq h$ combines with the spectral comparison for $h$.
  All internal formulas below are Hilbert space formulas or distributions tested on compact output mass intervals;
  they do not presume integral kernels for $mu$.

In particular, the comparison in (4.3) retains the embedding of each scalar copy in the ambient internal space.
  It bounds the spectrum of its image; it does not say that $kappa$ preserves that copy.
  Reduction will be proved only after the charge identities are available.

=== 4.1 The plane matrix and its causal continuation <the-plane-matrix-and-its-causal-continuation>

The bounded Ward identity initially supplies a localized plane matrix.
  To compare the two horizons we need its causal continuation and a fixed-normal restriction in the particular
  three-point channel used here. We establish these two operations before carrying out any Cauchy subtraction.

Fix future null vectors $n \, macron(n)$ with $n dot.op macron(n) = 1$ and use the transverse frame of Section 2. Write

#[#set math.equation(numbering: n => "(4.4)")
 $ p & = a n + b macron(n) + w \, & p^2 & = M_o^2 > 0 \,\
k & = a_x n + q \, & p - k & = \( a - a_x \) n + b macron(n) + r \, wide w = q + r \,\
X & = - k^2 = \| q \|^2 \, & z & = - \( p - k \)^2 = \| r \|^2 - 2 b \( a - a_x \) . $ <D:kinematics>]

The comparison point is $a_x = a$, where both virtualities are strictly spacelike:
  $X = \| q \|^2 > 0$ and $z = \| r \|^2 > 0$.

#thm([Lemma 4.1.])[
  (The full-plane matrix).  #emph[On the spacelike-transfer part of $n dot.op k = 0$,
    the full $T_(n n)$ matrix integrated along $n$ is the matrix of $b integral g \( Y + z' \)
    mu \( upright(d) z' \)$. Initially the assertion is a joint distributional identity,
    averaged over the null direction $n$ and tested in the normal displacement $u$ of the plane.
    For the stress-tensor three-point matrix with timelike spin-one output used below,
    the angular average can be removed: $n$ may be fixed. The displacement $u$ remains a distributional variable,
    whose Fourier transform supplies $a_x$.]
] <D:plane-matrix>

#proof[
  Translate the plane normally by $u$, test $u$ with a compact smooth function,
    and choose $hat(g)$ smooth with compact support in a transverse annulus.
    Average $n$ over a small smooth patch, taking a smooth transverse frame and a sphere normalization of $n$.
    Opposite wedge tests can be chosen uniformly for these small changes.
    Insert a cutoff in the longitudinal coordinate $v$ and split its matrix by the separating step used in (3.23).
    One term is that Ward formula; the remaining term is an all-plane vacuum matrix.
    The latter vanishes at spacelike transfer by the vacuum spectrum.
    The operator on the Ward side at normal coordinate $u$ is $U_a \( u \) H_g U_a \( - u \)$.
  The removal of the $v$ cutoff has an independent distributional meaning.
    In momentum space it inserts $2 pi delta \( n dot.op k \)$ after averaging over $n$.
    On its support, $k = a_x n + q$ with $q$ in the chosen annulus.
    The derivative of $n dot.op k$ in an angular direction of $n$ has the nonzero transverse component $q$.
    The coarea formula therefore turns the averaged delta insertion into a smooth multiplier.
    The Fourier transform of the normal test is Schwartz. Derivatives of the moving coordinates cost polynomial
    factors, absorbed by this decay and the compact annular test.
    Thus the cutoff multipliers converge in the Schwartz seminorms needed to pair with any of the tempered
    external field distributions. For an arbitrary fixed list of original fields,
    these are the finite sums of homogeneous-list distributions established in Section 2;
    no single scaling dimension is assigned to the whole list.
  The identity on opposite wedge tests extends to arbitrary external translations by positive-energy tube
    uniqueness. On the operator side, $\| H_g \| lt.eq ∥g∥_oo b$ supplies the polynomial energy bound:
    insert positive-energy exponential damping in the two external vectors,
    obtain the holomorphic matrix elements, and remove the damping as distributional boundary values.
    Equality on the open wedge patch then determines the boundary distribution everywhere.
    This establishes the identity jointly with the normal parameters.
    The fixed-normal pullback needed here is justified in Lemma 16. ◻
]

#thm([Lemma 4.2.])[
  (Fixed-spacelike-virtuality dispersion).  #emph[Test $\[ T_(alpha beta) \( x \) \, T_(rho sigma) \( 0 \) \]
    Omega$ against the spin-one output wave, with output measure $upright(d)^4 p$ on the open timelike cone.
    At fixed $X > 0$, the contracted matrix in (4.4) is the jump of polynomially bounded functions holomorphic in
    the upper and lower $z$ half-planes. The jump is the first Wightman order and is supported in $z lt.eq 0$.
    At fixed $z > 0$, the corresponding $X$ jump is the reversed Wightman order with the same sign.
    The two gap values come from one causal splitting of this commutator.]
] <D:causal-continuation>

#proof[
  Retain compact timelike output tests throughout the construction.
    Testing against a $j$ label amounts to testing with $V$ and smooth transverse projectors on that compact set.
    Lorentz and scale covariance trivialize the open timelike orbit,
    leaving only the finite rest-rotation representation. They identify the resulting distributions in
    simultaneous moving coordinates. Fixed-$p$ formulas below refer to this covariant disintegration;
    their estimates are uniform on compact positive output mass ranges.
  Local commutativity supports the relative-position commutator in $overline(V)_(+) union overline(V)_(-)$.
    Off the origin choose future and past cutoffs constant near these two cones on the unit sphere.
    Finite distribution order allows their products to be extended through the origin by subtracting a
    sufficiently long Taylor jet of the test function. This is the cone-supported distribution extension used in
    causal splitting; see #cite(label("EpsteinGlaser1973")) Section 5.1.
    Restore the total commutator by a distribution supported at the origin.
    This gives tempered cone-supported distributions whose difference is the commutator.
    Average the splitting over rest rotations and transport it along the timelike Lorentz and scale orbit.
    Its local ambiguity is a finite sum of derivatives of a delta function.
    With the Fourier convention $D \( p \, x \) = integral e^(i k x) D \( p \, k \) thin upright(d) k$,
    the resulting boundary values $D^(+) \, D^(-)$ are holomorphic in the upper and lower primitive tubes,
    respectively, with polynomial bounds in momentum and inverse distance to the tube boundary
    #cite(label("BrosIagolnitzer1973")) Section 1, pp. 155–156.
  Here is a direct path from those tubes to the required half-planes. In the rest frame of $p$, set
  #[#set math.equation(numbering: n => "(4.5)")
   $ k^0 = frac(M_o^2 - X + z, 2 M_o) \, wide R^2 = \( k^0 \)^2 + X \, wide bold(k) = R omega \, quad
     omega in S^2 upright(" real") . $ <D:virtuality-path>]
  Write $k^0 = u + i v$, $R = s + i t$. Direct calculation gives
  #[#set math.equation(numbering: n => "(4.6)")
   $ v^2 - t^2 = frac(2 X v^2, u^2 + v^2 + X + \| \( u + i v \)^2 + X \|) > 0 \, wide \| v \| - \| t \| gt.eq
     frac(X \| v \|, 2 \( u^2 + v^2 + X \)) . $ <D:tube-distance>]
  Thus (4.5) lies strictly in the relevant tube whenever $"Im" z eq.not 0$.
    On compact positive $X \, M_o$ ranges the distance is bounded below by a constant times $\| "Im"
    z \| \/ \( 1 + \| z \| \)^2$. The tube bounds therefore give polynomial bounds in $\| z \| + \| "Im" z \|^(- 1)$.
  The square root in (4.5) introduces no extra branch. A tensor with the fixed finite collection of external
    indices has only finitely many rotation harmonics. A harmonic of degree $s$ is $R^s$ times a Cartesian
    harmonic polynomial in $omega$; its remaining scalar coefficient is even and analytic in $R$.
    At $R = 0$, where the path is still inside a tube, analyticity in the Cartesian momentum components proves
    regularity of that coefficient. Divide by $R^s$ and reconstruct with Cartesian harmonic polynomials.
    The scalar coefficients are single-valued functions of the two invariants.
    They can consequently be evaluated at the actual moving light-front momentum in (4.4),
    even though that complex momentum itself has null imaginary part.
    The branch points $k^0 = plus.minus i sqrt(X)$ are nonreal;
    none belongs to the real locus on which a distributional restriction is taken.
  We also verify that the real boundary obtained this way is the required restriction.
    For fixed real $omega$, $upright(d) R \/ upright(d) k^0 =
    k^0 \/ sqrt(\( k^0 \)^2 + X)$ has absolute value less than one. The real tangent is strictly timelike.
    Integration by parts against a compact test interval therefore gives the uniform decay on the dual cone needed
    for the Fourier–Laplace boundary limit. The harmonic reconstruction gives the moving-direction restriction.
    There is a useful equivalent noncharacteristic check. The tube boundary distributions have ordinary wavefront
    covectors in the corresponding causal cones: compact localization in momentum convolves the cone-supported
    tempered inverse Fourier transform with a Schwartz function,
    giving rapid decay in directions outside that cone. For the full finite tensor family,
    rest-rotation covariance gives equations $L_(i j) D = rho_(i j) D$,
    where $L_(i j)$ is the angular rotation vector field and $rho_(i j)$ a constant matrix on the tensor indices.
    The principal symbols of these equations force every singular covector to annihilate the angular orbit.
    Since real spacelike $k$ has nonzero spatial part, its annihilator is exactly $"span" { p \, k }$.
    If $xi = A p + B k$ annihilates the tangent $n$ in (4.4), then $A b = 0$, so $xi = B k$.
    As $k^2 = - X < 0$, no nonzero such covector is causal. The pullback along $a_x mapsto a_x n +
    q$ is therefore noncharacteristic. On compact positive $X$ and timelike output ranges the separation of its
    conormal bundle from these wavefront cones persists in a small angular patch of $n$.
    The restricted distribution thus depends smoothly on that patch, removing the angular average in Lemma 15.
    The normal displacement $u$ is still tested, or Fourier transformed;
    no point evaluation of an arbitrary distribution in $u$ is needed.
    This is a restriction statement for this covariant three-point matrix,
    not for arbitrary null-plane field distributions.
  In the first Wightman order the vacuum leg has momentum $p - k$; in the reverse order it has momentum $k$.
    At $X > 0$ the reverse order vanishes by the spectrum condition, and the first can occur only for $z lt.eq 0$.
    The two holomorphic boundary values glue in the positive $z$ gap.
    If instead $z > 0$ is fixed and $X$ varies, upper-half-plane continuation corresponds to the lower original
    tube; its jump is minus the commutator, hence the reverse Wightman order with a positive sign.
    Both gap values are values of the same split commutator at two spacelike virtualities.
    This proves the comparison directly from causal tubes, without a crossing assumption. ◻
]

=== 4.2 Subtractions and the two-horizon identity <subtractions-and-the-two-horizon-identity>

Causal continuation identifies the two spacelike gap values,
  but a dispersion formula determines each only up to a polynomial.
  The next step tracks the dependence of these polynomials on the transverse variables.
  The useful conclusion is their separated form: each ambiguity is polynomial in at least one of the two variables.

Write $\[ psi \]_(j_A)$ for the output distribution tested against the constant spin-one label in the indicated
  horizon frame, and put $mu_n \( q \) = integral e^(i q dot.op z') mu \( upright(d) z' \)$ in that frame.
  Application of Lemma 15 to the first jump gives, after testing it with $phi.alt \( z \)$,
  a fixed nonzero common constant times

#[#set math.equation(numbering: n => "(4.7)")
 $
   [mu_n \( q \) \( M^2 + \| r \|^2 \)^2 c_T^(\( macron(n) \)) \( M \, r \) thin phi.alt \( - M^2 \)]_(j_A) \(
   M_o \) . $ <D:jump>]

The normalization is worth checking. The plane insertion is $b mu_n \( q \) e^(i q dot.op Y)$,
  conjugated by $U_a \( u \)$, and the input polarization is $T_(macron(n) macron(n)) =
  a_i^2 c_T^(\( macron(n) \))$ with $a_i = \( M^2 + \| r \|^2 \) \/ \( 2 b \)$.
  The normal Fourier measure is $upright(d) a_x = upright(d) z \/ \( 2 b \)$.
  Thus the jump with respect to $upright(d) z$ contains $2 b^2 a_i^2 = \( M^2 + \| r \|^2 \)^2 \/ 2$;
  no boost factor remains. The opposite channel has exactly the same constant.
  These identities can first be tested on external wave packets,
  so (4.7) means bounded operator application to an internal $M thin upright(d)
  M$ wave and testing on compact output masses.

#thm([Lemma 4.3.])[
  (The subtraction ambiguities).  #emph[There are continuous $L^2 \( M thin upright(d) M \)$-valued
    regularizations $chi_(upright("reg"))^n \( r \, M \)$ of
#[#set math.equation(numbering: n => "(4.8)")
 $ chi^n \( r \, M \) = \( M^2 + \| r \|^2 \) c_T^(\( macron(n) \)) \( M \, r \) $ <D:chi>]

 such that, with $w = q + r$ and
#[#set math.equation(numbering: n => "(4.9)")
 $ A_A = \[ mu_n \( q \) chi_(upright("reg"))^n \( r \) \]_(j_A^(\( n \))) \, wide
   B_A = \[ mu_(macron(n)) \( r \) chi_(upright("reg"))^(macron(n)) \( q \) \]_(j_A^(\( macron(n) \))) \, $ <D:AB>]

 one has
#[#set math.equation(numbering: n => "(4.10)")
 $ \( M_o^2 + \| w \|^2 \) A_z - \( \| w \|^2 - M_o^2 \) B_z + 2 M_o w_i B_i = P_q + P_r . $ <D:two-horizon>]

 The degree of each polynomial is uniformly finite. The coefficients of $P_q$, polynomial in $q$,
   may depend on $r$; those of $P_r$, polynomial in $r$, may depend on $q$.]
] <D:subtractions>

#proof[
  Choose a positive subtraction point $z_0$ and retain the full finite covariant tensor family.
    Use one integer $d$ larger than all its polynomial growth orders,
    perform the Cauchy subtraction on that family, and then contract with $n n \,
    macron(n) macron(n)$ and the output frame. The subtracted Cauchy kernel is
  $ frac(\( z - z_0 \)^d, \( z' - z_0 \)^d \( z' - z \)) . $
  Using (4.7), its value at $z = \| r \|^2$ is proportional to
  #[#set math.equation(numbering: n => "(4.11)")
   $ [mu_n \( q \) chi^n \( r \, M \) (frac(\| r \|^2 - z_0, - M^2 - z_0))^d]_(j_A) . $ <D:cauchy-wave>]
  Subtracting this Cauchy transform leaves zero jump. Its boundary Fourier transform is supported in both closed
    half-lines, hence at zero; the remainder is a polynomial in $z$.
  Its dependence on the transverse parameter must also be controlled.
    A null rotation with parameter $beta$, fixing $n$, changes
  $ r mapsto r + b beta \, quad a mapsto a + beta dot.op \( q + r \) + 1 / 2 b \| beta \|^2 \, quad
    a_x mapsto a_x + beta dot.op q . $
  It fixes $b \, M_o \, q \, X \, z$ and transports the output adapted frame.
    The remaining tensor contractions transform polynomially in $beta$, by a matrix independent of $z$.
    This matrix commutes with the common-order Cauchy subtraction.
    Covariance of the split commutator therefore makes the coefficients of its subtraction polynomial polynomial
    in $r$ at fixed $q$. Evaluation at $z = \| r \|^2$ preserves this property.
    The opposite calculation gives a polynomial in $q$ at fixed $r$.
    The degrees are uniform because the distribution order in a rest frame and the degrees of the finite tensor
    representation are finite. The opposite calculation may hold its own boost coordinate $a$ fixed;
    the evaluated contracted matrix has net boost weight zero,
    so it can then be written at the same $b$ as the first calculation.
  For completeness the wave regularization can be made explicitly. Set $R_2 = \| r \|^2$, $D = M^2 + R_2$.
    The change of spatial frame gives
  #[#set math.equation(numbering: n => "(4.12)")
   $ c_T^(\( macron(n) \)) = l \/ 3 + d_A d_B s_(A B) \, wide d_z = frac(R_2 - M^2, D) \, wide d_i = -
     frac(2 M r_i, D) . $ <D:polarization>]
  Write $s_(i j)^(upright("TF")) = s_(i j) + delta_(i j) s_z \/ 2$. Expansion of (4.12) gives
  #[#set math.equation(numbering: n => "(4.13)")
   $ chi^n = D / 3 l + (R_2 - 5 M^2 + frac(6 M^4, D)) s_z + (- 4 M r_i + frac(8 M^3 r_i, D)) s_(z i) +
     frac(4 M^2 r_i r_j, D) s_(i j)^(upright("TF")) . $ <D:chi-expansion>]
  In particular the radial coefficient follows from $s_11 + s_22 = - s_z$:
    $\( \( R_2 - M^2 \)^2 - 2 M^2 R_2 \) \/ D = R_2 - 5 M^2 + 6 M^4 \/ D$. The vector coefficient is $2 D d_z d_i$.
  Choose a smooth mass cutoff $zeta$ equal to zero below $1$ and one above $2$, and subtract $zeta \( M \)$ times
  $ frac(M^2 + R_2, 3) l + \( M^2 - 5 R_2 \) s_z + \( 4 M r_i - 8 r_i R_2 \/ M \) s_(z i) +
    4 r_i r_j s_(i j)^(upright("TF")) . $
  The remaining large-mass terms are $O \( M^(- 2) \)$ or better on compact $r$ sets,
    and hence belong to $L^2 \( M thin upright(d) M \)$. At small mass, $\| d \| = 1$ in (4.12),
    so the norm is bounded by a constant times $M^2 + \| r \|^2$.
    Dominated convergence now proves continuity also at $r = 0$; the same formulas give polynomial growth in $r$.
  Replacing (4.11) by this regularization changes only an $L^2$-valued polynomial in $r$. Indeed
  $ \( R_2 - z_0 \)^d - \( - M^2 - z_0 \)^d $
  is divisible by $D$, canceling the sole denominator in (4.13).
    Both regulated expressions are $L^2$ waves; polynomial interpolation then shows that every coefficient of
    their polynomial difference is an $L^2$ wave. Choose the same mass cutoff and subtraction prescription in the
    other horizon.
  Finally the output frame rotation is
  $ j_z^(\( n \)) = frac(\| w \|^2 - M_o^2, M_o^2 + \| w \|^2) j_z^(\( macron(n) \)) -
    frac(2 M_o w_i, M_o^2 + \| w \|^2) j_i^(\( macron(n) \)) . $
  The common gap value from Lemma 16 and the common jump normalization therefore give (4.10) off $q = 0$ and $r = 0$.
  There is no extra distribution supported on those axes. The left side is continuous in $q \, r$,
    with values on compact mass tests. Take polynomial interpolation projections $cal(P)_q \,
    cal(P)_r$ of degrees larger than the two degree bounds, using nodes away from zero.
    On the off-axis patch, $\( 1 - cal(P)_q \) \( 1 - cal(P)_r \)$ annihilates the left side.
    By continuity it does so everywhere. Decomposing with these two projections extends its separated-polynomial
    form to all $q \, r$. ◻
]

Fix the transverse Fourier convention

$ hat(g) \( r \) = \( 2 pi \)^(- 2) integral e^(- i r dot.op z') g \( z' \) thin upright(d)^2 z' \, wide
  g \( z' \) = integral e^(i r dot.op z') hat(g) \( r \) thin upright(d)^2 r . $

If both position tests vanish near the origin, every term $P_q + P_r$ in (4.10) is annihilated.
  For a real radial $g in C_c^oo \( bb(R)^2 \\ { 0 } \)$, put

#[#set math.equation(numbering: n => "(4.14)")
 $ Phi \( g \) = integral hat(g) \( r \) chi^n \( r \, M \) thin upright(d)^2 r \, wide mu \( g \) =
   integral g \( z' \) mu \( upright(d) z' \) . $ <D:Phi>]

The subtraction makes no difference in this formula.

Indeed, integrating a polynomial in $r$ against $hat(g) \( r \)$ gives a finite linear combination of derivatives
  of $g$ at zero, all of which vanish. With one such test in each transverse variable,
  this removes $P_q$ and $P_r$ separately, even though their remaining coefficients can depend on the other
  variable. The regularized formula supplies the meaning of this operation on the original wave.
  To perform the horizon exchange explicitly, let $sans(R)$ be the spatial half-turn about $e_2$.
  It sends $n$ to $macron(n)$, $macron(n)$ to $n$, and acts on transverse coordinates by $sans(S) =
  "diag" \( - 1 \, 1 \)$. The adapted tetrads obey

$ sans(R) e_z^(\( n \)) \( p \) = e_z^(\( macron(n) \)) \( sans(R) p \) \, wide sans(R) e_i^(\( n \)) \( p \) =
  sans(S)_(i j) e_j^(\( macron(n) \)) \( sans(R) p \) . $

Thus the longitudinal label has no extra sign. In the covariantly identified output frames,
  with the same regularization on both horizons,

$ A_z \( q \, r \) = B_z \( sans(S) r \, sans(S) q \) \, wide A_i \( q \, r \) =
  sans(S)_(i j) B_j \( sans(S) r \, sans(S) q \) . $

Write $chevron.l F chevron.r_g = integral hat(g) \( q \) hat(g) \( r \) F \( q \, r \) thin upright(d)^2 q thin
  upright(d)^2 r$. Radiality makes the test invariant under $\( q \, r \) mapsto \( sans(S) r \, sans(S) q \)$,
  including the weight $\| q + r \|^2$. Consequently

$ chevron.l A_z chevron.r_g = chevron.l B_z chevron.r_g = : C_g \, wide chevron.l \| q + r \|^2 A_z chevron.r_g =
  chevron.l \| q + r \|^2 B_z chevron.r_g \, $

and (4.10) reduces to

$ 2 M_o^2 C_g + 2 M_o sum_i chevron.l \( q_i + r_i \) B_i chevron.r_g = 0 . $

Our Fourier convention gives $q_i hat(g) \( q \) = - i accent(partial_i g, ̂) \( q \)$.
  Each of the two summands differentiates one test, with the same sign.
  On returning their vector contraction to the $n$ frame, the transverse matrix $sans(S)$ occurs twice and
  cancels. Division by $2 M_o$ gives

#[#set math.equation(numbering: n => "(4.15)")
 $ M_o \[ mu \( g \) Phi \( g \) \]_(j_z) =
   i sum_i \[ mu \( partial_i g \) Phi \( g \) + mu \( g \) Phi \( partial_i g \) \]_(j_i) . $ <D:radial-identity>]

Reversing the Fourier orientation would change the common phase, which will play no role;
  the relative coefficients are fixed. In particular, (4.13) shows that the radial and vector kernels surviving
  away from the position origin are $6 M^4 \/ \( \| r \|^2 + M^2 \)$ and $8 M^3 r_i \/ \( \| r \|^2 + M^2 \)$.
  The two-dimensional massive Green transform gives respectively $M^4
  K_0 \( M \| z' \| \)$ and a fixed imaginary multiple of $M^4 hat(z)'_i K_1 \( M \| z' \| \)$.
  The scalar and transverse trace-free terms do not contribute to a radial test,
  nor to its first angular harmonic derivative, as appropriate.

=== 4.3 Exact Hankel leakage <exact-hankel-leakage>

We now isolate the only obstruction to improving the order-two comparison on $l$ to order zero.
  A test with zero first radial moment has no leakage beyond its Hankel support.
  It follows that every possible exterior tail depends on that single moment;
  dilation covariance will determine its exact shape.

Let $cal(H)_nu$ be the unitary Hankel transform

$ \( cal(H)_nu F \) \( M \) = integral_0^oo J_nu \( M v \) F \( v \) v thin upright(d) v . $

It diagonalizes $h_nu$ as multiplication by $v^2$. Put $lambda = sqrt(kappa)$.
  On its positive spectral part, dilatation covariance permits a homogeneous realization
  $L^2 \( bb(R)_(+) \, lambda thin upright(d) lambda \; cal(K) \)$ with constant multiplicity space $cal(K)$.
  Its zero spectral subspace is kept separately. Write $cal(U)$ for this spectral realization,
  and $f c$ for the input radial wave with label $c$.

#thm([Lemma 4.4.])[
  (Exact tail).  #emph[For $c = l \, j_z \, s_z$ there is $d_c in cal(K)$ such that, if $F in C_c^oo \( 0 \, R \)$, then
#[#set math.equation(numbering: n => "(4.16)")
 $ cal(U) #scale(x: 120%, y: 120%)[\(] c cal(H)_0 F #scale(x: 120%, y: 120%)[\)] \( lambda \) =
   (integral_0^oo v F \( v \) thin upright(d) v) lambda^(- 2) d_c quad
   upright("for almost every ") lambda > R . $ <D:tail>]

 The label map is linear, and
#[#set math.equation(numbering: n => "(4.17)")
 $ d_(j_z) = - d_l \, wide d_(s_z) = - d_l \/ 3 . $ <D:tail-relations>]

]
] <D:exact-tail>

#proof[
  The Bessel recurrence $J_2 \( x \) = 2 J_1 \( x \) \/ x -
    J_0 \( x \)$ and $integral_0^v r J_0 \( M r \) thin upright(d) r = v J_1 \( M v \) \/ M$ give
  #[#set math.equation(numbering: n => "(4.18)")
   $ \( cal(H)_2 cal(H)_0 F \) \( v \) = 2 / v^2 integral_0^v r F \( r \) thin upright(d) r -
     F \( v \) . $ <D:hankel-transfer>]
  The identity first follows on smooth compact tests by the unitary Hankel inversion and then in
    $L^2 \( v thin upright(d) v \)$. If $F$ has zero first radial moment and support below $R$,
    the right side also has support below $R$. The order-two comparison in (4.3) therefore puts $c cal(H)_0
    F$ in the $lambda lt.eq R$ subspace.
  Consequently the restriction of the transfer to any interval strictly above $R$ factors through the single
    functional $F mapsto integral v F \( v \) thin upright(d) v$.
    Choose one annular test with this moment equal to one. Overlapping support bounds identify the resulting
    vector-valued coefficient at every $lambda > 0$. In these coordinates internal dilatations act as $f \( M \)
    mapsto e^s f \( e^s M \)$ on the input and $psi \( lambda \) mapsto e^(- s)
    psi \( e^(- s) lambda \)$ on the output. Since the moment of the corresponding Hankel-side test scales by
    $e^s$, its coefficient must be $lambda^(- 2) d_c$. A reference test and its square-integrable tail ensure $d_c
    in cal(K)$. This proves an exact tail, not only its asymptotic order.
  The order-zero comparisons on $c_V$ and $c_T$ say that $c_V cal(H)_0 F$ and $c_T cal(H)_0
    F$ have no spectrum above the support radius of $F$. Linearity of the tail gives $d_l + d_(j_z) =
    0$ and $d_l \/ 3 + d_(s_z) = 0$. ◻
]

=== 4.4 The logarithmic pairing <the-logarithmic-pairing>

The tail relations alone allow a nonzero vector $d_l$. We will insert a radial test covering many scales into
  (4.15). Its two scalar-channel tails produce a term proportional to $log L thin parallel d_l parallel^2$,
  whereas the first angular harmonics give smaller terms. The estimates below keep this leading coefficient and
  the errors separate.

Choose $0 lt.eq eta_L lt.eq 1$, smooth and supported in $\( 0 \, log L \)$,
  equal to one outside fixed-width neighborhoods of the endpoints, with uniformly bounded derivatives. Set

#[#set math.equation(numbering: n => "(4.19)")
 $ g_L \( z' \) = \| z' \|^2 eta_L \( log \| z' \| \) . $ <D:plateau>]

We retain the nonzero normalization constant $c_(*)$ throughout the estimates;
  it is determined by the radial Fourier kernel.

#thm([Lemma 4.5.])[
  (Plateau estimates).  #emph[There are scalar functions $f_L \, u_L$ such that
#[#set math.equation(numbering: n => "(4.20)")
 $ Phi \( g_L \) = s_z f_L \( M \) \, wide Phi \( partial_i g_L \) = M s_(z i) u_L \( M \) \, $ <D:plateau-waves>]

 and, writing $cal(D) = M partial_M$,
#[#set math.equation(numbering: n => "(4.21)")
 $ & ∥f_L - c_(*) upright(bold(1))_(\( 1 \/ L \, 1 \))∥_(L^2 \( upright(d) M \/ M \)) =
   O \( 1 \) \, &  & c_(*) eq.not 0 \,\
 & ∥cal(D)^a f_L∥_(L^2 \( upright(d) M \/ M \)) + ∥cal(D)^a u_L∥_(L^2 \( upright(d) M \/ M \)) =
   O \( 1 \) &  & \( a = 1 \, 2 \) \,\
 & ∥kappa Phi \( partial_i g_L \)∥ = O \( 1 \) \, wide ∥f_L \/ M∥_(L^2 \( M thin upright(d) M \)) =
   O \( sqrt(log L) \) . $ <D:plateau-main>]

 For $c = s_z \, j_z$, in the positive $lambda$ representation,
#[#set math.equation(numbering: n => "(4.22)")
 $ lambda cal(U) \( c f_L \) = c_(*) upright(bold(1))_(\( 1 \, L \)) \( lambda \) lambda^(- 1) d_c + E_(c \, L) \,
   wide ∥E_(c \, L)∥_(L^2 \( lambda thin upright(d) lambda \; cal(K) \)) = O \( 1 \) . $ <D:plateau-tail>]

]
] <D:plateau-estimates>

#proof[
  The kernels computed after (4.15), with $t = M \| z' \|$, give explicitly in our transverse Fourier convention
  #[#set math.equation(numbering: n => "(4.23)")
   $ f_L \( M \) & = 6 integral_0^oo t^3 K_0 \( t \) eta_L \( log t - log M \) thin upright(d) t \,\
u_L \( M \) & = - 4 i integral_0^oo t^2 K_1 \( t \) \( 2 eta_L + eta'_L \) \( log t - log M \) thin upright(d) t .
  $ <D:f-convolution>]
  Changing the Fourier orientation changes the fixed phase in the second formula only. The first has
  $ c_(*) = 6 integral_0^oo t^3 K_0 \( t \) thin upright(d) t = 24 $
  with the convention fixed above. In particular it cannot vanish.
    On the logarithmic variable these are convolutions with integrable kernels having finite first moment.
    At $t = 0$ their densities decay exponentially in $\| log t \|$, and at infinity they decay faster;
    the relevant logarithmic derivatives have the same integrability.
    Convolution of the interval plateau differs from its kernel integral times that plateau by a uniformly bounded
    $L^2$ error: the difference is supported near the two edges up to integrable tails.
    Positive derivatives act on these two fixed-width edges. This proves (4.21)–(4.21).
    The functions themselves and their derivatives have integrable tails at zero and infinity for each fixed $L$.
  Direct differentiation gives
  $ h_1 \( M u \) = - M^(- 1) \( cal(D)^2 + 2 cal(D) \) u \, wide ∥h_1 \( M u \)∥^2 =
    integral_0^oo \| cal(D)^2 u + 2 cal(D) u \|^2 frac(upright(d) M, M) . $
  The order-one comparison proves the first estimate in (4.21); the second is (4.21).
  To prove (4.22) without assigning a divergent form norm to an individual nonzero-moment test,
    fix a smooth annular $F$ with $integral v F \( v \) thin upright(d) v = 1$ and put $G = cal(H)_0 F$.
    Replace $f_L$ by
  $ c_(*) cal(H)_0 #scale(x: 120%, y: 120%)[\(] F - L^(- 2) F \( dot.op \/ L \)
    #scale(x: 120%, y: 120%)[\)] \( M \) = c_(*) #scale(x: 120%, y: 120%)[\(] G \( M \) -
    G \( L M \) #scale(x: 120%, y: 120%)[\)] . $
  Since $G \( 0 \) = 1$ and $G$ decreases rapidly at infinity,
    this difference has the same plateau and the same uniform edge estimates as $f_L$. Its error $e_L$ satisfies
  $ ∥sqrt(h_2) e_L∥^2 = integral_0^oo \( \| cal(D) e_L \|^2 + 4 \| e_L \|^2 \) frac(upright(d) M, M) = O \( 1 \) . $
  The comparison (4.3) gives an $O \( 1 \)$ error after multiplication by $lambda$.
    Above a fixed radius, the $G$ term has the exact tail of Lemma 18.
    The norm of $G \( L M \)$ in $L^2 \( M thin upright(d) M \)$ is $L^(- 1) ∥∥ G$;
    hence its $lambda$-weighted norm below $C L$ is $O \( 1 \)$ for any fixed $C$.
    Above both Hankel support radii the two exact tails cancel, because their moments are both one.
    The remaining fixed lower interval and fixed-ratio upper interval contribute $O \( 1 \)$ to the weighted norm.
    This proves (4.22). The $lambda = 0$ spectral subspace contributes nothing to that estimate.
  Using the difference of the two dilated tests is essential here:
    their individual $lambda^(- 2)$ tails need not have finite $lambda$-weighted norm,
    but the exact cancellation above the larger support radius makes their difference admissible.
    No estimate has been assigned to either divergent weighted tail separately. ◻
]

#thm([Proposition 4.6.])[
  (Order-zero scalar comparison).  #emph[The quadratic moment $kappa$ of the physical bounded-profile generators
    satisfies
#[#set math.equation(numbering: n => "(4.24)")
 $ upright(bold(1))_(\( s \, oo \)) \( kappa \) upright(bold(1))_(\[ 0 \, s \]) \( h_0 \) \|_l =
   0 wide \( s gt.eq 0 \) . $ <D:order-zero>]

]
] <D:critical-comparison>

#proof[
  On the positive $lambda$ spectrum define
  $ A_L \( lambda \) = lambda^(- 2) mu \( g_L \) \, wide B_(i \, L) \( lambda \) =
    lambda^(- 1) mu \( partial_i g_L \) . $
  The moments in (4.2) imply $0 lt.eq A_L lt.eq upright(bold(1))$ and $∥B_(i \, L)∥ lt.eq C$ uniformly:
    $\| partial_i g_L \( z' \) \| lt.eq C \| z' \|$, and positive-measure Cauchy–Schwarz bounds its integral by $C
    sqrt(kappa)$. Scale covariance identifies the law of $z' \/
    lambda$ in each fiber with one fixed positive measure on $cal(K)$.
    Its mean is zero and its trace-second moment is $upright(bold(1))$. Hence, on every fixed multiplicity vector,
  #[#set math.equation(numbering: n => "(4.25)")
   $ A_L \( lambda \) arrow.r upright(bold(1)) \, wide B_(i \, L) \( lambda \) arrow.r 0 quad
     upright("if ") lambda arrow.r oo \, quad L \/ lambda arrow.r oo . $ <D:bulk>]
  For the first limit use the integrable weight $\| z' \/ lambda \|^2$;
    for the second use $\| z' \/ lambda \|$ and the zero first moment.
    The limiting derivative integrand is $2 z'_i \/ lambda$. Bounded convergence for the positive measure proves
    strong convergence; no uniform rate is required.
  These are statements about the fixed multiplicity vectors that enter the tail formula.
    Positivity and the second moment control the truncated integrands;
    projection-valuedness of $mu$ is unnecessary. On $ker kappa$ the second moment is zero,
    so $mu$ is concentrated at $z' = 0$ there. The profiles $g_L$ and $partial_i g_L$ vanish near that point,
    and hence this spectral subspace makes no contribution to the pairing.
  Pair (4.15) with $f_L \( M_o \) \/ M_o$ and use (4.20). This is allowed although the identity was first tested
    on compact mass intervals. Cut off this test smoothly at zero and infinity.
    The approximants converge both in its $L^2 \( M_o thin upright(d) M_o \)$ norm and after multiplication by
    $M_o$. For fixed $L$, the profile operators are bounded, and (4.21) controls the derivative wave,
    so every pairing has a limit.
  The left side becomes
  $ ⟨j_z f_L \, mu \( g_L \) s_z f_L⟩ & = ⟨lambda cal(U) \( j_z f_L \) \, A_L lambda cal(U) \( s_z f_L \)⟩\
 & = \| c_(*) \|^2 integral_1^L ⟨d_(j_z) \, A_L \( lambda \) d_(s_z)⟩ frac(upright(d) lambda, lambda) +
   O \( sqrt(log L) \) . $
  The exact normalization $\| c_(*) \|^2$ is common to the bra and ket.
    Equation (4.25) and boundedness imply, by averaging on the logarithmic interval, that this is
  #[#set math.equation(numbering: n => "(4.26)")
   $ \| c_(*) \|^2 log L thin ⟨d_(j_z) \, d_(s_z)⟩ + o \( log L \) . $ <D:leading-pairing>]
  For example, discard two logarithmic edge intervals of fixed width,
    apply the strong bulk convergence on the remaining interval, and then let the discarded width grow.
    This proves the asserted Cesaro limit directly.
  For the first term on the right of (4.15), (4.25), (4.22) and uniform boundedness give
  $ ∥mu \( partial_i g_L \) s_z f_L∥ = ∥B_(i \, L) lambda cal(U) \( s_z f_L \)∥ = o \( sqrt(log L) \) . $
  The output test $j_i f_L \/ M_o$ has norm $O \( sqrt(log L) \)$. Their pairing is therefore $o \( log L \)$.
    For the last term, $0 lt.eq mu \( g_L \) lt.eq kappa$ and commutativity give
  $ ∥mu \( g_L \) Phi \( partial_i g_L \)∥ lt.eq ∥kappa Phi \( partial_i g_L \)∥ = O \( 1 \) . $
  Its pairing is $O \( sqrt(log L) \)$. Comparison with (4.26) forces
  $ 0 = ⟨d_(j_z) \, d_(s_z)⟩ = 1 / 3 ∥d_l∥^2 \, $
  by (4.17). Thus $d_l = 0$. If either of the spin labels used above is zero,
    the same conclusion already follows from (4.17).
  Lemma 18 now says that $l cal(H)_0 F$ has no $lambda$ spectrum above $R$ whenever $F$ is supported below $R$.
    Smooth compact tests in $\( 0 \, R \)$ are dense in $L^2 \( \( 0 \, R \) \, v thin upright(d) v \)$.
    Hankel unitarity and closedness of spectral subspaces give (4.24) with $s = R^2$; at $s =
    0$ the regular $h_0$ copy has no zero eigenvector. The result concerns the moment $kappa$.
    It does not identify the full parabolic operator $h$ with that moment. ◻
]

== 5 Single insertions, quadratic charges, and time cones <sec:charges-cones>

Throughout this Section, $l$ is the dimension-two vacuum wave constructed in Section 2.
  The letter $L$ will initially denote only an insertion in a sesquilinear Wightman form.
  Neither an operator $L \( f \)$ nor a product containing two copies of $L$ is being asserted.
  This distinction is essential when conserved currents are used below.

The section proceeds through three distinct constructions.
  We first extend the extreme vacuum values of $l$ to local forms with one insertion.
  Their conserved currents then define charge forms, whose quadratic part is identified with the positive moment
  $K_n$ on a specified domain. Finally the vanishing residual dilation charge identifies the actual cone modular
  groups and produces the actual time-Möbius action used for scalar extraction.

=== 5.1 From scalar localization to one local insertion <from-scalar-localization-to-one-local-insertion>

The order-zero spectral comparison has a localization interpretation. There are two transports:
  from the scalar comparison to the moment $kappa$, and from that moment to a physical bounded cut.
  We state both, together with the reverse containment for actual parabolic cuts that will be needed later.

#thm([Lemma 5.1.])[
  (Localization transport).  #emph[Let $X_0 \( W \)$ be the scalar wedge real space in the $l$ channel,
    $iota$ its embedding into the physical Hilbert space, and $X \( W \)$ the physical wedge real space.
    For $p \( z \) = c \| z - d \|^2 + c_0$, $c > 0$, put
$ K_(0 \, p) = b { c \( \| Y - d \|^2 + h_0 \) + c_0 } \, wide K_p = b { c \( \| Y - d \|^2 + kappa \) + c_0 } . $

 Then
#[#set math.equation(numbering: n => "(5.1)")
 $ iota e^(i K_(0 \, p)) X_0 \( W \) subset e^(i K_p) X \( W \) . $ <C:moment-localization>]

 If $g$ is bounded and smooth and $g lt.eq p$, the left side also lies in $X \( W_g \) = e^(i H_g) X \( W \)$.
   Conversely, the actual parabolic real space satisfies
#[#set math.equation(numbering: n => "(5.2)")
 $ X \( W_p \) subset e^(i K_p) X \( W \) . $ <C:actual-parabolic-localization>]

 These statements hold after translations of the null plane and reflection.]
] <C:localization-transport>

#proof[
  The scalar wedge conjugation is the real scalar conjugation;
    it is identified already on the dense waves generated by $M^2 l$.
    To prove (5.1), cancel the common external factors and consider $e^(- i c b kappa) iota e^(i c b h_0)$.
    Let $E_i$ be the actual $kappa$ step projections and $P_j$ the reference $h_0$ step projections.
    Clip both spectral variables at one common finite bound, then approximate the clipped $kappa$ from below and
    the clipped $h_0$ from above. If their step values are $a_i \, c_j$, spectral inclusion gives $E_i iota P_j =
    0$ whenever $a_i > c_j$. Each surviving ordered term is therefore $E_i iota P_j e^(i c b \( c_j - a_i \))$,
    with nonnegative translation parameter; no joint spectral resolution is used.
    The coefficients intertwine the boost and wedge conjugation,
    so they map the reference real wedge space into the actual one.
    The positive translations preserve that actual space. At the common clipping endpoint both step values
    coincide, which preserves the same sign. Strong convergence follows from the separate spectral calculi as the
    mesh tends to zero and the clipping bound tends to infinity. Closedness of $X \( W \)$ proves the inclusion.
    This uses the ordered products of two separate spectral resolutions, not a joint resolution of $kappa$ and $h_0$.
  For the second transport, positivity, normalization, and the zero first moment of $mu$ give
  $ H_g = b integral g \( Y + z \) mu \( upright(d) z \) lt.eq b { c \( \| Y - d \|^2 + kappa \) + c_0 } = K_p . $
  This inequality is in the common commuting calculus. Its difference is $b$ times a nonnegative boost-independent
    operator commuting with wedge conjugation. Thus $e^(i \( K_p - H_g \))$ is a direct integral of inward null
    translations and preserves $X \( W \)$. Apply it to (5.1) to obtain membership in $X \( W_g \)$.
  Finally the actual parabolic generator is $H_p = b { c \( \| Y - d \|^2 + h \) + c_0 }$.
    Since $h$ and $kappa$ commute and $kappa lt.eq h$, the same argument applies to $H_p - K_p =
    b c \( h - kappa \) gt.eq 0$ and proves (5.2). The operators vanish on $b = 0$.
    Covariance and reflected agreement give the remaining placements. No equality of $h$ with $kappa$ is used. ◻
]

Here is the resulting extreme-ordering statement. First let $A_i \( y_i \)$ be homogeneous original physical
  fields. The two expressions with $L \( x \)$ at the extreme left or extreme right are defined by pairing the
  wave $l$ with a physical polynomial vector. They agree whenever $x$ is spacelike to all $y_i$ and,
  for some future null $n$,

#[#set math.equation(numbering: n => "(5.3)")
 $ n dot.op x < min_i n dot.op y_i quad upright("or") quad n dot.op x > max_i n dot.op y_i . $ <C:extreme-patch>]

For the first alternative, place a null plane between $x$ and the $y_i$ and use the future shadow of a tip just
  before $x$ as a dominating parabola. The past shadows of the $y_i$ lie strictly below it by spacelikeness.
  Their differences from it tend quadratically to $- oo$ at transverse infinity,
  so a bounded smooth truncation from below still separates the supports.
  These strict inequalities persist in small neighborhoods.
  Locality of bounded operations in that cut, followed by Tomita adjunction of the whole physical product,
  proves the equality. The opposite alternative uses the reflected construction.
  The scalar insertion is even, so no additional graded sign occurs.
  For a permitted compact joint kernel, the same statement follows by the tensor-test approximation and closed
  Tomita-graph limit in the discussion of (2.2); it does not require an affiliated realization for the
  joint-smeared polynomial itself.

The remaining task is to place this insertion between arbitrary physical factors while retaining their ordered
  spectra. Causal solutions at adjacent interchanges will have the required wave source,
  but their compatibility leaves a homogeneous-wave defect.
  The next lemma recovers such a defect from its support and spectator analyticity.
  We then apply it to assemble the insertion with all its ordering cones.

#thm([Lemma 5.2.])[
  (Recovery of a homogeneous wave defect).  #emph[Let $H \( x \, y_1 \, dots.h \, y_m \)$, $m gt.eq 1$,
    be a tempered, jointly translation-invariant distribution with $square.stroked_x H = 0$ and
#[#set math.equation(numbering: n => "(5.4)")
 $ "supp"_x H subset C_y union K_y \, wide C_y = union.big_i J \( y_i \) \, wide
   K_y = ⋂_(n med upright(f u t u r e med n u l l)) { x : min_i n dot.op y_i lt.eq n dot.op x lt.eq
   max_i n dot.op y_i } . $ <C:H-support>]

 For a compact transfer-momentum test $phi \( k \)$, let $H_phi \( y \)$ be its pairing with the partial Fourier
   transform in $x$, using $e^(- i k x)$. Suppose these pairings are holomorphic in the ordered spectator tube
   and, for $"supp" phi subset { \| k \| lt.eq K }$, $0 < K lt.eq 1$, obey
#[#set math.equation(numbering: n => "(5.5)")
 $ \| H_phi \( y \) \| lt.eq C p_N \( phi \) \( 1 + \| y \| + delta \( y \)^(- 1) \)^N
   exp \( C K \| "Im" y \| \) . $ <C:shifted-test-bound>]

 Here $p_N$ is one fixed finite Schwartz seminorm and $delta \( y \)$ is the minimum distance of the successive
   imaginary gaps from the cone boundary ($delta = 1$ for $m = 1$). Then $H$ is a finite sum
$ H \( x \, y \) = sum_(i \, P) C_(i P) \( y \) P \( partial_x \) Delta_0 \( x - y_i \) \, $

 where the coefficients have tempered boundaries with the ordinary ordered spectator spectra.
   They are invariant under common spectator translation. The polynomials $P$ may be chosen independently modulo
   $k^2$. We normalize the massless commutator solution by $Delta_0 \( 0 \, bold(r) \) =
   0$ and $partial_0 Delta_0 \( 0 \, bold(r) \) = delta \( bold(r) \)$.]
] <C:homogeneous-defect>

#proof[
  Normalizing $n = \( 1 \, omega \)$ and taking $omega = plus.minus e_a$ shows that $K_y$ is compact,
    uniformly on compact spectator sets. We first remove its part outside $C_y$,
    then recover the coefficients of the remaining wave solutions with bounds that preserve the unshifted
    spectator spectra.
  We give the support argument explicitly. Choose an open spectator patch around distinct equal-time spatial
    extremal vertices, so that each $y_i$ is a strict maximum and a strict minimum for open sets of future null
    directions. If $x in K_y ∩ J^(+) \( y_i \)$, the maximizing directions give $0 lt.eq
    n dot.op \( x - y_i \) lt.eq 0$. A causal vector orthogonal to an open set of null directions is zero.
    The minimizing directions treat $J^(-) \( y_i \)$. Hence
  #[#set math.equation(numbering: n => "(5.6)")
   $ K_y ∩ C_y = { y_1 \, dots.h \, y_m } $ <C:vertex-intersection>]
  on a smaller patch. Fix a test neighborhood $U$ spacelike to all the vertices,
    and choose small vertex neighborhoods $N_i$ whose closures remain spacelike to $U$.
    There is a compactly supported smooth $chi \( x \)$ equal to one near $K_y$ whose derivatives meet $C_y$ only
    in $N = union.big_i N_i$. Positive separation margins make one such cutoff work uniformly after shrinking the
    spectator patch. A compact spectator cutoff causes no change to $square.stroked_x$.
    Thus $v = chi H$ has compact $x$-support and
  $ square.stroked_x v = \[ square.stroked_x \, chi \] H = : f \, wide "supp"_x f subset N . $
  For compactly supported distributions the exact identity $v =
    E_(upright("ret")) * square.stroked_x v$ follows by moving $square.stroked$ through convolution.
    Its right side vanishes on $U$, since $J^(+) \( N \) ∩ U = diameter$.
    Near $K_y$ one has $v = H$; elsewhere the original support statement already suffices.
    This removes $K_y \\ C_y$ from (5.4), without any decomposition of distributions on touching closed sets.
  In a common thin time slab the cone components are disjoint.
    A spatial partition separates them with derivatives off their supports.
    Each component still solves the wave equation there. In $r = x -
    y_i$ coordinates its displacement and normal-derivative data on $r^0 = 0$ are supported at $bold(r) = 0$.
    Distributional solutions of the wave equation have distributional Cauchy data on this non-characteristic
    slice. The point-support structure theorem therefore writes both data as finite sums of spatial delta
    derivatives with spectator-distribution coefficients. On a smaller relatively compact patch their orders are
    uniformly bounded. With $Delta_0 \( 0 \, bold(r) \) = 0$ and $partial_0 Delta_0 \( 0 \, bold(r) \) =
    delta \( bold(r) \)$, their evolutions are derivatives of $Delta_0$.
    Cauchy uniqueness first in the slab and then globally in $x$ gives
  #[#set math.equation(numbering: n => "(5.7)")
   $ H \( x \, y \) = sum_(i \, P) C_(i P) \( y \) P \( partial_x \) Delta_0 \( x - y_i \) .
     $ <C:vertex-wave-expansion>]
  Choose the finitely many polynomials $P$ independently modulo $k^2$.
    Enlarging the finite family if necessary, use homogeneous bases $P_(q alpha)$ of the quotient by $k^2$ in each
    degree $q = 0 \, dots.h \, N$.
  We next justify continuation of the coefficients, including its growth bound.
    This is needed to recover the unshifted spectator spectra.
    Smear the Fourier transform of $P \( partial_x \) Delta_0 \( x - y_i \)$ against compact $k$-tests.
    Its column is, up to constant factors,
  $ chevron.l P \( k \) hat(Delta)_0 \( k \) e^(i k y_i) \, phi \( k \) chevron.r . $
  All augmented minors expressing that the corresponding tests of $H$ lie in the span of these columns vanish on
    the initial patch. They are holomorphic in the ordered spectator tube;
    boundary uniqueness makes them vanish throughout that tube.
    The columns have full rank at every interior point, with a quantitative bound as follows.
    Choose finitely many fixed positive null vectors $n_r = \( 1 \, omega_r \)$ such that, for every $q lt.eq N$,
    the evaluation matrix
  $ \( E_q \)_(r alpha) = P_(q alpha) \( n_r \) $
  is injective. Such a choice exists: a homogeneous polynomial vanishing on every positive null ray is zero modulo
    $k^2$, and finite dimensionality permits a finite separating set of evaluations.
    Taking the union of these sets for $q lt.eq N$ gives one collection of rays. Fix a left inverse for each $E_q$.
  On the $r$th ray the polynomial-exponential column sum is
  $ sum_(i = 1)^m sum_(q = 0)^N a_(i q r) s^q e^(i s n_r dot.op y_i) \, wide a_(i q r) =
    sum_alpha C_(i \, q alpha) \( y \) P_(q alpha) \( n_r \) . $
  Let $d = m \( N + 1 \)$, $epsilon = c \/ \( 1 + \| y \| \)$, and use the $d$ samples $s = t epsilon$, $t = 1 \,
    dots.h \, d$. The matrix from the coefficients $a_(i q r)$ to these samples is
  $ \( V_r \)_(t \, \( i \, q \)) = \( t epsilon \)^q z_(i r)^(thin t) \, wide z_(i r) =
    e^(i epsilon n_r dot.op y_i) . $
  Its determinant is the confluent Vandermonde determinant
  #[#set math.equation(numbering: n => "(5.8)")
   $ det V_r = c_(m \, N) epsilon^(m N \( N + 1 \) \/ 2) product_i z_(i r)^(\( N + 1 \) \( N + 2 \) \/ 2)
     product_(i < j) \( z_(j r) - z_(i r) \)^(\( N + 1 \)^2) \, wide c_(m \, N) =
     #scale(x: 180%, y: 180%)[\(] product_(q = 0)^N q ! #scale(x: 180%, y: 180%)[\)]^m . $ <C:Vandermonde>]
  For example this follows by replacing powers of $t$ by falling factorials and using the derivative columns of
    the ordinary Vandermonde matrix. Thus the ray inversion distinguishes the degree $q$ and center $i$ before the
    fixed left inverses of $E_q$ recover each coefficient $C_(i \, q alpha)$.
    This describes a left inverse for the full rectangular multi-ray matrix;
    independence on each ray alone would not suffice.
  The scale of the samples is also significant. Keeping them at fixed nonzero momenta would preserve the
    exponential type of the shifted spectator cones. Taking $s =
    O \( \( 1 + \| y \| \)^(- 1) \)$ instead keeps that exponential bounded.
    The determinant estimate ensures that this shrinking choice costs only polynomial powers,
    which are compatible with tempered spectral boundary values.
  For the tube distance $delta \( y \)$ in the statement, the moduli of the $z_(i r)$ are bounded above and below,
    and for $i eq.not j$
  $ \| z_(i r) - z_(j r) \| gt.eq \| \| z_(i r) \| - \| z_(j r) \| \| gt.eq
    c' epsilon delta \( y \) quad \( i eq.not j \) \, $
  because the imaginary gaps are strictly ordered and the directions are fixed.
    The determinant formula and cofactor bounds therefore give the full left inverse polynomial norm in
    $epsilon^(- 1)$ and $1 + delta \( y \)^(- 1)$. To turn these point samples of the known columns into
    legitimate compact $k$-tests, replace each sample $t epsilon n_r$ by a smooth bump of width $w$,
    normalized to have integral one on the positive null shell.
    The centers are a distance comparable to $epsilon$ from its vertex.
    For $w lt.eq c_1 epsilon$, its shell Jacobian and the prescribed test derivatives therefore give
  $ p_N \( phi \) lt.eq C epsilon^(- a) w^(- b) $
  for fixed finite $a \, b$. Derivatives of the column functions $P \( k \)
    e^(i k dot.op y)$ cost polynomial powers of $1 + \| y \|$ and $epsilon^(- 1)$,
    while their exponential is bounded on these supports. If $A_0$ is the point-sample matrix and $L_0 A_0 = 1$, choose
  $ w = c_2 epsilon \( 1 + \| y \| + delta \( y \)^(- 1) \)^(- J) $
  with fixed $J$ sufficiently large and $c_2$ sufficiently small.
    The resulting test-column matrix $A$ then satisfies $parallel L_0 \( A - A_0 \) parallel < 1 \/ 2$.
    Its left inverse $\( L_0 A \)^(- 1) L_0$ has the same polynomial bound,
    and the displayed seminorm cost remains polynomial.
  This proves full rank using genuine test columns. On a neighborhood of any fixed interior point,
    keep a full-rank finite set of tests fixed; its inverse and the vanishing augmented minors define holomorphic
    coefficients. Uniqueness identifies them on overlaps. The parameter-dependent test choices above serve only to
    estimate these already defined holomorphic functions. Their supports satisfy $\| k \| =
    O \( epsilon \)$ and their seminorms have polynomial cost.
    Applying (5.5) with $K = O \( epsilon \)$ therefore costs only polynomial powers:
    the remaining exponential is bounded by $exp \( O \( epsilon \| "Im" y \| \) \) = O \( 1 \)$.
    The left inverse consequently gives
  #[#set math.equation(numbering: n => "(5.9)")
   $ \| C_(i P) \( y \) \| lt.eq C \( 1 + \| y \| \)^N \( 1 + delta \( y \)^(- 1) \)^N $ <C:coefficient-bound>]
  for some $C \, N$ on the tube. The coefficients have ordinary tempered ordered spectral boundaries.
    Testing all compact $k$-sets, including a neighborhood of zero, proves (5.7) globally.
    Translation covariance also shows that the coefficients are invariant under common spectator translation. ◻
]

The construction is first carried out for a fixed list of homogeneous original entries.
  We will then extend it by finite multilinearity in their scaling components.
  Descent to polynomial vectors will be checked for the whole summed bra or ket,
  so cancellations between different homogeneous terms remain allowed.

#thm([Proposition 5.3.])[
  (One-insertion forms).  #emph[There are unique tempered, Hermitian,
    Poincaré- and scale-covariant Wightman forms with exactly one insertion $L$ and arbitrarily many physical
    insertions, whose extreme vacuum values are those of $l$ and which satisfy $square.stroked L = Theta$.
    They have the ordinary ordered spectra, are local under every allowed adjacent interchange,
    and depend only on the physical polynomial vectors on the two sides of $L$.]
] <C:single-insertion>

#proof[
  #emph[Causal source solutions.] The empty physical product has only the specified zero vacuum expectation,
    since $l$ has no zero-momentum component. Suppose $m gt.eq
    1$ and fix an order of homogeneous original entries $A_i in cal(F)_(Delta_i)$, $i = 1 \, dots.h \, m$.
    Use the Fourier convention $e^(- i k x - i sum_i p_i y_i)$, and put $q_h = sum_(i lt.eq h) p_i$, with $q_0 =
    0$. For an insertion just after $A_j$, the required spectral conditions are
  #[#set math.equation(numbering: n => "(5.10)")
   $ q_h in overline(V)_(+) quad \( 1 lt.eq h lt.eq j \) \, wide k +
     q_h in overline(V)_(+) quad \( j lt.eq h lt.eq m - 1 \) \, wide k + q_m = 0 . $ <C:insertion-spectra>]
  Redundant zero partial sums at the endpoints may be included. Write $E_R \, E_L$ for the known extreme values.
    For each $i$, take the difference of the physical distributions with $Theta$ immediately before and
    immediately after $A_i$. Its support, in $r = x - y_i$, is causal.
    Split it into forward and backward parts by a finite-order Taylor subtraction in $r$ alone,
    and apply respectively the retarded and advanced wave fundamental solutions.
    This gives a tempered $B_i$ with the same causal support and the prescribed wave source.
    The convolutions are proper on the respective cones: two future causal vectors, or two past causal vectors,
    are bounded on the inverse image of a bounded set under addition.
    The same cone geometry gives the polynomial bounds needed for tempered convolution.
  This construction preserves precisely the common spectral cones
  #[#set math.equation(numbering: n => "(5.11)")
   $ q_h in overline(V)_(+) med \( h < i \) \, wide k + q_h in overline(V)_(+) med \( h gt.eq i \) .
     $ <C:merged-spectra>]
  Indeed in the coordinates $\( r \, y_1 \, dots.h \, y_m \)$ the spectator momenta are $p_j$ for $j eq.not
    i$ and $k + p_i$ for $j = i$. All the conditions in (5.11) involve only those spectator momenta.
    Multiplication, subtraction, and convolution in $r$ do not alter them.
    This is why solving the wave equation separately in the external momentum before doing causal splitting would
    be insufficient.
  #emph[Removing the homogeneous defect.] Set
  $ R_j = E_R + sum_(i > j) B_i \, wide L_j = E_L - sum_(i lt.eq j) B_i . $
  Both have the wave source appropriate to the $j$th position.
    The first has all the initial cones in (5.10); the second has all its final cones.
    Their difference $H_(*) = R_j - L_j$ is independent of $j$ and satisfies $square.stroked_x H_(*) = 0$.
    After a compact Fourier test in $k$, its spectator partial sums lie in $overline(V)_(+)$ up to bounded shifts
    of size $O \( sup \| k \| \)$. It consequently has an analytic continuation to the ordinary ordered spectator
    tube, with polynomial bounds multiplied by an exponential of type $O \( sup \| k \| \)$.
    Equation (5.3) and the causal support of the $B_i$ give the support condition $"supp"_x H_(*) subset C_y union
    K_y$ of (5.4).
  Its shifted spectator cones also give (5.5): for a transfer test supported in $\| k \| lt.eq K$,
    every partial cone is shifted by at most a fixed multiple of $K$.
    Fourier–Laplace damping contributes $exp \( C K \| "Im" y \| \)$;
    the finite-order tempered bound on the joint distribution controls the remaining terms by one fixed seminorm
    $p_N \( phi \)$ and polynomial powers of $\| y \|$ and the inverse tube distance.
    This estimate is uniform in the test, including when its support shrinks toward $k = 0$.
    Lemma 22 therefore gives the expansion (5.7) for $H_(*)$.
  Let $H_i$ denote the summand centered at $y_i$. In Fourier variables it shifts $p_i$ by $k$,
    and no other spectator momentum. Consequently it satisfies exactly the common cones (5.11).
    The required distributions are
  #[#set math.equation(numbering: n => "(5.12)")
   $ W_j = R_j - sum_(i > j) H_i = L_j + sum_(i lt.eq j) H_i . $ <C:Wj>]
  The first expression supplies the initial cones and the second the final cones; $W_m = E_R$, $W_0 = E_L$,
    and $W_j - W_(j - 1) = - B_j + H_j$ is supported in $J \( y_j \)$.
  #emph[Locality and descent to polynomial vectors.] For an adjacent interchange of physical fields in the suffix,
    smear all suffix variables with any compact test supported where that pair is spacelike. Keep this test fixed.
    The two orderings have the same partial spectral cones in the prefix and $x$:
    $q_h in overline(V)_(+)$ for $h lt.eq j$ and $q_j + k in overline(V)_(+)$.
    Smearing the suffix does not change those cones. Their difference is therefore the boundary of a holomorphic
    function in the ordered tube of the $j + 1$ variables $y_1 \, dots.h \, y_j \, x$,
    with the last imaginary difference measured from the real boundary.
    On the nonempty open set where $x$ is spacelike to every prefix point,
    the already proved adjacent $L$ interchanges move it to the extreme left.
    At that extreme, physical locality makes the fixed suffix swap zero, regardless of the prefix.
    Boundary uniqueness in this partial tube makes the difference zero for all prefix and $x$ variables.
    Since the fixed suffix test was arbitrary on the spacelike-pair patch,
    this proves the required distributional locality. For a swap in the prefix,
    hold its test fixed instead and move $L$ to the extreme right.
    The common final cones, equivalently the negative reversed partial sums by total momentum conservation,
    give the opposite ordered tube in $x$ and the suffix variables. The same argument applies.
  For a fixed homogeneous list, locality moves $L$ to an extreme position on a spacelike open set.
    Ordered tube uniqueness therefore shows that the specified extreme values determine the form uniquely.
    In particular, the result is multilinear in the homogeneous labels and is covariant,
    independently of the auxiliary causal splittings. For arbitrary original entries write
  $ A_i = sum_(Delta in S_i) A_(i \, Delta) \, wide \| S_i \| < oo \, $
  and take the finite sum of the constructed forms over $S_1 times dots.h.c times S_m$,
    using the same joint test kernel in every term. The common ordered spectral cones, locality, wave equation,
    and extreme pairings survive this finite sum. Its dilation covariance is the termwise action on the labels,
    not homogeneity of one total degree. The distribution orders and constants may depend on this fixed finite list.
  The vector-dependence assertion uses exactly the preceding choice of which variables to hold fixed,
    now for the whole finite summed form. If a fixed ket polynomial $A Omega$ is zero,
    even by cancellation between component terms or word lengths, vary only the opposite prefix and $x$.
    Once the entire ket has been smeared and held fixed, the finite sum has the same prefix-and-$x$ tube,
    regardless of the word lengths on that fixed side. On the open set where the $L$ interchanges through that
    prefix are spacelike, the extreme-left value pairs $l$ with $C^(*) A Omega = 0$.
    The partial-tube argument just given makes the insertion zero everywhere.
    It never requires a null polynomial vector to remain zero under independent translations of its individual
    factors. If the bra polynomial is zero, hold it fixed and use the extreme right and the opposite tube.
    For a permitted joint kernel, distributional continuity first supplies the summed form and its common
    partial-tube boundary for that fixed whole kernel. The zero extreme pairing is then used for the whole kernel,
    not for its approximants. Hermiticity and the stated covariance follow from uniqueness of the whole form.
    This proves a statement about forms with one $L$, without a positivity assertion for repeated insertions.
  In particular, the construction may now be differentiated in the $L$ slot and paired with arbitrary physical
    polynomial vectors. These are precisely the operations needed to form the conserved currents below;
    none requires composing two $L$ insertions. ◻
]

=== 5.2 Conserved charge forms and their vacuum flux <conserved-charge-forms-and-their-vacuum-flux>

Use Proposition 23 to define the conserved one-insertion forms

#[#set math.equation(numbering: n => "(5.13)")
 $ t_(mu nu) = T_(mu nu) + 1 / 3 \( partial_mu partial_nu - eta_(mu nu) square.stroked \) L \, wide J_mu = V_mu -
   partial_mu L . $ <C:formal-currents>]

Thus $t$ is symmetric and traceless and $partial^mu J_mu = 0$.
  For a conformal Killing vector $X$, $X^nu t_(mu nu)$ is conserved.
  Its commutator flux through a compact Cauchy slab around a compact physical polynomial $A$,
  paired with $C Omega$, defines a charge form $q_X \( C \, A \)$.
  The cutoff equals a time step on the relevant causal support.
  Locality and conservation permit compact deformations of this slab.
  To move the charge from ket to bra requires an additional statement:
  a complete vacuum flux through a physical product must vanish even when $X$ is quadratic.

The compact commutator flux and this complete vacuum flux have different roles.
  Conservation and locality make the former independent of a compact deformation.
  The latter is a limit over increasing scales and requires an infrared estimate.
  We establish that estimate uniformly in the mass band so that the bands can subsequently be removed.

#thm([Lemma 5.4.])[
  (Low-energy estimate).  #emph[Let $Z$ be an even Hermitian compact polynomial vacuum vector,
    smooth under translations. For an invariant-mass spectral band $I subset.double \( 0 \, oo \)$ and $Lambda > 0$,
#[#set math.equation(numbering: n => "(5.14)")
 $ parallel 1_(P^0 < Lambda) E_I Z parallel lt.eq C_Z Lambda thin chevron.l Z \, P^0 E_I Z chevron.r^(1 \/ 2) \,
   $ <C:low-energy-bound>]

 where the constant is independent of $I$ and $Lambda$.]
] <C:low-energy>

#proof[
  The mass projection commutes with the wedge modular data and hence preserves all wedge real spaces containing
    $Z$. Wedge separation therefore makes the self-commutator function of $E_I
    Z$ vanish at bounded times and sufficiently large spatial separation,
    with the spatial bound independent of $I$. Its time derivative at zero has compact spatial support and is
    bounded in absolute value by $2 chevron.l Z \, P^0 E_I Z chevron.r$.
    If $mu_I$ is the positive translation spectral measure of $E_I Z$,
    the spatial Fourier transform of this derivative, after division by its fixed imaginary factor,
    is the sum of the positive marginal measures of $p^0 d mu_I \( p \)$ at $bold(p)$ and $- bold(p)$.
    Fourier transformation of the compactly supported bounded function bounds each of these positive measures by
    $C_Z chevron.l Z \, P^0 E_I Z chevron.r d^3 bold(p)$. On the positive-energy cone $p^0 gt.eq \| bold(p) \|$. Hence
  $ integral_(p^0 < Lambda) d mu_I lt.eq C_Z chevron.l Z \,
    P^0 E_I Z chevron.r integral_(\| bold(p) \| < Lambda) frac(d^3 bold(p), \| bold(p) \|) lt.eq
    C'_Z Lambda^2 chevron.l Z \, P^0 E_I Z chevron.r . $
  The integrable singularity at $bold(p) = 0$ causes no problem; the positive mass band has no atom there.
    Taking square roots proves the estimate. ◻
]

A fully scaled smooth vacuum flux for a quadratic $X$ is of the form $R U_D \( log R \) F$,
  where $F$ is a fixed purely timelike, translation-smooth wave.
  For a compact mass band of $F$, the paired part of $Z$ lies in $I_R = \[ c \/ R \, C \/ R \]$.
  Equation (5.14), with $Lambda = N \/ R$, gives a bound proportional to $N chevron.l Z \,
  P^0 E_(I_R) Z chevron.r^(1 \/ 2)$, which tends to zero. To remove the compact-energy and compact-mass
  restrictions, write $F_N = 1_(N < P^0 < 2 N) F$ for dyadic $N > 0$.
  The same argument without a mass restriction bounds the pairing on this dyad by $C_Z N parallel F_N parallel
  chevron.l Z \, P^0 Z chevron.r^(1 \/ 2)$, uniformly in $R$.
  The stress-tensor vacuum amplitude is $O \( \( p^0 \)^2 \)$ and the four-momentum measure of a dyadic cone
  segment is $O \( N^4 \)$. Thus $parallel F_N parallel = O \( N^4 \)$ at zero.
  At infinity the smooth flux test gives arbitrarily rapid decrease. Hence $sum_N N parallel F_N parallel < oo$.
  On a fixed dyad, compact timelike mass approximation has arbitrarily small norm,
  and its complement is controlled by the same uniform bound.
  Dominated convergence now proves the full flux assertion. Lower-degree $X$ have a smaller scaling factor.
  Polarization into even Hermitian tests proves that every complete vacuum flux under consideration vanishes.

The left and right charge prescriptions consequently agree and $q_X$ is Hermitian.
  For an affine Killing field the improvement changes the current by the superpotential

#[#set math.equation(numbering: n => "(5.15)")
 $ 1 / 3 partial^lambda #scale(x: 120%, y: 120%)[\(] X_lambda partial_mu L -
   X_mu partial_lambda L + \( partial_lambda X_mu \) L #scale(x: 120%, y: 120%)[\)] . $ <C:affine-superpotential>]

Its compact commutator flux is zero. Thus the translation and Lorentz charge forms are the physical ones.
  Integration by parts for dilatations gives

#[#set math.equation(numbering: n => "(5.16)")
 $ D' = D + Q \, wide Q = q_J . $ <C:Dprime>]

At this point $D'$ and $Q$ are charge forms, not asserted self-adjoint operators.
  Their dependence on two separately translated polynomial tests is tempered and has each test’s ordinary vacuum
  translation spectrum. For the bra spectrum one lets the compact flux follow the ket,
  translating the polynomial vector field $X$ as well; Hermiticity supplies the ket spectrum.
  In particular strictly energy-damped collective translations are legitimate arguments of these forms.

=== 5.3 Identification of the quadratic charge and its domains <identification-of-the-quadratic-charge-and-its-domains>

The comparison with the physical current will first be made on opposite wedge polynomials,
  smoothed under translations and rotations. Compact smooth field tests have both kinds of derivatives;
  the angular derivatives will control the distant caps. We keep the large longitudinal cutoff and the growing
  transverse cutoff separate: the first is removed at fixed transverse radius,
  and only then is that radius allowed to grow.

Write

$ k_n \( x \) = 2 \( n dot.op x \) x - x^2 n = \| y \|^2 n + 2 u y + 2 u^2 macron(n) . $

We shall identify its charge with the already constructed positive self-adjoint moment $K_n =
  b \( \| Y \|^2 + kappa \)$. First take opposite compact Hermitian wedge polynomials,
  as in the bounded-profile Ward identity of Section 3. Locality identifies the commutator flux through $u <
  0$ with the extreme vacuum commutator of $\( t dot.op k_n \) Omega$ against their product.
  Translation smoothing makes these matrix elements smooth and supported in the union of the corresponding causal
  supports. Conservation gives a plane term $\| y \|^2 t_(v v)$ and the following cap terms.

On the lower cap, the nonzero part with positive step function is to the future of the right wedge polynomial.
  It has bounded $u$, $\| y \| asymp R$, and $v gt.tilde R^2$.
  Product cutoffs can therefore be chosen with $partial_u chi_R = 0$ there.
  On a dyad $v asymp S$, $S gt.tilde R^2$, the transverse cap amplitudes obey

#[#set math.equation(numbering: n => "(5.17)")
 $ C_N R S #scale(x: 120%, y: 120%)[\(] R^2 b sqrt(a b) + R a b +
   a sqrt(a b) #scale(x: 120%, y: 120%)[\)] \( 1 + b S \)^(- N) . $ <C:cap-amplitude>]

The factors follow respectively from the three terms of $k_n$, the stress-tensor component bounds,
  the transverse cutoff derivative, and the cap volume. Integration in $v$ gives the last factor.
  With sufficiently many inverse energy weights these amplitudes have uniformly bounded Hilbert norms.
  More explicitly, $p^0$ is comparable to $a + b$, and the allowed transverse momenta have area at most $C a b$.
  In the $d^4 p$ realization the squared norms of the three terms of (5.17),
  weighted by $\( 1 + p^0 \)^(- m)$ with $m > 5 \/ 2$, are bounded respectively by

#[#set math.equation(numbering: n => "(5.18)")
 $ C #scale(x: 120%, y: 120%)[\(] R^6 S^(- 3) \, med R^4 S^(- 2) \, med
   R^2 S^(- 1) #scale(x: 120%, y: 120%)[\)] . $ <C:cap-norms>]

For example the first squared integrand, after transverse integration,
  is bounded by $C R^6 S^2 a^2 b^4 \( 1 + a + b \)^(- 2 m) \( 1 + b S \)^(- 2 N)$;
  its $b$ integral is $O \( S^(- 5) \)$ and its $a$ integral is finite.
  The other two have powers $a^3 b^3$ and $a^4 b^2$. Since $S gt.tilde R^2$, all three bounds are uniform.
  There is also a positive power gain when paired with a test vector smooth under rotations.
  Fix a sufficiently small $epsilon > 0$. The region $a < S^(- epsilon)$ gains at least $S^(- 3 epsilon \/ 2)$ in
  norm by the same integral; $b > S^(- 1 + epsilon)$ is negligible by increasing $N$.
  In the remaining region $b \/ p^0 lt.eq C S^(- 1 + 2 epsilon)$,
  so the momentum direction lies in a spherical cap of power-small area.
  Rotation Sobolev estimates bound the spectral projection of the fixed test vector onto this cap by a positive
  power of its area. This follows by averaging the squared projected norms over rotations and then applying
  Sobolev evaluation on the rotation group; the same estimate holds after each of the finitely many required
  rotation derivatives and energy weights. The angular cap has area $O \( S^(- 1 + 2 epsilon) \)$,
  so its projection norm is $O \( S^(- 1 \/ 2 + epsilon) \)$.
  For example any $0 < epsilon < 1 \/ 2$ gives $gamma = min \( 3 epsilon \/ 2 \, 1 \/ 2 - epsilon \) > 0$.
  The paired dyads are bounded by $C S^(- gamma)$, and summing $S gt.tilde R^2$ gives $O \( R^(- 2 gamma) \)$.

A regulator at large $v$ can first be removed at fixed $R$.
  Its derivative has size $S^(- 1)$, its volume is $O_R \( S \)$,
  and the orbital coefficients are then bounded independently of $S$.
  The rapid $b S$ decay gives a vanishing energy-weighted norm.
  On the plane, locality restricts the $\| v \| asymp S$ tails to $\| y \| lt.tilde sqrt(S)$.
  Their amplitudes are bounded by

#[#set math.equation(numbering: n => "(5.19)")
 $ C_N S^3 b^2 \( 1 + b S \)^(- N) . $ <C:plane-amplitude>]

Here transverse integration bounds the squared weighted norm by $C S^6 integral a
  b^5 \( 1 + a + b \)^(- 2 m) \( 1 + b S \)^(- 2 N) thin upright(d) a upright(d) b$, which is uniform.
  Restriction to $a < S^(- epsilon)$ gives $O \( S^(- epsilon) \)$ in norm.
  The preceding angular argument therefore again gives summable paired tails,
  uniformly when the growing quadratic spatial profile is truncated by a bounded-factor smooth cutoff.
  The term $partial_v^2 L$ integrates to zero: the derivative of the separating step is in a spacelike gap.
  Moving both derivatives onto a distant tail cutoff gives the scalar-wave amplitude $C_N S \( 1 + b S \)^(- N)$.
  Its squared weighted norm is bounded by $C S^2 integral a b \( 1 + a + b \)^(- 2 m) \( 1 + b S \)^(- 2 N) thin
  upright(d) a upright(d) b$, and has the same low-$a$ and angular gains.
  The surviving plane integral is therefore the growing second moment of the bounded-profile Ward identity.
  It equals the form of $K_n$.

This identity must be extended on a genuine domain. We record the domain argument rather than treating an
  unbounded charge form as an operator.

Its two inputs are geometric Tomita localization and smoothness under the boost group.
  They first yield power domains for vectors with strictly one-sided supports.
  Positive-energy analyticity then transports these estimates to damped translates,
  where the charge identity can be compared on one common dense domain.

#thm([Lemma 5.5.])[
  (An affine Hardy estimate).  #emph[Let $B = - i partial_tau$ on $L^2 \( bb(R) \, upright(d) tau \; cal(K) \)$,
    where $cal(K)$ is any Hilbert space. Suppose $f in ⋂_m H^m \( bb(R) \; cal(K) \)$ and $g \( tau \) =
    e^(- i c e^tau) f \( tau \) in "Dom" e^(- pi B)$, with $c > 0$.
    For every $r > 0$ there is a finite integer $m$ such that
#[#set math.equation(numbering: n => "(5.20)")
 $ parallel e^(r tau) f parallel lt.eq C_(r \, c) #scale(x: 120%, y: 120%)[\(] parallel f parallel_(H^m) +
   parallel e^(- pi B) g parallel #scale(x: 120%, y: 120%)[\)] . $ <C:Hardy-power-bound>]

 The constants are uniform when $c$ varies in a compact subinterval of $\( 0 \, oo \)$.]
] <C:affine-Hardy>

#proof[
  Choose $chi in C_c^oo \( bb(R) \)$ equal to one on $\[ 0 \, 1 \]$, put $chi_j \( tau \) = chi \( tau - j \)$,
    and write $L = e^j$, $j gt.eq 0$. At Fourier frequencies $zeta < - delta L$,
    split the convolution $hat(chi)_j * hat(g)$ at source frequency $nu = - delta L \/ 2$.
    The Tomita-domain assumption gives
  $ parallel upright(bold(1))_(nu < - delta L \/ 2) hat(g) parallel lt.eq
    e^(- pi delta L \/ 2) parallel e^(- pi B) g parallel . $
  For the remaining source frequencies, $\| zeta - nu \| > delta L \/ 2$.
    The Schwartz $L^1$ tail of $hat(chi)_j$ is $O_N \( L^(- N) \)$, uniformly in $j$,
    since translation changes only its phase. Young’s inequality therefore gives
  $ parallel upright(bold(1))_(zeta < - delta L) accent(chi_j g, ̂) parallel lt.eq
    C_N L^(- N) #scale(x: 120%, y: 120%)[\(] parallel g parallel +
    parallel e^(- pi B) g parallel #scale(x: 120%, y: 120%)[\)] . $
  On $zeta gt.eq - delta L$, take $delta$ smaller than half the minimum of $c e^(tau - j)$ on $"supp" chi_j$.
    The phase $- c e^tau - zeta tau$ then has derivative of absolute value at least $C \( L + \| zeta \| \)$.
    Repeated integration by parts in the Hilbert-valued integral gives
  $ parallel accent(chi_j g, ̂) \( zeta \) parallel lt.eq C_N \( L + \| zeta \| \)^(- N) sum_(k lt.eq N) parallel
    f^(\( k \)) parallel_2 . $
  Its squared integral on this half-line is $O \( L^(- 2 N + 1) \)$ times the displayed Sobolev bound squared.
    Since $parallel chi_j f parallel = parallel chi_j g parallel$,
    these two estimates give arbitrary inverse powers of $e^j$ for the localized norm.
    Choose $N > r + 1$ and sum over $j$; on $tau < 0$ the weight is at most one.
    This proves (5.20) and the stated uniformity. ◻
]

#thm([Lemma 5.6.])[
  (Domains for the null moment).  #emph[A smooth compact physical polynomial vacuum vector whose supports lie
    strictly on one side of a null plane is in $"Dom" K_n^r$ for every $r > 0$,
    locally uniformly in such placements. Every strictly energy-damped translate of a compact physical polynomial
    vector also has this property. Applying $K_n^r$ to the latter vectors preserves strong tube holomorphy and the
    indicated one-sided boundary continuity.]
] <C:K-domains>

#proof[
  On the lower side choose $c > 0 \, d in bb(R)$ so that all supports lie in $W_(c p_0 + d)$.
    Tomita affiliation, after undoing $U_H \( c \) U_b \( d \)$, gives the domain condition for $e^(- pi B)$.
    For a compact joint kernel, the same condition is the closed Tomita-graph limit of factorized tests from
    Section 2. Collective boost derivatives act on the smooth joint kernel,
    so their norms are controlled by the old joint-distribution seminorms.
    No affiliated joint-smear operator is needed for this vector statement.
    Remove the fixed constant translation $U_b \( d \)$ first;
    it commutes with $H$ and preserves boost smoothness of these field vectors.
    On the positive part of the affine representation use $H = e^tau$, $B = - i partial_tau$.
    The resulting vector $f$ satisfies
  $ e^(- i c e^tau) f in "Dom" e^(- pi B) \, $
  where the original vector $f$ has Sobolev derivatives of every order in $tau$.
    Lemma 25 gives $e^(r tau) f in L^2$ for every $r > 0$. The $H = 0$ part is harmless.
    Since $K_n lt.eq H$ strongly and the two commute, this proves the assertion for the lower placement.
    Reflection and equality of the reflected moments prove the upper placement.
    The choices have positive geometric margins, giving locally uniform bounds.
  For $U \( x + i eta \) A Omega$, $eta in V_(+)$, consider the bounded Hilbert-valued holomorphic function
  $ 1_(\( L \, oo \)) \( K_n \) U \( x + s eta \) A Omega \, wide "Im" s > 0 . $
  A real interval of $s$ places the entire translated support on one side of the plane.
    On that interval its norm is $O \( L^(- N) \)$ for every $N$, locally uniformly;
    elsewhere it is bounded by the original vector norm. The subharmonic logarithmic norm estimate with harmonic
    measure of that interval yields any prescribed inverse power at every fixed interior point,
    by starting with a sufficiently large $N$. Spectral-tail integration gives all the power domains,
    locally uniformly. Closedness of $K_n^r$ and uniform convergence of spectral truncations give strong
    holomorphy and the stated boundaries. ◻
]

Let $cal(D)$ be the linear span of all vectors obtained from these strictly energy-damped compact polynomial
  translates by finitely many real translations, dilatations, and compact smooth dilation convolutions

$ integral rho \( s \) U_D \( s \) xi thin upright(d) s \, wide rho in C_c^oo \( bb(R) \) . $

The locally uniform bounds of Lemma 26 and closedness allow each such integral in the graph of every required
  $K_n^r$, also after translating the origin; iteration gives the same conclusion for every finite sequence of
  these operations. The space is dense and invariant under real translations and dilatations by construction.
  Its defining smooth kernels also place it in $"Dom" D$; the compact dilation convolutions form a graph core for
  $D$, so $cal(D)$ is such a core. The preceding charge identity extends to $cal(D)$ by tube uniqueness. Thus

#[#set math.equation(numbering: n => "(5.21)")
 $ q_(k_n) \( C \, A \) = chevron.l C Omega \, K_n A Omega chevron.r $ <C:charge-identity>]

on this common domain, for every origin and future null normal.
  The linear relations among conformal vector fields give vector relations among the $K_n$ there:
  test them against the dense domain and use (5.21). In particular

#[#set math.equation(numbering: n => "(5.22)")
 $ K_n \( s \) := U_a \( s \) K_n U_a \( - s \) = K_n - 2 s \( D' - B \) + 2 s^2 a quad
   upright("on ") cal(D) . $ <C:quadratic-charge-translation>]

This equation realizes $D'$ and $Q = D' - D$ as symmetric vector operators on $cal(D)$,
  by a difference of the indicated operators. Only each $K_n \( s \)$ is being used as self-adjoint;
  no essential self-adjointness of $Q$ is required.

=== 5.4 The canonical action on the one-field space <the-canonical-action-on-the-one-field-space>

The charge identity supplies more information than the spectral comparison alone.
  Its translated quadratic dependence first kills the nonnegative comparison defect in the scalar channels.
  The spectral support statement then upgrades equality of compression forms to a reducing-subspace identity.
  Only after that step do we treat the remaining helicities.

#thm([Theorem 5.7.])[
  #emph[The one-field space $Pi$ reduces each $K_n$. On $Pi$,
    $K_n$ equals the null special-conformal generator of the auxiliary positive conformal representation carried
    by $l \, J \, t$. Moreover $chevron.l Q phi.alt \, psi chevron.r = 0$ for $phi.alt in cal(D)$, $psi in Pi$.]
] <C:canonical-Pi>

#proof[
  We first treat the scalar labels $l \, j_z \, s_z$. The comparison (4.24), together with $c_V = l +
    j_z$ and $c_T = l \/ 3 + s_z$, gives order-zero comparison on each of them.
    For smooth compact waves with $b \, M > 0$ compare the compression of $K_n$ with $K_(0 \, n) =
    b \( \| Y \|^2 + h_0 \)$. Their nonnegative expectation difference, evaluated on $U_a \( - s \) psi$,
    has zero second derivative in $s$. Indeed the second-difference identity from (5.22) transfers to these waves
    by symmetry against $cal(D)$; the domains follow from the spectral comparison.
    Direct differentiation gives the same second difference for $K_(0 \, n)$.
    A nonnegative affine function on the whole real line is constant.
  Testing with separated compact multipliers in $b \, k$ now shows that the positive radial form $h_0 -
    kappa_(upright("compr"))$ is invariant under multiplication by $e^(i t M^2)$.
    Its distribution kernel is annihilated by $M^2 - M' ""^2$.
    On $M \, M' > 0$ this forces a diagonal kernel; positivity makes it a positive measure $nu \( d M \)$.
    It is bounded by the $h_0$ form. For any compact interval $I subset.double \( 0 \, oo \)$,
    choose logarithmic cutoffs $f_L = 1$ on $I$, vanishing outside successively larger compact intervals, with
  $ integral_0^oo M \| f'_L \( M \) \|^2 thin d M arrow.r 0 . $
  For example piecewise linear ramps in $log M$ have energy $O \( L^(- 1) \)$, and smoothing preserves that bound.
    Consequently $nu \( I \) lt.eq integral \| f_L \|^2 d nu arrow.r 0$. The compression forms agree.
  This is also equality of operators on a reducing copy. The spectral comparison gives
  $ parallel 1_(\( s \, oo \)) \( kappa \) psi parallel lt.eq parallel 1_(\( s \, oo \)) \( h_0 \) psi parallel . $
  Equality of the first moments makes the squared tail norms equal almost everywhere.
    The support inclusion underlying this inequality and equality in the projection norm inequality give equality
    of the projected vectors. Spectral continuity gives it at all continuity points,
    hence equality of all spectral measures and reduction. Comparing the odd translation differences with the
    canonical scalar formula shows that $Q cal(D)$ is orthogonal to these labels.
    Varying the null direction spans all polarizations of $Pi$, proving the last assertion of the Theorem.
  For clarity, the projection argument above does not require the two spectral measures to commute.
    Write $iota$ for the scalar-copy embedding, $E_s = upright(bold(1))_(\( s \, oo \)) \( kappa \)$ and $P_s =
    upright(bold(1))_(\( s \, oo \)) \( h_0 \)$. Spectral comparison gives $E_s iota = E_s iota P_s$.
    Equality of the first moments is equality of the integrals of $parallel E_s iota psi parallel^2$ and $parallel
    P_s psi parallel^2$; their pointwise difference is nonnegative, so it vanishes almost everywhere.
    Equality in the contraction estimate for the orthogonal projection $E_s$ therefore gives $E_s iota psi =
    iota P_s psi$. One first uses a countable dense form core and then spectral continuity to obtain the operator
    identity for every threshold. This proves reduction rather than merely equality of expectations.
  We recall explicitly the reference generator on the remaining polarizations.
    On transverse helicity of absolute weight $d$ it is
  #[#set math.equation(numbering: n => "(5.23)")
   $ K_(c \, n) = b \( \| Y \|^2 + h_d \) . $ <C:canonical-hankel>]
  For a rank-$r$ primary of dimension $r + 2$, $r = 1 \, 2$, contract $r -
    d$ slots with $n$ and use $partial_v O_i - partial_i O_v$ in each of the other slots,
    discarding joint transverse traces. The wave is a constant multiple of $b^r M^d$ times its helicity label.
    Under the null conformal map of Section 2, the transverse Jacobian is $gamma \( e_i + 2 c y_i n \)$.
    The curl cancels the $y_i n$ terms; derivatives of those terms contribute only the discarded traces.
    The transformed wave thus has the effective scalar weight $2 + d$, giving (5.23) by the scalar computation.
    This uses only the positive primary two-point kernels and also acts on their descendant combinations $V \, T$.
    Its origin translation formula contains $D$, without $Q$.
  On smooth compact timelike $Pi$ waves the actual domains follow from (2.26). Put $X_n = K_n - K_(c \, n)$ there.
    Symmetry-testing (5.22) on $cal(D)$, using the orthogonality just proved,
    shows that $X_n$ intertwines translations and is linear in $n$.
    The same is true on the energy-damped compact $V \, T$ waves in $cal(D)$:
    symmetry now gives $Q = 0$ as a vector on these waves, and their reference domains follow from the primary and
    descendant tube action. The translation formula gives polynomial graph bounds.
    Integrating translates against Schwartz functions therefore commutes $X_n$ through compact timelike momentum
    multipliers. Such multiples of the damped $V \, T$ waves span the smooth compact timelike tests of $Pi$.
  It follows that $X_n$ is a measurable fiber coefficient map.
    Linearity in $n$ supplies a covector index $lambda$. The coefficient tensors
  $ X_lambda V_mu \( p \) = X_lambda J_mu \( p \) \, wide X_lambda T_(mu nu) \( p \) = X_lambda t_(mu nu) \( p \) $
  are locally square integrable up to the nonzero light cone from inside:
    this follows first with the damping and smooth test multipliers,
    and then locally without them by choosing those multipliers nonvanishing.
    Their dimensions are respectively $d' = 2 \, 3$, and they are covariant tensors.
    A rest-frame boost component of weight $omega$ has norm proportional to $M^(d' - 2 - omega)$ when boosted to a
    fixed nonzero energy and $M arrow.b 0$. The transverse mass measure is proportional to $M thin d M$.
    Local integrability therefore excludes every weight $omega gt.eq d' - 1$.
  For the first tensor, contracting the $mu$ slot with a null vector leaves the $lambda$ covector parallel to its
    lowered null vector: its transverse and same-null contractions have the forbidden weights.
    At rest conservation makes the $mu$ slot purely spatial. Reversing its spatial direction changes the
    contracted tensor by a sign, but would require it to be parallel to a different null covector. It is zero.
    For the second tensor, contract both $mu \, nu$ slots with the same null vector.
    The forbidden weights again leave only that parallel covector.
    Both slots are spatial at rest, so reversing direction leaves the contraction unchanged and again forces it to
    be zero. Varying the direction and using symmetry recovers every spatial tensor coefficient.
    Hence both tensors vanish and $K_n = K_(c \, n)$ on compact timelike tests.
  For $d gt.eq 1$, conjugation by $M^(1 \/ 2)$ turns the radial operator into $-
    partial_M^2 + \( d^2 - 1 \/ 4 \) M^(- 2)$, which is limit-point at both endpoints.
    Compact smooth radial tests, combined with smooth transverse cores and compact $b$ cutoffs,
    are thus graph cores for (5.23). The $d = 0$ part was already reducing with its specified Hankel extension.
    The closed graph of the actual self-adjoint $K_n$ contains the graph of the reference self-adjoint operator on
    each copy. Resolvent uniqueness gives reduction of their sum $Pi$ and equality there, as claimed. ◻
]

=== 5.5 The residual dilation charge vanishes <the-residual-dilation-charge-vanishes>

The remaining charge $Q$ is not assigned an independent self-adjoint realization.
  Instead, future and past cone comparisons provide two families of genuine self-adjoint generators whose first
  moments contain the same $Q$. Opposite exponential bounds on their limiting measures will force both families to
  concentrate on the physical dilation spectrum.

Fix $n \, macron(n)$ and write $K = K_n$. Truncate the future time cone by $u < R$ and the past cone by $u > - R$.
  Their actual real spaces are contained in comparison real spaces constructed with $K$ in place of the full
  parabolic generator. This is (5.2) for the translated parabolic cut; reflection treats the past cone.
  Let $T_R^(+)$ be the comparison future modular generator and let $-
  T_R^(-)$ be the comparison past modular generator. The affine product formulas and (5.22) give self-adjoint
  operators satisfying

#[#set math.equation(numbering: n => "(5.24)")
 $ T_R^plus.minus = D + Q minus.plus frac(K, 2 R) quad upright("on ") cal(D) . $ <C:cone-comparison-generators>]

For example the future expression is $B \( R \) - K \( R \) \/ \( 2 R \)$; the past modular expression is $-
  B \( - R \) - K \( - R \) \/ \( 2 R \)$. Their spectral measures have uniformly bounded second moments on
  $cal(D)$ as $R arrow.r oo$. The same is true on a smooth single-field vector supported compactly in either time
  cone: the relevant planes avoid its support, so Lemma 26 and the affine product domains apply.
  Testing against $cal(D)$ shows that

$ T_R^plus.minus xi plus.minus K xi \/ \( 2 R \) $

is a Hilbert vector independent of $R$ and of the sign.

#thm([Proposition 5.8.])[
  #emph[The charge form $Q$ vanishes on all physical polynomial vectors. In particular $Q = 0$ on $cal(D)$.]
] <C:Q-zero>

#proof[
  Average the spectral measures of $T_R^plus.minus$ over $S < log R < 2 S$, with normalized Lebesgue measure,
    and take common weak limit points as $S arrow.r oo$. One may first test continuous functions on the
    compactified real line. The uniform second moments on dense vectors remove mass at infinity.
    The limits are normalized positive operator-valued measures, not assumed projection-valued.
    Dilatations shift $log R$ by a fixed amount, whose boundary contribution in the averages is $O \( S^(- 1) \)$.
    Thus the limits commute with $D$. They have joint positive measures $E^plus.minus \( d d \, d s \)$ with the
    spectral measure of $D$. Uniform second moments also give uniform integrability of first moments,
    including polarized cross moments on the vectors just described.
  Only these first moments will be compared with $D + Q$. The logarithmic averaging is used to obtain commutation
    with the known self-adjoint operator $D$, while the uniform second moments prevent loss of first moments in
    the weak limit. Neither operation turns the limiting positive operator-valued measures into spectral measures.
  Let $O$ be a Hermitian scaling component of real dimension $alpha$ and $xi = O \( f \) Omega$, with $f$ real,
    smooth and compact in the future cone. The scaling orbit continues for $0 < "Im" z < pi$ because $e^z
    x$ has forward timelike imaginary part there. Compact interior-cone support and integration by parts give
    Hilbert boundary values at both ends; real scale covariance gives uniform norm bounds along the strip. Consequently
  #[#set math.equation(numbering: n => "(5.25)")
   $ e^(- pi D) xi = e^(i pi alpha) O \( f^(-) \) Omega \, wide f^(-) \( x \) = f \( - x \) . $ <C:single-scale-strip>]
  We need this strip identity also for complex linear combinations of real dilation translates.
    Write $xi_s = U_D \( s \) xi$ and let $xi_s^(-)$ be its reflected-test wave.
    Hermitian conjugation of the two-point function, with both test coordinates reflected, gives
  $ chevron.l xi_s^(-) \, xi_t^(-) chevron.r = chevron.l xi_t \, xi_s chevron.r . $
  For $p \( D \) = sum_j c_j U_D \( s_j \)$ put $p^(\#) \( D \) = sum_j overline(c_j) U_D \( s_j \)$;
    the real parameters $s_j$ are unchanged. With $omega_alpha = e^(i pi alpha)$ and $eta = e^(- pi D) xi =
    omega_alpha xi^(-)$, the reflected Gram identity yields
  #[#set math.equation(numbering: n => "(5.26)")
   $ parallel p \( D \) e^(- pi D) xi parallel = parallel p^(\#) \( D \) xi parallel \, wide
     parallel p^(\#) \( D \) eta parallel = parallel p \( D \) xi parallel . $ <C:filtered-adjoint-norms>]
  For all sufficiently large truncations, the comparison Tomita partner of $p \( D \) xi$ is $p^(\#) \( D \) xi$,
    and that of $p \( D \) eta$ on the past side is $omega_alpha^(- 2) p^(\#) \( D \) eta$.
    Their norms are therefore exactly the two norms in (5.26).
    The finite set of dilated supports remains compactly in the respective cone.
    In particular, we do not require a complex filter to preserve its real space.
  Real-space containment and these Tomita norm bounds, followed by the spectral-measure limits in the future and
    past cones, give
  #[#set math.equation(numbering: n => "(5.27)")
   $ integral \| p \( d \) \|^2 e^(- 2 pi s) thin upright(d) chevron.l E^(+) chevron.r_xi & lt.eq
     parallel p \( D \) e^(- pi D) xi parallel^2 \,\
integral \| p \( d \) \|^2 e^(- 2 pi d) e^(2 pi s) thin upright(d) chevron.l E^(-) chevron.r_xi & lt.eq
  parallel p \( D \) xi parallel^2 . $ <C:Jensen-plus>]
  Truncation followed by monotone convergence justifies the unbounded exponential tests in the limiting measures.
    The first moments in $s$, with every such filter, agree for the two signs by (5.24) and the uniform moment
    bounds. Exponential polynomials determine finite measures:
    polarization recovers every exponential $e^(i t d)$, and Fourier uniqueness then recovers the measure.
    Thus these equalities and inequalities hold conditionally on the common $d$ marginal $mu_xi$.
  To spell out the first-moment assertion, the finite filters $p \( D \)$ preserve the class of smooth
    cone-supported single-field vectors; they also commute with $e^(- pi D)$.
    Thus both signs admit every same filter. Their limiting first-moment measures in $d$ are finite by the uniform
    second-moment bounds. Taking $p \( d \) = 1 + z e^(i t d)$ and polarizing in $z in
    bb(C)$ shows that these two measures have identical Fourier transforms, hence agree.
    This is equality of conditional means, rather than just equality of their integrals over $d$.
  Disintegrate the two scalar joint measures as $mu_xi \( d d \) nu_d^plus.minus \( d s \)$.
    Their conditional first moments $m_plus.minus \( d \)$ agree almost everywhere, while (5.27)–(5.27) say
  $ integral e^(- 2 pi s) nu_d^(+) \( d s \) lt.eq e^(- 2 pi d) \, wide
    integral e^(2 pi s) nu_d^(-) \( d s \) lt.eq e^(2 pi d) . $
  Jensen gives $m_(+) \( d \) gt.eq d gt.eq m_(-) \( d \)$.
    Equality of the means forces both to equal $d$; strict convexity then forces both conditional laws to be
    $delta_d$. This argument requires only positivity and normalization of the measures,
    not multiplicativity of the operator-valued limits. Positivity also gives Cauchy–Schwarz for each measurable
    set, so cross measures against $xi$ are supported on $s = d$.
    Their first moments, paired with $phi.alt in cal(D)$, now give the following identity.
    Indeed, if a measurable set is disjoint from $s = d$, its positive operator has zero quadratic value on $xi$,
    and Cauchy–Schwarz makes every mixed value against $xi$ zero as well.
    The mixed measure is therefore concentrated on the diagonal;
    its $d$ marginal is the mixed spectral measure of $D$. Its first moment is consequently that of $D$,
    while the uniformly integrable first-moment limits from (5.24) give the form of $D + Q$. Subtracting the two gives
  #[#set math.equation(numbering: n => "(5.28)")
   $ chevron.l Q phi.alt \, xi chevron.r = 0 . $ <C:Q-single-orthogonality>]
  The strip and Jensen argument just completed used a Hermitian homogeneous field of dimension $alpha$ with a real
    test. Splitting a complex test into its real and imaginary parts extends (5.28) to all tests.
    A complex homogeneous field is the sum of its Hermitian real and imaginary parts,
  $ O_Delta = frac(O_Delta + O_Delta^dagger, 2) + i thin frac(O_Delta - O_Delta^dagger, 2 i) \, $
  which have the same grade because adjunction preserves real scaling dimensions.
    Linearity therefore extends (5.28) to every homogeneous original field.
    For $O = sum_(Delta in S_O) O_Delta$, its finite scaling support then extends the conclusion to $O$ with the
    same smearing test. This step sums conclusions; it does not assign the nonhomogeneous field one strip phase or
    apply Jensen’s inequality to cross-grade terms.
  It remains to pass from single fields to products. Define the insertion $delta_Q
    O \( y \)$ by the commutator with $J \( y + r \)$ integrated against a compact flux cutoff in $r$.
    Conservation and locality shrink the flux as needed. This insertion is relatively local to physical fields and
    is tempered with the ordered spectra: in this cutoff operation the adjacent momenta are first combined,
    so the spectator spectral cones are unchanged. Its extreme vacuum values against every physical polynomial
    vanish by (5.28) and the charge identity. To justify that passage, damp both collective translations first,
    remove the ket damping on the smooth future-cone single-field test,
    and remove the bra damping distributionally. Translation covariance removes the future-cone support
    restriction. Move the insertion to the extreme on a spacelike open set;
    ordered tube uniqueness makes the zero equality global. Finally the commutator flux obeys the derivation rule
    over every finite list of product slots. This rule is the telescoping of the adjacent single-insertion
    commutators just constructed, not a new operator axiom for $J$ or $L$.
    For a joint test kernel the telescoping identity is first an identity of joint distributions and is then
    tested with that same kernel. Each summand is zero, proving the Proposition. ◻
]

=== 5.6 Modularity of time cones and the actual time action <modularity-of-time-cones-and-the-actual-time-action>

We now return from comparison real spaces to algebras of actual bounded operations.
  The equality $Q = 0$ determines the limiting comparison generator,
  but identifying the physical cone modular group also requires a KMS identity and separation of the vacuum.
  Both will be obtained for the original cone algebra before using half-sided modular inclusion for line diamonds.

#thm([Theorem 5.9.])[
  #emph[The vacuum is cyclic and separating for the actual future and past cone algebras.
    Their modular generators, with the normalization of Section 2, are respectively $D$ and $- D$.]
] <C:cone-modularity>

#proof[
  By Proposition 28, $T_R^plus.minus psi arrow.r D psi$ on $cal(D)$. This is a core for $D$:
    it is dense and invariant under its unitary group, and smoothing by compactly supported smooth functions of
    the group parameter supplies a graph core. The self-adjoint core convergence criterion therefore gives
    $T_R^plus.minus arrow.r D$ in strong resolvent sense, and their real unitary groups converge strongly.
  Take two bounded operations in a fixed compact subregion of the future cone.
    For all sufficiently large $R$, their vacuum and adjoint-vacuum vectors belong to the comparison standard
    space and its complexification with the required Tomita domains.
    Writing the two operations as $A \, B$, the standard-space two-vector identity gives the scalar holomorphic
    continuation of $chevron.l B^(*) Omega \, e^(i t T_R^(+)) A Omega chevron.r$ to $0 lt.eq "Im" z lt.eq 2 pi$.
    Its values are defined by
  $ F_R \( t + i y \) = chevron.l e^(- y T_R^(+) \/ 2) B^(*) Omega \,
    e^(i t T_R^(+)) e^(- y T_R^(+) \/ 2) A Omega chevron.r \, wide 0 lt.eq y lt.eq 2 pi \, $
  with the opposite boundary
  $ F_R \( t + 2 pi i \) = chevron.l e^(i t T_R^(+)) A^(*) Omega \, B Omega chevron.r . $
  One obtains the width $2 pi$ by assigning up to $pi$ of imaginary evolution to each vector and using
    $e^(- pi T_R^(+)) = J_R S_R$; the comparison conjugation disappears from the displayed boundary formula.
    The split-vector pairing uses only $"Dom" e^(- pi T_R^(+))$;
    no vector $e^(- 2 pi T_R^(+)) A Omega$ is required. The bounds depend only on the four vector norms.
    Normal-family convergence on the strip, together with the strong convergence on the real edge,
    gives the vacuum KMS identity for $D$ on these actual operations.
    The identical argument in the past gives the identity for $- D$.
    Bounded strong-star approximation extends the identity from compactly localized operations to the cone algebras.
  Scaling already acts as an automorphism of each actual cone algebra. The vacuum is cyclic by Reeh–Schlieder.
    For clarity, faithfulness is part of the conclusion: the KMS identity implies that a bounded operation
    annihilating the vacuum has adjoint annihilating it. Apply this to $B A$ for arbitrary $B$ if $A Omega = 0$.
    Then $A^(*) B^(*) Omega = 0$; cyclicity gives $A^(*) = 0$. Thus the vacuum is separating.
    Uniqueness of the modular automorphism group of this faithful vector state identifies the generators as claimed. ◻
]

#thm([Theorem 5.10.])[
  (Actual time-Möbius action).  #emph[For every future unit timelike vector $e$,
    the actual Hilbert space carries a positive-energy representation of the universal covering group of the
    time-Möbius group. Locally it maps physical diamond algebras with tips on the line $bb(R)
    e$ to the corresponding diamond algebras. Its affine subgroup is the physical time translation and dilation
    subgroup. The canonical lift of the connected stabilizer of each finite interval is its actual diamond modular
    group.]
] <C:time-mobius>

#proof[
  Choose two line parameters $a < b$. Let $A \, B_t$ be the dilation generators centered at $a e \, b e$,
    and let $C$ be the modular generator of the physical diamond with those tips.
    Inclusion of the diamond into the future cone at $a e$ and the past cone at $b
    e$ is half-sided modular by Theorem 29 and isotony. The common vacuum is cyclic and separating for both
    inclusions; no cyclicity of a relative commutant is needed.
    The half-sided inclusion theorem gives the affine relations corresponding to
  #[#set math.equation(numbering: n => "(5.29)")
   $ A = \( z - a \) partial_z \, wide B_t = \( z - b \) partial_z \, wide C =
     frac(\( z - a \) \( b - z \), b - a) partial_z . $ <C:three-mobius-fields>]
  More specifically, $A - C gt.eq 0$ scales with weight $- 1$ under $A$,
    with the negative inward inclusion convention $N = U_(A - C) \( - 1 \) M U_(A - C) \( 1 \)$; and $- B_t -
    C gt.eq 0$ scales with weight $+ 1$ under $- B_t$. The pair $A \,
    B_t$ already has the physical affine relation with $P_e gt.eq 0$.
  These are relations of unitary groups, not just commutators on a tentative common domain.
    Ordered products of the three classical one-parameter groups are coordinates near the identity.
    The three affine relations give exact pair-switching identities,
    so reordering products proves a local unitary homomorphism.
    It integrates uniquely to the simply connected cover. This is the three-subgroup integration criterion of
    #cite(label("GuidoLongoWiesbrock1998")) Lemma 1.1; see also #cite(label("MorinelliTanimoto2019"))
    Lemmas 2.3–2.4. In its circle formulation the intervals are $\( a \, b \)$, $\( b \, oo \)$,
    and $\( oo \, a \)$, with stabilizer fields $C \, B_t \, - A$.
    Their three pair relations are precisely the two cone–diamond relations above and the physical affine relation
    between the two cone groups. Its translation subgroup is the physical one,
    so the representation has positive energy.
  Affine covariance transports $C$ to the modular generator of every line diamond.
    A sufficiently small Möbius transformation relative to a fixed finite interval factors into an affine map of
    its tips and an element of its connected stabilizer, with the lift near the identity.
    Both factors have the asserted action on its actual algebra.
    This proves the local geometric action, without replacing the physical net by a larger net.
  The construction is made for each chosen time direction using its actual cone and diamond algebras.
    Its local geometric statement is the one needed below: the connected interval stabilizer acts by that
    diamond’s modular group. Compatibility sufficient to integrate all spacetime conformal transformations on the
    full net has not been used in this argument. ◻
]

We finish by recording the representation data needed for extraction. Separate the trivial representation.
  The nontrivial irreducible positive-energy representations of the simply connected cover are the lowest-weight
  modules with $h > 0$ #cite(label("LongoLectures2008")) Theorem 1.5.3 and the following direct-integral
  discussion. The general representation may contain a direct integral of these modules,
  rather than a discrete sum. To obtain the decomposition, disintegrate the central unitary of a full rotation.
  Within each central character, compact energy lies in one integer translate;
  positivity and the raising and lowering norm relations decompose it into orthogonal lowest-weight ladders.
  The real ladder coefficients give measurable multiplicity spaces $cal(K)_h$.

Each nontrivial irreducible module restricts to the unique strictly positive irreducible affine representation
  #cite(label("NeebOlafsson2017")) Corollary 2.33 and equation (6).
  Multiplication by $E^(1 \/ 2)$ converts its $L^2 \( upright(d) E \)$ realization to the common affine realization

#[#set math.equation(numbering: n => "(5.30)")
 $ cal(H)_h = L^2 \( bb(R)_(+) \, upright(d) E \/ E \) \, wide E = P_e \, wide \( U_D \( s \) psi \) \( E \) =
   psi \( e^s E \) \, wide psi_(h \, z) \( E \) = E^h e^(i z E) . $ <C:time-primary-waves>]

The last wave, for $"Im" z > 0$, transforms as a primary of weight $h$: its inner product kernel is

$ integral_0^oo E^(2 h - 1) e^(i E \( z - macron(w) \)) upright(d) E =
  frac(Gamma \( 2 h \), \[ - i \( z - macron(w) \) \]^(2 h)) \, $

with the branch fixed in the upper half-plane. Kernel covariance on the dense span of these waves fixes the
  primary realization and its lift to the cover. Here $h$ denotes a lowest-weight parameter,
  distinct from the internal parabolic operator used in the null-cut comparison. On the nontrivial summand, put

$ cal(K) = integral_(h > 0)^xor cal(K)_h thin upright(d) nu \( h \) \, wide cal(H)_(upright("nontriv")) =
  L^2 \( bb(R)_(+) \, upright(d) E \/ E \) ⊗ cal(K) \, wide sans(h) v_h = h v_h . $

Thus a measurable weight-band projection is $upright(bold(1)) ⊗ upright(bold(1))_I \( sans(h) \)$.
  No discreteness of this weight operator follows from, or is required by, the field-label spectrum.

#thm([Lemma 5.11.])[
  #emph[On any bounded weight band contained in $h > 0$, the real standard space of a line diamond is generated by
    the primary waves (5.30) smeared with real smooth compact interval tests and multiplicity vectors real for the
    appropriate phased conjugation. Weight-band projections commute with the diamond Tomita operator.]
] <C:mobius-real-spaces>

#proof[
  Let $J$ be the actual future-cone modular conjugation. The positive-translation relation gives $J P_e J = P_e$.
    The half-sided cone–diamond relation gives the same formula for its positive special-conformal partner,
    while $J D J = - D$. These three generating groups show that $J$ implements time reflection on the integrated
    Möbius representation.
  In each lowest-weight ladder choose the canonical reflection conjugation, measurably in $h$;
    its existence and multiplicity form are given in #cite(label("LongoLectures2008")) Theorem 1.6.3 and its
    universal-cover extension. The product of this conjugation with $J$ commutes with the full representation.
    Inequivalent lowest weights cannot be mixed by that commutant, so $J$ preserves every measurable weight band.
    In the common affine realization it is pointwise energy conjugation together with an energy-independent
    multiplicity conjugation $j$, preserving the spectral projections of $sans(h)$.
    This argument distinguishes weights $h$ and $1 - h$ even when their Casimir values coincide.
  For a real compact half-line test $f$, the strip continuation gives
  $ e^(- pi D) #scale(x: 120%, y: 120%)[\(] E^h hat(f) \( E \) v #scale(x: 120%, y: 120%)[\)] =
    e^(i pi h) E^h hat(f) \( - E \) v . $
  Hence its Tomita fixed-point condition is $v = e^(- i pi h) j v$, the phased real structure in the statement.
    These tests are complex cyclic by Fourier uniqueness. Their real closure is invariant under dilatations and
    contained in the half-line real space. Gaussian smoothing in $D$ gives graph density for Tomita,
    hence equality of the two real spaces. On compact positive weight bands these operations have uniform bounds,
    and exhaustion treats a bounded band approaching zero. The half-sided unitary sends the half-line space onto
    the finite-interval space and transports the tests by primary covariance.
    All these operations commute with the weight-band projections.
    Each such projection therefore commutes with the diamond conjugation,
    strongly commutes with its modular operator, and preserves the domain and action of its Tomita operator. ◻
]

== 6 Extraction of a localizable scalar wave and accessible products <sec:extraction>

Throughout this Section, $l$ remains the scalar #emph[vacuum wave] constructed from the trace.
  In particular, division by $M^2$ on that vacuum wave has not defined an operator on other vectors.
  We first extract from the physical virial field a scalar wave $S$ with actual local approximants.
  Only subsequently do we construct products of such accessible waves.
  The notation $L$ in a formal insertion still refers to the single-insertion forms of Proposition 23;
  a physical field $L$ will be reconstructed in Section 8.

The construction has two distinct localization steps. We first use the canonical two-point spaces to select the
  part of the virial vacuum wave with actual time weight two.
  The actual time-Möbius unitaries then express that part through operations in physical diamonds.
  After proving independence of the chosen time direction, we quantify these operations by bounded approximants
  and construct their analytic products. These products have real boundaries on spacelike patches;
  the remaining real-axis reconstruction is a separate task.

=== 6.1 Projection into canonical diamond localization <projection-into-canonical-diamond-localization>

Write $X_(upright("phys")) \( O \)$ for the closed real vacuum space of the physical algebra in $O$,
  and $X_c \( O \)$ for the additive canonical real space on the one-field representation $Pi$.
  The latter is determined by the positive scalar, conserved-vector and traceless-tensor two-point kernels of Section 2.

#thm([Lemma 6.1.])[
  #emph[For every bounded diamond $O$,
#[#set math.equation(numbering: n => "(6.1)")
 $ P_Pi X_(upright("phys")) \( O \) subset X_c \( O \) . $ <E:diamond-projection>]

 This assertion uses conformal covariance only of the auxiliary two-point representations.]
] <E:projection-localization>

#proof[
  The actual parabolic containment (5.2) of Lemma 21, followed by the reduction in Theorem 27,
    gives the desired projected membership for every parabolic diamond $N$ containing $overline(O)$:
    actual localization is contained in the comparison localization,
    and the comparison generator acts canonically on $Pi$. The conjugation on $Pi$ is the primary reality
    operation by wedge Bisognano–Wichmann; the same statement holds in the reverse orientation.
    We explain why these containments determine the bounded diamond.
  The point of the geometry is to recover a bounded diamond from the larger parabolic regions already controlled
    by the null-charge comparison. We carry out this recovery in the canonical real spaces,
    where the complementary diamond can be described explicitly.
  Use the Einstein cylinder, with coordinates $\( tau \, x \) in bb(R) times S^3$ and round distance $d$.
    By a Poincaré transformation and a dilation, the physical patch and the chosen diamond can be written
  $ \| tau \| + d \( x \, N_0 \) < pi \, wide O = { thin \| tau \| + d \( x \, N_0 \) < alpha thin } \, quad
    0 < alpha < pi . $
  On the canonical representations,
  #[#set math.equation(numbering: n => "(6.2)")
   $ X_c \( O \)' = X_c \( O^perp \) \, wide O^perp = { d \( x \, N_0 \) > alpha + \| tau \| } \,
     $ <E:canonical-complement>]
  where prime denotes symplectic complement. Indeed, a connected conformal transformation carries the wedge and
    its opposite to this diamond pair. Transporting wedge modular data proves the equality.
    There is no assumption here about a physical algebra’s duality.
  For completeness, these transports are well-defined across the required charts.
    The two-point kernels are rational functions with the finite Jacobian and weight factors of their integral
    bosonic primaries. On strict complex point waves in sufficiently small boxes the rational covariance identity
    preserves every inner product. Their span is dense, so it defines local unitaries;
    the same identity gives local composition and hence integration to the connected cover.
    On nonsingular real patches, the differentials preserve the future cone,
    so smaller strict imaginary approach cones have distributional boundary values after transport.
    On overlaps, both boundary prescriptions are continuations of the same rational complex kernel.
    In strict spacelike separation the two prescriptions agree.
    Additivity therefore transports the real smear spaces, even when the opposite diamond meets several charts.
  Here is an explicit covering of the complement needed in (6.2).
    Let a target have $tau gt.eq 0$ and $theta = d \( x \, N_0 \) > alpha + tau$.
    Choose $alpha < beta < theta - tau$ and take the past tip of $N$ to be $\( - beta \, N_0 \)$.
    Its future tip is $\( pi - r \, q \)$, where $d \( q \, N_0 \) = r < \( pi - alpha \) \/ 2$;
    it lies on the future null boundary of the physical patch.
    This parabolic diamond contains $overline(O)$ with strict margins.
    The target is outside the causal future of its past tip because $theta > beta + tau$.
    To put it outside the causal past of the future tip, it suffices to choose $q$ so that
  $ d \( x \, q \) + r > pi - tau . $
  At fixed $r$, the maximum left side is $min \( theta + 2 r \, 2 pi - theta \)$.
    As $r$ increases to $\( pi - alpha \) \/ 2$, this tends to $min \( theta + pi - alpha \, 2 pi - theta \)$,
    which exceeds $pi - tau$, except when $\( tau \, x \) = \( 0 \, - N_0 \)$. Time reversal treats $tau < 0$.
    Consequently the spacelike shadows of these $N$ cover $O^perp$ except possibly its central antipode.
  If a vector symplectically annihilates all these shadows,
    its pairing with canonical real point waves vanishes on their union.
    The resulting distribution cannot be supported only at the omitted point:
    locally its singular covectors are causal, from the positive-energy tube and its conjugate,
    whereas a nonzero point-supported distribution has all nonzero covector directions in its wavefront set.
    It therefore annihilates $X_c \( O^perp \)$. Taking symplectic complements in (6.2) proves (6.1). ◻
]

=== 6.2 Timelike restrictions of the original fields <timelike-restrictions-of-the-original-fields>

The time-weight argument uses point waves restricted to a timelike line.
  Later, bounded approximation will also require uniform moments of the original source field as a transverse
  smearing shrinks to that line. Both facts follow from the same ordered-spectrum estimate.

#thm([Lemma 6.2.])[
  #emph[Every fixed finite original vacuum distribution has a restriction to parallel timelike lines,
    continuous in joint Schwartz temporal tests. The restrictions of its fixed transverse derivatives exist as
    well. Transverse mollification converges in these distributions,
    and in the one-field vacuum and adjoint-vacuum vectors, with error $O \( delta \)$ at width $delta$.
    Each bound uses finitely many temporal test seminorms, uniformly on compact families of line positions.
    In particular every fixed source-field polynomial moment is uniformly bounded under this mollification.
    For a Hermitian field, a real line test has its vacuum vector in $X_(upright("phys")) \( O \)$ whenever the
    compact line support is contained in the double cone $O$.]
] <E:timelike-restriction>

#proof[
  Choose the line direction as the time axis and write the individual Fourier variables as
    $k = \( omega \, bold(k) \)$. On the ordered spectral support $Gamma_n$,
    positive energy of the partial sums gives $sum_i \| bold(k)_i \| lt.eq C_n sum_i \| omega_i \|$.
    Choose a smooth cutoff $chi = 1$ near $Gamma_n$, supported where $\| bold(k) \| lt.eq
    C'_n \( 1 + \| omega \| \)$, with polynomially bounded derivatives.
    For a joint Schwartz temporal test $h$, $chi \( k \) hat(h) \( omega \)$ is therefore Schwartz in all
    variables, with each Schwartz seminorm bounded by finitely many temporal ones.
    Compact families of spatial translations and fixed transverse derivatives introduce only polynomial factors
    and obey the same bound.
  For the tempered Fourier distribution $hat(W)_n$, fix a finite Schwartz seminorm $p_m$ controlling its action.
    Transverse mollifier multipliers are uniformly bounded in the required weighted derivative seminorms, and
  $ \| partial_(bold(k))^gamma \( hat(rho) \( delta bold(k) \) - 1 \) \| lt.eq
    C_gamma delta \( 1 + \| bold(k) \| \) \, wide 0 < delta lt.eq 1 . $
  After multiplication by $chi hat(h)$, this gives an $O \( delta \)$ bound in $p_m$,
    with finitely many additional temporal seminorms. It constructs the restriction and proves the stated
    distributional convergence. For the squared one-field vacuum error,
    the doubled correlation has two mollifier differences; its seminorm is $O \( delta^2 \)$,
    giving vector error $O \( delta \)$. The adjoint and all fixed alternating source-field words are covered by
    the same original vacuum distributions. Thus every fixed moment required below is uniformly bounded.
    This argument tests tempered distributions; it assumes no ordinary Fourier density for an $n$-point function.
  For a real line test of a Hermitian field, sufficiently thin compact transverse mollifications are supported in
    $O$. Their vacuum vectors belong to its closed real space by affiliation.
    Their Hilbert limit has the same membership. Translation and Lorentz covariance give the assertion for all the
    lines under consideration. ◻
]

=== 6.3 Actual and auxiliary time weights <actual-and-auxiliary-time-weights>

Fix a future timelike unit $e$ and put $E = P_e > 0$. Use the common affine realization
  $L^2 \( bb(R)_(+) \, upright(d) E \/ E \; cal(K) \)$, where translations multiply by $e^(i t E)$ and dilations
  rescale $E$. In a lowest-weight module of weight $h > 0$, the point wave is $E^h e^(i z E) v$.
  Here $h$ is a scalar time lowest weight, unrelated to the internal parabolic operator $h$ of Proposition 5 or
  the radial comparison operators $h_nu$. Theorem 30 and Lemma 31 constructed the #emph[actual] time-Möbius action
  and its interval real spaces. The auxiliary canonical representation has the same affine convention,
  with its own primary weights $s$. Write $H$ for the actual lowest-weight operator on the affine multiplicity
  space. We will compare interval real spaces as well as affine actions:
  the affine actions alone do not distinguish lowest weights.

#thm([Lemma 6.3.])[
  (Interval Paley regularity and weight selection).  #emph[Let $X_s \( I \)$ be the closed real interval space of
    a primary of weight $s > 0$. Dividing a wave in $X_s \( I \)$ by $E^s$ gives an entire Fourier transform;
    evaluation and each derivative on a compact complex-frequency set are continuous in its real-space Hilbert
    norm. The bounds are uniform on compact positive weight bands. In particular:]
  + #emph[Suppose a bounded affine intertwiner $j_s$ from the actual representation to a weight-$s$ primary
    representation satisfies $j_s X_(upright("act")) \( I \) subset X_s \( I \)$ for bounded intervals $I$.
    In the common affine realization write $j_s = upright(bold(1)) ⊗ T_s$. Then
$ T_s upright(bold(1))_(bb(R) \\ \( s + bb(Z)_(gt.eq 0) \)) \( H \) = 0 . $

]
  + #emph[A physically real localized vacuum point wave of scale dimension $d >
    0$ has actual weights only among $h = d - j > 0$, $j in bb(Z)_(gt.eq 0)$.]
] <E:paley-selection>

#proof[
  For real $f in C_c^oo \( I \)$ the primary norm, up to a positive constant, is
  $ integral_0^oo E^(2 s - 1) \| hat(f) \( E \) \|^2 thin upright(d) E . $
  Reality determines negative frequencies. To evaluate $partial_z^k hat(f) \( z \)$,
    choose a compactly supported smooth test which agrees on $I$ with $\( i t \)^k e^(i z t)$.
    Modify it outside $I$ to annihilate its first $m$ Fourier jets at zero, with $m > s - 1$.
    Such a modification exists: finitely many disjoint small bumps outside $I$, with distinct centers,
    have a moment matrix arbitrarily close to a nonsingular Vandermonde matrix.
    Cauchy–Schwarz with dual weight $\| E \|^(1 - 2 s)$ now bounds the pairing.
    Its high-frequency integral converges by smoothness, and its low-frequency integral converges by the vanished
    jets. The construction and all bounds are uniform on compact sets of $z$ and compact bands of $s$.
    They extend to the real Hilbert closure. The extended evaluations satisfy the Cauchy–Riemann equations and
    give the asserted entire function.
  The regularity at zero frequency now detects the allowed weights.
    In the common affine realization, changing the primary weight changes only a power of $E$.
    Entire continuation permits precisely the nonnegative integral powers of that variable.
  An intertwiner commuting with $E$ and its rescalings is an energy-independent bounded multiplicity map $T_s$.
    For a real multiplicity section $v$ in a compact $H$-band, projection of the actual localized wave has quotient
  #[#set math.equation(numbering: n => "(6.3)")
   $ hat(f) \( E \) T_s E^(H - s) v . $ <E:weight-multiplier>]
  The assumed real-space inclusion and the preceding continuity make this holomorphic at $E = 0$.
    Choose $hat(f) \( 0 \) eq.not 0$. On a compact band $T_s exp \( \( H - s \) z \)
    v$ is an entire function of $z = log E$. Single-valued continuation in $E$ implies
  $ T_s #scale(x: 120%, y: 120%)[\(] e^(2 pi i \( H - s \)) - upright(bold(1)) #scale(x: 120%, y: 120%)[\)] v = 0 . $
  Complexifying real sections and applying the spectral theorem shows that $T_s$ is supported on $h - s in bb(Z)$.
    Only finitely many such values occur on the band. Their finite Laurent expansion in (6.3) has no pole,
    so its negative powers vanish. Exhausting the positive weight axis proves the first assertion.
  For the second, write a dimension-$d$ point wave as $E^d u$ in the actual affine representation.
    Project onto compact $H$-bands, which commute with interval Tomita data.
    In each fiber division by its primary power gives $hat(f) \( E \) E^(d - h) u_h$.
    The same argument forces $d - h in bb(Z)_(gt.eq 0)$. There is no translation-invariant component of a
    positive-dimension point wave: its zero-momentum vacuum amplitude would have to transform by a nonunit-modulus
    dilation character. For original fields, the required timelike restrictions and real localization are supplied
    by Lemma 33. The same assertion for a subsequently constructed wave uses its stated Hilbert-valued restriction
    and physical real localization. ◻
]

The norm-continuous evaluations above concern the closed real space.
  For a complex localized operator vector, use its Hermitian real and imaginary parts;
  the bound then involves the sum of the vacuum and adjoint-vacuum norms.
  No Hilbert-norm evaluation bound on an arbitrary completion of $X_s \( I \) + i X_s \( I \)$ is being used.

Here the intertwiners are specific canonical projections.
  Project by $P_Pi$, then onto an auxiliary time-primary summand of weight $s$.
  Lemma 32 and the canonical interval Tomita data give the required real-space inclusion for this map $j_s$.
  The same construction applies when the canonical comparison space is enlarged below.
  Taking adjoints of the selection identity gives

$ upright(bold(1))_(bb(R) \\ \( s + bb(Z)_(gt.eq 0) \)) \( H \) T_s^(*) = 0 . $

Write $l \( 0 \) = E^2 u_l$. Its auxiliary temporal primary has weight two, so its actual affine label is $u_l =
  T_2^(*) v_l$ for its canonical label $v_l$; it has actual weights in $2 + bb(Z)_(gt.eq 0)$.
  Likewise $J_e \( 0 \) = E^3 u_(J_e)$ has $u_(J_e) = T_3^(*) v_(J_e)$ and actual weights in $3 +
  bb(Z)_(gt.eq 0)$. These are adjoint support statements, not commutation of actual and auxiliary weight
  projections. The temporal virial wave has $E^3$-label $i u_l + u_(J_e)$.
  Its physical real localization and dimension three bound its actual weights above by three.
  It therefore has only weights two and three. The weight-two label is $i u_(S_e)$, where

#[#set math.equation(numbering: n => "(6.4)")
 $ u_(S_e) = P_(h = 2)^(upright("act")) u_l \, wide S_e \( 0 \) = E^2 u_(S_e) . $ <E:definition-Se>]

This is a vacuum-wave definition.

The derivative of a primary of weight two has an inhomogeneous transformation term.
  Differentiating its primary transformation, and adding the weight-three part of $V_e$,
  gives for a small real non-affine time-Möbius map $g$

#[#set math.equation(numbering: n => "(6.5)")
 $ U_e \( g \) V_e \( z e \) Omega = \( g' \( z \) \)^3 V_e \( g \( z \) e \) Omega +
   2 g' \( z \) g'' \( z \) S_e \( g \( z \) e \) . $ <E:finite-difference>]

Choose an interval on which $g' g'' eq.not 0$. After changing variables and multiplying by smooth real
  coefficients, this equation expresses any smearing of $S_e$ there as a difference of a physical virial smearing
  and an actual modular transform of one. Consequently, for a real test supported in a line interval whose diamond
  lies in $O$, $S_e \( f \) in X_(upright("phys")) \( O \)$.
  Complex linear extension gives its adjoint-wave reality relation; this is the meaning of a Hermitian wave here.
  It is even and physically real localized on all translated lines.
  Translation covariance defines it as a spacetime Hilbert-valued distribution.
  For example $parallel e^(- epsilon.alt P_e) S_e \( 0 \) parallel = O \( epsilon.alt^(- 2) \)$,
  and $\| bold(P) \| lt.eq P_e$ supplies all required spacetime test bounds.
  The family is Lorentz covariant in $e$, a rotational scalar about $e$, and homogeneous of dimension two.

=== 6.4 Independence of the time direction <independence-of-the-time-direction>

#thm([Proposition 6.4.])[
  #emph[The waves $S_e$ agree for all future timelike unit vectors $e$.
    Their common value $S$ is a purely timelike Lorentz scalar of dimension two, with physical real localization.
    It has the canonical null special-conformal action. It can be included in the auxiliary representation and in
    Lemma 32.]
] <E:accessible-scalar>

#proof[
  There are three issues to settle: the timelike spectral densities, the possible massless component,
    and the action of the actual null generators on the resulting scalar.
    The projection identity (6.4) will link the first two issues:
    comparison on one energy slice fixes both the normalization and the dependence on the time direction.
  We first prove a two-point claim: the timelike entries of the joint spectral measure of the family $S_e$ and $l$
    are constant multiples of the ordinary measure $upright(d)^4 p$ on the future timelike cone.
    No density is assumed in this claim. Write $mu_(e e')$ for a joint spectral entry,
    including $l$ as an additional label. The corresponding commutator distribution is
  $ C_(e e') \( x \) = integral e^(i p dot.op x) thin upright(d) mu_(e e') \( p \) -
    integral e^(- i p dot.op x) thin upright(d) mu_(e' e) \( p \) . $
  Every invariant-mass projection commutes with wedge Tomita data.
    Wedge separation and reality therefore give causal support for this commutator after projection to any compact
    mass interval. For $l$, the real wedge data are the canonical scalar data already identified in Section 2;
    physical point-field membership is not needed.
  Homogeneity disintegrates the timelike measure as $M^3 upright(d) M thin upright(d) nu \( p \/ M \)$,
    with a polynomially bounded measure on the unit hyperboloid.
    Testing arbitrary mass intervals shows that the shell commutator has causal support for almost every mass;
    rescaling then gives the same statement for the reference shell.
    This is a disintegration of distributions, not an assumed field on a fixed mass shell.
    The shell commutator solves the Klein–Gordon equation. Its displacement and normal-derivative Cauchy data at
    zero time are supported at the spatial origin, and hence are finite sums of delta derivatives.
    Fourier solution of this Cauchy problem expresses its shell measure as the ordinary commutator measure times a
    polynomial in $p \/ M$, modulo $p^2 = M^2$. In particular this proves absolute continuity rather than
    presupposing it.
  For a self-pair the shell polynomial is even under $p mapsto - p$.
    Take its representative of least degree modulo the shell relation.
    If its highest degree is $k$, that homogeneous term is nonzero on an open set of null directions;
    otherwise divisibility by $p^2$ would reduce the degree. At fixed nonzero energy and $M arrow.b
    0$ it contributes order $M^(- k)$ to the density with respect to $upright(d)^4 p$.
    The transverse mass integration is $M upright(d) M$. Positivity and local finiteness therefore require $k <
    2$. Evenness leaves only a constant. Positivity of the matrix measure bounds each cross density by the
    geometric mean of the self densities. A polynomial on the unit hyperboloid with such a global bound is
    constant by the same highest homogeneous term argument. All timelike density entries are therefore constant,
    proving the two-point claim. Covariance makes the self constant of $S_e$ independent of $e$.
  There is no zero-momentum part. We must also exclude a massless part; positivity alone would allow one.
    Let $rho = sqrt(- W_mu W^mu)$ be the massless Pauli–Lubanski length and project the entire Lorentz family onto
    a compact band $0 < a lt.eq rho lt.eq b < oo$. This projection commutes with wedge modular data.
    Its commutators are causal massless solutions. The preceding point-supported Cauchy-data argument makes them
    derivatives of the massless commutator, hence supported on the light cone in four dimensions.
  On the complex cyclic span of this projected family, let $X_(+)$ and $X_(-)$ be the real spaces generated in the
    future and past cones. Translation-spectrum uniqueness makes both spaces complex cyclic:
    a vector orthogonal to smearings on an open cone is orthogonal to all translates by tube uniqueness.
    Huygens support gives $X_(-) subset X'_(+)$, so $X_(+)$ is standard.
    Lorentz transformations preserve it and hence commute with its modular group.
    Every future translation maps it into itself. The positive-generator modular translation relation therefore
    scales all $P_mu$ by one common nontrivial exponential under that modular group.
    Because the Lorentz generators commute with the group, $rho$ scales by the same factor.
    No nonzero spectrum contained in $\[ a \, b \]$ is invariant under all these rescalings.
    The projected space is zero. Exhausting positive bands excludes nonzero Pauli–Lubanski length.
  The remaining massless representations have trivial little-group translations and decompose into helicities.
    A rotational scalar about $e$ has only helicity zero, since a spatial rotation fixing both $e$ and a massless
    momentum acts trivially on its wave. Use the scalar massless invariant measure.
    The possible internal part of dilations is a momentum-independent unitary group $W$ on scalar multiplicities.
    Lorentz covariance and dimension two give the amplitude
  #[#set math.equation(numbering: n => "(6.6)")
   $ S_e \( p \) = \( p dot.op e \) W \( log \( p dot.op e \) \) beta . $ <E:massless-amplitude>]
  For two directions the commutator argument makes the cross density a homogeneous quadratic shell polynomial.
    A quadratic scalar invariant under rotations fixing $e \, e'$ is, on the null shell,
    a linear combination of $\( p dot.op e \)^2$, $\( p dot.op e \) \( p dot.op e' \)$ and $\( p dot.op e' \)^2$.
    It follows that
  $ phi \( u \) = ⟨beta \, W \( log u \) beta⟩ \, wide u = frac(p dot.op e', p dot.op e) \, $
  is a linear combination of $u^(- 1) \, 1 \, u$ on the attainable interval.
    As the relative rapidity grows these intervals exhaust $\( 0 \, oo \)$; the coefficients agree on overlaps.
    Since $\| phi \( u \) \| lt.eq parallel beta parallel^2$, both nonconstant coefficients vanish.
    Thus the massless cross density is $c \( p dot.op e \) \( p dot.op e' \)$, with $c =
    parallel beta parallel^2 gt.eq 0$.
  The only massless possibility left is the scalar density just displayed.
    Its growth with the relative rapidity of $e$ and $e'$ is incompatible with the bounded timelike cross
    densities. The next energy-slice calculation makes this comparison with its exact normalization.
  Now apply the defining projection in (6.4) to $F = S_(e')$.
    A dimension-two wave with physical real localization has actual weights at most two;
    $u_l$ has actual weights $2 \, 3 \, dots.h$. In the multiplicity fiber at $P_e = 1$,
  #[#set math.equation(numbering: n => "(6.7)")
   $ ⟨u_F \, u_(S_e)⟩ = ⟨u_F \, u_l⟩ . $ <E:projection-pairing>]
  Let $B \( e' \, e \)$ and $D \( e' \)$ denote the constant timelike density entries for $\( S_(e') \, S_e \)$
    and $\( S_(e') \, l \)$, respectively. Write $b = B \( e \, e \)$, which is independent of $e$ by covariance,
    and let $rho_(l l)$ be the self density of $l$. With timelike measure $upright(d)^4
    p$ and massless measure $theta \( p^0 \) delta \( p^2 \) upright(d)^4 p$, (6.7) reads explicitly
  #[#set math.equation(numbering: n => "(6.8)")
   $ frac(4 pi, 3) B \( e' \, e \) + 2 pi c \( e dot.op e' \) =
     frac(4 pi, 3) D \( e' \) . $ <E:energy-slice-normalization>]
  Indeed the timelike slice $p dot.op e = 1$ is the unit spatial ball in the rest frame of $e$,
    of volume $4 pi \/ 3$. Lorentz invariance of $upright(d)^4
    p$ makes this normalization independent of the slicing direction.
    On the massless slice the angular integral is $c / 2 integral_(S^2) \( e' ""^0 - bold(e)' dot.op bold(n) \)
    upright(d) Omega = 2 pi c \( e dot.op e' \)$. Positivity gives $\| B \( e' \, e \) \| lt.eq
    b$ and $\| D \( e' \) \| lt.eq sqrt(b rho_(l l))$ uniformly.
    Arbitrarily large relative rapidity therefore forces $c = 0$.
    Setting $e = e'$ in (6.8) now gives $D \( e' \) = b$, and hence $B \( e' \, e \) = b$ for all pairs.
    Thus $parallel S_e \( f \) - S_(e') \( f \) parallel^2 = 0$ for every test $f$.
    It also shows that the constant two-point density of $S$ with $l - S$ is zero.
    This is orthogonality of the scalar wave channels, including all their spacetime translates;
    it does not assume that the actual time-weight projection commutes with spatial translations.
  Finally, physical real localization supplies the scalar order-zero parabolic comparison for $S$.
    We can also apply the proof of Lemma 26 to its smooth compact vacuum smearings in the same strictly one-sided
    placements, and then to all their strictly energy-damped translates.
    That proof requires real localization, giving the Tomita bound after parabolic transport,
    and boost smoothness of every order. Both are available here:
    localization was obtained from (6.5), and the scalar covariance just proved identifies every iterated boost
    derivative with another compact smooth $S$-smearing. Its Tomita and Hardy estimates therefore give the
    asserted $K_n$ domains without treating $S$ as an operator.
    Symmetry against the same dense core transfers the even second difference of (5.22), $K_n \( s \) +
    K_n \( - s \) - 2 K_n = 4 s^2 a$, to these vectors as a form identity.
    The $D'$ term cancels, so no $D'$ operator domain for $S$ is assumed.
    The second-difference and zero-capacity argument of Theorem 27 therefore applies:
    the nonnegative comparison defect is translation-diagonal in $M^2$,
    and is bounded by $integral_0^oo M \| f' \( M \) \|^2 upright(d) M$.
    Logarithmic cutoffs equal to one on a prescribed compact mass interval make this bound tend to zero.
    Spectral comparison then gives reduction and the exact canonical null action.
    Its wedge reality and two-point kernel are scalar, so the proof of Lemma 32 includes this enlarged canonical
    space as well. ◻
]

#thm([Corollary 6.5.])[
  #emph[Put $ell = l - S$. Its insertion at imaginary infinity annihilates every compact physical vacuum polynomial:
#[#set math.equation(numbering: n => "(6.9)")
 $ lim_(R arrow.r oo) R^4 ⟨ell \( i R e \) \, A Omega⟩ = 0 . $ <E:residual-infinity>]

]
] <E:infinity-vanishing>

#proof[
  The multiplicity label $u_ell$ has actual weights $2 + j$, $j gt.eq 1$.
    First take a Hermitian polynomial localized in a diamond on the line.
    Its vacuum vector $psi$ is in the corresponding real space. The scalar quotient
  $ F \( E \) = E^(- 2) ⟨u_ell \, psi \( E \)⟩ $
  is regular at zero, with continuous evaluation, by Lemmas 32 and 34.
    For compact actual weight-band projections of $psi$, its overlap with $u_ell$ has only positive integral
    powers $E^(h - 2)$, so $F \( 0 \) = 0$. These projections preserve the interval real space and converge in
    Hilbert norm; continuity of evaluation proves the same equality without the band cutoff.
    With the common $upright(d) E \/ E$ normalization,
  $ ⟨ell \( i R e \) \, psi⟩ = integral_0^oo E^3 e^(- R E) F \( E \) thin upright(d) E . $
  The contribution near zero is $o \( R^(- 4) \)$, and the complementary contribution is exponentially small by
    Cauchy–Schwarz. Every compact polynomial is a complex linear combination of Hermitian ones,
    and its support fits in a line diamond. For a compact joint polynomial kernel,
    the same real-space statement is the closed Tomita-graph limit of factorized tests,
    using the old joint-distribution continuity from Section 2. This proves the claim. ◻
]

At this point $S$ is a direction-independent scalar vacuum wave with physical real localization, and $l -
  S$ has the stated decay against physical polynomial vectors.
  To multiply $S$ with other entries we need quantitative bounded operations,
  including control of both their vacuum and adjoint-vacuum errors.

=== 6.5 Bounded approximants for accessible waves <bounded-approximants-for-accessible-waves>

Call a vacuum wave #emph[accessible] when it has the approximation property below,
  including the corresponding adjoint wave. Physical fields and $S$ have this property.
  This definition does not assert that an accessible wave already acts on a common field domain.
  In the following norm estimates, $a \( f \)$ denotes a vector:
  for an original field it is its smeared vacuum vector, and for $S$ it is its Hilbert-valued smearing.
  The notation $a^dagger \( macron(f) \)$ denotes the corresponding adjoint-vacuum vector.

#thm([Proposition 6.6.])[
  #emph[Let $a$ be a physical field or $S$, and let $f$ have support in a small real source patch.
    Given a double-cone neighborhood of its support, there are bounded operations $A_R \( f \)$ in that
    neighborhood, for dyadic $R arrow.r oo$, such that for one fixed exponent $q$
#[#set math.equation(numbering: n => "(6.10)")
 $ parallel A_R \( f \) parallel & lt.eq C R^q \,\
parallel A_R \( f \) Omega - a \( f \) parallel + parallel A_R \( f \)^(*) Omega -
  a^dagger \( macron(f) \) parallel & lt.eq C_N R^(- N) quad \( N = 1 \, 2 \, dots.h \) . $ <E:approx-norm>]

 For each prescribed $N$, constants are uniform on balls of finitely many test seminorms.
   When patches and localization margins shrink to size $epsilon$ in a fixed compact set,
   these constants cost at most fixed inverse powers of $epsilon$. The approximants need not depend linearly on $f$.]
] <E:bounded-approximation>

#proof[
  For an ordinary field smearing with closed affiliated realization $A = v \| A \|$, take its polar cutoff $A_R =
    v \| A \| upright(bold(1))_(\[ 0 \, R \]) \( \| A \| \)$. It has norm at most $R$.
    The tails on the vacuum and adjoint vacuum satisfy, for every positive integer $m$,
  $ parallel \( A - A_R \) Omega parallel & lt.eq R^(- m) parallel \| A \|^(m + 1) Omega parallel \,\
parallel \( A^(*) - A_R^(*) \) Omega parallel & lt.eq R^(- m) parallel \| A^(*) \|^(m + 1) Omega parallel . $
  Here the absolute-value moments follow from the original realization hypothesis together with the
    generated-domain action check in Section 2. Both $A$ and $A^(*)$ preserve the dense invariant vacuum-generated
    domain $cal(D)_(upright("old"))$ and agree there with the physical field and its polynomial adjoint.
    Induction therefore gives
  $ cal(D)_(upright("old")) subset "Dom" \( A^(*) A \)^m ∩ "Dom" \( A A^(*) \)^m wide \( m = 1 \, 2 \, dots.h \) \, $
  and these powers on that domain are the corresponding alternating polynomial words.
    Their vacuum norms are finite and are bounded by finitely many seminorms of the source tests,
    by the joint Wightman distributions. Since $\| A \|^(2 m) = \( A^(*) A \)^m$ and $\|
    A^(*) \|^(2 m) = \( A A^(*) \)^m$, spectral calculus also gives every lower integer absolute-value moment used
    in the tail bounds. This uses the adjoint-extension clause of Assumption 2 and does not require essential
    self-adjointness.
  The invariant polynomial domain supplies these moments, uniformly on finite test-seminorm balls;
    subdivision supplies the requested local neighborhoods. Use a Hermitian basis or adjoint-paired cutoffs to
    preserve adjunction and grading.
  For a nonhomogeneous original source, any comparison of shrinking patches by dilation is made on its finitely
    many homogeneous components and then summed. For this fixed field and requested accuracy,
    a maximum of the finitely many seminorm orders and powers is sufficient.
    This does not assign the source a single scaling dimension or require a bound uniform in the set of
    dimensions, and it does not change the fixed polynomial norm exponent in (6.10).
  For $S$ the order of construction matters. We truncate the ordinary source field before applying the actual
    modular unitary, and then add the resulting bounded operations.
    We will estimate the sum by its absolute quadrature weights,
    so no domain or moment estimate for an unbounded sum of modularly transformed fields enters.
  For $S$, use (6.5) on parallel lines. After undoing $g$ in the test,
    a line smearing of $S$ is a fixed linear combination of a line virial smearing and a modularly transformed
    line virial smearing, with smooth real coefficients. By Lemma 33,
    transverse approximation at width $delta_R lt.eq e^(- R)$ has vacuum error $O \( delta_R \)$,
    and every fixed source-field moment is bounded uniformly as $delta_R arrow.b 0$.
    Its adjoint data obey the same estimates.
  Polar truncate each such source field at $R$ and apply the actual Möbius unitary.
    It fixes the vacuum and transports the bounded operation into the destination diamond,
    so both estimates in (6.10) survive. A transverse quadrature of mesh at most $e^(- R)$ approximates a full
    spacetime smearing. Although its number of terms grows, the sum of absolute quadrature weights is bounded.
    Hence the sum of the operator norms is $O \( R \)$, and the sum of the vacuum errors remains rapidly small.
    No moment bound for a sum of noncommuting transformed fields is being assumed.
  All the operations just described use finitely many derivatives for each requested accuracy.
    Rescaling tests and using diamonds with margins proportional to $epsilon$ therefore introduces only inverse
    powers of $epsilon$. The fixed non-affine map can be chosen nonsingular on the entire compact parameter patch,
    with $g' g''$ bounded away from zero. Take $delta_R lt.eq
    c epsilon e^(- R)$ and sufficiently fine quadrature to retain these margins.
    Subdivision completes the construction for an arbitrary compact source support. ◻
]

The norm exponent in (6.10) is fixed before an error order $N$ is requested.
  Increasing $N$ changes the finite collection of moments and test seminorms used to estimate the error,
  but does not change that exponent. This distinction allows rapid vacuum errors to dominate the finitely many
  polynomially growing factors in a product.

=== 6.6 Holomorphic products, ties, and unsmearing <holomorphic-products-ties-and-unsmearing>

For $p$ accessible entries, use increasing imaginary translations:

#[#set math.equation(numbering: n => "(6.11)")
 $ "Im" z_1 in V_(+) \, wide "Im" \( z_(j + 1) - z_j \) in V_(+) quad \( 1 lt.eq j < p \) . $ <E:ordered-tube>]

The first inequality is needed for vector products. With tests fixed in sufficiently small patches,
  form actual bounded vector products

#[#set math.equation(numbering: n => "(6.12)")
 $ F_R \( z \) = U \( z_1 \) A_(1 R) U \( z_2 - z_1 \) A_(2 R) dots.h.c U \( z_p - z_(p - 1) \) A_(p R) Omega .
   $ <E:bounded-product>]

They are holomorphic in (6.11), with norm at most a fixed power of $R$.
  Their scalar vacuum expectations have the larger tube determined only by the successive imaginary gaps:
  vacuum invariance removes the first factor $U \( z_1 \)$.
  Equivalently, add a common future imaginary translation to put all the arguments in the vector tube,
  then pair with $Omega$. The scalar answer is independent of this common translation.
  We use $W$ for its limit and retain $Psi$ for the vector limit.

#thm([Proposition 6.7.])[
  #emph[The vectors (6.12) have a unique, locally uniform holomorphic limit.
    It is multilinear in the accessible waves and has Hilbert-valued distributional boundaries at mutually
    strictly spacelike real placements. These boundaries are graded symmetric.
    The limits extend to common holomorphic neighborhoods of imaginary ties:
    successive blocks may have equal imaginary translation when real placements within each block are pairwise
    spacelike and all inequalities between blocks remain strict.
    The limits unsmear to holomorphic point vectors, denoted $Psi$,
    depending only on the total complex insertion arguments. For physical entries alone they agree with the usual
    Wightman vectors. For any two finite accessible words, with each word in its strict vector tube,
    their scalar functions satisfy
#[#set math.equation(numbering: n => "(6.13)")
 $ & chevron.l Psi \[ A_1 \( z_1 \) dots.h.c A_p \( z_p \) \] \,
   Psi \[ B_1 \( w_1 \) dots.h.c B_q \( w_q \) \] chevron.r\
 & quad = W #scale(x: 120%, y: 120%)[\(] A_p^dagger \( macron(z)_p \) \, dots.h \, A_1^dagger \( macron(z)_1 \) \,
   B_1 \( w_1 \) \, dots.h \, B_q \( w_q \) #scale(x: 120%, y: 120%)[\)] . $ <E:accessible-splitting>]

 An empty word denotes $Omega$. Source tests on the bra word are conjugated and reversed,
   together with their field labels. The identity holds for distinct words and their finite linear combinations at
   every finite total length. It asserts analytic Hilbert splittings and their spacelike real boundaries,
   without yet asserting a distributional boundary at every real configuration.]
] <E:accessible-products>

#proof[
  We first prove convergence where locality lets us estimate the whole product by vacuum errors.
    Holomorphic propagation then carries that convergence into the ordered tube.
    Finally, bounded-product continuity at a spacelike edge gives the common neighborhoods needed for ties;
    translation compatibility removes the source smearing.
  At real translations making all approximation patches mutually spacelike, telescope two bounded products,
    whether at $R \, 2 R$ or from different approximation choices.
    Strong graded locality moves each difference to the vacuum.
    Its vacuum error is rapidly small by (6.10), while all other factors have polynomial norm growth by (6.10).
    The product difference is therefore $O_N \( R^(- N) \)$ for every $N$,
    uniformly on smaller placement patches and appropriate test-seminorm balls.
    This proves independence, graded symmetry and multilinearity at these real placements.
  We record the propagation estimate, since vacuum convergence alone would not justify the products elsewhere.
    For a holomorphic vector difference $G_R$ bounded by $C R^q$, restrict to a complex line $z = x +
    zeta eta$ with $eta$ in the ordered cone. A real interval $I$ can be chosen inside a good spacelike-placement
    patch. The subharmonic logarithm of its norm and harmonic measure give
  #[#set math.equation(numbering: n => "(6.14)")
   $ log parallel G_R \( x + zeta eta \) parallel lt.eq
     omega \( zeta \, I \) \( log C_N - N log R \) + \( 1 - omega \( zeta \, I \) \) \( log C + q log R \) .
     $ <E:harmonic-propagation>]
  On compact subsets reached this way $omega$ is bounded below by a positive number.
    Interior three-circle chains propagate the same conclusion to every fixed compact subset of the connected
    tube. As $N$ is arbitrary, convergence is rapid there. Above a smaller good real patch it is rapid uniformly
    up to the boundary, because $omega$ has a uniform positive lower bound for bounded approach directions.
    Summing the dyadic differences proves existence.
  For ties, first keep the common translation of each block and its spectators strictly inside their allowed
    complex domains. The relative translations within a block have wedges of opposite imaginary-gap cones for its
    order and its reversal. At their common real edge the bounded products agree, with the graded sign,
    by strong locality. Each bounded product has a norm-continuous extension to that edge:
    the real translation groups and the positive-energy contraction semigroups are strongly continuous,
    and only finitely many bounded factors occur. On fixed smaller wedges and their common edge its norm is
    $O \( R^q \)$. The continuous-edge form of the local edge-of-the-wedge theorem therefore applies directly;
    its continuation neighborhood depends only on the wedges and the edge patch,
    and its interior bounds are controlled by the supremum bounds on those wedges and their edge;
    see #cite(label("Browder1963")) Theorems 1$'$ and 2.
  To make uniformity explicit, apply the theorem after scalarization to the Hilbert-valued family
    $\( R^(- q - 1) F_R \)_R$ in the square-summable direct sum, with dyadic $R$.
    Its common edge is norm continuous: finitely many components are continuous and the remaining squared norms
    are bounded uniformly by a convergent tail of $sum_R R^(- 2)$.
    Scalarization gives a bounded holomorphic Hilbert-valued continuation on one common neighborhood,
    and each unweighted component there has a bound $O \( R^(q + 1) \)$.
    The same supremum-bound argument is uniform on the prescribed test-seminorm balls;
    no estimate from boundary distribution seminorms alone is being asserted.
    Interior propagation from the strict tube now gives rapid convergence on compact subsets of these
    neighborhoods. Adjacent permutations within a block are treated on overlapping smaller neighborhoods,
    where uniqueness glues the continuations.
  By uniqueness from the spacelike real patch, multilinearity persists throughout these domains.
    The seminorm bounds and the test-function kernel theorem give joint distributions in the source variables,
    holomorphic in the translation variables. Translate a source test within its patch.
    At real spacelike placements this is the same as translating its insertion argument;
    the equality involves only the vacuum wave and hence survives all approximation choices.
    Analytic uniqueness extends this equality. If $x$ denotes source variables,
    the kernel in coordinates $\( x \, "Re" z + x \, "Im" z \)$ is therefore independent of its first variables in
    the distributional sense. It satisfies the Cauchy–Riemann equations in the remaining variables.
    Thus it is a holomorphic Hilbert-valued function of $x + z$, rather than merely a distribution in $x$.
    This proves unsmearing. The same identity glues source patches and their translations.
  For the split identity first keep all source tests smeared,
    and use the same bounded approximants on the two sides, taking the adjoints of the bra approximants in the
    scalar word. This is an admissible choice because both vacuum and adjoint-vacuum errors were controlled.
    Bounded adjunction gives (6.13) before taking limits. The displayed scalar word lies in its ordered scalar
    tube: its reversed bra gaps and ket gaps are future directed,
    and its central gap has imaginary part $"Im" w_1 + "Im" z_1 in V_(+)$.
    Local uniform convergence of the two vector factors and of the scalar word therefore proves the identity
    there. The preceding unsmearing then gives the point formula.
    Conversely, at any cut between two successive entries of an ordered scalar tuple,
    choose a common imaginary shift strictly between their imaginary parts.
    Subtracting that shift puts the reversed-adjoint prefix and the suffix in the two strict vector tubes of
    (6.13). Thus the formula supplies the analytic Hilbert splitting of every ordered scalar tuple at every cut.
    Finite linear combinations retain all cross terms. At mutually spacelike real placements,
    the same identity follows from the Hilbert-norm limits already proved on those patches;
    no unrestricted real-axis limit is needed.
  For physical fields, polar truncations converge on the polynomial domain as well as on the vacuum.
    At mutually spacelike real placements their product limit is consequently the ordinary smeared product.
    For a joint source kernel, finite tensor-test approximation and the joint distribution estimates extend this
    equality; the kernel itself need not have finite tensor rank.
    Tube uniqueness identifies their point vectors everywhere.
    Finally the estimates above give distributional boundary convergence locally uniformly on the good real
    patches. In any closed strict subcone of approach, point bounds near such an edge are polynomial in inverse
    distance: test the real variables on balls at that scale and use the holomorphic mean-value estimate on
    smaller complex balls. ◻
]

=== 6.7 A boundary pullback rule <a-boundary-pullback-rule>

The preceding products will be composed with analytic coordinate changes before their real limits are taken.
  The following formulation specifies the required boundary operation.

#thm([Lemma 6.8.])[
  #emph[Let a Hilbert-valued holomorphic function have a local distributional boundary $u$ and polynomial distance
    bounds in closed strict approach subcones. Let $Phi$ be a real analytic local diffeomorphism whose
    complexification takes a smaller wedge strictly into such approach directions.
    Then its composition with $Phi$ has boundary $Phi_(bb(R))^(*) u$ on that smaller wedge.]
] <E:boundary-calculus>

#proof[
  Shrink the real patch and the approach cone so that the image of a small imaginary translate of size $delta$ is
    a graph at distance comparable to $delta$ inside one fixed strict convex subcone.
    Interpolate that graph to a straight imaginary translate there.
    Suppose the holomorphic function is $O \( delta^(- m) \)$ on this interpolation.
    Extend a compact smooth test almost analytically to order $N$:
    its $macron(partial)$ is $O \( delta^N \)$, uniformly with the finitely many derivatives required on the
    patch. Stokes’ formula for the holomorphic volume form compares the two integrals.
    Their error is bounded by a constant times $delta^(N + 1 - m)$; take $N > m + 1$.
  There is a minor test-function issue in this comparison. The desired coefficient on the moving graph is a fixed
    smooth real test, whereas an almost-analytic extension evaluated on that graph has nonzero imaginary Taylor
    terms. Include the holomorphic Jacobian, and choose the real test on the straight surface by inverting these
    Taylor terms through order $N$. More explicitly, the graph evaluation operator on test jets is
    $upright(bold(1)) + delta B_1 + dots.h.c + delta^N B_N$, where each $B_j$ is a differential operator with
    smooth coefficients. It has a unique inverse modulo $delta^(N + 1)$,
    obtained successively in each power of $delta$. This is the negative-imaginary-displacement Taylor correction.
    Its corrected real tests converge in every smooth seminorm to the ordinary real change-of-variables test;
    the remaining graph error is $O \( delta^(N + 1 - m) \)$.
    The boundary limit on the straight surface is therefore precisely the distributional real pullback.
    Pairing with arbitrary Hilbert vectors proves the weak statement,
    and the uniform estimates prove the asserted Hilbert-valued distributional convergence. ◻
]

== 7 Short products and the return to the accessible scalar <sec:short-products>

The scalar vacuum wave $l$ has not yet been realized as a physical field.
  In this Section, $L$ is an insertion symbol whose one-vacuum wave is $l$;
  it is not an operator on the polynomial field domain. We construct only products of total length at most four,
  including derivatives, and prove exactly the factorization statements needed below. The symbols

#[#set math.equation(numbering: n => "(7.1)")
 $ J = V - partial L \, wide t = T - 1 / 3 \( eta square.stroked - partial partial \) L \, wide ell = L -
   S $ <P:formal-fields>]

initially have this same meaning. At the end we prove $l = S$ as vacuum waves.
  Construction of mixed products at every finite length and of the physical operator $L$ is deferred to Section 8.

We use the ordered-vector-tube convention of Section 6: the vacuum is on the right, and

#[#set math.equation(numbering: n => "(7.2)")
 $ Im z_1 in V_(+) \, wide Im \( z_(j + 1) - z_j \) in V_(+) . $ <P:vector-tube>]

The strict first inequality is necessary for vector products.
  Scalar vacuum functions depend only on differences and require only the remaining inequalities.
  A derivative always acts on its own insertion. All entries used in this Section are even.
  Tensor indices and source smearings in the following constructions are retained, even when suppressed in the notation.

The length bound is chosen to support a specific Hilbert-space argument.
  Actual bounded products and finite interpolation will first construct the short vectors and their split
  identities. Their four-point scalar functions then determine inner products of pairs,
  which give a conformal representation on the pair space. Its radial positivity and the normalized current fluxes
  will force the residual wave $l - S$ to vanish.

=== 7.1 Finite interpolation on spacelike patches <finite-interpolation-on-spacelike-patches>

#thm([Lemma 7.1.])[
  (Common wedge for small null flows).  #emph[Fix any finite family of sufficiently small,
    mutually spacelike real source patches. There are a point $o$ strictly to their future,
    an open set of future null directions $n$, and, for each finite set of sufficiently small null
    special-conformal parameters in that set, an opposite open cone $O_(-)$ with the following property.
    Bounded operations on the source patches, or on their inverse coordinate images,
    after conjugation by the actual centered null-charge unitaries lie in wedges spacelike to $O_(-)$.
    The vectors $C Omega$, with $C in cal(M) \( O_(-) \)$, form a total set.
    These choices persist under sufficiently small changes of the source patches and Lorentz transformations.]
] <P:common-wedge>

#proof[
  Choose a future null direction $m$ separated from the directions $n$ and use $m$ as the conjugate wedge axis.
    Work strictly below the null cut plane centered at $o$. In the resulting coordinates put $p \( y \) = \|
    y \|^2$. Each source patch fits, with a strict margin, inside a cut $W_(alpha p + c)$ with $alpha >
    0$ sufficiently small and $c$ sufficiently negative. The same containment holds for the finitely many inverse
    coordinate images when the flow parameters are small enough.
  Here is a two-sign bound uniform in quadratic truncation.
    Choose smooth bounded profiles $0 lt.eq q_R lt.eq p$, increasing to $p$, and write $U_R \( t \) =
    e^(i t H_(q_R))$. For $0 < t < alpha$, cut inclusion and the constant-shift identity give
  $ cal(M) \( W_(alpha p + c) \) subset cal(M) \( W_(t q_R + c) \) = "Ad" \( U_R \( t \) \) cal(M) \( W_c \) . $
  Thus conjugation by $U_R \( - t \)$ sends the source algebra into the fixed wedge algebra $cal(M) \( W_c \)$.
    For positive $t$, the source algebra is already contained in $cal(M) \( W_c \)$, and
  $ "Ad" \( U_R \( t \) \) cal(M) \( W_c \) = cal(M) \( W_(t q_R + c) \) subset cal(M) \( W_c \) . $
  Both signs therefore have the same containing wedge for $\| t \| lt.eq t_0 < alpha$, independently of $R$.
    This argument uses $q_R lt.eq p$, not a bound on the diverging norms $parallel q_R parallel_oo$.
    The positive moment construction of Section 3 gives $U_R \( t \) arrow.r e^(i t K_n)$ strongly.
    Weak closedness of the fixed wedge algebra now preserves the containment for each bounded conjugated operation
    in this limit. Translations give the centered version used here.
  For finitely many choices, take $m dot.op x$ sufficiently negative,
    then add a sufficiently large positive multiple of $m$. This leaves $m dot.op
    x$ unchanged and makes all the finitely many $n dot.op x$ sufficiently positive.
    A small open double cone about such an $x$ lies in the required opposite region.
    All inequalities are strict, hence stable under the small changes asserted in the statement.
    Local vacuum cyclicity in this double cone proves totality. No cyclicity of a relative commutant is used. ◻
]

Let $g$ be the standard null special-conformal coordinate map centered at $o$, with small parameter vector $b_g =
  s n$, and let $U_g$ denote the actual unitary generated by the corresponding centered $K_n$.
  On the one-field space these actions agree canonically by Theorem 27.
  This does not assert covariance on the full physical Hilbert space.
  Reparametrize an input at $g^(- 1) x$ and multiply its test and indices by the inverse primary factors at $x$.
  The transformed one-vacuum data from accessible inputs $S \, V \, T$ are then

#[#set math.equation(numbering: n => "(7.3)")
 $ S \( x \) \, wide V \( e_j \; x \) + frac(4 b_g dot.op e_j, 1 + 2 b_g dot.op \( x - o \)) L \( x \) \, wide
   t \( x \) + cal(P)_g L \( x \) . $ <P:transformed-data>]

Here $e_j$ is a fixed target polarization, and $cal(P)_g$ is a tensor-valued differential operator of order at
  most two with analytic coefficients on the patch. It is obtained by transforming
  $\( eta square.stroked - partial partial \) L \/ 3$ as derivatives of a scalar primary of weight two.
  In particular $cal(P)_0 = \( eta square.stroked - partial partial \) \/ 3$.
  The coefficient in the vector formula is the derivative of the scalar primary factor
  $\( 1 + 2 b_g dot.op \( x - o \) \)^2$; this fixes its normalization.
  All these identities also hold after differentiation and source smearing.

#thm([Lemma 7.2.])[
  (Finite null interpolation).  #emph[For $q lt.eq 4$ and generic independent polarizations $e_1 \, dots.h \,
    e_q$, finite evaluations at arbitrarily small future null $b$ distinguish the $2^q$ functions
#[#set math.equation(numbering: n => "(7.4)")
 $ b mapsto product_(j in I) frac(4 b dot.op e_j, 1 + 2 b dot.op \( x_j - o \)) \, wide I subset { 1 \, dots.h \,
   q } \, $ <P:interpolation-functions>]

 uniformly for $x_j$ in sufficiently small compact source patches.
   The inverse matrix is analytic in the positions, also in a complex neighborhood where its determinant stays nonzero.]
] <P:interpolation>

#proof[
  Complete the polarizations to a generic basis and put $z_j = b dot.op e_j$.
    A polynomial in the square-free monomials $z_I$ that vanishes on an open part of the null cone vanishes on the
    full complex quadric and is divisible by its nondegenerate quadratic equation $Q \( z \)$.
    This last assertion follows, for example, by solving the quadric for one variable on a nonsingular chart and
    applying polynomial division; the remainder vanishes on an open set and is zero.
    In a generic basis $Q$ has a nonzero $z_j^2$ coefficient for every $j$.
    If $Q R$ were nonzero and multi-affine, then $deg_(z_j) \( Q R \) = 2 + deg_(z_j) R gt.eq 2$, a contradiction.
    Thus the square-free monomials are independent on every such cone patch.
    There is consequently a finite nonsingular evaluation matrix. Varying ray lengths separates its homogeneous degrees.
  Scale all its sample vectors by $epsilon > 0$ and divide column $I$ by $\( 4 epsilon \)^(\| I \|)$.
    As $epsilon arrow.b 0$, the matrix in (7.4) converges uniformly on compact source patches to the nonsingular
    monomial matrix. Its determinant remains nonzero for sufficiently small $epsilon$.
    Matrix inversion gives the last assertion. Thus the interpolation involves multiplication of distributions by
    smooth functions, never pointwise inversion of a distribution. ◻
]

The limit $epsilon arrow.b 0$ in the preceding proof is used only to find a nonsingular evaluation matrix.
  In the construction below we fix one sufficiently small positive scale for the compact placement or continuation
  geometry under consideration. We then shrink the position neighborhoods so that its determinant stays bounded
  away from zero, and only afterward take the bounded- approximation and boundary limits.
  The inverse constants may depend on this fixed scale; a uniform inverse as the scale tends to zero is not needed.

Generic polarizations also suffice for exact tensor recovery.
  The decomposable tensors coming from admissible generic polarization tuples span the full tensor product:
  a linear functional vanishing on that open set is a multilinear polynomial vanishing identically.
  Choose a finite spanning subset once. Every requested tensor component is then a fixed linear combination of
  those evaluations, without inverting an evaluation matrix at a nongeneric tuple.

#thm([Proposition 7.3.])[
  (Hilbert products through length four).  #emph[For entries from $t \, S \, V \, L$, and hence $J \,
    ell$ and their derivatives, there are Hilbert-valued product distributions on mutually spacelike real patches
    through total length four. They are multilinear, permutation-symmetric, and covariant under translations,
    Lorentz transformations and dilations. They satisfy every leg-local linear identity of their vacuum waves.
    With $C$ in a common opposite cone, they obey
#[#set math.equation(numbering: n => "(7.5)")
 $ ⟨C Omega \, Psi \[ O_1 dots.h.c O_p \]⟩ = ⟨O_1^dagger Omega \,
   C^(*) Psi \[ O_2 dots.h.c O_p \]⟩ . $ <P:recursive-product>]

 Smearings on the left side of the inner product are conjugated.
   The scalar functions factor at every split of total length at most four.
   Explicitly, for $p + q lt.eq 4$ and both words in their vector tubes,
#[#set math.equation(numbering: n => "(7.6)")
 $ & chevron.l Psi \[ A_1 \( z_1 \) dots.h.c A_p \( z_p \) \] \,
   Psi \[ B_1 \( w_1 \) dots.h.c B_q \( w_q \) \] chevron.r\
 & quad = W #scale(x: 120%, y: 120%)[\(] A_p^dagger \( macron(z)_p \) \, dots.h \, A_1^dagger \( macron(z)_1 \) \,
   B_1 \( w_1 \) \, dots.h \, B_q \( w_q \) #scale(x: 120%, y: 120%)[\)] . $ <P:short-splitting>]

 Here an empty word is $Omega$, and bra source tests are conjugated and reversed.
   The reversed bra gaps, the ket gaps, and the central gap $"Im" w_1 + "Im" z_1$ are all future directed.
   Thus the scalar word is in its gap-only tube. In particular the case $p = q =
   2$ gives the pair–pair Gram identities. All these products extend holomorphically to (7.2) and the spacelike
   tie neighborhoods of Proposition 38; the split identities persist wherever both vector factors are defined.]
] <P:short-products>

#proof[
  Proceed by induction on length, and at a fixed length by increasing number of $t$ slots.
    Length one is the given one-vacuum construction. For accessible inputs use the localized bounded approximants
    of Proposition 37. Conjugate every factor of an approximating real product by the same $U_g$.
    Lemma 40 allows the first factor to commute past $C$. Vacuum-vector and adjoint-vacuum convergence for this
    factor, and convergence of the shorter tail, therefore yield the right side of (7.5).
    By the shorter induction assertions this is the multilinear expansion of (7.3),
    initially as a functional of $C Omega$.
  Use $T$ in positions intended eventually to contain $t$. Terms with fewer $t$ slots have representing vectors
    already and can be subtracted: replacing a transformed $T$ by $cal(P)_g L$ lowers this induction index.
    Interpolation is then needed only for the remaining $V \/ L$ choices.
    At the remaining $V$ positions the unknown functionals are indexed by the subsets replaced by $L$,
    with the coefficients (7.4). Lemma 41 expresses each unknown as a finite smooth linear combination of already
    existing Hilbert-valued distributions. They therefore have representing vectors.
    Generic polarization choices suffice: multilinearity, followed by a finite choice of generic bases,
    recovers all components. This proves (7.5) at the new length.
  The same argument with any other sufficiently small $g$ proves the expansion formula,
    because it proves equality against the total family $C Omega$ in a common opposite cone.
    Subdivision of patches or a change in all auxiliary choices gives the same vectors recursively by (7.5).
    Comparing a construction with a small translated, Lorentz-transformed or rescaled construction proves the
    similarity laws. Interpolating the symmetry of transformed accessible products proves spacelike permutation
    symmetry, again first subtracting terms with fewer $t$ slots.
    Inserting a zero vacuum wave into (7.5), after permuting it to the first position, gives zero. Hence, in particular,
  #[#set math.equation(numbering: n => "(7.7)")
   $ square.stroked L = partial dot.op V = Theta \, wide partial dot.op J = 0 \, wide partial^mu t_(mu nu) = 0 \,
     wide t^mu zws_mu = 0 $ <P:leg-identities>]
  hold in these products. This argument concerns vector distributions, not operator-domain equalities.
  For bounded approximants the vacuum expectation of a product splits at any position by Hilbert-space adjunction.
    The same is true for its common unitary conjugate. Expand the full scalar product and both factors by (7.3);
    real transformations respect adjunction. Subtract the terms already split by induction in the number of $t$
    slots. The identical finite interpolation now proves (7.6) for every remaining entry list,
    with the same adjoint and coordinate convention as (6.13).
    Thus short-length associativity and positivity come from actual bounded products.
  It remains to continue the vectors, rather than merely their matrix coefficients.
    Fix a compact continuation path from a spacelike boundary patch to an interior tube point or one of the
    allowed ties. Choose the parameter scale in Lemma 41 small enough that every inverse image $g^(- 1)
    z_j$ stays in the accessible product domain along that path. Near a tie use its open holomorphic neighborhood.
    The analytic inverse matrices remain nonsingular on a small neighborhood of the compact path.
    Applying $U_g$ to the accessible analytic vectors and performing the same successive subtractions and
    inversions constructs the desired holomorphic vectors. The boundary calculus of Lemma 39 identifies their
    distributional boundary with the real construction: the coordinate maps take a smaller approach wedge strictly
    into the original wedge.
  There is no choice of branch. On overlapping connected compact continuation neighborhoods choose parameters
    sufficiently small for both constructions; their boundaries agree on a smaller original patch,
    and distributional edge-of-the-wedge uniqueness makes the holomorphic vectors agree.
    Exhaustion gives the full ordered tube. At a tie the accessible germs and previously constructed terms agree
    across the relevant permutations, so the interpolated germs agree as well.
    All leg identities and similarity laws continue by the same uniqueness.
    Finally, the two sides of each split identity have equal boundary distributions when bra and ket are
    separately smeared on the original spacelike patches and approached in strict subcones.
    Uniqueness in their common split tube proves the asserted continuation of the identity.
    Only a local distributional boundary and an open convex approach subcone are needed here;
    no global boundary estimate for arbitrary $L$ products has been assumed. ◻
]

#thm([Lemma 7.4.])[
  (Comparison with the single-insertion forms).  #emph[The analytic pairs $L V \, V L \, J V \, V J \, t V \,
    V t$ agree, when paired with an ordinary physical polynomial bra,
    with the corresponding insertions of the tempered single-$L$ forms of Proposition 23.]
] <P:single-comparison>

#proof[
  First take a finite sum of factorized compact physical bra words and translate it into a common opposite cone.
    Its affiliated bounded truncations can be used as $C$ in (7.5).
    With $L$ first, the adjoints of these truncations acting on an ordinary smeared $V
    Omega$ converge on the polynomial domain. Locality of the single-insertion forms therefore gives equality on
    an open real spacelike patch. For a compact joint bra kernel,
    approximate by factor tests in the permitted smooth topology, preserving the opposite-cone margin.
    Continuity of the vacuum and adjoint-vacuum graph vectors and of the single-insertion distributions extends
    this equality to that kernel. Give bra and pair strictly separated ordered imaginary translations.
    The known single-insertion spectral cones give analyticity in the two pair arguments and the common
    translation of the bra, with its internal spectator tests fixed.
    Analytic uniqueness extends the equality, and one may remove the separate bra damping while keeping the pair
    damped. The other pairs follow from their linear differential definitions. ◻
]

=== 7.2 The Ward rows and the alternating exception <the-ward-rows-and-the-alternating-exception>

The vector construction supplies finite transformation identities for products formed from the accessible entries.
  To obtain the canonical Ward identity for each interpolated entry separately,
  we must recover every row of the triangular system mixing $V$ and $L$.
  The possible four-slot alternating term is the one case not removed by the square-free interpolation argument;
  its elimination uses the purely timelike spectrum of the last scalar wave.

#thm([Proposition 7.5.])[
  (Conformal covariance of the short scalar functions).  #emph[All scalar vacuum functions $W$ of total length at
    most four obey the infinitesimal conformal Ward identities, with $L \, S \, J \, t$ primary of weights $2 \,
    2 \, 3 \, 4$ and spins $0 \, 0 \, 1 \, 2$, respectively. The laws for $V \,
    T$ are their derivative laws from (7.1).]
] <P:short-covariance>

#proof[
  Fix the $t$ and $S$ positions. At the remaining $m_0 lt.eq
    4$ positions start with polarized vectors $V \( e_j \)$, and let $W_I$ be the function obtained by replacing
    the positions in $I$ by $L$. The canonical special-conformal Ward operator $hat(K)_a$ acts diagonally by the
    primary differential actions and has off-diagonal part
  #[#set math.equation(numbering: n => "(7.8)")
   $ \( hat(K)_a W \)_I \|_(upright("off")) = 4 sum_(j in.not I) \( a dot.op e_j \) W_(I union { j }) .
     $ <P:ward-off-diagonal>]
  These operators commute: they are the canonical commuting special transformations of primaries and their
    derivatives. They may be centered at $o$, since the difference from another center is an affine Ward operator,
    already zero on every row.
  Unitarity and the expansion in Proposition 42 give
  #[#set math.equation(numbering: n => "(7.9)")
   $ \( e^(s hat(K)_n) W \)_diameter = W_diameter $ <P:null-row>]
  for small $s$ and the open family of null $n$. Initially the tensor positions contain $T$.
    Induct in their number, substitute $T = t + cal(P)_0 L$, and subtract terms with fewer $t$ positions,
    whose covariance is already established. This gives (7.9) with the indicated $t$ positions.
  Write $X_I \( a \) = \( hat(K)_a W \)_I$. Differentiating (7.9) once and using the linear span of the open null
    family gives $X_diameter \( a \) = 0$ for every $a$. Suppose that $X_I = 0$ when $\| I \| < k$.
    Commuting two Ward operators on a row $H$ of size $k - 1$ and differentiating (7.9) $k + 1$ times give,
    respectively,
  #[#set math.equation(numbering: n => "(7.10)")
   $ sum_(j in.not H) z_j \( a \) X_(H union { j }) \( b \) & =
     sum_(j in.not H) z_j \( b \) X_(H union { j }) \( a \) \,\
sum_(\| I \| = k) z_I \( n \) X_I \( n \) & = 0 \, $ <P:row-symmetry>]
  where $z_j \( a \) = a dot.op e_j$ and $z_I = product_(j in I) z_j$.
    Indeed all diagonal differentiations of already zero rows vanish;
    the first surviving paths through the triangular off-diagonal array are exactly the $k !$ orders of adding the
    same $k$ indices. The common nonzero factors $4$ and $k !$ have been canceled.
  Complete a generic set of polarizations to a basis and write $X_I \( a \) = sum_(h = 1)^4 z_h \( a \) x_(I h)$.
    Equation (7.10) says that, for each $H$, the matrix with rows outside $H$ equal to $x_(H union { j } \, h)$
    and its other rows zero is symmetric. If $k gt.eq 2$, choose $H = I \\ { j }$.
    For $h in I$ choose $j eq.not h$; its zero row kills $x_(I h)$.
    A completed-basis row $h > m_0$ likewise kills that entry.
    For $h in.not I$, symmetry identifies all the surviving entries with a coefficient $c_(I union { h })$,
    depending only on the union. Thus (7.10) becomes
  #[#set math.equation(numbering: n => "(7.11)")
   $ \( k + 1 \) sum_(\| B \| = k + 1) c_B z_B \( n \) = 0 . $ <P:square-free-ward>]
  The square-free independence proved in Lemma 41 kills every coefficient,
    including the case where there is no such union.
  For $k = 1$, (7.10) instead gives a symmetric matrix. Its quadratic form vanishes on the null cone,
    so it equals a scalar multiple of the metric quadratic. If $m_0 < 4$,
    its zero completed-basis rows force that multiple to vanish. If $m_0 = 4$, let $G_(i j) = e_i dot.op e_j$.
    The coefficient matrix is $beta G^(- 1)$, which says
  #[#set math.equation(numbering: n => "(7.12)")
   $ X_({ i }) \( e_j \) = beta delta_(i j) . $ <P:exception-evaluation>]
  The function $beta$ is multilinear in all four polarizations:
    row $i$ is independent of $e_i$, and evaluation on $e_i$ restores its linear factor.
    It vanishes when two polarizations coincide, by (7.12) and continuity from generic choices.
    It is therefore alternating. The sole possible exception is
  #[#set math.equation(numbering: n => "(7.13)")
   $ X_({ i }) \( a \) =
     lambda thin epsilon.alt \( e_1 \, dots.h \, e_(i - 1) \, a \, e_(i + 1) \, dots.h \, e_4 \) .
     $ <P:alternating-exception>]
  Here there are exactly four $V \/ L$ positions and no other entries.
    Divergence in position $i$ of $X_diameter = 0$ also gives
  #[#set math.equation(numbering: n => "(7.14)")
   $ square.stroked_i X_({ i }) = 0 . $ <P:exception-harmonic>]
  For clarity, the canonical array preserves the relation $partial dot.op V = square.stroked L$:
    its difference is the divergence of the primary dimension-three vector $J$,
    whose divergence transforms homogeneously. This is the intertwining identity used in deriving (7.14).
  We eliminate (7.13) using its last position, $i = 4$. Smear the first three positions on a real mutually
    spacelike patch, keeping the last argument in the future tube.
    Split the scalar function into the triple bra and the one-wave ket.
    Its boundary in the first three positions is obtained from negative ordered bra dampings.
    Move the center of the generator sufficiently far to the future of these compact supports;
    affine covariance leaves $X$ unchanged. The last-position canonical differential action on $L$ is exactly the
    canonical generator applied to $l \( z_4 \)$. The ordinary physical triple $V V
    V$ bra belongs to the domains of these centered actual $K_n$ by Lemma 26.
    Moreover $Pi$ reduces these generators and their actions on $Pi$ are canonical by Theorem 27.
    Projecting the bra to $Pi$ thus allows the last-position generator to be moved to the fixed bra.
    Linear combinations of the available null parameters span arbitrary $a$.
  Every other term of the smeared $X_({ 4 }) \( a \)$ pairs the unchanged last wave with a fixed constructed
    triple bra, possibly differentiated or with replacements.
    Consequently the whole expression is $⟨eta \, l \( z_4 \)⟩$ for a fixed Hilbert vector $eta$,
    with no coordinate multiplier left on the last wave. Its translation spectrum is purely timelike,
    since that of $l$ is. Equation (7.14) says that this spectrum is supported on $p^2 = 0$;
    these disjoint supports force it to vanish. More explicitly,
    after any fixed future damping it is a finite spectral pairing,
    and multiplication by $p^2$ kills it only if that pairing is zero off the null shell.
    There is no shell or zero-momentum component of $l$. Boundary uniqueness in the first three arguments and
    generic polarization then give $lambda = 0$.
  The induction on $k$ is now complete, followed by the induction in the number of $t$ positions.
    This proves every row of the canonical Ward system. ◻
]

=== 7.3 Euclidean continuation and the residual at infinity <euclidean-continuation-and-the-residual-at-infinity>

Wick coordinates are $\( tau \, bold(r) \) mapsto i tau e + bold(r)$.
  Sort points by increasing $tau$ and use the tie neighborhoods when heights coincide.
  A distinct Euclidean configuration has only spacelike equal-height ties,
  so the resulting scalar functions are real analytic on the full distinct-point configuration space.
  Use complex-linear tensor pullback with basis $C_0 = i e$ and real spatial bases $C_j$. The identities become

#[#set math.equation(numbering: n => "(7.15)")
 $ V = J + partial L \, wide T = t + 1 / 3 \( delta partial^2 - partial partial \) L . $ <P:euclidean-identities>]

Here $partial^2$ is the Euclidean Laplacian. Integrating the Ward identities along nonsingular local conformal
  flows gives their finite covariance, with reordering through tie neighborhoods as required.

For a scalar primary $A$ of dimension two define

#[#set math.equation(numbering: n => "(7.16)")
 $ W \( A_oo thin dots.h.c \) = lim_(R arrow.r oo) R^4 W \( A \( R u \) thin dots.h.c \) \, wide \| u \| =
   1 . $ <P:infinity-definition>]

The limit exists and has the primary transport law. To verify this,
  choose a Euclidean special-conformal transformation carrying infinity to a finite point disjoint from the
  spectators. Join it to the identity by a flow whose pole ray avoids the finite set of points,
  including the moving large point. At the final transformation every argument is distinct and finite,
  so ordinary local analyticity and the weight-two factor give the limit.
  This argument is uniform on small complex neighborhoods of strictly time-ordered spectator configurations and
  proves locally holomorphic convergence there. It also proves independence of the direction in (7.16).

#thm([Proposition 7.6.])[
  (Residual infinity decoupling).  #emph[For the residual scalar $ell = L - S$,
#[#set math.equation(numbering: n => "(7.17)")
 $ W \( ell_oo O_1 dots.h.c O_j \) = 0 \, wide O_i in { S \, V \, T } \, wide j lt.eq 3 \, $ <P:accessible-decoupling>]

 at all distinct Euclidean points, also after differentiating any spectator insertion.]
] <P:residual-infinity>

#proof[
  We justify passage from the localized-vector result of Corollary 36 to these products;
    unrestricted timelike real boundaries for accessible products are unnecessary.
    For a real vector localized in a fixed line diamond, the projected Paley multiplier in that Proposition has
    zero value at energy zero. The same local Paley bound controls its first derivative there.
    Thus it is $O \( E \) ∥xi∥$ at low energy. Integrating with the weight-two energy powers against $e^(- R E)$
    in the measure $upright(d) E \/ E$, and using exponential damping beyond a fixed energy, gives
  #[#set math.equation(numbering: n => "(7.18)")
   $ R^4 lr(|⟨ell \( i R e \) \, xi⟩|) lt.eq C R^(- 1) ∥xi∥ \, wide R gt.eq 1 . $ <P:infinity-rate>]
  For complex localized operator data the right side is bounded by the sum of the vacuum and adjoint-vacuum norms.
    Consequently the estimate passes to mutually spacelike accessible products in that diamond by the two
    bounded-approximation limits of Proposition 38.
  Choose tests on small patches about equal-time mutually spacelike points and continue their translations a short
    distance into strictly increasing imaginary time. Before using the improved real-edge estimate,
    the corresponding smeared pairing multiplied by $R^4$ is $O \( R^2 \)$ uniformly up to a smaller good real
    patch: the one-wave norm is $O \( R^(- 2) \)$ and the smeared product bounds are uniform there.
    Apply the subharmonic logarithmic estimate on a half-disk with this real edge.
    If its harmonic measure at an interior point is $omega$, the bound becomes
    $O \( R^(- omega + 2 \( 1 - omega \)) \) = O \( R^(2 - 3 omega) \)$.
    There is an interior open set with $omega > 2 \/ 3$, and hence convergence to zero on that set.
    The positive imaginary times can be fixed before further shrinking the source tests.
    On its strict Euclidean configurations (7.16) already converges locally holomorphically.
    Small real source offsets therefore commute with that limit.
    Unsmeared uniqueness gives (7.17) on an open set, and real analyticity continues it to every distinct
    configuration. Derivatives follow from the same locally holomorphic identity. ◻
]

=== 7.4 The pair representation and normalized fluxes <the-pair-representation-and-normalized-fluxes>

The four-point split identities now supply a Hilbert-space conformal action on pairs.
  Its normalized current fluxes will control the possible singular terms in the radial argument below.

#thm([Proposition 7.7.])[
  (Conformal representation on the pair space).  #emph[Let $cal(H)_(lt.eq 2)$ be the closed span of $Omega$ and
    the one- and two-insertion tube vectors for $L \, S \, J \, t$.
    There is a strongly continuous unitary representation of the universal cover of the connected conformal group
    on this space, with the canonical local primary transformations.
    Translations coincide with the actual positive-energy translations.
    Its timelike special-conformal generator $K_e^(upright("rep"))$ is nonnegative.]
] <P:pair-representation>

#proof[
  For each length restrict its arguments to a relatively compact open box in its tube.
    These vectors span a dense subspace: a vector orthogonal to them gives a holomorphic scalar function zero on
    an open set, and hence zero throughout the tube. For all sufficiently small real conformal transformations,
    map these vectors by their primary transformation laws. The resulting inner products are unchanged by the
    split identities of Proposition 42 and the integrated scalar Ward identities of Proposition 44.
    Total length four is exactly what is needed for pair–pair inner products.
    The image is dense by the same open-box argument; thus the map extends to a unitary.
    On smaller boxes the local composition identity is exact.
    Holomorphic point dependence gives strong continuity. Continuing these local unitaries along paths integrates
    the action to the universal cover.
  Uniqueness extends the local laws to all tube points and, for sufficiently small transformations,
    to Euclidean configurations in the positive-time half-space. The point vectors there are smooth group vectors.
    On translations the construction agrees with the actual translation action, whose spectrum is future directed.
    The time-Möbius subgroup conjugates its positive time-translation generator to $K_e^(upright("rep"))$,
    proving the final assertion. No conformal action on the full physical Hilbert space is asserted here. ◻
]

For a target $A \( y \)$ in the positive Euclidean time half-space let $Sigma$ be a small outward-oriented sphere
  about $y$, wholly within that half-space. Define Hilbert-valued fluxes from the analytic pair vectors by

#[#set math.equation(numbering: n => "(7.19)")
 $ F_J \( A \; y \) = integral_Sigma upright(d) Sigma^a thin Psi \[ J_a \( x \) A \( y \) \] \, wide
   F_X^t \( A \; y \) = integral_Sigma upright(d) Sigma^a thin X^b \( x \) Psi \[ t_(a b) \( x \) A \( y \) \] .
   $ <P:flux-definition>]

At each point of the sphere use the Euclidean order, with the tie germs providing the transitions.
  There is no factor of the sphere area in (7.19). Conservation and tracelessness make the corresponding
  holomorphic flux forms closed off the target, so the contour may be deformed,
  or held fixed when differentiating the target nearby. If one instead rescales both currents’ fluxes by a common
  conventional constant, the constant $c$ below rescales with them.

#thm([Proposition 7.8.])[
  (Short-length Ward fluxes).  #emph[With one consistent nonzero Ward normalization $c$,
#[#set math.equation(numbering: n => "(7.20)")
 $ F_J \( A \) & = 0 \, & A & = V \, L \, J \,\
F_(partial_b)^t \( A \) & = c thin partial_b A Omega \, & A & = V \, L \, J . $ <P:J-flux>]

 For primary targets $L \, J$ and every conformal Killing field $X$,
#[#set math.equation(numbering: n => "(7.21)")
 $ F_X^t \( A \) = c thin delta_X A Omega . $ <P:conformal-flux>]

 Here $delta_X$ is the canonical differential action, including spin and weight.
   In particular, a special transformation centered at the target has zero flux,
   while centered dilation about $L$ gives $2 c L Omega$. With outward orientation in (7.19),
   Wick time basis $C_0 = i e$, the convention $i \[ P_nu \, A \] = partial_nu A$,
   and upper-minus-lower order $A t - t A$ in the cap difference, one has $c = - 1$.]
] <P:flux-wards>

#proof[
  First take $A = V$ and pair with an arbitrary ordinary physical polynomial bra.
    Lemma 43 identifies the analytic pairs with tempered single-insertion forms.
    Deform $Sigma$ to a cylinder whose relative Euclidean time caps are $plus.minus
    delta$ and whose spatial disk has radius $a$. Give the whole relative time a small real Minkowski shift $s$,
    with $\| s \| < a$. The shifted contour remains in the holomorphic domains;
    where the imaginary relative time crosses zero on the side,
    strict spatial separation and tie gluing provide a common neighborhood.
  Average smoothly and with integral one over $a$ and $s$, keeping the shift support strictly inside $\| s \| <
    a$. The side contribution tends to zero as $delta arrow.b
    0$ because it lies on a compact nonsingular spacelike set and its time thickness tends to zero.
    The two caps now have smooth Cauchy-slab tests and converge to the opposite Lorentzian order boundaries at a
    common target damping. This use of the single-insertion boundary is legitimate even at a point in the common
    complex target translation: its total pair momentum is exponentially damped,
    while the smooth relative test decays rapidly in the relative momentum.
    The difference is the commutator charge with the time average and a spatial cutoff equal to one on its causal
    support. The $J$ charge is zero by Proposition 28; the translation charge of $t$ is the original translation
    charge by Section 5. They give (7.20)–(7.20) for $V$.
  The Wick time component contributes $i$, and the tensor translation index contributes the pullback $C_b^nu$.
    With the order and charge convention in the statement, $i \[ V \, P_b \] = - partial_b V$, hence $c = - 1$.
    This calculation fixes one common normalization for all components and all subsequently transported Killing
    fields. Pairing with the dense polynomial bras proves equality of the Hilbert vectors.
  A constant-current flux around a primary target extends to a holomorphic single-wave function of its Minkowski
    argument throughout the future tube: choose a relative sphere smaller than its common damping.
    Translation covariance makes it a translation wave; dilations give its flux dimension.
    Small Lorentz transformations act on the pair and its contour;
    homotopy of the transformed contour back to a small sphere gives the tensor transformation.
    Differentiate the identities for $V$ in its target index and use $partial dot.op V =
    square.stroked L$ while keeping the enclosing contour fixed. One obtains the homogeneous wave equation for both
  #[#set math.equation(numbering: n => "(7.22)")
   $ F_J \( L \) \, wide F_(partial_b)^t \( L \) - c thin partial_b L Omega . $ <P:harmonic-flux-defects>]
  These are, respectively, a scalar wave of dimension two and a vector wave of dimension three.
    Translation covariance and positive-energy holomorphy realize their values after any fixed future damping as
    vacuum spectral amplitudes; further damping agrees by uniqueness.
    Their wave equation confines their spectrum to $p^2 = 0$.
    Scale covariance excludes a zero-momentum amplitude, and the light-cone boost-weight test of Section 2
    excludes the nonzero shell: in these cases $d - 1 > max omega$ for the finite Lorentz multiplet.
    Only local finiteness after exponential damping is needed for that test. Thus both defects vanish.
    Subtraction of $partial L$ from $V$ proves the identities also for $J$.
  For $A = L \, J$, conjugate the translation identity by any sufficiently small real conformal transformation in
    Proposition 46. Since $t$ is a conserved traceless primary of dimension four,
    its flux transforms exactly to the flux for the pushed-forward vector field:
    three surface powers, one vector-field power, and the two orthogonal index factors cancel its weight.
    Deform the transformed sphere back locally. The target primary factors are invertible,
    and the differential action on the right transforms by the same Lie algebra adjoint action.
    Translations and all their such adjoints span the conformal Lie algebra (successive conformal brackets give
    rotations, dilations and special transformations). Linearity and complexification give every Euclidean
    conformal Killing field and prove (7.21). ◻
]

The flux laws remain valid inside scalar Euclidean functions up to the available split length,
  with exterior spectators, including $ell_oo$. First place those spectators earlier than the whole pair by a
  Euclidean time plane and use the split identity, representing infinity first by a large negative-time insertion.
  Then continue in the distinct spectator and target positions, choosing a smaller contour where necessary.
  One immediate consequence is

#[#set math.equation(numbering: n => "(7.23)")
 $ W \( ell_oo J_a \( x \) L \( y \) \) = 0 . $ <P:ell-J-L>]

Indeed rotations, translations and dilations give the only possible form $d \( x - y \)_a \/ \| x - y \|^4$.
  Its $J$ flux about $L$ is $d \| S^3 \|$, and (7.20) makes $d = 0$.
  Primary covariance transports this vanishing to any placement of the infinity insertion.

We now have the pair representation and current flux identities with one fixed normalization.
  The remaining argument turns radial singularities of short functions into spectral statements on that pair
  space. Only the representation classifications at energies zero, one and two will be needed for this step,
  so the analysis does not require a discrete expansion of all radial states.

=== 7.5 Radial Hilbert calculus and its low energies <radial-hilbert-calculus-and-its-low-energies>

The function to be tested is $W \( ell_oo ell \( x \) V_mu \( y \) V_nu \( z \) \)$.
  Residual infinity decoupling will make it harmonic in $x$.
  We will identify each singular radial power with an actual low-energy spectral projection on the pair space.
  The low-energy bounds and a Maxwell test leave only dipoles;
  a tangential reflection then removes those dipoles from a positive pair norm.
  The resulting norm bound eliminates the remaining low-energy overlaps,
  and the normalized current fluxes will finally test the residual scalar’s own norm.
  The following calculus supplies these spectral and positivity statements without a complete expansion into
  radial eigenstates.

Write a Euclidean point as $y = \( y_0 \, bold(y) \)$. The conformal map

#[#set math.equation(numbering: n => "(7.24)")
 $ c_(upright("ball")) \( y \) = frac(\( 1 - \| y \|^2 \, thin 2 bold(y) \), 1 - 2 y_0 + \| y \|^2) $ <P:ball-map>]

takes the unit ball to the positive-time half-space. Define radial one- and two-insertion kets by primary pullback
  of the corresponding half-space vectors; obtain descendants by differentiation.
  Radial adjunction reflects $y$ to $I y = y \/ \| y \|^2$ with its full tensor and weight factors.
  Indeed direct substitution in (7.24) gives
  $c_(upright("ball")) \( I y \) = \( - c_(upright("ball")) \( y \)_0 \, c_(upright("ball")) \(
  y \)_(upright("spatial")) \)$, exactly Wick reflection. Scalar covariance therefore identifies radial splitting
  with Hilbert adjunction. To transport arbitrary separated interior and exterior groups,
  each of size at most two, join the required proper Euclidean conformal transformations by paths avoiding poles
  on the finite point set. A pole condition has codimension four,
  so such paths can be chosen after a small perturbation. Points at infinity are reached by (7.16).
  In particular the radial ket $\| ell chevron.r = \| ell \( 0 \) chevron.r$ has bra $ell_oo$.

On the pair representation put

#[#set math.equation(numbering: n => "(7.25)")
 $ H = 1 / 2 \( P_e + K_e^(upright("rep")) \) . $ <P:radial-H>]

This is the self-adjoint compact-time generator on the covering group.
  Its derived-generator identity holds on group-smooth vectors, a core for this generator.
  Both terms on the right are positive, so $H gt.eq 0$. The real Minkowski vector field of $H$,
  in Wick half-space coordinates, is $i \( \( tau^2 - \| bold(r) \|^2 - 1 \) \/ 2 \, tau bold(r) \)$.
  The derivative of (7.24) takes $i y$ to this field. Thus positivity and analytic continuation of the local group
  law give

#[#set math.equation(numbering: n => "(7.26)")
 $ r^H \| A_1 \( y_1 \) dots.h.c A_p \( y_p \) chevron.r =
   r^(d_1 + dots.h.c + d_p) \| A_1 \( r y_1 \) dots.h.c A_p \( r y_p \) chevron.r \, quad 0 < r lt.eq 1 \, quad
   p lt.eq 2 . $ <P:radial-contraction>]

One first continues through a short contraction, where both analytic laws apply,
  and then iterates through interior configurations. Radial rotations act unitarily with the usual $S
  O \( 4 \)$ tensor law.

The real-form involution on complex radial transformations is complex conjugation followed by conjugation with
  $I$. Write $p_a^(+) \, p_a^(-)$, $H \, M_(a b)$ for the derived actions corresponding, respectively,
  to radial translation, $2 y_a y - \| y \|^2 e_a$, dilation, and $y_a e_b - y_b e_a$. On smooth vectors,

#[#set math.equation(numbering: n => "(7.27)")
 $ \( p_a^(+) \)^dagger = p_a^(-) \, wide \[ H \, p_a^plus.minus \] = plus.minus p_a^plus.minus \,
   wide \[ p_a^(-) \, p_b^(+) \] = 2 delta_(a b) H + 2 M_(a b) . $ <P:radial-algebra>]

These are active-point conventions. For example, $M_(a b) \| A_d chevron.r = delta_(a d) \| A_b chevron.r -
  delta_(b d) \| A_a chevron.r$ at the origin. Inversion takes translations to negative special transformations,
  giving the displayed matrix adjunction.

The positivity calculation below is the low-energy part of the four-dimensional conformal unitarity-bound method
  of Mack #cite(label("Mack1977")); see also the level-one Gram-matrix derivation in #cite(label("Minwalla1998"))
  Section 2.5. We give the required finite-array calculation on the present pair representation,
  including its smooth-density justification.

#thm([Lemma 7.9.])[
  (The required low radial energies).  #emph[The $H = 0$ eigenspace is a trivial representation.
    The $H = 1$ eigenspace has only scalar rotation types. At $H = 2$,
    among the types in a tensor product of two vectors, only scalars and antisymmetric two-forms can occur.
    Every smooth antisymmetric energy-two array obeys
#[#set math.equation(numbering: n => "(7.28)")
 $ sum_a p_a^(+) \| F_(a b) chevron.r = 0 \, wide sum_a p_a^(+) \| \( * F \)_(a b) chevron.r =
   0 . $ <P:Maxwell-null-vectors>]

 No discreteness of the full radial spectrum is required.]
] <P:radial-low-energy>

#proof[
  We specify the smooth-density issue first. The element $Z = e^(2 pi i H)$ is central,
    since its adjoint action on the conformal Lie algebra is the identity by (7.27).
    Its fixed subrepresentation contains every integer $H$ eigenspace.
    The projection onto that subrepresentation commutes with the group,
    preserves smooth vectors and has dense smooth image. There the spectrum of $H$ is supported on the integers, and
  #[#set math.equation(numbering: n => "(7.29)")
   $ E_H \( { h } \) v = frac(1, 2 pi) integral_0^(2 pi) e^(i t \( H - h \)) v thin upright(d) t
     $ <P:integer-projection>]
  preserves smoothness. Averaging also over the compact rotations gives dense smooth vectors in each rotation type
    and dense smooth finite tensor-equivariant arrays. Rotations descend to $S O \( 4 \)$,
    since their action on the dense radial kets is the ordinary tensor action.
    The computations below therefore extend by density to the stated eigenspaces.
  At zero energy the expectations of both positive terms in (7.25) vanish.
    They annihilate a smooth zero-energy vector. The translation spectrum cone then makes every translation
    generator annihilate it, and the conjugate cone makes every special partner annihilate it.
    Their brackets annihilate it as well, proving triviality.
    If $H v = v$, lowering has energy zero and $⟨w \, p_a^(-) v⟩ = ⟨p_a^(+) w \, v⟩ =
    0$ for every zero-energy $w$; hence $p_a^(-) v = 0$.
  For any smooth lowest array of energy $h$, raising norms give
  #[#set math.equation(numbering: n => "(7.30)")
   $ ∥sum_a p_a^(+) v_a∥^2 = 2 sum_(a \, b) ⟨v_a \, \( h delta_(a b) + M_(a b) \) v_b⟩ gt.eq 0 . $ <P:raising-Gram>]
  A two-by-two plane-rotation block gives $\| m \| lt.eq h$ for each plane weight.
    An $S O \( 4 \)$ tensor type has two $S U \( 2 \)$ spins $j_(+) \, j_(-)$, their sum an integer,
    with maximal plane weight $j_(+) + j_(-)$. At $h = 1$ only scalars,
    vectors and the two chiral two-form types survive this test. The divergence arrays exclude the last two.
    In detail, the tensor index rotation rule gives
  #[#set math.equation(numbering: n => "(7.31)")
   $ sum_b M_(a b) \| A_b chevron.r & = - 3 \| A_a chevron.r \,\
sum_c M_(a c) \| F_(c b) chevron.r & = - 3 \| F_(a b) chevron.r - \| F_(b a) chevron.r +
  delta_(a b) sum_c \| F_(c c) chevron.r . $ <P:vector-Gram>]
  The matrix eigenvalues in (7.30) are therefore $- 3$ for the vector divergence, $-
    4$ for a symmetric traceless rank-two divergence, and $- 2$ for an antisymmetric rank-two divergence.
    Their positivity bounds are $h gt.eq 3 \, 4 \, 2$, respectively. At $h = 1$ this leaves only scalars.
  At $h = 2$ the types in two vectors are even under the central radial rotation $y mapsto - y$.
    Their lowered arrays are odd but would have to belong to the scalar-only energy-one space,
    so they are lowest arrays. The $- 4$ bound excludes the symmetric traceless type.
    The antisymmetric bound is saturated and makes the first norm in (7.28) zero.
    Apply the same argument to the Hodge dual, which intertwines rotations, to obtain its second identity.
    This proves exactly the needed low-energy statements without an expansion in a complete family of local operators. ◻
]

#thm([Lemma 7.10.])[
  (The exterior Maxwell test).  #emph[An antisymmetric energy-two radial array has zero exterior overlap with the
    pair $ell_oo \, V_nu \( z \)$, with $z$ outside the radial ball.]
] <P:Maxwell-exterior>

#proof[
  Let $B_nu \( z \)$ be the reflected ket of this exterior data; it is a smooth pair vector.
    Its exterior translation and similarity laws, including the full derivative reflection of $V$, are
  #[#set math.equation(numbering: n => "(7.32)")
   $ partial_(z^a) B_nu = - p_a^(-) B_nu \, wide \( z dot.op partial + 1 \) B_nu = - H B_nu . $ <P:exterior-laws>]
  Translation fixes the insertion at infinity; reflection changes its generator to the lowering generator with the
    indicated sign. For the second formula the exterior vector contributes weight $-
    6$ and the reflected interior pair dimension five, giving total degree $- 1 - H$.
    These statements need only similarity covariance of $V$.
  For a smooth Maxwell array, set $Q_(nu a b) \( z \) = ⟨B_nu \( z \) \, F_(a b)⟩$.
    Equations (7.28) and (7.32) make $Q$ homogeneous of degree $- 3$ and make it and its Hodge dual in $a \,
    b$ divergence-free. Rotation covariance and antisymmetry leave precisely
  #[#set math.equation(numbering: n => "(7.33)")
   $ Q_(nu a b) = A thin \| z \|^(- 4) \( delta_(nu a) z_b - delta_(nu b) z_a \) +
     B thin \| z \|^(- 4) epsilon.alt_(nu a b d) z_d . $ <P:Maxwell-tensors>]
  For $n = z \/ \| z \|$, the divergence of the first tensor is $\| z \|^(- 4) \( delta_(nu b) - 4 n_nu n_b \)$,
    while that of the second is zero. Hence $A = 0$. Hodge duality interchanges these tensors up to orientation
    sign, so dual divergence gives $B = 0$. Dense smooth arrays in the energy-two rotation types and continuity of
    the fixed exterior pairing prove the general assertion. ◻
]

=== 7.6 Harmonic removal of the residual <harmonic-removal-of-the-residual>

Consider the short Euclidean scalar function

#[#set math.equation(numbering: n => "(7.34)")
 $ G_(mu nu) \( x \; y \, z \) = W \( ell_oo ell \( x \) V_mu \( y \) V_nu \( z \) \) \, wide x \, y \,
   z upright(" distinct") . $ <P:G-definition>]

By (7.17) and the leg identities,

#[#set math.equation(numbering: n => "(7.35)")
 $ partial_x^2 G = 0 \, wide partial_(x^a) G_(mu nu) = - W \( ell_oo J_a \( x \) V_mu \( y \) V_nu \( z \) \) .
   $ <P:G-harmonic>]

For the second equation use $partial ell = V - J - partial S$; the accessible terms vanish.
  For the first, $partial^2 ell = Theta - partial^2 S$, whose two terms likewise vanish in this correlation.

For fixed $y \, z$, $G$ is bounded as $\| x \| arrow.r oo$.
  To see the quantitative bound, transport the two scalars colliding at infinity by a proper spherical inversion,
  adjusted by a reflection, to a finite radial ball, placing the vector pair exterior.
  The separation $r'$ of the inner scalar pair is comparable to $\| x \|^(- 1)$.
  Its norm is at most $C \( r' \)^(- 4)$ by (7.26) and $H gt.eq 0$,
  starting from a fixed inner radius uniformly in angle. The scalar inversion factor of the moving point is
  $O \( \| x \|^(- 4) \)$, and cancels this bound. The fixed exterior pair has finite norm, proving boundedness.

We next determine the possible singularities at the two finite points $y$ and $z$.
  Harmonicity gives two radial powers in each spherical harmonic.
  Pair-space positivity will identify a singular power with an actual low-energy spectral projection;
  the preceding representation and flux results can then test that projection.

Project the harmonic function onto a spherical harmonic of degree $q$ about $y$.
  With $r = \| x - y \|$, its radial coefficient has the form

#[#set math.equation(numbering: n => "(7.36)")
 $ g_q \( r \) = A_q r^q + D_q r^(- q - 2) . $ <P:harmonic-coefficient>]

Choose a small radial ball centered at $y$, let $v_q$ be the harmonic projection of the inner pair ket $\|
  ell \( y + r_0 n \) V_mu \( y \) chevron.r$ at fixed $r_0$, and let $B$ be the fixed exterior ket.
  The contraction identity gives

#[#set math.equation(numbering: n => "(7.37)")
 $ r^5 g_q \( r \) = r_0^5 ⟨B \, \( r \/ r_0 \)^H v_q⟩ . $ <P:harmonic-spectral>]

The spectral pairing $mu \( E \) = ⟨B \, E_H \( E \) v_q⟩$ is a complex measure of finite total variation,
  at most $∥B∥ ∥v_q∥$. Thus the right side is a Laplace transform of a finite measure on $\[ 0 \, oo \)$.
  The two powers on the left have exponents $q + 5$ and $3 - q$.
  If $q > 3$, boundedness of this transform at $r = 0$ kills $D_q$.
  Otherwise uniqueness of finite-measure Laplace transforms identifies $D_q$ with the actual point spectral
  projection at energy $3 - q$. One can verify uniqueness by setting $u = e^(- h)$:
  all integer Laplace parameters give the polynomial moments on $\[ 0 \, 1 \]$,
  which determine the finite measure. In particular, a continuous spectral component cannot imitate the singular
  power in (7.36).

The projected array transforms in $cal(Y)_q ⊗ upright(bold(4))$,
  where $cal(Y)_q$ is the degree-$q$ harmonic representation.
  At $q = 3$ the possible energy is zero, and at $q = 2$ it is one.
  Only scalars occur there by Lemma 48, whereas $cal(Y)_q ⊗ upright(bold(4))$ contains a scalar only for $q = 1$.
  Both coefficients therefore vanish. At $q = 1$ the energy is two;
  the possible types are the scalar and Maxwell two-forms. The latter have zero exterior overlap by Lemma 49.
  The unique scalar intertwiner leaves precisely a dipole parallel to the vector index.
  The remaining $q = 0$ monopole is killed by integrating (7.35) over a small sphere about $y$:
  $F_J \( V \) = 0$, whereas the radial derivative of $D_0 r^(- 2)$ has flux $- 2 \| S^3 \| D_0$. Repeat at $z$.

Convergent harmonic expansions on punctured-ball annuli now show that subtraction of these two dipoles removes
  both singularities. The remainder is entire and bounded at infinity, hence constant in $x$. We have proved

#[#set math.equation(numbering: n => "(7.38)")
 $ G_(mu nu) \( x \; y \, z \) = D_nu \( y \, z \) frac(\( x - y \)_mu, \| x - y \|^4) +
   tilde(D)_mu \( y \, z \) frac(\( x - z \)_nu, \| x - z \|^4) + C_(mu nu) \( y \, z \) . $ <P:G-decomposition>]

The constant is the limit at $x$ infinity, so its similarity laws are immediate:
  it depends only on $y - z$ and is homogeneous of degree $- 6$.

The only possible finite singularities are now the two displayed dipoles.
  A tangential polarization kills them simultaneously after placing the two vector points at inverse radial
  positions. This choice turns the bounded remainder into a bound on a genuine pair norm,
  which excludes its low radial energies.

Take radial center $x = 0$, choose $\| u \| = 1$, put $y = u \/ r$, $z = r u$,
  and contract both vector indices with a fixed $w perp u$.
  Both dipoles in (7.38) vanish, and its last term is $O \( r^6 \)$.
  For clarity, the full radial reflection law for $V = J + partial L$ is

#[#set math.equation(numbering: n => "(7.39)")
 $ V_mu \( x \)^dagger = \| x \|^(- 6) R_(mu nu) \( x \) V_nu \( I x \) - 4 x_mu \| x \|^(- 6) L \( I x \) \, wide
   R_(mu nu) = delta_(mu nu) - 2 hat(x)_mu hat(x)_nu . $ <P:V-reflection>]

The second term is the derivative of $\| x \|^(- 4)$ in the scalar reflection formula.
  Tangential contraction removes it and leaves $R w = w$. Radial splitting therefore gives

#[#set math.equation(numbering: n => "(7.40)")
 $ parallel thin \| ell \( 0 \) V_w \( r u \) chevron.r thin parallel^2 =
   r^(- 6) G_(w w) \( 0 \; u \/ r \, r u \) = O \( 1 \) . $ <P:tangential-norm>]

This bounds an actual Hilbert norm. If $psi$ is the corresponding ket at a fixed radius $r_0$ and $s = r \/ r_0$,
  contraction gives

#[#set math.equation(numbering: n => "(7.41)")
 $ parallel thin \| ell \( 0 \) V_w \( r u \) chevron.r thin parallel^2 =
   s^(- 10) integral_(\[ 0 \, oo \)) s^(2 h) thin upright(d) ⟨psi \, E_H \( h \) psi⟩ . $ <P:no-low-energy>]

A nonzero spectral mass on $\[ 0 \, 5 - epsilon \]$ would make this at least a positive constant times
  $s^(- 2 epsilon)$, contrary to (7.40). Taking all $epsilon > 0$ excludes the whole spectrum below five,
  in particular overlap with $\| J_rho chevron.r$ at energy three.

Use (7.23) and its conformal transports to remove the $partial L$ part of $V$ in that overlap.
  The remaining three-point function has the similarity form

#[#set math.equation(numbering: n => "(7.42)")
 $ chevron.l J_rho \| ell \( 0 \) J_mu \( z \) chevron.r = \|
   z \|^(- 2) \( a delta_(rho mu) + b hat(z)_rho hat(z)_mu \) . $ <P:ell-JJ-form>]

Tangential testing forces $a = 0$. Its divergence is $\| z \|^(- 3) \( b - 2 a \) hat(z)_rho$,
  so conservation forces $b = 0$. Primary conformal transport yields

#[#set math.equation(numbering: n => "(7.43)")
 $ W \( ell_oo J J \) = 0 . $ <P:ell-JJ>]

Expand the already zero $W \( ell_oo V V \)$ using $V = J + partial L$.
  Equations (7.23) and (7.43) leave the mixed second derivative of $W \( ell_oo L \( y \) L \( z \) \)$ equal to
  zero. Translation covariance makes this a function of $y - z$ with zero Hessian, and its degree $-
  2$ excludes a nonzero affine function. Consequently

#[#set math.equation(numbering: n => "(7.44)")
 $ W \( ell_oo L L \) = 0 . $ <P:ell-LL>]

The residual already decouples from the $J L$, $J J$ and $L L$ three-point functions.
  To test its own scalar norm, we need one more identity involving the stress tensor.
  We first remove the allowed $J t$ tensor structure with a centered special flux,
  and then use a centered dilation flux on the remaining $L t$ function.

It remains to use the stress flux. Write $R = \| z - y \|$ and $n = \( z - y \) \/ R$.
  Rotation and scale covariance, symmetry in $rho \, sigma$,
  and the absence of a nonzero parity-odd symmetric tensor give the general form

#[#set math.equation(numbering: n => "(7.45)")
 $ W \( ell_oo J_mu \( y \) t_(rho sigma) \( z \) \) = R^(- 5) #scale(x: 120%, y: 120%)[\[] & A n_mu
   delta_(rho sigma) + B \( n_rho delta_(sigma mu) + n_sigma delta_(rho mu) \) +
   D n_mu n_rho n_sigma #scale(x: 120%, y: 120%)[\]] . $ <P:ell-Jt-general>]

Trace gives $4 A + 2 B + D = 0$. Vector divergence gives the coefficients $- 2 A + 2 B$ and $- 2 D - 12 B$ of,
  respectively, $R^(- 6) delta_(rho sigma)$ and $R^(- 6) n_rho n_sigma$.
  Thus $A = B = gamma$ and $D = - 6 gamma$, giving

#[#set math.equation(numbering: n => "(7.46)")
 $ W \( ell_oo J_mu \( y \) t_(rho sigma) \( z \) \) = gamma
   R^(- 5) \( n_mu delta_(rho sigma) + n_rho delta_(sigma mu) + n_sigma delta_(rho mu) - 6 n_mu n_rho n_sigma \) .
   $ <P:ell-Jt>]

This also obeys tensor divergence. Take the special vector field centered at $y$, $X_alpha^sigma =
  2 \( z - y \)_alpha \( z - y \)^sigma - R^2 delta_alpha zws^sigma$.
  The contraction of its angular part with the tensor in (7.46) is

#[#set math.equation(numbering: n => "(7.47)")
 $
   n^rho \( 2 n_alpha n^sigma - delta_alpha zws^sigma \) \( n_mu delta_(rho sigma) + n_rho delta_(sigma mu) +
   n_sigma delta_(rho mu) - 6 n_mu n_rho n_sigma \) = - delta_(alpha mu) - 2 n_alpha n_mu . $ <P:special-angular>]

Its sphere average is $- 3 delta_(alpha mu) \/ 2$, since $chevron.l n_alpha n_mu chevron.r =
  delta_(alpha mu) \/ 4$. The field contributes $R^2$ and the area $R^3$, canceling $R^(- 5)$.
  The flux is therefore $- 3 gamma \| S^3 \| delta_(alpha mu) \/ 2$.
  It is zero by (7.21), because a centered special transformation annihilates the primary $J$. Hence $gamma = 0$.

#thm([Theorem 7.11.])[
  (Return of the scalar wave).  #emph[The formal scalar vacuum wave equals the accessible scalar:
#[#set math.equation(numbering: n => "(7.48)")
 $ l = S \, wide ell = 0 . $ <P:return-equation>]

]
] <P:return>

#proof[
  Expand $W \( ell_oo V \( y \) T \( z \) \) = 0$, which is a case of (7.17), using (7.15).
    The $J t$ term has just vanished; the terms with derivatives of $L$ vanish by (7.23) and (7.44).
    What remains is $partial_y W \( ell_oo L \( y \) t \( z \) \) = 0$.
    Translation covariance and homogeneity of degree $- 4$ force that function to be zero.
    Its centered dilation flux around $L$, using (7.21), now gives
  #[#set math.equation(numbering: n => "(7.49)")
   $ 0 = 2 c thin W \( ell_oo L \) . $ <P:final-flux>]
  The energy-slice calculation in Proposition 35 gave $D \( e \) = B \( e \, e \) =
    b$ after excluding the massless contribution. Thus the constant two-point density of $S$ with $l -
    S$ vanishes: the scalar wave channels are orthogonal, not merely their labels on one time slice.
    It follows that $W \( ell_oo L \)$ equals the scalar two-point coefficient $W \( ell_oo ell \)$,
    which is the nonnegative radial norm $∥\| ell chevron.r∥^2$ and is strictly positive for a nonzero scalar
    wave. Since $c eq.not 0$, (7.49) makes that norm zero. Therefore $l = S$. ◻
]

== 8 Real-axis reconstruction and physical conformal currents <sec:reconstruction>

By Theorem 50, the extracted scalar wave is the entire trace polarization: $S = l$.
  In this Section we write $L$ for that accessible entry. Until the joint domain is constructed below,
  this notation denotes its vacuum wave and its analytic products, rather than an operator on arbitrary states.
  In particular, the vacuum-wave division by $M^2$ is never extended to another leg.
  The ingredients from Section 6 are bounded local approximations,
  analytic vector products of every finite length, their reflected Hilbert splittings,
  and gluing at spacelike ties. The leg equation is

#[#set math.equation(numbering: n => "(8.1)")
 $ square.stroked_i W \( dots.h \, L \( x_i \) \, dots.h \) =
   W \( dots.h \, Theta \( x_i \) \, dots.h \) . $ <R:leg-equation>]

The remaining task is to establish joint tempered boundaries, their ordered spectra,
  and affiliation with the original local algebras.

The construction has three stages. First, we obtain real-axis boundaries for pure scalar products and then for
  every mixed ordering. Second, their Hilbert splittings provide a common invariant domain,
  and bounded approximants give affiliation in the fixed net of Assumption 2.
  Only after these steps do we regard $L$ as a physical field and use its improvement to define the local
  conformal Ward derivations.

The first stage proves the following joint boundary statement. Its scalar and vector conclusions are both needed:
  scalar positivity defines insertion operators, while vector continuity identifies their domain with actual
  vectors in the original Hilbert space.

#thm([Theorem 8.1.])[
  #emph[For every finite ordered list of $L$ and original physical fields,
    the mixed analytic scalar product is the Fourier–Laplace continuation of a tempered Wightman distribution,
    with the ordered spectrum, adjunction, locality, and similarity covariance,
    with dilations acting on the original field labels. The analytic vector products have tempered Hilbert-valued
    boundaries with the vector spectrum. Their reflected splittings hold for joint tests and give all joint
    Wightman positivity inequalities in the original Hilbert space.]
] <R:mixed-products>

We first prove this for homogeneous original slots. Pure scalar vectors give the initial mixed orderings;
  an adjacent-interchange argument then reaches every ordering.
  After constructing the vector boundaries and their splittings,
  finite multilinearity restores the arbitrary original field labels under the same joint test kernels.

=== 8.1 Uniformity conventions and pure scalar products <uniformity-conventions-and-pure-scalar-products>

All assertions below concern a fixed finite list of fields and compact real coordinate sets.
  For a test supported in a compact set $K$, put

#[#set math.equation(numbering: n => "(8.2)")
 $ p_(K \, m) \( f \) = max_(\| alpha \| lt.eq m) sup_K \| partial^alpha f \| . $ <R:seminorm>]

A distribution estimate is uniform on the unit ball of one such seminorm;
  the finite integer $m$ is allowed to increase when a prescribed accuracy increases.
  For boxes of diameter $epsilon$, the same convention uses rescaled tests and hence introduces only powers of
  $epsilon^(- 1)$. Imaginary directions range over compact subsets of open ordered cones.
  Constants can depend on those compact sets, the field list, and the requested derivative order,
  but never on the dyadic approximation parameter or on $0 < epsilon lt.eq epsilon_0$.

For clarity we record the quantitative content of the bounded approximation result.
  For the product of a fixed number of approximants, there are fixed $A \,
  Q < oo$ such that its holomorphic norm is at most $C epsilon^(- A) R^Q$.
  On a separated real placement patch its dyadic difference satisfies, for every $k$,

#[#set math.equation(numbering: n => "(8.3)")
 $ parallel F_(2 R) - F_R parallel lt.eq C_k epsilon^(- B_k) R^(- k) \, wide parallel F_R parallel lt.eq
   C epsilon^(- A) R^Q . $ <R:approx-data>]

The first estimate follows by telescoping and moving the differing bounded factor to the vacuum;
  the finite seminorms for it depend on $k$. The exponent $Q$ in the second estimate does not.
  Both estimates include the adjoint waves. These are precisely the shrinking-box estimates of Proposition 37;
  they impose no energy bound on an unknown field operator.

The two exponents in (8.3) play different roles. Increasing the desired accuracy changes $k$ and the required test
  seminorm, while the polynomial norm exponent $Q$ remains fixed.
  This is what permits a summable dyadic estimate after a positive fraction of the accuracy has been lost in
  analytic continuation.

We will obtain spectral support from scaling and local boundary regularity.
  The exact homogeneous case suffices for pure products. Later we will also need the version in which a scaling
  error already has the required spectral support.

#thm([Lemma 8.2.])[
  (Scaling and tube spectrum).  #emph[Let $C subset bb(R)^N$ be an open convex cone and set
$ K = C^(*) = { xi : xi dot.op y gt.eq 0 med upright("for every ") y in C } . $

 Use Fourier waves $e^(i x dot.op xi)$. Let $u$ be a tempered distribution with values in a Hilbert space,
   locally near the origin the distributional boundary of a holomorphic function on a wedge with imaginary
   directions in $C$. Suppose that, for a real $d$ and unitaries $V \( lambda \)$, $lambda > 0$, every scaling defect
$ lambda^d u \( lambda x \) - V \( lambda \) u \( x \) $

 has Fourier support in $K$. Then $"supp" hat(u) subset K$.
   In particular this holds for exact scaling covariance, with zero defect.
   For scalar distributions one may take $V \( lambda \) = 1$.
   The wedge-boundary hypothesis may be replaced by rapid decay of localized Fourier transforms near the origin in
   every direction outside $K$.]
] <R:scaling-spectrum>

#proof[
  A distributional wedge boundary has no analytic, hence no smooth,
    wavefront at the origin in a direction outside $K$. This follows by shifting a localized Fourier test a small
    distance in a strict direction of $C$ with negative frequency pairing.
    The usual distributional boundary bounds on smaller approach wedges justify the shift.
    The argument applies in Hilbert norm, or after scalarization uniformly on the unit ball.
  Fix a smooth Fourier test supported in a compact subset of $bb(R)^N \\ K$.
    Its pairing with $hat(u)$ after dilation to frequency $Lambda$ decreases faster than every power of $Lambda$.
    To pass from the local wavefront estimate to this unlocalized pairing,
    insert a cutoff equal to one near the origin. The local part has the asserted rapid decay.
    Outside the cutoff, the rescaled Schwartz inverse Fourier test and all its derivatives decrease rapidly in
    every Schwartz seminorm, so temperedness controls the remainder.
    A finite covering treats all directions in the fixed frequency support.
  The scaling defect has zero pairing with that test and with every one of its positive dilates,
    since $K$ is a cone. The remaining scaling identity makes the norm of the dilated pairing a fixed power of
    $Lambda$ times the norm of the original pairing; $V \( lambda \)$ does not change that norm.
    Rapid decay forces the original pairing to vanish. Every compact Fourier test outside $K$ is allowed,
    proving the assertion. ◻
]

#thm([Proposition 8.3.])[
  #emph[Every pure $L$ analytic vector product has a tempered Hilbert-valued boundary with the ordinary ordered
    vector spectrum. Its Fourier–Laplace continuation is the accessible analytic product.]
] <R:pure-products>

#proof[
  First, the product has scalar-primary covariance under sufficiently small simultaneous special transformations.
    The geometry in Lemma 40 applies to every fixed finite family of source and destination patches:
    its proof uses only finitely many strict wedge inequalities.
    Choose the conjugate null axis $m$ separated from the finitely many flow directions,
    take $m dot.op x$ sufficiently negative, and then add a sufficiently large positive multiple of $m$ to make
    all the required opposite inequalities strict. A small double cone $O_(-)$ about that point is spacelike to
    every containing wedge and to the destination patches. Local vacuum cyclicity makes ${ C Omega :
    C in cal(M) \( O_(-) \) }$ total.
  For a fixed finite product length, reparametrize the source tests by a small null flow and its inverse primary
    factors. Write $F_g^(\( n \))$ for the limit of the resulting simultaneously conjugated bounded products and
    $F^(\( n \))$ for the accessible destination product. The former limit exists because the source product
    converges and the common conjugating unitary is bounded. For $C in cal(M) \( O_(-) \)$,
    move its first bounded factor past $C$ and take the vacuum and adjoint-vacuum limits.
    The canonical one-wave action and induction on the length give
  #[#set math.equation(numbering: n => "(8.4)")
   $ chevron.l C Omega \, F_g^(\( n \)) chevron.r & = chevron.l L \( macron(f)_1 \) Omega \,
     C^(*) F_g^(\( n - 1 \)) chevron.r\
 & = chevron.l L \( macron(f)_1 \) Omega \, C^(*) F^(\( n - 1 \)) chevron.r = chevron.l C Omega \,
   F^(\( n \)) chevron.r . $ <R:all-length-recursion>]
  Every transformed one-vacuum wave is already the accessible $L$ wave,
    so this induction uses no finite-length interpolation. Totality proves the covariance identity on the real
    spacelike patch, and boundary uniqueness proves it in the tube.
    Compositions of small null flows give small special transformations.
    For any fixed real compact set and strict approach subcone,
    choose the transformations small both there and on a finite interior path to the initial patch.
    Their unitary factors have norm one. Thus the identity is uniform near that compact set;
    localization under arbitrary large conformal transformations is not required.
  Thus covariance has been obtained separately for every finite pure product length.
    The next step uses it to transport the known boundary estimates for products of $Theta$ into enough
    differential estimates to recover the original pure $L$ product.
  Here is an algebraic device that converts this covariance into a boundary estimate. On the ambient null cone use
  $ X = \( X^(+) \, X^(-) \, X^mu \) \, wide q \( X \) = X^mu X_mu - X^(+) X^(-) \, wide X =
    lambda \( 1 \, x^2 \, x \) . $
  Here $F$ is the Hilbert-valued analytic vector product. Its lift is Hilbert-valued and homogeneous of degree
    $w = - 2$ in each slot; the differential identities below may be tested against arbitrary Hilbert vectors,
    with estimates uniform on their unit ball. On degree $w$ homogeneous functions, define the flat Thomas derivative
  #[#set math.equation(numbering: n => "(8.5)")
   $ cal(D)_A \( w \) = \( 2 + 2 w \) partial_A - X_A partial_(upright("amb"))^2 . $ <R:Thomas>]
  Successive derivatives use the new degree in their slot. The product rule, $partial_(upright("amb"))^2 q = 12$,
    and Euler’s identity show that these derivatives preserve the quadratic ideal, commute successively,
    and have zero successive trace. They therefore act intrinsically on the cone. The same calculation gives
  #[#set math.equation(numbering: n => "(8.6)")
   $ X^A cal(D)_A \( w \) = w \( 2 + 2 w \) quad med \( mod med q \) . $ <R:Thomas-contraction>]
  These are the flat ambient identities underlying the Thomas operator; see also #cite(label("GoverWaldron2009")).
    None of the factors in (8.6) vanishes at $w = - 2 \, - 3 \, dots.h$.
  In particular, contraction can undo each successive derivative at the degrees encountered here.
    The weight in (8.5) must be lowered after each differentiation in that slot;
    using a fixed weight throughout would not give these intrinsic commuting operators.
  Take the null direction $a_oo$ representing chart infinity,
    and extend the lifted function independently of $X^(-)$. Then $a_oo dot.op
    cal(D)$ is a nonzero smooth chart factor times $square.stroked_x$. Consequently
  #[#set math.equation(numbering: n => "(8.7)")
   $ G_a F := product_(i = 1)^n \( a dot.op cal(D)_i \) F $ <R:all-slot-derivative>]
  has polynomial boundary growth for $a = a_oo$, by the ordinary all-$Theta$ product and (8.1).
    Primary transport proves the same statement for $a$ in an open real null-cone patch about $a_oo$.
    Finite derivatives preserve these bounds after shrinking the approach subcone, by Cauchy’s inequalities.
  For this transport, write $tilde(F)$ for the homogeneous lift.
    For each fixed sufficiently small transformation $g$, its local covariance is $tilde(F) \( g X \) =
    U_g tilde(F) \( X \)$, with the primary chart factors absorbed in the lift.
    The flat ambient chain rule gives $G_(g a) tilde(F) \( g X \) = U_g G_a tilde(F) \( X \)$.
    The unitary $U_g$ is fixed as the insertion coordinates vary,
    so the coordinate derivatives act only on $tilde(F)$. Taking $a =
    a_oo$ transfers the known bound to the null direction $g a_oo$.
    The shifted homogeneous weights supply smooth chart factors bounded on the chosen compact set.
    Scalarization replaces a testing vector by its unitary image and therefore keeps the Hilbert norm estimate uniform.
  We give the finite algebraic argument needed to recover $F$.
    In constant complex variables $xi_(i A)$, let $I$ be the ideal generated by $xi_i^2$ and by
    $product_i \( a dot.op xi_i \)$ for all $a$ in that patch.
    If a common zero had every $xi_i eq.not 0$, the patch would be covered by the finitely many proper hyperplane
    sections $a dot.op xi_i = 0$. The real null patch is Zariski dense in the irreducible complex null cone and
    spans the ambient space, so this is impossible. Thus every common zero has $xi_i = 0$ for some $i$.
  For each of the finitely many monomials $m = product_i xi_(i A_i)$, the Nullstellensatz gives $m^(e_m) in I$.
    Let $e$ dominate their exponents. Every monomial of degree at least $6 \( e - 1 \) +
    1$ in each slot is divisible by one of the $m^e$ and belongs to $I$.
    Noetherianity gives finite generator representations, and separate homogeneity in each slot gives
    multihomogeneous coefficient representations. Substitute the successively commuting operators (8.5).
    Trace terms vanish; the remaining terms are finite derivatives of (8.7).
    Hence sufficiently high derivative tensors of $F$ have polynomial growth.
    Contracting their indices with the $X_i$ and using (8.6) repeatedly recovers $F$ with a nonzero constant
    factor. The chart factors are bounded on the compact set. This proves moderate growth of $F$.
  The algebraic recovery used only a finite number of null directions and derivatives for this fixed product
    length. Its constants may depend on that length; no estimate uniform over all lengths is needed for
    constructing the polynomial field domain.
  The moderate-growth tube boundary theorem, applied weakly and then uniformly in unit Hilbert vectors,
    gives a Hilbert-valued distribution locally. Its exact similarity covariance globalizes this boundary and
    makes it tempered: rescaling dyadic annuli to a fixed compact set changes a finite distribution seminorm by
    only a power of the radius, and the dilation unitary leaves its norm unchanged.
    Lemma 52 gives its ordered vector spectrum. Fourier–Laplace uniqueness then identifies its continuation with
    the original product. ◻
]

=== 8.2 Boundary values and a distribution criterion <boundary-values-and-a-distribution-criterion>

We specify the analytic facts used in the mixed-product argument so that no growth assertion is concealed in a
  boundary-value notation. The point of the distinction is that holomorphy alone will initially give boundary
  hyperfunctions for the coefficients of a causal wave ambiguity.
  We will prove a quantitative Gaussian estimate before using any of those coefficients as an ordinary
  distribution. The boundary $b f$ of a holomorphic function on a local convex wedge exists as a hyperfunction
  without a growth assumption. Restriction to a smaller approach cone is compatible with this boundary map;
  the map is injective for the local germ on a connected single wedge and agrees with ordinary distributional
  boundary values whenever those exist. We fix the Euclidean coordinate volume form when identifying scalar
  hyperfunctions with the corresponding top-form convention.
  Compactly supported hyperfunctions are analytic functionals carried by their support.
  Thus, for each complex neighborhood $K_gamma$ of the carrier, a representative $u$ satisfies

#[#set math.equation(numbering: n => "(8.8)")
 $ \| chevron.l u \, h chevron.r \| lt.eq C_gamma sup_(K_gamma) \| h \| \, wide
   h upright(" holomorphic near ") K_gamma . $ <R:carrier>]

Komatsu constructs the injective boundary map on a Stein complex neighborhood with an open convex imaginary cone
  #cite(label("Komatsu1973")) Section 1; equations (1.1) and (1.5) on pp. 253–254 give injectivity and
  compatibility with smaller cones. Small complex boxes are Stein,
  so restriction to a smaller real patch gives the local germ statement used here.
  The comparison on p. 257 identifies polynomial-growth boundaries with distributional ones.
  Martineau’s Theorems 1–2 give the analytic-functional realization #cite(label("Martineau1961"));
  the carrier estimate is in Section 1(a)–(b) and Proposition 1 of that paper.
  These constructions alone give no polynomial growth estimate.
  In the analytic-functional notation used below, the canonical distribution embedding is described in
  #cite(label("HoepfnerRagognette2021")) Section 4, equation (4.3).

Use real Euclidean coordinates for the Gaussian, with their complex-bilinear extension,
  and the Fourier wave convention $e^(i x dot.op xi)$. For a compact analytic-functional representative put

#[#set math.equation(numbering: n => "(8.9)")
 $ cal(T)_Lambda u \( w \, eta \) = ⟨u \( z \) \,
   e^(i Lambda \( w - z \) dot.op eta - Lambda \( w - z \)^2 \/ 2)⟩ . $ <R:FBI>]

Only real centers $w$ and real frequencies $eta$ are used for the estimates below.

#thm([Lemma 8.4.])[
  #emph[Suppose that, near a real point $w_0$, a hyperfunction $u$ has a compact analytic-functional
    representative such that
#[#set math.equation(numbering: n => "(8.10)")
 $ \| cal(T)_Lambda u \( w \, eta \) \| lt.eq C \( 1 + Lambda \)^N
   quad \( w in U \, \| eta \| = r_(*) \, med Lambda gt.eq 1 \) $ <R:FBI-polynomial>]

 for some neighborhood $U$ of $w_0$ and some $r_(*) > 0$. Then $u$ is a distribution near $w_0$.]
  #emph[If $u = b f$ from a wedge, its transform near $w_0$ can be computed by integrating $f$ on a sufficiently
    small fixed interior translate of a local real box, with an exponentially small error.
    The box and height can be chosen uniformly for $w$ in a smaller box and $eta$ in a fixed compact set.]
] <R:FBI-criterion>

#proof[
  The first assertion is the distribution case of the generalized FBI criterion of Hoepfner–Ragognette
    #cite(label("HoepfnerRagognette2021")) Theorem 6.3 and Section 8.1.
    In their notation take the positive quadratic polynomial $p \( v \) = \| v \|^2 \/ \( 2 r_(*) \)$ and $xi =
    Lambda eta$, $\| eta \| = r_(*)$. Then $\| xi \| p \( w - z \) = Lambda \( w - z \)^2 \/ 2$,
    so their transform is (8.9) up to an irrelevant fixed normalization.
    Their local inverse decomposition separates a distribution, obtained from the polynomially bounded part,
    from an analytic remainder. Finite covering of the frequency sphere makes the polynomial estimate uniform.
    The compact representative is immaterial because changing it away from $w_0$ changes this estimate by an
    exponentially small term.
  For the second assertion, use the fixed-height integration representation of a wedge boundary value
    #cite(label("HoepfnerRagognette2021")) Remark 4.1, using a rounded box with smooth boundary.
    The difference is an analytic functional carried in an arbitrarily thin complex neighborhood of the boundary
    of the chosen real box. This is also obtained from the product Cauchy representation:
    entries that extend across one coordinate cancel under contour displacement.
    Axes strictly inside the wedge give the requisite product half-domain description.
    Let the distance between the smaller box of centers and that boundary be $a > 0$.
    For $z = x + i y$, $\| eta \| lt.eq M$, the real exponent in the Gaussian is
  #[#set math.equation(numbering: n => "(8.11)")
   $ Lambda (y dot.op eta + frac(\| y \|^2, 2) - frac(\| w - x \|^2, 2)) . $ <R:Gaussian-exponent>]
  Choose all side contours with $\| y \| lt.eq t$ and then the carrier neighborhood with width $gamma$ so small
    that $\( t + gamma \) M + \( t + gamma \)^2 \/ 2 < a^2 \/ 4$.
    Equation (8.8) bounds their contributions by $C e^(- c Lambda)$.
    This is the localization estimate of #cite(label("HoepfnerRagognette2021")) Proposition 4.5.
    Heights and carrier neighborhoods are fixed before $Lambda arrow.r oo$;
    no integrability of $f$ down to the real edge has been assumed. ◻
]

A related fact for a tempered distribution will be useful.
  Rapid Gaussian decay near the origin in a frequency cone implies rapid decay when its Fourier transform is
  tested at large frequencies strictly inside that cone. One can use the smooth wavefront characterization,
  or directly integrate the Gaussian inversion against that frequency test.
  Away from the origin, integrations by parts in the frequency variable gain arbitrary powers;
  a derivative of the Gaussian costs at most a square-root power beyond the fixed distribution order.
  This gives the alternative Fourier-decay hypothesis in Lemma 52.

=== 8.3 A quantitative boundary estimate at one merged face <a-quantitative-boundary-estimate-at-one-merged-face>

Until the finite-multilinearity passage below, every original-field slot in the mixed-product argument is
  homogeneous, including every spectator slot. Original derivative slots carry their shifted dimensions;
  derivatives of $L$ will follow by differentiating its reconstructed products.
  We fix an arbitrary finite list and an arbitrary ordering; neither its length nor the set of lists is bounded.
  The constants and distribution orders may depend on this list.
  We shall first complete both scalar and Hilbert-valued reconstruction for these homogeneous lists.

The scalar induction is simultaneous over every finite homogeneous old-field list and is indexed only by the
  number of $L$ entries. Its zero stage is the original Wightman family.
  At the next stage, orderings with every $L$ on the right are tempered:
  the analytic splitting (6.13) pairs an ordinary homogeneous old bra with the pure vector boundary of
  Proposition 53. This continuous bilinear pairing on the conjugate bra Hilbert space and the ket Hilbert space
  gives a joint Schwartz distribution by the kernel theorem.
  The reversed bra vector cone, the ket vector cone, and translation invariance supply its scalar ordered cones.

It remains to move $L$ entries through old entries. In each adjacent interchange,
  applying $square.stroked$ in the $L$ slot replaces it by the homogeneous old field $Theta$.
  Both source orderings therefore belong to the preceding induction stage,
  however many old spectators are present. We prove the interchange step below before iterating it.

Let $W_1$ be a mixed scalar ordering already known to be tempered,
  and obtain $W_2$ by interchanging an adjacent $L \( x \)$ and homogeneous original physical field $A \( y \)$.
  Write $r = x - y$. The variable $z$ consists of $y$ and all spectator coordinates in their merged order.
  Holding $z$ in a compact subset of its strict tube keeps every gap except the new relative gap bounded away from
  the boundary. Replacing this $L$ by $Theta$ gives two already known tempered sources,
  with the homogeneous dimension-four field $Theta$ in that slot, $S_i = square.stroked_r W_i$.

In these coordinates the momentum at the merged $y$ slot is the sum of the two adjacent momenta;
  all other spectator momenta are unchanged. Write $C_z$ for the strict merged approach cone and $K_z =
  C_z^(*)$ for its closed spectral cone, in the Fourier convention of Lemma 52.
  A strict relative direction $v_r$ of the target order, sufficiently small compared with a fixed merged direction
  $v_z$, makes $\( v_r \, v_z \)$ a strict full target direction. These are different cones:
  operations in $r$ preserve $K_z$, while the missing relative spectral condition will require a further argument.

Here the relative gap tends to the boundary while the merged gaps remain strict.
  The estimate must therefore keep a positive analytic propagation exponent as the relative gap shrinks.
  Once this face estimate is available, the wave equation will carry it from a thin real-time strip to every
  compact relative-coordinate set.

#thm([Lemma 8.5.])[
  #emph[For compact real $r$-sets, compact strict merged $z$-sets,
    and compact sets of relative imaginary directions $v$ of the target order, there are $C \, N < oo$ such that
#[#set math.equation(numbering: n => "(8.12)")
 $ \| W_2 \( r + i epsilon v \; z \) \| lt.eq C epsilon^(- N) \, wide 0 < epsilon lt.eq epsilon_0 . $ <R:face-power>]

 The same statement holds for every fixed finite derivative order.
   Consequently $W_2$ has an ordinary distributional $r$-boundary $F_0 \( r \; z \)$,
   holomorphic as a distribution-valued function on the strict merged tube.]
] <R:face-bound>

#proof[
  We first work with $\| r^0 \| lt.eq C_0 epsilon$ and bounded $upright(bold(r))$.
    Shift $upright(bold(r))$ outward by at most $C_1 epsilon$ so that the resulting $r_(*)$ has spacelike
    clearance at least $4 c epsilon$. Put the real merged placements $z_(*)$ sufficiently far apart on a common
    time slice. Their spacelike margins, including separation from both members of the pair,
    can be chosen of order one. The tests for the two nearby slots have diameter $c epsilon$;
    all tests may be taken of that size. The bounds (8.3) hold on the resulting separated patch.
  Here $F_R$ denotes the scalar vacuum expectation of the bounded product (6.12).
    On the vector tube, vacuum invariance removes its initial factor $U \( z_1 \)$.
    The resulting expression depends only on consecutive gaps and extends holomorphically,
    with the same polynomial norm bound, to the scalar tube where those gaps are strict.
    Thus this scalar face estimate does not require the first-gap condition that remains necessary for vector products.
  Write $eta = "Im" z$. Consider the complex line
  #[#set math.equation(numbering: n => "(8.13)")
   $ zeta mapsto \( r_(*) + epsilon zeta v \, med z_(*) + zeta eta \) \, wide "Im" zeta > 0 . $ <R:anisotropic-line>]
  For sufficiently small $epsilon$ its direction is in the full target cone.
    There is a real interval $\[ - a \, a \]$ on which the approximant supports remain spacelike,
    with $a > 0$ independent of $epsilon$: the relative displacement is of size $epsilon$ and the corresponding
    clearance is also of that size, whereas all merged displacements and margins are of order one.
    The harmonic measure of this interval at $zeta = i$ is $alpha = 2 arctan \( a \) \/ pi > 0$.
    The two-constants theorem applied to $log \| F_(2 R) - F_R \|$ gives
  $ \| F_(2 R) - F_R \| lt.eq C_k epsilon^(- alpha B_k - \( 1 - alpha \) A) R^(- alpha k + \( 1 - alpha \) Q) . $
  Slightly reducing the clearances gives this estimate on a complex $r$-ball of radius $c_1
    epsilon$ and a $z$-ball of fixed radius.
  Returning the spatial shift takes a bounded number of $epsilon$-balls.
    At fixed complex $r$, moving the merged variables to any prescribed merged compact takes a bounded number of
    fixed-radius $z$-balls. Moving $y$ moves $x = y + r$ with it,
    so the small internal gap does not restrict those $z$-radii.
    More precisely, take the compact convex hull, inside the strict merged tube,
    of the initial placements and the prescribed compact set.
    Its gaps have a fixed positive margin; the two exterior gaps adjacent to the pair keep that margin when the
    internal displacement is $O \( epsilon \)$. A finite cover therefore supplies radii and a number of balls
    independent of $epsilon$. Take overlapping balls with radii $rho \, 2 rho \, 4 rho$ inside the tube.
    Each three-circle step retains exponent $1 \/ 2$. Thus a fixed $sigma > 0$, independent of $epsilon$, gives
  #[#set math.equation(numbering: n => "(8.14)")
   $ \| F_(2 R) - F_R \| lt.eq C_k epsilon^(- E_k) R^(- sigma k + \( 1 - sigma \) Q) \, wide E_k =
     sigma max \( B_k \, A \) + \( 1 - sigma \) A . $ <R:dyadic-face>]
  Choose one finite $k$ with $sigma k - \( 1 - sigma \) Q > 1$ and then fix its finite test seminorm.
    Summing dyadic differences gives a fixed inverse power of $epsilon$.
    If localization starts at a dyadic $R_0 \( epsilon \)$ bounded by a power of $epsilon^(- 1)$,
    its initial norm contributes another finite power. The construction of Proposition 37 permits this choice.
    The accuracy order is never increased while $epsilon$ tends to zero.
  This order of choices is essential: the continuation geometry fixes $sigma$, then one chooses $k$,
    and only then lets the relative gap shrink. The resulting $E_k$ is a fixed finite exponent in the face bound.
  For completeness, unsmearing this estimate does not involve point evaluation of a bounded approximant.
    The limit already has a holomorphic kernel by Proposition 38.
    Choose a smooth radial bump $rho$ on $bb(C)^4$ of integral one, supported in a sufficiently small ball.
    Holomorphic mean value in each of $p$ slots gives, writing $Z$ for the full slot coordinates,
  #[#set math.equation(numbering: n => "(8.15)")
   $ W_2 \( Z \) & = integral_(\( bb(C)^4 \)^p) product_i epsilon^(- 8) rho \( w_i \/ epsilon \) W_2 \( Z + w \)
     thin upright(d) w\
 & = integral upright(d) b thick W_2 \( f_(epsilon \, b_1) \, dots.h \, f_(epsilon \, b_p) \; Z + i epsilon b \) .
   $ <R:unsmear>]
  Here $f_(epsilon \, b) \( u \) = epsilon^(- 4) rho \( u \/ epsilon + i b \)$,
    and $b$ ranges over a fixed compact set and $p_(K \, m) \( f_(epsilon \, b) \) lt.eq C_m epsilon^(- 4 - m)$.
    The finite seminorm estimate just proved therefore bounds the last integral by a power.
    Cauchy’s inequalities in smaller $epsilon$-balls also bound all fixed derivatives.
    This proves (8.12) initially in the thin real-time strip.
  Finally fix $z$ and the imaginary displacement $i epsilon v$.
    The function $u_epsilon \( t \, upright(bold(r)) \) =
    W_2 \( \( t \, upright(bold(r)) \) + i epsilon v \; z \)$ satisfies the ordinary inhomogeneous wave equation
    in the real variables. Its initial value, spatial derivatives,
    and first time derivative have the bounds just obtained. Its source is the Fourier–Laplace continuation of the
    inductively tempered $S_2$, so it has a power bound of its own at this relative gap.
    Kirchhoff’s formula on $\| t \| lt.eq T$, $\| upright(bold(r)) \| lt.eq B$ gives
  #[#set math.equation(numbering: n => "(8.16)")
   $ parallel u_epsilon parallel_(T \, B) & lt.eq parallel u_epsilon \( 0 \) parallel_(B + T) +
     T parallel nabla u_epsilon \( 0 \) parallel_(B + T) + T parallel partial_t u_epsilon \( 0 \)
     parallel_(B + T) + 1 / 2 T^2 parallel S_2 parallel_(T \, B + T) \, $ <R:wave-estimate>]
  with an immaterial fixed norm constant. This proves the bound on every real compact set.
    Derivatives obey the same estimate. Moderate-growth boundary values now give $F_0$;
    the estimates uniform on $z$-compacts give holomorphy and locally uniform finite distribution order in $r$. ◻
]

=== 8.4 Causal ambiguity and recovery on the wrong massless branch <causal-ambiguity-and-recovery-on-the-wrong-massless-branch>

The source difference $S_2 - S_1$ vanishes for real spacelike $r$ by inductive locality.
  Split it into distributions supported in $J^(+) \( 0 \)$ and $J^(-) \( 0 \)$ by a partition away from $r =
  0$ and finite Taylor subtraction at that point. Subtraction acts only in $r$,
  so all merged $z$-spectra are preserved. Convolve these two parts with the retarded and advanced fundamental
  solutions, respectively. The cone-supported convolutions are proper on bounded sets and define tempered
  distributions; their Schwartz seminorms involve only finitely many seminorms of the sources.
  Adding their sum to $W_1$ gives a tempered distribution $T_0$ satisfying

#[#set math.equation(numbering: n => "(8.17)")
 $ square.stroked_r T_0 = S_2 \, wide "supp"_r \( T_0 - W_1 \) subset J \( 0 \) \, $ <R:causal-solution>]

with the merged spectra. Let the same symbol denote its Fourier–Laplace continuation in $z$,
  valued in $r$-distributions.

At fixed strict $z$, the difference $H_(*) = F_0 - T_0$ solves the homogeneous wave equation and is supported in
  $J \( 0 \)$; spacelike tie gluing proves the support assertion.
  A homogeneous wave distribution has distributional Cauchy data.
  At time zero those data are supported at the spatial origin,
  so each is a finite sum of derivatives of a delta function. Cauchy uniqueness consequently gives

#[#set math.equation(numbering: n => "(8.18)")
 $ H_(*) \( r \; z \) = sum_(j = 1)^m C_j \( z \) P_j \( partial_r \) Delta_0 \( r \) . $ <R:wave-ambiguity>]

The $P_j$ may be chosen homogeneous and linearly independent modulo the wave quadratic,
  with $Delta_0$ the massless commutator function. One fixed finite list works on the connected merged tube.
  Indeed, on a relatively compact open subset the distribution order is uniform,
  so sufficiently high spatial monomials annihilate both Cauchy data.
  These annihilators continue holomorphically to the whole tube.
  Cauchy restriction is continuous on homogeneous wave solutions,
  and fixed dual tests recover the finitely many coefficients; hence the $C_j$ are holomorphic.

The unknown part of the boundary has now been reduced to finitely many scalar coefficient functions on the merged
  tube. The next lemma proves their distribution regularity by testing on the massless branch excluded by the
  target ordering. The causal solution $T_0$ is already tempered and will supply the polynomial bound in that test.

#thm([Lemma 8.6.])[
  #emph[Every coefficient $C_j$ in (8.18) has a local ordinary distribution boundary in the merged variables.]
] <R:coefficient-distributions>

#proof[
  Fix a real merged center. Initially $b C_j$ is only a hyperfunction.
    Choose a small real box about the center, a smaller box of centers $w$, and a strict merged direction $v_z$.
    Lemma 54 represents the Gaussian testing by a fixed translate $i t_0 v_z$, up to exponentially small side errors.
  Choose a strict relative direction $v_r$ for the target ordering,
    small enough compared with the merged gaps that $\( v_r \, v_z \)$ is a strict full target direction.
    Choose finitely many nonzero null covectors $k_a$ on the wrong branch, so $k_a dot.op v_r < 0$.
    The sample points range over a radially open patch of that branch;
    they are not constrained to a fixed energy shell. The radius variation will be used when separating
    coefficient polynomials of different degrees; choosing directions only on one fixed shell would not give that
    independence argument. Then choose $r_(*) > 0$ sufficiently small that,
    uniformly for all samples and $\| eta \| = r_(*)$,
  #[#set math.equation(numbering: n => "(8.19)")
   $ k_a dot.op v_r + eta dot.op v_z lt.eq - c_0 < 0 . $ <R:negative-phase>]
  Test (8.18) in $r$ with $chi \( r \) e^(- i Lambda r dot.op k_a - Lambda r^2 \/ 2)$, where $chi = 1$ near zero,
    and in $z$ with the Gaussian (8.9) on the fixed translated box.
  For the $F_0$ term, deform the relative contour from zero to $i t_0 v_r$, leaving $z$ at height $i t_0 v_z$.
    Lemma 55 justifies the initial endpoint. On the final central contour the real exponent,
    apart from negative spatial Gaussians, is at most
  $ Lambda [- t_0 c_0 + 1 / 2 t_0^2 \( \| v_r \|^2 + \| v_z \|^2 \)] . $
  Choose $t_0$ so small that this is $lt.eq - c Lambda$. The continued $W_2$ is bounded on that fixed interior
    compact, so this term is exponentially small.
  We specify the cutoff error, since the relative contour starts at a distributional face.
    Let $N$ be an inverse-height growth exponent from (8.12), increased to cover the derivatives used below.
    Replace $chi \( x \)$ on the moving contour by its almost-analytic Taylor lift
  $ chi^(\[ M \]) \( x + i y \) = sum_(\| alpha \| lt.eq M) \( i y \)^alpha partial^alpha chi \( x \) \/
    alpha ! \, wide M > N + 1 . $
  Its antiholomorphic derivative is $O \( \| y \|^M \)$, supported in the transition region.
    There $\| x \|$ is separated from zero. By decreasing $t_0$ before taking the large-parameter limit,
    (8.11) is $lt.eq - c' Lambda$ throughout the transition, even after all linear phase costs.
    Stokes errors are bounded by a polynomial in $Lambda$ times $e^(- c' Lambda) integral_0^(t_0) t^(M - N) thin
    upright(d) t$. The same construction applies to any smooth central cutoff in $z$.
    For the merely hyperfunctional coefficient boundary we instead use the fixed-height analytic-functional
    remainder of Lemma 54; we do not multiply that boundary by a smooth cutoff.
  The $T_0$ term is polynomially bounded in $Lambda$: move its merged contour back to the real boundary and use
    its tempered seminorm. Derivatives of the Gaussian and cutoffs cost only powers of $Lambda$.
    Its contour errors obey the same estimate, now with the known finite distribution order of $T_0$.
  It remains to check that these tests recover every coefficient. Put $d_j = deg P_j$ and
  $ M_(a j) \( Lambda \) = ⟨P_j \( partial \) Delta_0 \, chi \( r \) e^(- i Lambda r dot.op k_a - Lambda r^2 \/ 2)⟩ . $
  The Fourier transform of $Delta_0$ is a nonzero normalization times $"sgn" \( p^0 \) delta \( p^2 \)$.
    Gaussian Fourier integration, with $p = Lambda k_a + sqrt(Lambda) q$, gives
  #[#set math.equation(numbering: n => "(8.20)")
   $ Lambda^(3 \/ 2 - d_j) M_(a j) \( Lambda \) arrow.r c \( k_a \) P_j \( i k_a \) \, wide
     c \( k_a \) eq.not 0 . $ <R:shell-asymptotic>]
  Indeed $upright(d) p$ contributes $Lambda^2$, the delta function $Lambda^(- 3 \/ 2)$,
    and the four-dimensional Gaussian Fourier factor $Lambda^(- 2)$.
    The remaining integral is a nonzero Gaussian integral on $2 k_a dot.op q = 0$,
    with the fixed sign of the branch. The cutoff error is exponentially small by the temperedness of
    $P_j \( partial \) Delta_0$. The nonzero factor $c \( k_a \)$ can depend on the row.
  The evaluation matrix $P_j \( i k_a \)$ has full column rank for a suitable finite sample set.
    Otherwise a nonzero linear combination would vanish on an open real patch of one null branch,
    hence on the irreducible complex quadratic cone, contradicting independence modulo the wave quadratic.
    Radial openness matters for polynomials of different degrees.
    Selecting an invertible square submatrix, (8.20) bounds its inverse by powers of $Lambda$.
    The tested identity therefore gives
  $ \| cal(T)_Lambda \( b C_j \) \( w \, eta \) \| lt.eq C \( 1 + Lambda \)^N wide \( \| eta \| = r_(*) \) \, $
  uniformly on the smaller box. Lemma 54 proves that every $b C_j$ is an ordinary distribution there.
    This conclusion is local in the merged real variables. Growth at infinity and the merged spectral support
    still require the scaling argument below. ◻
]

=== 8.5 Global growth, spectra, and completion of mixed products <global-growth-spectra-and-completion-of-mixed-products>

Local distribution boundaries do not by themselves imply global temperateness.
  Here exact similarities provide the missing control. The comparison solution $T_0$ need not share the exact
  homogeneity of $W_2$. Its scaling defect will instead appear as an explicitly tempered error,
  which is enough both for dyadic growth estimates and for excluding frequencies outside the merged spectral cone.
  If $W_2$ has $n_L$ entries $L$ and homogeneous original entries of dimensions $Delta_1 \, dots.h \, Delta_k$, put

$ d_W = 2 n_L + sum_(i = 1)^k Delta_i . $

Here the old dimensions already include any derivative shifts.
  The accessible analytic product has exact similarity covariance for this homogeneous list,
  by covariance of the one-wave data and uniqueness of the multilinear accessible products.
  Its distributional $r$-boundary $F_0$ has the same exact scaling.
  Put $delta_j = 2 + deg P_j$, so $P_j \( partial \) Delta_0 \( lambda r \) =
  lambda^(- delta_j) P_j \( partial \) Delta_0 \( r \)$. Choose fixed compact $r$-tests $phi_j$ dual to the finite
  list $P_j \( partial \) Delta_0$. Exact scaling of $F_0$ and (8.18) show that

#[#set math.equation(numbering: n => "(8.21)")
 $ lambda^(d_W - delta_j) C_j \( lambda z \) - C_j \( z \) = ⟨T_0 \( r \; z \) -
   lambda^(d_W) T_0 \( lambda r \; lambda z \) \, phi_j \( r \)⟩_r . $ <R:scaling-defect>]

The right side has a tempered boundary with merged spectral support.
  For $lambda gt.eq 1$ its Schwartz seminorm constants grow at most polynomially in $lambda$:
  scaling and the fixed compact extraction tests act continuously on Schwartz space with such bounds.

Cover the complement of a compact $z$-ball by dyadic annuli and rescale each annulus to a fixed compact set.
  There the local coefficient distribution has a fixed finite order.
  Formula (8.21) bounds its value on every outer annulus by a polynomial in the annulus radius and finitely many
  Schwartz seminorms. Summing against a Schwartz test proves that each $C_j$ is tempered.
  This argument needs no exact homogeneity of $T_0$.

The scaling defect in (8.21) has Fourier support in $K_z$.
  Apply Lemma 52 to the now tempered coefficient boundary, with $d = d_W - delta_j$ and $V \( lambda \) = 1$.
  Its local wedge boundary is supplied by Lemma 56. We obtain $"supp" hat(C)_j subset K_z$.
  Fourier–Laplace continuation and injectivity identify the original $C_j$ with the corresponding tempered
  continuation; in particular it now has ordinary polynomial bounds at ordered approaches.

It follows that $F_0$ is the merged continuation of the globally tempered distribution

#[#set math.equation(numbering: n => "(8.22)")
 $ D_0 \( r \, z \) = T_0 \( r \, z \) + sum_j C_j \( z \) P_j \( partial_r \) Delta_0 \( r \) . $ <R:D0>]

It is exactly homogeneous, because its merged continuation $F_0$ is.
  We next establish the full target spectrum, rather than just the merged one.
  For a covector strictly outside the full target cone, choose a strict target imaginary direction
  $\( v_r \, v_z \)$ with negative pairing. Local Gaussian testing near $\( r \, z \) =
  0$ first moves $z$ to a small height $i t_0 v_z$, using the already proved merged temperateness.
  At that face, $D_0 = F_0$; move $r$ to $i t_0 v_r$ using Lemma 55.
  Intermediate fractions of the latter move remain in the target tube.
  The final contour is an interior $W_2$ contour and has exponential Gaussian decay.
  The side errors are those already estimated in the proof of Lemma 56.
  This supplies the local off-cone Fourier decay used in Lemma 52;
  exact homogeneity of $D_0$ therefore gives its full target spectral support.
  Its full Fourier–Laplace continuation agrees with $W_2$, since they have the same $r$-boundary at fixed strict
  merged damping.

One adjacent interchange is therefore complete: it preserves temperateness, recovers the full ordered spectrum,
  and retains spacelike locality. Iterate this step in the simultaneous induction stated above.
  At fixed number of $L$ entries, begin with all of them on the right and move them to the prescribed positions.
  Every source has one fewer $L$ and one additional old entry $Theta$,
  so it belongs to the preceding induction stage. Repeat this for every finite ordering of the old entries.
  Tie gluing, followed by the ordinary merged spectral boundary with a spacelike relative test,
  then proves locality also for adjacent old-field interchanges, with the prescribed grading.
  Adjunction and exact similarity covariance for each homogeneous list follow from those identities of the
  analytic accessible products and uniqueness of their boundaries.

We next complete the Hilbert-valued assertion for the same homogeneous lists.
  The squared norm of a mixed analytic vector product is its reflected scalar split.
  A strict vector approach gives a strict scalar split approach:
  the central gap is twice the first vector damping, and the other gaps are the reflected vector gaps.
  The scalar polynomial bound therefore gives a polynomial norm bound for the vector product.
  The Hilbert-valued moderate-growth theorem supplies its local boundary.
  Its exact similarity covariance for this homogeneous list, with a unitary dilation factor on the output,
  globalizes the boundary by dyadic annuli and gives the vector support by Lemma 52.
  Thus this boundary is a tempered Hilbert-valued distribution with the full ordered vector spectrum.
  Taking both strong distributional boundaries in the reflected split,
  first for factor tests and then for joint tests by continuity, gives

$ W \( B^(*) A \) = chevron.l Psi \( B \) \, Psi \( A \) chevron.r $

for any two homogeneous words $A \, B$ with their tests. The concatenated cross list is itself a list of
  homogeneous slots, even when the two words have different total dimensions.

It remains to pass from homogeneous slots to arbitrary original fields.
  Write each such field in the fixed list as $A_i = sum_(Delta in S_i) A_(i \, Delta)$, with $S_i$ finite,
  as in Assumption 2. Let $upright(bold(A))$ denote the complete ordered list, including its $L$ slots,
  and let $upright(bold(A))_(bold(Delta))$ replace each old $A_i$ by $A_(i \, Delta_i)$.
  If there are no old slots, the indexing product below is a singleton.
  Multilinearity of the accessible analytic products already gives the corresponding finite expansion in the tube.
  For an already constructed homogeneous list $upright(bold(B))$,
  write $W_(upright(bold(B)))$ and $Psi_(upright(bold(B)))$ for its scalar and vector boundary maps.
  For every joint Schwartz test $h$, in particular every compact joint test, define the maps for $upright(bold(A))$ by

#[#set math.equation(numbering: n => "(8.23)")
 $ W_(upright(bold(A))) \( h \) & = sum_(bold(Delta) in product_i S_i) W_(upright(bold(A))_(bold(Delta))) \( h \) \,\
Psi_(upright(bold(A))) \( h \) & = sum_(bold(Delta) in product_i S_i)
  Psi_(upright(bold(A))_(bold(Delta))) \( h \) . $ <R:finite-field-expansion>]

The same joint kernel $h$ occurs in every term. This is a finite expansion of field labels,
  not an assertion that $h$ has finite tensor rank. Each summand is an already constructed tempered distribution,
  and every summand has the same cone for the chosen ordering.
  Their finite sum therefore has the required temperateness and support and has the specified analytic product as
  its Fourier–Laplace continuation. Adjunction and locality pass through the same finite expansion.
  The exact scaling laws of the summands give similarity covariance with dilations acting on the original field
  labels; a nonhomogeneous list is not assigned one total dimension.
  Orders and constants may be chosen by taking a maximum of the finitely many seminorm orders and a sum of the
  corresponding constants, without any uniform estimate over dimensions or lengths.
  Finite distributional derivatives in any slot preserve temperateness and cone support and have the shifted
  homogeneous covariance laws term by term.

The reflected identity also passes through this expansion with all cross terms.
  For arbitrary finite linear combinations $P \, Q$ of finite ordered words with joint tests,
  expand their original labels finitely and apply the homogeneous split to each pair of component words.
  Here $P^(*) Q$ uses reversed adjunction on each bra word and the tensor product of its conjugated,
  reversed test with the ket test. The result is

#[#set math.equation(numbering: n => "(8.24)")
 $ W \( P^(*) Q \) = chevron.l Psi \( P \) \, Psi \( Q \) chevron.r . $ <R:reflected-polynomials>]

In particular, the full joint Wightman positivity inequalities are the Gram inequalities for these vectors in the
  original $cal(H)$. This uses the cross-tuple splittings, not a claim of termwise positivity for the individual
  summands.

The homogeneous induction, vector construction, and finite identities (8.23) and (8.24) complete the proof of
  Theorem 51.

=== 8.6 The joint domain and affiliation with the given net <the-joint-domain-and-affiliation-with-the-given-net>

Let $cal(D)$ be the span of the reconstructed vacuum products with joint Schwartz test kernels,
  including compact joint kernels and finite sums of factorized smearings.

The passage from positive vacuum distributions to an invariant insertion domain is the Wightman reconstruction
  mechanism, in the test-algebra formulation of Borchers #cite(label("Wightman1956"))
  #cite(label("Borchers1962")). Here the vacuum vectors are already in the given $cal(H)$;
  after this domain construction we must still prove affiliation in the fixed net.

For an old vacuum word represented by such a kernel, expand its field labels as in (8.23) under the same joint
  kernel. Old product multilinearity and the old-only identification in Proposition 38 give equality of the old
  word vector with this finite sum of homogeneous reconstructed word vectors.
  This exact label expansion makes no finite-rank assertion about the joint kernel.
  Since $cal(D)_(upright("old"))$ is exactly the algebraic span of these original vacuum-word vectors,
  it follows that $cal(D)_(upright("old")) subset cal(D)$. In particular,
  $cal(D)$ is dense in the original $cal(H)$. This inclusion concerns the specified vacuum-generated domain,
  not arbitrary additional vectors of a separately chosen invariant domain.

Regard a test polynomial as a finite algebraic sum of finite ordered words with the allowed kernels.
  Multiplication concatenates the words and tensors their kernels,
  and adjunction reverses the entries and conjugates and reverses the kernel.
  All resulting lengths remain finite, with no fixed upper bound. Left insertion defines joint fields on $cal(D)$.
  To check that it is well-defined, let a whole polynomial $A$ represent a zero vector.
  Equation (8.24) gives $W \( A^(*) A \) = 0$. Positivity and Cauchy–Schwarz applied to $A$ and $B^(*) B A$,
  for any test polynomial $B$, give

$ \| W \( A^(*) B^(*) B A \) \|^2 lt.eq W \( A^(*) A \) thin W
  #scale(x: 120%, y: 120%)[\(] \( B^(*) B A \)^(*) \( B^(*) B A \) #scale(x: 120%, y: 120%)[\)] = 0 . $

Every term exists by the all-finite-length construction, and $W \( A^(*) B^(*) B A \) =
  parallel Psi \( B A \) parallel^2$. Thus zero states form a left ideal.
  This applies to the whole polynomial, even when its zero vector results from cancellation between different
  scaling components. Adjoint insertion gives $A^dagger \( macron(f) \) \|_(cal(D)) subset A \( f \)^(*)$,
  where the right side is the Hilbert-space adjoint. Its dense domain therefore makes each smeared field closable.
  For an old field inserted into a vector of $cal(D)_(upright("old"))$,
  the same old-only identification applied to the longer word,
  with the inserted test tensored with the original joint kernel, proves agreement with the old insertion.
  For compact old smearings, Section 2 identified that insertion and its adjoint with the restrictions of the
  original affiliated realizations. Thus the old fields and adjoints agree with their original polynomial
  restrictions on $cal(D)_(upright("old"))$, and (8.1) becomes the operator identity

#[#set math.equation(numbering: n => "(8.25)")
 $ square.stroked L = Theta quad upright("on ") cal(D) . $ <R:operator-leg>]

Translation covariance, similarity covariance, and locality are operator identities on this common invariant
  domain. No additional Hilbert-space sector has been introduced.

This gives the common operator domain but has not yet supplied a closed realization in a prescribed local algebra.
  For that purpose we prove exchange with every bounded element of that algebra’s commutant and then enlarge the
  domain by those commutant actions. The distinction matters because weak field locality on $cal(D)$ alone does
  not establish affiliation.

We will use the same extension argument for the new scalar, the old fields on the enlarged domain,
  and compact joint polynomials. It is convenient to prove it once for an adjoint pair.

#thm([Lemma 8.7.])[
  (Extension by commutant actions).  #emph[Let $cal(D)$ be dense in $cal(H)$, and let $A \,
    A^sharp$ be operators on $cal(D)$. Fix a localization set $K$ and the original algebras $cal(M) \( O \)$ for
    open neighborhoods $O$ of $K$. Suppose that for every such $O$ and every $C in cal(M) \( O \)'$,
$ chevron.l phi.alt \, C A psi chevron.r = chevron.l A^sharp phi.alt \, C psi chevron.r \, wide phi.alt \,
  psi in cal(D) \, $

 and that the corresponding identity also holds with $A \, A^sharp$ interchanged.
   Then $A$ has a closed extension affiliated with every $cal(M) \( O \)$, whose adjoint extends $A^sharp$.
   The reverse adjoint pair has the same property. If $A^sharp = A$, the extension is symmetric.]
] <R:commutant-extension>

#proof[
  Let $cal(D)_K$ be the span of $C_1 dots.h.c C_m psi$, with $psi in
    cal(D)$ and each $C_j$ in the commutant of an allowed neighborhood algebra, including $m = 0$.
    Every finite collection of these neighborhoods has a common smaller open neighborhood of $K$.
    By isotony all its commutant coefficients belong to the commutant of this smaller algebra.
    Products and adjoints of the coefficients therefore obey the assumed exchange identities.
  For a finite sum with product coefficients $C_i$, prescribe
  $ tilde(A) sum_i C_i psi_i = sum_i C_i A psi_i \, wide tilde(A)^sharp sum_i C_i psi_i = sum_i C_i A^sharp psi_i . $
  If the input sum is zero, pairing the proposed first image with $phi.alt in cal(D)$ gives $chevron.l A^sharp
    phi.alt \, sum_i C_i psi_i chevron.r = 0$. Density proves well-definedness;
    the reverse exchange proves it for the second prescription.
    For two sums use exchange with $D_j^(*) C_i$ in a common smaller algebra. This gives
  $ tilde(A)^sharp subset tilde(A)^(*) \, wide tilde(A) subset \( tilde(A)^sharp \)^(*) . $
  Both operators are thus closable. Their common domain is invariant under every unitary in every allowed
    commutant, and both operators commute with that unitary and its inverse.
    Their closed graphs retain these invariances, proving affiliation simultaneously with all the neighborhood
    algebras. The adjoint inclusions survive closure. In the symmetric case the two prescriptions coincide,
    so their closure is symmetric as well. ◻
]

#thm([Proposition 8.8.])[
  #emph[For every real test $f$ with compact support in an open region $O$,
    $L \( f \)$ has a closed symmetric extension affiliated with the original algebra $cal(M) \( O \)$.
    These realizations can be made compatible for all neighborhoods of $"supp" f$.]
] <R:affiliation>

#proof[
  We first prove exchange with every bounded operator of the actual commutant,
    not merely with opposite-region fields. If $C in cal(M) \( O \)'$, then
  #[#set math.equation(numbering: n => "(8.26)")
   $ chevron.l phi.alt \, C L \( f \) psi chevron.r = chevron.l L \( f \) phi.alt \, C psi chevron.r \, wide
     phi.alt \, psi in cal(D) . $ <R:commutant-exchange>]
  First take $phi.alt \, psi$ to be finite sums of words with factorized compactly supported tests,
    and by linearity treat one word on each side. Translate their slots into real mutually spacelike patches,
    all spacelike from $"supp" f$. Subdivide $f$ into local patches and choose its self-adjoint bounded
    approximants in $O$. The simultaneous approximating products converge there in Hilbert norm.
    Exchange holds at the bounded level because each approximant to $L \( f \)$ commutes with $C$.
    The norm limit proves (8.26) on that real open placement set.
  Continue separately in the translated polynomial slots on either side.
    A fixed $L \( f \)$ on the left of a polynomial leaves every suffix spectral cone of that polynomial intact;
    on a bra the corresponding opposite cones hold. The bounded operator $C$ between the vectors does not affect
    these two separate vector analyticity statements. To see the common domain explicitly,
    use the positive vector tube of (6.11) for each polynomial before taking the bra adjoint.
    For a polynomial $psi$ of length $n$, both $psi \( b \)$ and $L \( f \)
    psi \( b \)$ are holomorphic on that tube. In the latter product let $q_1$ be its total momentum and $q_2 \,
    dots.h \, q_(n + 1)$ its suffix momenta. Fixing the first, $L$, coordinate real removes its imaginary damping,
    but the strict polynomial gaps still damp all $q_j$ with $j gt.eq 2$.
    The real smearing contributes $hat(f) \( q_1 - q_2 \)$, whose rapid decay controls the remaining momentum
    since $\| q_1 \| lt.eq \| q_1 - q_2 \| + \| q_2 \|$. The tempered vector distribution therefore has this
    smeared face, with all finite derivative bounds. The same applies to $phi.alt$ and $L \( f \) phi.alt$.
    After conjugating the bra variables, the common scalar domain is the product of the negative bra tube and the
    positive ket tube. Boundedness of $C$ suffices for these pairings;
    neither commutation with translations nor invariance of $cal(D)$ under $C$ is used.
    Their scalar pairings therefore obey boundary uniqueness,
    which extends the identity to arbitrary placements and smearings.
    For a compact joint kernel, first use a finite partition into product patches and then approximate each piece
    by finite sums of factor tests in the required finite smooth seminorms.
    Theorem 51 gives Hilbert-norm convergence both for the polynomial vector and for the vector with the
    additional $L \( f \)$ slot. Boundedness of $C$ therefore passes the identity to the joint kernel.
    This test-topology limit neither asserts finite tensor rank nor uses invariance of $cal(D)$ under $C$.
    Compact joint tests are dense in the joint Schwartz space,
    so the same Hilbert-norm continuity extends exchange to all joint Schwartz kernels in $cal(D)$.
  Apply Lemma 57 with $A = A^sharp = L \( f \)$ and $K = "supp" f$.
    The exchange identity holds for every neighborhood, so the lemma gives one compatible closed symmetric
    affiliated extension. Essential self-adjointness is neither asserted nor required. ◻
]

For a complex test $f = f_1 + i f_2$, linearity of the exchange identities for the real tests gives the adjoint
  pair $A = L \( f \)$, $A^sharp = L \( macron(f) \)$ on $cal(D)$.
  Lemma 57 supplies a compatible closed affiliated realization with the required adjoint.
  This uses neither self-adjointness nor strong commutation of the real and imaginary parts.

We likewise need compatible realizations of the original entries on the reconstructed domain before using polar
  tails on its vectors. For an original field $A$ and compact test $f$,
  use the bounded approximants of Proposition 37, whose vacuum and adjoint-vacuum convergence was established
  before the mixed reconstruction. Fix an open $O$ containing $"supp"
  f$ and choose these approximants $A_R \( f \)$ in $cal(M) \( O \)$.
  Initially take the vectors to be words with factorized compactly supported tests, as above.
  At separated real placements the simultaneous product limits give convergence of $A_R \( f \)
  psi_R$ and $A_R \( f \)^(*) phi.alt_R$. Bounded commutation with $C in cal(M) \( O \)'$ therefore gives

#[#set math.equation(numbering: n => "(8.27)")
 $ chevron.l phi.alt \, C A \( f \) psi chevron.r = chevron.l A^dagger \( macron(f) \) phi.alt \,
   C psi chevron.r \, wide phi.alt \, psi in cal(D) . $ <R:old-commutant-exchange>]

Initially this holds on the separated placement set. The same separate-vector-tube argument,
  now with the first slot $A \( f \)$ or $A^dagger \( macron(f) \)$ smeared over real coordinates,
  and the same joint-test continuity extend it to all the stated vectors.
  Only the already proved mixed vector spectra and the boundedness of $C$ enter this continuation.

Apply Lemma 57 to the pair $A \( f \) \, A^dagger \( macron(f) \)$ on $cal(D)$,
  using (8.27) and its adjoint version in every neighborhood.
  This gives compatible affiliated extensions of the reconstructed restrictions,
  with adjoints extending the corresponding insertions. On $cal(D)_(upright("old"))$ these restrictions agree with
  the original chosen realizations by the old-domain argument above.
  We do not require the newly reconstructed vectors to lie in those previously chosen closed realizations,
  or identify their full graphs with the extensions just constructed.

Only now use polar truncation for these realizations on polynomial states.
  If $hat(A)$ is the chosen closed realization, then $hat(A)$ and $hat(A)^(*)$ agree on $cal(D)$ with the
  corresponding insertions, which preserve $cal(D)$. Induction gives

$ cal(D) subset "Dom" \( hat(A)^(*) hat(A) \)^m ∩ "Dom" \( hat(A) hat(A)^(*) \)^m wide \( m = 1 \, 2 \, dots.h \) \, $

with the powers there equal to the alternating joint polynomial words.
  Their norms are finite by Theorem 51, and spectral calculus gives the polar-tail estimates on every polynomial
  vector. For factorized polynomials, the natural-product and polar-cutoff argument of Section 2 applies to these
  compatible realizations. For compact joint kernels, take finite factor-test approximations in the required test
  seminorms and pass both the vacuum and adjoint-vacuum vectors by joint Hilbert-distribution continuity.
  The closed wedge Tomita graph then passes its reality relation from the factorized affiliated polynomial
  realizations to Hermitian joint polynomial vectors. These are the wedge reality properties needed for the charge
  estimates of Section 5.

Finally, affiliation is only one part of the physical-membership criterion in Assumption 2.
  The other part is also present: $L = S$ is the explicit time-line extraction from actual modular transforms of
  the physical virial field in arbitrarily small diamonds. Its separated products are the limits of those physical
  bounded operations, and their joint continuation is uniquely fixed by them.
  Thus the field satisfies the stated intrinsic membership criterion in the given net.
  In a gauge formulation all these operations take place in the chosen physical, gauge-invariant algebras.

All construction requirements have now been checked: localization in arbitrarily small original-net neighborhoods;
  joint field distributions at every finite length on the common invariant domain $cal(D) supset
  cal(D)_(upright("old"))$, with the required adjoints, covariance, spectrum, and locality;
  and compatible affiliated smeared realizations in the original net.
  The notation $L$ henceforth denotes the resulting physical Hermitian scalar of dimension two on $cal(D)$.

=== 8.7 Improvement and the local Ward algebra <improvement-and-the-local-ward-algebra>

Define on $cal(D)$

#[#set math.equation(numbering: n => "(8.28)")
 $ t_(mu nu) = T_(mu nu) + 1 / 3 \( partial_mu partial_nu - eta_(mu nu) square.stroked \) L . $ <R:improvement>]

It is a physical symmetric conserved tensor, and (8.25) gives $t^mu zws_mu = 0$.
  For an affine Poincaré Killing vector $X$, its charge difference from $T$ is the divergence of the antisymmetric
  superpotential

#[#set math.equation(numbering: n => "(8.29)")
 $ 1 / 3 partial^lambda (X_lambda partial_mu L - X_mu partial_lambda L + \( partial_lambda X_mu \) L) .
   $ <R:superpotential>]

Its compact commutator flux vanishes, so translation and Lorentz charges agree.
  If the initial stress tensor required the weight replacement of Section 2,
  also include the local difference between that selected tensor and the initial one.
  That difference is symmetric and conserved and has zero affine charges by the weight-replacement argument.
  This proves the improvement criterion. We now check the special-current Ward algebra on the actual reconstructed
  domain.

We first construct the local Ward action on the represented polynomial algebra generated by the original fields
  and $L$; this is distinct from the vector space $cal(F)$ of point-field labels.
  Proposition 61 will extend the action to every further jointly admitted finite family.
  For an open $O$, let $frak(P)_c \( O \)$ consist of finite sums of finite ordered products of original fields,
  $L$, and their covariant derivatives, smeared by compact smooth joint kernels supported in $O^n$,
  and identified when their restrictions to $cal(D)$ agree.
  The joint-domain construction makes concatenation and reversed adjunction well-defined on this quotient and
  leaves $cal(D)$ invariant. Write $P^dagger$ for the reversed field-adjoint polynomial,
  to distinguish it from the Hilbert adjoint. Every finite length and every admitted compact joint kernel are
  included; the kernel need not have finite tensor rank.

These compact polynomial insertions have compatible affiliated realizations in the original net.
  For a factorized word, take the natural-domain product of the single-field realizations constructed above,
  and take natural sums for finite polynomials. Their domains contain $cal(D)$,
  and their adjoints contain the reversed adjoint polynomials there, so they are closable.
  Every commutant unitary and its inverse preserve their natural graphs; their closures are therefore affiliated.
  This uses no commutation among the unbounded factors. In particular,
  $t \( f \)$ is the finite-sum case of this argument.

For a compact joint kernel, partition into product patches inside $O^n$ and approximate in the smooth test
  topology by finite sums of tensor tests. If $P_j$ are the resulting factorized polynomials, then Theorem 51,
  with any fixed $cal(D)$ word appended, gives

$ P_j psi arrow.r P psi \, wide P_j^dagger phi.alt arrow.r P^dagger phi.alt quad \( phi.alt \, psi in cal(D) \) $

in Hilbert norm. Affiliation of the factorized closures gives exchange with commutant unitaries,
  hence with every $C in cal(M) \( O \)'$ by linear combinations of unitaries.
  Boundedness of $C$ passes it to the limit:

$ chevron.l phi.alt \, C P psi chevron.r = chevron.l P^dagger phi.alt \, C psi chevron.r \, wide phi.alt \,
  psi in cal(D) . $

The reversed adjoint polynomial obeys the reverse exchange identity.
  Lemma 57, with $A = P$ and $A^sharp = P^dagger$, therefore supplies compatible affiliated extensions for every
  neighborhood of the compact localization. This is an extension with the required adjoint,
  not an assertion about the minimal closure or a limit of the factorized closures.
  Its polar truncations are bounded original-net operations converging on $cal(D)$,
  with adjoint convergence there. All the commutants here are those of the original net.

For a real conformal Killing field $X$, set $j_(X \, mu) =
  t_(mu nu) X^nu$ and $sigma_X = \( partial dot.op X \) \/ 4$.
  Conservation and tracelessness give $partial^mu j_(X \, mu) = 0$. Define

#[#set math.equation(numbering: n => "(8.30)")
 $ delta_X A = i \[ q_X \, A \] $ <R:Ward-definition>]

as a compact commutator flux enclosing the insertion. This is an operator insertion on $cal(D)$,
  without assuming the existence of a global unbounded charge on every state.
  More explicitly, smear the two fields with a compact kernel in their relative coordinate and the target test in
  their merged coordinate. Caps carry the same unit-flux normalization and orientation.
  In relative coordinates the commutator current is divergence-free and supported in causal positions.
  The difference of two normalized enclosing caps is a compact gradient there, up to spacelike outer cutoff terms.
  Conservation and locality therefore allow exact deformation or shrinking while keeping the target enclosed.
  The resulting expression is a finite sum of joint smeared products;
  combining the two momenta preserves the ordered cones for the remaining slots.
  Polynomial coefficients of $X$ give finite derivatives of test kernels and do not spoil these properties.

For a joint target compactly localized in $O$, partition into product patches and choose the relative caps within
  their localization margins. A flux about a word is the finite sum of the fluxes about its slots,
  so these representatives belong to $frak(P)_c \( O \)$. To check the quotient by zero operators,
  choose one absolute normalized compact cap enclosing the finite union of target projections for the polynomial
  representatives. It may lie outside $O$. Deformation identifies every slotwise cap with this cap.
  The algebraic commutator rule identifies the sum with $i \[ Q_X \, P \]$ on factor tests,
  and the same joint Hilbert continuity extends the identity to the joint kernel.
  Since $Q_X$ and $P$ preserve $cal(D)$, this vanishes if $P \|_(cal(D)) = 0$.
  Thus the local derivations are well-defined on $frak(P)_c \( O \)$ and preserve it;
  their iterates are finite joint polynomials. The preceding exchange argument supplies their compatible
  original-net affiliated extensions.

The complete vacuum flux vanishes on compact joint products by Lemma 24 and its subsequent dyadic charge estimate.
  That proof applies here because the new compact polynomial vectors have the wedge reality properties just
  proved, while the current vacuum wave is the same purely timelike, translation-smooth wave used there.
  Its mass-band estimate is uniform; the summable low-energy and high-energy dyadic bounds remain unchanged.
  Consequently

#[#set math.equation(numbering: n => "(8.31)")
 $ sum_(i = 1)^n W \( A_1 \, dots.h \, delta_X A_i \, dots.h \, A_n \) = 0 . $ <R:vacuum-Ward>]

The derivation preserves adjunction. Its translation, Lorentz,
  and dilation parts on the original fields are the physical actions:
  (8.29) handles the first two, and Proposition 28 removes the possible conserved virial charge in the third.
  Identities first proved on an old vacuum leg extend to $cal(D)$ by locality, old polynomial density,
  and ordered boundary uniqueness.

We need the transformation of the current itself to identify the Lie algebra. The two required primary identities are

#[#set math.equation(numbering: n => "(8.32)")
 $ delta_X L & = X^lambda partial_lambda L + 2 sigma_X L \,\
delta_X t_(mu nu) & = X^lambda partial_lambda t_(mu nu) + \( partial_mu X^lambda \)
  t_(lambda nu) + \( partial_nu X^lambda \) t_(mu lambda) + 2 sigma_X t_(mu nu) . $ <R:primary-L>]

We explain their return from the previously established pair representation.
  All short analytic products now agree with the joint tempered ones:
  they agree on separated vacuum-wave products, then everywhere by continuation.
  Thus the Wick sphere/cap comparison of Proposition 47 applies directly to physical joint pair boundaries.
  For a translation and target $T$, the Lorentzian cap difference is the physical translation Ward identity.
  Its sphere version has the common nonzero normalization fixed there.
  The translation sphere identity for $L$ was already proved,
  and differentiating it at a fixed enclosing surface gives the same identity for the derivative terms in (8.28).
  It therefore holds with target $t$.

Conjugate these translation identities in the positive pair representation of Proposition 46,
  whose primary targets include $L$ and $t$. Transporting the surrounding sphere and its holomorphic Killing
  coefficient gives the sphere identities for every conformal Killing field.
  Return to Lorentzian commutators with the same averaged cylinders as in Proposition 47.
  The time caps converge by the joint tempered boundary theorem;
  the sides have a fixed spacelike margin and vanish with their thickness.
  The Wick pullback of $X$ is holomorphic on these compact surfaces,
  so the identical argument works for its degree-zero, degree-one, and degree-two coefficients.
  The normalization is the translation normalization in every case. This proves (8.32)–(8.32) on the vacuum.
  Their discrepancies are relatively local insertions. Move such an insertion to an extreme position on a
  spacelike open set; old polynomial density and ordered uniqueness then show that its vacuum vanishing implies
  vanishing on $cal(D)$. The two displayed identities are therefore operator insertion identities on that domain.

#thm([Proposition 8.9.])[
  #emph[The compact-flux Ward derivations realize the conformal Lie algebra with the active-action convention
#[#set math.equation(numbering: n => "(8.33)")
 $ \[ delta_X \, delta_Y \] = - delta_(\[ X \, Y \]) . $ <R:Lie-sign>]

 They obey (8.31) and extend the physical affine Ward derivations on the original field algebra.]
] <R:Ward-Lie>

#proof[
  Coordinates multiplying fields are held fixed when taking a Ward variation.
    Using (8.32), the conformal Killing equation, and conservation, direct differentiation gives
  #[#set math.equation(numbering: n => "(8.34)")
   $ delta_X j_(Y \, mu) = partial^lambda \( X_lambda j_(Y \, mu) - X_mu j_(Y \, lambda) \) -
     j_(\[ X \, Y \] \, mu) . $ <R:current-variation>]
  For example, expanding the divergence gives $4 sigma_X j_(Y \, mu) +
    X dot.op partial j_(Y \, mu) - \( partial^lambda X_mu \) j_(Y \, lambda)$;
    subtracting $j_(\[ X \, Y \])$ cancels the derivative of $Y$, and $partial_lambda X_mu + partial_mu X_lambda =
    2 sigma_X eta_(lambda mu)$ yields exactly the two index terms and the remaining $2 sigma_X$ in (8.32).
  Choose one compact flux $Q_Y \( F \)$ implementing $delta_Y$ on an insertion $A$ and its local $X$ variation.
    Use a larger compact flux for $delta_X$ on $Q_Y \( F \)$ and these insertions.
    The derivation rule on the joint domain gives
  $ \[ delta_X \, delta_Y \] A = i \[ delta_X Q_Y \( F \) \, A \] . $
  The first term on the right of (8.34) is an antisymmetric divergence.
    Its commutator flux about the compact insertion is zero: integration by parts leaves only the outer boundary,
    where locality permits the cutoff to be removed. The second term therefore gives $-
    i \[ Q_(\[ X \, Y \]) \( F \) \, A \] = - delta_(\[ X \, Y \]) A$.
    All products and iterated insertions in this calculation are defined by compact joint kernels on $cal(D)$.
    Equation (8.31) and the affine identification were proved above. ◻
]

=== 8.8 Centered fields and compatible families <centered-fields-and-compatible-families>

A Ward variation with polynomial coordinate coefficients is an insertion,
  but need not itself be a translation-covariant point-field label.
  We now remove that coordinate part and verify the intrinsic membership criterion for each finite family needed
  in a finite Ward calculation. Write

$ p_c \( z \) = c \, wide d \( z \) = z \, wide m_(b \, c) \( z \) = \( b dot.op z \) c - \( c dot.op z \) b \,\
k_b \( z \) = 2 \( b dot.op z \) z - z^2 b \, wide b \, c in bb(R)^(1 \, 3) . $

Fix a homogeneous finite Lorentz multiplet $A$ of dimension $Delta$ among the original fields, $L$,
  and their covariant derivatives. Let $N_A$ be the dimension of its component space. Define the centered insertion

$ B_(b \, A) \( x \) = delta_(k_b^(\[ x \])) A \( x \) \, wide k_b^(\[ x \]) \( z \) = k_b \( z - x \) . $

For a target test $f$, this denotes $i$ times the difference of joint products with relative kernel $f \( x \)
  h^mu \( r \) k_b^nu \( r \)$, $r = y - x$, where $h$ is a normalized enclosing cap.
  It involves no pointwise product or unsmeared surface restriction.
  The cap deformation just proved makes the definition independent of its admissible normalized choice.

Define its iterates on the same polynomial domain by

$ B_A^(\( 0 \)) & = A \,\
B_(b_r dots.h b_1 \, A)^(\( r \)) \( x \) & = delta_(k_(b_r)^(\[ x \]))
  B_(b_(r - 1) dots.h b_1 \, A)^(\( r - 1 \)) \( x \) \, wide r gt.eq 1 . $

Every fixed expression is a finite compact joint polynomial because $delta_X$ preserves the local polynomial algebra.

#thm([Proposition 8.10.])[
  (Finite families of centered fields).  #emph[Let $A$ range over a fixed finite collection of homogeneous
    original fields, $L$, and their covariant derivatives. For every fixed finite collection of depths,
    the corresponding centered fields $B_A^(\( r \))$ have all mutual and original-field joint products on
    $cal(D)$, with the required adjoints, locality, covariance, ordered spectra,
    and compatible original-net affiliated realizations. If $A$ has real dimension $Delta$ and $N_A$ components,
    depth $r$ has dimension $Delta - r$ and at most $4^r N_A$ components before field identities.
    These finite families satisfy the intrinsic membership criterion of Assumption 2.
    Every finite Ward word on the original fields and $L$ is a finite sum of polynomial-coordinate multiples of
    derivatives of such centered fields.]
] <R:centered-families>

#proof[
  For a similarity $g \( z \) = lambda Lambda z + a$, $lambda > 0$,
    write $U \( g \)$ for the already given Poincaré/dilation implementer.
    Changing variables in the smooth current test for the dimension-four $t$ sends $X$ to $g_(*) X =
    lambda Lambda X compose g^(- 1)$ and an absolute normalized cap test $h_0$ to $\( h_0 \)_g =
    lambda^(- 1) Lambda h_0 compose g^(- 1)$, in the tensor convention of their contraction.
    For a relative cap, the translation cancels in this formula.
    Since $g_(*) k_b^(\[ x \]) = lambda^(- 1) k_(Lambda b)^(\[ g x \])$, cap independence gives
  $ U \( g \) B_(b \, A) \( x \) U \( g \)^(- 1) = lambda^(Delta - 1) rho_A \( Lambda \)
    B_(Lambda b \, A) \( g x \) \, $
  where $rho_A$ is the Lorentz component matrix of $A$. Thus $B_(b \, A)$ is a possibly zero translation-covariant
    homogeneous insertion of real grade $Delta - 1$, in a finite Lorentz family with one additional vector index.
    Only the existing similarity covariance and the proved cap deformation have been used.
  Let $s_(b \, c)$ denote the constant component matrix in the affine action
  $ delta_(p_c) A = c dot.op partial A \, wide delta_d A = \( x dot.op partial + Delta \) A \, wide
    delta_(m_(b \, c)) A = \( m_(b \, c) \( x \) dot.op partial + s_(b \, c) \) A . $
  Expanding $k_b \( z - x \) = k_b \( z \) - 2 \( b dot.op x \) d \( z \) - 2 m_(b \, x) \( z \) +
    p_(k_b \( x \)) \( z \)$ in the centered flux gives
  #[#set math.equation(numbering: n => "(8.35)")
   $ delta_(k_b) A \( x \) = #scale(x: 120%, y: 120%)[\(] k_b \( x \) dot.op partial + 2 Delta \( b dot.op x \) +
     2 s_(b \, x) #scale(x: 120%, y: 120%)[\)] A \( x \) + B_(b \, A) \( x \) . $ <R:centered-Ward>]
  The polynomial-coordinate term is an insertion, in general not a translation-covariant point-field label;
    its coefficients multiply the target test after smearing. For example, (8.32) gives $B_(b \, L) = 0$.
  The local affine Ward actions on $B$ also follow from the proved Lie relation.
    Indeed $\[ p_c \, k_b \] = 2 \( b dot.op c \) d + 2 m_(b \, c)$ and $\[ d \, k_b \] = k_b$.
    At a fixed enclosing cap target differentiation commutes with the commutator, so (8.33) gives
  $ \( partial_c - delta_(p_c) \) delta_(k_b) A & = 2 \( b dot.op c \) delta_d A + 2 delta_(m_(b \, c)) A \,\
delta_d delta_(k_b) A & = \( x dot.op partial + Delta - 1 \) delta_(k_b) A . $
  The polynomial term in (8.35) has the same two defects. Subtraction gives $delta_(p_c) B =
    c dot.op partial B$ and $delta_d B = \( x dot.op partial + Delta - 1 \) B$.
    The Lorentz bracket $\[ m_M \, k_b \] = - k_(M b)$ for $m_M \( z \) =
    M z$ similarly gives the tensor-product component action.
    Thus these affine identifications are consequences, not an assumed conformal closure.
  For any fixed finite collection of centered insertions, substituting their relative kernels into a joint product
    expands it into finitely many of the already constructed products.
    This is a continuous map of compact smooth or Schwartz test spaces:
    the relative supports are compact and the coefficients are polynomial.
    It supplies all joint products at every finite length on $cal(D)$, including adjoints and all mixed orderings.
    Merging each block retains the ordered suffix cones. For real $b$ and $h$,
    reversing the two products gives $B_(b \, A)^dagger = B_(b \, A^dagger)$.
    Positivity holds in the original Hilbert space, and locality follows by shrinking the relative supports on
    spacelike product patches; a compact test on the spacelike configuration set is first partitioned into such
    patches. The preceding exchange argument supplies compatible original-net affiliated realizations and their
    adjoints for these finite homogeneous families.
  At each depth, choose a shrinking representative of the previous depth inside an inner neighborhood,
    and its enclosing cap inside the prescribed target neighborhood.
    The previous depth’s locality makes its current commutator causally supported,
    so conservation gives the same normalized-cap deformation and shrinking property at the next depth.
    Every nested expression is still a finite joint polynomial in the original fields and $L$.
    The joint continuity and full-commutant construction above therefore give all mutual products and compatible
    affiliation for any fixed finite collection of depths. The covariance calculation gives grade $Delta -
    r$ and at most $4^r N_A$ components before field identities.
    Equation (8.35), the affine actions just proved, and finite Leibniz rules express every fixed finite Ward word
    as a finite sum of polynomial-coordinate multiples of finite derivatives of these families.
    For an original $A = sum_(Delta in S_A) A_Delta$, do this separately for the finitely many components,
    using the same target joint kernel in every component term and assigning no single weight to their sum.
    Thus each finite Ward calculation uses homogeneous insertions in a jointly constructed finite family on
    $cal(D)$. This does not identify them with original labels in $cal(F)$,
    assert global closure under centered descendants, or construct a conformal action on the weakly closed bounded
    net. ◻
]

The same currents also act on other fields already admitted by the intrinsic criterion.
  This requires a joint reconstruction with $L$; separate admission of two families is not by itself a statement
  about their mutual products.

#thm([Proposition 8.11.])[
  (Extension to compatible physical families).  #emph[Let $cal(G)$ be a finite homogeneous finite-component family
    jointly admitted with the original fields under Assumption 2.
    The scalar $L$ has all joint products with this family and the original fields,
    with compatible adjoints and original-net affiliated realizations on a common invariant domain
    $cal(D)_(cal(G)) supset cal(D)$ in the original Hilbert space.
    On the resulting represented polynomial algebra, the same currents $j_X$ give unbroken local conformal Ward
    derivations, extending the physical Poincaré and dilation actions on $cal(G)$ as well as on the original
    fields. Every fixed finite family of their centered Ward descendants satisfies the same intrinsic membership
    criterion. These constructions agree when one compatible family is contained in another.]
] <R:compatible-families>

#proof[
  Regard the original fields and $cal(G)$ as the spectator fields in the boundary reconstruction of this section.
    Their joint products, common invariant realization, adjoints,
    and original-net affiliations are given by the admission criterion.
    Each fixed homogeneous list has tempered vacuum distributions by the scaling argument of Section 2;
    finite sums treat the original labels. Their affiliated polar truncations obey Proposition 37,
    since the required moments are alternating words in these already given joint products.
    Thus Proposition 38 supplies their analytic products with the same accessible $L$ and the same reflected
    splittings. No current Ward identity on $cal(G)$ is needed for this step.
  The pure $L$ construction is unchanged. In the simultaneous mixed induction,
    replacing $L$ by $Theta$ lowers the number of $L$ entries and adds an original homogeneous spectator.
    The merged-face estimate, causal ambiguity, Gaussian coefficient recovery,
    and scaling argument therefore apply with $cal(G)$ among the fixed spectator labels.
    They prove Theorem 51 for every such enlarged list. Its positivity and full-commutant exchange then give the
    invariant joint domain $cal(D)_(cal(G))$ and the compatible affiliated realizations exactly as above.
    Products involving only the original fields and $L$ agree with the previous ones:
    their analytic products are the same approximation-independent limits,
    and their tempered boundaries are unique. Consequently $cal(D) subset
    cal(D)_(cal(G))$ and all insertion actions agree there. Old-and-$cal(G)$ products likewise retain their given
    vacuum-generated restrictions, without requiring agreement of chosen closed realizations on an independently
    larger domain. The same reasoning proves agreement for nested compatible families.
    If derivatives of the added fields are included as labels,
    their dimensions lie in the finite union of progressions $Delta + bb(Z)_(gt.eq 0)$;
    each fixed grade receives only finitely many derivative components.
    This preserves finite scaling support and the stipulated locally finite, bounded-below grade convention.
  Compact commutator fluxes now define $delta_X$ on the enlarged polynomial algebra.
    Conservation, locality, and joint continuity give cap deformation, the derivation rule,
    and preservation of the quotient by zero operators just as before.
    Its compact polynomial vectors have wedge reality by their affiliated realizations and the joint graph limits.
    Lemma 24 and its summable dyadic estimate therefore give vanishing complete vacuum flux and the Ward identity
    (8.31) on the enlarged domain.
  We check the physical affine actions on the added fields, rather than assume them.
    Let $X$ be a translation, Lorentz, or dilation generator, and let $G_X$ be its given self-adjoint generator,
    with the convention that the physical variation is $i \[ G_X \, dot.op \]$.
    For a compact smearing $F$ of a member of $cal(G)$ and an old compact polynomial $C$, the vacuum Ward identity gives
  $ chevron.l C Omega \, delta_X F thin Omega chevron.r = - chevron.l \( delta_X C \) Omega \, F Omega chevron.r =
    i chevron.l G_X C Omega \, F Omega chevron.r = chevron.l C Omega \, i G_X F Omega chevron.r . $
  The middle identity uses the already proved affine action on old polynomials.
    Smooth compact smearing and the given similarity covariance place $F Omega$ and $C
    Omega$ in the generator domains; the vacuum is invariant.
    Density of old polynomial vectors thus identifies the vacuum action with the physical affine variation of $F$,
    including its component and weight terms.
  The discrepancy between these two variations is relatively local and closable on $cal(D)_(cal(G))$:
    it is a finite compact joint insertion with a densely defined reversed adjoint. It annihilates the vacuum.
    Choose an old double cone spacelike to its compact localization.
    Locality makes it annihilate every old polynomial vacuum vector from that cone, a dense set by Reeh–Schlieder.
    The closure of its graph therefore contains $cal(H) times { 0 }$,
    and being an operator graph it can contain no nonzero output.
    The discrepancy vanishes on the whole joint domain. This proves the required affine identifications without
    assuming new current Ward identities.
  The primary identities for $L$ and $t$ likewise persist on the enlarged domain:
    their relatively local discrepancies vanish on the original dense domain,
    and the same adjoint and closed-graph argument applies. The current-variation computation and compact nested
    flux proof of Proposition 59 consequently give the conformal Lie relation on every enlarged polynomial
    insertion. Finally the centered construction of Proposition 60 uses only these Ward identities,
    similarity covariance, cap shrinking, and finite joint products.
    Repeating it on $cal(D)_(cal(G))$ proves its conclusion for every fixed finite family of added targets and
    finite descendant depths. ◻
]

Thus the improvement (8.28) lies in the original physical theory,
  has the original translation and Lorentz charges, and is traceless.
  Its special-conformal currents are physical conserved currents with unbroken local Ward identities.
  The conclusion concerns flat spacetime and does not impose a curved-background Weyl identity.

#bibliography("refs.bib", style: "ieee", title: [References])
