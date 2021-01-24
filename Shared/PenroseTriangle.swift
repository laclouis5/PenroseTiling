//
//  PenroseTriangle.swift
//  Penrose
//
//  Created by Louis Lac on 24/01/2021.
//

import SwiftUI
import Numerics

struct PenroseTriangle: Shape {
    let tile: Tile
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            let height = rect.height
            let width = rect.width
            
            let cx = width / 2.0
            let cy = height / 2.0
            
            let x1 = cx.addingProduct(CGFloat(tile.a.real), cx)
            let y1 = cy.addingProduct(CGFloat(tile.a.imaginary), cy)
            
            path.move(to: CGPoint(x: x1, y: y1))
            
            let x2 = cx.addingProduct(CGFloat(tile.b.real), cx)
            let y2 = cy.addingProduct(CGFloat(tile.b.imaginary), cy)
            
            path.addLine(to: CGPoint(x: x2, y: y2))
            
            let x3 = cx.addingProduct(CGFloat(tile.c.real), cx)
            let y3 = cy.addingProduct(CGFloat(tile.c.imaginary), cy)
            
            path.addLine(to: CGPoint(x: x3, y: y3))
            
            path.closeSubpath()
        }
    }
}

struct PenroseTriangle_Previews: PreviewProvider {
    static var previews: some View {
        PenroseTriangle(tile: Tile.wheel()[0])
            .aspectRatio(1.0, contentMode: .fit)
    }
}
