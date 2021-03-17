//
//  TeamRowView.swift
//  SofaScoreAcademy
//
//  Created by Matija Kruljac on 08.03.2021..
//

import SwiftUI

struct TeamRowView: View {
    
    private let team: Team
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .center, spacing: 16) {
                CircleImage(imageName: "\(team.image)")
                    .frame(width: 40, height: 40)
                VStack(alignment: .leading, spacing: 4) {
                    Text("\(team.name)")
                        .font(Font.system(size: 15))
                        .foregroundColor(Color.black)
                    Text("\(team.country)")
                        .font(Font.system(size: 11))
                        .foregroundColor(Color.secondaryText)
                }
                VStack(alignment: .leading, spacing: 4) {
                    getFormattedText(for: "Coach: ", with: "\(team.coachName)")
                    getFormattedText(for: "Foundation date: ", with: "\(team.foundationDate)")
                }
            }
        }
        .frame(minWidth: 0,
               maxWidth: .infinity,
               minHeight: 0,
               maxHeight: .infinity,
               alignment: .leading)
        .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: Color.gray.opacity(0.15), radius: 4, x: 0, y: 2)
    }
    
    init(team: Team) {
        self.team = team
    }
    
    func getFormattedText(for placeholder: String, with value: String) -> Text {
        Text("\(placeholder)").font(Font.system(size: 11))
            .foregroundColor(Color.secondaryText)
            + Text("\(value)").font(Font.system(size: 11).bold())
            .foregroundColor(Color.secondaryText)
    }
}

struct TeamRowView_Preview: PreviewProvider {
    static var previews: some View {
        let team = Team(id: 0,
                        image: "bayern",
                        name: "Bayern",
                        foreignPlayers: 5,
                        nationalTeamPlayers: 5,
                        wins: 10,
                        losses: 15,
                        tournaments: ["1. league", "2. league"],
                        coachName: "Jose Mourinho",
                        foundationDate: "3.4.1899.",
                        country: "Croatia",
                        players: [])
        TeamRowView(team: team)
    }
}
