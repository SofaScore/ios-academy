//
//  TeamsDataService.swift
//  SofaScoreAcademy
//
//  Created by Matija Kruljac on 24.03.2021..
//

import Foundation

class TeamsDataService: DataService {
    
    func getTeams(completion: @escaping ([Team]) -> Void) {
        guard let url = URL(string: "https://kvukusic.dev.sofascore.com/api/v1/team/list?1") else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse,
                  let data = data else { return }
            print(httpResponse.statusCode)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let response = try! decoder.decode([Team].self, from: data)
//            guard let response = try? decoder.decode(Team.self, from: data) else { return }
            completion(response)
        }
        task.resume()
    }
}
