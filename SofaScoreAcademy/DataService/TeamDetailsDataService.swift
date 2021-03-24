//
//  PlayersDataService.swift
//  SofaScoreAcademy
//
//  Created by Matija Kruljac on 24.03.2021..
//

import Foundation

class TeamDetailsDataService: DataService {
    
    func getTeamDetails(for teamId: Int, completion: @escaping (Team) -> Void) {
        guard let team = DataMocker().teams.first(where: { $0.id == teamId }) else {
            return
        }
        completion(team)
    }
}
