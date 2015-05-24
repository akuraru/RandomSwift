//
//  Check.swift
//  RandomSwift
//
//  Created by akuraru on 2015/05/15.
//  Copyright (c) 2015年 akuraru. All rights reserved.
//

import Foundation

public class ChiSquaredTest {
    public func observedCounts(counts: [Int], expectedProbabilities: [Double], significanceLevel: Double) -> Bool {
        let degreesOfFreedom = counts.count - 1
        if ((degreesOfFreedom + 1) != expectedProbabilities.count) {
            assertionFailure("Is not same count \(degreesOfFreedom + 1) ans \(expectedProbabilities.count)")
        }
        let chiSquare = self.chiSquare(counts, probaby: expectedProbabilities)
        let upperLimitOfChiSquareValue = self.q_chi2(degreesOfFreedom, chi2: chiSquare)
        return significanceLevel <= upperLimitOfChiSquareValue
    }
    func chiSquare(array: [Int], probaby: [Double]) -> Double {
        let allCount = Double(self.allCount(array))
        let a = array.map({Double($0)})
        let p = probaby.map({$0 * allCount})
        return reduce(Zip2(a, p), 0, {(s: Double, t: (Double, Double)) in
            return s + (t.0 - t.1) * (t.0 - t.1) / t.1
        })
    }
    
    func allCount(array: [Int]) -> Int {
        return array.reduce(0, combine: {$0 + $1})
    }
    func q_chi2(df: Int,chi2:Double) -> Double {
        if (df == 0) {
            return exp(-0.5 * chi2)
        } else if (df == 1) {
            let chi = sqrt(chi2)
            return 2 * self.q_nor(chi)
        } else if (df % 2 == 1) { /* 自由度が奇数 */
            let chi = sqrt(chi2)
            let t: Double = chi * exp(-0.5 * chi2) / sqrt(2 * M_PI)
            let sequence = filter((3...df), { $0%2 == 0})
            let d = reduce(sequence, (t, t), {(tu: (Double, Double), s: Int) in
                let t = tu.0 * chi2 / Double(s)
                return (t, t + tu.1)
            })
            return 2 * (self.q_nor(chi) + d.1)
        } else {      /* 自由度が偶数 */
            var t = exp(-0.5 * chi2)
            let sequence = filter((2...df), { $0%2 == 1})
            let d = reduce(sequence, (t, t), {(tu: (Double, Double), s: Int) in
                let t = tu.0 * chi2 / Double(s)
                return (t, t + tu.1)
            })
            return d.1
        }
    }
    func p_nor(z: Double) -> Double {
        var z2 = z * z
        var t: Double = z * exp(-0.5 * z2) / sqrt(2 * M_PI)
        var p = t
        for (var i = 3; i < 200; i += 2) {
            let prev = p
            t *= z2 / Double(i)
            p += t
            if (p == prev) {
                return 0.5 + p
            }
        }
        return (z > 0) ? 1 : 0
    }
    func q_nor(z: Double) -> Double {
        return 1 - self.p_nor(z)
    }
}
