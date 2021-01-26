//
//  PenroseTriangle.swift
//  Penrose
//
//  Created by Louis Lac on 24/01/2021.
//

import SwiftUI

struct PenroseTriangle: Shape {
    let tile: Tile
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            let cx = rect.width / 2.0
            let cy = rect.height / 2.0
            
            let x1 = cx.addingProduct(CGFloat(tile.a.x), cx)
            let y1 = cy.addingProduct(CGFloat(tile.a.y), cy)
            
            let x2 = cx.addingProduct(CGFloat(tile.b.x), cx)
            let y2 = cy.addingProduct(CGFloat(tile.b.y), cy)

            let x3 = cx.addingProduct(CGFloat(tile.c.x), cx)
            let y3 = cy.addingProduct(CGFloat(tile.c.y), cy)
            
            path.move(to: CGPoint(x: x3, y: y3))
            path.addLine(to: CGPoint(x: x1, y: y1))
            path.addLine(to: CGPoint(x: x2, y: y2))
        }
    }
}

struct PenroseTriangle_Previews: PreviewProvider {
    static let tile: Tile = Tile.wheel()[0]
    
    static var previews: some View {
        Group {
            PenroseTriangle(tile: tile)
                .foregroundColor(.red)
                .overlay(PenroseTriangle(tile: tile).stroke(lineWidth: 4.0))
        }
        .aspectRatio(1.0, contentMode: .fit)
    }
}
