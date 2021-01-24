//
//  Tile.swift
//  Penrose
//
//  Created by Louis Lac on 24/01/2021.
//

import Foundation
import Numerics

enum TileType: Hashable {
    case kite  // The small one
    case dart  // The big one
}

struct Tile: Hashable, Equatable {
    let a, b, c: Complex<Double>
    let type: TileType
}

extension Tile {
    func subdivide() -> [Tile] {
        switch type {
        case .kite:
            let p = a + (b - a) / .goldenRatio
            return [
                Tile(a: c, b: p, c: b, type: .kite),
                Tile(a: p, b: c, c: a, type: .dart),
            ]
        case .dart:
            let q = b + (a - b) / .goldenRatio
            let r = b + (c - b) / .goldenRatio
            return [
                Tile(a: r, b: c, c: a, type: .dart),
                Tile(a: q, b: r, c: b, type: .dart),
                Tile(a: r, b: q, c: a, type: .kite),
            ]
        }
    }
}

extension Array where Element == Tile {
    func subdivide() -> Self {
        reduce(into: []) { $0 += $1.subdivide() }
    }
}


extension Tile {
    static func wheel(revolutions: Int = 6) -> [Self] {
        precondition(revolutions > 0, "Number of revolutions must be greater than 0")
        
        return (0..<revolutions).map { i in
            var b = polarToRect(1.0, (2.0 * Double(i) - 1.0) * .pi / Double(revolutions))
            var c = polarToRect(1.0, (2.0 * Double(i) + 1.0) * .pi / Double(revolutions))

            if i % 2 == 0 {
                swap(&b, &c)
            }
            
            return Tile(a: .zero, b: b, c: c, type: .kite)
        }
    }
}
