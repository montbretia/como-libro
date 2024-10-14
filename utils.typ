#let question(body) = {
  block(fill: rgb("#f4c9c3"), inset: 5pt, outset: 5pt, radius: 5pt)[
    #grid(columns: (25pt, 1fr),
      block[#align(right+horizon)[#text(size: 1.6em, fill: black.lighten(20%))[*¿?*]]],
      grid.cell(align: horizon, breakable: false)[#body]
    )
  ]
}

#let aside(breakable: false, body) = {
  block(fill: rgb("#ebb5c3"), breakable: breakable, inset: 4pt, outset: 4pt, radius: 5pt)[#body]
}

#let color-key(color, lighten: 100%) = {
  set rect(fill: color.lighten(lighten))
  box[#rect(stroke: 0.1pt + black.lighten(60%), width: 0.65em, height: 0.65em)]
}
