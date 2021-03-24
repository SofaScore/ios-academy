//
//  TeamsDataService.swift
//  SofaScoreAcademy
//
//  Created by Matija Kruljac on 24.03.2021..
//

import Foundation

class TeamsDataService: DataService {
    
    func getTeams(completion: @escaping ([Team]) -> Void) {
        let teams = DataMocker().teams
        completion(teams)
    }
}
