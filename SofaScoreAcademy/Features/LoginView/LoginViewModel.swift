//
//  LoginViewModel.swift
//  SofaScoreAcademy
//
//  Created by Kristian Vukušić on 05/05/2021.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {

    static let shared = LoginViewModel()

    private static let loggedInKey = "LoggedInKey"

    @Published var isLoggedIn: Bool
    @Published var isLoggingIn: Bool = false
    @Published var errorMessage: String?

    private var cancellable: AnyCancellable?

    init() {
        isLoggedIn = UserDefaults().bool(forKey: Self.loggedInKey)
        isLoggedIn = true
    }

    func login(username: String, password: String) {
        isLoggingIn = true

        guard let url = URL(string: "https://kvukusic.dev.sofascore.com/api/v1/user/login") else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: ["username": username, "password": password], options: []) else {
            return
        }
        urlRequest.httpBody = httpBody

        self.cancellable = URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map { $0.data }
            .decode(type: LoginResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
            .sink(receiveCompletion: { _ in },
                  receiveValue: { response in
                    DispatchQueue.main.async {
                        self.errorMessage = response.errorMessage
                        self.isLoggingIn = false
                        UserDefaults().setValue(response.success, forKey: Self.loggedInKey)
                        self.isLoggedIn = response.success
                    }
                  })

//        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
//            guard let httpResponse = response as? HTTPURLResponse,
//                  let data = data else { return }
//            print(httpResponse.statusCode)
//            let response = try! JSONDecoder().decode(LoginResponse.self, from: data)
//
//            DispatchQueue.main.async {
//                self.errorMessage = response.errorMessage
//                self.isLoggingIn = false
//                UserDefaults().setValue(response.success, forKey: Self.loggedInKey)
//                self.isLoggedIn = response.success
//            }
//        }
//        task.resume()
    }
}
