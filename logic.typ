#let would = context [
  #let m = measure([a])
  #box(height: m.height, width: 2.6*m.width)[
    #place(horizon, dy: m.height/10)[#square(stroke: 0.5pt, size: m.height/1.25)]
    #place(dx: m.height/1.4)[$->$]
  ]
]

#let fitch(start: 1, 
          width: 100%, // how much space to take horizontally
          ratio: (2fr, 1fr), // what is the ration of the body and justification columns
          num: "1)", // how to number the steps in the proof
          num-fill: black.lighten(20%), // color of the numbering
          num-bg: none,
          body-fill: black, //color of the body
          justification-fill: black.lighten(10%), //color of the justification
          caption: none,
          body
        ) = [

  // parse the list
  #if body.has("children") [
    #let proof-info = ()
    #for item in body.at("children") {
      if item.has("body") [
        // #repr(item.fields())
        #if item.body.has("children") and item.body.at("children").len() > 0 {
          let last = item.body.at("children").last()
          // [#last.fields()]
          let justification = none
          let content = none
          if last.has("text") {
            // if the item ends in a string that matches "(.*)", treat that as a
              // justification and what came before as the body
            // repr(last.at("text").find(regex("\(.*\)")))
            if last.at("text").find(regex("\(.*\)")) != none {
              // you can have footnotes in the body, but not in the
              // justifications
              content =  item.body.at("children").slice(0, -1).join()
              justification = last
            } else {
              content = item.body
            }
          } else if last.has("body") {
            content = item.body
          }
          proof-info.push((body: content, justification: justification))
        } else {
          if item.body.has("text") {
            let tinfo = item.body.at("text").split(", ")
            proof-info.push((body: tinfo.first(), justification: []))
          } else {
            proof-info.push((body: item.body, justification: []))
          }
        }
      ]
    }

    // build the cells
    #let cells = ()
    #let count = start - 1 // we begin at 0 by default

    #if caption != none {
      cells.push(
        grid.cell(colspan: 3, align: left)[
          #box(
            inset: (y: 0.3em), 
            // stroke: (bottom: (paint: num-fill, thickness: 0.5pt, dash: "dashed"))
          )[#caption]
        ]
      )
    }
    #for item in proof-info {
      count += 1
      cells.push([#text(fill: num-fill)[#numbering(num, count)]])
      cells.push([#text(fill: body-fill)[#item.body]])
      cells.push([#text(fill: justification-fill)[#text(size: 8.5pt, style: "italic")[#item.justification]]])
    }

    // layout
    #block(width: width)[
      #set grid.cell(inset: 0.3em)
      #grid(
        columns: (2em, ratio.first(), ratio.last()),
        fill: (x, y) => {
          if x == 0 {
            num-bg
          }
        },
        column-gutter: 0.2em,
        align: (right, left, bottom+right),
        ..cells,
      )
    ]
  ]
]

#let fitch-r(body) = {
  h(1fr)
  text(size: 9pt)[(#body)]
}


// #set page(paper: "a6", flipped: true)

// #set grid.cell(stroke: 0.1pt+red.lighten(50%))
// #set par(justify: true)
// #set text(font: "Minion Pro")
// #show math.equation: set text(font: "Libertinus Math")
//
// #block(stroke: 0.5pt+red, inset: 1em, radius: 0.5em, fill: orange.lighten(90%))[
//
// #fitch(width: 60%, caption: [*Proof of $not p or r, r -> s tack.r p -> s$*])[
//   + $not p or r$
//   + $r -> s$
//   + $p$ (ass.)
//   + $r$ (1, 3, ds)
//   + $s$ (2, 4, mp)
//   + $p -> s$ (3, 5, cond.)
//   + (qed)
// ]
//
// This can be continued (here we also change the ratio between body and justification):
//
// #fitch(start: 7, ratio: (20fr, 1fr))[
//   + $x lt (y + 14)$ (x)
//   + #lorem(35)#footnote[#lorem(10)] (a)
//   + This is a premise in an $a$ argument that I care about. (b)
//   + hello ths a#footnote[#lorem(30)] (a)
//   + hello $A would B$ a
// ]
// ]
//
// Numbering can be customized:
//
// #fitch(num: "a)")[
//   + $forall p forall q (p and (q and r))$
//   + $forall p forall q ((p and q) and r)$
// ]
//
// #fitch(width: 100%, num-bg: yellow, num-fill: purple, body-fill: gradient.linear(..color.map.rainbow))[
//   + a kejlak jelkja lkejal kjelkajlkejla
//   + bkj lkejlakej lkjalekj alkje lkajl kelakjel
// ]
//
//
// #block(width: 60%, stroke: 0.5pt+red, inset: 1em, radius: 0.5em, fill: orange.lighten(90%))[
// #grid(
//   columns: (1em, 1em, 1fr, 1fr),
//   align: (right, left, left, right),
//   column-gutter: 0.5em,
//   row-gutter: 0.5em,
//   [1], grid.cell(colspan: 2)[$not p or r$], [],
//   [2], grid.cell(colspan: 2)[$r -> s$], [],
//   [3], grid.cell(rowspan: 3)[
//     #block(height: 3em)[
//       #line(stroke: 0.5pt, start: (100%, 0%), length: 100%, angle: 90deg)
//       #line(stroke: 0.5pt, start: (100%, 0%-3.1em), length: 1.5em)
//     ]
//   ],
//   [$p$], [(ass)],
//   [4], [$r$], [(1, 3, ds)],
//   [5], [$s$], [(2, 4, mp)],
//   [6], grid.cell(colspan: 2)[$p -> s$], [(3, 5, cp)]
// )
// ]
