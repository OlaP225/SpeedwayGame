//
//  GameController.swift
//  SpeedwayGame
//
//  Created by Aleksandra Plichta on 11/11/2025.
//

import Foundation
import SwiftUI

@MainActor
class GameController: ObservableObject {
    @Published var players: [Player]
    
    init(players: [Player] = []){
        self.players = players
    }
    
    func onMove( from source: IndexSet, to destination: Int){
        players.move(fromOffsets: source, toOffset: destination)
    }
    
}
