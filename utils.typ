#let question(body) = {
  block(fill: rgb("#f4c9c3"), 
        stroke: 0.1pt + rgb("#f4c9c3").darken(20%),
        spacing: 0.64em, 
        inset: 0pt,
        outset: 0pt,
        radius: 4pt,
        above: 1.5em,
        below: 1.5em)[
    #grid(columns: (0.9fr, 10fr),
      block(
        inset: 9pt, 
        fill: red.transparentize(15%), 
        radius: (top-left: 4pt, bottom-right: 4pt, rest: 0pt)
      )[#align(right+horizon)[#text(size: 1.2em, fill: white)[*¿?*]]],
      grid.cell(align: horizon, breakable: false, inset: 9pt)[
      #body
      ]
    )
  ]
}

#let aside(breakable: false, body) = {
  place(auto, float: true)[
    #block(fill: rgb("#ebb5c3").lighten(30%), 
          stroke: rgb("#ebb5c3").darken(5%), 
          spacing: 0.64em, 
          breakable: breakable,
          inset: 4pt,
          outset: 4pt,
          radius: 4pt,
          above: 1.5em, below: 1.5em)[
            #align(start)[#body]
    ]
  ]
}

#let fitch-r(body) = {
  h(1fr)
  text(size: 9pt)[(#body)]
}

#let color-key(color, lighten: 100%) = {
  set rect(fill: color.lighten(lighten))
  box[#rect(stroke: 0.1pt + black.lighten(60%), width: 0.65em, height: 0.65em)]
}
