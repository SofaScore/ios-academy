//
//  PlayersView.swift
//  SofaScoreAcademy
//
//  Created by Matija Kruljac on 05.03.2021..
//

import SwiftUI

struct PlayersView: View {
    
    private let team: Team
    
    var body: some View {
        GeometryReader { reader in
            VStack {
                Text("\(team.name)")
                    .padding(EdgeInsets(top: 32, leading: -160, bottom: 0, trailing: 0))
                    .font(Font.system(size: 32).bold())
                    .foregroundColor(Color.black)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 32) {
                        ForEach(team.players, id: \.id) { player in
                            NavigationLink(destination: PlayerDetailsView(player: player)) {
                                PlayerCardView(player: player)
                                    .frame(width: 250, height: 400)
                            }
                        }
                    }
                    .padding(EdgeInsets(top: -16, leading: 32, bottom: 32, trailing: 32))
                }
                .frame(width: reader.size.width)
                .background(Color.white)
            }
            .background(Color.white)
        }
        .background(Color.background)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(content: {
            ToolbarItem(placement: .principal) {
                Image("\(team.image)")
                    .resizable()
                    .frame(width: 32, height: 32)
            }
        })
    }
    
    init(team: Team) {
        self.team = team
    }
}

struct PlayerListView_Preview: PreviewProvider {
    static var previews: some View {
        let team = TeamsViewModel().getTeams().first!
        return PlayersView(team: team)
    }
}
