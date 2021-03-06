//
//  Tile.swift
//  Penrose
//
//  Created by Louis Lac on 24/01/2021.
//

import Foundation

enum TileType: Equatable, Hashable {
    case kite  // The small one
    case dart  // The big one
}

struct Tile: Equatable, Hashable {
    let a, b, c: SIMD2<Double>
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
    func subdivide() -> [Tile] {
        flatMap { $0.subdivide() }
    }
}


extension Array where Element == Tile {
    static var wheel: [Tile] {
        (0..<10).map { i in
            var b = polarToRect(1.0, (2.0 * Double(i) - 1.0) * .pi / 10.0)
            var c = polarToRect(1.0, (2.0 * Double(i) + 1.0) * .pi / 10.0)

            if i % 2 == 0 {
                swap(&b, &c)
            }
            
            return Tile(a: .zero, b: b, c: c, type: .kite)
        }
    }
}
