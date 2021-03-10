//
//  CircleImage.swift
//  SofaScoreAcademy
//
//  Created by Matija Kruljac on 08.03.2021..
//

import SwiftUI

struct CircleImage: View {
    
    private let imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .shadow(radius: 2)
            .overlay(Circle().stroke(Color.background, lineWidth: 1))
    }
    
    init(imageName: String) {
        self.imageName = imageName
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(imageName: "bayern")
    }
}
