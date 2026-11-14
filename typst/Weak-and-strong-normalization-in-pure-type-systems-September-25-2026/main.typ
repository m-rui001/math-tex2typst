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

#align(center)[#text(size: 16pt, weight: "bold")[Weak and strong normalization in pure type systems]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <sec:introduction>

A pure type system specifies which sorts classify other sorts and which sorts may form dependent function types.
  A term is #emph[weakly $beta$-normalizing] if some sequence of $beta$-reductions reaches a normal form;
  it is #emph[strongly $beta$-normalizing] if every such sequence is finite.
  The distinction is between existence of a terminating computation and termination under every choice of reductions.

We use the full annotated syntax: reduction is allowed in the domain of an abstraction and in both components of a
  dependent product. Contexts may be open. A legal expression is either side of a derivable typing judgment;
  declaration types are included by context validity. The formal rules and conventions are given below before the
  main theorem.

=== 1.1 Pure type systems and normalization <pts:setup>

We first fix the syntax and the scope of the normalization properties.
  All contexts in the typing rules are finite, and all reductions include reductions inside annotations.

#prodef([Definition 1.1.])[
  (Specification and expressions).  A #emph[pure type specification] is a triple
    $cal(P) = \( cal(S) \, cal(A) \, cal(R) \)$, where $cal(S)$ is a set of #emph[sorts],
    $cal(A) subset.eq cal(S)^2$ is a relation of #emph[axioms],
    and $cal(R) subset.eq cal(S)^3$ is a relation of #emph[product rules]. Neither relation is assumed functional.
    Using a countably infinite set of variables disjoint from $cal(S)$, form the raw expressions
  $ M \, N \, A \, B : := x divides s divides M N divides lambda x : A . M divides Pi x : A . B \, wide s in cal(S) . $
  Expressions are identified up to renaming bound variables.
    In each binder the variable binds in the body or codomain, but not in its annotation or domain.
    Application associates to the left. Substitution is capture avoiding;
    $M \[ x := N \]$ denotes substitution for one free variable.
  A raw context is a finite sequence $Gamma = \( x_1 : A_1 \, dots.h \, x_n : A_n \)$ with distinct declared
    variables. Its domain is $"dom" \( Gamma \) = { x_1 \, dots.h \, x_n }$.
    Whenever a rule appends $x : A$, its variable $x$ is fresh for the preceding context and for $A$.
] <pts:specification>

#prodef([Definition 1.2.])[
  (Full beta reduction).  The relation $arrow.r_beta$ is the compatible closure of
  $ \( lambda x : A . M \) N arrow.r_beta M \[ x := N \] . $
  Compatibility permits a step in either child of an application, product, or lambda.
    In particular, both $lambda x : A . M arrow.r_beta lambda x : A' . M$ when $A arrow.r_beta A'$ and $Pi x :
    A . B arrow.r_beta Pi x : A' . B$ are permitted. Write $arrow.r_beta^(*)$ for its reflexive-transitive closure
    and $=_beta$ for the equivalence relation it generates. A normal expression has no beta redex at any position.
    An expression is #emph[weakly normalizing] if it reduces to a normal expression,
    and #emph[strongly normalizing] if it starts no infinite reduction sequence.
] <pts:beta>

Typing is the least relation closed under these seven rules, with $s \, s_1 \, s_2 \, s_3$ literal sorts.

$ frac(\( s_1 \, s_2 \) in cal(A), diameter tack.r s_1 : s_2) thick upright("Axiom") wide
  frac(Gamma tack.r A : s, Gamma \, x : A tack.r x : A) thick upright("Variable")\
frac(Gamma tack.r M : B wide Gamma tack.r A : s, Gamma \, x : A tack.r M : B) thick upright("Weakening")\
frac(Gamma tack.r A : s_1 wide Gamma \, x : A tack.r B : s_2 wide \( s_1 \, s_2 \, s_3 \) in cal(R), Gamma tack.r
  Pi x : A . B : s_3) thick upright("Product")\
frac(Gamma \, x : A tack.r M : B wide Gamma tack.r Pi x : A . B : s, Gamma tack.r lambda x : A . M : Pi x : A . B)
  thick upright("Abstraction")\
frac(Gamma tack.r M : Pi x : A . B wide Gamma tack.r N : A, Gamma tack.r M N : B \[ x := N \]) thick
  upright("Application")\
frac(Gamma tack.r M : A wide Gamma tack.r B : s wide A =_beta B, Gamma tack.r M : B) thick upright("Conversion") . $

The relation is understood relative to the fixed specification.
  When two specifications are compared we indicate the system on the judgment.
  A derivation is always finite, including a finite conversion chain witnessing each use of $=_beta$.

#prodef([Definition 1.3.])[
  (Contexts, legality, and system normalization).  A context $\( x_1 : A_1 \, dots.h \, x_n : A_n \)$ is
    #emph[valid] if each $A_i$ is typed at some literal sort in the preceding prefix.
    An expression is #emph[sorted] in $Gamma$ if $Gamma tack.r A : s$ for some $s in cal(S)$.
    It is #emph[legal] in $Gamma$ if it is the subject or the expected type of a derivable judgment in $Gamma$.
  The system is weakly normalizing, respectively strongly normalizing,
    if every legal expression in every context is weakly normalizing, respectively strongly normalizing.
    These are system-wide properties; neither statement replaces its universal quantifier by a hypothesis about a
    single expression. The reduction relation acts on the expression itself, including its annotations;
    it does not unfold declarations in the external context.
] <pts:normalization>

#thm([Theorem 1.])[
  (The $beta$-Barendregt–Geuvers–Klop conjecture).  #emph[Let $cal(P) = \( cal(S) \, cal(A) \, cal(R) \)$ be any
    pure type system. If every legal expression of $cal(P)$, in every valid context, is weakly $beta$-normalizing,
    then every such expression is strongly $beta$-normalizing.
    No functionality assumption is imposed on $cal(A)$ or $cal(R)$.]
] <thm:main>

Both quantifiers in Theorem 1 range over the whole system.
  The theorem does not assert that an individual term with a normal form is strongly normalizing.
  In particular, the proof may use weak normalization of expressions other than the one whose strong normalization
  is being established. The result concerns $beta$-reduction; it makes no assertion about adding $eta$-reduction.

===== 1.1.1 History and significance. <history-and-significance.>

Geuvers formulates the system-wide conjecture, for both $beta$ and $beta eta$ reduction,
  in his thesis #cite(label("Geuvers1993")) Conjecture 8.1.2.
  Theorem 1 establishes its $beta$ instance for arbitrary specifications.
  It allows a proof that every legal expression has a normal form to serve also as a proof of termination under
  every choice of beta reductions. This includes computations inside types and annotations,
  which may continue after the computational body has reached normal form.
  The hypothesis remains a property of the whole system: the argument can use normal forms of open expressions
  other than the expression under study.

One line of earlier work reduces strong normalization to weak normalization of translated terms.
  The translation must preserve typing, so the products available in the source specification are decisive.
  Sørensen’s continuation-passing construction proves the implication for generalized nondependent, clean,
  negatable systems #cite(label("Sorensen1997")) Theorem 3.5.20; the uniform nondependent result of Barthe,
  Hatcliff and Sørensen develops this approach #cite(label("BartheHatcliffSorensen2001")).
  Mull’s thesis weakens the cleanliness and negatability restrictions within the nondependent tiered setting
  #cite(label("MullThesis2023")) Theorem 2. Here the sorts form a finite axiom chain and each product inherits its
  codomain’s sort. In particular, the theorem allows a weakly clean alternative at each non-top tier that does not
  require negatability, alongside an alternative retaining negatability and a further cleanliness condition.
  These results explain both the force of type-preserving translations and the importance of the product rules
  they require.

Structural transformations offer a complementary way to reduce the problem.
  Roux and van Doorn prove weak-normalization preservation for disjoint sums and a specified family of added
  product rules, using labelled syntax and dependency erasure #cite(label("RouxVanDoorn2014")) Sections 3–4.
  Mull proves that the Barendregt–Geuvers–Klop implication transfers from the irrelevance reduction of a tiered
  system to that system #cite(label("Mull2023")) Theorem 47.
  This is a conditional reduction of the conjecture within the tiered class.
  More recently, Roux proposes an internal proof translation with reported constructions for the simply typed
  lambda calculus, System F, and a trivial recursive type #cite(label("Roux2025")) slides 16–17.
  The general specification considered here need not have a hierarchy of sorts,
  functional axiom or product relations, or the products required by any of these translations.

Annotations impose a separate constraint on comparisons between systems.
  Barthe and Coquand exhibit nonnormalizing pure type systems in which erasing lambda-domain annotations
  identifies terms of the same type and context that are not beta-convertible #cite(label("BartheCoquand2006"))
  Theorem 17. The auxiliary erasure used below retains all annotations.
  It removes only proof/data mode labels, and its reduction-lifting property is proved for each ordinary typed
  beta step.

===== 1.1.2 Proof strategy. <proof-strategy.>

A finite derivation of a counterexample uses only a finite part of the specification,
  so the proof first reduces to finite sort and rule sets. Under weak normalization and confluence,
  every legal expression then has a unique normal form. The #emph[sort profile] of a normal type records all sorts
  at which it can be typed. Retaining this set accommodates nonfunctional specifications;
  tracking its growth under substitution replaces an appeal to uniqueness of types.

The candidate argument follows the Tait–Girard reducibility tradition #cite(label("Girard1989")) Chapters 6
  and 14. Its candidates are sets of strongly normalizing terms closed under the head expansions needed here;
  their lattice, product tests and substitution laws are proved explicitly, without requiring reduction closure.
  Profiles form a finite signed graph: in a dependent product,
  the domain reverses inclusion between candidates and the codomain preserves it.
  Processing its strongly connected components in dependency order establishes that a strongly normalizing
  function applied to any finite, correctly typed stack of strongly normalizing arguments remains strongly
  normalizing. This excludes a smallest nonnormalizing application and yields the theorem.

Components whose signs are consistent admit an ordered fixed point by Tarski’s theorem #cite(label("Tarski1955")).
  A second construction handles products with at most one child in the current component.
  The remaining components require observation tables, indexed by stacks of normal arguments and auxiliary values.
  Negative domain occurrences make the equations for these spaces circular.
  The construction resolves that circularity using well-founded recursion for some profiles and alternating finite
  stages for the others. Its key bound is uniform over all observations of a fixed typed expression,
  although the possible arguments and stack lengths are unbounded.
  Semantic substitution and reduction transport then give the candidate equality required at a dependent application.

This last construction is conditional on a graph exclusion.
  The forbidden configuration records the profile pattern forced if substitution exposes new product nodes counted
  by the recursion’s measure on normal types. Weak normalization rules it out through a second, typed argument.
  The product rules in such a configuration support a small formula calculus and a relational realization of
  Hurkens’s well-foundedness paradox #cite(label("Hurkens1995")),
  using the presentation of Geuvers #cite(label("Geuvers2007")) Section 2.

Realizing that argument requires more than reproducing its final diagonal steps.
  The derived formula calculus can quantify only over data types supported by particular product rules in the
  profile graph. Moreover, the general cancellation law for wrappers compares formula observations by logical
  equivalence; this gives no permission to replace a data expression inside a function.
  Two data channels provide the predicates and observations needed by the diagonal.
  Their access construction retains an open parameter exactly while rounding a second data argument.
  Explicit validity and extensionality conditions then state which observations and predicates respect the
  resulting comparisons. The guarded diagonal uses precisely these conditions,
  and every logical quantifier is checked against the available product rules.

The resulting labelled term proves a designated terminal formula in a context where a direct syntactic descent
  excludes every proof-mode term with normal erasure. Data inhabitants of the same terminal do not affect this
  statement. Erasure leaves all type annotations intact, and every ordinary reduction of the erased typed proof
  lifts to a labelled reduction. Weak normalization would therefore give the excluded normal erasure.
  This contradiction supplies the graph exclusion and completes the candidate argument.

===== 1.1.3 Organization. <organization.>

Section 2 establishes the required PTS metatheory. Sections 3 and 4 develop the candidate interface and its two
  simpler realizations. Section 5 constructs the remaining interpretation, conditional on the graph exclusion.
  Sections 6, 7 and 8 build the logical and relational realization. Section 9 gives the guarded diagonal argument.
  Section 10 proves the exclusion and completes the theorem.

== 2 Structural properties <pts:metatheory>

The following facts let us use finite open contexts and chosen typing derivations without assuming uniqueness of
  sorts or product rules. These are standard properties of pure type systems;
  compare #cite(label("Poll1994")) Chapter 2. We give the proofs needed here,
  especially the steps concerning annotations and nonfunctional specifications.

#thm([Lemma 2.])[
  (Validity and scope).  #emph[If $Gamma tack.r M : A$, then $Gamma$ is valid,
    and $upright("FV") \( M \) union upright("FV") \( A \) subset.eq "dom" \( Gamma \)$.
    For each declaration of $Gamma$, its sorting judgment in the preceding prefix occurs as a subderivation of the
    given derivation.]
] <pts:validity>

#proof[
  Induct on the derivation. An axiom has empty context. The variable and weakening rules supply the sorting
    judgment for their last declaration; the induction hypothesis supplies the earlier ones.
    Every other rule has a premise with unchanged context, so its induction hypothesis supplies validity and the
    required subderivations. Scope follows in the same induction. For application, use
  $ upright("FV") \( B \[ x := N \] \) subset.eq \( upright("FV") \( B \) \\ { x } \) union upright("FV") \( N \) . $
  The binder cases remove their fresh bound variable from the free variables of the body. ◻
]

#thm([Lemma 3.])[
  (Thinning by insertion).  #emph[Suppose $Gamma tack.r M : A$,
    and suppose that $Delta$ is a valid context containing the declarations of $Gamma$ unchanged and in their
    original order. Then $Delta tack.r M : A$.]
] <pts:thinning>

#proof[
  Induct on the size of the given derivation. For an axiom, weaken through the declarations of $Delta$.
    For a variable or weakening rule, split $Delta$ just after the last declaration of the source context.
    Transport the rule’s premises to the part before that declaration by induction, reapply the rule,
    and then weaken through the remaining suffix. The necessary sorting judgments for that suffix are supplied by
    validity of $Delta$.
  At a binder, first rename its bound variable fresh for $Delta$.
    Its domain sorting is a premise of product formation or a smaller subderivation supplied by Lemma 2.
    Induction transports this sorting to $Delta$, making the extended target context valid.
    Induction therefore also transports the body or codomain premise to that extension. Reapply the original rule.
    Application and conversion transport their unchanged-context premises and reapply their rule. ◻
]

#thm([Lemma 4.])[
  (Typed substitution).  #emph[Let $Gamma = \( x_1 : A_1 \, dots.h \, x_n : A_n \)$ and let $Delta$ be valid.
    Suppose a simultaneous substitution $sigma$ satisfies
$ Delta tack.r sigma \( x_i \) : A_i \[ sigma \|_({ x_1 \, dots.h \, x_(i - 1) }) \] wide \( 1 lt.eq i lt.eq n \) . $

 Then $Gamma tack.r M : A$ implies $Delta tack.r M sigma : A sigma$. In particular, if
$ Gamma \, x : D \, Theta tack.r M : A \, wide Gamma tack.r N : D \, $

 then
$ Gamma \, Theta \[ x := N \] tack.r M \[ x := N \] : A \[ x := N \] . $

]
] <pts:substitution>

#proof[
  Raw substitution preserves beta conversion. Indeed, a substituted root contraction is a contraction after
    renaming bound variables fresh; the required equality is the composition law for capture-avoiding
    substitutions. Compatibility extends this to every reduction position, and hence to conversion chains.
  For the simultaneous assertion, induct on the source derivation. Thin axioms to $Delta$.
    At a variable use its assigned judgment, and at weakening discard the assignment for the last declaration.
    Under a binder $x : D$, choose $y$ fresh for $Delta$ and the images of $sigma$.
    Transport the domain sorting by induction, extend the target context to $Delta \, y : D sigma$,
    and extend the substitution by $x mapsto y$. The earlier assignments thin to this context;
    the new assignment is the variable rule. Apply induction to the binder premise and reapply product formation
    or abstraction with the original axiom or rule choices. Application uses substitution composition.
    Conversion uses the transported sorting of its target and preservation of raw conversion.
  For single substitution with a dependent suffix, construct the target context one declaration at a time.
    Start with the identity assignments on $Gamma$ and the image $x mapsto N$.
    Transport the first suffix declaration’s sort judgment by the simultaneous assertion, append that declaration,
    thin the old assignments, and assign its new variable to itself.
    Repeat through $Theta$, then transport the desired judgment.
    This also proves validity of the substituted target context. ◻
]

#thm([Lemma 5.])[
  (Conversion of a declaration).  #emph[Suppose $Gamma tack.r D : s$, $Gamma tack.r D' : s'$, and $D =_beta D'$.
    Replacing $x : D$ by $x : D'$ in any valid context $Gamma \, x : D \,
    Theta$ preserves validity and every derivable judgment, with the subject, expected type,
    and later declarations unchanged. The converse replacement has the same property.]
] <pts:context-conversion>

#proof[
  In $Gamma \, x : D'$ the variable rule gives $x : D'$. Thin the old sorting of $D$ to this context and convert
    to obtain $x : D$. Thus the identity on the old variables is a typed substitution from $Gamma \, x :
    D$ to $Gamma \, x : D'$. As in the suffix construction in Lemma 4, transport each later sorting judgment,
    append the same declaration, and extend the identity substitution. Finally transport the desired judgment.
    Interchanging $D \, D'$ proves the reverse assertion. Nothing requires $s = s'$. ◻
]

#thm([Lemma 6.])[
  (Generation).  #emph[For derivable judgments in an arbitrary pure type system:]
  + #emph[If $Gamma tack.r x : T$, then $x : D$ occurs in $Gamma$ and $T =_beta D$.]
  + #emph[If $Gamma tack.r s : T$, then $\( s \, u \) in cal(A)$ and $T =_beta u$ for some sort $u$.]
  + #emph[If $Gamma tack.r Pi x : D . E : T$, then for some $\( a \, b \, c \) in cal(R)$,
$ Gamma tack.r D : a \, wide Gamma \, x : D tack.r E : b \, wide T =_beta c . $

]
  + #emph[If $Gamma tack.r lambda x : D . M : T$, then for some $E \, c$,
$ Gamma \, x : D tack.r M : E \, wide Gamma tack.r Pi x : D . E : c \, wide T =_beta Pi x : D . E . $

]
  + #emph[If $Gamma tack.r M N : T$, then for some $D \, E \, x$,
$ Gamma tack.r M : Pi x : D . E \, wide Gamma tack.r N : D \, wide T =_beta E \[ x := N \] . $

]
  #emph[Every immediate syntactic child of a typable expression is typable in the corresponding context,
    with a binder declaration added for a body or codomain.]
] <pts:generation>

#proof[
  Induct on the derivation, stripping any final conversion and weakening steps.
    Conversion composes the asserted conversion of expected types.
    For weakening, thin all extracted premises back to the original context, including under a fresh binder.
    When neither rule is last, the outer syntax identifies its introducing rule and supplies the displayed
    premises. The child assertion follows from these premises;
    for a lambda’s annotation use validity of the body context. ◻
]

#thm([Lemma 7.])[
  (Correctness of types).  #emph[If $Gamma tack.r M : A$, then either $A$ is a literal sort or $Gamma tack.r A :
    s$ for some sort $s$. Moreover, every type assigned to an application is sorted,
    including an assigned type that is itself a literal sort.
    Consequently every nonliteral legal expression is typable.]
] <pts:correctness>

#proof[
  Induct on the derivation. The axiom and product conclusions have literal sorts as expected types.
    Variable, weakening, abstraction, and conversion use their sorting premises, thinning where necessary.
    In the application case, induction on the function premise sorts its product type,
    since that type is not a literal sort. Product generation then gives a sorting of the codomain under the
    binder. Substitution sorts the instantiated result type. This also proves the stronger application assertion
    at a direct application rule; final weakening preserves it by thinning,
    and final conversion explicitly sorts the new expected type.
    Every legal expression that occurs as an expected type is therefore either typable or a literal sort. ◻
]

=== 2.1 Conversion and preservation of typing <pts:reduction-metatheory>

The next lemma concerns raw expressions. Thus it applies before any normalization assumption,
  regardless of which products a specification can form.

#thm([Lemma 8.])[
  (Confluence and product compatibility).  #emph[Full beta reduction on raw expressions is confluent.
    Therefore distinct sorts are not convertible, no product is convertible to a sort, and
$ Pi x : D . E =_beta Pi x : D' . E' quad arrow.r.double quad D =_beta D' med upright(" and ") med E =_beta E' \, $

 after consistently renaming the bound variables.]
] <pts:confluence>

#proof[
  Define parallel contraction $arrow.r.double$ by reflexive variable and sort clauses,
    homomorphic clauses for all expression constructors, and the additional clause
  $
    frac(D arrow.r.double D' wide M arrow.r.double M' wide N arrow.r.double N', \( lambda x : D . M \) N
    arrow.r.double M' \[ x := N' \]) . $
  In particular the homomorphic binder clauses reduce both children.
    Induction on a parallel derivation proves parallel substitution:
    if $M arrow.r.double M'$ and $N arrow.r.double N'$, then $M \[ x := N \] arrow.r.double M' \[ x := N' \]$.
    For its contracting case, rename the contracted binder fresh and use composition of substitutions;
    the other cases reapply the corresponding homomorphic clause.
  Define $M^(*)$, its complete development, recursively by developing every child, with
  $ \( \( lambda x : D . P \) Q \)^(*) = P^(*) \[ x := Q^(*) \] $
  at an application whose original function is a lambda. At any other application use $\( P Q \)^(*) =
    P^(*) Q^(*)$. We claim that $M arrow.r.double N$ implies $N arrow.r.double M^(*)$.
    Prove this by induction on the parallel derivation. At an original root redex,
    either the first parallel step was homomorphic, in which case contract the root in the second step,
    or it contracted the root, in which case parallel substitution applies.
    At an original nonredex application, use the homomorphic clause in the second step,
    even if its function has become a lambda. The remaining cases follow by the corresponding homomorphic clauses
    and induction. Thus any two parallel reducts of $M$ parallel-reduce to $M^(*)$, proving the diamond property.
  Every ordinary step is parallel. Conversely, every parallel step is a finite sequence of ordinary steps:
    first reduce the children and then perform its root contraction, if any.
    Hence the reflexive-transitive closures of the two relations coincide, and beta reduction is confluent.
    Convertible expressions consequently have a common reduct.
    Reducing a product never removes its outer constructor, whereas a sort is irreducible.
    Comparing the common reducts gives all the asserted compatibility and separation properties. ◻
]

#thm([Lemma 9.])[
  (Subject reduction).  #emph[If $Gamma tack.r M : A$ and $M arrow.r_beta^(*) M'$, then $Gamma tack.r M' : A$,
    with the exact original expected type.]
] <pts:subject-reduction>

#proof[
  It suffices to consider one step. Induct on the typing derivation. There are no steps from sorts or variables.
    At a final weakening or conversion, apply induction to its subject premise and reapply the same rule.
  At product formation, a step in the domain preserves its original sort by induction.
    Lemma 5 transports the codomain sorting to the changed binder context,
    and the same product rule re-forms the result. A codomain step is handled by induction on its typing premise.
  At abstraction, a step in the body is immediate by induction.
    For an annotation step $D arrow.r_beta D'$, the supporting judgment $Gamma tack.r Pi x : D . E :
    c$ is a strictly smaller premise derivation. Apply induction to its corresponding domain step to get $Gamma
    tack.r Pi x : D' . E : c$. Product generation sorts $D'$;
    context conversion then transports the body judgment to $Gamma \, x : D'$.
    Abstraction gives the changed lambda its new product type.
    Convert back to the old product type, which is sorted by the original supporting premise.
  At application, a step in the function preserves its product type by induction.
    A step $N arrow.r_beta N'$ in the argument gives the new result type $E \[ x := N' \]$;
    convert this to $E \[ x := N \]$, whose sorting was proved in Lemma 7.
  It remains to treat a root contraction $\( lambda x : D_0 . P \) N arrow.r_beta P \[ x := N \]$.
    Suppose the application premises assign the function type $Pi x : D . E$ and the argument type $D$.
    Generation of the function judgment gives some $E_0 \, c$ such that
  $ Gamma \, x : D_0 tack.r P : E_0 \, wide Gamma tack.r Pi x : D_0 . E_0 : c \, wide Pi x :
    D_0 . E_0 =_beta Pi x : D . E . $
  Product compatibility gives $D_0 =_beta D$ and $E_0 =_beta E$.
    Generation of the supporting product sorts $D_0$, so convert $N : D$ to $N : D_0$.
    Substitution yields $Gamma tack.r P \[ x := N \] : E_0 \[ x := N \]$.
    Convert to the old application type $E \[ x := N \]$, which is sorted by Lemma 7.
    This completes every reduction position, including positions inside annotations. ◻
]

=== 2.2 Neutral expressions and normal forms <pts:neutrals>

An expression $x N_1 dots.h.c N_k$, with $k gt.eq 0$, is called #emph[neutral]. Its arguments need not be normal.
  This restricted class has unique types even when the specification does not.

#thm([Lemma 10.])[
  (Uniqueness for neutral expressions).  #emph[If $H$ is neutral and $Gamma tack.r H : A$ and $Gamma tack.r H :
    B$, then $A =_beta B$. If $Gamma tack.r H : s$ for a literal sort $s$, then $s$ itself is sorted in $Gamma$.
    Every normal typable application is neutral.]
] <pts:neutral-uniqueness>

#proof[
  Induct on the length of the neutral spine. At a variable,
    generation identifies both types with its declaration type up to conversion.
    For $H N$, generation of its two typings gives function product types $Pi x : D . E$ and $Pi x : D' . E'$.
    Induction makes these convertible. Product compatibility gives $E =_beta E'$,
    so substitution makes their instantiated codomains convertible.
    These codomains are convertible to the original two result types by generation.
  If a variable has type $s$, its declaration type $D$ is sorted by validity and thinning,
    and $D =_beta s$ by generation. Confluence and irreducibility of $s$ give $D arrow.r_beta^(*) s$.
    Subject reduction therefore sorts $s$. For a nonempty neutral spine,
    the stronger application assertion in Lemma 7 sorts its expected type directly.
  Finally, the head of a normal application cannot be a lambda, since that would give a redex.
    It cannot be a sort or product: generation makes any type of either head convertible to a sort,
    whereas the first application requires a product type. Product/sort separation excludes this.
    The only remaining head is a variable. ◻
]

#prodef([Remark 2.1.])[
  General uniqueness of types is false under our hypotheses.
    For example, if $\( r \, a \)$ and $\( r \, b \)$ are axioms with distinct $a \, b$,
    then $r$ has the two nonconvertible types $a \, b$. Lemma 10 does not apply to the sort $r$.
    No later use of uniqueness concerns an arbitrary expression.
] <pts:nonfunctionality>

#thm([Lemma 11.])[
  (Normalizing judgments).  #emph[Assume that every legal expression is weakly normalizing.
    Write $M^(\#)$ for its normal form, uniquely determined up to alpha equivalence. If $Gamma tack.r M : A$, then
$ Gamma tack.r M^(\#) : A wide upright("and") wide Gamma tack.r M^(\#) : A^(\#) . $

 The second judgment is also available with $M$ in place of $M^(\#)$.
   If $Gamma tack.r A : s$, then $Gamma tack.r A^(\#) : s$. A sorted normal expression is either a sort,
   a neutral expression, or a product.]
] <pts:normalizing-judgments>

#proof[
  Weak normalization supplies normal forms; confluence gives uniqueness.
    Subject reduction proves the first judgment and the assertion about sorting.
    Correctness of types says that $A$ is sorted or is a literal sort.
    In the first case subject reduction sorts $A^(\#)$, allowing conversion of the expected type.
    In the second case $A^(\#) = A$, so there is nothing to convert if that sort is unsorted.
    Finally a normal application is neutral by Lemma 10, and a lambda cannot have a sort type by generation and
    product/sort separation. ◻
]

=== 2.3 Finite specifications and a common context <pts:finite-and-context>

For the main implication it is enough to work with a finite specification.
  We will then place all finite contexts inside one countable context,
  while each judgment continues to use only a finite prefix.

#thm([Lemma 12.])[
  (Finite restriction).  #emph[Let $cal(P) = \( cal(S) \, cal(A) \, cal(R) \)$ be a pure type system.
    An expression is called #emph[legal] if it occurs as the subject or the expected type of a derivable judgment.
    If every legal expression of $cal(P)$ is weakly normalizing for full $beta$-reduction,
    but some legal expression is not strongly normalizing, then there are finite sets
$ cal(S)_0 subset.eq cal(S) \, wide cal(A)_0 subset.eq cal(A) ∩ cal(S)_0^2 \, wide
  cal(R)_0 subset.eq cal(R) ∩ cal(S)_0^3 $

 such that the restricted system $cal(P)_0 = \( cal(S)_0 \, cal(A)_0 \, cal(R)_0 \)$ has the same two properties.]
] <pts:finite-restriction>

#proof[
  First recall how legality relates to typability. If $E$ is a subject, it is typable by definition.
    If $E$ is an expected type, correctness of types says that either $E$ is a literal sort or $Gamma tack.r E :
    s$ for some context $Gamma$ and sort $s$. Thus every nonliteral legal expression is typable.
    Also, context validity says that each declaration type is sorted in its preceding context,
    so declaration types introduce no further kind of untypable expression. Literal sorts have no $beta$-redexes.
  Choose a legal expression $E$ that is not strongly normalizing.
    It is not a literal sort, so fix a finite derivation of a judgment $Gamma tack.r E : B$.
    For every use of conversion in this derivation, choose a finite raw $beta$-conversion chain witnessing its
    side condition. Let $cal(S)_0$ contain all sorts occurring in the derivation and these chains.
    Let $cal(A)_0$ and $cal(R)_0$ contain the axiom pairs and formation triples used in the derivation,
    enlarging $cal(S)_0$ to contain their entries if necessary.
    These sets are finite, and the same derivation and conversion chains establish $Gamma tack.r E : B$ in $cal(P)_0$.
  A full $beta$-step introduces no new sort symbol: substitution can only copy symbols already present in the
    redex, and contextual reduction has the same property, including reduction in annotations.
    Consequently the infinite reduction from $E$ witnessing failure of strong normalization is also a reduction in
    the raw syntax over $cal(S)_0$.
  Conversely, every judgment derivable in $cal(P)_0$ is derivable in $cal(P)$.
    If $F$ is legal in $cal(P)_0$, the weak-normalization hypothesis therefore supplies a finite reduction $F
    arrow.r_beta^(*) N$ in $cal(P)$ with $N$ normal. No term in this reduction contains a sort outside $cal(S)_0$.
    The reduction is thus available in $cal(P)_0$, and normality is unchanged,
    since it is the absence of a syntactic $beta$-redex. This proves weak normalization of every legal expression
    of $cal(P)_0$, while $E$ remains a legal expression that is not strongly normalizing. ◻
]

#thm([Lemma 13.])[
  (A saturated context).  #emph[Suppose that the sort set $cal(S)$ is at most countable,
    and that the variable set is countably infinite. There is a possibly empty countable sequence of declarations
    $Omega$ with the following properties. A judgment over $Omega$ means a judgment derivable over some finite
    initial segment of $Omega$.]
  + #emph[Every finite initial segment of $Omega$ is valid.
    An infinite set of variable names is disjoint from all its declared names.]
  + #emph[If $P$ is a finite initial segment of $Omega$ and $P tack.r D : s$,
    then $Omega$ contains infinitely many declarations $y : D$ after $P$, with distinct declared names.]
  + #emph[Every finite valid context embeds, by an injective renaming of its declared variables,
    as a subsequence of a finite initial segment of $Omega$. If $Gamma tack.r M : A$,
    such an embedding $rho$ gives $P tack.r M rho : A rho$ for a finite initial segment $P$ containing the
    embedded context.]
  + #emph[If $P tack.r D : s$ for a finite initial segment $P$, and $F$ is any finite set of variable names,
    there is a larger finite initial segment $Q$ ending in a declaration $y : D$,
    where $y in.not F union "dom" \( P \)$, and $Q tack.r y : D$.]
  #emph[Moreover, finitely many judgments over $Omega$ hold over a common finite initial segment.
    Injective renaming in the third clause preserves and reflects weak and strong normalization.]
] <pts:saturated-context>

#proof[
  Partition the variable names into disjoint infinite sets $V_0$ and $V_1$.
    Only names in $V_0$ will be declared in $Omega$; names in $V_1$ remain available for bound variables.
    Because $cal(S)$ and the variable set are countable, the set of finite raw expressions is countable.
    We work up to $alpha$-equivalence, or equivalently choose representatives when enumerating expressions.
  Choose a sequence of pairs $\( p \, D \)$, with $p$ a nonnegative integer and $D$ a raw expression,
    in which every pair occurs infinitely often. Construct finite contexts $Delta_n$ starting with the empty
    context. At stage $n$, consider the scheduled pair $\( p \, D \)$.
    If $Delta_n$ has at least $p$ declarations and its initial segment of length $p$ derives $D :
    s$ for some sort $s$, append a declaration $y : D$, choosing $y in V_0 \\ "dom" \( Delta_n \)$.
    Otherwise leave $Delta_n$ unchanged. This is a set-theoretic construction and does not require a decision
    procedure for typing. In the append case, scope gives $upright("FV") \( D \) subset.eq "dom" \( Delta_n \)$,
    and thinning gives $Delta_n tack.r D : s$. Thus the new declaration is fresh and the extended context is
    valid. Induction proves validity at every stage.
  Let $Omega$ be the sequence obtained by retaining all declarations appended in this construction.
    Every finite initial segment appears at some stage and is valid. No name from $V_1$ is declared.
    If $P tack.r D : s$ and $P$ has length $p$, then, once $P$ has been constructed,
    every later occurrence of the pair $\( p \, D \)$ appends a new declaration of type $D$.
    There are infinitely many such occurrences. This proves the first two clauses,
    including the case where no declaration is ever possible and $Omega$ is empty.
  For the embedding clause, write a finite valid context as
  $ Gamma = \( x_1 : D_1 \, dots.h \, x_m : D_m \) . $
  Induct on its prefixes. Suppose an injective renaming $rho_i$ embeds the first $i$ declarations,
    in their original order, into a finite initial segment $P_i$ of $Omega$. Validity supplies
  $ x_1 : D_1 \, dots.h \, x_i : D_i tack.r D_(i + 1) : s $
  for some sort $s$. Renaming and then thinning yield $P_i tack.r D_(i + 1) rho_i : s$.
    By the second clause, a later declaration has the form $y : D_(i + 1) rho_i$,
    with $y$ fresh for the already chosen names. Set $rho_(i + 1) \( x_(i + 1) \) =
    y$ and take an initial segment through this declaration. This retains all previously embedded declarations
    unchanged and in order. The induction begins with the empty context and proves the desired embedding.
  Renaming a derivation gives $Gamma rho tack.r M rho : A rho$.
    The chosen initial segment is a valid extension by insertion of $Gamma rho$,
    so thinning gives the asserted judgment over that initial segment.
    All substitutions and renamings here are capture-avoiding;
    the reserved names permit bound variables to be renamed away from the declarations whenever needed.
  For the fourth clause, only finitely many of the infinitely many declarations of type $D$ after $P$ can have
    their declared names in $F$. Choose any other one and let $Q$ be the initial segment ending there.
    Thinning the judgment for $D$ to the prefix immediately before that declaration,
    followed by the variable rule, gives $Q tack.r y : D$. In particular,
    when finitely many substitution images have their free variables in $P$, this $y$ is fresh for all those images.
  Finally, take the longest among finitely many initial segments witnessing judgments over $Omega$ and thin all
    the judgments to it. An injective renaming of the finitely many variables of a context can be extended to a
    bijective renaming of the whole variable set. Such a renaming commutes with full $beta$-reduction and its
    inverse does too. It therefore preserves and reflects normal forms, finite normalizing reductions,
    and infinite reductions. This proves the last assertions. ◻
]

