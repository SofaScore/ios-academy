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
                    .font(Font.system(size: 32).bold())
                    .foregroundColor(Color.black)
                HStack(alignment: .top, spacing: 30) {
                    ForEach(team.players, id: \.id) { player in
                        PlayerCardView(player: player)
                            .frame(width: 250, height: 400)
                    }
                }
                .modifier(ScrollingHStackModifier(items: team.players.count, itemWidth: 250, itemSpacing: 30))
                .frame(width: reader.size.width, height: reader.size.height - 200)
                .onDisappear {
                    
                }
            }
            .frame(width: reader.size.width, height: reader.size.height, alignment: .center)
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
