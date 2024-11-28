#let question(label: none, body) = {
  block(fill: rgb("#f4c9c3"), 
        stroke: 0.1pt + rgb("#f4c9c3").darken(10%),
        spacing: 0.64em, 
        inset: 0pt,
        outset: 0pt,
        radius: 3pt,
        above: 1.5em,
        below: 1.5em)[
    #grid(columns: (0.85fr, 10fr),
      block(
        inset: 8pt, 
        fill: red.transparentize(15%), 
        radius: (top-left: 4pt, bottom-right: 4pt, rest: 0pt)
      )[#align(right+horizon)[#text(size: 1.2em, fill: white)[*¿?*]]],
      grid.cell(align: horizon, breakable: false, inset: 9pt)[
      #body
      #if label != none [
        #h(1fr) #link(label)[#text(size: 12pt, fill: red)[#sym.arrow.r.wave]]
      ]
      ]
    )
  ]
}

#let aside(breakable: false, float: true, body) = {
  set text(size: 10.5pt)
  let inner =  block(fill: rgb("#ebb5c3").lighten(60%), 
          // stroke: 0.1pt + rgb("#ebb5c3").darken(5%), 
          spacing: 0.64em, 
          breakable: breakable,
          inset: 6pt,
          outset: 3pt,
          radius: 3pt,
          above: 1.5em, below: 1.5em)[
            #align(start)[#body]
    ]

  if float == true [
    #place(auto, float: float)[
      #inner
    ]
  ] else [
    #inner
  ]
}

#let color-key(color, lighten: 100%) = {
  set rect(fill: color.lighten(lighten))
  box[#rect(stroke: 0.1pt + black.lighten(60%), width: 0.65em, height: 0.65em)]
}
