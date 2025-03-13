#let question(body, breakable: false, answer: none) = {
  block(inset: 1em, 
  fill: rgb("#f4c0c3"),
  stroke: 0.1pt + rgb("#f4c9c3").darken(10%),
  spacing: 0.64em,
  radius: 3pt,
  above: 1.2em,
  below: 1em,
  width: 100%,
)[
  #context[
    #if calc.even(here().page()) [
      #place(top+left, dy: -1.3em, dx: -2.8em)[
        #block(inset: 0.7em, fill: red.lighten(15%), radius: 3pt)[
          #text(fill: white, size: 1.2em)[*¿?*]
        ]
      ]
    ] else [
      #place(top+right, dy: -1.3em, dx: 2.8em)[
        #block(inset: 0.7em, fill: red.lighten(15%), radius: 3pt)[
          #text(fill: white, size: 1.2em)[*¿?*]
        ]
      ]
    ]
  ]
  #block(breakable: breakable)[
    #body
    #if answer != none [
      #counter("qcounter").step()
      #context [
        #let h_c = counter(heading).get().first()
        #let qc = counter("qcounter").get().first()
        #let l = (h_c, qc)
        #let label = "<q" + str(h_c) + "." + str(qc) + ">"
        #h(1fr) #metadata((pos: l, answer: answer)) <answered>  #link(eval(label))[#text(fill: red)[#sym.arrow.cw.half]]
      ]
    ]
  ]
]
}

#let answers(rest) = {
  context[
    #show grid.cell: set par(justify: true, leading: 0.5em)

    #let vals = query(<answered>)
    #let a = ()
    
    #for val in vals {
      let source_page = val.location().page()
      let offset = source_page - 9
      let l = "<q" + str(val.value.pos.first()) + "." + str(val.value.pos.last()) + ">"
      a.push([
        #link((page: source_page, x: 0pt, y: 0pt))[
                #val.value.pos.last())
                #text(fill: black.lighten(30%))[
                  _c.~#val.value.pos.first()_, 
                  _p.~#offset _#eval(l) 
                ]
              ]
            ])
      a.push([#val.value.answer])
    }

    #grid(
      columns: (3fr, 12fr),
      column-gutter: 0.2em,
      row-gutter: 0.5em,
      [#text(fill: red)[#sym.arrow.ccw.half]], [],
      ..a
    )
  ]
  rest
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
