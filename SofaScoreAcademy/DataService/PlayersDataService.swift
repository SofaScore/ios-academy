//
//  PlayersDataService.swift
//  SofaScoreAcademy
//
//  Created by Matija Kruljac on 24.03.2021..
//

import Foundation

class PlayersDataService: DataService {
    
    func getPlayers(for teamId: Int, completion: @escaping ([Player]) -> Void) {
        let players = DataMocker().players
        completion(players)
    }
    
    func getPlayerDetails(for playerId: Int, completion: @escaping (Player) -> Void) {
        
    }
}
