//
//  ImageView.swift
//  SofaScoreAcademy
//
//  Created by Kristian Vukušić on 07/04/2021.
//

import SwiftUI

struct ImageView: View {
    @ObservedObject var imageLoader: ImageLoader
    @State var image: UIImage = UIImage()

    init(withURL url:String) {
        imageLoader = ImageLoader(urlString:url)
    }

    var body: some View {

            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .onReceive(imageLoader.didChange) { data in
                self.image = UIImage(data: data) ?? UIImage()
        }
    }
}