== 3 Sort profiles and normalization candidates <sec:profiles>

Throughout this section the pure type specification is finite and every legal expression is weakly normalizing for
  full beta reduction. We use the substitution, generation, context-conversion,
  subject-reduction and confluence properties established in the preliminaries.
  Write $M^(\#)$ for the normal form of a legal expression, up to alpha conversion.
  In particular, the expected type of a judgment has a normal form: it is either sorted or already a literal sort.
  No uniqueness of sorts or product rules is assumed.

We first associate a finite set of sorts to each type. These sets will order the normalization argument.
  Within one part of that order we shall construct sets of terms that pass certain application tests.
  The main result of the section is an interface theorem: any construction with the specified substitution and
  product properties advances the normalization argument by one component.

=== 3.1 Profiles and the dependency graph <profiles-and-the-dependency-graph>

For a sort $s$ and sets of sorts $I \, J$, put

$ "Ax" \( s \) = { t : \( s \, t \) in cal(A) } \, wide "Out" \( I \, J \) = { c : upright("some ") a in I \, med
  b in J upright(" satisfy ") \( a \, b \, c \) in cal(R) } . $

For an expected type $T$ in a valid context $Gamma$, define its #emph[profile] by

$ pi_Gamma \( T \) = { s : Gamma tack.r T^(\#) : s } . $

The profile can be empty when $T$ is an unsorted literal sort. When the context is clear we omit its subscript.
  A #emph[neutral expression] is a variable followed by zero or more arguments.

#thm([Lemma 14.])[
  (Normal profiles).  #emph[A sorted normal expression is a sort, a neutral expression, or a product.
    Its profile is determined as follows:]
  + #emph[a literal sort $s$ has profile $"Ax" \( s \)$;]
  + #emph[a neutral expression has a singleton profile ${ s }$, and $"Ax" \( s \)$ is nonempty;]
  + #emph[a normal product $Pi x : D . E$ has profile
$ "Out" #scale(x: 120%, y: 120%)[\(] pi_Gamma \( D \) \, pi_(Gamma \, x : D) \( E \) #scale(x: 120%, y: 120%)[\)] . $

]
  #emph[Profiles are unchanged by valid thinning and context conversion.
    If $xi : Gamma arrow.r Delta$ is a typed substitution, then
#[#set math.equation(numbering: n => "(1)")
 $ pi_Gamma \( T \) subset.eq pi_Delta \( T xi \) . $ <eq:profile-growth>]

]
] <lem:normal-profiles>

#proof[
  A normal application is variable-headed: a lambda head would be a redex,
    and a sort or product cannot have a product type by generation and product compatibility.
    A lambda cannot have a literal sort type for the same reason.
    Generation for a sort gives exactly its axiom targets. Generation and product formation give the two
    inclusions in the formula for a product, separately for every applicable rule.
  For a neutral expression, its type is unique up to conversion.
    Indeed, the assertion for its head variable follows from its declaration.
    Inductively, generation and compatibility of convertible products identify the domain and instantiated
    codomain at each further application. Thus two literal sort types of a neutral are identical.
    Its literal sort type $s$ is itself sorted. For a lone variable its declaration type is sorted and convertible
    to $s$; confluence makes that declaration type reduce to $s$, and subject reduction sorts $s$.
    For a nonempty application spine, correctness of the expected type already gives a sorting of $s$.
    Generation for $s$ now implies $"Ax" \( s \) eq.not diameter$.
  Thinning preserves the profile by induction on normal syntax.
    At a neutral, an existing sort is retained and uniqueness excludes any new one.
    At a product apply the induction also in its extended binder context.
    Literal sorts do not depend on the context. Context conversion preserves all relevant judgments in both
    directions, hence preserves profiles as well.
  Finally, if $s in pi_Gamma \( T \)$, substitution gives $Delta tack.r T^(\#) xi : s$.
    Reduction of $T$ to $T^(\#)$ commutes with substitution, so $T^(\#) xi$ and $T xi$ have the same normal form.
    Subject reduction therefore gives $Delta tack.r \( T xi \)^(\#) : s$. This proves the inclusion.
    For a substituted product the outer product persists, and its components normalize separately;
    context conversion transports the open codomain to the normalized domain.
    The same inclusion consequently holds at corresponding product children. ◻
]

A nonempty profile is #emph[feasible] if it occurs in some valid context.
  Since the specification is finite, there are only finitely many feasible profiles.

#thm([Lemma 15.])[
  (Feasible profiles).  #emph[The feasible profiles form the smallest family containing
$ "Ax" \( s \) quad upright("and") quad { s } wide #scale(x: 120%, y: 120%)[\(] "Ax" \( s \) eq.not diameter
  #scale(x: 120%, y: 120%)[\)] $

 and closed under nonempty values of $"Out"$.]
] <lem:feasible-profiles>

#proof[
  Necessity follows by induction on a sorted normal expression, using Lemma 14.
    Conversely, $s$ witnesses $"Ax" \( s \)$, and a variable declared at type $s$ witnesses ${ s }$.
    Given normal witnesses for $I$ and $J$, rename their finite contexts apart and combine those contexts by
    thinning. Form a product with the first witness as domain and the second as a codomain independent of its
    fresh binder. Its profile is exactly $"Out" \( I \, J \)$. These witnesses are normal. ◻
]

Call $\( I \, J \, K \)$ a #emph[profile triple] when $I \, J \, K$ are feasible and $K = "Out" \( I \, J \)$.
  Define the #emph[primary graph], a finite signed directed graph on the feasible profiles, by adding:

- a positive edge $L arrow.r J$ whenever $L supset.neq J$;
- for each profile triple $\( I \, J \, K \)$, a negative edge $I arrow.r K$ and a positive edge $J arrow.r K$.

Parallel edges retain their signs and their associated triples.
  Here and below a path means a finite directed walk: vertices and edges may repeat.
  Its parity is the parity of its number of negative edges; a length-zero path is even.

If $T = Pi x : D . E$ has profile $K$, write $I = pi \( D \)$ and $J = pi \( E \)$.
  For every typed $n : D$, profile growth gives

#[#set math.equation(numbering: n => "(2)")
 $ L = pi #scale(x: 120%, y: 120%)[\(] \( E \[ x := n \] \)^(\#) #scale(x: 120%, y: 120%)[\)] supset.eq J \, wide
   L arrow.r J arrow.r K quad upright("by positive edges") \, $ <eq:codomain-ascent>]

where the first edge is omitted when $L = J$.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 1.1), [$I= pi (D)$])
  content((-1.4, -0.5), [$L supset.eq J$])
  content((1, -0.5), [$J= pi (E)$])
  content((4, 0.45), [$K= pi ( Pi x:D.E)$])
  line((0.7596, 0.9766), (2.72, 0.658), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((2, 0.775), [$-$], anchor: "south", padding: 0.1176cm)
  line((1.76, -0.2594), (3.049, 0.149), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((2.5, -0.025), [$+$], anchor: "north-west", padding: 0.1176cm)
  line((-0.8785, -0.5), (0.2404, -0.5), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((-0.2, -0.5), [$+$], anchor: "south", padding: 0.1176cm)
})],
  caption: [Figure 1: The domain and open codomain point to their product. An instantiated codomain has profile $L supset.eq J$ and also has a positive path to the product. The edge $L arrow.r J$ is omitted if $L = J$. ],
) <fig:profile-dependencies>

Order the strongly connected components so that every predecessor component is processed first.
  At a given stage let $S$ be the current component and $U$ the union of the already processed components.
  Thus $U$ is predecessor-closed, and every predecessor of $S$ lies in $U union S$.
  The graph immediately gives the following facts:

+ the domain and open codomain of an $S$ product have profiles in $U union S$;
+ every instantiated codomain of that product has profile in $U union S$;
+ any feasible enlargement of a profile in $S$ lies in $U union S$;
+ any feasible enlargement of a profile in $U$ lies in $U$.

All statements also hold after valid thinning or context conversion.

=== 3.2 Application tests and candidates <application-tests-and-candidates>

Use the saturated context $Omega$ from the preliminaries.
  A judgment over $Omega$ means a judgment over some finite prefix;
  finitely many judgments may always be thinned to a common prefix.
  Profile invariance makes their profiles independent of this choice.
  An #emph[actual type] is a normal sorted expression over $Omega$, or a literal sort. For such a type put

$ "Ty" \( T \) = { h : Omega tack.r h : T } \, wide top_T = "Ty" \( T \) ∩ "SN"_beta . $

Here and below strong normalization includes reduction in annotations.

A #emph[tested stack at $T$] is a finite list defined inductively. The empty list is always a tested stack.
  If $T = Pi x : D . E$, $n in top_D$, and $arrow(m)$ is a tested stack at

$ T_n = \( E \[ x := n \] \)^(\#) \, $

then $\( n \, arrow(m) \)$ is a tested stack at $T$. This definition follows these exact successive types;
  it does not range over alternative typings of a term. Define

$ G_T = { h in "Ty" \( T \) : h thin arrow(n) in "SN"_beta upright(" for every tested stack ") arrow(n)
  upright(" at ") T } . $

We shall establish, component by component, the invariant

#[#set math.equation(numbering: n => "(3)")
 $ G_T = top_T wide \( pi \( T \) in U \) . $ <eq:processed-invariant>]

#thm([Lemma 16.])[
  (Elementary properties of the tests).  #emph[For every actual type $T$, $G_T subset.eq top_T$.
    If $T$ is a literal sort, equality holds. Every variable typed at $T$ belongs to $G_T$.
    If $T = Pi x : D . E$, $h in G_T$, and $n in top_D$, then $h thin n in G_(T_n)$.]
] <lem:test-properties>

#proof[
  The empty stack gives the inclusion; at a literal sort it is the only stack.
    A variable followed by finitely many strongly normalizing arguments is strongly normalizing:
    its head never contracts, and a reduction decreases the sum of the arguments’ reduction heights.
    This proves the assertion for variables. For propagation,
    append any tested stack at $T_n$ to $n$ and apply the definition of $G_T$.
    Application and conversion give the required exact typing at $T_n$. ◻
]

#thm([Lemma 17.])[
  (Head expansion for strong normalization).  #emph[Suppose that $D \, P \, n \, m_1 \, dots.h \,
    m_k$ are strongly normalizing and that
$ P \[ x := n \] m_1 dots.h.c m_k $

 is strongly normalizing. Then $\( lambda x : D . P \) n m_1 dots.h.c m_k$ is strongly normalizing.]
] <lem:sn-head-expansion>

#proof[
  Every strongly normalizing expression has a finite maximal reduction length.
    Indeed, reduction is finitely branching; if lengths were unbounded,
    at least one immediate reduct would again have unbounded lengths,
    and iterating this choice would give an infinite reduction.
    Write $ell \( Q \)$ for this maximal length and induct on
  $ ell \( D \) + ell \( P \) + ell \( n \) + sum_(i = 1)^k ell \( m_i \) . $
  The head reduct is strongly normalizing by hypothesis. Every other immediate reduct changes one displayed
    component and strictly lowers this sum. Its head contractum is either unchanged or is a reduct of the old head
    contractum. For a step in $n$, contract the corresponding step in each of its finitely many copies in
    $P \[ x := n \]$; there may be zero copies. For a step in the annotation, the contractum is unchanged.
    Thus the new contractum is strongly normalizing, and the induction applies.
    Every immediate reduct is strongly normalizing, which proves the claim. ◻
]

#prodef([Definition 3.1.])[
  (Candidate at an actual type).  A candidate at $T$ is a set $C$ satisfying $G_T subset.eq C subset.eq
    top_T$ and the following head-expansion property: if
  $ r = \( lambda x : D . P \) n thin arrow(m) in "Ty" \( T \) \, $
  all displayed components $D \, P \, n \, arrow(m)$ are strongly normalizing, and $P \[ x := n \] arrow(m) in C$,
    then $r in C$. Denote the candidates at $T$ by $cal(C) \( T \)$.
] <def:candidate>

Reduction closure is not part of this definition. All subsequent candidate arguments use only the properties just
  stated. This is a local variant of the reducibility-candidate method #cite(label("Girard1989")) Chapters 6
  and 14; the next lemma proves its required lattice and product closure directly.

#thm([Lemma 18.])[
  (Candidate lattice and product tests).  #emph[The inclusion-ordered set $cal(C) \( T \)$ is a complete lattice
    with largest element $top_T$. Write $tack.t_T$ for its least element.
    For an actual product $T = Pi x : D . E$, choose a set $A subset.eq top_D$.
    For each $n in A$ choose any family of candidates $C_(n \, a) in cal(C) \( T_n \)$ indexed by a set $Q_n$. Then
#[#set math.equation(numbering: n => "(4)")
 $ { h in top_T : upright("for every ") n in A upright(" and ") a in Q_n \, med
   h n in C_(n \, a) } $ <eq:product-test-candidate>]

 is a candidate at $T$.]
] <lem:candidate-lattice>

#proof[
  Lemma 17 shows that $top_T$ is a candidate. Intersections of candidates preserve all three requirements of
    Definition 4; take the empty intersection to be $top_T$. Therefore every family has a meet,
    and its join is the intersection of its common upper bounds.
    This family of upper bounds is nonempty because it contains $top_T$.
    In particular, the least candidate is the intersection of all candidates.
  For (4), a term in $G_T$ passes every test by Lemma 16 and the containment $G_(T_n) subset.eq C_(n \, a)$.
    Suppose a head contractum belongs to (4) and its expansion has strongly normalizing components.
    Lemma 17 gives the expansion’s membership in $top_T$. Append a prescribed $n in A$ to its spine.
    The enlarged head contractum lies in $C_(n \, a)$ for every $a$,
    and all enlarged components are strongly normalizing. Head expansion in $C_(n \, a)$ gives the required
    membership of the enlarged spine. This proves every test, without using reduction closure of a candidate. ◻
]

At profiles in $U$, the invariant (3) forces every candidate to equal $top_T$.
  This is why previously processed types need no further choices.

=== 3.3 The interface for one component <subsec:candidate-interface>

We now specify exactly what a component construction must supply.
  The context $Gamma$ and its syntax will be called #emph[generic]; a typed substitution $xi : Gamma arrow.r
  Omega$ supplies raw actual images. An environment also contains auxiliary parameters $theta$ for the
  declarations. Each construction below specifies their sets.
  Require an empty parameter environment and compatible parameter extensions along every typed context extension.
  Restrictions to preceding declarations are understood when interpreting declaration types.

For each normal generic expected type $T$ with $pi_Gamma \( T \) in S$, the construction supplies a candidate

$ R_(Gamma \, T) \( xi \, theta \) in cal(C) #scale(x: 120%, y: 120%)[\(] \( T xi \)^(\#)
  #scale(x: 120%, y: 120%)[\)] . $

For any other normal generic expected type use the convention

