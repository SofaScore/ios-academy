//
//  Team.swift
//  SofaScoreAcademy
//
//  Created by Matija Kruljac on 07.03.2021..
//

import Foundation

struct Team: Identifiable, Decodable {
    
    let id: Int
    let image: String
    let name: String
    let foreignPlayers: Int
    let nationalTeamPlayers: Int
    let wins: Int
    let losses: Int
    let tournaments: [String]
    let coachName: String
    let foundationDate: String
    let country: String
    let players: [Player]
}
