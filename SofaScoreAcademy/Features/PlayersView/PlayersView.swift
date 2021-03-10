//
//  PlayersView.swift
//  SofaScoreAcademy
//
//  Created by Matija Kruljac on 05.03.2021..
//

import SwiftUI

struct PlayersView: View {
    
    private let team: Team
    
    private var columns: [GridItem] {
        Array(repeating: GridItem(.flexible(), spacing: 0, alignment: .center),
              count: 1)
    }
    
    var body: some View {
        VStack {
            Text("\(team.name)")
                .font(Font.system(size: 32).bold())
                .foregroundColor(Color.black)
                .padding(.vertical, 72)
            GeometryReader { fullView in
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: columns) {
                        ForEach(team.players, id: \.id) { player in
                            NavigationLink(
                                destination: PlayerDetailsView(player: player)) {
                                    PlayerCardView(player: player)
                                        .frame(width: 250, height: 350)
                                        .padding(.horizontal, 50)
                                }
                            }
                    }
                    .padding(EdgeInsets(top: -144,
                                        leading: (fullView.size.width - 350) / 2,
                                        bottom: 0,
                                        trailing: 0))
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                    ToolbarItem(placement: .principal) {
                        Image("\(team.image)")
                            .resizable()
                            .frame(width: 32, height: 32)
                    }
                })
                .onTapGesture {
                    print("TAP")
                }
            }
        }.background(Color.background)
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