$ R_(Gamma \, T) \( xi \, theta \) = top_(\( T xi \)^(\#)) . $

When no ambiguity arises write simply $R_T$. Actual profiles obtained from generic profiles in $S$ lie in $U union
  S$, and an actual profile in $U$ makes the candidate equal to top.

The required properties are the following.

+ #emph[Invariance.] Valid thinning, context conversion, and pointwise convertible actual images preserve the
  candidates on old syntax when the old parameters are unchanged.
  Capture-avoiding renaming of generic declared and bound variables preserves the interpretation,
  with the substitution and parameter environment reindexed on declared variables and all actual images and
  parameter values unchanged.
+ #emph[Product equality.] Let $T = Pi x : D . E$ have generic profile in $S$ and actual profile in $S$.
  For each $n in R_D$, specify a nonempty collection $Q_(T \, n)$ of compatible parameter extensions to $Gamma \,
  x : D$ with substitution $xi \[ x mapsto n \]$. Then $R_T$ equals the following product-test candidate.
  Its members are exactly the $h in top_(\( T xi \)^(\#))$ such that, for every $n in R_D$:
  - if the actual type $\( E \( xi \[ x mapsto n \] \) \)^(\#)$ has profile in $S$,
    then $h n in R_E \( xi \[ x mapsto n \] \, theta' \)$ for every $theta' in Q_(T \, n)$;
  - if that actual profile lies in $U$, then $h n$ is strongly normalizing at that exact normal type.
  Application is well typed because the actual domain of the normal product $\( T xi \)^(\#)$ is
    $\( D xi \)^(\#)$; substitution and normalization identify its instantiated codomain with the displayed actual
    type. The generic domain profile belongs to $U union S$, so $R_D$ is the candidate supplied by the
    construction or the prescribed top in $U$.
+ #emph[Specialization.] In the product situation, if $Gamma tack.r N : D$, $N xi in R_D$, and $h in R_T$, then
  #[#set math.equation(numbering: n => "(5)")
   $ h \( N xi \) in R_(Gamma \, \( E \[ x := N \] \)^(\#)) \( xi \, theta \) . $ <eq:interface-specialization>]
  It is enough to find one of the tested parameter extensions for which the codomain candidate is contained in the
    candidate on the right. If the actual codomain profile is in $U$,
    this follows directly from the strong-normalization test.

Both directions of the product-equality requirement are required:
  the lambda case uses its introduction direction and application uses its elimination direction.

A typed environment $\( xi \, theta \)$ is #emph[admissible] if, for each declaration $x : B$ of $Gamma$,
  its image satisfies the following condition, evaluated over the preceding declarations:

$
  cases(delim: "{", xi \( x \) in R_(B^(\#)) \, & pi \( B \) in S \,, xi \( x \) in "SN"_beta \, & pi \( B \) in
  U \,, xi \( x \) in G_(\( B xi \)^(\#)) \, & pi \( B \) in.not U union S .) $

The exact typings in these conditions follow from typed substitution and conversion.
  Admissibility imposes no separate restriction on the auxiliary parameters.

#thm([Lemma 19.])[
  (Transport of strongly normalizing terms).  #emph[Assume (3) and an implementation of the three interface
    requirements in Section 3.3 for $S$. If $Gamma tack.r M : A$, the expression $M$ is strongly normalizing,
    and $\( xi \, theta \)$ is admissible, then
#[#set math.equation(numbering: n => "(6)")
 $ M xi in R_(Gamma \, A^(\#)) \( xi \, theta \) . $ <eq:sn-fundamental>]

]
] <lem:sn-fundamental>

#proof[
  Induct lexicographically on $\( ell \( M \) \, \| M \| \)$,
    where $\| M \|$ is syntax size including annotations. The induction is simultaneous over all typings,
    contexts, and admissible environments. A proper subexpression has no larger reduction height and smaller size;
    a beta reduct has strictly smaller height. Typed substitution gives all required actual typings throughout.
  We shall repeatedly use a fresh-variable extension. If a binder has raw generic annotation $B$,
    then $B xi$ is sorted over a finite prefix of $Omega$. Saturation supplies a fresh variable $z$ declared at
    that raw type, beyond a common prefix for the finite expressions in question.
    Choose $z$ outside the free names of all other images. It belongs to $G_(\( B xi \)^(\#))$ by Lemma 16,
    and hence satisfies whichever of the three admissibility conditions applies.
    Any allowed parameter extension can be used. Invariance retains the assumptions on old variables.
    If the induction proves the body with $x$ sent to $z$ strongly normalizing,
    renaming $z$ back to a bound $x$ proves strong normalization of the open substituted body.
  For a sort, $M xi = M$ is normal, and its expected normal type is a literal sort.
    At a literal sort $G$ equals top, so this suffices for membership in any candidate.
    For a product, apply the induction to its domain and to its open codomain under a fresh-variable extension.
    The two substituted components are strongly normalizing, so the product is strongly normalizing.
    Its expected normal type is again a literal sort, giving the conclusion.
  Let $M = lambda x : B . P$. The induction on $B$, and on $P$ under a fresh-variable extension,
    proves strong normalization of the actual annotation and open body. Hence $M xi$ is strongly normalizing.
    This already proves the conclusion unless both the generic and the actual normalized expected types have
    profiles in $S$. In the latter case write $A^(\#) = Pi x : D . E$.
    Generation and product compatibility identify $D$ with the normal form of $B$ and identify $E$ with the normal
    body type, after context conversion under the binder.
  Context-convert the generic body judgment to $Gamma \, x : D tack.r P : E$.
    Take an arbitrary $n in R_D$ and arbitrary prescribed parameter extension in $Q_(A^(\#) \, n)$.
    Convert $n$ to the actualized type $D xi$ and extend this context’s substitution by $x mapsto n$.
    This is admissible: the generic domain profile is in $U union S$,
    and the test condition is exactly the required candidate or SN condition.
    Apply the induction to the context-converted judgment for $P$ in this very extension.
    It gives the required codomain candidate for the head contractum of $\( M xi \) n$.
    The actual annotation, open body and $n$ are strongly normalizing.
    Head expansion in that codomain candidate proves the test.
    If the actual codomain profile is in $U$, use any compatible parameter extension,
    the body’s strong normalization, and Lemma 17. We have verified every product test;
    the introduction direction of the product-equality requirement proves the conclusion.
  For an application, inspect its entire left-associated spine. If its head is a lambda, write
  $ M = \( lambda x : B . P \) N thin arrow(L) . $
  Contract its first redex generically to $M'$. Subject reduction gives $Gamma tack.r M' :
    A$ and $ell \( M' \) < ell \( M \)$, so the induction gives $M' xi in R_(A^(\#))$.
    The components $B \, P \, N \, arrow(L)$ are proper subexpressions.
    Their inductions, using a fresh-variable extension for the open $P$,
    give strong normalization of every component after substitution.
    Substitution commutes with the displayed contraction up to alpha conversion.
    Head expansion in $R_(A^(\#))$ therefore proves the result.
    This step does not invoke reduction closure of a candidate.
  The remaining case is a neutral spine $x N_1 dots.h.c N_k$, including $k = 0$.
    Starting at the normal form of the declaration type of $x$,
    generation and neutral uniqueness determine its successive normal expected types.
    Whenever a next argument occurs, the preceding type is a product;
    convert that argument to its normalized domain and take the normalized instantiated codomain as the next type.
    The induction applied to each $N_i$ at this exact domain gives its candidate membership and, in particular,
    strong normalization after substitution. Typed substitution and confluence identify the actual successive
    types with the normal forms of the corresponding generic types.
  Track membership along the spine. A $G$ prefix propagates by Lemma 16.
    If the head declaration has profile in $U$, admissibility and profile growth put it in actual top in $U$,
    hence in $G$ by (3). If a prefix has generic profile in $S$, an actual profile in $U$ likewise gives $G$.
    Otherwise its candidate product test applies to the next argument, and (5) gives the next candidate.
    That next generic profile lies in $U union S$ by the positive codomain path;
    on reaching $U$ its membership is again in $G$. A head declaration outside $U union
    S$ starts in $G$ by admissibility and requires no further restriction on profiles.
    Thus the final prefix belongs either to the desired candidate or to its subset $G$.
    No other spine head can type as an application. This completes the induction. ◻
]

#thm([Proposition 20.])[
  (Advancing one component).  #emph[Under the hypotheses of Lemma 19,
    (3) also holds for every actual type with profile in $S$.]
] <prop:advance-component>

#proof[
  Fix $h in top_T$ with $pi \( T \) in S$ and any tested stack $\( n_1 \, dots.h \, n_k \)$ at $T$.
    Choose a common finite prefix $Gamma$ of $Omega$ supporting the relevant exact typings and use the identity
    substitution. Choose parameters successively; all variable images lie in $G$ and therefore the environment is
    admissible. Apply Lemma 19 separately to $h$ and to each $n_i$ at its exact successive domain.
    Each is strongly normalizing by hypothesis or by the definition of a tested stack.
  Start with the resulting candidate membership of $h$ and iterate the product tests and specialization along the
    stack. Each encountered type has profile in $U union S$. In $S$ specialization supplies the next candidate
    membership; in $U$ the invariant supplies $G$, which propagates across every remaining frame.
    Thus $h n_1 dots.h.c n_k$ is strongly normalizing. The argument never assumes strong normalization of an
    intermediate generic application and never applies the fundamental lemma to such an application.
    Since the stack was arbitrary, $h in G_T$. The reverse inclusion is Lemma 16. ◻
]

#thm([Proposition 21.])[
  (Completion of the interface argument).  #emph[If the interface can be implemented at every strongly connected
    component, then every legal expression of the PTS is strongly normalizing.]
] <prop:interfaces-imply-sn>

#proof[
  Process the finitely many components and apply Proposition 20.
    At the end, $G_T = top_T$ for every actual type with nonempty profile.
    Empty-profile actual types are literal sorts, for which this equality already holds by Lemma 16.
  Suppose a typable expression is not strongly normalizing and choose one of least syntax size,
    among all valid contexts and typings. Its proper syntactic children are typable in the corresponding contexts,
    including under binders, and so are strongly normalizing.
    A variable or sort is normal; a product or lambda with strongly normalizing children is strongly normalizing.
    The expression must therefore be an application $f n$, with $f \, n$ strongly normalizing.
    Generation types $f$ at a product and $n$ at its domain. Normalize that product, convert these typings,
    and embed the finite context into $Omega$. The resulting normal product is an actual type with nonempty
    profile: it is sorted by correctness of types and cannot be a literal sort.
    The equality $G_T = top_T$ and its one-frame test now give strong normalization of $f n$, a contradiction.
    This also handles an empty feasible-profile graph, since the hypothetical application would itself produce a
    feasible product profile.
  Finally, every legal expression is typable by validity and correctness of types, or is a literal sort.
    Literal sorts are normal. Hence the conclusion holds with the full legal-expression and open-context scope. ◻
]

The remaining task is to construct the interface. We now do so in two cases using only the profile graph.
  The other components require the additional semantic construction developed later.

Figure 2 separates the construction of an interface from its use in the normalization induction.
  For the third case, the observation construction has an additional graph hypothesis.
  The typed obstruction proves that hypothesis from system-wide weak normalization,
  independently of the candidate interpretation. Thus the third branch, like the first two,
  supplies the full interface before the processed invariant is advanced.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 12.22cm, inset: 0.2117cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Finite specification and system-wide weak normalization;#linebreak()current component $S$, processed predecessors $U$, and $G_T= top_T$ on $U$]]])])
  content((-3.2, -2.25), [#box(width: 4.623cm, inset: 0.2117cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[No odd closed walk, or no all-$S$ profile triple#linebreak()Propositions~22 and~25]]])])
  content((3.2, -2.25), [#box(width: 4.623cm, inset: 0.2117cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Remaining components: observation construction and typed exclusion#linebreak()Propositions~34 and~59]]])])
  content((0, -4.25), [#box(width: 11.12cm, inset: 0.2117cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Candidate interface for $S$ \(Section~3.3\):#linebreak()invariance, product equality in both directions, and specialization]]])])
  content((0, -5.85), [#box(width: 11.12cm, inset: 0.2117cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$G_T= top_T$ also on $S$ \(Proposition~20\);#linebreak()after all components, strong normalization \(Proposition~21\)]]])])
  line((0, -0.5467), (0, -0.95), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((0, -0.95), (-3.2, -0.95), (-3.2, -1.703), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((0, -0.95), (3.2, -0.95), (3.2, -1.703), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((-3.2, -2.797), (-3.2, -3.45), (0, -3.45), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((3.2, -2.797), (3.2, -3.45), (0, -3.45), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((0, -3.45), (0, -3.694), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((0, -4.806), (0, -5.286), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
})],
  caption: [Figure 2: The contracts of one component step. The right branch combines the conditional observation construction with the independent proof of its graph hypothesis. The arrows to the interface assert the complete three-part contract, before any use of component advancement. ],
) <fig:component-contracts>

== 4 Two component constructions <sec:simple-components>

Keep a current component $S$ and the invariant on its processed predecessors $U$.
  The first construction uses signs to compensate for the opposite variances of domain and codomain.
  The second uses a single chain in each normal type when its two product children cannot both remain in $S$.

=== 4.1 Components without an odd closed walk <components-without-an-odd-closed-walk>

#thm([Proposition 22.])[
  (The signed fixed-point construction).  #emph[If $S$ has no odd closed walk, it admits the candidate interface.]
] <prop:signed-component>

#proof[
  Choose a vertex of $S$. Assign to each vertex the parity of any path from the chosen vertex to it.
    This is well defined: append a return path to two proposed paths;
    different parities would produce an odd closed walk. Give even vertices sign $+$ and odd vertices sign $-$.
    Every internal positive edge preserves sign, and every internal negative edge reverses sign.
  Let $cal(T)_S$ be the set of actual types with profile in $S$.
    It is a set, since these are finite syntax over the countable context $Omega$. On
  $ cal(L) = product_(T in cal(T)_S) cal(C) \( T \) $
  use inclusion in coordinates with sign $+$ and reverse inclusion in coordinates with sign $-$.
    This is a complete lattice by Lemma 18. Extend a vector $v$ to actual types in $U$ by $v_T = top_T$.
  Define an operator $F : cal(L) arrow.r cal(L)$. At a nonproduct type set $F \( v \)_T = top_T$.
    At $T = Pi x : D . E$, let
  $ F \( v \)_T = { h in top_T : upright("for every ") n in v_D \, med h n in v_(\( E \[ x := n \] \)^(\#)) } . $
  All indices belong to $U union S$ by the dependency graph, and this is a candidate by Lemma 18.
  The operator is monotone in the mixed order. In the usual inclusion order its product clause is antitone in the
    domain coordinate and monotone in every instantiated-codomain coordinate.
    An internal domain has the opposite sign to $T$ by its negative edge.
    An instantiated codomain in $S$ has the same sign as $T$ by its positive path through the open codomain:
    the intermediate vertex must also lie in $S$, since a vertex in $U$ has all its predecessors in $U$.
    Coordinates in $U$ are constant. These observations give exactly the required coordinatewise monotonicity,
    in either sign of the output.
  Tarski’s fixed-point theorem #cite(label("Tarski1955")) Theorem 1 gives a fixed point.
    We recall its short existence proof, which needs no continuity assumption.
    Let $a$ be the supremum of all $v$ satisfying $v lt.eq F \( v \)$.
    For every such $v$, monotonicity gives $v lt.eq F \( v \) lt.eq F \( a \)$, so $a lt.eq F \( a \)$.
    Then $F \( a \) lt.eq F \( F \( a \) \)$, making $F \( a \)$ one of the elements whose supremum is $a$;
    hence $F \( a \) lt.eq a$. Fix such a vector $a$.
  No auxiliary parameters are needed. For a generic normal type $T$ with profile in $S$, define $R_T =
    a_(\( T xi \)^(\#))$ if its actual profile is in $S$, and top otherwise.
    At a generic product with actual profile in $S$, its actual normalized domain and all actual instantiated
    codomains are exactly the indices in the operator clause.
    Thus the fixed-point equality gives the required product equality, with the unique parameter extension.
  The actual normalized type determines the candidate, so thinning,
    context conversion and pointwise convertible images preserve it. For specialization the two actual type expressions
  $ E \( xi \[ x mapsto N xi \] \) quad upright("and") quad \( \( E \[ x := N \] \)^(\#) \) xi $
  are convertible by substitution composition and normalization. Their normal forms are identical.
    The two candidates are consequently equal when that profile is in $S$, and both are top in $U$.
    A generic child in $U$ remains there under substitution, so no additional case arises.
    This proves all interface requirements. ◻
]

=== 4.2 Components with at most one internal product child <components-with-at-most-one-internal-product-child>

Suppose now that there is no profile triple $\( I \, J \, K \)$ with $I \, J \, K in S$.
  For a normal type $T$ of profile in $S$, start at its root.
  At a product continue to its child of profile in $S$, if it has one; there is at most one.
  Stop at a nonproduct or at a product with no such child. This is a finite path in the syntax tree.

If the path ends at a neutral expression whose head $y$ is free in the starting context of $T$,
  define the #emph[support] of $T$ to be $y$. Define its #emph[polarity] to be $+$ or $-$ according to whether the
  path takes an even or odd number of domain steps. In every other case the support is empty.
  Also declare support empty at a generic profile outside $S$.
  In particular a head bound strictly inside $T$ is not its support.
  The support of a codomain, considered in its own extended context, may of course be its immediately preceding binder.

Assign each declaration of a generic context a bit $0$ or $1$; these are the parameters $theta$.
  At a neutral we use the candidate extremum selected by its head’s bit,
  with $0$ selecting bottom and $1$ selecting top. Define candidates recursively on normal generic types as
  follows. At an actual profile in $U$ use top. At a generic profile outside $S$ also use top,
  as in the interface. Otherwise:

- at a sort use top;
- at a neutral with head $y$ use $tack.t_(\( T xi \)^(\#))$ or $top_(\( T xi \)^(\#))$ according to $theta \( y \)$;
- at a product $T = Pi x : D . E$ use the product-test candidate in Section 3.3.
  There is one prescribed bit for $x$: use $0$ if the support of $E$ is $x$ with positive polarity,
  $1$ if it is $x$ with negative polarity, and $1$ if $x$ is not supported.
  If $E$ has profile in $U$, its bit is irrelevant and we again choose $1$.

Every recursive child is smaller syntax; candidate existence follows from Lemma 18.
  Context variables can always be assigned bits, and the prescribed extension is nonempty.

#thm([Lemma 23.])[
  (Dependence on support).  #emph[For fixed typed actual images,
    the candidate of an $S$ type depends on the bits of its starting context only through its support, if any.
    Valid thinning and context conversion preserve the support, its polarity, and the candidates.
    Pointwise convertible actual images preserve the candidates when old bits agree.]
] <lem:support-dependence>

#proof[
  Induct on the normal type. Sorts and actual-$U$ cases do not use bits. A neutral uses only its head bit.
    At a product, any child in $U$ is interpreted as top; only the unique $S$ child can depend on old bits.
    Its support is propagated to the parent unless it is the product’s own binder,
    whose bit is fixed by the displayed rule. This proves the dependence assertion.
    Profile invariance preserves the same product path and its domain parity under thinning and context
    conversion. In those operations and under convertible images, the actual normal types agree.
    The recursive product tests then have identical domains, codomains and prescribed bits,
    proving the stated invariances. ◻
]

Use the notation $A prec.curly.eq_(+) B$ for $A subset.eq B$ and $A prec.curly.eq_(-) B$ for $A supset.eq B$.
  Regard signs as $+ 1$ and $- 1$ when multiplying them.

#thm([Lemma 24.])[
  (Comparison after generic substitution).  #emph[Let $Gamma \, y : B \, Delta$ be valid, let $Gamma tack.r N :
    B$, and let $T$ be a normal type of profile in $S$ in that context. Put
$ Gamma' = Gamma \, Delta \[ y := N \] \, wide T' = \( T \[ y := N \] \)^(\#) . $

 Take typed substitutions of the two contexts into $Omega$ whose images are compatible with composition:
   the pre-substitution image of $y$ is convertible to the actual image of $N$,
   and the other images agree up to conversion. Equip the substitutions with bits $theta \, theta'$.
   Fix a comparison sign $delta in { + \, - }$ and assume:]
  + #emph[the bits agree on any variable supported by both $T$ and $T'$;]
  + #emph[if $y$ supports $T$ with polarity $epsilon$, then its pre-substitution bit is $0$ when $delta
    epsilon = +$ and $1$ when $delta epsilon = -$.]
  #emph[Then, at their common actual normal type,
$ R_T \( xi \, theta \) prec.curly.eq_delta R_(T') \( xi' \, theta' \) . $

]
] <lem:support-substitution>

#proof[
  Induct on the pre-substitution syntax of $T$. The actual normal types agree by substitution composition and
    confluence. If their profile lies in $U$, both candidates are top.
    Otherwise that profile lies in $S$, and so does the generic profile of $T'$:
    profile growth puts it in $U union S$, and a generic profile in $U$ could only have actual profile in $U$.
  A sort is unchanged. A neutral whose head is not $y$ remains a neutral with the same head after substitution and
    normalization; if its actual profile is in $S$, the supported head is common and its bit agrees.
    At a neutral headed by $y$, its polarity is positive and the prescribed bit chooses the least candidate for
    forward inclusion, or the greatest candidate for reverse inclusion.
    This compares it with every possible candidate of $T'$. In particular we do not recurse into the possibly
    larger normal expression obtained by substituting for $y$.
  Let $T = Pi x : D . E$, choosing $x$ fresh for $N$ and for the substitution data.
    The post-substitution type is again a product, with its two substituted components normalized.
    Context-convert the open codomain to the normalized post domain.
    To compare the product test candidates in direction $delta$, compare their domain candidates in direction $-
    delta$. On each common test compare their codomain candidates in direction $delta$,
    extending the actual images by that same raw test and using the respective prescribed bits for $x$.
    For example, for forward inclusion every post domain test must be a pre domain test,
    and its pre codomain candidate must be contained in its post codomain candidate.
  If a pre child is in $U$, its generic substitute remains in $U$ and both actual child candidates are top.
    If its generic substitute grows into $U$, the common actual child profile is again in $U$,
    with the same conclusion. In all other required child comparisons, both generic child profiles are in $S$.
    Such a post child must be the same unique $S$ child as before substitution:
    a pre off-path child in $U$ cannot grow into $S$. Every common supported variable other than the new binder
    $x$ therefore inherits the agreement condition from the parent.
    If $y$ supports the child, the prescribed extremum condition is also inherited:
    a domain step reverses both the comparison direction and the support polarity, and a codomain step reverses neither.
  It remains to check the bits of $x$ when it is supported in both open codomains.
    The pre support path ends at a neutral with head $x$, which substitution for $y$ cannot change.
    Every product on that path persists. The post support path must follow the same positions:
    a pre off-path child remains in $U$, while truncation of the path into $U$ would prevent the post codomain
    from being supported by $x$. Thus both paths have the same number of domain steps, their polarities agree,
    and the prescribed bits of $x$ agree. If substitution exposes $x$ through a neutral headed by $y$,
    that portion of the induction instead stops at the extremum case already proved;
    it imposes no further shared-support condition.
  All hypotheses of the child inductions now hold. Their inclusions give the desired product inclusion by the
    universal test definition, in either direction. This completes the induction. ◻
]

#thm([Proposition 25.])[
  (The one-child construction).  #emph[If no profile triple has all three vertices in $S$,
    then the bit-parametrized candidates above implement the candidate interface.]
] <prop:one-child-component>

#proof[
  Candidate existence and product equality follow from the recursion. Lemma 23 gives the required invariances.
    To verify specialization, let $T = Pi x : D . E$, take $Gamma tack.r N : D$ with $N xi in R_D$,
    and let $h in R_T$. Its product test gives
  $ h \( N xi \) in R_E \( xi \[ x mapsto N xi \] \, theta_x \) $
  when the actual codomain profile lies in $S$; here $theta_x$ is the prescribed binder extension.
    Apply Lemma 24 to substitution for $x$ in $E$, with comparison direction $+$. All old bits agree.
    The prescribed bit of $x$ is exactly $0$ for positive support and $1$ for negative support,
    as that lemma requires. It follows that the last candidate is contained in
    $R_(\( E \[ x := N \] \)^(\#)) \( xi \, theta \)$, proving specialization.
    At an actual codomain profile in $U$, the strong-normalization test gives specialization directly.
    Arbitrary bits are allowed on the starting context, and every prescribed or arbitrary binder extension exists.
    All interface requirements are satisfied. ◻
]

Consequently, only components having both an odd closed walk and a profile triple entirely inside the component
  remain. The next construction will provide their interface under a stated graph exclusion.
  Once that exclusion is proved from system-wide weak normalization,
  Proposition 21 completes the normalization argument.

== 5 Observation spaces and substitution-stable candidates <obs:section>

We now construct the candidate interpretation for the remaining primary component.
  Throughout this section, $S$ is the current component of the primary graph and $U$ is its predecessor-closed
  processed part. We retain the hypothesis of weak normalization for every legal expression.
  We use the preceding profile and candidate lemmas, including $G_T =
  "Ty" \( T \) ∩ upright("SN")_beta$ when $pi \( T \) in U$.
  The new input will be the exclusion of a particular finite graph configuration,
  stated below and proved in the next part of the argument.
  No strong-normalization hypothesis is imposed on substitutions in this section.

The interpretation of a neutral type must account for substitutions that replace its head by a product.
  We therefore give variables parameters that record candidates,
  and interpret the syntax of a substituted term to determine which candidate to read.
  At a function type $T = Pi x : D . E$, such a parameter records a base observation.
  The construction supplies spaces only at selected types; whenever the instantiated result
  $\( E \[ q \/ x \] \)^(\#)$ has a space, a normal argument $q : D$,
  together with a parameter for $q$ when its type requires one, selects a next value in that result space.
  The function’s space can therefore depend on the spaces for both its arguments and its results.
  These dependencies can cycle, so ordinary recursion on the displayed type does not suffice.

The graph below identifies which spaces are needed and separates two ways to construct them.
  Some admit a description by finite observation paths or a decreasing count of type nodes.
  For the others we build two spaces together: unrestricted tables on one side and tables with a uniform finite
  bound on their payload dependence on the other. After constructing the spaces,
  we prove that every finite typed syntax tree can be evaluated in them.
  Substitution and reduction require an additional condition, called goodness,
  which holds for the normal syntax used to define our candidates.
  That final transport result will supply the specialization property of the candidate interface.

=== 5.1 Which values require observations? <obs:graphs>

There are two different profiles to keep apart. A neutral type sorted at $s$ has expression profile ${ s }$;
  a value interpreting that type is indexed by its expected type $s$, whose profile is $"Ax" \( s \)$.
  These axiom profiles are the starting points for deciding which parameter spaces are needed.
  The remaining graph definitions follow the dependencies of those spaces toward domains that are tested by
  products within $S$.

Let $H$ be the closure under primary positive paths of

$ { "Ax" \( s \) : { s } in S \, med "Ax" \( s \) eq.not diameter } . $

The #emph[secondary graph] has vertex set $H$. It retains all primary positive edges between these vertices.
  It retains the negative edge $I arrow.r K$ belonging to a profile triple $\( I \, J \, K \)$ precisely when
  $I \, J \, K in H$. A vertex $I in H$ is #emph[direct] if some profile triple $\( I \, J \, K \)$ has $J \,
  K in S$; here $J \, K$ need not belong to $H$. A vertex is #emph[active] if it has a secondary path to a direct
  vertex. Only the induced graph on active vertices will be used below.

An active vertex is #emph[plain] if paths from it to direct vertices occur with both parities.
  Otherwise it is #emph[free]; its sign is $+$ if those paths are even and $-$ if they are odd.
  A path of length zero is even, so a free direct vertex has sign $+$.

This last observation will control the later uniform bounds.
  A product test whose product and instantiated codomain profiles remain in $S$ has its open codomain profile in
  $S$ as well, by their positive ascent. A domain profile that is active is therefore direct.
  Such a test may quantify over parameters at plain or free plus profiles, but never at free minus profiles.
  This fact will let one finite dependence bound survive all the parameter choices in a product test.

#thm([Lemma 26.])[
  (Signs and dependencies).  #emph[An active predecessor of a plain vertex is plain.
    Along an edge between free vertices, the sign is preserved on a positive edge and reversed on a negative edge.]
  #emph[Let $T = Pi x : D . E$ be a normalized actual type, put $I = pi \( D \)$, $J = pi \( E \)$, and $K =
    pi \( T \)$, and let $q in "Ty" \( D \)$. Put $T_q = \( E \[ q \/ x \] \)^(\#)$ and $L = pi \( T_q \)$.
    If $K \, L$ are active, then $J$ is active, and $I$ is active whenever $I in H$.
    If instead $K \, L in S$, then $J in S$ and every active $I$ is direct.]
] <obs:graph-lemma>

#proof[
  Prepending the edge in question to paths to a direct vertex proves the sign statements.
    Profile growth and the product edge give the positive path
  $ L arrow.r J arrow.r K \, $
  where the first edge is omitted when $L = J$. Since $L in H$ and $H$ is positive-path closed, $J in H$.
    Its path to the active vertex $K$ makes $J$ active. If $I in H$,
    the negative edge of $\( I \, J \, K \)$ is retained, so $I$ is active too.
    When $K \, L in S$, the displayed path cannot leave their primary strongly connected component.
    Thus $J in S$, and the definition of direct applies. ◻
]

The #emph[layer] of a type $T$ is $pi \( T \)$. A type is active, plain,
  or free of a given sign when its layer is so; an empty layer is inactive.
  These terms concern the type of a value, not the profile of the value itself.

Here is the promised graph hypothesis.

#[#set math.equation(numbering: n => "(7)")
 $ upright("There is no plain active secondary strongly connected component ") C\
upright("with an internal negative edge, a profile triple ") \( I \, J \, K \) upright(" with ") J \,
  K in C upright(",")\
upright("and a sort ") s upright(" such that ") { s } in C upright(", ") "Ax" \( s \) eq.not diameter upright(", and")\
"Ax" \( s \) arrow.r I upright(" by a primary positive path.") $ <obs:forbidden>]

All results in this section are conditional on (7). The later typed contradiction will derive this condition from
  the same system-wide weak-normalization hypothesis.

=== 5.2 Actual frames and plain observation spaces <obs:plain-spaces>

Let $cal(B)$ be the set of assignments choosing one candidate at every actual type.
  Its distinguished member $upright(bold(t))$ chooses every top candidate.
  All types and expressions here are syntax over finite prefixes of $Omega$, modulo $alpha$-equivalence,
  so their collections and $cal(B)$ are sets.

We construct a nonempty set $cal(K)_T$ of parameters for every active actual type $T$.
  For a plain type we require the following precise prefix description.
  If $T = Pi x : D . E$, a #emph[legal frame at $T$] consists of a normal term $q in
  "Ty" \( D \)$ for which $T_q = \( E \[ q \/ x \] \)^(\#)$ is active,
  together with a parameter $v in cal(K)_D$ if $D$ is active.
  If $D$ is inactive there is one absent-payload symbol in place of $v$. Its target is $T_q$.
  A nonproduct type has no legal frames. Write $cal(F)_T$ for this set of frames.
  The desired description is the bijection

#[#set math.equation(numbering: n => "(8)")
 $ cal(K)_T med tilde.eq med cal(B) times product_(a in cal(F)_T) cal(K)_("target" \( a \)) . $ <obs:plain-prefix>]

We call its first coordinate the base and its $a$-coordinate the next value.
  By Lemma 26, all active spaces occurring on the right are plain when $T$ is plain,
  and their secondary components precede or equal that of $T$.

#thm([Lemma 27.])[
  (Construction of plain spaces).  #emph[Under (7), the plain spaces admit (8).
    They also admit distinguished values whose bases are $upright(bold(t))$ and whose next values are
    distinguished values.]
] <obs:plain-construction>

#proof[
  Process the finitely many plain secondary components in source order.
    Suppose first that a component $C$ has no internal negative edge.
    Every active domain used by a legal frame at a type of layer in $C$ then lies in an earlier component:
    otherwise the frame’s triple, whose open codomain is active, would contribute an internal negative edge.
    Thus all frame alphabets can be specified without using a space whose layer belongs to $C$.
  For $pi \( T \) in C$, consider finite paths of legal frames beginning at $T$.
    A continuing path has all its target layers in $C$, and includes the empty path.
    An exiting path has all but its final target layer in $C$ and its final target in an earlier component.
    Define $cal(K)_T$ to be the set of tables assigning a member of $cal(B)$ to each continuing path and a member
    of the final target space to each exiting path. Split a table according to the empty path and the first frame.
    For a frame staying in $C$, its suffix table is exactly a table of the same kind starting at its target.
    For an exiting frame its output is already a value of the target space.
    This gives the bijection (8) in both directions. The constant top outputs and previously chosen exit defaults
    define the distinguished table.
  Now let $C$ have an internal negative edge. For every normalized type $T$ of layer in $C$,
    define a positive integer $p_C \( T \)$ as follows. Count its root.
    At a product with child layers $I \, J$, continue into the codomain when $J in C$,
    and into the domain when $I in C$ and $J$ is active. Apply the same rule recursively at counted children,
    using the binder context in the codomain. This counts a subset of a finite syntax tree.
    Profile invariance makes the count independent of the prefix and unchanged by valid thinning or context conversion.
  For a legal frame at $T = Pi x : D . E$, write $I = pi \( D \)$, $J = pi \( E \)$, $K = pi \( T \)$, and $L =
    pi \( T_q \)$. A same-$C$ domain has smaller count. We claim that its same-$C$ target also satisfies
  #[#set math.equation(numbering: n => "(9)")
   $ p_C \( T_q \) lt.eq p_C \( E \) < p_C \( T \) . $ <obs:potential-drop>]
  Here $J in C$ follows from the positive ascent in Lemma 26; hence $p_C \( E \)$ is defined.
  To prove the first inequality, thin $T$ and $q$ to a common prefix, choosing the displayed binder fresh.
    Associate to every counted node of $\( E \[ q \/ x \] \)^(\#)$ its position string.
    We show that the same position is a counted node of $E$. The induction along a position maintains that the
    corresponding pre- and post-substitution parent profiles both lie in $C$; at the root these are $J$ and $L$.
    At a pre-substitution product the post normal form is a product with componentwise substituted normal forms.
    Write $I_0 \, J_0 \, K_0$ for its pre domain, codomain, and parent profiles, and $I_1 \, J_1 \,
    K_1$ for the post profiles. Profile growth gives $I_1 supset.eq I_0$ and $J_1 supset.eq J_0$,
    also under binders after context conversion.
  If the post codomain is counted, then $J_1 in C$, and the positive path $J_1 arrow.r J_0 arrow.r
    K_0$ has both endpoints in $C$. Hence $J_0 in C$, so the pre codomain is counted too.
    If the post domain is counted, then $I_1 in C$ and $J_1$ is active.
    The inclusion paths put $I_0 \, J_0$ in $H$. Since $K_0 in C subset.eq H$,
    the pre triple has a retained negative edge $I_0 arrow.r K_0$. The path
  $ I_1 arrow.r I_0 arrow.r K_0 $
  again has endpoints in $C$, so $I_0 in C$. Also the positive edge $J_0 arrow.r K_0$ makes $J_0$ active.
    Thus the pre domain is counted. In either case the pre- and post-substitution profiles of the selected child
    lie in $C$, which preserves the induction invariant for the next position.
    Inclusion edges in these paths are omitted when the profiles are equal.
  The association could fail only if a pre neutral leaf became a product.
    Sorts are unchanged, and a neutral with any other head remains neutral after substitution and normalization.
    Its head must therefore be the substituted variable $x$. Let its singleton profile be ${ s }$;
    this lies in $C$. The sort $s$ is sorted, so $"Ax" \( s \) eq.not diameter$.
    Trace the original $x$-headed spine backward through its normalized successive typing products.
    At each application the result layer has a primary positive path to the function layer.
    Starting with the layer $"Ax" \( s \)$ of its type $s$, concatenate these paths to obtain a positive path to
    $pi \( D \) = I$. The outer product has $J \, K in C$. This is forbidden by (7). No leaf therefore expands.
    Position strings give the required injection of counted nodes and prove (9).
  Define (8) by induction on $p_C \( T \)$, simultaneously for all types with the same count.
    Every same-component space on its right is already constructed by the strict inequalities just proved;
    all other spaces come from earlier components. The product of the specified nonempty sets is nonempty,
    with the explicit element whose base is $upright(bold(t))$ and whose next values are the already specified
    defaults. This completes the construction. ◻
]

=== 5.3 Free observation spaces <obs:free-spaces>

The construction in this subsection is purely set-theoretic.
  The typing conditions on frames will be imposed by evaluation; they do not restrict the tables constructed here.
  Fix the set $cal(Q)$ of normal syntax over $Omega$, with bound names identified up to $alpha$-conversion.
  Let $cal(T)_(upright("pl"))$ be the set of actual plain active types,
  and suppose that the nonempty spaces $cal(K)_D$ have already been constructed for $D in cal(T)_(upright("pl"))$.
  The fixed set of tagged plain values is

#[#set math.equation(numbering: n => "(10)")
 $ cal(V)_(upright("pl")) = product.co_(D in cal(T)_(upright("pl"))) #scale(x: 120%, y: 120%)[\(] { D } times
   cal(K)_D #scale(x: 120%, y: 120%)[\)] . $ <obs:free-plain-values>]

Thus a member of $cal(V)_(upright("pl"))$ remembers both its type $D$ and its value $v in cal(K)_D$.
  Let $cal(B)$ be the set of base observations: a member chooses a candidate at every actual type.
  Write $upright(bold(t)) in cal(B)$ for the choice of the top candidate everywhere.
  For the present construction only the set $cal(B)$ and its distinguished member $upright(bold(t))$ are needed. Put

$ cal(O) = { star.op } union.sq cal(V)_(upright("pl")) \, $

where the union is disjoint. In particular, both output sets $cal(B)$ and $cal(O)$ have specified default
  elements, even if there are no plain active types.

===== 5.3.1 Frames, stacks, and tables. <frames-stacks-and-tables.>

For any set $Y$ define the payload set

$ V \( Y \) = { upright("none") } union.sq #scale(x: 120%, y: 120%)[\(] { upright("opp") } times
  Y #scale(x: 120%, y: 120%)[\)] union.sq #scale(x: 120%, y: 120%)[\(] { upright("plain") } times
  cal(V)_(upright("pl")) #scale(x: 120%, y: 120%)[\)] . $

The three tags make these alternatives disjoint. Define continue and exit frames by

$ F_c \( Y \) = cal(Q) times V \( Y \) times { c } \, wide F_e \( Y \) = cal(Q) times V \( Y \) times { e } . $

Here $Y$ is the space of opposite-sign payloads. The set of non-exiting stacks and the set of exiting stacks are,
  respectively,

#[#set math.equation(numbering: n => "(11)")
 $ S_c \( Y \) = product.co_(n gt.eq 0) F_c \( Y \)^n \, wide S_e \( Y \) =
   product.co_(n gt.eq 0) #scale(x: 120%, y: 120%)[\(] F_c \( Y \)^n times
   F_e \( Y \) #scale(x: 120%, y: 120%)[\)] . $ <obs:free-stacks>]

Thus $S_c \( Y \)$ contains the empty stack $epsilon.alt$, and an exit frame occurs exactly once,
  at the end of a stack in $S_e \( Y \)$. Set

#[#set math.equation(numbering: n => "(12)")
 $ "Tab" \( Y \) = cal(B)^(S_c \( Y \)) times cal(O)^(S_e \( Y \)) . $ <obs:free-tab>]

A table $t = \( t_c \, t_e \)$ gives a base observation on each non-exiting stack and an exit observation on each
  exiting stack. Its default $d_Y$ is specified by

$ \( d_Y \)_c \( sigma \) = upright(bold(t)) \, wide \( d_Y \)_e \( tau \) = star.op . $

Consequently $"Tab" \( Y \)$ is nonempty for every $Y$, including $Y = nothing$.

We seek two spaces whose tables take values of the opposite sign as payloads.
  Their construction must solve two different problems. A plus value should accept every finite stack of minus
  values. A minus value must be representable at a finite stage,
  even though it is tested on arbitrarily many plus values and arbitrarily long stacks.
  Choosing a stage separately for each stack would not give that representation.

The construction below supplies a space $C_(*)$ of minus values and the full space $P_(*) =
  "Tab" \( C_(*) \)$ of plus tables. Increasing stages $C_r$ give restrictions $rho_r : P_(*) arrow.r P_r =
  "Tab" \( C_r \)$ of plus tables. A table on plus payloads represents a minus value precisely when one index $r$
  works for every observation: replacing each plus payload $p$ by $p'$ with $rho_r \( p \) =
  rho_r \( p' \)$ leaves the table output unchanged. Finally,
  fixing any continue prefix must again give a value of the same sign;
  on the minus side it must retain the same representing stage.
  These are the representation and slicing properties that typed evaluation will use.
  We first construct the stages and then prove this characterization.

===== 5.3.2 Relabeling and contravariance. <relabeling-and-contravariance.>

A map $f : Y arrow.r Z$ induces stack maps $S_a \( f \) : S_a \( Y \) arrow.r S_a \( Z \)$ for $a in { c \, e }$.
  These replace $\( upright("opp") \, y \)$ by $\( upright("opp") \, f \( y \) \)$ in each payload position.
  Keys, flags, and the other payload alternatives are unchanged. Define

#[#set math.equation(numbering: n => "(13)")
 $ "Tab" \( f \) : "Tab" \( Z \) arrow.r "Tab" \( Y \) \, wide
   #scale(x: 120%, y: 120%)[\(] "Tab" \( f \) \( t \) #scale(x: 120%, y: 120%)[\)]_a = t_a compose
   S_a \( f \) . $ <obs:free-contravariance>]

Relabeling preserves identities and composition. Hence

$ "Tab" \( "id"_Y \) = "id"_("Tab" \( Y \)) \, wide "Tab" \( g compose f \) = "Tab" \( f \) compose "Tab" \( g \) . $

It also preserves the default tables: $"Tab" \( f \) \( d_Z \) = d_Y$.

We will use the following two elementary facts.

+ If $f$ is injective, then $S_c \( f \)$ and $S_e \( f \)$ are injective, and $"Tab" \( f \)$ is surjective.
  Indeed, given a table on $Y$, define a table on $Z$ by transporting its values to the images of $S_c \( f \)$
  and $S_e \( f \)$, and assigning $upright(bold(t))$ or $star.op$ on the respective complements.
  Injectivity makes the transported values unambiguous, and restriction recovers the given table.
+ If $f$ is surjective, then $S_c \( f \)$ and $S_e \( f \)$ are surjective, and $"Tab" \( f \)$ is injective.
  To lift a stack, lift its finitely many opposite payloads through $f$.
  If two tables become equal after precomposition with these surjective stack maps,
  they agree on every stack and therefore are equal.

In particular these statements apply when an opposite payload set is empty;
  the stacks without opposite payloads remain available.

===== 5.3.3 The alternating chain. <the-alternating-chain.>

Define, for $r = 0 \, 1 \, 2 \, dots.h$,

#[#set math.equation(numbering: n => "(14)")
 $ C_0 = nothing \, wide P_r = "Tab" \( C_r \) \, wide C_(r + 1) = "Tab" \( P_r \) . $ <obs:free-stages>]

Let $i_0 : C_0 arrow.r C_1$ be the empty map. Inductively, once $i_r : C_r arrow.r C_(r + 1)$ is defined, put

#[#set math.equation(numbering: n => "(15)")
 $ j_r = "Tab" \( i_r \) : P_(r + 1) arrow.r P_r \, wide i_(r + 1) = "Tab" \( j_r \) : C_(r + 1) arrow.r
   C_(r + 2) . $ <obs:free-bonding>]

The preceding facts prove by induction that every $i_r$ is injective and every $j_r$ is surjective.
  Each $j_r$ is restriction to stacks whose opposite payloads lie in the embedded copy of $C_r$;
  its surjectivity has the explicit default-extension proof above.

For $r lt.eq s$, write $i_(r \, s) : C_r arrow.r C_s$ for the composite of the injections,
  with $i_(r \, r)$ the identity. Let $C_(*)$ be the set colimit of this chain.
  Explicitly, take the disjoint union of the $C_r$ and identify $\( r \, x \)$ with $\( s \, y \)$ precisely when,
  at some common stage $m gt.eq r \, s$,

$ i_(r \, m) \( x \) = i_(s \, m) \( y \) . $

The canonical maps $e_r : C_r arrow.r C_(*)$ are injective and satisfy $e_(r + 1) compose i_r = e_r$.
  Their images form an increasing union equal to $C_(*)$. We may therefore regard the stages as nested subsets
  after these identifications. Every finite family of elements of $C_(*)$ lies in a common stage:
  choose a representing stage for each element and then take their maximum.
  Every element in fact has a representative in some $C_(r + 1)$, since $C_0$ is empty.

===== 5.3.4 Final plus tables and finite-stage agreement. <final-plus-tables-and-finite-stage-agreement.>

Put

#[#set math.equation(numbering: n => "(16)")
 $ P_(*) = "Tab" \( C_(*) \) \, wide rho_r = "Tab" \( e_r \) : P_(*) arrow.r P_r . $ <obs:free-final-plus>]

Each $rho_r$ is surjective, by default extension along the injection $e_r$.
  Contravariance and the identities for $e_r$ give

#[#set math.equation(numbering: n => "(17)")
 $ rho_r = j_r compose rho_(r + 1) . $ <obs:free-restriction-compatibility>]

For $p \, p' in P_(*)$ write

#[#set math.equation(numbering: n => "(18)")
 $ p equiv_r p' quad arrow.l.r.double quad rho_r \( p \) = rho_r \( p' \) . $ <obs:free-equivalence>]

Agreement at a larger stage implies agreement at every smaller stage, by repeated use of (17).

Every stack in $S_a \( C_(*) \)$, for $a in { c \, e }$, belongs to the image of $S_a \( e_r \)$ for some $r$:
  it has only finitely many opposite payloads, which lie in a common stage.
  The same holds for any finite family of stacks, with one common $r$. It follows that

#[#set math.equation(numbering: n => "(19)")
 $ #scale(x: 120%, y: 120%)[\(] p equiv_r p' upright(" for every ") r #scale(x: 120%, y: 120%)[\)] quad
   arrow.l.r.double quad p = p' . $ <obs:free-separation>]

For the forward implication, lift any specified final stack from a common stage and evaluate the equality
  $rho_r \( p \) = rho_r \( p' \)$ on that lift. The reverse implication is immediate.
  No assertion that a plus table itself belongs to a finite stage is needed.

===== 5.3.5 Final minus behaviors. <final-minus-behaviors.>

For each $r gt.eq 0$, define

#[#set math.equation(numbering: n => "(20)")
 $ beta_r = "Tab" \( rho_r \) : C_(r + 1) = "Tab" \( P_r \) arrow.r "Tab" \( P_(*) \) . $ <obs:free-behavior-stage>]

In coordinates, for $u in C_(r + 1)$ and $sigma in S_a \( P_(*) \)$,

$ #scale(x: 120%, y: 120%)[\(] beta_r \( u \) #scale(x: 120%, y: 120%)[\)]_a \( sigma \) =
  u_a #scale(x: 120%, y: 120%)[\(] S_a \( rho_r \) \( sigma \) #scale(x: 120%, y: 120%)[\)] . $

Thus each plus payload of a final stack is first restricted to $P_r$.
  Since $rho_r$ is surjective, $beta_r$ is injective. Moreover,

$ beta_(r + 1) compose i_(r + 1) & = "Tab" \( rho_(r + 1) \) compose "Tab" \( j_r \)\
 & = "Tab" \( j_r compose rho_(r + 1) \) = "Tab" \( rho_r \) = beta_r . $

These maps consequently induce a well-defined map

#[#set math.equation(numbering: n => "(21)")
 $ beta : C_(*) arrow.r "Tab" \( P_(*) \) \, wide beta \( e_(r + 1) \( u \) \) = beta_r \( u \) . $ <obs:free-behavior>]

It is injective: represent any two proposed equal-behavior elements at a common stage $C_(r + 1)$ and use the
  injectivity of $beta_r$. We henceforth evaluate a minus value through this behavior map.

The defaults are compatible with all bonding maps. In particular,
  the default elements $d_(P_r) in C_(r + 1)$ represent one element of $C_(*)$, whose behavior is $d_(P_(*))$.
  The plus default is $d_(C_(*)) in P_(*)$. Both free spaces are therefore nonempty.

===== 5.3.6 Exact characterization by a uniform stage bound. <exact-characterization-by-a-uniform-stage-bound.>

Fix $r$. For $a in { c \, e }$ and $sigma \, tau in S_a \( P_(*) \)$ write $sigma tilde.op_r
  tau$ when they have identical lengths, keys, flags, and payload alternatives,
  their plain payloads are identical, and each corresponding pair of opposite payloads $p \,
  p'$ satisfies $p equiv_r p'$. Equivalently,

#[#set math.equation(numbering: n => "(22)")
 $ sigma tilde.op_r tau quad arrow.l.r.double quad S_a \( rho_r \) \( sigma \) =
   S_a \( rho_r \) \( tau \) . $ <obs:free-stack-equivalence>]

This equivalence follows directly from the disjoint payload tags and the definition of stack relabeling.

For a final table $t in "Tab" \( P_(*) \)$, the following conditions are equivalent:

+ $t$ belongs to the image of $beta_r$.
+ For both $a = c$ and $a = e$, the equality $sigma tilde.op_r tau$ implies $t_a \( sigma \) = t_a \( tau \)$.

The first condition implies the second by (20). Conversely, each $S_a \( rho_r \)$ is surjective,
  since a finite stack of elements of $P_r$ can be lifted through the surjection $rho_r$.
  For $eta in S_a \( P_r \)$ define $u_a \( eta \)$ to be $t_a \( sigma \)$ for any lift $sigma$ of $eta$.
  Such a lift exists, and any two lifts are $tilde.op_r$-equivalent by (22).
  The second condition therefore makes the definition unambiguous.
  It defines a unique $u in "Tab" \( P_r \) = C_(r + 1)$ with $beta_r \( u \) = t$.
  This proves the equivalence and uniqueness of the factor.

Consequently

#[#set math.equation(numbering: n => "(23)")
 $ beta \( C_(*) \) = union.big_(r gt.eq 0) beta_r \( C_(r + 1) \) = {t in "Tab" \( P_(*) \) :
   upright("for some ") r \, upright(" each ") t_a upright(" is constant")\
upright("on every ") tilde.op_r upright("-class") \, quad a in { c \, e }} . $ <obs:free-uniform-factorization>]

The one stage $r$ here is uniform over all stack lengths, keys, payloads, and both kinds of ending.
  The preceding argument proves factorization for precisely this uniform condition.

===== 5.3.7 Continue-prefix slicing. <continue-prefix-slicing.>

If $sigma in S_c \( Y \)$ and $t in "Tab" \( Y \)$, define the slice $t \| sigma in "Tab" \( Y \)$ by

#[#set math.equation(numbering: n => "(24)")
 $ \( t \| sigma \)_a \( tau \) = t_a \( sigma tau \) \, wide tau in S_a \( Y \) \, quad a in { c \, e } \,
   $ <obs:free-slice>]

where juxtaposition denotes concatenation. The prefix has only continue frames,
  so concatenation preserves the kind of ending. This immediately gives slices of plus tables, by taking $Y = C_(*)$.

For minus tables, slicing preserves the representing stage.
  For $u in C_(r + 1)$ and $sigma in S_c \( P_(*) \)$, stack relabeling commutes with concatenation and gives

#[#set math.equation(numbering: n => "(25)")
 $ beta_r \( u \) \| sigma = beta_r #scale(x: 120%, y: 120%)[\(] u \| S_c \( rho_r \) \( sigma \)
   #scale(x: 120%, y: 120%)[\)] . $ <obs:free-slice-bound>]

To check this equality, evaluate either side on $tau in S_a \( P_(*) \)$; both values are

$ u_a #scale(x: 120%, y: 120%)[\(] S_c \( rho_r \) \( sigma \) thin S_a \( rho_r \) \( tau \)
  #scale(x: 120%, y: 120%)[\)] . $

The sliced table inside $beta_r$ belongs to $"Tab" \( P_r \) = C_(r + 1)$.
  Thus a minus value represented at $C_(r + 1)$ has every continue-prefix slice represented at that same stage.
  Because $beta$ is injective, this defines an intrinsic slice on $C_(*)$,
  independent of the chosen representing stage. Equivalently,
  fixing a prefix preserves invariance under $tilde.op_r$ on all remaining payloads.
  Default tables slice to default tables. Define

$ cal(K)_T = cases(delim: "{", P_(*) \, & T upright(" is free plus") \,, C_(*) \, & T upright(" is free minus") .) $

Evaluate a minus value through the injective behavior map $beta$.
  Thus a plus value is an arbitrary table, whereas a proposed minus behavior defines a value only after one
  uniform stage bound has been proved. The evaluation of a lambda at a free minus type will be the place where
  this distinction matters.

=== 5.4 Finite typing trees and environments <obs:trees>

Evaluation must remember the particular product used to type an application.
  We therefore equip the finite syntax tree of a judgment $Gamma tack.r M : T$ with generation data.
  At each node we store its expected-type judgment and a core typing converting to that expectation:
  the declaration at a variable; the axiom target at a sort;
  the two child sorts and the formation triple at a product; the annotation sort,
  body type and supporting product typing at a lambda; and the function’s exact product expectation and the
  argument’s domain expectation at an application. We include the annotation’s typing at a lambda.
  These data exist by generation; their witnesses are finite.
  They do not require uniqueness of sorts or formation rules.

The following operations on these trees will be used. Valid thinning and context conversion transport all
  judgments and generation witnesses. At a variable the implicit core declaration is changed accordingly.
  Retargeting a root changes its expected type to a convertible type at which the same expression is typed;
  it retains the core data and all children. Capture-avoiding substitution transports the stored judgments and
  grafts copies of the argument tree at occurrences of the substituted variable,
  thinning and retargeting those copies as needed. These operations use only the previously established metatheory.

An environment for a finite generic context $Gamma$ is a typed substitution $xi : Gamma arrow.r Omega$,
  with arbitrary raw term images, together with a parameter $theta_x in
  cal(K)_(\( A xi \)^(\#))$ for each declaration $x : A$ whose actual type $\( A xi \)^(\#)$ is active.
  Declaration types are evaluated at their prefixes. The notation $A xi$ may also use the whole substitution,
  since no later variable is free in $A$. An extension by $x :=
  n$ is typed whenever $n$ has the actual normalized domain type; conversion gives its required raw type.
  At an active domain it may be accompanied by any parameter in the corresponding space.
  At an inactive domain no parameter is supplied.

Two environments are #emph[compatible] if their raw images are pointwise convertible and their corresponding
  parameters are equal. Their actual normalized types are equal, so this equality of parameters is well-typed.
  All prefix changes are understood by thinning.

=== 5.5 Evaluation and reading candidates <obs:evaluation>

For a typing tree $t$ of $M : T$ and an environment $\( xi \, theta \)$, define

$ "Val" \( t \; xi \, theta \) in cal(K)_(\( T xi \)^(\#)) quad
  upright("when ") \( T xi \)^(\#) upright(" is active.") $

For a tree of $M : s$ with literal expected sort, define $"Read" \( t \; xi \, theta \)$ to be a candidate at the
  actual expression $\( M xi \)^(\#)$. The two constructions are distinct:
  the space index of the first is the actual #emph[type]; the candidate index of the second is the actual
  #emph[expression].

Every active space has a base in $cal(B)$: its prefix base when plain, and its empty-stack output when free.
  Write $"base" \( v \) \[ A \]$ for the candidate at actual type $A$ selected by that base.

First specify the product candidate used in both constructions. For a product tree with children $D : a \, E : b$, put

$ D_0 = \( D xi \)^(\#) \, wide A = \( \( Pi x : D . E \) xi \)^(\#) \, wide A_n = \( E xi \[ x := n \] \)^(\#) . $

The binder is chosen fresh for the images. When $pi \( A \) in S$,
  define $cal(P) \( t \; xi \, theta \)$ to consist of the strongly normalizing $h in
  "Ty" \( A \)$ satisfying the following test. The tester $n$ ranges over

$
  cases(delim: "{", "Read" \( D : a \; xi \, theta \) \, & pi \( D_0 \) in S \,, "Ty" \( D_0 \) ∩
  upright("SN")_beta \, & pi \( D_0 \) in.not S .) $

If $pi \( A_n \) in S$, require

#[#set math.equation(numbering: n => "(26)")
 $ h thin n in "Read" \( E : b \; xi \[ x := n \] \, theta \[ x := v \] \) $ <obs:product-test>]

for every $v in cal(K)_(D_0)$ when $D_0$ is active, and for the unique parameter-free extension otherwise.
  If $pi \( A_n \) in.not S$, require just that $h thin n$ be strongly normalizing at its exact type $A_n$.
  Normalization and conversion identify $A_n$ with the instantiation of the normalized product $A$.
  The candidate test lemma therefore shows that $cal(P)$ is a candidate whenever its child Reads are defined.

The clauses for $"Val"$ are as follows.

+ A variable looks up its parameter. A sort has the distinguished value of its actual type.
+ At a product with literal core sort $s$, start with the distinguished value.
  If ${ s } in S$ and the profile of the actual product expression is in $S$,
  replace its base coordinate at that expression by $cal(P)$.
  All other coordinates and later observations stay distinguished.
+ At a lambda $lambda x : D . P$, the base is $upright(bold(t))$.
  If its actual type is plain, prescribe its next value at every legal frame $\( q \, v \)$ to be
  #[#set math.equation(numbering: n => "(27)")
   $ "Val" \( P \; xi \[ x := q \] \, theta \[ x := v \] \) . $ <obs:lambda-equation>]
  The absent-payload convention applies when the domain is inactive.
    Product compatibility gives the asserted target type.
  At a free actual type, give the following behavior on raw stacks.
    For a nonempty stack, check that its first key $q$ is a normal term at the actual normalized domain and that
    its next actual type is active. Check its payload: absent at an inactive domain,
    an opposite-sign free value at a free domain, or a plain value with exactly the domain’s type tag at a plain
    domain. Finally require a continue flag exactly when the next type is free,
    and an exit flag exactly when it is plain. Lemma 26 gives the same sign at a free next type and the opposite
    sign at a free domain. On a valid continue frame, observe (27) on the remaining stack.
    On a valid exit frame, return that value tagged with its plain target type.
    On an invalid stack, return the distinguished output for its ending.
    The finite-bound lemma below proves that this behavior represents a member of the minus space when the lambda
    is minus.
+ At an application $F thin N$ with active actual result type,
  return its distinguished value if the function’s actual type is inactive.
  Otherwise use the frame with key $\( N xi \)^(\#)$ and payload $"Val" \( N \)$ when its actual domain is active.
  At a plain function take its next value. At a free function take a continue slice when the result is free.
  When the result is plain, take the exit output and project its correctly tagged value,
  using the distinguished target value for a missing or wrong tag.
  The graph lemma and subject reduction make this a legal frame with the asserted target.

The clauses for $"Read" \( M : s \)$ are these. If the actual expression profile is outside $S$,
  or if $M$ is a literal sort, use the top candidate. At product syntax with actual profile in $S$, use $cal(P)$.
  At all other syntax with actual profile in $S$, use

#[#set math.equation(numbering: n => "(28)")
 $ "base" \( "Val" \( M : s \) \) \[ thin \( M xi \)^(\#) thin \] $ <obs:read-base>]

if ${ s } in S$ and $"Ax" \( s \)$ is active; use top otherwise.
  The layer required for the Val in (28) is exactly $"Ax" \( s \)$.

Val calls Read only on strict syntax children. Read may call Val at the same root.
  Thus the intended recursion order is syntax size, with Val preceding Read at a fixed size.
  The next lemma establishes totality as well as the only representability issue, at a minus lambda.
  It also establishes compatible-image invariance without assuming that the raw images are strongly normalizing.

=== 5.6 Uniform finite bounds for typed evaluation <obs:bound-section>

We verify that the preceding clauses define actual values in the stated spaces, including at free minus layers.
  In this subsection a typing tree is fixed, but its typed substitution and its parameters may vary.
  Bounds will depend only on the finite tree and an integer, and not on any of these images or parameters.
  We use the images of $C_k$ in $C_(*)$ without further notation.

Two environments for the same tree are called #emph[image-compatible] if their term images are pointwise
  convertible. Their actual normalized declaration types consequently agree.
  For $r gt.eq 0$, say that they #emph[agree to level $r$] if, in addition,
  corresponding plain and minus parameters are equal and corresponding plus parameters are $equiv_r$-equivalent.
  Parameters at inactive declarations are absent. An environment is #emph[minus-bounded by $k$] if all its minus
  parameters belong to $C_k$. In particular, being minus-bounded by zero means having no minus parameters.
  Every finite environment is minus-bounded by some $k$, since $C_(*)$ is the increasing union of its stages.

===== 5.6.1 The three binder facts. <obs:bound-binder-facts>

The following consequences of the graph definitions will be used repeatedly.
  Suppose a normalized product has profile $K$, domain profile $I$, open codomain profile $J$,
  and instantiated codomain profile $L$. If $K$ and $L$ are active, the positive ascent $L arrow.r J arrow.r
  K$ makes $J$ active. If also $I in H$, the retained negative edge $I arrow.r K$ makes $I$ active. Therefore:

+ If $K$ is plain, every active frame payload and every active continuation is plain:
  an active edge into a plain vertex starts at a plain vertex,
  and the same holds for a positive path into a plain vertex.
+ If $K$ and $L$ are free, they have the same sign; a free domain payload has the opposite sign to $K$.
+ If $K \, L in S$, then $J in S$, since $J$ lies on a path between two vertices of the primary strongly connected
  component $S$. Hence an active $I$ is direct. A free direct vertex is plus, so such a domain is never free minus.

The last assertion is the reason that universal quantification over payloads in a product candidate preserves a
  fixed minus bound.

#thm([Lemma 28.])[
  (Uniform finite bounds).  #emph[For every fixed finite tree $t$ there are bounds for each of its $"Val"$ and
    $"Read"$ evaluations, denoted below by $F_t \( k \)$ when the evaluation is understood,
    with $F_t \( k \) gt.eq k + 1$, satisfying the following assertions.]
  + #emph[Every evaluation is defined for every typed environment.]
  + #emph[In any environment minus-bounded by $k$, a free minus $"Val"$ output belongs to $C_(F_t \( k \))$.]
  + #emph[For two environments minus-bounded by $k$ and agreeing to level $F_t \( k \)$,
    plain and minus $"Val"$ outputs are equal, $"Read"$ outputs are equal,
    and plus $"Val"$ outputs are $equiv_k$-equivalent.]
  #emph[The output spaces and their indices in the two environments agree:
    pointwise convertibility of the images gives the same normalized actual types, expression profiles,
    normalized argument keys, and plain type tags. Increasing a chosen bound preserves all three assertions.]
] <obs:bound-statement>

#proof[
  We prove the statement together with totality by induction on syntax size,
    proving $"Val"$ before $"Read"$ at a given size. All calls to $"Read"$ from a product $"Val"$ concern proper
    children; the only same-size call is from the remaining $"Read"$ clause to $"Val"$.
    Thus this is a well-founded order. A bound for a node is the maximum of the finitely many bounds described
    below for its possible clauses. Conditional variation of the actual profiles does not introduce infinitely
    many cases: the estimates distinguish only inactive, plain, plus,
    and minus layers and the finitely many syntactic evaluation clauses.
  ===== 5.6.2 Lookup and defaults. <obs:bound-leaves>
  A minus lookup already lies in $C_k$, and a plus lookup agrees under $equiv_k$ whenever the environments agree
    to any level at least $k$. Plain lookups agree exactly. Constant-by-ending defaults lie in $C_1$ on the minus
    side. Sort defaults and skipped-application defaults therefore satisfy the assertions with bound $k + 1$.
  ===== 5.6.3 Lambdas at plain and plus layers. <obs:bound-positive-lambdas>
  Write $l$ for the bound of the body evaluation at $k$. A lambda at a plain layer is defined using the plain
    prefix bijection. Each of its frames introduces an identical plain parameter, or no parameter,
    when two matching frames are compared. Its active continuation is also plain, by the first binder fact.
    The extended environments remain minus-bounded by $k$, so body comparison gives equal frame outputs.
    Together with the equal default base, the prefix bijection gives equal lambda values.
    This holds simultaneously for all frames and all continuations; the same $l$ works for every one.
  A lambda at a plus layer is a full table. It is defined on every raw stack using the gate in the evaluation
    definition. For each individual valid first frame, its minus payload, if present,
    belongs to some finite stage of $C_(*)$. Together with the finitely many original environment parameters this
    gives a finite bound for the extended environment. Totality of the smaller body tree therefore defines the
    requested body value. This use of totality does not require a single bound for all possible payloads in the
    full table.
  For comparison under $equiv_k$, however, only stacks whose minus payloads all lie in $C_k$ are inspected.
    Compare the same such stack in the two tables. The gate agrees in the two environments.
    If it is valid, its first frame introduces either the same minus parameter in $C_k$, the same plain parameter,
    or none. Body comparison at $k$ thus applies. For a continue frame the body has plus sign and its
    $equiv_k$-agreement gives the same observation on the restricted tail.
    For an exit frame the body is plain and agrees exactly. Invalid stacks and the empty stack have matching
    defaults. This proves $equiv_k$-agreement of the plus lambda using the bound $l$.
  ===== 5.6.4 Lambdas at minus layers. <obs:bound-minus-lambdas>
  Again let $l$ be the body’s bound at $k$, so $l gt.eq k + 1 gt.eq 1$.
    First define the lambda’s behavior on raw stacks by the stated gate and body clauses.
    Every valid first frame introduces a plus parameter, a plain parameter, or none;
    no new minus parameter is introduced. The body is therefore total in an environment still minus-bounded by $k$.
  Consider two original environments agreeing to level $l$, and two stacks with identical keys, flags,
    none/plain payloads, and pairwise $equiv_l$-equivalent plus payloads. Their gates agree.
    At a valid first frame the extended environments still agree to level $l$ and remain minus-bounded by $k$.
    If the frame continues, the two body outputs are the same minus value $c in C_l$.
    Its behavior factors through $equiv_(l - 1)$, and hence also through $equiv_l$,
    on the plus payloads of the tails. It therefore gives equal observations on the two tails.
    If the frame exits, body comparison gives equal plain values. Defaults and empty observations also agree.
  Apply this argument first with the same original environment on both sides.
    It proves uniform invariance of the lambda behavior under $equiv_l$ in all plus payloads.
    The exact factorization result for free spaces then represents it by an element of $C_(l + 1)$.
    Apply the argument next to different original environments and the same stack on both sides.
    Their represented behaviors agree on every stack; the behavior representation is injective,
    so their minus values are equal. Thus $l + 1$ is a valid output and comparison bound for the minus lambda.
  ===== 5.6.5 Applications. <obs:bound-applications>
  Let $f$ and $n$ be bounds for the function and argument evaluations, respectively.
    Actual normalized argument keys agree in image-compatible environments.
    A function at an inactive layer returns the default. A function at a plain layer has only plain active
    dependencies, by the first binder fact. The function and any evaluated argument payload therefore agree
    exactly by their induction hypotheses at $k$, and the plain prefix operation gives equal outputs.
  Suppose the function is plus. Argument comparison at $k$ makes a minus payload exactly equal in the two
    environments and puts it in $C_(n \( k \))$. Set
  $ a = max { k \, n \( k \) } . $
  The original environments are also minus-bounded by $a$. Function comparison at $a$ gives $equiv_a$-agreement,
    provided the environments agree to level $f \( a \)$. Every prefixed stack needed to compare a continuing
    output under $equiv_k$ has its new minus payload in $C_(n \( k \)) subset.eq
    C_a$ and all tail minus payloads in $C_k subset.eq C_a$. The function observations therefore agree on these
    stacks. An exit is a single such frame and gives equal tagged plain values,
    hence equal results after projection. If the payload is none or plain,
    the same estimate applies with no use of $C_(n \( k \))$.
  Suppose instead the function is minus. Function comparison at $k$ gives the same value in $C_j$, where
  $ j = f \( k \) . $
  Apply argument comparison at $b = max { k \, j }$. If the argument payload is plus,
    the two payloads agree under $equiv_b$, hence under $equiv_j$.
    Since the function behavior already factors through $equiv_(j - 1)$,
    inserting these payloads gives the same observations on identical arbitrary tails.
    A continue slice remains in $C_j$ by the slicing result, and the two slices are equal by injectivity of the
    behavior representation. An exit gives equal plain values.
    Equal plain payloads and absent payloads are immediate special cases.
  All these calls, together with the required output stages, are dominated by the finite expression
  #[#set math.equation(numbering: n => "(29)")
   $ 1 + max { k \, f \( k \) \, n \( k \) \, f \( max { k \, n \( k \) } \) \,
     n \( max { k \, f \( k \) } \) #scale(x: 120%, y: 120%)[}] . $ <obs:bound-application-formula>]
  No monotonicity of $f$ or $n$ is needed: the displayed arguments are the precise ones used above.
    A plus active function can only have a free plus active continuation,
    and a minus one only a free minus active continuation, so the cases prove the required output assertion as
    well as comparison.
  ===== 5.6.6 Product candidates and product overrides. <obs:bound-products>
  Consider a product candidate whose actual expression profile is in $S$.
    Use the domain child’s $"Read"$ comparison at $k$ whenever that Read is requested.
    It gives exactly the same domain candidate in the two environments, and hence exactly the same set of testers.
    If the domain Read is not requested, the typed strongly normalizing tester set is already identical because
    the actual normalized domains agree.
  For each common tester $n$, the instantiated actual codomain types agree.
    When their profile lies in $S$, the third binder fact says that an active domain payload is plain or plus,
    never minus. Pair each payload choice with the identical choice in the other environment.
    This preserves the minus bound $k$ and agreement at every level already required for the original
    environments. The codomain child’s $"Read"$ comparison at $k$ therefore gives equal codomain candidates for
    every tester and every payload choice. Its bound is uniform in the raw term $n$ and the payload:
    both are variable images or parameters for the same fixed smaller tree.
    If the instantiated profile is outside $S$, the required typed strong-normalization condition is identical on
    the two sides. Thus all the universally quantified membership conditions defining the product candidate agree,
    so the candidate itself is equal. The maximum of the two child bounds and $k + 1$ suffices.
  The product $"Val"$ override places this candidate in one component of the empty-stack $cal(B)$ observation,
    leaving the other components and all nonempty observations at their defaults.
    The actual component index is the same in image-compatible environments.
    For a minus output such a table is represented already in $C_1$,
    because its nonempty observations are constant by ending and its empty observation contains no payload.
    For a plus output its observations agree exactly, in particular under $equiv_k$.
    At a plain layer the default continuations and equal base give equality by the prefix bijection.
    This proves the override case with the same child bounds.
  ===== 5.6.7 The remaining Read clauses. <obs:bound-read>
  The default Read clauses are immediate. At a nonproduct whose Read uses its $"Val"$ base,
    use the already proved same-size $"Val"$ bound. Plain and minus values agree exactly;
    plus values agree under $equiv_k$. The latter also gives equal empty observations, even when $k = 0$,
    since the empty stack belongs to every restriction. Reading the same actual-expression component therefore
    gives the same candidate. This completes the simultaneous induction. ◻
]

===== 5.6.8 Exact invariance for identical parameters. <obs:bound-exact-invariance>

As a consequence, image-compatible environments with identical parameters give identical outputs of every kind.
  For plain, minus, and Read outputs choose a common finite minus bound and use the comparison statement.
  For plus outputs, fix any raw observation stack. Its finitely many minus payloads and the finitely many minus
  parameters of the original environments lie in some common $C_k$.
  The environments agree to every level because their parameters are identical,
  so the comparison statement gives $equiv_k$-agreement of the plus outputs and hence equality on this stack.
  The stack was arbitrary, proving equality of the full tables.

The finite-bound proof applies to arbitrary typed trees; it assumes neither normal syntax nor goodness.
  In particular its uniformity is unaffected by the lengths of reductions needed to normalize varying raw images.
  Nonfunctional axioms and product rules also cause no new case:
  the fixed tree stores its selected judgments, while compatibility aligns the corresponding actual normalized indices.

#thm([Lemma 29.])[
  (Structural invariance).  #emph[Compatible environments give identical Val and Read outputs.
    Valid thinning and context conversion, with transported trees and compatible old environments,
    preserve both outputs. Retargeting a root to a convertible expected type preserves Val.
    All these operations commute with capture-avoiding renaming of generic declared and bound variables,
    reindexing the substitution and parameters while leaving their actual images and values unchanged.]
] <obs:structural-invariance>

#proof[
  For compatible environments, apply the finite-bound lemma. Plain, minus, and Read equality follows at once.
    For plus equality, fix any finite raw stack. Its finitely many minus payloads lie in some common $C_k$;
    equality through level $k$ gives equality on that stack. Thus the tables are equal.
  For the structural operations, induct in the Val/Read syntax order.
    Actual normalized types and frame keys agree. At a binder,
    the raw domain types are equal or convertible sorted types,
    so the same actual term gives a typed extension on both sides and the induction hypothesis applies for every
    matching payload. This proves equality of all prefix coordinates or raw observations.
    At a product candidate it proves equality of domain tests and, for every raw tester and payload,
    of the codomain candidates. The application clause then extracts the same coordinate or slice.
    The other clauses are immediate from lookup, defaults, and base projection.
    Retargeting changes no core clause or child and leaves the actual index unchanged.
    Bound variables may be chosen fresh throughout. Reindexing a generic declaration leaves its actual image,
    parameter, and every subsequent actual type unchanged; the same induction therefore also proves equivariance
    under renaming generic declarations. ◻
]

=== 5.7 Good evaluations and substitution <obs:goodness>

Arbitrary stored trees need not respect substitution: the default used at an inactive function can hide syntax
  that later becomes relevant. We identify the trees for which this cannot occur.
  Goodness will depend on the raw images $xi$, but never on their parameters $theta$.

For an active Val evaluation, define goodness by the following clauses.
  A lambda is good if its body is good under every typed raw extension $x :=
  n$ for which the actual next type is active. An application with inactive actual function layer is good if its
  syntactic head is a variable. An application with active function layer is good if the function is good and the
  argument is good whenever its actual layer is active. A product whose base is overridden is good if its product
  candidate is good. Lookups and all other default clauses are good without further conditions.

The goodness of a used product candidate means that its domain Read is good when used,
  and its codomain Read is good under #emph[every] typed raw extension having actual codomain profile in $S$.
  There is no candidate-membership restriction on these extensions.
  For Read, defaults outside actual profile $S$, and sorts, are good.
  A product Read in $S$ is good when its product candidate is good.
  A remaining Read in $S$, with expected sort $s$, is good if ${ s } in S$ and, when $"Ax" \( s \)$ is inactive,
  its syntactic head is a variable; when that layer is active, its Val must be good.
  These are again definitions by the Val/Read syntax order, and their binder clauses quantify over raw terms,
  not over reduction sequences.

#thm([Lemma 30.])[
  (Basic goodness facts).  #emph[Goodness has the structural invariances of Lemma 29.
    If the actual expression profile and ${ s }$ are in $S$ and $"Ax" \( s \)$ is active,
    then Read$\( M : s \)$ is always the base projection (28), at every syntactic shape,
    and its goodness is equivalent to Val goodness.]
  #emph[Every normal syntax tree is good for active Val, under every typed raw substitution.
    A normal tree $M : s$ is good for Read whenever its generic expression profile belongs to $U union S$.]
] <obs:goodness-basic>

#proof[
  Structural invariance follows by the same recursion as for evaluation,
    matching all typed raw binder extensions by conversion. For the base projection assertion,
    the sort case gives top on both sides, the product case is exactly the override, and all other cases use (28).
    In the product case its literal core sort equals $s$ because it is convertible to $s$.
    The goodness clauses agree for the same reason.
  Prove the normal-syntax claims simultaneously in the Val/Read syntax order and universally over typed raw
    substitutions. Normal applications are variable-headed, so skipped ones are good.
    Lambda bodies are normal and the induction hypothesis applies to every typed extension.
    At an overridden normal product, its generic profile contains the core sort $s$, with ${ s } in S$.
    The positive inclusion edge places that generic profile, and hence both child profiles, in $U union S$.
    The child Read induction hypotheses prove all required goodness conditions.
    The same predecessor argument applies at product Read. For a nonsort,
    nonproduct normal Read whose actual profile is in $S$, the generic profile cannot be in $U$,
    since growth from $U$ stays in $U$. It is therefore in $S$.
    The normal expression is neutral and has singleton generic profile ${ s }$,
    giving exactly the required Read condition; its Val, when needed, is good by induction. ◻
]

#thm([Lemma 31.])[
  (Substitution of a good value).  #emph[Let a tree over $Gamma \, x : D \, Delta$ be given,
    and let $u$ be a tree of $Gamma tack.r N : D$. Substitute $u$ capture-avoidably at occurrences of $x$,
    transporting the context, expectations, and generation data.
    Give the resulting context a typed environment, and give the original context a compatible environment whose
    image of $x$ is convertible to the actual expression $N xi$.
    Require the remaining corresponding parameters to agree.]
  #emph[Let $I = pi \( \( D xi \)^(\#) \)$. Assume that $I$ is active whenever $I in H$.
    If $I$ is active, assume Val$\( u \; xi \)$ is good and use its value as the original parameter of $x$.
    Then a good Val or Read evaluation before substitution is good after substitution, and the two outputs are equal.]
] <obs:substitution>

#proof[
  Composition of capture-avoiding substitutions makes corresponding actual images convertible and corresponding
    actual types equal. Induct on the original tree in the Val/Read order.
    An active lookup of $x$ is exactly the chosen value of $u$;
    thinning and retargeting preserve it by structural invariance. Other lookups agree.
  At a binder, rename its variable fresh for $N$. The same raw binder image and payload extend both environments,
    the hypotheses on $I$ remain unchanged, and the induction hypothesis applies.
    This gives equality at every legal frame or every raw observation and proves all universally quantified
    goodness requirements. At a product the root persists. Domain Reads agree by induction;
    for every raw tester and payload the codomain Reads agree by the binder argument.
    Thus the entire product candidates agree and remain good.
    At an unskipped application, the evaluated children agree by induction and its normal argument keys agree by
    conversion, so it extracts the same output.
  It remains to justify the skipped clauses, where an arbitrary change of head would invalidate the argument.
    Suppose a skipped, variable-headed application had head $x$.
    Trace its successive actual typing products backward along the spine.
    There is a primary positive path from its active result layer to $I$,
    passing through its supposedly inactive function layer. The path stays in $H$ by positive closure.
    By hypothesis $I$ is active; consequently every vertex on the path reaches a direct vertex and is active.
    This is a contradiction. The head is therefore a different variable and persists under substitution,
    so the skipped application stays good and keeps its default.
  For a skipped nonproduct Read, goodness supplies ${ s } in S$ and a variable head.
    If that head were $x$, the same spine argument would start at $"Ax" \( s \)$.
    This is nonempty because a neutral typed at $s$ has sorted $s$, and it is a seed in $H$.
    It would reach the active vertex $I$, forcing $"Ax" \( s \)$ active, contrary to this being a skipped Read.
    Thus that head also persists. In the active case use the all-shape base projection of Lemma 30 and the Val
    induction already proved, even if substitution changes the root shape.
    Read outside actual profile $S$ stays the same default. This exhausts the clauses. ◻
]

=== 5.8 Reduction and normal-tree independence <obs:reduction>

#thm([Lemma 32.])[
  (Reduction transport).  #emph[A one-step full beta reduction of a typed expression transports its tree to a tree
    of the reduct at the same expected type. For every environment,
    good Val and Read evaluations remain good and their outputs are preserved. This includes reductions in annotations.]
] <obs:reduction-transport>

#proof[
  Construct the transported tree independently of its environment.
    At contextual steps transport the changed child. A change in a product domain context-converts its open
    codomain tree. A change in a lambda annotation also transports the supporting product typing by subject
    reduction and context-converts the open body. A change in an application argument changes its core result type
    to a convertible one; subject reduction retains the root expectation.
  Induct on the reduction position, simultaneously for Val and Read.
    At evaluated children use the induction hypothesis. At binders apply it under every typed raw extension
    required by goodness; structural invariance handles the context-converted unchanged children.
    Actual types, gates, and argument keys are unchanged. At a skipped variable-headed spine,
    a reduction can only be inside its arguments; the head and skipped condition persist.
    Ignored children need no semantic property, only the transported typing.
    For a remaining Read with active base projection, apply the Val statement already proved at the same root.
    A Read outside actual profile $S$ remains default.
  At a root contraction $\( lambda x : D . P \) N arrow.r P \[ N \/ x \]$,
    generation and product compatibility align the lambda annotation and body type with the application’s stored
    product. Retarget the argument to the annotation type, substitute its tree in the body,
    and retarget the result to the old expectation.
  Consider a good active Val. The application cannot have been skipped, since its syntactic head is a lambda.
    Let $K \, L$ be the actual function and result layers, respectively. They are active.
    By Lemma 26, the actual domain layer $I$ is active whenever it belongs to $H$.
    The argument is good if $I$ is active. Evaluation uses the valid normal key $\( N xi \)^(\#)$ and,
    when required, the payload Val$\( N \)$. The lambda equation gives its body value with this key,
    including at an exit where the lambda supplied the correct tag.
    The raw image $N xi$ is convertible to its normal form. Structural invariance therefore identifies this body
    value with the one at the raw image, with the same payload.
    Lambda goodness supplies body goodness for both typed extensions.
    Lemma 31 now identifies that value with the beta contractum and proves its goodness.
    No strong normalization of $N xi$ was used.
  For a Read with actual profile in $S$, a skipped clause at the root is impossible because the head is a lambda.
    Its goodness therefore provides the active all-shape base projection, and the preceding Val argument applies.
    This proves the root case and the lemma. ◻
]

#thm([Lemma 33.])[
  (Independence on normal syntax).  #emph[On a fixed normal expression in a fixed generic context,
    Val is independent of its stored tree whenever the root expectations are convertible.
    Read is independent of the stored tree and of its chosen literal expected sort.]
] <obs:normal-independence>

#proof[
  Induct in the Val/Read syntax order, comparing the same environments.
    Variables use the same declaration parameter and sorts use defaults.
    For product Val, convertible expected types force its two literal core sorts to agree.
    The override condition is therefore identical. For product Read,
    the product candidate compares the child Reads independently of their sort choices, by induction.
    Its raw extensions and actual indices agree, so the candidates are equal.
  For a lambda, product compatibility aligns the body expectations up to conversion.
    The annotation is fixed syntax. The body Val induction therefore compares every frame and observation.
    In a normal application the function is variable-headed, so its generic type is unique up to conversion.
    Product compatibility aligns the domains and codomains in the two application trees.
    The function and argument Val induction hypotheses give the same keys, payloads, and selected outputs.
    Finally, a normal nonsort, nonproduct expression is neutral and has a unique literal sort.
    Thus any nondefault Read uses the same Val base. These are all normal syntactic shapes.
    Only neutral type uniqueness has been used; functionality of the specification is not assumed. ◻
]

