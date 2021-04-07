//
//  CircleImage.swift
//  SofaScoreAcademy
//
//  Created by Matija Kruljac on 08.03.2021..
//

import SwiftUI

struct CircleImage: View {
    
    private let imageUrl: String
    
    var body: some View {
        ImageView(withURL: imageUrl)
            .frame(width: 40, height: 40)
            .clipShape(Circle())
            .shadow(radius: 2)
            .overlay(Circle().stroke(Color.background, lineWidth: 1))
    }
    
    init(imageUrl: String) {
        self.imageUrl = imageUrl
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(imageUrl: "bayern")
    }
}
