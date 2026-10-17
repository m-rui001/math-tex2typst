#let thm(head, body) = block[head #body]

#set figure(numbering: "1")

#figure(
  table(columns: 2, [a], [b]),
  caption: [Figure 1: two names on one float],
) <fig:first>

#v(0pt)<fig:second>

#figure(
  [#label("fig:inner") body with an inner label],
  caption: [Figure 2: a label inside the content],
) <fig:outer>

first: #context counter(page).at(<fig:first>).first(),
second: #context counter(page).at(<fig:second>).first(),
inner: #context counter(page).at(<fig:inner>).first(),
outer: #context counter(page).at(<fig:outer>).first().