=== 5.9 The candidate interface <obs:interface>

We can now return from raw observations to the candidate interpretation.
  For a generic normalized type $T$ with $pi \( T \) in S$, choose any literal sort typing of $T$ and put

#[#set math.equation(numbering: n => "(30)")
 $ R_T \( xi \, theta \) = "Read" \( T \; xi \, theta \) . $ <obs:R-definition>]

It is independent of the choice by Lemma 33. At generic profiles outside $S$ use the typed-SN top,
  as in the candidate interface. At actual profiles in $U$,
  all candidates are top by the already established equality with $G$.

#thm([Proposition 34.])[
  (Observation interpretation).  #emph[Assume system-wide weak normalization and (7).
    Then (30) gives candidates with the required weakening and context-conversion invariance and nonempty
    parameter extensions. It has the product test clause and the specialization property:
    if $T = Pi x : D . E$ is generic normalized of profile in $S$, $Gamma tack.r N : D$,
    and $N xi$ passes its domain test, then the test of a candidate member $h$ entails
$ h thin \( N xi \) in R_(\( E \[ N \/ x \] \)^(\#)) \( xi \, theta \) . $

 The ordinary typed-SN clause applies when the instantiated actual profile lies in $U$.]
] <obs:interface-theorem>

#proof[
  Candidate membership and the product clause are the Read construction and the candidate test lemma.
    The interpretation’s invariances follow from structural invariance and normal-tree independence.
    Every active space has its distinguished member, so arbitrary context extensions can always be supplied with
    parameters.
  For specialization, if the actual product profile is in $U$, its candidate is the top and hence equals $G$.
    The domain tester is strongly normalizing. Propagation of $G$ along this typed argument gives the required
    typed strong normalization at the instantiated profile, which also lies in $U$.
    We may therefore suppose the actual product profile $K$ is in $S$.
    First suppose that the actual instantiated codomain profile $L$ is in $S$,
    and let $I$ be the actual domain profile. Lemma 26 places the open codomain profile in $S$.
    Thus if $I in H$, the definition makes $I$ direct and hence active; in particular, every active $I$ is direct.
    Normalize the generic argument $N$ to $N^(\#)$, retaining its type $D$ by subject reduction.
    If $I$ is active, choose as binder payload
  $ v = "Val" \( N^(\#) : D \; xi \, theta \) . $
  This exists and is good by normal-syntax goodness. The product test quantifies over every payload and therefore
    includes this choice.
  Its open codomain $E$ is normal, with generic profile in $U union S$, so its Read is good.
    Apply Lemma 31 to substitute $N^(\#)$ there, using the raw image $N xi$.
    This image is convertible to $N^(\#) xi$, as required. The lemma identifies the tested open codomain Read with
    the good Read of the generic expression $E \[ N^(\#) \/ x \]$.
    This expression is typed by substitution and hence weakly normalizing by the system hypothesis.
    Transport its tree along a normalizing sequence using Lemma 32.
    Its normal form is precisely $\( E \[ N \/ x \] \)^(\#)$, because $N$ and $N^(\#)$ are convertible.
    Normal-tree independence identifies the final Read with (30) at that type.
  For completeness, its generic profile belongs to $U union S$:
    it has a positive ascent to the original product profile.
    It cannot belong to $U$ when its actual profile is $L in S$, because profile growth from $U$ stays in $U$.
    Thus (30) is indeed the appropriate generic $S$ entry. If the actual instantiated profile is in $U$,
    the test demands typed strong normalization and the processed component identity identifies this with the
    required top candidate. These are the only actual profiles reached from the current component. ◻
]

Nothing in this construction requires $H$ to be nonempty. If it is empty there are no active spaces or parameters.
  A normal neutral Read of generic profile in $S$ would have profile ${ s }$ with sorted $s$,
  which would supply the nonempty seed $"Ax" \( s \)$ in $H$.
  Thus that case cannot occur, and the sort/product clauses complete the same construction without an extra assumption.

The uses of weak normalization in this section are now explicit.
  It provides the normal forms of actual types, argument keys, and raw typed substitutions,
  and it normalizes the generic expressions used in the specialization proof.
  Strong normalization enters only through the candidate tests already specified in the normalization interface.
  The remaining task is to derive (7) from weak normalization.

== 6 A typed calculus for the forbidden configuration <sec:enc-wrappers>

We now prove the exclusion used in constructing the payload spaces.
  Throughout this section, $S$ is a primary strongly connected component containing an odd closed walk and a
  profile triple $\( a_0 \, b \, k_0 \)$ with all three vertices in $S$.
  We construct a small logical calculus inside the given PTS.
  Its judgments will be genuine PTS judgments in one finite open context.
  The later contradiction will therefore fall under the system-wide weak-normalization hypothesis.

We say that a type is #emph[sorted at a profile] $I$ if it has each sort in $I$.
  Its actual profile may be larger than $I$. All constructions below use only these separate sort judgments,
  and never uniqueness of sorts or product rules. Since $S$ is strongly connected and has an odd closed walk,
  any two of its vertices are joined inside $S$ by paths of both parities:
  join the first vertex to the walk and the walk to the second, and either insert the odd walk or omit it.
  A path’s parity is the number of its negative edges modulo two.

=== 6.1 Modes and the ambient context <subsec:enc-modes>

Partition variable names into two infinite classes, of modes $sans(d)$ and $sans(p)$. Sorts have mode $sans(d)$.
  Products, abstractions and applications carry a label

$ \( i \, j \) in { \( sans(d) \, sans(d) \) \, \( sans(d) \, sans(p) \) \, \( sans(p) \, sans(p) \) } . $

In a binder, $i$ is the bound variable’s mode. A product $Pi^(i \, j) x : A . B$ has mode $sans(d)$ and both $A \,
  B$ have mode $sans(d)$. An abstraction $lambda^(i \, j) x :
  A . M$ has annotation of mode $sans(d)$ and body and result of mode $j$.
  In an application with label $\( i \, j \)$, the argument has mode $i$ and the function and result have mode
  $j$. Consequently, an expression of mode $sans(d)$ has no free variable of mode $sans(p)$.
  Declaration types and expected types always have mode $sans(d)$.

The typing rules are the original PTS rules with the displayed label retained on the product in abstraction and
  application rules. A beta step contracts an abstraction and application with matching labels;
  reduction is closed under all syntax positions, including annotations.
  Conversion is generated by this labelled reduction. We suppress application labels only when the displayed
  function type determines them. The labelled metatheory and its relation to ordinary reduction are proved in
  Lemma 35. In particular, the weakening, substitution, conversion and generation arguments used below apply in
  these modes.

=== 6.2 Reduction after forgetting the modes <sec:normal-erasure>

Before constructing the witnesses and wrappers, we establish the labelled metatheory and its relation to the given
  pure type system. Write $\| M \|$ for the term obtained by forgetting every mode label.
  Erasure keeps all applications, binders, and annotations.
  In particular, a redex in an annotation remains a redex after erasure.

Labelling and erasure also occur in the structural transformations of Roux and van Doorn
  #cite(label("RouxVanDoorn2014")) Sections 3–4. Here the exact interface is preservation of typing together with
  lifting of every erased beta step. Keeping annotations is part of that interface;
  the domain-erasure comparison studied by Barthe and Coquand #cite(label("BartheCoquand2006")) Theorem 17
  concerns a different operation.

#thm([Lemma 35.])[
  (Labelled metatheory and reduction lifting).  #emph[The labelled typing rules have context validity,
    correctness of types, weakening, typed substitution by terms of the declared modes, context conversion,
    generation, and subject reduction at the exact expected type.
    Labelled beta reduction is confluent, and convertible labelled products have the same pair of labels and
    convertible corresponding components. Erasing a labelled typing derivation gives a typing derivation in the
    original pure type system.]
  #emph[If $Gamma tack.r M : A$ is a labelled judgment and $\| M \| arrow.r_beta N$, there is a labelled $M'$ with
$ M arrow.r_beta M' \, wide \| M' \| = N \, wide Gamma tack.r M' : A \, $

 up to alpha conversion. The mode of $M'$ is the mode of $M$.
   Consequently, every finite reduction of $\| M \|$ lifts to a typed labelled reduction.
   If $\| M \|$ is weakly normalizing, some labelled reduct of $M$ has beta-normal erasure.]
] <lem:enc-labelled-metatheory>

#proof[
  Substitution preserves modes by induction on syntax. A data expression has no free proof variable,
    so substitution for a proof variable cannot introduce proof syntax into a data expression.
    Substitution for a data variable uses a data term. At binders, choose fresh names in the same mode class.
  Context validity follows by rule induction, retaining the sort typing of each declaration from its introduction
    premise. The proofs of weakening and typed substitution are inductions on typing derivations.
    Each binder retains its label, and each substituted term has the mode required by that binder or declaration.
    Context conversion follows by the identity substitution, typing the changed variable at its old type by
    conversion. Generation follows by removing final conversions and weakenings.
    None of these arguments compares distinct possible sort assignments.
  Correctness of types is another rule induction: an expected type is a literal sort or is itself sorted.
    At application, the function’s product type is sorted by induction;
    generation on that product and typed substitution sort the application’s result type.
    This remains true through conversion and weakening.
  For confluence, use parallel reduction with homomorphic clauses at every constructor,
    including annotation children, and a contracting clause only when the application and lambda labels match.
    Parallel substitution is proved by syntax induction. Every parallel reduct of a term parallel-reduces to its
    complete development: contract the matching redexes already present in the original term and develop all
    children. At an unmatched lambda–application pair only the homomorphic clause applies.
    This proves the triangle property, hence confluence. The reflexive transitive closures of parallel and
    ordinary reduction agree, since parallel contractions can be performed from the children upwards.
    Reduction never changes a product’s outer constructor or labels.
    Common reducts therefore give labelled product compatibility, and a product cannot be convertible to a sort.
  Subject reduction now follows by induction on a typing derivation.
    At a root beta step, generation and product compatibility identify the lambda’s annotation with the
    application’s domain up to conversion. Convert the argument to the annotation type, substitute in the body,
    and convert the result to the original expected type. A reduction of an application argument changes its
    substituted result type by conversion. A reduction of a product domain is handled by context conversion in the
    codomain premise. For a lambda annotation step, reduce the corresponding domain in its supporting product
    judgment, context-convert its body premise, re-form the lambda,
    and convert back to the original sorted product type. The other positions,
    including positions inside annotations, follow by induction. These constructions keep every label.
    Erasure of typing follows directly by induction on the labelled derivation.
  It remains to check that an erased redex can be contracted with the labels present.
    Every syntactic subterm of a typable term has a typing in the appropriate binder context;
    for an annotation this follows from context validity. Consider the subterm at the erased redex. Its shape is
  $ \( lambda^(i \, j) x : D . P \) @^(i' \, j) Q . $
  The result modes already force the displayed common $j$. Lambda generation gives a product type with labels
    $\( i \, j \)$; application generation gives a convertible product type with labels $\( i' \, j \)$.
    Product compatibility forces $i = i'$. Thus this is a matching labelled redex.
    Contract it at the same position. Capture-free substitution commutes with erasure, so its erasure is $N$;
    subject reduction gives the asserted judgment and substitution preserves its mode.
    This applies to any position, including one in a lambda or product annotation.
    Induction on a finite erased reduction proves the remaining assertions. ◻
]

=== 6.3 Witnesses and terminal transformations <witnesses-and-terminal-transformations>

For each feasible profile $I$ needed in the finite construction, choose a normal witness $D_I$ sorted at $I$,
  using only data names and labels $\( sans(d) \, sans(d) \)$.
  Such witnesses follow from the profile-generation construction:
  literals realize nonempty axiom profiles, variables of sorted literal type realize the singleton generators,
  and dummy products realize $"Out" \( I \, J \)$. Combine the finitely many witness contexts by renaming their
  data variables disjointly and weakening. Extend the result by a data variable $e_I :
  D_I$ for each needed witness. Denote this finite valid data context by $Delta_(sans(d))$.

Here and below every profile triple means $K = "Out" \( I \, J \)$.
  If $T$ is sorted at $J$, the positive edge $J arrow.r K$ associated with this triple sends $T$ to

$ Pi^(sans(d) \, j) z : D_I . T \, wide j = sans(p) upright(" for proof values") \, quad j =
  sans(d) upright(" for data values") \, $

where $z$ is fresh and absent from $T$. This type is sorted at every sort $c in K$:
  choose $a in I \, b' in J$ with $\( a \, b' \, c \) in cal(R)$ and use those two available sort judgments.
  The corresponding lift and projection are

$ "up" \( t \) = lambda^(sans(d) \, j) z : D_I . t \, wide "pr" \( w \) = w thin e_I . $

They have the displayed types and $"pr" \( "up" \( t \) \) =_beta t$.
  A positive inclusion edge $I' arrow.r I$ with $I subset.eq I'$ uses the identity type, lift and projection.

A negative edge $I arrow.r K$ associated with $\( I \, J \, K \)$ sends a type $T$ sorted at $I$ to $Pi^(j \, j)
  z : T . F$, where $F$ is a fixed type sorted at $J$ and $j$ is $sans(p)$ or $sans(d)$ according to the
  construction. Formation uses exactly the same argument for each $c in K$.
  Thus a path $rho$ defines a wrapper $W_rho \( T \)$ by successive applications of these operations,
  with specified tails at negative edges. Empty paths are permitted, and

$ W_(rho sigma) \( T \) = W_sigma \( W_rho \( T \) \) $

by the definition. We always specify whether the wrapper carries proof values or data values.

For every internal negative edge of $S$ with triple $\( I \, J \, K \)$, fix the proof tail $F_J =
  D_J$ before choosing any paths. Call these finitely many types the #emph[terminals]; include $F_b =
  D_b$ by the negative edge of $\( a_0 \, b \, k_0 \)$. Each terminal is normal and has only
  $\( sans(d) \, sans(d) \)$ labels.

#thm([Lemma 36.])[
  (Terminal transformations).  #emph[There is a finite valid extension $Delta = Delta_(sans(d)) \,
    Delta_(sans(p))$ and, for every pair of terminals $F \, F'$, a proof term $tau_(F \, F') \( p \) :
    F'$ in $Delta \, p : F$. Every declaration of $Delta_(sans(p))$ has the form
$ c : Pi^(sans(p) \, sans(p)) u : T . F_J \, $

 where $T$ is a normal, constant telescope of $\( sans(d) \, sans(p) \)$ products ending at a terminal.
   Its suffixes are sorted, and its type contains no free proof variables.]
] <lem:enc-terminal-converters>

#proof[
  Associate each terminal with a negative edge producing it.
    Lift the input terminal along the positive edge of its associated triple, reaching $S$.
    Choose a path in $S$ to the domain vertex of an edge producing the target terminal,
    and append that negative edge. Carry a proof along this route. At a positive edge use the lift above.
    At a negative edge $\( I \, J \, K \)$, if the currently carried type is $T$,
    introduce a fresh proof variable $c : Pi^(sans(p) \, sans(p)) u :
    T . F_J$ and replace the carried proof $t$ by $c thin t : F_J$.
    Unless this is the last edge, lift $c thin t$ along the positive edge $J arrow.r
    K$ of this same triple before continuing. The product type of $c$ is sorted at $K$, so the declaration is valid.
  Initially the carried type is a terminal. Positive edges add constant $\( sans(d) \, sans(p) \)$ prefixes,
    and negative edges reset the carried type to a terminal before the prescribed lift.
    Thus every converter domain has precisely the asserted form.
    Its normality and the sorting of each suffix follow from its construction.
    The types depend on chosen types and paths, not on the input proof.
    Choose the finitely many pairwise routes first and predeclare all their converters in $Delta_(sans(p))$;
    weakening makes every resulting transformation available in the same context.
    Types use data only, so the converter declarations do not depend on one another. ◻
]

