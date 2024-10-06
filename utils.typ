#let question(body) = {
  block(fill: rgb("#f4c9c3"), inset: 5pt, outset: 5pt, radius: 5pt)[
    #grid(columns: (25pt, 1fr),
      block[#align(right)[#text(size: 20pt, fill: black)[¿?]]],
      grid.cell(align: horizon, breakable: false)[#body]
    )
  ]
}

#let aside(breakable: false, body) = {
  block(fill: rgb("#ebb5c3"), breakable: breakable, inset: 4pt, outset: 4pt, radius: 5pt)[#body]
}
