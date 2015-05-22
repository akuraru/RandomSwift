//
//  Check.swift
//  RandomSwift
//
//  Created by akuraru on 2015/05/15.
//  Copyright (c) 2015年 akuraru. All rights reserved.
//

import Foundation

public class ChiSquaredTest {
    
    func observedCounts(counts: [Int], expectedProbabilities: [Double], significanceLevel: Double) -> Bool {
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
        return reduce(Zip2(array, probaby), 0, {(s: Double, t: (Int, Double)) in
            let o = Double(t.0)
            let e = t.1 * allCount
            return s + (o - e) * (o - e) / e
        })
    }
    
    func allCount(array: [Int]) -> Int {
        return array.reduce(0, combine: {$0 + $1})
    }
    func q_chi2(df: Int,chi2:Double) -> Double {
        var s: Double = 0
        var t: Double = 0
        var chi: Double = 0
    
        if (df % 2 == 1) { /* 自由度が奇数 */
            chi = sqrt(chi2)
            if (df == 1) { return 2 * self.q_nor(chi) }
            t = chi * exp(-0.5 * chi2) / sqrt(2 * M_PI)
            s = t
            for (var k = 3; k < df; k += 2) {
                t *= chi2 / Double(k)
                s += t
            }
            return 2 * (self.q_nor(chi) + s)
        } else {      /* 自由度が偶数 */
            t = exp(-0.5 * chi2);
            s = t
            for (var k = 2; k < df; k += 2) {
                t *= chi2 / Double(k)
                s += t
            }
            return s
        }
    }
    func p_nor(z: Double) -> Double {
        var z2 = z * z;
        var t: Double = z * exp(-0.5 * z2) / sqrt(2 * M_PI);
        var p = t
        for (var i = 3; i < 200; i += 2) {
            let prev = p;
            t *= z2 / Double(i);
            p += t;
            if (p == prev) {
                return 0.5 + p
            }
        }
        return (z > 0) ? 1 : 0;
    }
    func q_nor(z: Double) -> Double {
        return 1 - self.p_nor(z)
    }
}
