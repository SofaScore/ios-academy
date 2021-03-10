//
//  PlayerDetailsView.swift
//  SofaScoreAcademy
//
//  Created by Matija Kruljac on 09.03.2021..
//

import SwiftUI

struct PlayerDetailsView: View {
    
    let player: Player
    
    @State private var selectedTab = 0
    
    var body: some View {
        GeometryReader { reader in
            VStack {
                HStack {
                    Text("Info")
                        .font(Font.system(size: 16).bold())
                        .foregroundColor(
                            selectedTab == 0 ? .red : .black
                        )
                        .onTapGesture {
                            selectedTab = 0
                        }
                        .frame(width: reader.size.width / 2, height: 24)
                        .tag(0)
                    Rectangle()
                        .fill(Color(red: 0.3, green: 0.3, blue: 0.3, opacity: 0.7))
                        .frame(width: 1, height: 24, alignment: .center)
                    Text("Statistics")
                        .font(Font.system(size: 16).bold())
                        .foregroundColor(
                            selectedTab == 1 ? .red : .black
                        )
                        .onTapGesture {
                            selectedTab = 1
                        }
                        .frame(width: reader.size.width / 2, height: 24)
                        .tag(1)
                }.padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
                Rectangle()
                    .fill(Color(red: 0.3, green: 0.3, blue: 0.3, opacity: 0.7))
                    .frame(width: reader.size.width, height: 1, alignment: .center)
                    .padding(EdgeInsets(top: 0, leading: -16, bottom: 0, trailing: 0))
                TabView(selection: $selectedTab) {
                    PlayerInfoView().tag(0)
                    PlayerStatisticsView().tag(1)
                }
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                .tabViewStyle(PageTabViewStyle())
                .animation(.easeIn)
            }
        }
        .toolbar(content: {
            ToolbarItem(placement: .principal) {
                Text("\(player.name)")
            }
        })
    }
    
    init(player: Player) {
        self.player = player
    }
}
