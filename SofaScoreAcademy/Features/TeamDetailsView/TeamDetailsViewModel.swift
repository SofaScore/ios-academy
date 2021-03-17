//
//  TeamDetailsViewModel.swift
//  SofaScoreAcademy
//
//  Created by Matija Kruljac on 05.03.2021..
//

import Foundation

class TeamDetailsViewModel {
    
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
    
    func getPlayers() -> [Player] {
        [Player(id: 0,
                image: "messi",
                name: "Lionel Messi",
                nationality: "CRO",
                dateOfBirth: "23.4.1234.",
                height: 188,
                preferredFoot: "Left",
                position: "C",
                shirtNumber: 5),
         Player(id: 1,
                image: "ronaldo",
                name: "Cristiano Ronaldo",
                nationality: "CRO",
                dateOfBirth: "23.4.1234.",
                height: 188,
                preferredFoot: "Left",
                position: "C",
                shirtNumber: 5),
         Player(id: 2,
                image: "ibrahimovic",
                name: "Zlatan Ibrahimovic",
                nationality: "CRO",
                dateOfBirth: "23.4.1234.",
                height: 188,
                preferredFoot: "Left",
                position: "C",
                shirtNumber: 5),
         Player(id: 3,
                image: "messi",
                name: "Lionel Messi",
                nationality: "CRO",
                dateOfBirth: "23.4.1234.",
                height: 188,
                preferredFoot: "Left",
                position: "C",
                shirtNumber: 5),
         Player(id: 4,
                image: "ronaldo",
                name: "Cristiano Ronaldo",
                nationality: "CRO",
                dateOfBirth: "23.4.1234.",
                height: 188,
                preferredFoot: "Left",
                position: "C",
                shirtNumber: 5),
         Player(id: 5,
                image: "ibrahimovic",
                name: "Zlatan Ibrahimovic",
                nationality: "CRO",
                dateOfBirth: "23.4.1234.",
                height: 188,
                preferredFoot: "Left",
                position: "C",
                shirtNumber: 5),
         Player(id: 6,
                image: "messi",
                name: "Lionel Messi",
                nationality: "CRO",
                dateOfBirth: "23.4.1234.",
                height: 188,
                preferredFoot: "Left",
                position: "C",
                shirtNumber: 5),
         Player(id: 7,
                image: "ronaldo",
                name: "Cristiano Ronaldo",
                nationality: "CRO",
                dateOfBirth: "23.4.1234.",
                height: 188,
                preferredFoot: "Left",
                position: "C",
                shirtNumber: 5),
         Player(id: 8,
                image: "ibrahimovic",
                name: "Zlatan Ibrahimovic",
                nationality: "CRO",
                dateOfBirth: "23.4.1234.",
                height: 188,
                preferredFoot: "Left",
                position: "C",
                shirtNumber: 5),
         Player(id: 9,
                image: "messi",
                name: "Lionel Messi",
                nationality: "CRO",
                dateOfBirth: "23.4.1234.",
                height: 188,
                preferredFoot: "Left",
                position: "C",
                shirtNumber: 5),
         Player(id: 10,
                image: "ronaldo",
                name: "Cristiano Ronaldo",
                nationality: "CRO",
                dateOfBirth: "23.4.1234.",
                height: 188,
                preferredFoot: "Left",
                position: "C",
                shirtNumber: 5),
         Player(id: 11,
                image: "ibrahimovic",
                name: "Zlatan Ibrahimovic",
                nationality: "CRO",
                dateOfBirth: "23.4.1234.",
                height: 188,
                preferredFoot: "Left",
                position: "C",
                shirtNumber: 5)
        ]
    }
}
