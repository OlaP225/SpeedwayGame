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
    @Published  var remainingTime: Int = 240
    private var timer: Timer?
    
    init(players: [Player] = []){
        self.players = players
    }
    
    func onMove( from source: IndexSet, to destination: Int){
        players.move(fromOffsets: source, toOffset: destination)
    }
    
    func startTimer() {
        guard timer == nil else {return}
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {[weak self] _ in
            guard let self else {return}
            
            
            Task { @MainActor in
                if (self.remainingTime > 0) {
                    self.remainingTime -= 1
                } else if (self.remainingTime == 0) {
                    self.stopTimer()
                }
            }
            
        }
    } // end startTimer()
    
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}
