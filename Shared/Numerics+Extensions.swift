//
//  Numerics+Extensions.swift
//  Penrose
//
//  Created by Louis Lac on 24/01/2021.
//

import Foundation
import SwiftUI

extension Double {
    static var goldenRatio: Double { (1.0 + sqrt(5.0)) / 2.0 }
}

func polarToRect(_ r: Double, _ theta: Double) -> SIMD2<Double> {
    return SIMD2<Double>(r * cos(theta), r*sin(theta))
}
