//
//  TeamsGridView.swift
//  SofaScoreAcademy
//
//  Created by Matija Kruljac on 24.03.2021..
//

import SwiftUI

enum LayoutType {
    
    case list, grid
    
    var numberOfColumns: Int {
        switch self {
        case .list:
            return 1
        case .grid:
            return 2
        }
    }
}

struct TeamsGridView: View {
    
    private let teams: [Team]
    private let layoutType: LayoutType
    
    private var columns: [GridItem] {
        Array(repeating: GridItem(.flexible(), spacing: 20, alignment: .center),
              count: layoutType.numberOfColumns)
    }
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(teams, id: \.id) { team in
                if layoutType == .list {
                    NavigationLink(
                        destination: TeamDetailsView(teamId: team.id)) {
                        TeamRowView(team: team)
                    }
                } else {
                    NavigationLink(
                        destination: TeamDetailsView(teamId: team.id)) {
                        TeamTileView(team: team)
                    }
                }
            }
        }.padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
    }
    
    init(teams: [Team], layoutType: LayoutType) {
        self.teams = teams
        self.layoutType = layoutType
    }
}
