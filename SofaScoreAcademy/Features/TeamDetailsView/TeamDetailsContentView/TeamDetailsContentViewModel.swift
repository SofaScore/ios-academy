//
//  TeamDetailsContentViewModel.swift
//  SofaScoreAcademy
//
//  Created by Matija Kruljac on 24.03.2021..
//

import Foundation

class TeamDetailsContentViewModel {
    
    func getPercentageOfForeignPlayers(for team: Team) -> Double {
        (Double(team.foreignPlayers) / Double(team.foreignPlayers + team.nationalTeamPlayers))
            .rounded(to: 2)
    }
    
    func getPercentageOfNationalTeamPlayers(for team: Team) -> Double {
        (Double(team.nationalTeamPlayers) / Double(team.foreignPlayers + team.nationalTeamPlayers))
            .rounded(to: 2)
    }
    
    func getPercentageOfWins(for team: Team) -> Double {
        (Double(team.wins) / Double(team.wins + team.losses)).rounded(to: 2)
    }
    
    func getPercentageOfLosses(for team: Team) -> Double {
        (Double(team.losses) / Double(team.wins + team.losses)).rounded(to: 2)
    }
}
