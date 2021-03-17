//
//  PieSliceText.swift
//  SofaScoreAcademy
//
//  Created by Matija Kruljac on 17.03.2021..
//

import SwiftUI

struct PieSliceText: View {
    
    let title: String
    let description: String
    let textColor: Color
    
    var body: some View {
        VStack {
            Text(title)
                .font(Font.system(size: 14))
                .foregroundColor(textColor)
            Text(description)
                .font(Font.system(size: 11))
                .foregroundColor(textColor)
        }
    }
}
