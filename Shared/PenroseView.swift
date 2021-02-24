//
//  PenroseView.swift
//  Penrose
//
//  Created by Louis Lac on 24/01/2021.
//

import SwiftUI

struct PenroseView: View {
    @Binding var tiles: [Tile]
    
    var body: some View {
        ZStack {
            ForEach(tiles, id: \.self) { tile in
                PenroseTriangle(tile: tile)
                    .foregroundColor(color(for: tile))
                    .overlay(PenroseTriangle(tile: tile).stroke())
                    .onTapGesture {
                        tiles += tile.subdivide()
                        tiles.remove(at: tiles.firstIndex(where: { $0 == tile })!)
                    }
            }
        }
        .aspectRatio(1.0, contentMode: .fit)
    }
    
    private func color(for tile: Tile) -> Color {
        switch tile.type {
        case .kite:
            return .red
        case .dart:
            return .orange
        }
    }
}

struct PenroseView_Previews: PreviewProvider {
    static var previews: some View {
        PenroseView(tiles: .constant(.wheel))
    }
}