=== 6.4 Proof transport and derived logic <subsec:enc-proof-transport>

Let $rho$ be a proof path inside $S$ from a profile at which $T$ is sorted, and put $W = W_rho \( T \)$.
  The following operations are defined in every valid extension of $Delta$.
  All displayed inputs after a semicolon describe an open term under the indicated fresh variable.
  For an even path they have types

$ "in"_rho \( p : T \) : W \, wide "out"_rho \( w : W \; e . k \) : F quad \( e : T tack.r k : F \) \, $

and for an odd path they have types

$ "in"_rho \( e . k \) : W quad \( e : T tack.r k : F \) \, wide "out"_rho \( w : W \, p : T \) : F \, $

where $F$ is any terminal. Path and terminal subscripts will often be omitted,
  but remain part of each chosen operation. For the empty path, $"in" \( p \) = p$ and $"out" \( w \; e . k \) =
  k \[ e := w \]$. Appending a positive edge lifts the previous $"in"$ and projects the input to the previous
  $"out"$. For a negative edge with tail $F'$ appended to an even path $rho$, set

$ "in"_(rho -) \( e . k \) & = lambda^(sans(p) \, sans(p)) u :
  W_rho \( T \) . "out"_rho \( u \; e . tau_(F \, F') \( k \) \) \,\
"out"_(rho -) \( w \, p \) & = tau_(F' \, F) \( w thin "in"_rho \( p \) \) . $

For a negative edge appended to an odd path $rho$, set

$ "in"_(rho -) \( p \) & = lambda^(sans(p) \, sans(p)) u :
  W_rho \( T \) . "out"_rho \( u \, p \) \, &  & upright("with output terminal ") F' \,\
"out"_(rho -) \( w \; e . k \) & = tau_(F' \, F) \( w thin "in"_rho \( e . k \) \) . $

These are recursion equations on path length. Each abstraction uses the already formed negative-edge product.
  Each application uses its domain exactly, and the terminal transformations have the displayed input and output
  types. This proves the typings by induction; callbacks are thinned by insertion before introducing each fresh
  variable.

Call a type #emph[stable] if it is a syntactic telescope of proof-result products,
  with labels $\( sans(d) \, sans(p) \)$ or $\( sans(p) \, sans(p) \)$, ending at a terminal.
  A telescope of length zero is allowed. Let $Q$ be a sorted stable type independent of a proof variable $e : T$.
  The even-path operation $"out" \( w \; e . k \)$ extends from terminal-valued callbacks to $k : Q$:
  introduce the successive raw arguments $arrow(x)$ of $Q$, thin $w$ and the callback into that context,
  apply terminal-valued $"out"$ to $e . k thin arrow(x)$, and abstract the same arguments $arrow(x)$.
  Generation on the sorted telescope provides the domain sortings and the supporting product judgments for all
  these abstractions. In particular, if $T$ is stable, the identity callback gives

$ "down"_rho \( w \) : T wide \( rho upright(" even") \) . $

A proof wrapper preserves stability of its input. A proof path containing a negative edge produces a stable type
  even if its input was not stable, because the first such edge ends at a terminal.

A #emph[formula] will mean a stable data type sorted at every sort of $b$.
  A formula is therefore a data-mode expression used as a type;
  a proof of that formula means a proof-mode inhabitant. The mode of an inhabitant is not determined by its
  expected type. The next operations give a typed classical logical calculus of formulas.
  These operations are defined terms, not additional PTS rules.

Fix even proof paths $alpha : b arrow.r a_0$, $beta : b arrow.r b$, and $gamma : k_0 arrow.r b$. Define

$ P arrow.r.double Q = W_gamma #scale(x: 120%, y: 120%)[\(] Pi^(sans(p) \, sans(p)) p :
  W_alpha \( P \) . W_beta \( Q \) #scale(x: 120%, y: 120%)[\)] . $

The product rule is supplied by $\( a_0 \, b \, k_0 \)$, and all wrappers are already typed.
  Given $q : Q$ in a context extended by $p : P$, define

$ lambda^(*) p . q & = "in"_gamma #scale(x: 120%, y: 120%)[\(] lambda^(sans(p) \, sans(p)) p' :
  W_alpha \( P \) . "in"_beta \( q \[ p := "down"_alpha \( p' \) \] \) #scale(x: 120%, y: 120%)[\)] \,\
f dot.op p & = "down"_beta #scale(x: 120%, y: 120%)[\(] "down"_gamma \( f \) thin "in"_alpha \( p \)
  #scale(x: 120%, y: 120%)[\)] . $

They have types $P arrow.r.double Q$ and $Q$, respectively.
  Data formulas cannot contain $p$, so the product codomain is independent of this proof variable.

For a data type $T$ sorted at a direct vertex $I$, fix once and for all a triple $\( I \, J \, K \)$ with $J \,
  K in S$, and even proof paths $alpha_I : b arrow.r J$ and $gamma_I : K arrow.r b$.
  For a formula $Q$ in context $x : T$, put

$ forall x : T . Q = W_(gamma_I) #scale(x: 120%, y: 120%)[\(] Pi^(sans(d) \, sans(p)) x :
  T . W_(alpha_I) \( Q \) #scale(x: 120%, y: 120%)[\)] . $

The associated introduction and elimination are

$ Lambda x . q = "in"_(gamma_I) \( lambda^(sans(d) \, sans(p)) x : T . "in"_(alpha_I) \( q \) \) \, wide
  f \[ t \] = "down"_(alpha_I) \( "down"_(gamma_I) \( f \) thin t \) . $

They are typed using precisely the chosen triple. The direct vertex and paths are part of the domain annotation
  and remain fixed under substitution; paths are never reselected from a newly enlarged profile.
  These constructions show that implication and universal quantification again yield formulas.

Set $tack.t = F_b$, $not P = P arrow.r.double tack.t$, and $top = tack.t arrow.r.double tack.t$.
  There are derived operations

$ "abs"_P : tack.t arrow.r P \, wide "dn"_P : not not P arrow.r P \, $

where the arrows describe input and output judgments, not an assertion that these are primitive function types.
  To construct either operation, expose the raw telescope arguments $arrow(x)$ of $P$, ending at a terminal $F$.
  For $f : tack.t$, abstract the terminal body $tau_(tack.t \, F) \( f \)$.
  For $w : not not P$, abstract the terminal body

$ tau_(tack.t \, F) (w dot.op \( lambda^(*) p . tau_(F \, tack.t) \( p thin arrow(x) \) \)) . $

The applications $p thin arrow(x)$ use the original labels and annotations of $P$.
  Sorting and abstraction support follow from generation on $P$, as in the definition of $"down"$.

For completeness, the other logical operations used below are the following explicit abbreviations and term
  constructors:

$ P and Q & = not \( P arrow.r.double not Q \) \, & \( p \, q \)_and & = lambda^(*) h . \( h dot.op p \) dot.op q \,\
"fst" \( w \) & = "dn"_P \( lambda^(*) n . w dot.op \( lambda^(*) p . lambda^(*) q . n dot.op p \) \) \, &
  "snd" \( w \) & = "dn"_Q \( lambda^(*) n . w dot.op \( lambda^(*) p . lambda^(*) q . n dot.op q \) \) \,\
P arrow.l.r Q & = \( P arrow.r.double Q \) and \( Q arrow.r.double P \) \, & "to" \( e \, p \) & =
  "fst" \( e \) dot.op p \,\
 &  & "back" \( e \, q \) & = "snd" \( e \) dot.op q \,\
P or Q & = not \( not P and not Q \) \, & "inl" \( p \) & = lambda^(*) h . "fst" \( h \) dot.op p \,\
 &  & "inr" \( q \) & = lambda^(*) h . "snd" \( h \) dot.op q . $

Given $w : P or Q$ and branches $p : P tack.r u : R$ and $q : Q tack.r v : R$, their case term is

$ "dn"_R (lambda^(*) n . w dot.op \( lambda^(*) p . n dot.op u \, lambda^(*) q . n dot.op v \)_and) . $

Excluded middle has the term

$ "em" \( P \) = lambda^(*) h . "snd" \( h \) dot.op "fst" \( h \) : P or not P . $

For the same permitted quantified domains as above, put

$ exists x : T . Q = not forall x : T . not Q . $

If $t : T$ and $p : Q \[ x := t \]$, a witness term is $"wit" \( t \, p \) = lambda^(*) h . h \[ t \] dot.op p$.
  If $w : exists x : T . Q$ and $u : R$ under $x : T \, p : Q$, where $R$ is independent of $x \, p$,
  existential elimination is

$ "open"_R \( w \; x \, p . u \) = "dn"_R #scale(x: 120%, y: 120%)[\(] lambda^(*) n . w
  dot.op \( Lambda x . lambda^(*) p . n dot.op u \) #scale(x: 120%, y: 120%)[\)] . $

Each display can be checked from the introduction and elimination judgments already proved.
  All new assumptions are introduced with their formula or data type as annotation,
  and terms are weakened when necessary.

#thm([Lemma 37.])[
  (Finite propositional derivations).  #emph[If formulas $P_1 \, dots.h \,
    P_m$ propositionally entail a formula $R$, there is a specified finite term
    $sans(p l)_R \( p_1 \, dots.h \, p_m \) : R$ under $p_i : P_i$.
    Here $tack.t$ has truth value false; specified Boolean connectives are parsed, and other subformulas,
    including quantifiers, may be treated as atoms.]
] <lem:enc-propositional>

#proof[
  List the finitely many atoms and nest cases on their terms $"em"$.
    Each resulting branch supplies either the atom or its negation.
    Recursively build a proof of every true parsed formula and a proof of the negation of every false parsed
    formula. For $tack.t$ the required negation is the identity term.
    For conjunction, a true case uses pairing, and a false case contradicts the false conjunct’s projection.
    For disjunction, a true case uses its true injection, and a false case uses case analysis to contradict either
    disjunct. For implication, a true case either returns a proof of the consequent or derives it by $"abs"$ from
    the false antecedent; a false case contradicts the application of an assumed implication to the already proved
    antecedent. Negation is implication to $tack.t$, and biconditional is its displayed conjunction.
    If some premise is false, apply its constructed negation to the given proof and use $"abs"_R$.
    Otherwise the assumed truth-table entailment makes $R$ true, so use its constructed proof.
    The recursively typed case terms discharge all branch assumptions. ◻
]

We also use three explicit congruence constructors. For a proof $e : P arrow.l.r Q$ under data $x : T$, define

$ sans(A l l)_x \( e \) = #scale(x: 120%, y: 120%)[\(] lambda^(*) h . Lambda x . "to" \( e \, h \[ x \] \) \,
  lambda^(*) h . Lambda x . "back" \( e \, h \[ x \] \) #scale(x: 120%, y: 120%)[\)]_and . $

It compares $forall x : T . P$ and $forall x : T . Q$ with exactly the same annotated domain.
  Define $sans(E x)_x \( e \)$ by pairing the two functions which open an existential input,
  retain its data witness, and use $"to"$ or $"back"$ on its proof witness.
  For a proof $e : P arrow.l.r Q$ under $v : D$, where $D$ is a formula, put

$ sans(G d)_(v : D) \( e \) = #scale(x: 120%, y: 120%)[\(] lambda^(*) h . lambda^(*) v .
  "to" \( e \, h dot.op v \) \, lambda^(*) h . lambda^(*) v . "back" \( e \, h dot.op v \)
  #scale(x: 120%, y: 120%)[\)]_and . $

This compares $D arrow.r.double P$ and $D arrow.r.double Q$.
  Multiple indices mean iteration of the corresponding constructor.

These conventions make later derivations finite algorithms for labelled terms.
  A stated propositional consequence invokes Lemma 37; proving the two directions of an equivalence means
  abstracting the two assumptions and pairing; opening an existential means the displayed $"open"$ term at the
  stated target. A schematic data parameter is an open parameter, not an implicit universal quantifier.
  Only displayed $Lambda$ operations quantify over data. Logical equivalences are used to construct proofs and
  never to replace a data subterm. All fixed paths, roles and syntax choices are preserved under substitution.

=== 6.5 Data wrappers and exact cancellation <subsec:enc-data-transport>

For a sort $u$ with ${ u } in S$ and $"Ax" \( u \) eq.not diameter$, fix an even proof path from $b$ to ${ u }$.
  For a formula $P$, its wrapper type along this path is a data expression of type $u$;
  denote it by $"encode"_u \( P \)$. Fix also an even proof path from ${ u }$ to $b$ containing a negative edge.
  Such a path is obtained from any even one by inserting an odd closed detour twice.
  Wrapping a data expression $t : u$ along this second path defines a stable formula $"decode"_u \( t \)$.
  The two proof-path inclusions and the two stable retractions give a proof

#[#set math.equation(numbering: n => "(31)")
 $ "decode"_u \( "encode"_u \( P \) \) arrow.l.r P . $ <eq:enc-code-decode>]

Explicitly, the forward implication applies the two $"down"$ operations and the reverse implication applies the
  two $"in"$ operations. No equality of the two formulas is asserted.

Recall that $H$ is the positive-path closure of the nonempty $"Ax" \( u \)$ with ${ u } in S$.
  For each tail vertex $J$ of a retained negative secondary edge,
  choose such a $u$ and an all-positive primary path $eta : "Ax" \( u \) arrow.r J$. Define the data type

$ U_J = W_eta \( u \) \, $

using data labels. It is sorted at $J$. Define $"send"_J \( P \) :
  U_J$ by positively lifting $"encode"_u \( P \) : u$, and define $"read"_J \( t \)$ by positively projecting $t :
  U_J$ to type $u$ and applying $"decode"_u$. Positive projection–lift beta conversion and (31) give a specified proof

#[#set math.equation(numbering: n => "(32)")
 $ "read"_J \( "send"_J \( P \) \) arrow.l.r P . $ <eq:enc-read-send>]

These choices are fixed once for each retained edge.

Now use data wrappers on secondary paths, and on all-positive primary paths when indicated.
  At a retained negative edge $\( I \, J \, K \)$, the tail is $U_J$ and the label is $\( sans(d) \, sans(d) \)$.
  For an even data path $rho$ from the sorting profile of $T$, define

$ "pack"_rho \( t : T \) : W_rho \( T \) \, wide "use"_rho \( w : W_rho \( T \) \; x . Phi \) quad
  upright("a formula") \, $

where $Phi$ is a formula under data $x : T$. For an odd data path define

$ "mk"_rho \( x . Phi \) : W_rho \( T \) \, wide chevron.l w : W_rho \( T \) \, t : T chevron.r_rho quad
  upright("a formula") . $

At the empty path use $"pack" \( t \) = t$ and $"use" \( w \; x . Phi \) = Phi \[ x := w \]$.
  A positive extension uses the same lift and projection operations as before.
  If a negative edge with tail $U_J$ is appended to an even path, put

$ "mk"_(rho -) \( x . Phi \) & = lambda^(sans(d) \, sans(d)) v :
  W_rho \( T \) . "send"_J \( "use"_rho \( v \; x . Phi \) \) \,\
chevron.l w \, t chevron.r_(rho -) & = "read"_J \( w thin "pack"_rho \( t \) \) . $

If it is appended to an odd path, put

$ "pack"_(rho -) \( t \) & = lambda^(sans(d) \, sans(d)) v :
  W_rho \( T \) . "send"_J \( chevron.l v \, t chevron.r_rho \) \,\
"use"_(rho -) \( w \; x . Phi \) & = "read"_J \( w thin "mk"_rho \( x . Phi \) \) . $

All expressions in these definitions have mode $sans(d)$. Path induction proves their typings:
  the body of each new lambda has type $U_J$, the negative-edge product is sorted by $\( I \, J \, K \)$,
  and each application supplies an argument at exactly its displayed domain.
  The formula returned by a read is stable by the negative-containing decode path.
  Fresh variables and weakening keep callbacks in scope.

#thm([Lemma 38.])[
  (Exact data cancellation).  #emph[For an even data path there is a proof of
$ "use"_rho \( "pack"_rho \( t \) \; x . Phi \) arrow.l.r Phi \[ x := t \] \, $

 and for an odd data path there is a proof of
$ chevron.l "mk"_rho \( x . Phi \) \, t chevron.r_rho arrow.l.r Phi \[ x := t \] . $

 These are uniform term constructors in all the displayed open data parameters.
   The right-hand sides contain the original input $t$.]
] <lem:enc-data-cancellation>

#proof[
  Induct on the path. The empty-path equivalence is propositional reflexivity.
    A positive extension beta-reduces its projection of a lift,
    so conversion reduces its assertion to the preceding one.
    For a negative extension, the displayed lambda beta-reduces the left side to
    $"read"_J \( "send"_J \( Psi \) \)$, where $Psi$ is the left side of the previous cancellation assertion.
    Apply (32), the induction hypothesis, and $sans(p l)$ for transitivity of equivalence.
    The expansions commute with capture-free substitution because all paths,
    tails and names are fixed hygienically. Consequently the final callback is exactly $Phi \[ x := t \]$ up to
    labelled conversion, with no extensional substitution inside data. ◻
]

The preceding constructions use finitely many sorts, profiles, witnesses, paths and converters.
  Each term in the remainder is built from finitely many of their instances.
  Thus all the resulting judgments have the one finite ambient context $Delta$,
  with any explicitly stated local parameters. The next construction uses these operations to encode the forbidden
  profile configuration.

== 7 Typed data channels <chan-section>

We retain the labelled proof and data fragment, its fixed ambient context, the proof-formula constructors,
  and the data-path wrappers constructed above. In particular,
  a formula is a stable data type sorted at the logic vertex $b$; its proofs have mode $sans(p)$.
  All data introduced in this section have mode $sans(d)$. Saying that a type is #emph[sorted at a vertex] means
  that it is typed at every sort belonging to that vertex. This asserts the indicated typings,
  and does not assert that the vertex is its exact profile.

The aim is to construct a common type of probes that works with different choices of a data type and a data
  parameter. We first build observations and predicates for one type,
  then query objects and a bundle that retains the chosen parameter.
  These give a probe type independent of those choices and a second observation channel on that type.
  The permitted logical quantifier domains are recorded at the end of the section.

For reference, an even data path $rho$ from a vertex at which $T$ is sorted has the operations

$ "pack"_rho \( t \) : W_rho \( T \) \, wide "use"_rho \( w \; x . Phi \) \, $

where $t : T$, $w : W_rho \( T \)$, and $Phi$ is a formula under $x : T$. An odd data path has the operations

$ "mk"_rho \( x . Phi \) : W_rho \( T \) \, wide chevron.l w \, t chevron.r_rho . $

The last expressions in both displays are formulas. We use the proof builders of Lemma 38 in the following form:

#[#set math.equation(numbering: n => "(33)")
 $ "use"_rho \( "pack"_rho \( t \) \; x . Phi \) & arrow.l.r Phi \[ x := t \] &  & \( rho upright(" even") \) \,\
chevron.l "mk"_rho \( x . Phi \) \, t chevron.r_rho & arrow.l.r Phi \[ x := t \] &  & \( rho upright(" odd") \) .
  $ <chan-cancellation>]

These are logical biconditionals with typed proof terms, rather than equations permitting replacement inside data.
  Subscripts may name a particular resulting type instead of its fixed path.
  Even when paths are reused, their source type and their role are fixed by that subscript.

=== 7.1 The required paths and the first channel <the-required-paths-and-the-first-channel>

Assume the configuration to be excluded: $C$ is a plain active strongly connected component of the secondary
  graph, it has an internal negative edge, and

#[#set math.equation(numbering: n => "(34)")
 $ \( I \, J \, k \) upright(" is a profile triple") \, wide J \, k \, d = { s } in C \,\
"Ax" \( s \) eq.not diameter \, wide "Ax" \( s \) arrow.r
  I upright(" by a primary positive path") . $ <chan-configuration>]

The logic component $S$ has its odd closed walk and all-$S$ triple, as in the preceding construction.
  We do not assume that $C$ itself has an odd closed walk.

#thm([Lemma 39.])[
  (Choice of paths).  #emph[There is a retained negative edge associated to a triple $\( p \, n \, g \)$,
    with $p \, g in C$, and there are fixed secondary paths
$ alpha : k arrow.r p quad upright("odd") \, wide beta : p arrow.r k quad upright("odd") \, wide kappa : g arrow.r
  J quad upright("even") \, $

 all inside $C$. There are also fixed secondary paths
$ lambda : k arrow.r j quad upright("odd") \, wide theta : k arrow.r h quad upright("even") \, $

 where $j$ and $h$ are direct vertices. In particular, $eta = beta theta : p arrow.r h$ is odd.]
] <chan-paths>

#proof[
  If $C$ has an odd closed walk, between any two of its vertices there are paths of both parities:
    choose paths to and from the base of that walk, and insert the walk once to change parity.
    Choose any internal retained negative $\( p \, n \, g \)$ and then choose the three required parities for
    $alpha$, $beta$, and $kappa$.
  Suppose instead that every closed walk in $C$ is even. Color its vertices by the parity of a path from a fixed
    vertex. The color is well defined: appending a fixed return path to two such paths shows that their parities
    are equal. A positive edge preserves color and a negative edge changes it.
    The positive edge $J arrow.r k$ of the triple in (34) is retained, since $J \, k in C subset.eq H$;
    hence $J$ and $k$ have the same color. There is a negative edge entering this color.
    Indeed, take any internal negative. If it enters the other color, follow a directed return path to its source;
    that path must contain a negative edge entering the color of $k$.
    Choose such an edge $p arrow.r g$, with its retained triple $\( p \, n \, g \)$.
    Thus $g$ has the color of $J \, k$, and $p$ has the opposite color.
    Connectivity now gives $kappa$ even and $alpha \, beta$ odd.
  Finally, $k$ is plain. By the definition of plainness it has an odd path to a direct vertex $j$ and an even path
    to a direct vertex $h$. They need not have the same endpoint and need not stay inside $C$.
    Choose them as $lambda$ and $theta$. Concatenating $beta$ with $theta$ gives the claimed odd path $eta$. ◻
]

