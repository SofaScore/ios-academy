//
//  Double+Round.swift
//  SofaScoreAcademy
//
//  Created by Matija Kruljac on 17.03.2021..
//

import Foundation

extension Double {
    
    func rounded(to places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
