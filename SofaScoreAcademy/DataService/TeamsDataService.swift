//
//  TeamsDataService.swift
//  SofaScoreAcademy
//
//  Created by Matija Kruljac on 24.03.2021..
//

import Foundation
import Combine

class TeamsDataService: DataService {

    private var cancellable: AnyCancellable?

    func getTeams(completion: @escaping ([Team]) -> Void) {
        guard let url = URL(string: "https://kvukusic.dev.sofascore.com/api/v1/team/list?1") else { return }
        var request = URLRequest(url: url)
//        request.cachePolicy = .useProtocolCachePolicy
//        request.cachePolicy = .returnCacheDataDontLoad
//        request.cachePolicy = .returnCacheDataElseLoad
        request.cachePolicy = .reloadIgnoringLocalCacheData

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        self.cancellable = URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: [Team].self, decoder: decoder)
            .replaceError(with: [])
            .eraseToAnyPublisher()
            .sink { teams in
                DispatchQueue.main.async {
                    completion(teams)
                }
            }

//        cancellable?.cancel()
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let httpResponse = response as? HTTPURLResponse,
//                  let data = data else { return }
//            let headers = httpResponse.allHeaderFields
//            let cacheControl = headers["Cache-Control"] ?? "-"
//            print("team/list?1 -----> \(httpResponse.statusCode) - \(cacheControl)")
//            let decoder = JSONDecoder()
//            decoder.keyDecodingStrategy = .convertFromSnakeCase
//            let response = try! decoder.decode([Team].self, from: data)
////            guard let response = try? decoder.decode(Team.self, from: data) else { return }
//            completion(response)
//        }
//        task.resume()


    }
}
