//
//  PlayersDataService.swift
//  SofaScoreAcademy
//
//  Created by Matija Kruljac on 24.03.2021..
//

import Foundation
import Combine

class TeamDetailsDataService: DataService {

    private var cancellable: AnyCancellable?

    func getTeamDetails(for teamId: Int, completion: @escaping (Team, Data) -> Void) {
        guard let url1 = URL(string: "https://kvukusic.dev.sofascore.com/api/v1/team/\(teamId)/details") else { return }
        guard let url2 = URL(string: "https://kvukusic.dev.sofascore.com/api/v1/team/\(teamId)/image") else { return }

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        let publisher1 = URLSession.shared.dataTaskPublisher(for: url1)
            .map { $0.data }
            .decode(type: Team?.self, decoder: decoder)
            .replaceError(with: nil)

        let publisher2 = URLSession.shared.dataTaskPublisher(for: url2)
            .map { $0.data }
            .replaceError(with: nil)

        self.cancellable = Publishers.Zip(publisher1, publisher2)
            .eraseToAnyPublisher()
            .catch { _ in
                Just((nil, nil))
            }
            .sink(receiveValue: { team, imageData in
                if let team = team, let imageData = imageData {
                    DispatchQueue.main.async {
                        completion(team, imageData)
                    }
                }
            })

//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let httpResponse = response as? HTTPURLResponse,
//                  let data = data else { return }
//            print(httpResponse.statusCode)
//            let decoder = JSONDecoder()
//            decoder.keyDecodingStrategy = .convertFromSnakeCase
//            let response = try! decoder.decode(Team.self, from: data)
////            guard let response = try? decoder.decode(Team.self, from: data) else { return }
//            self.downloadImage(id: teamId) {
//                completion(response, $0)
//            }
//        }
//        task.resume()
    }

//    private func downloadImage(id: Int, completion: @escaping ((Data) -> Void)) {
//        guard let url = URL(string: "https://kvukusic.dev.sofascore.com/api/v1/team/\(id)/image") else { return }
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data = data else { return }
//            DispatchQueue.main.async {
//                completion(data)
//            }
//        }
//        task.resume()
//    }
}
