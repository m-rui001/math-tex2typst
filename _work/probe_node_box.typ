#import "@preview/cetz:0.5.0"
#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(stroke: (thickness: 0.4pt, paint: black), inset: 0.1389cm, [A framed node])])
  content((4, 0), [#box(stroke: (thickness: 0.8pt, paint: rgb("#1f4e79")), inset: 0.1389cm, radius: 4pt, fill: rgb("#fff2cc"), [Tinted and round])])
  // guides crossing exactly at (2,-2): is the boxed node centred on its point or hung from it?
  line((1.2, -2), (2.8, -2), stroke: (thickness: 0.4pt, paint: rgb("#ff0000")))
  line((2, -2.8), (2, -1.2), stroke: (thickness: 0.4pt, paint: rgb("#ff0000")))
  content((2, -2), [#box(stroke: (thickness: 0.4pt, paint: black), inset: 0.1389cm, [Two lines of text])])
})