Fix also a path $delta : d arrow.r k$ inside $C$, with no parity condition. We use $delta$ only to form a type.
  Work for the moment under the data declaration $A : s$. This is a valid declaration because $"Ax" \( s \)$ is
  nonempty. Define

#[#set math.equation(numbering: n => "(35)")
 $ B \( A \) & = W_delta \( A \) \, & L_c \( A \) & = W_alpha \( B \( A \) \) \,\
L \( A \) & = W_lambda \( B \( A \) \) \, & sans(P)_L \( A \) & = W_eta \( L_c \( A \) \) . $ <chan-basic-types>]

When $A$ is fixed, omit it from the notation. The sort ledger is

$ upright("data type") & upright("sorted at") & upright("support")\
A & d = { s } & A : s\
B \( A \) & k & delta : d arrow.r k\
L_c \( A \) & p & alpha : k arrow.r p upright(" odd")\
L \( A \) & j & lambda : k arrow.r j upright(" odd")\
sans(P)_L \( A \) & h & eta : p arrow.r h upright(" odd") $

Each line follows from the corresponding data-path formation lemma.
  For instance, $"mk"_L \( t . Phi \)$ binds $t : B \( A \)$, whereas $"mk"_(sans(P)_L) \( c . Phi \)$ binds $c :
  L_c \( A \)$. These different sources will be important below.

#prodef([Definition 7.1.])[
  (Logical and raw channel values).  For $y : L$, $c : L_c$, and $P : sans(P)_L$, put
  $ "Raw" \( y \) & = "mk"_(L_c) \( t . chevron.l y \, t chevron.r_L \) : L_c \,\
"Log" \( c \) & = "mk"_L \( t . chevron.l c \, t chevron.r_(L_c) \) : L \,\
"Round" \( y \) & = "Log" \( "Raw" \( y \) \) : L \,\
P @ y & = chevron.l P \, "Raw" \( y \) chevron.r_(sans(P)_L) . $
  For a formula $Phi$ under $x : L$, define
  $ "pred" \( x . Phi \) = "mk"_(sans(P)_L) \( c . Phi \[ x := "Log" \( c \) \] \) : sans(P)_L . $
  Here $t : B \( A \)$ and $c : L_c \( A \)$ in their respective callbacks.
] <chan-raw-log>

#thm([Lemma 40.])[
  (Rounding and predicate evaluation).  #emph[There are proof builders, for $y : L$ and $t : B \( A \)$, of
#[#set math.equation(numbering: n => "(36)")
 $ chevron.l "Round" \( y \) \, t chevron.r_L arrow.l.r chevron.l y \, t chevron.r_L . $ <chan-primitive-round>]

 For every formula $Phi$ under $x : L$ and every $w : L$, there is a proof of
#[#set math.equation(numbering: n => "(37)")
 $ "pred" \( x . Phi \) @ w arrow.l.r Phi \[ x := "Round" \( w \) \] . $ <chan-predicate-evaluation>]

]
] <chan-rounding>

#proof[
  For (36), cancellation for $"Log"$ gives the comparison with $chevron.l "Raw" \( y \) \, t chevron.r_(L_c)$,
    and cancellation for $"Raw"$ compares this with $chevron.l y \, t chevron.r_L$.
    Apply $sans(p l)$ to these two biconditionals. For (37), expand $@$ and cancel $"mk"_(sans(P)_L)$ at the exact
    argument $c = "Raw" \( w \)$. Its callback becomes $Phi \[ x := "Log" \( "Raw" \( w \) \) \]$,
    which is the displayed formula by definition. ◻
]

=== 7.2 Bits stored by pairs of odd wrappers <bits-stored-by-pairs-of-odd-wrappers>

Two odd wrappers store one bit while retaining formula observations of the original input.
  Iterating this construction will distinguish the finite query markers.

#prodef([Definition 7.2.])[
  (A double wrapper).  Let $T_1 = W_rho \( T \)$ and $T_2 = W_sigma \( T_1 \)$ for two odd data paths.
    Use subscripts $1$ and $2$ for their respective constructors and evaluations. For $t : T$ define two data embeddings
  $ "emb"_1 \( t \) = "mk"_2 \( f . chevron.l f \, t chevron.r_1 \) \, wide "emb"_0 \( t \) =
    "mk"_2 \( f . not chevron.l f \, t chevron.r_1 \) \, wide f : T_1 . $
  Both have type $T_2$. Set
  $ "if" \( G \; H \, H' \) = \( G and H \) or \( not G and H' \) \, $
  and, for $v : T_2$ and a formula $Phi$ under $u : T$, set
  $ "bit" \( v \) & = chevron.l v \, "mk"_1 \( u . top \) chevron.r_2 \,\
"rec" \( v \; u . Phi \) & = "if" #scale(x: 120%, y: 120%)[\(] "bit" \( v \) \; chevron.l v \,
  "mk"_1 \( u . Phi \) chevron.r_2 \, not chevron.l v \, "mk"_1 \( u . Phi \) chevron.r_2
  #scale(x: 120%, y: 120%)[\)] . $
] <chan-double>

#thm([Lemma 41.])[
  (Canonical bit and recovery proofs).  #emph[For $epsilon.alt in { 0 \, 1 }$ there are proofs of the signed bit
$
  cases(delim: "{", "bit" \( "emb"_1 \( t \) \) \, & epsilon.alt = 1 \,, not "bit" \( "emb"_0 \( t \) \) \, &
  epsilon.alt = 0 \,) $

 and a proof of
$ "rec" \( "emb"_epsilon.alt \( t \) \; u . Phi \) arrow.l.r Phi \[ u := t \] . $

]
] <chan-double-laws>

#proof[
  Cancel the second wrapper, then the first. Evaluation of $"emb"_1 \( t \)$ against $"mk"_1 \( u . Phi \)$ is
    biconditional to $Phi \[ u := t \]$; evaluation of $"emb"_0 \( t \)$ against the same value is biconditional
    to $not Phi \[ u := t \]$. Each comparison follows by $sans(p l)$ from the two cancellation proofs.
    With $Phi = top$, the proof of $top$ and these comparisons give the signed bits.
    If $epsilon.alt = 1$, the definition of $"rec"$ then selects the positive comparison.
    If $epsilon.alt = 0$, it selects the negation of the negative comparison.
    The propositional double-negation equivalence is available from $sans(p l)$ by Lemma 37,
    since the logical constructors and classical proof builders have already been derived in the labelled
    fragment. Thus $sans(p l)$ gives the recovery biconditional in both cases. ◻
]

To record the iteration explicitly, begin with $T_0 = L_c$ and define, for $1 lt.eq r lt.eq 4$,

$ T_(2 r - 1) = W_beta \( T_(2 r - 2) \) \, wide T_(2 r) = W_alpha \( T_(2 r - 1) \) \, wide "Big" = T_8 . $

The even-indexed types are sorted at $p$ and the odd-indexed types at $k$.
  Let $"emb"^(\( r \))$, $"bit"_r$, and $"rec"_r$ refer to the $r$th pair.
  For a string $epsilon.alt = \( epsilon.alt_1 \, dots.h \, epsilon.alt_r \)$ put

$ E_0 \( c \) = c \, wide E_r \( c \; epsilon.alt \) =
  "emb"_(epsilon.alt_r)^(\( r \)) \( E_(r - 1) \( c \; epsilon.alt_1 \, dots.h \, epsilon.alt_(r - 1) \) \) . $

The bit observations at level $r$ are the formulas

$ H_(r \, r) \( v \) & = "bit"_r \( v \) \,\
H_(r \, a) \( v \) & = "rec"_r \( v \; u . H_(r - 1 \, a) \( u \) \) &  & \( 1 lt.eq a < r \) . $

Similarly, for a formula $Phi$ under $c : L_c$, define iterated recovery by

$ R_0 \( v \; c . Phi \) = Phi \[ c := v \] \, wide R_r \( v \; c . Phi \) =
  "rec"_r \( v \; u . R_(r - 1) \( u \; c . Phi \) \) . $

Induction using Lemma 41 and $sans(p l)$ gives the appropriate signed proof of every
  $H_(r \, a) \( E_r \( c \; epsilon.alt \) \)$ and gives

#[#set math.equation(numbering: n => "(38)")
 $ R_r \( E_r \( c \; epsilon.alt \) \; u . Phi \) arrow.l.r Phi \[ u := c \] . $ <chan-iterated-recovery>]

The induction uses logical comparisons of the displayed formulas;
  it does not replace an inner encoded datum by a logically equivalent datum.

=== 7.3 Marked queries and point values <marked-queries-and-point-values>

Let

$ cal(T) = { G \, C_0 \, C_ell \, C_r \, E_ell \, E_r \, R \, "pt" } \, wide cal(T)_(upright("str")) =
  cal(T) \\ { "pt" } . $

Thus there are eight marker indices and seven structural indices.
  Assign distinct four-bit strings to the data tag and these markers; for example, in the displayed order, take

$ upright("tag") & upright("data") & G & C_0 & C_ell & C_r & E_ell & E_r & R & "pt"\
upright("string") & 0000 & 0001 & 0010 & 0011 & 0100 & 0101 & 0110 & 0111 & 1000 . $

Write $epsilon.alt \( q \)$ for the string of a tag $q$, and put $E_q \( c \) =
  E_4 \( c \; epsilon.alt \( q \) \) : "Big"$. For a string $epsilon.alt in { 0 \, 1 }^4$,
  let $"bits"_epsilon.alt \( v \)$ be the fixed-bracketing conjunction whose $a$th conjunct is
  $H_(4 \, a) \( v \)$ if $epsilon.alt_a = 1$ and $not H_(4 \, a) \( v \)$ if $epsilon.alt_a = 0$.
  Abbreviate this formula by $"bits"_q \( v \)$ for the string of a tag $q$.
  The canonical signed-bit proofs give $"bits"_q \( E_q \( c \) \)$ and $not
  "bits"_(q') \( E_q \( c \) \)$ whenever $q' eq.not q$: in the latter case use a position where the two strings
  differ and apply $sans(p l)$.

Define

$ "BP" = W_beta \( "Big" \) \, wide M \( A \) = W_alpha \( "BP" \) . $

For $P : sans(P)_L$ and $t in cal(T)$, put

#[#set math.equation(numbering: n => "(39)")
 $ "Enc"_t \( P \) =
   "mk"_("BP")
   (v . #scale(x: 120%, y: 120%)[\(] "bits"_(upright("data")) \( v \) and R_4 \( v \; c . chevron.l P \, c
   chevron.r_(sans(P)_L) \) #scale(x: 120%, y: 120%)[\)] or "bits"_t \( v \)) . $ <chan-enc>]

Here $v : "Big"$ and $c : L_c$, so $"Enc"_t \( P \) : "BP"$. Choose the fixed value

$ c_top = "mk"_(L_c) \( u . top \) : L_c \, wide u : B \( A \) \, $

and define, for $b p : "BP"$,

$ "Mark"_t \( b p \) & = chevron.l b p \, E_t \( c_top \) chevron.r_("BP") \,\
"Dec" \( b p \) & = "mk"_(sans(P)_L) \( c . chevron.l b p \, E_(upright("data")) \( c \) chevron.r_("BP") \) :
  sans(P)_L \,\
"qry"_t \( o \, P \) & = chevron.l o \, "Enc"_t \( P \) chevron.r_M \, wide o : M \( A \) . $

The sort and value ledger for these constructions is

$ upright("data type") & upright("sorted at") & upright("values just constructed")\
T_(2 r) & p & E_r \( c \; epsilon.alt \) quad \( 0 lt.eq r lt.eq 4 \)\
T_(2 r - 1) & k & "mk" upright(" values in pair ") r quad \( 1 lt.eq r lt.eq 4 \)\
"Big" = T_8 & p & E_q \( c \)\
"BP" & k & "Enc"_t \( P \)\
sans(P)_L & h & "Dec" \( b p \)\
M \( A \) & p & "mk"_M \( b p . Phi \) $

All observations, marks, queries, and recovery expressions are formulas sorted at $b$;
  none is a data value of type $"Big"$ or $"BP"$.

#thm([Lemma 42.])[
  (Marker and decoder laws).  #emph[For $P : sans(P)_L$ and $t \, u in cal(T)$ there are proofs of
$ "Mark"_t \( "Enc"_t \( P \) \) \, wide not "Mark"_u \( "Enc"_t \( P \) \) quad \( u eq.not t \) . $

 For every $c : L_c$ there is a proof of
$ chevron.l "Dec" \( "Enc"_t \( P \) \) \, c chevron.r_(sans(P)_L) arrow.l.r chevron.l P \, c chevron.r_(sans(P)_L) \, $

 and consequently, for every $y : L$, a proof of
#[#set math.equation(numbering: n => "(40)")
 $ "Dec" \( "Enc"_t \( P \) \) @ y arrow.l.r P @ y . $ <chan-decode>]

]
] <chan-marker-laws>

#proof[
  For a marker, cancel (39) at $E_u \( c_top \)$. The data-string test is false by the signed-bit proofs.
    The remaining marker-string test holds exactly when $u = t$, again by those proofs.
    Apply $sans(p l)$ to obtain the asserted signed mark.
  For the decoder, first cancel its $sans(P)_L$ constructor at the exact input $c$,
    then cancel (39) at $E_(upright("data")) \( c \)$. Here the data-string test holds,
    the marker-string test fails, and (38) compares the remaining recovery formula with $chevron.l P \,
    c chevron.r_(sans(P)_L)$. Combine these proofs with $sans(p l)$.
    To obtain (40), use this result at $c = "Raw" \( y \)$ and expand the definition of $@$.
    Thus this calculation inserts neither $"Round" \( y \)$ nor an additional rounding of its raw value. ◻
]

Define the data values and the formula

#[#set math.equation(numbering: n => "(41)")
 $ b p_tack.t & = "mk"_("BP") \( v . tack.t \) : "BP" \,\
"dummy" & = "mk"_M \( b p . top \) : M \( A \) \,\
D \( o \) & = chevron.l o \, b p_tack.t chevron.r_M \,\
"point" \( y \) & = "mk"_M \( b p . "Mark"_("pt") \( b p \) and \( "Dec" \( b p \) @ y \) \) :
  M \( A \) . $ <chan-point>]

#thm([Lemma 43.])[
  (Dummy and point laws).  #emph[There are proofs of
$ D \( "dummy" \) \, wide not "Mark"_t \( b p_tack.t \) quad \( t in cal(T) \) \, wide not D \( "point" \( y \) \) \, $

 and there is a proof, for $P : sans(P)_L$, of
#[#set math.equation(numbering: n => "(42)")
 $ "qry"_("pt") \( "point" \( y \) \, P \) arrow.l.r P @ y . $ <chan-point-query>]

]
] <chan-point-laws>

#proof[
  Cancellation compares $D \( "dummy" \)$ with $top$, which has its derived proof.
    It compares every marker of $b p_tack.t$ with $tack.t$, giving the asserted negations by $sans(p l)$.
    Cancellation at $b p_tack.t$ compares $D \( "point" \( y \) \)$ with a conjunction having
    $"Mark"_("pt") \( b p_tack.t \)$ as its first conjunct, and hence gives its negation.
    Finally, cancellation compares the left side of (42) with
  $ "Mark"_("pt") \( "Enc"_("pt") \( P \) \) and #scale(x: 120%, y: 120%)[\(] "Dec" \( "Enc"_("pt") \( P \) \) @ y
    #scale(x: 120%, y: 120%)[\)] . $
  The marker proof and (40) prove the required biconditional by $sans(p l)$. ◻
]

=== 7.4 A bundle carrying an exact parameter <a-bundle-carrying-an-exact-parameter>

Define two more odd wrappers

#[#set math.equation(numbering: n => "(43)")
 $ F \( A \) = W_beta \( M \( A \) \) \, wide "Single" \( A \) = W_alpha \( F \( A \) \) . $ <chan-single>]

Thus $F \( A \)$ is sorted at $k$ and $"Single" \( A \)$ is sorted at $p$.
  We use $chevron.l f \, o chevron.r_F$ for $f : F \( A \)$ and $o : M \( A \)$, and $chevron.l w \,
  f chevron.r_("Single")$ for $w : "Single" \( A \)$ and $f : F \( A \)$.

#prodef([Definition 7.3.])[
  (Bundle and access).  For $m : M \( A \)$ and $y : L \( A \)$, put
  $ "Bundle" \( m \, y \) =
    "mk"_("Single")
    (f . "if" #scale(x: 120%, y: 120%)[\(] chevron.l f \, "dummy" chevron.r_F \; chevron.l f \, m chevron.r_F \,
    chevron.l f \, "point" \( y \) chevron.r_F #scale(x: 120%, y: 120%)[\)]) : "Single" \( A \) . $
  Let $Psi \( o \, x \)$ be a formula under $o : M \( A \) \, x : L \( A \)$, independent of the new variable $w :
    "Single" \( A \)$. Its other free data parameters are allowed and remain fixed. Define
  #[#set math.equation(numbering: n => "(44)")
   $ f_i \( o \) & =
     "mk"_F
     (o' . "if" #scale(x: 120%, y: 120%)[\(] D \( o' \) \; tack.t \, "qry"_("pt") \( o' \, "pred" \( x . Psi \(
     o \, x \) \) \) #scale(x: 120%, y: 120%)[\)]) \,\
f_e \( w \) & =
  "mk"_F
  (o . "if" #scale(x: 120%, y: 120%)[\(] D \( o \) \; top \, chevron.l w \, f_i \( o \) chevron.r_("Single")
  #scale(x: 120%, y: 120%)[\)]) \,\
"Access" \( w \; o \, x . Psi \) & = chevron.l w \, f_e \( w \) chevron.r_("Single") . $ <chan-access-definition>]
  Here $o \, o' : M \( A \)$, both $f_i \( o \)$ and $f_e \( w \)$ have type $F \( A \)$,
    and $"Access"$ is a formula. The dependence of $f_i$ and $f_e$ on $Psi$ is suppressed only in their names.
] <chan-bundle-definition>

#thm([Lemma 44.])[
  (Access).  #emph[Under $A : s$, $m : M \( A \)$, $y : L \( A \)$ and the proof input $d_m : not D \( m \)$,
    there is a proof of
#[#set math.equation(numbering: n => "(45)")
 $ "Access" \( "Bundle" \( m \, y \) \; o \, x . Psi \) arrow.l.r Psi \( m \, "Round" \( y \) \) . $ <chan-access-law>]

 The definitions of $"Bundle"$ and $"Access"$ themselves do not use $d_m$.]
] <chan-access>

#proof[
  Throughout this proof $w$ abbreviates the exact data expression $"Bundle" \( m \, y \)$;
    it is not a fresh datum with an assumed property. For any $f : F \( A \)$,
    cancellation of the bundle gives a proof of
  #[#set math.equation(numbering: n => "(46)")
   $ chevron.l w \, f chevron.r_("Single") arrow.l.r "if" #scale(x: 120%, y: 120%)[\(] chevron.l f \,
     "dummy" chevron.r_F \; chevron.l f \, m chevron.r_F \, chevron.l f \,
     "point" \( y \) chevron.r_F #scale(x: 120%, y: 120%)[\)] . $ <chan-bundle-evaluation>]
  First apply cancellation to $f_e \( w \)$ at $"dummy" : M \( A \)$. It gives
  $ chevron.l f_e \( w \) \, "dummy" chevron.r_F arrow.l.r "if" #scale(x: 120%, y: 120%)[\(] D \( "dummy" \) \;
    top \, chevron.l w \, f_i \( "dummy" \) chevron.r_("Single") #scale(x: 120%, y: 120%)[\)] . $
  Together with $D \( "dummy" \)$ from Lemma 43 and the proof of $top$, this gives, by $sans(p l)$,
    a proof of $chevron.l f_e \( w \) \, "dummy" chevron.r_F$. Cancellation at the exact input $m$ gives
  $ chevron.l f_e \( w \) \, m chevron.r_F arrow.l.r "if" #scale(x: 120%, y: 120%)[\(] D \( m \) \; top \,
    chevron.l w \, f_i \( m \) chevron.r_("Single") #scale(x: 120%, y: 120%)[\)] . $
  Use $d_m$ and $sans(p l)$ to obtain
  $ chevron.l f_e \( w \) \, m chevron.r_F arrow.l.r chevron.l w \, f_i \( m \) chevron.r_("Single") . $
  Now use (46) with $f = f_e \( w \)$. Its condition has the positive proof just constructed,
    so $sans(p l)$ selects its first branch and gives
  #[#set math.equation(numbering: n => "(47)")
   $ "Access" \( w \; o \, x . Psi \) arrow.l.r chevron.l w \,
     f_i \( m \) chevron.r_("Single") . $ <chan-access-first-selection>]
  This is where the first occurrence of the callback parameter is fixed:
    it is the original $m$ by the exact substitution in cancellation.
  For the second selection, cancellation of $f_i \( m \)$ at $"dummy"$ gives
  $ chevron.l f_i \( m \) \, "dummy" chevron.r_F arrow.l.r "if" #scale(x: 120%, y: 120%)[\(] D \( "dummy" \) \;
    tack.t \, "qry"_("pt") \( "dummy" \, "pred" \( x . Psi \( m \, x \) \) \) #scale(x: 120%, y: 120%)[\)] . $
  The proof of $D \( "dummy" \)$ therefore gives a proof of $not chevron.l f_i \( m \) \,
    "dummy" chevron.r_F$ by $sans(p l)$. Cancellation of $f_i \( m \)$ at $"point" \( y \)$,
    followed by $not D \( "point" \( y \) \)$, gives
  $ chevron.l f_i \( m \) \, "point" \( y \) chevron.r_F arrow.l.r
    "qry"_("pt") \( "point" \( y \) \, "pred" \( x . Psi \( m \, x \) \) \) . $
  The point-query proof (42), at the exact predicate $"pred" \( x . Psi \( m \, x \) \)$,
    compares this right side with $"pred" \( x . Psi \( m \, x \) \) @ y$.
    In turn, (37) compares that formula with $Psi \( m \, "Round" \( y \) \)$. Combining these proofs gives
  $ chevron.l f_i \( m \) \, "point" \( y \) chevron.r_F arrow.l.r Psi \( m \, "Round" \( y \) \) . $
  Use (46) once more, now with $f = f_i \( m \)$. Its condition has the negative proof above,
    so $sans(p l)$ selects its second branch and yields
  $ chevron.l w \, f_i \( m \) chevron.r_("Single") arrow.l.r Psi \( m \, "Round" \( y \) \) . $
  Finally combine this with (47) by $sans(p l)$. Only predicate evaluation rounded an argument,
    and that argument was $y$. Every occurrence of $m$ in this derivation comes from exact data substitution,
    without a logical replacement of data. ◻
]

=== 7.5 The common type of probes <the-common-type-of-probes>

Recall the retained triple $\( p \, n \, g \)$ selected in Lemma 39.
  Its tail type $U_n$ is the previously fixed positive data wrapper of a literal sort.
  It is sorted at $n$, with the operations $"send"_n$ and $"read"_n$ and the read–send biconditional (32).
  Since $"Single" \( A \)$ is sorted at $p$, form

#[#set math.equation(numbering: n => "(48)")
 $ "Fun" \( A \) = Pi^(sans(d) \, sans(d)) w : "Single" \( A \) . U_n \, wide upright("sorted at ") g . $ <chan-fun>]

This uses precisely the formation rules represented by $\( p \, n \, g \)$.

Let $zeta$ be the fixed primary positive path $"Ax" \( s \) arrow.r I$ of (34), and positively wrap the literal $s$:

#[#set math.equation(numbering: n => "(49)")
 $ Z = W_zeta^(+) \( s \) \, wide A^arrow.t : Z quad \( A : s \) \, wide z^arrow.b : s quad \( z : Z \) \,
   wide \( A^arrow.t \)^arrow.b = zws_beta A . $ <chan-z>]

The initial type $s$ is sorted at all of $"Ax" \( s \)$, so $Z$ is sorted at $I$.
  The superscripts in (49) denote the fixed positive lift and projection, not additional primitive operations.

Now define the data type

#[#set math.equation(numbering: n => "(50)")
 $ V = Pi^(sans(d) \, sans(d)) z : Z . W_kappa \( "Fun" \( z^arrow.b \) \) . $ <chan-v>]

Under $z : Z$ the projection $z^arrow.b : s$ can be substituted for the data parameter $A$ in every preceding
  channel type. The resulting $"Fun" \( z^arrow.b \)$ is sorted at $g$, and its wrapper along $kappa : g arrow.r
  J$ is sorted at $J$. The triple $\( I \, J \, k \)$ therefore sorts $V$ at $k$.
  This construction binds the former parameter $A$ through $z^arrow.b$: $V$ has no free $A$ or $m$.

For $v : V$, $A : s$, $m : M \( A \)$ and $y : L \( A \)$, define the formula

#[#set math.equation(numbering: n => "(51)")
 $ v diamond.stroked.small_(A \, m) y =
   "use"_kappa (v thin A^arrow.t \; f . "read"_n \( f thin "Bundle" \( m \, y \) \)) . $ <chan-diamond>]

The applications displayed here have label $\( sans(d) \, sans(d) \)$. For clarity, their typing chain is

$ v thin A^arrow.t & : W_kappa \( "Fun" \( \( A^arrow.t \)^arrow.b \) \) =_beta W_kappa \( "Fun" \( A \) \) \,\
f & : "Fun" \( A \) \, wide "Bundle" \( m \, y \) : "Single" \( A \) \,\
f thin "Bundle" \( m \, y \) & : U_n . $

The conversion in the first line is allowed because all paths, tails,
  and role-dependent syntax choices were fixed before substitution.
  Since $kappa$ is even, its $"use"$ operation accepts exactly the formula callback in (51).
  Thus $diamond.stroked.small$ is well typed without a proof assumption about $m$.

The final data-sort ledger is

$ upright("data type") & upright("sorted at") & upright("formation support")\
M \( A \) & p & W_alpha \( "BP" \( A \) \)\
F \( A \) & k & W_beta \( M \( A \) \)\
"Single" \( A \) & p & W_alpha \( F \( A \) \)\
U_n & n & upright("the retained negative’s fixed tail")\
"Fun" \( A \) & g & \( p \, n \, g \)\
Z & I & zeta : "Ax" \( s \) arrow.r I upright(" positive")\
W_kappa \( "Fun" \( z^arrow.b \) \) & J & kappa : g arrow.r J upright(" even")\
V & k & \( I \, J \, k \) $

In particular, neither the use of $M \( A \)$ as an open parameter nor that of $V$ as an input type requires $p$
  or $k$ to be direct.

=== 7.6 The second channel and permitted quantifiers <the-second-channel-and-permitted-quantifiers>

Apply the first-channel construction to $V$ itself, which is sorted at $k$, using the same three fixed odd paths:

#[#set math.equation(numbering: n => "(52)")
 $ X_c = W_alpha \( V \) \, wide X = W_lambda \( V \) \, wide sans(P)_X = W_eta \( X_c \) . $ <chan-x-types>]

These types are sorted at $p \, j \, h$, respectively. For $x : X$ and $c : X_c$ define

$ "Raw"_X \( x \) & = "mk"_(X_c) \( v . chevron.l x \, v chevron.r_X \) \,\
"Log"_X \( c \) & = "mk"_X \( v . chevron.l c \, v chevron.r_(X_c) \) \,\
"Round"_X \( x \) & = "Log"_X \( "Raw"_X \( x \) \) \,\
i @ x & = chevron.l i \, "Raw"_X \( x \) chevron.r_(sans(P)_X) wide \( i : sans(P)_X \) \,\
"pred"_X \( x . Phi \) & = "mk"_(sans(P)_X) \( c . Phi \[ x := "Log"_X \( c \) \] \) . $

The callbacks defining $"Raw"_X$ and $"Log"_X$ bind $v : V$. Write

$ \[ x v \] = chevron.l x \, v chevron.r_X wide \( x : X \, med v : V \) . $

The proofs of Lemma 40, with these types substituted, give

#[#set math.equation(numbering: n => "(53)")
 $ \[ "Round"_X \( x \) v \] & arrow.l.r \[ x v \] \,\
"pred"_X \( x . Phi \) @ w & arrow.l.r Phi \[ x := "Round"_X \( w \) \] . $ <chan-x-evaluation>]

All logical quantifiers in the subsequent relational construction have one of the following fixed domain annotations:

$ upright("domain") & upright("chosen sorting vertex") & upright("quantifier constructor")\
L \( A \) & j & upright("the fixed direct-domain constructor at ") j\
X & j & upright("the fixed direct-domain constructor at ") j\
sans(P)_L \( A \) & h & upright("the fixed direct-domain constructor at ") h\
sans(P)_X & h & upright("the fixed direct-domain constructor at ") h . $

Here $j$ and $h$ are direct by Lemma 39, so each constructor has its required profile triple and fixed proof
  paths. Existentials use the same domain annotation through their derived definition.
  Other generic data, including $A : s$, $m : M \( A \)$, and $v : V$,
  occur as open parameters or as raw data binders whose supporting products have been displayed above.
  Schematic assertions about these parameters denote proof builders in valid contexts,
  not further logical quantifiers. Every data definition in this section is independent of proof variables;
  the proof input $d_m$ is used only in the proof of Lemma 44.

== 8 Relational coding of the diagonal argument <rel-section>

We continue with the fixed labelled wrappers, their data cancellation law (Lemma 38),
  and their predicate evaluation laws (37) and (53). In particular,
  for either of the predicate spaces under consideration,

$ "pred" \( y . Phi \) @ w med arrow.l.r med Phi \[ "Round" w \/ y \] . $

Until a specialization is explicitly made, $A : s$ and $m : M \( A \)$ are open data parameters.
  Write $L = L \( A \)$. The variables $y \, z \, w \, a$ range over $L$, $P \, P'$ over $sans(P)_L$, $x \,
  x'$ over $X$, and $i \, i'$ over $sans(P)_X$. The spaces $V \, X \, sans(P)_X$ are independent of $A \, m$.
  All displayed quantifiers use the fixed direct-vertex annotations:
  $j$ for $L \, X$ and $h$ for $sans(P)_L \, sans(P)_X$. The other parameters are parameters of term builders,
  not additional logical quantifiers.

The operations $sans(p l)$, $sans(A l l)$, $sans(E x)$, $sans(G d)$, $"to"$,
  and $"back"$ have the typed expansions already constructed.
  For clarity, when a proof below says that specified proofs yield a formula by $sans(p l)$,
  that formula is its target. Quantifiers are treated as propositional atoms until explicitly introduced or
  instantiated. An existential is eliminated only into the displayed target,
  which is independent of its locally opened witnesses.

Our goal is a proof of the terminal formula $F_b$ in the ambient labelled context.
  First we construct relations and probes for open parameters $A \, m$.
  Next we choose $A_0 \, m_0$ and prove admissibility. At that specialization,
  three tagged copies turn the query formulas into class and pairing laws.
  Section 9 then uses these laws to construct the terminal proof.

=== 8.1 Generic relations and probes <generic-relations-and-probes>

#prodef([Definition 8.1.])[
  (Admissible queries and observational equivalence).  Define
  $ P approx P' & = forall y . thin \( P @ y arrow.l.r P' @ y \) \,\
i approx i' & = forall x . thin \( i @ x arrow.l.r i' @ x \) \,\
"Adm" & = not D \( m \) and and.big_(t med upright("structural")) forall P \,
  P' . thin #scale(x: 120%, y: 120%)[\(] P approx
  P' arrow.r.double \( "qry"_t \( m \, P \) arrow.l.r "qry"_t \( m \, P' \) \) #scale(x: 120%, y: 120%)[\)] \,\
"Good" \( P \) & = #scale(x: 120%, y: 120%)[\(] forall y . thin \( P @ y arrow.l.r P @ "Round" y \)
  #scale(x: 120%, y: 120%)[\)] and "qry"_G \( m \, P \) \,\
y tilde.op z & = forall P . thin #scale(x: 120%, y: 120%)[\(] "Good" \( P \)
  arrow.r.double \( P @ y arrow.l.r P @ z \) #scale(x: 120%, y: 120%)[\)] . $
  The finite Boolean operations have fixed bracketing. From $a d : "Adm"$ obtain $d_m :
    not D \( m \)$ by projection. For each structural $t$, projection followed by two instantiations and
    application defines
  $ "qr"_t \( e \) : "qry"_t \( m \, P \) arrow.l.r "qry"_t \( m \, P' \) wide \( e : P approx P' \) . $
] <rel-admissible>

#thm([Lemma 45.])[
  (Equivalence and rounding).  #emph[The relation $tilde.op$ has reflexivity, symmetry, and transitivity builders.
    There is a builder $"RoundRel" \( y \) : y tilde.op "Round" y$.
    For $e : a tilde.op a'$ and $f : c tilde.op c'$ there is a builder
$ "cong" \( e \, f \) : \( a tilde.op c \) arrow.l.r \( a' tilde.op c' \) . $

 These builders require no admissibility assumption.]
] <rel-equivalence>

#proof[
  Reflexivity is $Lambda P . lambda^(*) h . sans(p l)_(P @ y arrow.l.r P @ y) \( \)$.
    For symmetry, under $e : y tilde.op z$, introduce $P \, h$, instantiate $e \[ P \] dot.op h$,
    and apply $sans(p l)$ to reverse its biconditional. For transitivity, under $e : y tilde.op z$ and $f :
    z tilde.op w$, introduce $P \, h$ and apply $sans(p l)_(P @ y arrow.l.r P @ w)$ to $e \[ P \] dot.op h \,
    f \[ P \] dot.op h$. For rounding introduce $P \, h$, project $forall
    w . \( P @ w arrow.l.r P @ "Round" w \)$ from $h : "Good" \( P \)$, and instantiate it at $y$.
    Write these builders as $"refl"$, $"sym"$, and $"trans"$. The two components of the last biconditional are
  $ & lambda^(*) u . "trans" \( "sym" \( e \) \, "trans" \( u \, f \) \) \,\
 & lambda^(*) u . "trans" \( e \, "trans" \( u \, "sym" \( f \) \) \) . $
  In the first line $u : a tilde.op c$, and in the second $u : a' tilde.op c'$,
    so the endpoints are respectively $a' tilde.op c'$ and $a tilde.op c$. ◻
]

#prodef([Definition 8.2.])[
  (Class, union, and pairing predicates).  Put
  $ c_y & = "pred" \( w . w tilde.op y \) \,\
