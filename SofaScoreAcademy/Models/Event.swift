//
//  Event.swift
//  SofaScoreAcademy
//
//  Created by Kristian Vukušić on 12/05/2021.
//

import Foundation

struct Event: Codable {

    let id: Int
    let homeTeamName: String
    let awayTeamName: String
    let startTimestamp: Int
}
