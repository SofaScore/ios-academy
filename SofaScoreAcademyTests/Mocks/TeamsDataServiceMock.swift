//
//  TeamsDataServiceMockl.swift
//  SofaScoreAcademyTests
//
//  Created by Matija Kruljac on 24.03.2021..
//

import Foundation
@testable import SofaScoreAcademy

class TeamsDataServiceMock: TeamsDataService {
    
    override func getTeams(completion: @escaping ([Team]) -> Void) {
        completion([Team(id: 1,
                         image: "testImage",
                         name: "testName",
                         foreignPlayers: 5,
                         nationalTeamPlayers: 6,
                         wins: 10,
                         losses: 10,
                         tournaments: ["League 1", "League "],
                         coachName: "testCoach",
                         foundationDate: "3.3.2000.",
                         country: "CRO",
                         players: [])])
    }
}
