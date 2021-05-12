//
//  DataService.swift
//  SofaScoreAcademy
//
//  Created by Matija Kruljac on 24.03.2021..
//

import Foundation

protocol DataService {
    
    func getTeams(completion: @escaping ([Team]) -> Void)
    func getTeamDetails(for teamId: Int, completion: @escaping (Team, Data) -> Void)
    func getTeamEvents(for teamId: Int, completion: @escaping ([Event]) -> Void)
    func getPlayerDetails(for playerId: Int, completion: @escaping (Player) -> Void)
}

extension DataService {
    
    func getTeams(completion: @escaping ([Team]) -> Void) {
        print("default implementation")
    }
    
    func getTeamDetails(for teamId: Int, completion: @escaping (Team, Data) -> Void) {
        print("default implementation")
    }

    func getTeamEvents(for teamId: Int, completion: @escaping ([Event]) -> Void) {
        print("default implementation")
    }
    
    func getPlayerDetails(for playerId: Int, completion: @escaping (Player) -> Void) {
        print("default implementation")
    }
}
