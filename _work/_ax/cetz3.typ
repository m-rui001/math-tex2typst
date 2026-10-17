#import "@preview/cetz:0.5.0"
#set page(width: 120mm, height: 90mm, margin: 12mm)
#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (6, 0), stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  line((3, -3), (3, 3), stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  content((3, 0), [#box(width: 5.2cm, height: 1.6cm, inset: 0.3333em, stroke: (thickness: 0.4pt), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[count plus a draw]]])])
})