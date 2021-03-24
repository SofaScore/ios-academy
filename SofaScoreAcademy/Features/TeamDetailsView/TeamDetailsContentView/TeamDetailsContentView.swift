//
//  TeamDetailsContentView.swift
//  SofaScoreAcademy
//
//  Created by Matija Kruljac on 24.03.2021..
//

import SwiftUI

struct TeamDetailsContentView: View {
    
    private let team: Team
    private let viewModel: TeamDetailsContentViewModel
    
    @State private var showCharts = false
    @State private var showChartsButtonTitle = "Show charts"
    
    var body: some View {
        GeometryReader { reader in
            ScrollView {
                VStack {
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
                            }.padding(EdgeInsets(top: -16, leading: 32, bottom: 32, trailing: 32))
                        }
                        .frame(width: reader.size.width)
                        .background(Color.white)
                    }.background(Color.white)
                    
                    Button(showChartsButtonTitle) {
                        withAnimation {
                            showChartsButtonTitle = showCharts ? "Show charts" : "Hide charts"
                            showCharts.toggle()
                        }
                    }.padding(EdgeInsets(top: 0, leading: 0, bottom: 12, trailing: 0))
                    
                    if showCharts {
                        Text("Players ratio")
                            .font(Font.system(size: 18).bold())
                            .padding(EdgeInsets(top: 24, leading: 0, bottom: 0, trailing: 0))
                        
                        PieChart(data: [viewModel.getPercentageOfForeignPlayers(for: team),
                                        viewModel.getPercentageOfNationalTeamPlayers(for: team)],
                                 labels: ["Foreign players", "National players"],
                                 colors: [.blue, .yellow],
                                 borderColor: .white,
                                 textColor: .black)
                            .frame(height: 200, alignment: .center)
                            .padding(EdgeInsets(top: 24, leading: 0, bottom: 32, trailing: 0))
                        
                        Text("W-L ratio").font(Font.system(size: 18).bold())
                        
                        PieChart(data: [viewModel.getPercentageOfWins(for: team),
                                        viewModel.getPercentageOfLosses(for: team)],
                                 labels: ["Wins", "Loses"],
                                 colors: [.green, .red],
                                 borderColor: .white,
                                 textColor: .black)
                            .frame(height: 200, alignment: .center)
                            .padding(EdgeInsets(top: 12, leading: 0, bottom: 24, trailing: 0))
                    }
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
        }.padding(EdgeInsets(top: 1, leading: 0, bottom: 1, trailing: 0))
    }
    
    init(team: Team, viewMode: TeamDetailsContentViewModel = .init()) {
        self.team = team
        self.viewModel = viewMode
    }
}
