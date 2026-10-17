#import "@preview/cetz:0.5.0"
#set page(width: 8cm, height: 4cm, margin: 0.5cm)
#cetz.canvas({
  import cetz.draw: *
  content((0, 0), (2, 1), [ab], frame: "rect", fill: rgb("#ff0000"))
})
#page()
#cetz.canvas({
  import cetz.draw: *
  content((0, 0), (2, 1), [ab], frame: "rect", fill: rgb("#ff0000"), stroke: none)
})
#page()
#cetz.canvas({
  import cetz.draw: *
  content((0, 0), (2, 1), [ab], frame: "rect", fill: rgb("#ff0000"), stroke: (paint: rgb("#0000ff")))
})
#page()
#cetz.canvas({
  import cetz.draw: *
  content((1, 0.5), [ab], frame: "circle", padding: 0.2cm, fill: rgb("#ff0000"), stroke: none)
})
#page()
#cetz.canvas({
  import cetz.draw: *
  content((1, 0.5), [ab], frame: "circle", padding: 0.2cm, fill: rgb("#ff0000"))
})
#page()
