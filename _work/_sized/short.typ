#import "@preview/cetz:0.5.0"
#set page(width: 12cm, height: 8cm, margin: 0cm)
#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (6, 0), stroke: (thickness: 0.4pt))
  content((0, 5), (2, 6), [X], frame: "rect", stroke: (thickness: 0.4pt))
})
