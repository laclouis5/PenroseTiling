//
//  Numerics+Extensions.swift
//  Penrose
//
//  Created by Louis Lac on 24/01/2021.
//

import Foundation
import Numerics

extension Double {
    static var goldenRatio: Double { (1.0 + sqrt(5.0)) / 2.0 }
}

extension Complex where RealType == Double {
    static var goldenRatio: Self { Complex(.goldenRatio) }
}

func polarToRect(_ r: Double, _ theta: Double) -> Complex<Double> {
    Complex(r) * Complex(cos(theta), sin(theta))
}
