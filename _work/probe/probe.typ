#set heading(numbering: "1.")
#set math.equation(numbering: "(1)")
#let thm(body) = block(width: 100%, inset: (left: 10pt), above: 0.7em, below: 0.7em)[#body]

= Introduction <sec:intro>

A numbered display:
$  sum_(i=1)^n i = n (n + 1) / 2 $ <eq:sum>

Referencing it: @eq:sum and @sec:intro.

#thm[#strong[Theorem 1.] #emph[There exists a smooth nonquadratic example.]] <thm:main>

Theorem 1 is the main one (baked reference).

$ mat(1, 2; 3, 4) $ <eq:mat>

#bibliography(("refs.bib"), style: "ieee")

Cite numeric: \@a and label @a.
