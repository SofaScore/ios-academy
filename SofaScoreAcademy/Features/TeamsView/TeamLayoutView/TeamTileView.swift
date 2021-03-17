//
//  TeamTileView.swift
//  SofaScoreAcademy
//
//  Created by Matija Kruljac on 05.03.2021..
//

import SwiftUI

struct TeamTileView: View {
    
    private let team: Team
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .center, spacing: 8) {
                Image("\(team.image)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                Text("\(team.name)")
                    .font(Font.system(size: 15).bold())
                    .foregroundColor(Color.black)
            }.padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
            VStack(alignment: .leading, spacing: 4) {
                getFormattedText(for: "Coach: ", with: "\(team.coachName)")
                getFormattedText(for: "Country: ", with: "\(team.country)")
                getFormattedText(for: "Tournament: ", with: "\(team.tournaments.first ?? "")")
                getFormattedText(for: "Total players: ", with: "\(team.players.count)")
            }
        }
        .frame(minWidth: 0,
               maxWidth: .infinity,
               minHeight: 0,
               maxHeight: .infinity,
               alignment: .leading)
        .padding(EdgeInsets(top: 16, leading: 12, bottom: 24, trailing: 12))
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: Color.gray.opacity(0.15), radius: 4, x: 0, y: 2)
        //        .overlay(
        //            RoundedRectangle(cornerRadius: 8)
        //              .stroke(Color.blue, lineWidth: 2) // --> to add border
        //        )
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

struct TeamTileView_Preview: PreviewProvider {
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
        TeamTileView(team: team)
    }
}
