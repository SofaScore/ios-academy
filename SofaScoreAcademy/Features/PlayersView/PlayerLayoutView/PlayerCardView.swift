//
//  PlayerCardView.swift
//  SofaScoreAcademy
//
//  Created by Matija Kruljac on 05.03.2021..
//

import SwiftUI

struct PlayerCardView: View {

    private let player: Player
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image("\(player.image)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .overlay(Rectangle().stroke(Color.white, lineWidth: 1))
            Text("\(player.name)")
                .font(Font.system(size: 18).bold())
                .foregroundColor(Color.black)
                .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
            VStack(alignment: .leading, spacing: 4) {
                getFormattedText(for: "Nationality: ", with: "\(player.nationality)")
                getFormattedText(for: "Date of birth: ", with: "\(player.dateOfBirth)")
                getFormattedText(for: "Height: ", with: "\(player.height)")
                getFormattedText(for: "Preffered foot: ", with: "\(player.preferredFoot)")
            }.padding(EdgeInsets(top: 4, leading: 16, bottom: 32, trailing: 16))
        }
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: Color.gray.opacity(0.15), radius: 4, x: 0, y: 2)
    }
    
    init(player: Player) {
        self.player = player
    }
    
    func getFormattedText(for placeholder: String, with value: String) -> Text {
        Text("\(placeholder)").font(Font.system(size: 11))
            .foregroundColor(Color.secondaryText)
            + Text("\(value)").font(Font.system(size: 11).bold())
            .foregroundColor(Color.secondaryText)
    }
}

struct PlayerRow_Preview: PreviewProvider {
    static var previews: some View {
        let team = Player(id: 0,
                          image: "messi",
                          name: "Lionel Messi",
                          nationality: "CRO",
                          dateOfBirth: "23.4.1234.",
                          height: 188,
                          preferredFoot: "Left",
                          position: "C",
                          shirtNumber: 5)
        return PlayerCardView(player: team)
    }
}
