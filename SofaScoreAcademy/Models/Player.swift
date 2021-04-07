//
//  Player.swift
//  SofaScoreAcademy
//
//  Created by Matija Kruljac on 08.03.2021..
//

import Foundation

struct Player: Identifiable, Decodable {
    
    let id: Int
    let image: String
    let name: String
    let nationality: String
    let dateOfBirth: String
    let height: Double
    let preferredFoot: String?
    let position: String?
    let shirtNumber: Int
}
