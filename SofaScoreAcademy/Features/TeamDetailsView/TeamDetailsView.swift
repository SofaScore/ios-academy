//
//  TeamDetailsView.swift
//  SofaScoreAcademy
//
//  Created by Matija Kruljac on 05.03.2021..
//

import SwiftUI

struct TeamDetailsView: View {
    
    private let teamId: Int
    
    @StateObject private var viewModel: TeamDetailsViewModel
    
    var body: some View {
        getView().onAppear(perform: {
            viewModel.getTeamDetails(for: teamId)
        })
    }
    
    init(teamId: Int, viewModel: TeamDetailsViewModel = .init()) {
        self.teamId = teamId
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    @ViewBuilder
    func getView() -> some View {
        if let team = viewModel.team {
            TeamDetailsContentView(team: team)
        } else {
            Text("There is no data for this team.")
        }
    }
}

struct PlayerListView_Preview: PreviewProvider {
    static var previews: some View {
        TeamDetailsView(teamId: DataMocker().teams.first!.id,
                        viewModel: TeamDetailsViewModel())
    }
}
