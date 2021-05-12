//
//  TeamDetailsViewModel.swift
//  SofaScoreAcademy
//
//  Created by Matija Kruljac on 05.03.2021..
//

import Foundation

class TeamDetailsViewModel: ObservableObject {
    
    @Published var team: Team?
    @Published var teamImage: Data?
    @Published var events: [Event]?
    
    private let dataService: DataService
    
    init(dataservice: DataService = TeamDetailsDataService()) {
        self.dataService = dataservice
    }
    
    func getTeamDetails(for teamId: Int) {
        dataService.getTeamDetails(for: teamId) { (team, teamImage) in
            self.team = team
            self.teamImage = teamImage
        }
    }

    func getTeamEvents(for teamId: Int) {
        dataService.getTeamEvents(for: teamId) { events in
            self.events = events
        }
    }
}
