//
//  GameControllerTests.swift
//  SpeedwayGameTests
//
//  Created by Aleksandra Plichta on 12/11/2025.
//

import XCTest
@testable import SpeedwayGame

@MainActor
final class GameControllerTests: XCTestCase {
    private var sut: GameController!
    
    override func setUp() {
        super.setUp()
        var players: [Player] =
        [
            Player(firstName: "Maciej", lastName: "J", imageName: "player1"),
            Player(firstName: "Bart", lastName: "K", imageName: "player2"),
            Player(firstName: "Daniel", lastName: "B", imageName: "player3"),
            Player(firstName: "Tai", lastName: "W", imageName: "player1")
        ]
        sut = GameController(players: players)
        
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_onMove() {
        //Arrange
        
        let source = IndexSet(integer: 0)
        let destination = sut.players.count
        
        //Act
        sut.onMove(from: source, to: destination)
        //Assert
        XCTAssertEqual(sut.players.map{$0.firstName}, ["Bart", "Daniel", "Tai", "Maciej"])
    }
    
}
