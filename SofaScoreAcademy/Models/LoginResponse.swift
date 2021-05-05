//
//  LoginResponse.swift
//  SofaScoreAcademy
//
//  Created by Kristian Vukušić on 05/05/2021.
//

import Foundation

struct LoginResponse: Decodable {

    let success: Bool
    let errorMessage: String?
}