u_(y z) & = "pred" \( w . \( w tilde.op y \) or \( w tilde.op z \) \) \,\
"Is"_t \( y \) & = "qry"_(C_t) \( m \, c_y \) &  & \( t = 0 \, ell \, r \) \,\
T_t \( y \, z \) & = "Is"_0 \( y \) and "Is"_t \( z \) and "qry"_(E_t) \( m \, u_(y z) \) &  & \( t = ell \, r \) \,\
"form" \( P \, a \, z \) & = #scale(x: 120%, y: 120%)[\(] exists y . thin \( T_ell \( y \, z \) and P @ y \)
  #scale(x: 120%, y: 120%)[\)] or T_r \( a \, z \) \,\
"Pair" \( P \, a \) & = "pred" \( z . "form" \( P \, a \, z \) \) . $
  These are data definitions, independent of any proof of $"Adm"$.
] <rel-pair-definition>

#thm([Lemma 46.])[
  (Congruence of the relational predicates).  #emph[There are unrounded evaluation proofs
$ c_y @ w arrow.l.r \( w tilde.op y \) \, wide u_(y z) @ w arrow.l.r \( \( w tilde.op y \) or \( w tilde.op z \) \) . $

 Equivalent parameters give $c_y approx c_(y')$ and $u_(y z) approx u_(y' z')$.
   Under $a d : "Adm"$, the predicates $"Is"_t \, T_t$ respect $tilde.op$.
   Moreover, still under $a d$, and under $P approx P'$, $a tilde.op a'$, and $z tilde.op z'$ there are proofs of
$ "form" \( P \, a \, z \) arrow.l.r "form" \( P' \, a' \, z' \) \, $

 and, under the first two of these assumptions, of $"Pair" \( P \, a \) approx "Pair" \( P' \, a' \)$.
   In particular, under $a d$ there is
$ "pv" \( P \, a \, z \) : "Pair" \( P \, a \) @ z arrow.l.r "form" \( P \, a \, z \) . $

]
] <rel-pair-congruence>

#proof[
  Predicate evaluation first gives
  $ c_y @ w arrow.l.r \( "Round" w tilde.op y \) . $
  Apply relation congruence with $"RoundRel" \( w \)$ and $"refl" \( y \)$;
    propositional chaining gives the first displayed evaluation.
    For the union do this separately for $y$ and $z$, then chain their disjunctions.
    For $e : y tilde.op y'$, congruence with $"refl" \( w \) \, e$, together with the two class evaluations,
    gives $c_y @ w arrow.l.r c_(y') @ w$. Introduce $w$ to obtain the class comparison.
    For the union use the two parameter congruences inside the disjunction before introducing $w$.
  Apply $"qr"_(C_t)$ to the class comparison to obtain the $"Is"_t$ comparison.
    For $T_t$, combine the two resulting $"Is"$ comparisons and $"qr"_(E_t)$ applied to the union comparison.
    For $"form"$, fix $y$. The $T_ell$ comparison with its first argument unchanged,
    together with $\( P approx P' \) \[ y \]$, gives
  $ \( T_ell \( y \, z \) and P @ y \) arrow.l.r \( T_ell \( y \, z' \) and P' @ y \) . $
  Apply $sans(E x)_y$, then combine its result with the $T_r \( a \, z \) arrow.l.r
    T_r \( a' \, z' \)$ comparison by $sans(p l)$. Predicate evaluation for $"Pair"$ has right side
    $"form" \( P \, a \, "Round" z \)$. The just-proved form congruence, with $P \,
    a$ unchanged and $"RoundRel" \( z \)$, gives $"pv"$. Finally fix $z$,
    combine both $"pv"$ proofs with form congruence at unchanged $z$, and introduce $z$. ◻
]

#prodef([Definition 8.3.])[
  (Lifts and uniform probes).  Define data, still with open $A \, m$, by
  $ "Part" \( v \) & = "pred" \( y . v diamond.stroked.small_m y \) \,\
"sb" \( v \, m \, a \) & = "qry"_R \( m \, "Pair" \( "Part" \( v \) \, a \) \) \,\
"lift"_m \( a \) & = "mk"_X \( v . "sb" \( v \, m \, a \) \) . $
  For $i : sans(P)_X$, define $z_i : V$ by the following data lambda.
    At $z : Z$, pack along the even path $g arrow.r J$ the data function
  $ lambda^(sans(d) \, sans(d)) w : "Single" \( z^arrow.b \) . "send"_n #scale(x: 120%, y: 120%)[\(]
    "Access" \( w \; o \, y . i @ "lift"_o \( y \) \) #scale(x: 120%, y: 120%)[\)] \, $
  where all channel types and the lift in its body use $A = z^arrow.b$.
    This defines the body of $lambda^(sans(d) \, sans(d)) z : Z . thin dots.h.c$.
    The variable $o$ is the data parameter supplied by $"Access"$. Thus $z_i$ has no free $A \, m$. Put
  $ "le" \( i \, x \) & = \[ x z_i \] \,\
x tilde.eq x' & = forall i . thin \( "le" \( i \, x \) arrow.l.r "le" \( i \, x' \) \) \,\
"Valid" \( x \) & = forall i \, i' . thin #scale(x: 120%, y: 120%)[\(] i approx
  i' arrow.r.double \( "le" \( i \, x \) arrow.l.r "le" \( i' \, x \) \) #scale(x: 120%, y: 120%)[\)] \,\
"Ext" \( i \) & = forall x \, x' . thin #scale(x: 120%, y: 120%)[\(] x tilde.eq x'
  arrow.r.double \( i @ x arrow.l.r i @ x' \) #scale(x: 120%, y: 120%)[\)] \,\
"Resp" \( v \) & = forall y \, z . thin #scale(x: 120%, y: 120%)[\(] y tilde.op z
  arrow.r.double \( v diamond.stroked.small_m y arrow.l.r v diamond.stroked.small_m z \)
  #scale(x: 120%, y: 120%)[\)] . $
] <rel-lifts>

#thm([Lemma 47.])[
  (Evaluation, validity, and response).  #emph[The relation $tilde.eq$ is an equivalence relation,
    with the congruence builder of Lemma 45, and
$ "RoundRel"_X \( x \) : x tilde.eq "Round"_X x . $

 Data cancellation supplies
$ "LP" \( i \, a \) : "le" \( i \, "lift"_m a \) arrow.l.r "sb" \( z_i \, m \, a \) . $

 Under $a d : "Adm"$ there are builders
#[#set math.equation(numbering: n => "(54)")
 $ z_i diamond.stroked.small_m y & arrow.l.r i @ "lift"_m \( "Round" y \) \,\
"LC" \( e \) & : "lift"_m \( a \) tilde.eq "lift"_m \( a' \) wide \( e : a tilde.op a' \) \,\
 & "Valid" \( "lift"_m a \) . $ <rel-probe-rounded>]

 If also $e x : "Ext" \( i \)$, then
#[#set math.equation(numbering: n => "(55)")
 $ z_i diamond.stroked.small_m y arrow.l.r i @ "lift"_m y quad upright("and") quad
   "Resp" \( z_i \) . $ <rel-probe-exact>]

 If $h : "Resp" \( v \)$, then
#[#set math.equation(numbering: n => "(56)")
 $ "Part" \( v \) @ y arrow.l.r v diamond.stroked.small_m y . $ <rel-part-exact>]

]
] <rel-lift-properties>

#proof[
  For $tilde.eq$, introduce $i$ and use propositional reflexivity, symmetry,
    or transitivity of the instantiated biconditionals. Its congruence builder is the pair displayed in Lemma 45,
    with the relation replaced by $tilde.eq$. Primitive $X$-evaluation is preserved by $"Round"_X$.
    Apply this preservation at $z_i$ and introduce $i$ to obtain $"RoundRel"_X$.
    Cancellation of $"mk"_X$ gives $"LP"$ at the exact input $z_i$.
  For (54), the application $z_i A^arrow.t$ beta-reduces to the same pack and data lambda at $A$,
    since $\( A^arrow.t \)^arrow.b =_beta A$ and the wrapper choices are fixed.
    The pack/use cancellation leaves the read of that function applied to $"Bundle" \( m \, y \)$.
    After its raw beta contraction, read/send cancellation leaves
  $ "Access" \( "Bundle" \( m \, y \) \; o \, w . i @ "lift"_o \( w \) \) . $
  The Access builder, applied to $d_m$, compares this with $i @ "lift"_m \( "Round" y \)$.
    Chain these three biconditionals by $sans(p l)$.
  To obtain $"LC" \( e \)$, introduce $i$. Pair congruence applied to the reflexive comparison of
    $"Part" \( z_i \)$ and to $e$, followed by $"qr"_R$, compares $"sb" \( z_i \, m \, a \)$ and
    $"sb" \( z_i \, m \, a' \)$. Combine it with the two $"LP"$ proofs and introduce $i$.
  For validity introduce $i \, i'$ and $e : i approx i'$. There is a comparison $"Part" \( z_i \) approx
    "Part" \( z_(i') \)$: at $y$, predicate evaluation gives the two expressions $z_i diamond.stroked.small_m
    "Round" y$ and $z_(i') diamond.stroked.small_m "Round" y$. Apply (54) at precisely $"Round" y$, and use
  $ e \[ "lift"_m \( "Round" \( "Round" y \) \) \] . $
  These proofs propositionally entail the required evaluation comparison; introduce $y$.
    Apply Pair congruence with $a$ unchanged, then $"qr"_R$, and finally the two $"LP"$ proofs.
    Introducing $i \, i' \, e$ proves (54).
  For (55), apply $e x$ at $"lift"_m y \, "lift"_m \( "Round" y \)$ to $"LC" \( "RoundRel" \( y \) \)$.
    Combine its result with (54). Under $e : y tilde.op z$, apply $e x$ at the two lifts to $"LC" \( e \)$,
    and combine this with the exact probe evaluations at $y \, z$.
    Introducing $y \, z \, e$ proves $"Resp" \( z_i \)$. Finally predicate evaluation gives $"Part" \( v \) @ y
    arrow.l.r v diamond.stroked.small_m "Round" y$. Combine it with $h \[ y \] \[ "Round" y \] dot.op
    "RoundRel" \( y \)$ to obtain (56). ◻
]

=== 8.2 The laws needed for the diagonal argument <rel-target-laws>

The relations and uniform probes are now defined. Before choosing $A$ and $m$,
  we identify the laws their specialization must provide. For $i : sans(P)_X$, define

#[#set math.equation(numbering: n => "(57)")
 $ "Ind" \( i \) = forall x : X . #scale(x: 120%, y: 120%)[\(] "Valid" \( x \)
   arrow.r.double \( "le" \( i \, x \) arrow.r.double i @ x \) #scale(x: 120%, y: 120%)[\)] . $ <rel-ind-definition>]

This formula says that $i$ contains every valid $x$ for which $"le" \( i \, x \)$ holds.
  The name records its role in the well-foundedness diagonal; it does not assume a pre-existing order on $X$.

We shall construct data operations $x mapsto delta x : X$ and $i mapsto S i : sans(P)_X$, and a data term $"WF" :
  X$. Their required properties are

$ & "Valid" \( delta x \) \, wide "Valid" \( "WF" \) \,\
 & "Ext" \( i \) med arrow.r.double med "Ext" \( S i \) med upright(" and ") med \( S i @ x arrow.l.r i @ delta x \) \,\
 & "Ext" \( i \) \, med "Valid" \( x \) med arrow.r.double med
   #scale(x: 120%, y: 120%)[\(] "le" \( i \, delta x \) arrow.l.r "le" \( S i \, x \) #scale(x: 120%, y: 120%)[\)] \,\
 & "Ext" \( i \) med arrow.r.double med #scale(x: 120%, y: 120%)[\(] "le" \( i \, "WF" \) arrow.l.r
   "Ind" \( S i \) #scale(x: 120%, y: 120%)[\)] . $

Here the outer implication signs describe proof builders with the displayed inputs,
  as elsewhere in the construction. We also require $x tilde.eq x'$ to imply $delta x tilde.eq delta x'$.
  The logical binders introduced in the final diagonal proof range only over $X$ or $sans(P)_X$;
  it also uses the previously proved laws at their original domains.

These laws already explain the intended role of $"WF"$. For an extensional $i$,
  a proof of $"Ind" \( i \)$ gives a proof of $"Ind" \( S i \)$:
  apply the proof of $"Ind" \( i \)$ at the valid point $delta x$,
  using the predecessor comparison to turn $"le" \( S i \, x \)$ into $"le" \( i \, delta x \)$.
  The shift evaluation then gives the required conclusion $S i @ x$.
  The last displayed law then gives $"le" \( i \, "WF" \)$, so validity of $"WF"$ gives $i @ "WF"$.
  Section 9 uses this consequence with a specified negative predicate to derive $tack.t$;
  it will prove the construction with every guard in place.

To obtain the predecessor comparison, we will encode three distinguishable copies of $X$ in $L$.
  The class and edge queries will identify the corresponding elements of those copies.
  Observations of the pairing predicate on one copy will be equivalent to the evaluations of the represented
  predicate; observations on another will identify the point of evaluation up to $tilde.eq$.
  The $R$ query can then express $"le"$ at that point. Its validity guard is essential:
  it permits transport between the corresponding $"le"$ formulas for the represented and original predicates.
  The next two subsections build these copies and queries before the guarded diagonal uses them.

=== 8.3 Three tagged copies and one admissible parameter <three-tagged-copies-and-one-admissible-parameter>

The types $V \, X \, sans(P)_X$ and the probes $z_i$ were constructed uniformly, before any choice of $A \, m$.
  We now use them to choose $A_0$ and then $m_0$. The observations defining $m_0$ may use those already
  constructed probes; they never use $m_0$ itself. This order will allow us to prove admissibility after defining
  the data term.

We now choose a fixed $A_0 : s$. Choose the secondary path $k arrow.r d$, inside $C$,
  so that its concatenation with the previously fixed $d arrow.r
  k$ has even parity and at least four negative edges, and put $A_0 = W_(k arrow.r d) \( V \)$.
  For completeness, in a component with an odd closed walk a detour changes the parity if necessary;
  in a component with a consistent two-coloring the return paths already have matching parities.
  A closed detour through an internal negative exists by strong connectivity.
  Inserting it twice preserves parity and increases the number of negatives.
  Repeating this insertion gives the claimed choice.

Split the resulting wrapper from $V$ to $B \( A_0 \)$ into four odd segments $rho_1 \, dots.h \, rho_4$.
  This is possible by cutting after the first, second, and third negative;
  the remaining number of negatives is odd. Let $T_0 = V$ and $T_a = W_(rho_a) \( T_(a - 1) \)$, so $T_4 =
  B \( A_0 \)$. The fixed odd path $k arrow.r j$, denoted $rho_5$ here, gives $T_5 = L \( A_0 \)$.
  The first odd wrapper defines

$ y_1 \( x \) = "mk"_(rho_1) \( v . \[ x v \] \) : T_1 . $

Use the double-embedding construction of Definition 6 and Lemma 41 on $\( rho_2 \, rho_3 \)$ and on
  $\( rho_4 \, rho_5 \)$. Denote their signed embeddings by $E_epsilon.alt^(\( 1 \)) : T_1 arrow.r
  T_3$ and $E_epsilon.alt^(\( 2 \)) : T_3 arrow.r T_5$, their bit observations by $B_1 \, B_2$,
  and their recovery formula builders by $cal(R)_1 \, cal(R)_2$.
  These are notation for the previous data macros, not logical function spaces. Fix distinct strings, for example

$ \( b_1 \( 0 \) \, b_2 \( 0 \) \) = \( 0 \, 0 \) \, quad \( b_1 \( ell \) \, b_2 \( ell \) \) = \( 1 \, 0 \) \,
  quad \( b_1 \( r \) \, b_2 \( r \) \) = \( 0 \, 1 \) \, $

and define

$ x^t & = E_(b_2 \( t \))^(\( 2 \)) \( E_(b_1 \( t \))^(\( 1 \)) \( y_1 \( x \) \) \) \,\
H_2 \( y \) & = B_2 \( y \) \,\
H_1 \( y \) & = cal(R)_2 \( y \; c . B_1 \( c \) \) \,\
O_i \( y \) & = cal(R)_2 \( y \; c . cal(R)_1 \( c \; u . chevron.l u \, z_i chevron.r_(rho_1) \) \) . $

Here $chevron.l u \, z_i chevron.r_(rho_1)$ uses the first odd wrapper, whose input type is $V$.

#thm([Lemma 48.])[
  (Tagged observations).  #emph[For $t = 0 \, ell \, r$ there are proofs of the signed bits $H_a \( x^t \)$ if
    $b_a \( t \) = 1$, and $not H_a \( x^t \)$ if $b_a \( t \) = 0$, and proofs
$ O_i \( x^t \) arrow.l.r "le" \( i \, x \) . $

 Each $H_a$ and $O_i$ is invariant, by biconditional, under $y mapsto "Round" y$. Define
$ "Ae" \( y \, z \) = and.big_(a = 1 \, 2) \( H_a \( y \) arrow.l.r H_a \( z \) \) and
  #scale(x: 120%, y: 120%)[\(] forall i . thin \( O_i \( y \) arrow.l.r O_i \( z \) \) #scale(x: 120%, y: 120%)[\)] . $

 Then $"Ae"$ is an equivalence relation and there is $"AeRound" \( y \) : "Ae" \( y \, "Round" y \)$.
   For each tag $t$, its restriction compares exactly $tilde.eq$:
$ "Ae" \( x^t \, x' ""^(thin t) \) arrow.l.r x tilde.eq x' . $

 For distinct tags $t \, u$ there is a proof of $not "Ae" \( x^t \, x' ""^(thin u) \)$.]
] <rel-tags>

#proof[
  The two double-embedding builders give their signed bits and recover each callback at its exact input.
    Apply them successively to $B_1$ and to $u mapsto chevron.l u \, z_i chevron.r_(rho_1)$.
    For the latter, first-wrapper cancellation gives $chevron.l y_1 \( x \) \,
    z_i chevron.r_(rho_1) arrow.l.r \[ x z_i \]$. Propositional chaining gives all the asserted canonical
    evaluations. For a general $y$, the outer bit and every outer recovery are Boolean combinations of primitive
    $L$-evaluations at arguments independent of $y$. Primitive Round preservation at those arguments,
    followed by $sans(p l)$, therefore gives each invariance proof.
  Reflexivity of $"Ae"$ pairs the propositional bit reflexivities with $Lambda i .
    sans(p l)_(O_i \( y \) arrow.l.r O_i \( y \)) \( \)$. For symmetry,
    project both bit comparisons and the observation universal, reverse the former by $sans(p l)$,
    instantiate the latter at $i$, reverse it, and introduce $i$.
    For transitivity perform these projections on both premises, compose the bit comparisons,
    and at each $i$ compose the two observation comparisons before introducing $i$.
    Reassemble the conjunctions by $sans(p l)$. The invariance proofs supply the two bit components of $"AeRound"$
    and, after introduction of $i$, its observation component.
    The congruence builder for $"Ae"$ is the explicit two-component transitivity construction of Lemma 45.
  Given $e : x tilde.eq x'$, the canonical signed bits imply the two same-tag bit comparisons.
    At $i$, combine $e \[ i \]$ with both canonical $O_i$ evaluations, then introduce $i$.
    This proves $"Ae" \( x^t \, x' ""^(thin t) \)$. Conversely project its observation universal,
    instantiate at $i$, and chain the two canonical evaluations to obtain $"le" \( i \, x \) arrow.l.r
    "le" \( i \, x' \)$; introduce $i$. For $t eq.not u$, choose a coordinate where their fixed strings differ.
    The two signed-bit proofs contradict the comparison at that coordinate projected from an assumed
    $"Ae" \( x^t \, x' ""^(thin u) \)$. Abstract that assumption to obtain the negation. ◻
]

#prodef([Definition 8.4.])[
  (The specialized query object).  At $A_0$, for $P : sans(P)_L$, define
  $ cal(P)_G \( P \) & = forall y \, z . thin #scale(x: 120%, y: 120%)[\(] "Ae" \( y \, z \)
    arrow.r.double \( P @ y arrow.l.r P @ z \) #scale(x: 120%, y: 120%)[\)] \,\
cal(P)_(C_t) \( P \) & = exists x . forall w . thin \( P @ w arrow.l.r "Ae" \( w \, x^t \) \) \,\
cal(P)_(E_t) \( P \) & = exists x . forall w . thin #scale(x: 120%, y: 120%)[\(] P @ w
  arrow.l.r \( "Ae" \( w \, x^0 \) or "Ae" \( w \, x^t \) \) #scale(x: 120%, y: 120%)[\)] \,\
i_P & = "pred"_X \( x . P @ \( x^ell \) \) \,\
cal(P)_R \( P \) & = "Ext" \( i_P \) arrow.r.double forall x . #scale(x: 120%, y: 120%)[\(] "Valid" \( x \)
  arrow.r.double \( P @ \( x^r \) arrow.r.double "le" \( i_P \, x \) \) #scale(x: 120%, y: 120%)[\)] . $
  Here $C_t$ has $t = 0 \, ell \, r$ and $E_t$ has $t = ell \, r$. Define
  $ m_0 =
    "mk"_M
    (b p . or.big_(t med upright("structural")) #scale(x: 120%, y: 120%)[\(] "Mark"_t \( b p \) and cal(P)_t \(
    "Dec" \( b p \) \) #scale(x: 120%, y: 120%)[\)]) . $
  The formulas $cal(P)_t$ use $z_i$, tags, and observations already defined independently of $m_0$;
    this is a data term with no recursive occurrence of itself.
] <rel-specialized-object>

#thm([Lemma 49.])[
  (Respect and admissibility).  #emph[For $d : i approx i'$ there is a builder
$ "ExtC" \( d \) : "Ext" \( i \) arrow.l.r "Ext" \( i' \) . $

 For $e : P approx P'$, every structural $t$ has a builder $cal(P)_t \( P \) arrow.l.r cal(P)_t \( P' \)$.
   Consequently there are proofs
$ q_t \( P \) : "qry"_t \( m_0 \, P \) arrow.l.r cal(P)_t \( P \) quad \( t med upright("structural") \) \, wide
  a d : "Adm" \|_(A = A_0 \, m = m_0) . $

]
] <rel-query-realization>

#proof[
  Under $x \, x'$, the evaluations $d \[ x \] \, d \[ x' \]$ propositionally entail
  $ \( x tilde.eq x' arrow.r.double \( i @ x arrow.l.r i @ x' \) \)
    arrow.l.r \( x tilde.eq x' arrow.r.double \( i' @ x arrow.l.r i' @ x' \) \) . $
  Apply $sans(A l l)_(x \, x')$ to obtain $"ExtC" \( d \)$.
  For $G$, under $y \, z$, apply $sans(p l)$ to $e \[ y \] \,
    e \[ z \]$ with target the comparison of the two implications whose common antecedent is $"Ae" \( y \, z \)$;
    then apply $sans(A l l)_(y \, z)$. For $C_t$, under $x \, w$, the proof $e \[ w \]$ compares
  $ P @ w arrow.l.r "Ae" \( w \, x^t \) quad upright("with") quad P' @ w arrow.l.r "Ae" \( w \, x^t \) . $
  Apply $sans(A l l)_w$ and then $sans(E x)_x$. For $E_t$, use exactly the same two typed operations,
    with their common right side now $"Ae" \( w \, x^0 \) or "Ae" \( w \, x^t \)$.
  For $R$, predicate evaluation at $x$ for $i_P \, i_(P')$ has right sides
  $ P @ \( \( "Round"_X x \)^ell \) quad upright("and") quad P' @ \( \( "Round"_X x \)^ell \) . $
  Combine these evaluations with $e \[ \( "Round"_X x \)^ell \]$ and introduce $x$, obtaining $d : i_P approx
    i_(P')$. The proof $"ExtC" \( d \)$ compares the two antecedents of $cal(P)_R$.
    Under $x \, v : "Valid" \( x \)$, combine
  $ e \[ x^r \] \, wide v \[ i_P \] \[ i_(P') \] dot.op d $
  with target
  $ \( P @ \( x^r \) arrow.r.double "le" \( i_P \, x \) \)
    arrow.l.r \( P' @ \( x^r \) arrow.r.double "le" \( i_(P') \, x \) \) . $
  Apply $sans(G d)_(v : "Valid" \( x \))$, then $sans(A l l)_x$. This compares the consequents of $cal(P)_R$.
    Combine it propositionally with $"ExtC" \( d \)$. In particular,
    the change of predicate in $l e$ has used its explicit validity guard.
  Data cancellation at $"Enc"_t \( P \)$ compares $"qry"_t \( m_0 \, P \)$ with the defining disjunction evaluated
    there. The signed marker proofs eliminate every disjunct except $t$,
    and give a comparison with $cal(P)_t \( "Dec" \( "Enc"_t \( P \) \) \)$.
    Introduce $y$ in the decoder evaluation comparison to get
  $ "Dec" \( "Enc"_t \( P \) \) approx P . $
  Use the property-respect builder just proved and chain to obtain $q_t \( P \)$.
    Cancellation at $b p_tack.t$ and the negations of all its structural markers give $not D \( m_0 \)$.
    For each structural $t$, form
  $ Lambda P \, P' . lambda^(*) e . thin sans(p l) #scale(x: 120%, y: 120%)[\(] q_t \( P \) \, q_t \( P' \) \,
    upright("property-respect")_t \( e \) #scale(x: 120%, y: 120%)[\)] $
  with target $"qry"_t \( m_0 \, P \) arrow.l.r "qry"_t \( m_0 \, P' \)$.
    Together with $not D \( m_0 \)$, these are exactly the conjuncts of the displayed admissibility formula. ◻
]

From this point onward $A = A_0$, $m = m_0$, and $a d$ is the proof just constructed.

=== 8.4 Pairing laws at the fixed specialization <pairing-laws-at-the-fixed-specialization>

#thm([Lemma 50.])[
  (The coded equivalence is the observation equivalence).  #emph[There are proofs
$ "GA" \( P \) : "Good" \( P \) arrow.l.r cal(P)_G \( P \) \, wide
  "SA" \( y \, z \) : \( y tilde.op z \) arrow.l.r "Ae" \( y \, z \) . $

 For each $t$, there are builders
$ "Tag"_t \( e \) : x^t tilde.op x' ""^(thin t) quad \( e : x tilde.eq x' \) \, wide "TagBack"_t \( f \) :
  x tilde.eq x' quad \( f : x^t tilde.op x' ""^(thin t) \) . $

 For $t eq.not u$ there is $"diff"_(t \, u) : not \( x^t tilde.op x' ""^(thin u) \)$.]
] <rel-observation-equivalence>

#proof[
  The proof $q_G \( P \)$ identifies the second conjunct of $"Good" \( P \)$. Its property implies the first:
    the builder
  $ lambda^(*) g . Lambda y . thin g \[ y \] \[ "Round" y \] dot.op "AeRound" \( y \) $
  has that implication as type. Combining these by $sans(p l)$ gives $"GA" \( P \)$.
  For an observation $Phi$ equal to $H_1 \, H_2$, or $O_i$ with $i$ temporarily free, put $P_Phi =
    "pred" \( w . Phi \( w \) \)$. Predicate evaluation and Round invariance give, at every $u$,
    an evaluation proof $P_Phi @ u arrow.l.r Phi \( u \)$. Under $a : "Ae" \( u \, w \)$,
    project the relevant bit comparison, or project and instantiate its observation universal at the free $i$.
    Combine it with the two evaluations to get $P_Phi @ u arrow.l.r P_Phi @ w$.
    Introducing $u \, w \, a$ proves $cal(P)_G \( P_Phi \)$; apply $"back" \( "GA" \( P_Phi \) \, - \)$ to get
    $"Good" \( P_Phi \)$.
  Under $e : y tilde.op z$, the proof $e \[ P_Phi \] dot.op "Good" \( P_Phi \)$,
    combined with the two evaluations, gives $Phi \( y \) arrow.l.r Phi \( z \)$. Take the two bit instances.
    For $O_i$, introduce $i$ after obtaining this comparison. Their conjunction proves $"Ae" \( y \, z \)$.
    Conversely, under $a : "Ae" \( y \, z \)$, the term
  $ Lambda P . lambda^(*) g . thin #scale(x: 120%, y: 120%)[\(] "to" \( "GA" \( P \) \, g \)
    #scale(x: 120%, y: 120%)[\)] \[ y \] \[ z \] dot.op a $
  proves $y tilde.op z$. Abstract the two premises and pair the directions to obtain $"SA"$.
  Given $e : x tilde.eq x'$, use the same-tag direction of Lemma 48, then $"back" \( "SA" \, - \)$.
    Given $f : x^t tilde.op x' ""^(thin t)$, use $"to" \( "SA" \, f \)$ and the reverse same-tag direction.
    For distinct tags, introduce $f : x^t tilde.op x' ""^(thin u)$, map it forward through $"SA"$,
    and apply the negation from Lemma 48. These define the three asserted builders. ◻
]

#thm([Lemma 51.])[
  (Class and edge witnesses).  #emph[For $t = 0 \, ell \, r$ there is a proof
$ "Is"_t \( y \) arrow.l.r exists x . thin \( y tilde.op x^t \) . $

 For $t = ell \, r$ there is a proof
$ T_t \( y \, z \) arrow.l.r exists x . thin \( \( y tilde.op x^0 \) and \( z tilde.op x^t \) \) . $

]
] <rel-witnesses>

#proof[
  For the first forward implication, take $h : "Is"_t \( y \)$, apply $"to" \( q_(C_t) \( c_y \) \, h \)$,
    and open the result as $x \, p$, where
  $ p : forall w . thin \( c_y @ w arrow.l.r "Ae" \( w \, x^t \) \) . $
  The class evaluation and reflexivity prove $c_y @ y$. Apply $p \[ y \]$ forward and $"SA" \( y \, x^t \)$
    backward to obtain $y tilde.op x^t$. Witness the opened $x$ in the target existential.
    The target contains no free occurrence of either local witness.
    For the reverse, open $x \, e : y tilde.op x^t$. At $w$, the class evaluation,
    congruence with $"refl" \( w \) \, e$, and $"SA" \( w \, x^t \)$ yield $c_y @ w arrow.l.r
    "Ae" \( w \, x^t \)$. Introduce $w$, witness $x$ in $cal(P)_(C_t) \( c_y \)$,
    and apply $q_(C_t) \( c_y \)$ backward.
  For the edge forward implication, take $h : T_t \( y \, z \)$. Project both $"Is"$ conjuncts and its query.
    Use the first equivalence and open their witnesses as
  $ a \, e_a : y tilde.op a^0 \, wide b' \, e_(b') : z tilde.op b' ""^(thin t) . $
  Map the query forward through $q_(E_t) \( u_(y z) \)$ and open its witness as $x \, p$, with
  $ p : forall w . thin #scale(x: 120%, y: 120%)[\(] u_(y z) @ w
    arrow.l.r \( "Ae" \( w \, x^0 \) or "Ae" \( w \, x^t \) \) #scale(x: 120%, y: 120%)[\)] . $
  The union evaluation and reflexivity prove $u_(y z) @ y$ and $u_(y z) @ z$.
    Apply $p$ at each of these points and the comparisons $"SA"$; the resulting proofs have types
  $ \( y tilde.op x^0 \) or \( y tilde.op x^t \) \, wide \( z tilde.op x^0 \) or \( z tilde.op x^t \) . $
  The term
  $ lambda^(*) f . "diff"_(0 \, t) dot.op "trans" \( "sym" \( e_a \) \, f \) $
  negates $y tilde.op x^t$. The corresponding term
  $ lambda^(*) f . "diff"_(t \, 0) dot.op "trans" \( "sym" \( e_(b') \) \, f \) $
  negates $z tilde.op x^0$. Propositional elimination gives $y tilde.op x^0$ and $z tilde.op x^t$;
    pair them and witness $x$. All three openings have the original target existential.
  For the reverse, open $x \, e$ and project $e_0 : y tilde.op x^0$, $e_t : z tilde.op x^t$.
    Witness $x$ with $e_0$ or $e_t$ in the first equivalence backward to obtain the two $"Is"$ conjuncts.
    At $w$, the union evaluation and congruences along $e_0 \,
    e_t$ compare $u_(y z) @ w$ with $\( w tilde.op x^0 \) or \( w tilde.op x^t \)$.
    Use the two $"SA"$ proofs and introduce $w$, obtaining the property required for the witness $x$ in
    $cal(P)_(E_t) \( u_(y z) \)$. Apply $q_(E_t) \( u_(y z) \)$ backward and conjoin the three results. ◻
]

#thm([Lemma 52.])[
  (The two pairing laws).  #emph[Under $h : "Resp" \( v \)$, let $P_x = "Pair" \( "Part" \( v \) \, x^0 \)$.
    For every $x' : X$ there are proofs
#[#set math.equation(numbering: n => "(58)")
 $ P_x @ \( x' ""^(thin ell) \) & arrow.l.r v diamond.stroked.small_m \( x' ""^(thin 0) \) \,\
P_x @ \( x' ""^(thin r) \) & arrow.l.r x tilde.eq x' . $ <rel-pair-left>]

]
] <rel-pair-laws>

