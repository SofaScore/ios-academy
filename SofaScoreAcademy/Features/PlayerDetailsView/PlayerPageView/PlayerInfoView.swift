//
//  PlayerInfoView.swift
//  SofaScoreAcademy
//
//  Created by Matija Kruljac on 09.03.2021..
//

import SwiftUI

struct PlayerInfoView: View {
    
    @State private var angle: Double = 0
    @State private var scale: CGFloat = 1
    
    var body: some View {
        VStack(spacing: 40) {
            Rectangle()
                .fill(Color.black)
                .frame(width: 100, height: 100)
                .rotationEffect(.degrees(angle))
                .animation(.easeIn)
                .onTapGesture {
                    angle += 30
                }
            
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.red)
                .frame(width: 100, height: 100)
                .scaleEffect(scale)
                .animation(.easeOut)
                .onTapGesture {
                    scale += 0.1
                }
            
            Capsule()
                .fill(Color.green)
                .frame(width: 100, height: 50)
            
            Ellipse()
                .fill(Color.blue)
                .frame(width: 100, height: 50)
            
            Circle()
                .fill(Color.yellow)
                .frame(width: 100, height: 50)
        }
    }
}
