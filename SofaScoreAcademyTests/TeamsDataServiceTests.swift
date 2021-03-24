//
//  TeamsDataSourceMock.swift
//  SofaScoreAcademyTests
//
//  Created by Matija Kruljac on 24.03.2021..
//

import XCTest
@testable import SofaScoreAcademy

class TeamsDataServiceTests: XCTestCase {
    
    var sut: TeamsDataService!
    
    override func setUpWithError() throws {
        sut = TeamsDataService()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
}
