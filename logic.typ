#let would = context [
  #let m = measure([a])
  #box(height: m.height, width: 2.6*m.width)[
    #place(horizon, dy: m.height/10)[#square(stroke: 0.5pt, size: m.height/1.25)]
    #place(dx: m.height/1.4)[$->$]
  ]
]
