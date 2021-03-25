//
//  SofaScoreAcademyTests.swift
//  SofaScoreAcademyTests
//
//  Created by Matija Kruljac on 24.03.2021..
//

import XCTest
@testable import SofaScoreAcademy

class TeamsViewModelTests: XCTestCase {
    
    var sut: TeamsViewModel!
    
    override func setUpWithError() throws {
        sut = TeamsViewModel(dataService: TeamsDataServiceMock())
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_getTeams() throws {
        XCTAssertTrue(sut.teams.isEmpty)
        XCTAssertNil(sut.teams.first)
        
        sut.getTeams()
        
        XCTAssertFalse(sut.teams.isEmpty)
        XCTAssertNotNil(sut.teams.first)
        XCTAssertLessThanOrEqual(sut.teams.first!.foreignPlayers, 5)
        XCTAssertGreaterThanOrEqual(sut.teams.first!.nationalTeamPlayers, 6)
        XCTAssertEqual(sut.teams.first!.name, "testName")
        XCTAssertEqual(sut.teams.first!.country, "CRO")
    }
}
