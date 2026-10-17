#import "@preview/cetz:0.5.0"
#set page(width: 120mm, height: 90mm, margin: 12mm)
#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (6, 0), stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  line((3, -3), (3, 3), stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  content((3, 0), [#box(width: 5.2cm, inset: 0.3333em, stroke: (thickness: 0.4pt), [#set text(hyphenate: false); #align(center)[#text(size: 9pt)[After the side report, the visible count and the hidden count are fixed, and the left term equals the visible count plus a binomial draw.]]])], anchor: "west")
})