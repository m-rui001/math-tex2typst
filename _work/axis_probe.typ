#import "@preview/cetz:0.5.2"
#cetz.canvas({
  import cetz.draw: *
  content((0, 1), [UPPER])
  content((0, -1), [LOWER])
  line((0, 0), (2, 0), name: "axis")
})
