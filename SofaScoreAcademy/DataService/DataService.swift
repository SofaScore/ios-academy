//
//  DataService.swift
//  SofaScoreAcademy
//
//  Created by Matija Kruljac on 24.03.2021..
//

import Foundation

protocol DataService {
    
    func getTeams(completion: @escaping ([Team]) -> Void)
    func getPlayers(for teamId: Int, completion: @escaping ([Player]) -> Void)
    func getPlayerDetails(for playerId: Int, completion: @escaping (Player) -> Void)
}

extension DataService {
    
    func getTeams(completion: @escaping ([Team]) -> Void) {
        print("default implementation")
    }
    
    func getPlayers(for teamId: Int, completion: @escaping ([Player]) -> Void) {
        print("default implementation")
    }
    
    func getPlayerDetails(for playerId: Int, completion: @escaping (Player) -> Void) {
        print("default implementation")
    }
}
