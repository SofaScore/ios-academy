//
//  TeamsViewModel.swift
//  SofaScoreAcademy
//
//  Created by Matija Kruljac on 05.03.2021..
//

import Foundation

class TeamsViewModel: ObservableObject {
    
    @Published var teams = [Team]()
    
    private let dataService: DataService
    
    init(dataService: DataService = TeamsDataService()) {
        self.dataService = dataService
    }
    
    func getTeams() {
        dataService.getTeams { [self] teams in
            self.teams = teams
        }
    }
}
