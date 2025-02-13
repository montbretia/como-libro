#let question(label: none, breakable: false, body) = {

block(inset: 1em, 
      fill: rgb("#f4c0c3"),
      stroke: 0.1pt + rgb("#f4c9c3").darken(10%),
      spacing: 0.64em,
      radius: 3pt,
      above: 1.2em,
      below: 1em,
      width: 100%,
      )[
  #place(top+left, dy: -1.3em, dx: -2.8em)[
    #block(inset: 0.7em, fill: red.lighten(15%), radius: 3pt)[
      #text(fill: white, size: 1.2em)[*¿?*]
    ]
  ]
  #block(breakable: breakable)[
  #body
  #if label != none [
        #h(1fr) #link(label)[#text(size: 12pt, fill: red)[#sym.arrow.r.wave]]
  ]
]
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
