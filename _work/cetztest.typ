#import "@preview/cetz:0.5.0"
#cetz.canvas({
  import cetz.draw: *
  line((0,0), (2,1), mark: ">")
  circle(radius: 0.5, center: (1,1))
  node((2,1), [hi])
  rect((0,0), (1,1))
})
