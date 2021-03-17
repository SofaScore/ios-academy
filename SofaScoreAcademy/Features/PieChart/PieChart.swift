//
//  PieChart.swift
//  SofaScoreAcademy
//
//  Created by Matija Kruljac on 17.03.2021..
//

import SwiftUI

struct PieChart: View {
    
    private let data: [Double]
    private let labels: [String]
    private let colors: [Color]
    private let borderColor: Color
    private let textColor: Color
    
    private let sliceOffset: Double = -.pi / 2 // pie chart initial angle start/rotation
    
    var body: some View {
        GeometryReader { reader in
            ZStack(alignment: .center) {
                ForEach(0 ..< data.count) { index in
                    PieSlice(startAngle: getStartAngle(for: index), endAngle: getEndAngle(for: index))
                        .fill(colors[index % colors.count])
                    
                    PieSlice(startAngle: getStartAngle(for: index), endAngle: getEndAngle(for: index))
                        .stroke(borderColor, lineWidth: 1)
                    
                    PieSliceText(
                        title: "\(labels[index])",
                        description: "\(data[index])",
                        textColor: textColor
                    )
                    .offset(getTextOffset(for: index, in: reader.size))
                    .zIndex(1) // front to back ordering
                }
            }
        }
    }
    
    init(data: [Double],
         labels: [String],
         colors: [Color],
         borderColor: Color,
         textColor: Color) {
        self.data = data
        self.labels = labels
        self.colors = colors
        self.borderColor = borderColor
        self.textColor = textColor
    }
}

// MARK: - Private methods
private extension PieChart {
    
    func getStartAngle(for index: Int) -> Double {
        switch index {
        case 0:
            return sliceOffset
        default:
            let ratio: Double = data[..<index].reduce(0.0, +) / data.reduce(0.0, +)
            return sliceOffset + 2 * .pi * ratio
        }
    }
    
    func getEndAngle(for index: Int) -> Double {
        switch index {
        case data.count - 1:
            return sliceOffset + 2 * .pi
        default:
            let ratio: Double = data[..<(index + 1)].reduce(0.0, +) / data.reduce(0.0, +)
            return sliceOffset + 2 * .pi * ratio
        }
    }
    
    func getTextOffset(for index: Int, in size: CGSize) -> CGSize {
        let radius = min(size.width, size.height) / 3
        let dataRatio = (2 * data[..<index].reduce(0, +) + data[index]) / (2 * data.reduce(0, +))
        let angle = CGFloat(sliceOffset + 2 * .pi * dataRatio)
        
        return CGSize(width: radius * cos(angle), height: radius * sin(angle))
    }
}
