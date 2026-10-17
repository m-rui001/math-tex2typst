#import "@preview/cetz:0.5.0"
#set page(width: 90mm, height: 60mm, margin: 12mm)
#cetz.canvas(length: 1cm, {
  import cetz.draw: *
  line((0, 0), (4, 0), stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  line((2, -2), (2, 2), stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  content((2, 0), [#box(width: 2cm, height: 1cm, inset: 0pt, stroke: 0.4pt)[#align(center + horizon)[B]]])
})