#proof[
  For (58) forward, first negate $T_r \( x^0 \, x' ""^(thin ell) \)$.
    Given such a proof, map it forward through Lemma 51 and open its witness $u$ into $tack.t$.
    Its second conjunct is $x' ""^(thin ell) tilde.op u^r$, contradicted by $"diff"_(ell \, r)$.
    Given $p : P_x @ \( x' ""^(thin ell) \)$, use $"pv"$ and this negation to extract
  $ exists y . thin \( T_ell \( y \, x' ""^(thin ell) \) and "Part" \( v \) @ y \) . $
  Open it as $y \, q$, and open the edge witness from the first conjunct as $u \, q_0 \, q_ell$, where
  $ q_0 : y tilde.op u^0 \, wide q_ell : x' ""^(thin ell) tilde.op u^ell . $
  The proof $"TagBack"_ell \( q_ell \)$ is $x' tilde.eq u$.
    Symmetrize it and apply $"Tag"_0$, then compose with $q_0$, to get $e : y tilde.op x' ""^(thin 0)$.
    From the second conjunct of $q$, the unrounded Part evaluation gives $v diamond.stroked.small_m y$.
    Apply $h \[ y \] \[ x' ""^(thin 0) \] dot.op e$ forward to obtain the target $v
    diamond.stroked.small_m \( x' ""^(thin 0) \)$. Each opening uses this fixed target.
  For the left reverse implication, a proof of $v diamond.stroked.small_m \( x' ""^(thin 0) \)$ gives
    $"Part" \( v \) @ \( x' ""^(thin 0) \)$ by (56) backward.
    Witness $x'$ with the two reflexivities in the edge equivalence backward to get
    $T_ell \( x' ""^(thin 0) \, x' ""^(thin ell) \)$. Pair these, witness $y = x' ""^(thin 0)$,
    inject the resulting existential into $"form"$, and apply $"pv"$ backward.
  For (58) forward, negate $exists y . \( T_ell \( y \, x' ""^(thin r) \) and "Part" \( v \) @ y \)$.
    Open an assumed existential into $tack.t$, open its $T_ell$ witness,
    and contradict its second conjunct $x' ""^(thin r) tilde.op u^ell$ with $"diff"_(r \, ell)$.
    Thus $"pv"$ maps a proof of $P_x @ \( x' ""^(thin r) \)$ to $T_r \( x^0 \, x' ""^(thin r) \)$.
    Open its witness $u$, with $x^0 tilde.op u^0$ and $x' ""^(thin r) tilde.op u^r$.
    The two same-tag converses give $x tilde.eq u$ and $x' tilde.eq u$.
    Compose the first with the symmetry of the second to prove $x tilde.eq x'$.
    For the reverse, given $e : x tilde.eq x'$, witness $x$ in the edge equivalence with reflexivity at $x^0$ and
    $"Tag"_r \( "sym" \( e \) \) : x' ""^(thin r) tilde.op x^r$.
    This gives $T_r \( x^0 \, x' ""^(thin r) \)$; inject it into $"form"$, then apply $"pv"$ backward.
    Abstract each input proof and pair the two directions. ◻
]

== 9 The guarded diagonal argument <rel-diagonal>

The pairing laws are now available at the fixed specialization.
  We use them to compare a probe with a predicate on $X$, and then derive a proof of $F_b$.

The construction below adapts the well-foundedness paradox of Hurkens #cite(label("Hurkens1995")),
  as presented by Geuvers #cite(label("Geuvers2007")) Section 2.
  We prove each identity with the validity and extensionality hypotheses required by the present encoding.

We retain the specialization $A = A_0$, $m = m_0$ and the constructed proof $a d : "Adm"$.
  Thus every relation and every occurrence of $diamond.stroked.small_m$ below uses this fixed specialization.
  We use the Pair laws of Lemma 52, the query comparison $q_R$,
  and the previously constructed lift and tag builders. All displayed proof builders are in the labelled fragment.
  In particular, $Lambda$ and $lambda^(*)$ denote the established logical introduction rules,
  and $sans(p l)_F$ denotes the established propositional proof builder with target formula $F$.
  Its use to construct a biconditional supplies both implication directions;
  it never replaces a data expression by a logically equivalent expression.
  The data parameters $v : V$ used below are open parameters, not additional logical quantifier domains.

#thm([Lemma 53.])[
  (The predicate represented by a response).  #emph[For every data parameter $v : V$, define
$ i_v = "pred"_X \( x' . thin v diamond.stroked.small_m \( x' ""^(thin 0) \) \) : sans(P)_X . $

 This data definition requires no proof hypothesis. Given $h : "Resp" \( v \)$, there are builders
$ E_h \( x \) : i_v @ x arrow.l.r v diamond.stroked.small_m \( x^0 \) \, wide e x_v : "Ext" \( i_v \) . $

 Moreover, for $x : X$ and $u : "Valid" \( x \)$, there is a builder
#[#set math.equation(numbering: n => "(59)")
 $ "SB" \( v \, h \, x \, u \) : "sb" \( v \, m \, x^0 \) arrow.l.r "le" \( i_v \, x \) . $ <rel-sb-law>]

]
] <rel-response-predicate>

#proof[
  The predicate evaluation law gives
  $ i_v @ x arrow.l.r v diamond.stroked.small_m \( \( "Round"_X x \)^0 \) . $
  On the other hand,
  $ h \[ x^0 \] \[ \( "Round"_X x \)^0 \] dot.op "Tag"_0 \( "RoundRel"_X \( x \) \) :
    v diamond.stroked.small_m \( x^0 \) arrow.l.r v diamond.stroked.small_m \( \( "Round"_X x \)^0 \) . $
  Applying $sans(p l)$ to these two biconditionals at the stated target gives $E_h \( x \)$.
    For $e : x tilde.eq x'$, put
  $ e x_v = Lambda x \, x' . lambda^(*) e . thin sans(p l)_(thin i_v @ x arrow.l.r i_v @ x')
    #scale(x: 120%, y: 120%)[\(] E_h \( x \) \, E_h \( x' \) \,
    h \[ x^0 \] \[ x' ""^(thin 0) \] dot.op "Tag"_0 \( e \) #scale(x: 120%, y: 120%)[\)] . $
  The final premise has type $v diamond.stroked.small_m \( x^0 \) arrow.l.r v
    diamond.stroked.small_m \( x' ""^(thin 0) \)$, so this is a proof of $"Ext" \( i_v \)$.
  Fix $x : X$ and write
  $ P_x = "Pair" \( "Part" \( v \) \, x^0 \) \, wide i_(P_x) = "pred"_X \( x' . thin P_x @ \( x' ""^(thin ell) \) \) . $
  The Pair laws, under the present hypothesis $h$, supply
  $ L_h \( x' \) & : P_x @ \( x' ""^(thin ell) \) arrow.l.r v diamond.stroked.small_m \( x' ""^(thin 0) \) \,\
R_h \( x' \) & : P_x @ \( x' ""^(thin r) \) arrow.l.r x tilde.eq x' . $
  At an arbitrary $x' : X$, denote the two predicate evaluation proofs by
  $ r_(P_x) \( x' \) & : i_(P_x) @ x' arrow.l.r P_x @ \( \( "Round"_X x' \)^ell \) \,\
r_v \( x' \) & : i_v @ x' arrow.l.r v diamond.stroked.small_m \( \( "Round"_X x' \)^0 \) . $
  Using $L_h \( "Round"_X x' \)$ between them gives
  $ d =
    Lambda x' . thin
    sans(p l)_(thin i_(P_x) @ x' arrow.l.r i_v @ x') \( r_(P_x) \( x' \) \, r_v \( x' \) \, L_h \( "Round"_X
    x' \) \) : i_(P_x) approx i_v . $
  Consequently
  $ e x_P = "back" \( "ExtC" \( d \) \, e x_v \) : "Ext" \( i_(P_x) \) . $
  We first construct both directions of
  #[#set math.equation(numbering: n => "(60)")
   $ cal(P)_R \( P_x \) arrow.l.r "le" \( i_v \, x \) \, $ <rel-r-property-law>]
  where, by the definition of $cal(P)_R$,
  $ cal(P)_R \( P_x \) = "Ext" \( i_(P_x) \) arrow.r.double forall x' :
    X . #scale(x: 120%, y: 120%)[\(] "Valid" \( x' \)
    arrow.r.double \( P_x @ \( x' ""^(thin r) \) arrow.r.double "le" \( i_(P_x) \, x' \) \)
    #scale(x: 120%, y: 120%)[\)] . $
  For the forward direction, assume $g : cal(P)_R \( P_x \)$ and put
  $ p_x = "back" \( R_h \( x \) \, "refl" \( x \) \) : P_x @ \( x^r \) . $
  Then
  $ \( g dot.op e x_P \) \[ x \] dot.op u dot.op p_x : "le" \( i_(P_x) \, x \) \, wide
    u \[ i_(P_x) \] \[ i_v \] dot.op d : "le" \( i_(P_x) \, x \) arrow.l.r "le" \( i_v \, x \) . $
  Thus the forward builder is
  $ lambda^(*) g . thin "to" #scale(x: 120%, y: 120%)[\(] u \[ i_(P_x) \] \[ i_v \] dot.op
    d \, \( g dot.op e x_P \) \[ x \] dot.op u dot.op p_x #scale(x: 120%, y: 120%)[\)] . $
  For the reverse direction, assume $l : "le" \( i_v \, x \)$.
    Introduce $e x' : "Ext" \( i_(P_x) \)$, $x' : X$, $u' : "Valid" \( x' \)$, and $p :
    P_x @ \( x' ""^(thin r) \)$. The proof $e x'$ need not be used. Set
  $ e = "to" \( R_h \( x' \) \, p \) : x tilde.eq x' . $
  Here $e \[ i_v \] : "le" \( i_v \, x \) arrow.l.r "le" \( i_v \, x' \)$, whereas
  $ u' \[ i_(P_x) \] \[ i_v \] dot.op d : "le" \( i_(P_x) \, x' \) arrow.l.r "le" \( i_v \, x' \) . $
  The required proof of $"le" \( i_(P_x) \, x' \)$ is therefore
  $ "back" #scale(x: 120%, y: 120%)[\(] u' \[ i_(P_x) \] \[ i_v \] dot.op d \,
    "to" \( e \[ i_v \] \, l \) #scale(x: 120%, y: 120%)[\)] . $
  Abstracting, in order, over $p \, u' \, x' \, e x' \, l$ gives the reverse direction of (60);
    pairing the directions gives the displayed biconditional.
  Finally, by definition, $"sb" \( v \, m \, x^0 \) = "qry"_R \( m \, P_x \)$. The query comparison is
  $ q_R \( P_x \) : "qry"_R \( m \, P_x \) arrow.l.r cal(P)_R \( P_x \) . $
  Composing its forward direction with the forward direction of (60),
    and composing the two reverse directions in the reverse order, gives (59). ◻
]

#thm([Lemma 54.])[
  (The shift and its predecessor comparison).  #emph[Define the data operations
$ delta x = "lift"_m \( x^0 \) : X \, wide S i = "pred"_X \( x . thin i @ delta x \) : sans(P)_X . $

 For every $x : X$ there is a proof $V_delta \( x \) : "Valid" \( delta x \)$, and for $e :
   x tilde.eq x'$ there is a proof $"DeltaC" \( e \) : delta x tilde.eq delta x'$.
   For $e x : "Ext" \( i \)$ there are builders
#[#set math.equation(numbering: n => "(61)")
 $ s_(e x) \( x \) & : S i @ x arrow.l.r i @ delta x \,\
"ExtS" \( i \, e x \) & : "Ext" \( S i \) \,\
d_s & : i_(z_i) approx S i . $ <rel-shift-evaluation>]

 For the additional input $u : "Valid" \( x \)$ there is a builder
#[#set math.equation(numbering: n => "(62)")
 $ a_(e x \, u) : "le" \( i \, delta x \) arrow.l.r "le" \( S i \, x \) . $ <rel-shift-predecessor>]

]
] <rel-shift>

#proof[
  The established validity proof for a lift, applied to $x^0$, is $V_delta \( x \)$. Congruence is the composite
  $ "DeltaC" \( e \) = "LC" \( "Tag"_0 \( e \) \) . $
  Neither construction requires $x$ to be valid or any predicate to be extensional.
  The predicate evaluation law gives $S i @ x arrow.l.r i @ delta \( "Round"_X x \)$. The proof
  $ e x \[ delta x \] \[ delta \( "Round"_X x \) \] dot.op "DeltaC" \( "RoundRel"_X \( x \) \) :
    i @ delta x arrow.l.r i @ delta \( "Round"_X x \) $
  and that evaluation give $s_(e x) \( x \)$ by $sans(p l)$ at the target in (61). Set
  $ "ExtS" \( i \, e x \) = Lambda x \, x' . lambda^(*) e . thin sans(p l)_(thin S i @ x arrow.l.r S i @ x')
    #scale(x: 120%, y: 120%)[\(] s_(e x) \( x \) \, s_(e x) \( x' \) \,
    e x \[ delta x \] \[ delta x' \] dot.op "DeltaC" \( e \) #scale(x: 120%, y: 120%)[\)] . $
  This has the type in (61).
  From $e x$, the earlier response builder gives $h_i : "Resp" \( z_i \)$, and the earlier exact evaluation gives,
    for every $y : L$, a proof
  $ Z_(e x) \( y \) : z_i diamond.stroked.small_m y arrow.l.r i @ "lift"_m \( y \) . $
  In particular, at $y = x^0$ the right-hand side is $i @ delta x$.
    Together with $E_(h_i) \( x \)$ and $s_(e x) \( x \)$ this gives
  $ d_s = Lambda x . thin sans(p l)_(thin i_(z_i) @ x arrow.l.r S i @ x) #scale(x: 120%, y: 120%)[\(]
    E_(h_i) \( x \) \, Z_(e x) \( x^0 \) \, s_(e x) \( x \) #scale(x: 120%, y: 120%)[\)] . $
  Now assume $u : "Valid" \( x \)$. The three available biconditionals, with their exact endpoints, are
  $ "LP" \( i \, x^0 \) & : "le" \( i \, delta x \) arrow.l.r "sb" \( z_i \, m \, x^0 \) \,\
"SB" \( z_i \, h_i \, x \, u \) & : "sb" \( z_i \, m \, x^0 \) arrow.l.r "le" \( i_(z_i) \, x \) \,\
u \[ i_(z_i) \] \[ S i \] dot.op d_s & : "le" \( i_(z_i) \, x \) arrow.l.r "le" \( S i \, x \) . $
  The forward direction of $a_(e x \, u)$ is
  $ lambda^(*) t . thin "to" #scale(x: 120%, y: 120%)[\(] u \[ i_(z_i) \] \[ S i \] dot.op d_s \,
    "to" #scale(x: 120%, y: 120%)[\(] "SB" \( z_i \, h_i \, x \, u \) \,
    "to" \( "LP" \( i \, x^0 \) \, t \) #scale(x: 120%, y: 120%)[\)] #scale(x: 120%, y: 120%)[\)] . $
  Its reverse direction is
  $ lambda^(*) t . thin "back" #scale(x: 120%, y: 120%)[\(] "LP" \( i \, x^0 \) \,
    "back" #scale(x: 120%, y: 120%)[\(] "SB" \( z_i \, h_i \, x \, u \) \,
    "back" \( u \[ i_(z_i) \] \[ S i \] dot.op d_s \, t \) #scale(x: 120%, y: 120%)[\)] #scale(x: 120%, y: 120%)[\)] . $
  Pairing them proves (62). The only use of $u$ is in the response comparison and in transport at the fixed
    argument $x$; no unconditional replacement of $i_(z_i)$ by $S i$ inside $"le"$ has been made. ◻
]

#thm([Lemma 55.])[
  (Induction respects predicate equivalence).  #emph[For $d : i approx i'$ there is a builder
$ "IndC" \( d \) : "Ind" \( i \) arrow.l.r "Ind" \( i' \) . $

 This builder needs no extensionality hypothesis on either predicate.]
] <rel-ind-congruence>

#proof[
  For $x : X$ and $u : "Valid" \( x \)$ put
  $ c_u = u \[ i \] \[ i' \] dot.op d : "le" \( i \, x \) arrow.l.r "le" \( i' \, x \) . $
  The two directions, paired in the displayed order, are
  $ & lambda^(*) l . Lambda x . lambda^(*) u . lambda^(*) t' . thin "to" #scale(x: 120%, y: 120%)[\(] d \[ x \] \,
    l \[ x \] dot.op u dot.op "back" \( c_u \, t' \) #scale(x: 120%, y: 120%)[\)] \,\
 & lambda^(*) l' . Lambda x . lambda^(*) u . lambda^(*) t . thin "back" #scale(x: 120%, y: 120%)[\(] d \[ x \] \,
   l' \[ x \] dot.op u dot.op "to" \( c_u \, t \) #scale(x: 120%, y: 120%)[\)] . $
  In the first line $l : "Ind" \( i \)$ and $t' : "le" \( i' \, x \)$; in the second $l' :
    "Ind" \( i' \)$ and $t : "le" \( i \, x \)$. Thus every application has the exact antecedent required by (57). ◻
]

#thm([Lemma 56.])[
  (A valid induction object).  #emph[Define, without proof hypotheses,
$ "WF" = "mk"_X \( v . thin "Ind" \( i_v \) \) : X . $

 There is a proof $V_("WF") : "Valid" \( "WF" \)$. For $e x : "Ext" \( i \)$ there is a builder
#[#set math.equation(numbering: n => "(63)")
 $ w_(e x) : "le" \( i \, "WF" \) arrow.l.r "Ind" \( S i \) . $ <rel-wf-evaluation>]

 Finally, from $i : sans(P)_X$, $e x : "Ext" \( i \)$ and $l : "Ind" \( i \)$ there is a builder
#[#set math.equation(numbering: n => "(64)")
 $ b \( i \, e x \, l \) : i @ "WF" . $ <rel-induction-builder>]

]
] <rel-wf>

#proof[
  Since $"le" \( i \, "WF" \) = \[ "WF" z_i \]$, the data cancellation law gives, for every $i$, a proof
  $ F \( i \) : "le" \( i \, "WF" \) arrow.l.r "Ind" \( i_(z_i) \) . $
  This evaluation uses neither $"Resp" \( z_i \)$ nor $"Ext" \( i \)$.
  To prove validity, take arbitrary $i \, i' : sans(P)_X$ and $d : i approx i'$. We construct
  $ D \( d \) : i_(z_i) approx i_(z_(i')) $
  without introducing extensionality assumptions. At $x : X$ put $t = \( "Round"_X x \)^0 : L$.
    The predicate evaluation law and the earlier rounded evaluation of $z_i$ give the following chain of biconditionals:
  $ i_(z_i) @ x med arrow.l.r med z_i diamond.stroked.small_m t med arrow.l.r med i @ "lift"_m \( "Round" t \) med
    arrow.l.r med i' @ "lift"_m \( "Round" t \) med arrow.l.r med z_(i') diamond.stroked.small_m t med
    arrow.l.r med i_(z_(i')) @ x . $
  The middle comparison is exactly $d \[ "lift"_m \( "Round" t \) \]$.
    The other four comparisons are the two predicate evaluations and the two rounded evaluations.
    Applying $sans(p l)$ to those five proofs at target $i_(z_i) @ x arrow.l.r i_(z_(i')) @ x$,
    then abstracting over $x$, constructs $D \( d \)$. Therefore
  $ V_("WF") = Lambda i \,
    i' . lambda^(*) d . thin sans(p l)_(thin "le" \( i \, "WF" \) arrow.l.r "le" \( i' \, "WF" \))
    #scale(x: 120%, y: 120%)[\(] F \( i \) \, F \( i' \) \, "IndC" \( D \( d \) \) #scale(x: 120%, y: 120%)[\)] . $
  Now assume $e x : "Ext" \( i \)$. The proof $d_s$ from (61) and Lemma 55 give
  $ "IndC" \( d_s \) : "Ind" \( i_(z_i) \) arrow.l.r "Ind" \( S i \) . $
  The forward and reverse directions of $w_(e x)$ are, respectively,
  $ & lambda^(*) t . thin "to" \( "IndC" \( d_s \) \, "to" \( F \( i \) \, t \) \) \,\
 & lambda^(*) l_S . thin "back" \( F \( i \) \, "back" \( "IndC" \( d_s \) \, l_S \) \) . $
  Their pair proves (63).
  For the final assertion, fix $l : "Ind" \( i \)$. We first construct $l_S : "Ind" \( S i \)$.
    Under $x : X$, $u : "Valid" \( x \)$ and $t : "le" \( S i \, x \)$,
    the proof $"back" \( a_(e x \, u) \, t \)$ has type $"le" \( i \, delta x \)$.
    Since $V_delta \( x \) : "Valid" \( delta x \)$, it follows that
  $ l \[ delta x \] dot.op V_delta \( x \) dot.op "back" \( a_(e x \, u) \, t \) : i @ delta x . $
  Applying the reverse direction of $s_(e x) \( x \)$ gives $S i @ x$. Thus the required builder is
  $ l_S = Lambda x . lambda^(*) u . lambda^(*) t . thin "back" #scale(x: 120%, y: 120%)[\(] s_(e x) \( x \) \,
    l \[ delta x \] dot.op V_delta \( x \) dot.op "back" \( a_(e x \, u) \, t \) #scale(x: 120%, y: 120%)[\)] . $
  Since $"back" \( w_(e x) \, l_S \)$ has type $"le" \( i \, "WF" \)$, define
  $ b \( i \, e x \, l \) = l \[ "WF" \] dot.op V_("WF") dot.op "back" \( w_(e x) \, l_S \) . $
  Its type is $i @ "WF"$, as required. ◻
]

#thm([Proposition 57.])[
  (The diagonal contradiction).  #emph[The specialized relational construction yields a proof of $tack.t =
    F_b$ in the ambient labelled context.]
] <rel-contradiction>

#proof[
  Define the data formula and data predicate
  $ Q \( x \) & = forall i : sans(P)_X . #scale(x: 120%, y: 120%)[\(] "Ext" \( i \)
    arrow.r.double \( "le" \( i \, x \) arrow.r.double i @ delta x \) #scale(x: 120%, y: 120%)[\)] \,\
j_(*) & = "pred"_X \( x . thin not Q \( x \) \) : sans(P)_X . $
  Neither definition uses proof variables.
  First we construct
  $ "QC" \( e \) : Q \( x \) arrow.l.r Q \( x' \) wide \( e : x tilde.eq x' \) . $
  For any $i : sans(P)_X$ and $e x : "Ext" \( i \)$, put
  $ c_(e x \, e) = e x \[ delta x \] \[ delta x' \] dot.op "DeltaC" \( e \) : i @ delta x arrow.l.r i @ delta x' . $
  The forward direction of $"QC" \( e \)$ is
  $ lambda^(*) q . Lambda i . lambda^(*) e x . lambda^(*) t' . thin "to" #scale(x: 120%, y: 120%)[\(]
    c_(e x \, e) \, q \[ i \] dot.op e x dot.op "back" \( e \[ i \] \, t' \) #scale(x: 120%, y: 120%)[\)] \, $
  where $q : Q \( x \)$ and $t' : "le" \( i \, x' \)$. Its reverse direction is
  $ lambda^(*) q' . Lambda i . lambda^(*) e x . lambda^(*) t . thin "back" #scale(x: 120%, y: 120%)[\(]
    c_(e x \, e) \, q' \[ i \] dot.op e x dot.op "to" \( e \[ i \] \, t \) #scale(x: 120%, y: 120%)[\)] \, $
  where $q' : Q \( x' \)$ and $t : "le" \( i \, x \)$. Pairing these terms gives the asserted congruence.
  The predicate evaluation law supplies $j_(*) @ x arrow.l.r not Q \( "Round"_X x \)$.
    Using $"QC" \( "RoundRel"_X \( x \) \)$ and $sans(p l)$ with that evaluation yields
  #[#set math.equation(numbering: n => "(65)")
   $ n \( x \) : j_(*) @ x arrow.l.r not Q \( x \) . $ <rel-negative-evaluation>]
  The extensionality builder is
  $ e x_(*) = Lambda x \, x' . lambda^(*) e . thin sans(p l)_(thin j_(*) @ x arrow.l.r j_(*) @ x')
    #scale(x: 120%, y: 120%)[\(] n \( x \) \, n \( x' \) \, "QC" \( e \) #scale(x: 120%, y: 120%)[\)] :
    "Ext" \( j_(*) \) . $
  In both uses of $sans(p l)$ the passage from a biconditional between the $Q$-formulas to the corresponding
    negated formulas is propositional; no predicate is substituted inside data.
  We next construct $l_(*) : "Ind" \( j_(*) \)$. Introduce $x : X$, $u : "Valid" \( x \)$ and $t :
    "le" \( j_(*) \, x \)$. To obtain $j_(*) @ x$, it suffices, by the reverse direction of $n \( x \)$,
    to obtain $not Q \( x \)$. Under the further assumption $q : Q \( x \)$ we have
  $ q \[ j_(*) \] dot.op e x_(*) dot.op t : j_(*) @ delta x \, $
  and hence
  #[#set math.equation(numbering: n => "(66)")
   $ n_delta = "to" #scale(x: 120%, y: 120%)[\(] n \( delta x \) \,
     q \[ j_(*) \] dot.op e x_(*) dot.op t #scale(x: 120%, y: 120%)[\)] : not Q \( delta x \) . $ <rel-negative-shift>]
  To construct the opposite formula $Q \( delta x \)$, take arbitrary $i : sans(P)_X$, $e x :
    "Ext" \( i \)$ and $t' : "le" \( i \, delta x \)$. At this point $a_(e x \, u)$ uses the original proof $u :
    "Valid" \( x \)$. Its forward direction gives
  $ "to" \( a_(e x \, u) \, t' \) : "le" \( S i \, x \) . $
  Because $"ExtS" \( i \, e x \) : "Ext" \( S i \)$, we may instantiate $q$ at $S i$ to obtain
  $ q \[ S i \] dot.op "ExtS" \( i \, e x \) dot.op "to" \( a_(e x \, u) \, t' \) : S i @ delta x . $
  The forward direction of $s_(e x) \( delta x \)$ turns this into $i @ delta \( delta x \)$. Therefore
  #[#set math.equation(numbering: n => "(67)")
   $ p_delta =  & Lambda i . lambda^(*) e x . lambda^(*) t' . thin "to" #scale(x: 120%, y: 120%)[\(]
     s_(e x) \( delta x \) \,\
 & #h(35mm)  q \[ S i \] dot.op "ExtS" \( i \, e x \) dot.op "to" \( a_(e x \, u) \, t' \)
   #scale(x: 120%, y: 120%)[\)] : Q \( delta x \) . $ <rel-positive-shift>]
  Combining (66) and (67) gives $n_delta dot.op p_delta : tack.t$.
    With these local terms inlined in their indicated context, define
  $ l_(*) = Lambda x . lambda^(*) u . lambda^(*) t . thin "back" #scale(x: 120%, y: 120%)[\(] n \( x \) \,
    lambda^(*) q . thin n_delta dot.op p_delta #scale(x: 120%, y: 120%)[\)] . $
  Its body has type $j_(*) @ x$, so $l_(*) : "Ind" \( j_(*) \)$.
  Finally construct $q_0 : Q \( "WF" \)$. Under arbitrary $i : sans(P)_X$, $e x : "Ext" \( i \)$ and $t :
    "le" \( i \, "WF" \)$, the forward direction of $w_(e x)$ gives $"Ind" \( S i \)$.
    Applying the induction builder to the predicate $S i$ therefore gives
  $ b #scale(x: 120%, y: 120%)[\(] S i \, "ExtS" \( i \, e x \) \,
    "to" \( w_(e x) \, t \) #scale(x: 120%, y: 120%)[\)] : S i @ "WF" . $
  Here the builder $b$ is instantiated at $S i$, while the displayed $w_(e x)$ and the following $s_(e x)$ are the
    builders for the original predicate $i$. Thus
  $ q_0 = Lambda i . lambda^(*) e x . lambda^(*) t . thin "to" #scale(x: 120%, y: 120%)[\(] s_(e x) \( "WF" \) \,
    b \( S i \, "ExtS" \( i \, e x \) \, "to" \( w_(e x) \, t \) \) #scale(x: 120%, y: 120%)[\)] : Q \( "WF" \) . $
  On the other hand, $b \( j_(*) \, e x_(*) \, l_(*) \) : j_(*) @ "WF"$, and hence
  $ "to" #scale(x: 120%, y: 120%)[\(] n \( "WF" \) \, b \( j_(*) \, e x_(*) \, l_(*) \)
    #scale(x: 120%, y: 120%)[\)] : not Q \( "WF" \) . $
  The required ambient proof is therefore
  $ "to" #scale(x: 120%, y: 120%)[\(] n \( "WF" \) \, b \( j_(*) \, e x_(*) \, l_(*) \)
    #scale(x: 120%, y: 120%)[\)] dot.op q_0 : tack.t . $
  ◻
]

#prodef([Remark 9.1.])[
  (Dependencies and discharged assumptions).  At the fixed specialization,
    $i_v$ is defined before its response and extensionality proofs;
    $delta$ and $S$ are data definitions independent of those proofs;
    $"WF"$ uses the already defined $i_v$ and $"Ind"$; and $Q \,
    j_(*)$ use only the previously defined data operations. In particular,
    $"WF"$ is defined even when $v$ is not responsive. Its validity proof uses rounded evaluations and does not
    assume extensionality of the predicates it quantifies over.
  The inputs $h \, e x \, u$ occur only in proof builders. Every use of (59) or (62) supplies the stated response,
    extensionality and validity inputs. Every logical quantifier introduced by the displayed tail builders ranges
    over $X$ or $sans(P)_X$ with its fixed direct-domain annotation.
    After inlining the local builders, the proof of Proposition 57 has no free proof or data assumptions beyond
    the ambient context: $A_0 \, m_0 \, a d$ are the earlier constructed specialization,
    and every introduced logical assumption has been abstracted or supplied as an argument.
] <rel-diagonal-dependencies>

== 10 Exclusion and completion of the proof <sec:conclusion>

=== 10.1 The obstruction to a normal proof <the-obstruction-to-a-normal-proof>

Here is the precise property of the ambient context used by the encoding.
  Let $cal(F)$ be its finite family of terminals. Each $F in cal(F)$ is a beta-normal,
  sorted data expression containing only $\( sans(d) \, sans(d) \)$ labels.
  A #emph[constant positive telescope] is an expression

$ Pi^(sans(d) \, sans(p)) x_1 : D_1 . thin dots.h.c Pi^(sans(d) \, sans(p)) x_r : D_r . thin F \, wide F in cal(F) \, $

where $r gt.eq 0$, the domains are normal data expressions,
  and each displayed binder is absent from the subsequent suffix.
  All the telescopes and suffixes used below have specified sort typings.
  Let $cal(T)$ consist of the converter domains, their suffixes, and all the terminals.

The ambient context is $Delta = Delta_(sans(d)) \, Delta_(sans(p))$.
  Every variable in $Delta_(sans(d))$ has data mode. Every declaration in $Delta_(sans(p))$ is a proof variable of
  the form

$ c : Pi^(sans(p) \, sans(p)) u : T_c . F_c \, wide T_c in cal(T) \, quad F_c in cal(F) . $

The domains $T_c$ are the constant positive telescopes just described. All these types are normal.
  Their typings, and the suffix typings, persist in legal extensions of the context.

#thm([Lemma 58.])[
  (No normal erasure at a terminal).  #emph[In the ambient context above,
    or in any legal extension by data declarations, there is no proof-mode term $P$ with beta-normal erasure and a
    judgment $P : T$ for any $T in cal(T)$.]
] <lem:enc-no-normal-proof>

#proof[
  Choose a counterexample of least syntax size, allowing all such data extensions and all targets in $cal(T)$.
    A proof-mode term is neither a sort nor a product.
  Suppose first that $P$ is a lambda. Its body and result have proof mode.
    Its generated type is therefore a product with result label $sans(p)$. This type cannot convert to a terminal:
    a normal terminal is either not a product, or has outer product labels $\( sans(d) \, sans(d) \)$.
    Consequently $T$ has a nonempty positive prefix. Product compatibility forces the lambda’s labels to be
    $\( sans(d) \, sans(p) \)$, with annotation convertible to the first telescope domain.
    Its binder is a data variable. Generation gives a body typing whose expected type converts to the remaining
    suffix. The suffix’s recorded sort typing, transported by context conversion to the lambda annotation and
    weakened as necessary, permits conversion of the body to that suffix.
    The body has normal erasure and is strictly smaller than $P$,
    in an allowed extension by one more data declaration. This contradicts minimality.
  Otherwise $P$ is a variable or an application spine. Every function position of a proof-mode spine has proof
    mode. Its head cannot be a sort or product, and a lambda head with a nonempty spine would create a redex in
    its erasure. Thus its head is a proof variable, hence one of the converters $c$.
  If the spine is empty, variable generation says that $T$ converts to $Pi^(sans(p) \, sans(p)) u : T_c . F_c$.
    Both are normal. The latter has outer labels $\( sans(p) \, sans(p) \)$,
    whereas $T$ either has a $\( sans(d) \, sans(p) \)$ prefix or is an all-data terminal.
    This is impossible by confluence and product compatibility.
  If the spine is nonempty, let $Q$ be its first argument. Generation at the first application and at $c$,
    followed by product compatibility, forces that application to have labels $\( sans(p) \, sans(p) \)$ and its
    domain to convert to $T_c$. Thus $Q$ is a proof-mode term.
    The recorded sort typing of $T_c$, weakened to the current context,
    converts its generated argument typing to $Q : T_c$. Its erasure is normal because it is a subterm of the
    normal erasure of $P$, and its syntax size is strictly smaller. This is another counterexample to minimality. ◻
]

The lemma concerns proof mode, rather than every inhabitant of a terminal.
  For example, the ambient data declaration $e_b : F_b$ is harmless:
  a data variable cannot be the head of a proof-mode spine.
  The reduction-lifting lemma ensures that a constructed proof cannot change into such a data term on the way to
  an erased normal form.

#thm([Proposition 59.])[
  (Exclusion by system-wide weak normalization).  #emph[Assume that every legal expression of the given pure type
    system is weakly beta-normalizing. For every primary component containing an odd closed walk and an
    all-component profile triple, condition (7) holds.]
] <prop:enc-exclusion>

#proof[
  If the configuration prohibited in (7) occurred, Sections 6–9, culminating in Proposition 57,
    would give a finite legal labelled context $Delta$ of the form above and a proof-mode term
  $ Delta tack.r P : F_b . $
  Every other temporary assumption in the construction has been discharged or instantiated.
    Erasure gives an ordinary typing derivation $\| Delta \| tack.r \| P \| : \|
    F_b \|$ using only the original specification. The system-wide hypothesis therefore applies to this particular
    open legal term $\| P \|$. Choose a finite reduction to a full beta-normal form.
    Lemma 35 lifts that reduction to a labelled reduct $P'$ with the same exact type $F_b$, the same proof mode,
    and normal erasure. Lemma 58 rules out $P'$. ◻
]

#proof[
  By Lemma 12, it suffices to treat a finite specification.
    Process the finitely many primary components in dependency order.
    For a component without an odd closed walk use Proposition 22.
    For one with no profile triple entirely inside it use Proposition 25.
    Every remaining component satisfies the hypotheses of Proposition 59;
    hence Proposition 34 supplies its candidate interface. Proposition 20 therefore advances the processed
    invariant at every stage. Once all components are processed,
    Proposition 21 gives strong normalization of every legal expression.
    This includes expressions in arbitrary valid open contexts and every reduction position in their annotations. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
