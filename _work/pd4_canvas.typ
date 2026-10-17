#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#text(size: 9pt)[$D arrow.r.long P tilde.eq "BH"$#linebreak()marked boundary $S$]])
  content((1, 0), [#text(size: 9pt)[$N arrow.r.long Q tilde.eq "BG"$#linebreak()reflection]])
  content((1, -1.739), [#text(size: 9pt)[hypothetical $M tilde.eq Q$#linebreak()marked stable product]])
  content((0, -1.739), [#text(size: 9pt)[$Z$ with boundary $S$#linebreak()cap and remove inner pairs]])
  content((0, -3.478), [#text(size: 9pt)[graph-type filling of $S$#linebreak()contradicts the cut obstruction]])
  line((0, 0), (1, 0), stroke: (thickness: 0.4pt), mark: (end: (symbol: ")>", fill: black)))
  line((1, 0), (1, -1.739), stroke: (thickness: 0.4pt), mark: (end: (symbol: ")>", fill: black)))
  line((1, -1.739), (0, -1.739), stroke: (thickness: 0.4pt), mark: (end: (symbol: ")>", fill: black)))
  line((0, -1.739), (0, -3.478), stroke: (thickness: 0.4pt), mark: (end: (symbol: ")>", fill: black)))
  content((0, -2.608), [#box(width: 3.7cm, inset: 0.3333em, [#set text(hyphenate: false); #align(center)[#text(size: 9pt)[direction control#linebreak()and sphere surgery]]])], anchor: "west")
})